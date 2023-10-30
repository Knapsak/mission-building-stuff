SPAWN:SpawnFromUnit(HostUnit, MinHeight, MaxHeight, SpawnIndex)


local SpawnStatic = STATIC:FindByName( StaticName )

  -- Spawn from the static position at the height specified in the ME of the group template!
  SpawnAirplanes:SpawnFromUnit( SpawnStatic )

  -- Spawn from the static position at the height randomized between 2000 and 4000 meters.
  SpawnAirplanes:SpawnFromUnit( SpawnStatic, 2000, 4000 )
