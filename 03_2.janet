(import ./utils)

(def f (file/open "inputs/03.txt"))
(def data (string/split "\n" (string/trim (file/read f :all))))

(defn largest-joltage-rec [ns no-to-toggle]
  # base case
  (if (= no-to-toggle 1) (break (max-of ns)))

  (def max-lookfoward-ind (- (length ns) no-to-toggle -1)) # -1 adjust for non-inclusive end
  (def current-max (max-of (array/slice ns 0 max-lookfoward-ind)))
  (def new-ns (array/slice ns (inc (index-of current-max ns))))

  (def sub-joltage (largest-joltage-rec new-ns (dec no-to-toggle)))
  (array/concat @[current-max] sub-joltage))

(defn largest-joltage [s] 
  (utils/num-from-string
    (string
      ;(largest-joltage-rec
        (utils/string-to-num-list s) 12))))

(pp (sum (map largest-joltage data)))
