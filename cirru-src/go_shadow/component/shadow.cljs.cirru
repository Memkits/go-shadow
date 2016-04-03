
ns go-shadow.component.shadow $ :require
  [] hsl.core :refer $ [] hsl

defn style-shadow (value)
  let
    (unit $ + 24 (* (.abs js/Math value) (, 24)))

    {}
      :background-color $ hsl 0 0
        + 50 $ * value 50
      :font-size |8px
      :display |flex
      :justify-content |center
      :align-items |center
      :width $ str unit |px
      :height $ str unit |px
      :pointer-events |none
      :font-family |menlo
      :color $ hsl 0 0 100
      :text-shadow $ str "|0 0 2px "
        hsl 0 0 0 0.6

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
