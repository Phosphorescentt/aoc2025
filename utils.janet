(defmacro dbg [variable]
  ~(print (string/format "%p" ',variable) "=" (string/format "%p" ,variable)))
