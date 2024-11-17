script.Parent.ChildAdded:connect(function(child)
	if child.Name=="SeatWeld" then
		local flyer=script.LocalScript:Clone()
		flyer.Disabled= false
		flyer.Parent=script.Parent.Parent
		script.Parent.Parent.Parent=child.Part1.Parent
	end
end)

script.Parent.ChildRemoved:connect(function(child)
	if child.Name=="SeatWeld" then
		script.Parent.Parent.Parent=workspace
		script.Parent.Parent.Engine:ClearAllChildren()
	end
end)