(import ./utils)

(def f (file/open "inputs/01.txt"))
(def data (string/split "\n" (string/trim (file/read f :all))))

(var zeros 0)
(var position 50)
(each line data
  (def direction (string/from-bytes (get line 0)))
  (def number (int/to-number (int/s64 (string/slice line 1))))
  (match direction
    "L" (set position (- position number))
    "R" (set position (+ position number)))

  (set position (mod position 100))
  (if (= position 0) (++ zeros)))

(print zeros)
