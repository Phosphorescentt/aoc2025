(import ./utils)

(def f (file/open "inputs/04.txt"))
(def data (string/split "\n" (string/trim (file/read f :all))))

# looks confusing - literally just makes a 2d array
(def data2 (map (fn [x] (map (fn [y] (string/from-bytes y)) x)) data))

(def directions [[-1  1] [0  1] [1  1]
                 [-1  0]        [1  0]
                 [-1 -1] [0 -1] [1 -1]])

(defn get-neighbour [data pos dir]
  (def row (get data (+ (pos :x) (dir 0))))
  (if row () 0)
  (def col (get row (+ (pos :y) (dir 1))))
  (if col () 0)
  (if (= col "@") 1 0))

(var no-accessible 0)
(each [i row] (utils/enumerate data2)
  (each [j column] (utils/enumerate row)
    (if (= column "@")
      (do
        (def neighbours
          (map
            (fn [dir] (get-neighbour data2 {:x i :y j} dir)) # currying
            directions))
        (if (< (sum neighbours) 4) (++ no-accessible))))))

(print no-accessible)
