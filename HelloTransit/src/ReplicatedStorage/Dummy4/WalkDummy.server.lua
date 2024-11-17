local rs = game:GetService("ReplicatedStorage")

local forbidden = rs:WaitForChild("Forbidden")
local ai = require(forbidden:WaitForChild("AI"))

local NPC = script.Parent
local target = game.Workspace.PathFindingTest:WaitForChild("Destination")

ai.SmartPathfind(NPC,target,true,{Visualize = true, Tracking = false, StandardPathfindSettings = {
	Costs = {
		Basalt = 1,
		Plastic = 2,
		Neon = 1,
		Concrete = 10,
		DiamondPlate = 10,
		Leather = math.huge,
		Glass = math.huge,
		Metal = math.huge
	}
}})