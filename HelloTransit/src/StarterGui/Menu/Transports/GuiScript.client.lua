
-- Script for WhiteScreen

local WhiteScreen = script.Parent.Parent.WhiteScreen
local Tutorial = script.Parent.Parent.Tutorial

WhiteScreen.Tutorial.Activated:Connect(function()
	Tutorial.Visible = true
end)

script.Parent.Back.Activated:Connect(function()
	script.Parent.Visible = false
	
	WhiteScreen.Visible = true
end)

-- Script for Transports

local Values = game.ReplicatedStorage.Values
local TransportResult = script.Parent.TransportResult
local TransportSelection = script.Parent.TransportSelection

-- Data table
local transports = {
	Bus = {
		time = Values.Bus.Time,
		distance = Values.Bus.Distance,
		fare = Values.Bus.Fare
	},
	Skytrain = {
		time = Values.Skytrain.Time,
		distance = Values.Skytrain.Distance,
		fare = Values.Skytrain.Fare
	},
	Subway = {
		time = Values.Subway.Time,
		distance = Values.Subway.Distance,
		fare = Values.Subway.Fare
	},
	Walking = {
		time = Values.Walk.Time,
		distance = Values.Walk.Distance,
		fare = Values.Walk.Fare
	}
}

-- Set a function
local function ShowData(transportMethod)
	local transportData = transports[transportMethod]
	
	-- Show result frame
	TransportResult.Visible = true
	
	-- Initial output
	TransportResult.TimeOutput.Text = transportData.time.Value
	TransportResult.DistanceOutput.Text = transportData.distance.Value
	TransportResult.FareOutput.Text = transportData.fare.Value
	
	TransportResult.Method.Text = transportMethod
	
	
	-- Update the data
	transportData.time:GetPropertyChangeSignal("Value"):Connect(function()
		TransportResult.TimeOutput.Text = transportData.time.Value
	end)

	transportData.distance:GetPropertyChangeSignal("Value"):Connect(function()
		TransportResult.DistanceOutput.Text = transportData.distance.Value
	end)

	transportData.fare:GetPropertyChangeSignal("Value"):Connect(function()
		TransportResult.FareOutput.Text = transportData.fare.Value
	end)
end


-- Show coincided data when a button is pressed
TransportSelection.BusButton.Activated:Connect(function()
	ShowData("Bus")
end)

TransportSelection.SkytrainButton.Activated:Connect(function()
	ShowData("Skytrain")
end)

TransportSelection.SubwayButton.Activated:Connect(function()
	ShowData("Subway")
end)

TransportSelection.WalkButton.Activated:Connect(function()
	ShowData("Walking")
end)

script.Parent.Tutorial.Activated:Connect(function()
	Tutorial.Visible = true
end)




-- Script for Tutorial

local Image = Tutorial.Frame.Output.Image
local BackButton = Tutorial.Frame.Back

local BTSButton = Tutorial.Frame.BTS_MRT
local BusButton = Tutorial.Frame.Buses
local TipsButton = Tutorial.Frame.Tips

BTSButton.Activated:Connect(function()
	Image.Image = "rbxassetid://123093086963519"
end)

BusButton.Activated:Connect(function()
	Image.Image = "rbxassetid://101801539930211"
end)

TipsButton.Activated:Connect(function()
	Image.Image = "rbxassetid://70545665603056"
end)

BackButton.Activated:Connect(function()
	Tutorial.Visible = false
end)



-- Script for Maps

local Maps = script.Parent.Parent.Maps

TransportSelection.BusMap.Activated:Connect(function()
	Maps.Visible = true
	Maps.Bus.Visible = true
end)

TransportSelection.BTSMap.Activated:Connect(function()
	Maps.Visible = true
	Maps.BTS.Visible = true
end)

TransportSelection.MRTMap.Activated:Connect(function()
	Maps.Visible = true
	Maps.MRT.Visible = true
end)

TransportSelection.WalkMap.Activated:Connect(function()
	script.Parent.NoMap.Visible = true
	wait(3)
	script.Parent.NoMap.Visible = false
end)

Maps.Back.Activated:Connect(function()
	Maps.Visible = false
	Maps.BTS.Visible = false
	Maps.MRT.Visible = false
	Maps.Bus.Visible = false
end)

local MRTButtons = Maps.MRT.Stations
local MRTName = Maps.MRT.Status.StationName.Text
local MRTTime = Maps.MRT.Status.Frame.TimeTilNext.Text

local BusButtons = Maps.Bus.Stations.ScrollingFrame
local BusName = Maps.Bus.Status.StationName.Text
local BusTime = Maps.Bus.Status.Frame.TimeTilNext.Text

local BTSButtons = Maps.BTS.Stations.ScrollingFrame
local BTSName = Maps.BTS.Status.StationName.Text
local BTSTime = Maps.BTS.Status.Frame.TimeTilNext.Text

-- Function to run the timer and cycle through Departing -> 6 minutes -> 1 minute -> Arriving -> Departing
local function runTimer(timeDisplay)
	-- This function will update the time text for a specific station
	while true do
		-- Start from "Departing" and run down to "Arriving"
		timeDisplay.Text = "Departing"
		wait(5)
		for i = 6, 1, -1 do
			timeDisplay.Text = i .. " Minutes"
			wait(5) -- 5 seconds = 1 minute in the simulation
		end
		-- Set to "Arriving"
		timeDisplay.Text = "Arriving"
		wait(5)
	end
end

local currentTimer -- to track the active timer and stop it when needed

-- Detect button presses for MRT
for _, button in pairs(MRTButtons:GetChildren()) do
	if button:IsA("TextButton") then
		button.MouseButton1Click:Connect(function()
			-- Stop the previous timer if one exists
			if currentTimer then
				currentTimer:Disconnect()
			end

			-- Set MRT station name based on the button clicked
			MRTName = button.Name
			Maps.MRT.Status.StationName.Text = MRTName -- Update the UI with the new station name

			-- Start a new timer for MRT
			currentTimer = runTimer(Maps.MRT.Status.Frame.TimeTilNext) -- Pass the text field to be updated
		end)
	end
end

-- Detect button presses for Bus
for _, button in pairs(BusButtons:GetChildren()) do
	if button:IsA("TextButton") then
		button.MouseButton1Click:Connect(function()
			-- Stop the previous timer if one exists
			if currentTimer then
				currentTimer:Disconnect()
			end

			-- Set Bus station name based on the button clicked
			BusName = button.Name
			Maps.Bus.Status.StationName.Text = BusName -- Update the UI with the new station name

			-- Start a new timer for Bus
			currentTimer = runTimer(Maps.Bus.Status.Frame.TimeTilNext) -- Pass the text field to be updated
		end)
	end
end

-- Detect button presses for BTS
for _, button in pairs(BTSButtons:GetChildren()) do
	if button:IsA("TextButton") then
		button.MouseButton1Click:Connect(function()
			-- Stop the previous timer if one exists
			if currentTimer then
				currentTimer:Disconnect()
			end

			-- Set BTS station name based on the button clicked
			BTSName = button.Name
			Maps.BTS.Status.StationName.Text = BTSName -- Update the UI with the new station name

			-- Start a new timer for BTS
			currentTimer = runTimer(Maps.BTS.Status.Frame.TimeTilNext) -- Pass the text field to be updated
		end)
	end
end
