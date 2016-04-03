
ns go-shadow.component.shadow $ :require
  [] hsl.core :refer $ [] hsl

defn style-shadow (value)
  {}
    :background-color $ hsl 0 0 80
    :font-size |12px
    :display |flex
    :justify-content |center
    :align-items |center
    :width |32px
    :height |32px

def style-text $ {} (:pointer-events |none)

defn handle-click (position black?)
  fn (simple-event dispatch mutate)
    dispatch :pick $ [] position black?

def shadow-component $ {} (:name :shadow)
  :update-state merge
  :get-state $ fn (position value black?)
    {}
  :render $ fn (position value black?)
    fn (state)
      [] :div
        {}
          :style $ style-shadow value
          :on-click $ handle-click position black?
        [] :span $ {}
          :inner-text $ str value
          :style style-text
