(defmacro dbg [variable]
  ~(print (string/format "%p" ',variable) "=" ,variable))
