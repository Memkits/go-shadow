
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
    :pointer-events |none

def style-text $ {} (:pointer-events |none)

def shadow-component $ {} (:name :shadow)
  :update-state merge
  :get-state $ fn (value)
    {}
  :render $ fn (value)
    fn (state)
      [] :div
        {} $ :style (style-shadow value)
        [] :span $ {}
          :inner-text $ str value
          :style style-text
