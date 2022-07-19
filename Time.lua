local m = require(script.Parent.Manager)
local RS = game:GetService("RunService")

if RS:IsRunning() then
	
else
	while true  do  --30 minutes  
		task.wait(30*60)
		if RS:IsRunning() then
			break
		end
		if script.Parent.Values.Reminder.Value == true then
			m:CreateTimer(script.Parent.TimeFrame)
		end
	end
end

