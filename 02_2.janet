(import ./utils)

(def f (file/open "inputs/02.txt"))
(def data 
  (map (fn [x] (string/split "-" x))
       (string/split "," (string/trim (file/read f :all)))))

(defn invalid? [n]
  "Check if a string is invalid"
  (var found false)
  (loop [end-point :range-to [1 (div (length n) 2)]]
    (def cand (string/slice n 0 end-point)) # pick a substring
    (def cand-expanded
      (string/repeat # repeat cand as many times as needed to match length of
        cand         # the original string
        (div (length n) (length cand))))

    (if
      (= n cand-expanded)
      ((set found true) (break))))
  found)

(var invalid-ids @[])
(each [l r] data
  (loop [x :range-to [(int/to-number (int/s64 l)) (int/to-number (int/s64 r))]]
    (if (invalid? (string x)) (array/push invalid-ids x))))

(print (sum invalid-ids))
