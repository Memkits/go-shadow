
ns go-shadow.updater.analyse

defn value-at (board position)
  let
    (detail $ get board position)
    if (some? detail)
      if (:picked? detail)
        if
          = (:value detail)
            , 1
          , 1 -1

        , 0

      , nil

def neighbours $ [] ([] 0 1)
  [] 0 -1
  [] 1 0
  [] -1 0

def far-neighbours $ [] ([] -1 -1)
  [] 1 1
  [] 1 -1
  [] -1 1

defn position-add (a b)
  []
    + (first a)
      first b
    + (last a)
      last b

defn compute-shadow-detail (position board)
  let
    (value-list $ ->> neighbours (map $ fn (pos) (value-at board $ position-add position pos)) (into $ []) (sort))
      far-value-list $ ->> far-neighbours
        map $ fn (pos)
          value-at board $ position-add position pos
        into $ []
        sort

      defined-list $ filter some? value-list
      near-value $ / (apply + defined-list)
        count defined-list

    .toFixed near-value 2

defn analyse-shadow (board)
  ->> board
    map $ fn (entry)
      let
        (position $ key entry)
          detail $ val entry
          picked? $ :picked? detail
          value $ :value detail
        [] position $ if picked? detail
          {} (:picked? false)
            :value $ compute-shadow-detail position board

    into $ sorted-map
