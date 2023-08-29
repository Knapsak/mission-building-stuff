-- This test mission demonstrates the BEACON class.
-- The goal is to activate 2 types of beacons : 1 TACAN beacon attach to an aircraft, and 1 generic radio beacon attach to a ground UNIT

-- The player aircraft needs to be ASM and TACAN compatible. Please replace the M2000C by an aircraft you own and can receive TACAN signals

-- Activates the trace to see what BEACON does in the log
--BASE:TraceClass("BEACON")
BASE:TraceLevel(3)

-- Create our UNITs on which we'll attach a BEACON
local Aircraft = UNIT:FindByName("AFAC SA342 1", "AFAC SA342 2", "AFAC SA342 3", "AFAC SA342 4", "AFAC SA342 5" )
--local Aircraft = UNIT:FindByName("AFAC SA342 2")
--local Aircraft = UNIT:FindByName("AFAC SA342 3")
--local Aircraft = UNIT:FindByName("AFAC SA342 4")
--local Aircraft = UNIT:FindByName("AFAC SA342 5") 
local LandUnit = UNIT:FindByName("TACAN 10X", "TACAN 11X", "TACAN 12X")
--local LandUnit = UNIT:FindByName("TACAN 11X")
--local LandUnit = UNIT:FindByName("TACAN 12X")

-- Now, let's start with the TACAN Beacon.
-- Note that they are limited to Y band. Notice also that this particular TACAN can be homed on.
local BeaconAircraft = Aircraft:GetBeacon()
BeaconAircraft:AATACAN(5, "AFAC SA342 1", true)
BeaconAircraft:AATACAN(6, "AFAC SA342 2", true)
BeaconAircraft:AATACAN(7, "AFAC SA342 3", true)
BeaconAircraft:AATACAN(8, "AFAC SA342 4", true)
BeaconAircraft:AATACAN(9, "AFAC SA342 5", true)


-- And let's setup the ground based radio beacon !
-- Notice how this beacon will stop in 20 sec (last parameter).
local BeaconLand = LandUnit:GetBeacon()
BeaconLand:RadioBeacon("Morse.ogg", 129.1, radio.modulation.AM, 100, 3600)
BeaconLand:RadioBeacon("Morse.ogg", 129.2, radio.modulation.AM, 100, 3600)
BeaconLand:RadioBeacon("Morse.ogg", 129.3, radio.modulation.AM, 100, 3600)
