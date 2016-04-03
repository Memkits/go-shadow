
ns go-shadow.component.cell $ :require
  [] hsl.core :refer $ [] hsl
  [] go-shadow.config :as config
  [] go-shadow.component.stone :refer $ [] stone-component
  [] go-shadow.component.shadow :refer $ [] shadow-component

defn style-cell (position stage)
  {} (:position |absolute)
    :top $ str
      * (first position)
        , config/unit
      , |px

    :left $ str
      * (last position)
        , config/unit
      , |px

    :height $ str config/unit |px
    :width $ str config/unit |px
    :display |flex
    :justify-content |center
    :align-items |center
    :background-color $ hsl 0 0 0 0
    :cursor $ if (:picked? stage)
      , |default |pointer

def cell-component $ {} (:name :cell)
  :update-state merge
  :get-state $ fn (position stage black?)
    {}
  :render $ fn (position stage black?)
    fn (state)
      [] :div
        {} $ :style (style-cell position stage)
        if (:picked? stage)
          [] stone-component position $ :value stage
          [] shadow-component position (:value stage)
            , black?
