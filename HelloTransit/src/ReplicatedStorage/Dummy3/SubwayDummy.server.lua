local rs = game:GetService("ReplicatedStorage")
local forbidden = rs:WaitForChild("Forbidden")
local ai = require(forbidden:WaitForChild("AI"))

local NPC = script.Parent
local humanoidRootPart = NPC:FindFirstChild("HumanoidRootPart")

local checkpoints = {
	game.Workspace.PathFindingTest.SubwayCheckpoint,
	game.Workspace.PathFindingTest:WaitForChild("Destination"),
	-- Add more checkpoints as needed
}

wait(1)

for _, checkpoint in ipairs(checkpoints) do

	-- Start pathfinding to the current checkpoint
	ai.SmartPathfind(NPC, checkpoint, true, {
		Visualize = true,
		Tracking = false,
		StandardPathfindSettings = {
			Costs = {
				Glass = 1,
				Basalt = 10,
				Plastic = 10,
				Neon = 10,
				DiamondPlate = 20,
				Concrete = 20,
				Metal = math.huge,
				Leather = math.huge
			}
		}
	})

	while humanoidRootPart and (humanoidRootPart.Position - checkpoint.Position).Magnitude > 10 do
		wait()
	end

	-- Optional: Actions to perform after reaching each checkpoint
	wait(0.5)
end
