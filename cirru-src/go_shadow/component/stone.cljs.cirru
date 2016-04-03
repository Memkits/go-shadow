
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
    :pointer-events |none

def stone-component $ {} (:name :stone)
  :update-state merge
  :get-state $ fn (kind)
    {}
  :render $ fn (kind)
    fn (state)
      [] :div $ {}
        :style $ style-stone kind
