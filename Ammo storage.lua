

local Goulet=AIRBASE:FindByName("Goulet")
local storage=Goulet:GetStorage()

--storage=STORAGE:FindByName("Goulet")
storage:AddLiquid(STORAGE.Liquid.JETFUEL, 10000)
storage:AddItem("weapons.missiles.Ataka_9M120", 20)
storage:AddItem("weapons.missiles.AGM_114K", 20)
storage:AddItem("weapons.nurs.C_8", 20)
storage:AddItem("weapons.nurs.HYDRA_70_M151", 20)

