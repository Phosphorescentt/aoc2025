(import ./utils)

(def f (file/open "inputs/03.txt"))
(def data (string/split "\n" (string/trim (file/read f :all))))

(defn largest-joltage [n]
  (var largest 0)
  (loop [i :range [0 (- (length n) 1)]]
    (loop [j :range [(+ i 1) (length n)]]
      (def cand (utils/num-from-string (string
                                         (utils/get-char n i)
                                         (utils/get-char n j))))
      (if (> cand largest) (set largest cand))))
  largest)

(print (sum (map largest-joltage data)))
