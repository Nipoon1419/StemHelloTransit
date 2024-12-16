
-- Declare variables
local Dummy1 = game.ReplicatedStorage.Dummy1
local Dummy2 = game.ReplicatedStorage.Dummy2
local Dummy3 = game.ReplicatedStorage.Dummy3
local Dummy4 = game.ReplicatedStorage.Dummy4

local Waypoints = game.ReplicatedStorage.Waypoints
local FareTriggers = game.Workspace.City.FareTrigger:GetChildren()

local Values = game.ReplicatedStorage:WaitForChild("Values")
local SearchValues = game.ReplicatedStorage:WaitForChild("SearchValues")

local SpawnValue = SearchValues.Location
local DestinationValue = SearchValues.Destination

-- Hey, future me, you might need WaitForChild for these if you get errors.
local Bus = game.ReplicatedStorage.Values.Bus
local SkyTrain = game.ReplicatedStorage.Values.Skytrain
local Subway = game.ReplicatedStorage.Values.Subway
local Walk = game.ReplicatedStorage.Values.Walk


-- Parameterized dummy cloning function
function Cloning(dummy, spawn, transport, searchvalue)
	local ClonedDummy = dummy:Clone()
	
	ClonedDummy.Parent = game.Workspace
	ClonedDummy:PivotTo(spawn.CFrame)

	-- Set the timer
	searchvalue.Value = true
	transport.Time.Value = 0
	transport.Fare.Value = 0
	transport.Distance.Value = 0
	
	-- Debounce
	local debounce = {}

	-- Fare system
	for _, triggerPart in pairs(FareTriggers) do
		triggerPart.Touched:Connect(function(hit)
			if hit.Parent == ClonedDummy and not debounce[triggerPart] then
				debounce[triggerPart] = true -- Enable debounce

				-- Apply different fare rates based on the trigger name
				if triggerPart.Name == "BTSGreen" then
					transport.Fare.Value = transport.Fare.Value + 20
					
				elseif triggerPart.Name == "BTSDarkGreen" then
					transport.Fare.Value = transport.Fare.Value + 25
					
				elseif triggerPart.Name == "MRTBlue" then
					transport.Fare.Value = transport.Fare.Value + 30
					
				end

				-- Reset debounce
				wait(2)
				debounce[triggerPart] = false
			end
		end)
	end
	
	coroutine.wrap(function()
		while searchvalue.Value do
			transport.Time.Value = transport.Time.Value + 1
			transport.Distance.Value = transport.Time.Value * 50
			print(transport.Time.Value)
			wait(1)
			
			-- Extra time taken if walk
			while transport.Name == "Walk" and searchvalue.Value do
				transport.Time.Value = transport.Time.Value + 2
				transport.Distance.Value = transport.Time.Value * 25
				wait(1)
			end
		end
	end)()
end

-- Declaring cloning parameters
function SetSpawn(locationName)
	
	
	-- Set variable for part with the same chosen name
	local SpawnLocation = game.Workspace.LandmarkLocations:FindFirstChild(locationName)
	
	-- Settings for each dummy
	if SpawnLocation then
		
		Cloning(Dummy1, SpawnLocation, Bus, SearchValues.BusSearched)
		Cloning(Dummy2, SpawnLocation, SkyTrain, SearchValues.SkyTrainSearched)
		Cloning(Dummy3, SpawnLocation, Subway, SearchValues.SubwaySearched)
		Cloning(Dummy4, SpawnLocation, Walk, SearchValues.WalkSearched)
	end
end

-- Clone destination part to designated location
function SetDestination(destinationName)
	
	local DestinationPoint = Waypoints.Destination:Clone()
	DestinationPoint.Parent = game.Workspace.PathFindingTest
	
	local DestinationPart = game.Workspace.LandmarkLocations:FindFirstChild(destinationName)
	DestinationPoint.CFrame = DestinationPart.CFrame
	
	-- Clone stop detection part
	local StopPoint = Waypoints.Stop:Clone()
	StopPoint.Parent = game.Workspace.PathFindingTest
	StopPoint.CFrame = DestinationPart.CFrame
	
	-- Activate Stopping function when stop part is touched
	StopPoint.Touched:Connect(Stopping)
end

-- Clone the dummies after remote event is triggered from client
game.ReplicatedStorage.CloneEvent.OnServerEvent:Connect(function(player, locationName, destinationName)
	
	
	wait(3) -- Time before dummies start running
	SetSpawn(locationName)
	
	SetDestination(destinationName)

end)


-- Parameterized stopping function
function Stopping(hit)
	local dummyName = hit.Parent.Name
	local searchvalue

	if hit.Parent:FindFirstChild("Humanoid") then
		-- Determine which dummy touched the part and set the corresponding search value
		if dummyName == "Dummy1" then
			searchvalue = SearchValues.BusSearched
			
		elseif dummyName == "Dummy2" then
			searchvalue = SearchValues.SkyTrainSearched
			
		elseif dummyName == "Dummy3" then
			searchvalue = SearchValues.SubwaySearched
			
		elseif dummyName == "Dummy4" then
			searchvalue = SearchValues.WalkSearched
		end

		-- Only proceed if searchvalue is set
		if searchvalue then
			hit.Parent:Destroy()
			searchvalue.Value = false

			-- Notify client side
			game.ReplicatedStorage.StopTimerEvent:FireAllClients()
		end
	end
end