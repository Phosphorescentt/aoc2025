(defmacro dbg [variable]
  ~(print (string/format "%P" ',variable) "=" (string/format "%P" ,variable)))

(defmacro dbg-oneline [variable]
  ~(print (string/format "%N" ',variable) "=" (string/format "%N" ,variable)))

(defn get-char [s i]
  (string/slice s i (inc i)))

(defn num-from-string [s]
  (int/to-number (int/s64 s)))

(defn string-to-num-list [s]
  (map (fn [b] (num-from-string (string/from-bytes b))) s))

(defn enumerate [iter]
  (coro
    (loop [i :range [0 (length iter)]]
      (yield [i (get iter i)]))))

(defn transpose [arr]
  (def width (length arr))
  (def height (length (arr 0)))

  (def out
    (map
      (fn [_] (array/new-filled width nil))
      (range 0 height)))

  (each [i row] (enumerate arr)
    (each [j col] (enumerate row)
      (set ((out j) i) col)))

  out)

(defn zip [arr1 arr2]
  (def max-i (max (length arr1) (length arr2)))
  (coro
    (loop [i :range [0 max-i]]
      (yield @[(get arr1 i) (get arr2 i)]))))
