local rs = game:GetService("ReplicatedStorage")
local forbidden = rs:WaitForChild("Forbidden")
local ai = require(forbidden:WaitForChild("AI"))

local NPC = script.Parent
local target = game.Workspace.PathFindingTest:WaitForChild("NotDestination")

wait(1)

local dummy = script.Parent
local humanoid = dummy:FindFirstChild("Humanoid")

if humanoid then
	local animator = humanoid:FindFirstChild("Animator")
	if not animator then
		animator = Instance.new("Animator", humanoid)
	end

	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://9912090652"
	local animationTrack = animator:LoadAnimation(animation)

	animationTrack.Looped = true
	animationTrack:Play()
end



--[[
-- Function to find the nearest Skytrain station to a given position
local function findNearestStation(position)
	local SkytrainStations = {}

	-- Gather all the Skytrain stations
	for _, station in ipairs(workspace.PathFindingTest.SkytrainStationCheckpoints:GetChildren()) do
		if station:IsA("Part") and station.Name == "SkytrainStation" then
			table.insert(SkytrainStations, station)
		end
	end

	local nearestStation = nil
	local shortestDistance = math.huge

	-- Find the nearest station to the given position
	for _, station in ipairs(SkytrainStations) do
		local distance = (station.Position - position).Magnitude
		if distance < shortestDistance then
			shortestDistance = distance
			nearestStation = station
		end
	end

	return nearestStation
end

-- 1. Go to the nearest station from the NPC's current position
local firstStation = findNearestStation(NPC.HumanoidRootPart.Position)
if firstStation then
	ai.SmartPathfind(NPC, firstStation, true, {Visualize = true, Tracking = false, StandardPathfindSettings = {
		Costs = {
			Concrete = 1,
			DiamondPlate = 2,
			Basalt = 10,
			Plastic = 10,
			Glass = math.huge,
			Metal = math.huge,
			Leather = math.huge,
			Woodplanks = math.huge
		}
	}})

	-- Wait until the NPC reaches the first station
	while NPC:FindFirstChild("HumanoidRootPart") and (NPC.HumanoidRootPart.Position - firstStation.Position).Magnitude > 10 do
		wait()
	end
end

-- 2. Go to the nearest station to the destination
local secondStation = findNearestStation(target.Position)
if secondStation then
	ai.SmartPathfind(NPC, secondStation, true, {Visualize = true, Tracking = false, StandardPathfindSettings = {
		Costs = {
			Concrete = 1,
			DiamondPlate = 2,
			Basalt = 10,
			Plastic = 10,
			Glass = math.huge,
			Metal = math.huge,
			Leather = math.huge,
			Woodplanks = math.huge
		}
	}})

	-- Wait until the NPC reaches the second station
	while NPC:FindFirstChild("HumanoidRootPart") and (NPC.HumanoidRootPart.Position - secondStation.Position).Magnitude > 10 do
		wait()
	end
end

-- 3. Finally, go to the final destination
ai.SmartPathfind(NPC, target, true, {Visualize = true, Tracking = false, StandardPathfindSettings = {
	Costs = {
		Concrete = 20,
		DiamondPlate = 10,
		Basalt = 1,
		Plastic = 5,
		Glass = math.huge,
		Metal = math.huge,
		Leather = math.huge,
		Woodplanks = math.huge
	}
}})

]]--