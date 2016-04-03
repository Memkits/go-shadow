
ns go-shadow.component.board $ :require
  [] hsl.core :refer $ [] hsl
  [] clojure.string :as string
  [] go-shadow.component.cell :refer $ [] cell-component
  [] go-shadow.config :as config

def style-board $ {}
  :width $ str (* config/size config/unit)
    , |px
  :height $ str (* config/size config/unit)
    , |px
  :position |relative
  :background-color $ hsl 44 50 60

def style-header $ {} (:height |40px)

defn style-picker (black?)
  {} (:width |32px)
    :height |32px
    :background-color $ if black?
      hsl 0 0 0
      hsl 0 0 100
    :border-radius |50%
    :box-shadow $ str "|0px 0px 4px "
      hsl 0 0 0 0.3

def board-component $ {} (:name :board)
  :update-state merge
  :get-state $ fn (size)
    {}
  :render $ fn (board)
    fn (state)
      let
        (black? $ ->> board (filter $ fn (entry) (:picked? $ val entry)) (count) (even?))

        [] :div ({})
          [] :div
            {} $ :style style-header
            [] :div $ {}
              :style $ style-picker black?

          [] :div
            {} $ :style style-board
            ->> board
              map $ fn (entry)
                []
                  str $ string/join |- (key entry)
                  [] cell-component (key entry)
                    val entry
                    , black?

              into $ sorted-map
