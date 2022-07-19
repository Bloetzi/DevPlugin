if game:GetService("RunService"):IsRunning() then
	return 
end

wait(1)
local toolbar = plugin:CreateToolbar("DevPlugin")
local newScriptButton = toolbar:CreateButton("Settings", "Configure Settings", "rbxassetid://6503759908")
--local tools = toolbar:CreateButton("Scripting-Tools","Show/Hide Scripting-Tools","rbxassetid://3517717558")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local RunService = game:GetService("RunService")
local m = require(script.Parent.Manager)

--Settings--
local ScriptInhalt = true
local deb2 = true
local ScriptNotDelete = false
local Reminder = script.Parent.Values.Reminder
local AutoAnchor = script.Parent.Values.AutoAnchor
local DSIns = script.Parent.Values.DataStoreIns
local DarkMode = script.Parent.Values.DarkMode
local BorderSizePixel = script.Parent.Values.BorderSizePixel
local Size1 = script.Parent.Values.PartSize.Size1
local Size2 = script.Parent.Values.PartSize.Size2
local Size3 = script.Parent.Values.PartSize.Size3
local ResetOnSpawn = script.Parent.Values.ResetOnSpawn
--Settings--
local SettingsWidgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Left, 
	false, -- Widget will be initially enabled
	false, --Do not override the previous enabled state
	250, -- Default width of the floating window 
	300, -- Default height of the floating window
	220, -- Minimum width of the floating window
	181-- Minimum height of the floating window
)
local PartInsertWidgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float, 
	false, -- Widget will be initially enabled
	false, --Do not override the previous enabled state
	200, -- Default width of the floating window 
	300, -- Default height of the floating window
	150, -- Minimum width of the floating window
	150 -- Minimum height of the floating window
)
--Widget--
local SettingsWidget = plugin:CreateDockWidgetPluginGui("Settings", SettingsWidgetInfo)
SettingsWidget.Title = "Settings" 
SettingsWidget.Name = "DevPlugin - Settings"
local suc, errorMsg = pcall(function()
	local clone = script.Parent.Frame:Clone()
	clone.Parent = SettingsWidget
end)
if not suc then
	print(errorMsg)
end
local suc, errorMsg = pcall(function()
	m:PluginGUIControll(SettingsWidget,plugin)
end)
if not suc then
	print(errorMsg)
end
------------------------------------------------
local PartInsertWidget = plugin:CreateDockWidgetPluginGui("PartInsert", PartInsertWidgetInfo)
PartInsertWidget.Title = "PartInsert"
PartInsertWidget.Name = "DevPlugin - PartInsert"
script.Parent.PartInsertFrame.Parent = PartInsertWidget
--Widget--

--Open--
--local ScriptN = script.Parent.Sources.ScriptN
--Open--
newScriptButton.ClickableWhenViewportHidden = true

newScriptButton.Click:Connect(function() 
	SettingsWidget.Enabled = not SettingsWidget.Enabled
	newScriptButton:SetActive(true)
end)


