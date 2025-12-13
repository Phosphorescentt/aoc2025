(import ./utils)

(def f (file/open "inputs/06_test.txt"))
(def data 
  (map
    (fn [s]
      (filter
        (fn [v] (not (empty? v)))
        (string/split " " s)))
    (string/split "\n" (string/trim (file/read f :all)))))

(def transposed (utils/transpose data))

(print
  (sum
    (map
      (fn [vs] 
        (def instruction
          (match (array/pop vs)
            "*" *
            "+" +))
        (reduce2 instruction (map scan-number vs)))
      transposed)))
