  -- Create downed "Pilot Wagner" in #ZONE "CSAR_Start_1" at a random point for the blue coalition
   my_csar:SpawnCSARAtZone( "CSAR_Start_1", coalition.side.BLUE, "Pilot Wagner", true )

 --Create a casualty and CASEVAC request from a "Point" (VEC2) for the blue coalition --shagrat
 my_csar:SpawnCASEVAC(Point, coalition.side.BLUE)  
