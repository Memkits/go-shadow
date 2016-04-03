
ns go-shadow.updater.core

defn use-pick (store op-data)
  let
    (position $ first op-data)
      black? $ get op-data 1
    assoc store position $ {} (:picked? true)
      :value $ if black? 0 1

defn use-retract (store position)
  assoc store position $ {} (:picked false)
    :value 0

defn updater (old-store op op-data)
  case op
    :pick $ use-pick old-store op-data
    :retract $ use-retract old-store op-data
    , old-store
