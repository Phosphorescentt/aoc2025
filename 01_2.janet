(import ./utils)

(def f (file/open "inputs/01.txt"))
(def data (string/split "\n" (string/trim (file/read f :all))))

(var zeros 0)
(var position 50)
(each line data
  (def direction (if (= (string/from-bytes (get line 0)) "L") -1 1))
  (def number (int/to-number (int/s64 (string/slice line 1))))
  (def distance (mod (* (* -1 direction) position) 100))

  (+= zeros (math/abs (div (- distance number) 100)))
  (set position (mod (+= position (* direction number)) 100))

(print zeros)
