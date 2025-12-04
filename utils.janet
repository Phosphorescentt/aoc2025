(defmacro dbg [variable]
  ~(print (string/format "%P" ',variable) "=" (string/format "%P" ,variable)))

(defmacro dbg-oneline [variable]
  ~(print (string/format "%N" ',variable) "=" (string/format "%N" ,variable)))

(defn string-from-byte [b]
  (string/from-bytes b))

(defn get-char [s i]
  (string/slice s i (inc i)))

(defn num-from-string [s]
  (int/to-number (int/s64 s)))

(defn string-to-num-list [s]
  (map (fn [b] (num-from-string (string-from-byte b))) s))
