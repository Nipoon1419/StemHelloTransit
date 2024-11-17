-- Get the player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Get the part you want to use for touch detection
local partToDetectTouch = character:WaitForChild("HumanoidRootPart")

-- Function to detect the material of touched parts
local function onTouched(otherPart)
	if otherPart and otherPart:IsA("BasePart") then
		local material = otherPart.Material
		print("Touched material:", material.Name)
	end
end

-- Connect the Touched event
partToDetectTouch.Touched:Connect(onTouched)
