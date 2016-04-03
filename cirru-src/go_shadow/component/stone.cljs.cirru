
ns go-shadow.component.stone $ :require
  [] hsl.core :refer $ [] hsl

defn style-stone (kind)
  {}
    :background-color $ if (== kind 0)
      hsl 0 0 0
      hsl 0 0 100
    :width |64px
    :height |64px
    :border-radius |50px

defn handle-click (position)
  fn (simple-event dispatch mutate)
    dispatch :retract position

def stone-component $ {} (:name :stone)
  :update-state merge
  :get-state $ fn (position kind)
    {}
  :render $ fn (position kind)
    fn (state)
      [] :div $ {}
        :style $ style-stone kind
        :on-click $ handle-click position
