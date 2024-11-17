while true do
	if game.Lighting.TimeOfDay >= "07:00:00" and game.Lighting.TimeOfDay <= "18:00:00" then
		script.Parent.BrickColor = BrickColor.new("Ghost grey")
		script.Parent.Material = "SmoothPlastic"
		script.Parent.Light.Enabled = false
	else
		script.Parent.BrickColor = BrickColor.new("Institutional white")
		script.Parent.Material = "Neon"
		script.Parent.Light.Enabled = true
	end
	wait(5)
end