
ns go-shadow.component.container $ :require
  [] hsl.core :refer $ [] hsl
  [] go-shadow.component.board :refer $ [] board-component
  [] go-shadow.config :as config

def style-container $ {} (:display |flex)
  :justify-content |center
  :align-items |center
  :position |absolute
  :width |100%
  :height |100%

def container-component $ {} (:name :container)
  :get-state $ fn (store)
    {}
  :update-state merge
  :render $ fn (store)
    fn (state)
      [] :div
        {} $ :style style-container
        [] board-component (:board store)
          :white? store
