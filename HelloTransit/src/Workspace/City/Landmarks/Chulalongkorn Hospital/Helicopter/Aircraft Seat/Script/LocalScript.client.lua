local inputS=game:getService("UserInputService")
local player=game.Players.LocalPlayer
local engine=script.Parent.Engine
local rotor1=script.Parent.Motor
local rotor2=script.Parent.Rotor

local gyro=Instance.new("BodyGyro",engine)
gyro.maxTorque=Vector3.new(1e4,1e4,1e4)
gyro.D=1250
gyro.cframe=engine.CFrame

local spd=Instance.new("BodyVelocity",engine)
spd.maxForce=Vector3.new(1e9,1e9,1e9)
local max_speed=50

local w,a,s,d,up,dn

inputS.InputBegan:connect(function(input)
	local code=input.KeyCode
	if code==Enum.KeyCode.W or code==Enum.KeyCode.Up then
		w=true
	elseif code==Enum.KeyCode.A or code==Enum.KeyCode.Left then
		a=true
	elseif code==Enum.KeyCode.S or code==Enum.KeyCode.Down then
		s=true
	elseif code==Enum.KeyCode.D or code==Enum.KeyCode.Right then
		d=true
	elseif code==Enum.KeyCode.LeftShift then
		up=true
	elseif input.KeyCode==Enum.KeyCode.LeftControl then
		dn=true
	end
end)

inputS.InputEnded:connect(function(input)
	local code=input.KeyCode
	if code==Enum.KeyCode.W or code==Enum.KeyCode.Up then
		w=false
	elseif code==Enum.KeyCode.A or code==Enum.KeyCode.Left then
		a=false
	elseif code==Enum.KeyCode.S or code==Enum.KeyCode.Down then
		s=false
	elseif code==Enum.KeyCode.D or code==Enum.KeyCode.Right then
		d=false
	elseif code==Enum.KeyCode.LeftShift then
		up=false
	elseif input.KeyCode==Enum.KeyCode.LeftControl then
		dn=false
	end
end)

function rotorSpd(spd)
	rotor1.TopParamA=-spd
	rotor1.TopParamB=spd
	rotor2.BottomParamA=-spd
	rotor2.BottomParamB=spd
end

local chg=Vector3.new(0,0,0)
local rot=0
local inc=0
while true do
	wait(.1)
	local lv=engine.CFrame.lookVector
	if up then
		rotorSpd(0.6)
		if chg.y<30 then
			chg=chg+Vector3.new(0,2,0)
		end
	elseif dn then
		rotorSpd(0.2)
		if chg.y>-30 then
			chg=chg+Vector3.new(0,-2,0)
		end
	elseif chg.magnitude>1 then
		rotorSpd(0.4)
		chg=chg*0.9
	else
		rotorSpd(0.4)
		chg=Vector3.new(0,1,0)
	end
	if w then
		if inc<max_speed then
			inc=inc+2
		end
		spd.velocity=chg+(engine.CFrame.lookVector+Vector3.new(0,0.3,0))*inc
		gyro.cframe=CFrame.new(engine.Position,engine.Position+Vector3.new(lv.x,-0.3,lv.z))
	elseif s then
		if inc >-max_speed then
			inc=inc-2
		end
		spd.velocity=chg+(engine.CFrame.lookVector-Vector3.new(0,0.3,0))*inc
		gyro.cframe=CFrame.new(engine.Position,engine.Position+Vector3.new(lv.x,0.3,lv.z))
	else
		inc=inc*0.9
		spd.velocity=chg+engine.CFrame.lookVector*inc+Vector3.new(0,2,0)
		gyro.cframe=CFrame.new(engine.Position,engine.Position+Vector3.new(lv.x,0,lv.z))
	end

	if a then
		if rot<math.pi/8 then
			rot=rot+math.pi/20
		end
		gyro.cframe=gyro.cframe*CFrame.Angles(0,math.pi/10,rot)
	elseif d then
		if rot>-math.pi/8 then
			rot=rot-math.pi/20
		end
		gyro.cframe=gyro.cframe*CFrame.Angles(0,-math.pi/10,rot)
	else
		rot=0
	end
end