-- Scripts --
game.Workspace.DescendantAdded:Connect(function(desc)
	m:PartInsert(desc)
	if script.Parent.Values.AutoAnchor.Value == true then
		m:AutoAnchor(desc)
	end
	if script.Parent.Values.BorderSizePixel.Value == false then
		m:RemoveBorderSizePixel(desc)
	end
end) 
-------------
game.StarterGui.DescendantAdded:Connect(function(desc)
	if script.Parent.Values.BorderSizePixel.Value == false then
		m:RemoveBorderSizePixel(desc)
	end
	if script.Parent.Values.ResetOnSpawn.Value == false then
		m:DisableResetOnSpawn(desc)
	end
end)
-------------
game.ServerStorage.DescendantAdded:Connect(function(desc)
	if script.Parent.Values.BorderSizePixel.Value == false then
		m:RemoveBorderSizePixel(desc)
	end
end)
-- Default Script Sourc --
--[[
game.DescendantAdded:Connect(function(v)
	--print("HI")
	if ScriptInhalt == true then
	local suc, errmsg = pcall(function()
		if v:IsA("Script") or v:IsA("LocalScript") then
		  if deb2 == true then
			--if v.CurrentEditor == nil then
					if v.LinkedSource == "https://www.roblox.com/library/9722533915/Script"  then     -- ENABLE IT IN LOCAL PLUGIN FOR MORE SECURITY!!!
						if v.Name == "Script" or v.Name == "LocalScript" then
						deb2 = false
						ChangeHistoryService:SetWaypoint("Before Script Remove")
						local ins
						if v:IsA("Script") then
						ins = Instance.new("Script")
						ins.Parent = v.Parent
						else
						ins = Instance.new("LocalScript")	
						ins.Parent = v.Parent	
						end
						--ins.Source = ""
							task.wait(0.01)
						if ScriptNotDelete == true then
						v:Destroy()
						plugin:OpenScript(ins,1)
						print("Script Source removed Name: "..v.Name)
						ChangeHistoryService:SetWaypoint("Script Source Removed. Name of Script: "..ins.Parent)
						deb2 = true
						end	
					end
				--end
					end
				else 
					ScriptNotDelete = true
					wait(0.1)
					ScriptNotDelete = false
					deb2 = true
				end
		else
			if deb2 == true then
				ScriptNotDelete = true
				deb2 = false
				task.wait(0.1)
				ScriptNotDelete = false
				deb2 = true
			end
		end
		end)
		if not suc then
			--print(errmsg)
		end
    end
end)

game.DescendantRemoving:Connect(function(v)
	if deb2 == true then
		deb2 = false
		wait(0.2)
		deb2 = true
	else 
		ScriptNotDelete = true
		wait(0.2)
		ScriptNotDelete = false
		deb2 = true
	end
end)

]]--
plugin.Unloading:connect(function()
	SettingsWidget:Destroy()
	if game:GetService("CoreGui"):FindFirstChild("MessageGui") then 
		game:GetService("CoreGui"):FindFirstChild("MessageGui"):Destroy()
	end
end)

SettingsWidget:BindToClose(function()
	newScriptButton:SetActive(false)
	SettingsWidget.Enabled = false
end)
-- Scripts --
wait(1)

--plugin:OpenWikiPage("API:Class/BasePart")

