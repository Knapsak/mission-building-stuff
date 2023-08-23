function start_A2GDispatcherRed1()

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
A2GDispatcherRed1 = AI_A2G_DISPATCHER:New( Detection )

-- The Command Center (HQ) is the defense point and will also handle the communication to the coalition.
local HQ_Group1 = GROUP:FindByName( "Red Command-1" )
local HQ_CC1 = COMMANDCENTER:New( HQ_Group1, "Red Command-1" )

-- The HQ is the defense point, so this point will be defended.
A2GDispatcherRed1:AddDefenseCoordinate( "Red Command-1", HQ_Group1:GetCoordinate() )
A2GDispatcherRed1:SetDefenseReactivityHigh() -- High defense reactivity. So far proximity of a threat will trigger a defense action.
A2GDispatcherRed1:SetDefenseRadius( 10000 ) -- Defense radius wide enough to also trigger defenses far away.

-- Communication to the players within the coalition. The HQ services the communication of the defense actions.
A2GDispatcherRed1:SetCommandCenter( HQ_CC1 )

-- Show a tactical display.
A2GDispatcherRed1:SetTacticalDisplay( true )
-- Setup the squadrons.

A2GDispatcherRed1:SetSquadron( "BASE1 CAS", "BASE1", { "Turkey SA342" }, 2 )
A2GDispatcherRed1:SetSquadronCas( "BASE1 CAS", 200, 250, 300, 500, "RADIO" )
A2GDispatcherRed1:SetSquadronTakeoffFromRunway( "BASE1 CAS" )
A2GDispatcherRed1:SetSquadronOverhead( "BASE1 CAS", 0.25 )

A2GDispatcherRed1:SetSquadron( "BASE4 BAI", "BASE4", { "Turkey UH-1H Ercan 8-3 Armed" }, 2 )
A2GDispatcherRed1:SetSquadronBai( "BASE4 BAI", 200, 250, 300, 500, "RADIO" )
A2GDispatcherRed1:SetSquadronTakeoffFromRunway( "BASE4 BAI" )
A2GDispatcherRed1:SetSquadronOverhead( "BASE4 BAI", 0.25 )

A2GDispatcherRed1:SetSquadron( "Gecitkale", AIRBASE.Syria.Gecitkale, { "Turkey F-4E CAS-1", "Turkey F-5E BAI-1" }, 4 )
A2GDispatcherRed1:SetSquadronBai( "Gecitkale", 600, 800, 2000, 2000, "RADIO" )
A2GDispatcherRed1:SetSquadronTakeoffFromParkingHot( "Gecitkale" )
A2GDispatcherRed1:SetSquadronOverhead( "Gecitkale", 0.2 )

A2GDispatcherRed1:SetSquadron( "Incirlik", AIRBASE.Syria.Incirlik, { "Turkey F-4E CAS", "Turkey F-5E BAI" }, 10 )
A2GDispatcherRed1:SetSquadronSead( "Incirlik", 600, 800, 2000, 2000, "RADIO" )
A2GDispatcherRed1:SetSquadronTakeoffFromParkingHot( "Incirlik" )
A2GDispatcherRed1:SetSquadronOverhead( "Incirlik", 0.2 )


-- We set for each squadron a takeoff interval, as each helicopter will launch from a FARP.
-- This to prevent helicopters to clutter.
-- Each helicopter group is taking off the FARP in hot start.
A2GDispatcherRed1:SetSquadronTakeoffInterval( "Gecitkale", 10 )
A2GDispatcherRed1:SetSquadronTakeoffInterval( "Incirlik", 10 )
A2GDispatcherRed1:SetSquadronTakeoffInterval( "BASE1 CAS", 60 )
A2GDispatcherRed1:SetSquadronTakeoffInterval( "BASE4 BAI", 60 )

end

start_A2GDispatcherRed1()

