(import ./utils)

(def f (file/open "inputs/02.txt"))
(def data 
  (map (fn [x] (string/split "-" x))
  (string/split "," (string/trim (file/read f :all)))))

(defn invalid? [n]
  "Check if a string is invalid"
  (if (= (mod (length n) 2) 1) (break false)) # if non-even length then break
  (= # return the result of comparing the first and second half of the string
    (string/slice n 0 (div (length n) 2))
    (string/slice n (div (length n) 2))))

(var invalid-ids @[])
(each [l r] data
  (loop [x :range-to [(int/to-number (int/s64 l)) (int/to-number (int/s64 r))]]
    (if (invalid? (string x)) (array/push invalid-ids x))))

(print (sum invalid-ids))
