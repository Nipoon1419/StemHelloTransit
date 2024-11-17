local Location = script.Parent
local Selected = script.Parent.Parent.SelectDestination

local DestinationValue = game.ReplicatedStorage.SearchValues.Destination


Location.PhramongkutklaoHospital.Activated:Connect(function()
	Selected.Text = "Phramongkutklao Hospital"
	DestinationValue.Value = "PhramongkutklaoHospital"
	Location.Visible = false
end)

Location.LumphiniPark.Activated:Connect(function()
	Selected.Text = "Lumphini Park"
	DestinationValue.Value = "LumphiniPark"
	Location.Visible = false
end)

Location.ChulalongkornHospital.Activated:Connect(function()
	Selected.Text = "Chulalongkorn Hospital"
	DestinationValue.Value = "ChulalongkornHospital"
	Location.Visible = false
end)

Location.ChulalongkornUniversity.Activated:Connect(function()
	Selected.Text = "Chulalongkorn University"
	DestinationValue.Value = "ChulalongkornUniversity"
	Location.Visible = false
end)

Location.RajavithiHospital.Activated:Connect(function()
	Selected.Text = "Rajavithi Hospital"
	DestinationValue.Value = "RajavithiHospital"
	Location.Visible = false
end)

Location.SiamCenter.Activated:Connect(function()
	Selected.Text = "Siam Center"
	DestinationValue.Value = "SiamCenter"
	Location.Visible = false
end)

Location.CentralWorld.Activated:Connect(function()
	Selected.Text = "Central World"
	DestinationValue.Value = "CentralWorld"
	Location.Visible = false
end)