local CallGUI = game.Workspace:WaitForChild("GUI")
local Menu = script.Parent.Menu.WhiteScreen

local SearchValue = game.ReplicatedStorage.SearchValues
local Location = SearchValue.Location
local Destination = SearchValue.Destination

local BusTime = game.ReplicatedStorage.Values.Bus.Time
local SkyTrainTime = game.ReplicatedStorage.Values.Skytrain.Time
local SubwayTime = game.ReplicatedStorage.Values.Subway.Time
local WalkTime = game.ReplicatedStorage.Values.Walk.Time

-- Call GUI when the part is touched
CallGUI.Touched:Connect(function()
	Menu.Visible = true
end)

-- Changes after search button was pressed
Menu.SelectionFrame.Search.Activated:Connect(function()
	-- Checking if both values are assigned
	if Location.Value == "" or Destination.Value == "" then
		Menu.Warning.Visible = true
		
		wait(3)
		Menu.Warning.Visible = false
	else
		Menu.Warning.Visible = false
		Menu.Visible = false
		
		Menu.Parent.Transports.Visible = true
		
		-- Send the button activation to the server
		game.ReplicatedStorage.CloneEvent:FireServer(Location.Value, Destination.Value)
		
		-- Teleport local player to the start location
		local PlayerSpawn = game.Workspace.PlayerSpawns:FindFirstChild(Location.Value)

		if PlayerSpawn then
			game.Players.LocalPlayer.Character:MoveTo(PlayerSpawn.Position)
		end
	end
end)

-- Show the timer
game.ReplicatedStorage.StopTimerEvent.OnClientEvent:Connect(function()
	print("Bus Time Taken : ", BusTime.Value)
	print("Sky Train Time Taken : ", SkyTrainTime.Value)
	print("Subway Time Taken : ", SubwayTime.Value)
	print("Walk Time Taken : ", WalkTime.Value)
end)