local Location = script.Parent
local Selected = script.Parent.Parent.SelectCurrent

local LocationValue = game.ReplicatedStorage.SearchValues.Location


Location.PhramongkutklaoHospital.Activated:Connect(function()
	Selected.Text = "Phramongkutklao Hospital"
	LocationValue.Value = "PhramongkutklaoHospital"
	Location.Visible = false
	wait(0.1)
end)

Location.LumphiniPark.Activated:Connect(function()
	Selected.Text = "Lumphini Park"
	LocationValue.Value = "LumphiniPark"
	Location.Visible = false
	wait(0.1)
end)

Location.ChulalongkornHospital.Activated:Connect(function()
	Selected.Text = "Chulalongkorn Hospital"
	LocationValue.Value = "ChulalongkornHospital"
	Location.Visible = false
	wait(0.1)
end)

Location.ChulalongkornUniversity.Activated:Connect(function()
	Selected.Text = "Chulalongkorn University"
	LocationValue.Value = "ChulalongkornUniversity"
	Location.Visible = false
	wait(0.1)
end)

Location.RajavithiHospital.Activated:Connect(function()
	Selected.Text = "Rajavithi Hospital"
	LocationValue.Value = "RajavithiHospital"
	Location.Visible = false
	wait(0.1)
end)

Location.SiamCenter.Activated:Connect(function()
	Selected.Text = "Siam Center"
	LocationValue.Value = "SiamCenter"
	Location.Visible = false
	wait(0.1)
end)

Location.CentralWorld.Activated:Connect(function()
	Selected.Text = "Central World"
	LocationValue.Value = "CentralWorld"
	Location.Visible = false
	wait(0.1)
end)