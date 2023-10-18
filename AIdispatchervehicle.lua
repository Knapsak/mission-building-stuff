---An AI dispatcher object for a vehicle squadron, moving infantry from pickup zones to deploy zones.
   local SetCargoInfantry = SET_CARGO:New():FilterTypes( "Infantry" ):FilterStart()
   local SetAPC = SET_GROUP:New():FilterPrefixes( "APC" ):FilterStart()
   local SetDeployZones = SET_ZONE:New():FilterPrefixes( "Deploy" ):FilterStart()

   AICargoDispatcherAPC = AI_CARGO_DISPATCHER_APC:New( SetAPC, SetCargoInfantry, nil, SetDeployZones ) 
   AICargoDispatcherAPC:Start()
