(import ./utils)

(def f (file/open "inputs/06.txt"))
(def data 
  (string/split "\n" (string/trim (file/read f :all))))
(def instructions (array/pop data))

# parse the data into the correct format, preserving whitespace
(def parsed-data @[])
(var last-start 0)
(each [i char] (utils/enumerate instructions)
  (def parsed-sum @[])
  (if
    (and (>= char 33) (not= 0 i))
    (do 
      (each row data
        (array/push parsed-sum (string/slice row last-start (dec i))))
      (set last-start i)
      (array/push parsed-data parsed-sum))))

# get the numbers from the list of strings representing the columns
# this implements the right to left logic
(defn get-numbers [ss]
  (def max-l (max ;(map length ss)))
  (map 
    (fn [i]
      (def numbers
        (filter
          (fn [x]
            (not= 32 x)) # 32 = ascii space
          (map
            (fn [s] (get s i))
            ss)))

      (def n (scan-number (string ;(map (fn [b] (string/format "%c" b)) numbers))))
      n)
    (range 0 max-l)))

# get a clean list of instructions
(def parsed-instructions 
  (filter (fn [c] (not (empty? c))) (string/split " " instructions)))

# final result
(print
  (sum
    (map
      (fn [[instruction numbers]] 
        (def instruction
          (match instruction
            "*" *
            "+" +))
        (reduce2
          instruction
          (if numbers (get-numbers numbers) @[0]))) # edge case to handle the zip
      (utils/zip parsed-instructions parsed-data))))
