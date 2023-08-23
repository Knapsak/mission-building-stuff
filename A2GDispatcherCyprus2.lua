function start_A2GDispatcherRed2()

--- Detect and attack a set of enemy units.
-- Name: AID-A2G-001 - Detection and Attack Helicopters
-- Author: FlightControl
-- Date Created: 02 Nov 2018

-- Define a SET_GROUP object that builds a collection of groups that define the recce network.
-- Here we build the network with all the groups that have a name starting with CCCP Recce.
local DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "Turkey" } )
DetectionSetGroup:FilterStart()

local Detection = DETECTION_AREAS:New( DetectionSetGroup, 5000 )

-- Setup the A2A dispatcher, and initialize it.
A2GDispatcherRed2 = AI_A2G_DISPATCHER:New( Detection )

-- The Command Center (HQ) is the defense point and will also handle the communication to the coalition.
local HQ_Group2 = GROUP:FindByName( "Red Command-2" )
local HQ_CC2 = COMMANDCENTER:New( HQ_Group1, "Red Command-2" )

-- The HQ is the defense point, so this point will be defended.
A2GDispatcherRed2:AddDefenseCoordinate( "Red Command-2", HQ_Group2:GetCoordinate() )
A2GDispatcherRed2:SetDefenseReactivityHigh() -- High defense reactivity. So far proximity of a threat will trigger a defense action.
A2GDispatcherRed2:SetDefenseRadius( 10000 ) -- Defense radius wide enough to also trigger defenses far away.

-- Communication to the players within the coalition. The HQ services the communication of the defense actions.
A2GDispatcherRed2:SetCommandCenter( HQ_CC2 )

-- Show a tactical display.
A2GDispatcherRed2:SetTacticalDisplay( true )
-- Setup the squadrons.

A2GDispatcherRed2:SetSquadron( "BASE2 CAS", "BASE2", { "Turkey SA342-1" }, 2 )
A2GDispatcherRed2:SetSquadronCas1( "BASE1 CAS", 200, 250, 300, 500, "RADIO" )
A2GDispatcherRed2:SetSquadronTakeoffFromParkingHot( "BASE1 CAS" )
A2GDispatcherRed2:SetSquadronOverhead( "BASE1 CAS", 0.25 )

A2GDispatcherRed2:SetSquadron( "BASE3 BAI", "BASE3", { "Turkey UH-1H Ercan 8-3 Armed-1" }, 2 )
A2GDispatcherRed2:SetSquadronBai1( "BASE3 BAI", 200, 250, 300, 500, "RADIO" )
A2GDispatcherRed2:SetSquadronTakeoffFromParkingHot( "BASE3 BAI" )
A2GDispatcherRed2:SetSquadronOverhead( "BASE3 BAI", 0.25 )

A2GDispatcherRed2:SetSquadron( "Gecitkale", AIRBASE.Syria.Gecitkale, { "Turkey F-4E CAS-1", "Turkey F-5E BAI-1" }, 4 )
A2GDispatcherRed2:SetSquadronSetSquadronBai1( "Gecitkale", 600, 800, 2000, 2000, "RADIO" )
A2GDispatcherRed2:SetSquadronTakeoffFromParkingHot( "Gecitkale" )
A2GDispatcherRed2:SetSquadronOverhead( "Gecitkale", 0.2 )

A2GDispatcherRed2:SetSquadron( "Incirlik", AIRBASE.Syria.Incirlik, { "Turkey F-4E CAS", "Turkey F-5E BAI" }, 10 )
A2GDispatcherRed2:SetSquadronSead2( "Incirlik", 600, 800, 2000, 2000, "RADIO" )
A2GDispatcherRed2:SetSquadronTakeoffFromParkingHot( "Incirlik" )
A2GDispatcherRed2:SetSquadronOverhead( "Incirlik", 0.2 )


-- We set for each squadron a takeoff interval, as each helicopter will launch from a FARP.
-- This to prevent helicopters to clutter.
-- Each helicopter group is taking off the FARP in hot start.
A2GDispatcherRed2:SetSquadronTakeoffInterval( "Gecitkale", 10 )
A2GDispatcherRed2:SetSquadronTakeoffInterval( "Incirlik", 10 )
A2GDispatcherRed2:SetSquadronTakeoffInterval( "BASE2 CAS", 60 )
A2GDispatcherRed2:SetSquadronTakeoffInterval( "BASE3 BAI", 60 )

end

start_A2GDispatcherRed2()