while task.wait(0.5) do
	--print("Hi")
	if RunService:IsRunning() then 
		break
    end
	ScriptInhalt = SettingsWidget.Frame.Frame1:FindFirstChild("ScriptDefSource").Value
	Reminder.Value = SettingsWidget.Frame.Frame3:FindFirstChild("Reminder").Value
	AutoAnchor.Value = SettingsWidget.Frame.Frame4:FindFirstChild("AutoAnchor").Value
	DSIns.Value = SettingsWidget.Frame.Frame2:FindFirstChild("DataStoreIns").Value
	SettingsWidget.Frame.Frame2:FindFirstChild("DataStoreIns").Value = false
	BorderSizePixel.Value = SettingsWidget.Frame.Frame5:FindFirstChild("BorderSizePixel").Value
	Size1.Value = SettingsWidget.Frame.Frame6:FindFirstChild("Size1V").Value
	Size2.Value = SettingsWidget.Frame.Frame6:FindFirstChild("Size2V").Value
	Size3.Value = SettingsWidget.Frame.Frame6:FindFirstChild("Size3V").Value
	ResetOnSpawn.Value = SettingsWidget.Frame.Frame7:FindFirstChild("ResetOnSpawn").Value
	if ScriptInhalt == false  then
		for i , v in pairs(game:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				--print("O")
				--if v.LinkedSource == "https://www.roblox.com/library/9722533915/Script"  then     
					--print("l")
					if v.Name == "Script" or v.Name == "LocalScript" then
						--v.LinkedSource = "https://www.roblox.com/library/9722533915/Script"
					end
			    --end
			end
		end
		
		
		end
	
	
	local themecould = settings().Studio:GetAvailableThemes()
	local theme = settings().Studio.Theme
	--print(theme)
	if theme == themecould[1] then -- light
		DarkMode = false
		script.Parent.MessageGui.Frame.BackgroundColor3 = Color3.new(255,255,255)
		script.Parent.MessageGui.Frame.Msg.TextColor3 = Color3.new(0,0,0)
		SettingsWidget.Frame.BackgroundColor3 = Color3.new(255, 255, 255)
		SettingsWidget.Frame.ScrollBarImageColor3 = Color3.new(0,0,0)
		SettingsWidget.Frame.ATop.Frame.TextLabel.TextColor3 = Color3.new(0,0,0)
		SettingsWidget.Frame.ATop.ShowUptodate.TextLabel.TextColor3 = Color3.new(0,0,0)
		SettingsWidget.Frame.BSearch.SearchBar.TextColor3 = Color3.new(0,0,0)
		SettingsWidget.Frame.Frame6.Frame.Size1.TextColor3 = Color3.new(0,0,0)
		SettingsWidget.Frame.Frame6.Frame.Size2.TextColor3 = Color3.new(0,0,0)
		SettingsWidget.Frame.Frame6.Frame.Size3.TextColor3 = Color3.new(0,0,0)
		----------
		for i , v in pairs(SettingsWidget.Frame:GetChildren()) do
			if v:IsA("Frame") then
				v.BackgroundColor3 = Color3.new(255,255,255)
				if v:FindFirstChild("TextLabel") then
					v.TextLabel.TextColor3 = Color3.new(0,0,0)
				end
			end
		end
	elseif theme == themecould[2] then -- dark
		DarkMode = true
		script.Parent.MessageGui.Frame.BackgroundColor3 = Color3.new(0.135332, 0.135332, 0.135332)
		script.Parent.MessageGui.Frame.Msg.TextColor3 = Color3.new(255,255,255)
		SettingsWidget.Frame.BackgroundColor3 = Color3.new(0.135332, 0.135332, 0.135332)
		SettingsWidget.Frame.ScrollBarImageColor3 = Color3.new(255, 255, 255)
		SettingsWidget.Frame.ATop.Frame.TextLabel.TextColor3 = Color3.new(255,255,255)
		SettingsWidget.Frame.ATop.ShowUptodate.TextLabel.TextColor3 = Color3.new(255,255,255)
		SettingsWidget.Frame.BSearch.SearchBar.TextColor3 = Color3.new(255,255,255)
		SettingsWidget.Frame.Frame6.Frame.Size1.TextColor3 = Color3.new(255,255,255)
		SettingsWidget.Frame.Frame6.Frame.Size2.TextColor3 = Color3.new(255,255,255)
		SettingsWidget.Frame.Frame6.Frame.Size3.TextColor3 = Color3.new(255,255,255)
		----------
		for i , v in pairs(SettingsWidget.Frame:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "ATop" and v.Name ~= "BSearch" then
				v.BackgroundColor3 = Color3.new(0.135332, 0.135332, 0.135332)
				if v:FindFirstChild("Frame") and v.Frame:FindFirstChild("TextLabel") then
					v.Frame.TextLabel.TextColor3 = Color3.new(255,255,255)
				end
			end
		end
	end
	
	--local test = game:GetService("MarketplaceService"):GetV
		
	--local CheckVersion = game:GetService("InsertService"):LoadAsset(7744682115)
	--if CheckVersion.Settings:FindFirstChild("Version") then
		--print("Checking Version...")
		--if CheckVersion.Settings:FindFirstChild("Version").Value > script.Parent.Version.Value then
			--if SettingsWidget.Frame.ATop:FindFirstChild("ShowUptodate").TextLabel.Text == "Up- to date!" then
			   -- SettingsWidget.Frame.ATop:FindFirstChild("ShowUptodate").TextLabel.Text = "Update Available"
				--m:CreateMsg("'Make Developer Life easier' needs to Update!")
			--end
		--end
		--CheckVersion:Destroy()
	--else
		--print("Error")
		--CheckVersion:Destroy()
	--end
end


