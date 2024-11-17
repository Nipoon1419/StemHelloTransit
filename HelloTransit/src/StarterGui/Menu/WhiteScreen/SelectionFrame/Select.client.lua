local Location = script.Parent.SelectCurrent
local Destination = script.Parent.SelectDestination
local selectC = script.Parent.Location
local selectD = script.Parent.Destination


Location.Activated:Connect(function()
	if selectC.Visible == false then
		selectC.Visible = true
	else
		selectC.Visible = false	
	end
end)

Destination.Activated:Connect(function()
	if selectD.Visible == false then
		selectD.Visible = true
	else
		selectD.Visible = false	
	end
end)