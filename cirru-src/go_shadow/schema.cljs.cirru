
ns go-shadow.schema $ :require
  [] clojure.string :as string

defn make-board (n)
  ->> n range
    map $ fn (x)
      ->> n range $ map
        fn (y)
          [] x y

    apply concat
    map $ fn (x)
      [] x $ {} (:picked? false)
        :value 0

    into $ sorted-map
