
ns go-shadow.updater.core $ :require
  [] go-shadow.updater.analyse :refer $ [] analyse-shadow

defn use-pick (store op-data)
  let
    (position $ first op-data)
      black? $ get op-data 1
    -> store
      assoc-in ([] :board position)
        {} (:picked? true)
          :value $ if black? 0 1

      update :white? not

defn use-retract (store position)
  -> store $ assoc-in ([] :board position)
    {} (:picked false)
      :value 0

defn use-switch (store op-data)
  update store :white? not

defn updater (old-store op op-data)
  update
    case op
      :pick $ use-pick old-store op-data
      :retract $ use-retract old-store op-data
      :switch $ use-switch old-store op-data
      , old-store
    , :board analyse-shadow
