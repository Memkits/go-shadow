
ns go-shadow.core $ :require
  [] hsl.core :refer $ [] hsl
  [] respo.renderer.expander :refer $ [] render-app
  [] respo.controller.deliver :refer $ [] build-deliver-event
  [] respo.renderer.differ :refer $ [] find-element-diffs
  [] respo.util.format :refer $ [] purify-element
  [] respo-client.controller.client :refer $ [] initialize-instance activate-instance patch-instance
  [] go-shadow.component.container :refer $ [] container-component
  [] devtools.core :as devtools
  [] go-shadow.schema :refer $ [] make-board
  [] go-shadow.config :as config
  [] go-shadow.updater.core :refer $ [] updater

defonce global-store $ atom
  {} (:white? false)
    :board $ make-board config/size

defonce global-states $ atom ({})

defonce global-element $ atom nil

defn render-element ()
  .info js/console |rendering: @global-store @global-states
  render-app ([] container-component @global-store)
    , @global-states

defn dispatch (op op-data)
  .log js/console |dispatch: op op-data
  let
    (new-store $ updater @global-store op op-data)
    reset! global-store new-store
    .info js/console new-store

defn get-root ()
  .querySelector js/document |#app

declare rerender-app

defn get-deliver-event ()
  build-deliver-event global-element dispatch global-states

defn mount-app ()
  let
    (element $ render-element)
    initialize-instance (get-root)
      get-deliver-event
    activate-instance element (get-root)
      get-deliver-event
    reset! global-element element

defn rerender-app ()
  let
    (element $ render-element)
      changes $ find-element-diffs ([])
        []
        purify-element @global-element
        purify-element element

    .info js.console |Changes: changes
    patch-instance changes (get-root)
      get-deliver-event
    reset! global-element element

defn -main ()
  devtools/enable-feature! :sanity-hints :dirac
  devtools/install!
  println |Loaded
  mount-app
  add-watch global-store :rerender rerender-app
  add-watch global-states :rerender rerender-app

defn on-jsload ()
  println |Reload~ $ [] 1 2 ([] 3 4)
  rerender-app

set! (.-onload js/window)
  , -main
