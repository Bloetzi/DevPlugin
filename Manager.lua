--[[
Hello, Thanks for watching into my Module!
Everything is open source, but remember:
Using any piece of code in your game/plugin/model will be handeld hard, with an DMCA. 
Questions, Improvements? Hit me up!
--]]

local manage = {}
--- Services&More ---
local ChangeHistory = game:GetService("ChangeHistoryService")
local Selection = game:GetService("Selection")
local RunService = game:GetService("RunService")
local plugin
local deb = true
local insAchRe = false
--- Services&More ---

function manage:CreateMsg(msg)
	if not RunService:IsRunning() then 
	local newgui = script.Parent.MessageGui:Clone()
	newgui.Parent = game:GetService("CoreGui")

	newgui:WaitForChild("Frame"):WaitForChild("Msg").Text = msg
    --newgui.Frame:TweenPosition(UDim2.new(0.104, 0,0.938, 0), "Out", "Quint", .2)
	wait(2)
	newgui.Frame:TweenPosition(UDim2.new(0.104, 0,1.2, 0), "Out", "Quint", .2)
	newgui:Destroy()
end
end	
	
function manage:Translate(text)
	if typeof(text) == string then
		
	end
end

function manage:DataStoreInsert(ScriptNumber,Key)
	local Script = Instance.new("Script",game:GetService("ServerScriptService"))
	
end


function manage:AutoAnchor(desc:Instance)
	if not RunService:IsRunning() then
	if script.Parent.Values.AutoAnchor.Value == true then
		if desc:IsA("Part") or desc:IsA("MeshPart") or desc:IsA("UnionOperation") then
			if deb == true then 
				deb = false
				if not desc.Parent:FindFirstChildOfClass("Humanoid") or not desc.Parent:IsA("Tool") then
					desc.Anchored = true
				end
				wait(0.1)
				deb = true
				if insAchRe == true then
					desc.Anchored = false
					insAchRe = false
				else 
					local nBC = desc.BrickColor
					desc.BrickColor = BrickColor.new("Sea green")
					wait(1)
					desc.BrickColor = nBC
					ChangeHistory:SetWaypoint("Anchored")
					manage:CreateMsg("Anchored!")
				end
			else
				insAchRe = true
			end
		end
	end
end
end	
	
function manage:CreateTimer(TimerGui:ScreenGui)
	if not RunService:IsRunning() then
	if script.Parent:FindFirstChild(TimerGui) then
		local CoreGui = game:GetService("CoreGui")
		local clone =TimerGui:Clone()
		clone.Name = "Reminder"
		clone.Parent = CoreGui	
		wait(6)
		clone:Destroy()
	end
end
end	
	
function manage:PartInsert(desc:Instance)
	
	if not RunService:IsRunning() then
	if desc:IsA("Part") then
		if desc.Size == Vector3.new(4,1,2) and desc.Name == "Part" then
			if desc.Orientation == Vector3.new(0,0,0) and desc.CastShadow == true and desc.CanCollide == true then
				if desc.BrickColor == BrickColor.new("Medium stone grey") and desc.Transparency==0 and desc.Reflectance ==0 then
					if desc.Material == Enum.Material.Plastic then
						ChangeHistory:SetWaypoint("Before Part Size adjusted")
						desc.Size = Vector3.new(script.Parent.Values.PartSize.Size1.Value,script.Parent.Values.PartSize.Size2.Value,script.Parent.Values.PartSize.Size3.Value)
						ChangeHistory:SetWaypoint("Part Size adjusted.")
						print("PartSizeAdjusted")
							coroutine.wrap(function()
								manage:CreateMsg("PartSize Adjusted")	
							end)
						 
					end
					end
				end
			end
	end
end
end

function manage:RemoveBorderSizePixel(guiobject:Instance)
	if not RunService:IsRunning() then
	if guiobject:IsA("GuiBase") then
		if guiobject:IsA("Frame") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,100,0,100) and guiobject.Visible == true and guiobject.Name == "Frame" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")
				end
			end
		elseif guiobject:IsA("ScrollingFrame") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,100,0,100) and guiobject.Visible == true and guiobject.Name == "ScrollingFrame" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")
				end
			end
		elseif guiobject:IsA("ImageButton") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,100,0,100) and guiobject.Visible == true and guiobject.Name == "ImageButton" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")
				end
			end
		elseif guiobject:IsA("ImageLabel") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,100,0,100) and guiobject.Visible == true and guiobject.Name == "ImageLabel" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")	
				end
			end
		elseif guiobject:IsA("TextButton") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,200,0,50) and guiobject.Visible == true and guiobject.Name == "TextButton" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")	
				end
			end
		elseif guiobject:IsA("TextLabel")	 then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,200,0,50) and guiobject.Visible == true and guiobject.Name == "TextLabel" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
				    print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")	
				end
			end
		elseif guiobject:IsA("TextBox") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,200,0,50) and guiobject.Visible == true and guiobject.Name == "TextBox" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")	
				end
			end
		elseif guiobject:IsA("ViewportFrame") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,100,0,100) and guiobject.Visible == true and guiobject.Name == "ViewportFrame" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")
				end
			end
		elseif guiobject:IsA("VideoFrame") then
			if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
				if guiobject.Size==UDim2.new(0,100,0,100) and guiobject.Visible == true and guiobject.Name == "VideoFrame" then
					ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
					guiobject.BorderSizePixel = 0
					print("BorderSizePixel Removed")
					manage:CreateMsg("BorderSizePixel Removed")
				end
				end
		elseif guiobject:IsA("CanvasGroup") then
				if guiobject.AnchorPoint==Vector2.new(0,0) and guiobject.BorderSizePixel==1 and guiobject.Position==UDim2.new(0,0,0,0) then
					if guiobject.Size==UDim2.new(0,100,0,100) and guiobject.Visible == true and guiobject.Name == "CanvasGroup" then
						ChangeHistory:SetWaypoint("BorderSizePixelRemoved. Class: "..guiobject.ClassName)
						guiobject.BorderSizePixel = 0
						print("BorderSizePixel Removed")
						manage:CreateMsg("BorderSizePixel Removed")
					end
				end
			
				
			
		end
			
			
		end
	end
	
end

function manage:DisableResetOnSpawn(ScreenGui)
	if not RunService:IsRunning() then
		if ScreenGui:IsA("ScreenGui") then
			if ScreenGui.DisplayOrder == 0 and #ScreenGui:GetChildren() == 0 then
				ScreenGui.ResetOnSpawn = false
				print("ResetOnSpawn disabled")
				manage:CreateMsg("ResetOnSpawn Disabled")
			end
		end
	end
end

function manage:PluginGUIControll(g,plug)
	if RunService:IsRunning() then
		return
	end
	--print(g.Parent)
	plugin = plug
	local gui = g.Frame
	if gui:FindFirstChild("BSearch") then
		--print("Hello")
		local bsearch = gui:FindFirstChild("BSearch")
		--print(bsearch)
		local searchBar = gui.BSearch.SearchBar
		local items = gui
		
		searchBar.Changed:connect(function()
			--searchBar.Parent.NoResults.Visible = false
			local visible = 0
			local search = string.lower(searchBar.Text)
			
			for i, v in	 pairs(items:GetChildren()) do
				if v:IsA("Frame") and v.Name ~= "ATop" and v.Name ~= "BSearch" and v.Name ~= "Frame2" then
					if search ~= "" then
						if v:FindFirstChild("Frame"):FindFirstChild("TextLabel") then
						else
							next(items:GetChildren(),i)
						end
						local item = string.lower(v.Frame.TextLabel.Text)
						if string.find(item, search) then
							v.Visible = true
							visible = visible + 1
						else
							v.Visible = false
						end
					else
						--if items:FindFirstChild()
						v.Visible = true
						visible = visible + 1
					end
				end
			end
			
			if visible == 0 then
				bsearch:FindFirstChild("NoResults").Visible = true
			else
				bsearch:FindFirstChild("NoResults").Visible = false
			end
		end)
	end
	
	
	if gui:FindFirstChild("Frame1") then
		local key = "DefScriptSource"
		local check = plugin:GetSetting(key)

		if check == false then
			gui.Frame1:FindFirstChildOfClass("BoolValue").Value = false
			gui.Frame1.Frame.ImageButton.Image = "rbxassetid://7745061180"
		elseif check == true then
			gui.Frame1:FindFirstChildOfClass("BoolValue").Value = true
			gui.Frame1.Frame.ImageButton.Image =  "rbxassetid://7745010012"
		end
		
		local ImageButton = gui.Frame1.Frame.ImageButton
		local label = ImageButton.Parent.Info
		local player = game.Players.LocalPlayer
		local mouse = g:GetRelativeMousePosition()
		local mouseMove = nil
		
		ImageButton.MouseEnter:Connect(function() 
			--label.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
			label.Visible = true
			--print(mouse.x.." - "..mouse.y)
			--mouseMove = mouse.Move:Connect(function()
				--label.Position = UDim2.new(0, mouse.x, 0, mouse.y - 36)
				--print(mouse.X.." - "..mouse.Y)
				--print("--------")
				--print(label.Position)
			--end)
		end)

		ImageButton.MouseLeave:Connect(function()
			if mouseMove then 
				mouseMove:Disconnect() 
			end
			label.Visible = false
		end) 
		


		ImageButton.MouseButton1Down:Connect(function()
			label.Visible = false
			if ImageButton.Image == "rbxassetid://7745010012"  then -- on muss off
				ImageButton.Image = "rbxassetid://7745061180"
				plugin:SetSetting(key,false)
				gui.Frame1:FindFirstChildOfClass("BoolValue").Value = false
			elseif ImageButton.Image == "rbxassetid://7745061180"  then -- off muss on
				ImageButton.Image = "rbxassetid://7745010012"
				plugin:SetSetting(key,true)
				gui.Frame1:FindFirstChildOfClass("BoolValue").Value = true
			end
		end)
		--------------------------------------------------------------------------------
		--                                  Button                                    --
		--------------------------------------------------------------------------------
		local TS = game:GetService("TweenService")
		local Button1 = gui.Frame1.Button
		local Button = Button1.Button
		local Icon = Button.Icon
		local TWInfo = TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In)

		Icon.MouseEnter:Connect(function()
			if Button1.Open.Value == true then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Icon.MouseLeave:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Button.MouseButton1Down:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
				Button1.Open.Value = true
				--Button1.Size = UDim2.new(1, 0,0.27, 0)
				gui.Frame1.Frame.Visible = true
				TS:Create(gui.Frame1,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				TS:Create(gui.Frame1.Frame,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				--Button1.UICorner.CornerRadius = UDim.new(0,4)
			else
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
				Button1.Open.Value = false
				--Button1.Size = UDim2.new(1,0,1,0)
				TS:Create(gui.Frame1,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				TS:Create(gui.Frame1.Frame,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				task.wait(0.3)
				gui.Frame1.Frame.Visible = false
				--Button1.UICorner.CornerRadius = UDim.new(0,0)
			end
		end)
	end
	------------------------------------
	if gui:FindFirstChild("Frame2") then
	end
	------------------------------------
	if gui:FindFirstChild("Frame3") then
		local key = "Reminder"
		local check = plugin:GetSetting(key)

		if check == false then
			gui.Frame3:FindFirstChildOfClass("BoolValue").Value = false
			gui.Frame3.Frame.ImageButton.Image = "rbxassetid://7745061180"
		elseif check == true then
			gui.Frame3:FindFirstChildOfClass("BoolValue").Value = true
			gui.Frame3.Frame.ImageButton.Image =  "rbxassetid://7745010012"
		end

		local ImageButton = gui.Frame3.Frame.ImageButton
		local label = ImageButton.Parent.Info
		local player = game.Players.LocalPlayer
		local mouse = g:GetRelativeMousePosition()
		local mouseMove = nil
		
		ImageButton.MouseEnter:Connect(function() 
			label.Visible = true
		end)

		ImageButton.MouseLeave:Connect(function()
			label.Visible = false
		end) 


		ImageButton.MouseButton1Down:Connect(function()
			label.Visible = false
			if ImageButton.Image == "rbxassetid://7745010012"  then -- on muss off
				ImageButton.Image = "rbxassetid://7745061180"
				plugin:SetSetting(key,false)
				gui.Frame3:FindFirstChildOfClass("BoolValue").Value = false
			elseif ImageButton.Image == "rbxassetid://7745061180"  then -- off muss on
				ImageButton.Image = "rbxassetid://7745010012"
				plugin:SetSetting(key,true)
				gui.Frame3:FindFirstChildOfClass("BoolValue").Value = true
			end
		end)
		--------------------------------------------------------------------------------
		--                                  Button                                    --
		--------------------------------------------------------------------------------
		local TS = game:GetService("TweenService")
		local Button1 = gui.Frame3.Button
		local Button = Button1.Button
		local Icon = Button.Icon
		local TWInfo = TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In)

		Icon.MouseEnter:Connect(function()
			if Button1.Open.Value == true then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Icon.MouseLeave:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Button.MouseButton1Down:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
				Button1.Open.Value = true
				--Button1.Size = UDim2.new(1, 0,0.27, 0)
				gui.Frame3.Frame.Visible = true
				TS:Create(gui.Frame3,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				TS:Create(gui.Frame3.Frame,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				--Button1.UICorner.CornerRadius = UDim.new(0,4)
			else
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
				Button1.Open.Value = false
				--Button1.Size = UDim2.new(1,0,1,0)
				TS:Create(gui.Frame3,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				TS:Create(gui.Frame3.Frame,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				task.wait(0.3)
				gui.Frame3.Frame.Visible = false
				--Button1.UICorner.CornerRadius = UDim.new(0,0)
			end
		end)
	end
	------------------------------------
	if gui:FindFirstChild("Frame4") then
		local key = "AutoAnchor"
		local check = plugin:GetSetting(key)

		if check == false then
			gui.Frame4:FindFirstChildOfClass("BoolValue").Value = false
			gui.Frame4.Frame.ImageButton.Image = "rbxassetid://7745061180"
		elseif check == true then
			gui.Frame4:FindFirstChildOfClass("BoolValue").Value = true
			gui.Frame4.Frame.ImageButton.Image =  "rbxassetid://7745010012"
		end

		local ImageButton = gui.Frame4.Frame.ImageButton
		local label = ImageButton.Parent.Info
		local player = game.Players.LocalPlayer
		local mouse = g:GetRelativeMousePosition()
		local mouseMove = nil
		
		ImageButton.MouseEnter:Connect(function() 
			label.Visible = true
		end)

		ImageButton.MouseLeave:Connect(function()
			label.Visible = false
		end) 


		ImageButton.MouseButton1Down:Connect(function()
			label.Visible = false
			if ImageButton.Image == "rbxassetid://7745010012"  then -- on muss off
				ImageButton.Image = "rbxassetid://7745061180"
				plugin:SetSetting(key,false)
				gui.Frame4:FindFirstChildOfClass("BoolValue").Value = false
			elseif ImageButton.Image == "rbxassetid://7745061180"  then -- off muss on
				ImageButton.Image = "rbxassetid://7745010012"
				plugin:SetSetting(key,true)
				gui.Frame4:FindFirstChildOfClass("BoolValue").Value = true
			end
		end)
		--------------------------------------------------------------------------------
		--                                  Button                                    --
		--------------------------------------------------------------------------------
		local TS = game:GetService("TweenService")
		local Button1 = gui.Frame4.Button
		local Button = Button1.Button
		local Icon = Button.Icon
		local TWInfo = TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In)

		Icon.MouseEnter:Connect(function()
			if Button1.Open.Value == true then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Icon.MouseLeave:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Button.MouseButton1Down:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
				Button1.Open.Value = true
				--Button1.Size = UDim2.new(1, 0,0.27, 0)
				gui.Frame4.Frame.Visible = true
				TS:Create(gui.Frame4,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				TS:Create(gui.Frame4.Frame,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				--Button1.UICorner.CornerRadius = UDim.new(0,4)
			else
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
				Button1.Open.Value = false
				--Button1.Size = UDim2.new(1,0,1,0)
				TS:Create(gui.Frame4,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				TS:Create(gui.Frame4.Frame,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				task.wait(0.3)
				gui.Frame4.Frame.Visible = false
				--Button1.UICorner.CornerRadius = UDim.new(0,0)
			end
		end)
	end
	------------------------------------
	if gui:FindFirstChild("Frame5") then
		local key = "BorderSizePixel"
		local check = plugin:GetSetting(key)

		if check == false then
			gui.Frame5:FindFirstChildOfClass("BoolValue").Value = false
			gui.Frame5.Frame.ImageButton.Image = "rbxassetid://7745061180"
		elseif check == true then
			gui.Frame5:FindFirstChildOfClass("BoolValue").Value = true
			gui.Frame5.Frame.ImageButton.Image =  "rbxassetid://7745010012"
		end

		local ImageButton = gui.Frame5.Frame.ImageButton
		local label = ImageButton.Parent.Info
		local player = game.Players.LocalPlayer
		local mouse = g:GetRelativeMousePosition()
		local mouseMove = nil
		
		ImageButton.MouseEnter:Connect(function() 
			label.Visible = true
		end)

		ImageButton.MouseLeave:Connect(function()
			label.Visible = false
		end) 


		ImageButton.MouseButton1Down:Connect(function()
			label.Visible = false
			if ImageButton.Image == "rbxassetid://7745010012"  then -- on muss off
				ImageButton.Image = "rbxassetid://7745061180"
				plugin:SetSetting(key,false)
				gui.Frame5:FindFirstChildOfClass("BoolValue").Value = false
			elseif ImageButton.Image == "rbxassetid://7745061180"  then -- off muss on
				ImageButton.Image = "rbxassetid://7745010012"
				plugin:SetSetting(key,true)
				gui.Frame5:FindFirstChildOfClass("BoolValue").Value = true
			end
		end)
		--------------------------------------------------------------------------------
		--                                  Button                                    --
		--------------------------------------------------------------------------------
		local TS = game:GetService("TweenService")
		local Button1 = gui.Frame5.Button
		local Button = Button1.Button
		local Icon = Button.Icon
		local TWInfo = TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In)

		Icon.MouseEnter:Connect(function()
			if Button1.Open.Value == true then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Icon.MouseLeave:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Button.MouseButton1Down:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
				Button1.Open.Value = true
				--Button1.Size = UDim2.new(1, 0,0.27, 0)
				gui.Frame5.Frame.Visible = true
				TS:Create(gui.Frame5,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				TS:Create(gui.Frame5.Frame,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				--Button1.UICorner.CornerRadius = UDim.new(0,4)
			else
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
				Button1.Open.Value = false
				--Button1.Size = UDim2.new(1,0,1,0)
				TS:Create(gui.Frame5,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				TS:Create(gui.Frame5.Frame,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				task.wait(0.3)
				gui.Frame5.Frame.Visible = false
				--Button1.UICorner.CornerRadius = UDim.new(0,0)
			end
		end)
	end
	------------------------------------
	if gui:FindFirstChild("Frame6") then
		local key = "PartSize"
		local check = plugin:GetSetting(key)
		
		local Size1V = gui.Frame6.Size1V
		local Size2V = gui.Frame6.Size2V
		local Size3V = gui.Frame6.Size3V
		local Size1 = gui.Frame6.Frame.Size1
		local Size2 = gui.Frame6.Frame.Size2
		local Size3 = gui.Frame6.Frame.Size3
		
		if check ~= nil then
			local spli = string.split(check," ")
			Size1V.Value = spli[1]
			Size2V.Value = spli[2]
			Size3V.Value = spli[3]
			Size1.Text = Size1V.Value
			Size2.Text = Size2V.Value
			Size3.Text = Size3V.Value
		end
		

		
		Size1:GetPropertyChangedSignal("Text"):Connect(function()
			local text = tostring(Size1.Text) 
			local text2 = tostring(Size2.Text)
			local text3 = tostring(Size3.Text)
			if text == "1" or text == "2" or text == "3" or text == "4" or text == "5" or text == "6" or text == "7" or text == "8" or text == "9" or text == "10" then
				if text2 == "1" or text2 == "2" or text2 == "3" or text2 == "4" or text2 == "5" or text2 == "6" or text2 == "7" or text2 == "8" or text2 == "9" or text2 == "10" then
					if text3 == "1" or text3 == "2" or text3 == "3" or text3 == "4" or text3 == "5" or text3 == "6" or text3 == "7" or text3 == "8" or text3 == "9" or text3 == "10" then
						plugin:SetSetting(key,text.." "..text2.." "..text3)
						Size1V.Value = text
						Size2V.Value = text2
						Size3V.Value = text3
					end
				end
			end
		end)
		
		Size2:GetPropertyChangedSignal("Text"):Connect(function()
			local text = tostring(Size1.Text) 
			local text2 = tostring(Size2.Text)
			local text3 = tostring(Size3.Text)
			if text == "1" or text == "2" or text == "3" or text == "4" or text == "5" or text == "6" or text == "7" or text == "8" or text == "9" or text == "10" then
				if text2 == "1" or text2 == "2" or text2 == "3" or text2 == "4" or text2 == "5" or text2 == "6" or text2 == "7" or text2 == "8" or text2 == "9" or text2 == "10" then
					if text3 == "1" or text3 == "2" or text3 == "3" or text3 == "4" or text3 == "5" or text3 == "6" or text3 == "7" or text3 == "8" or text3 == "9" or text3 == "10" then
						plugin:SetSetting(key,text.." "..text2.." "..text3)
						Size1V.Value = text
						Size2V.Value = text2
						Size3V.Value = text3
					end
				end
			end
		end)

		Size3:GetPropertyChangedSignal("Text"):Connect(function()
			local text = tostring(Size1.Text) 
			local text2 = tostring(Size2.Text)
			local text3 = tostring(Size3.Text)
			if text == "1" or text == "2" or text == "3" or text == "4" or text == "5" or text == "6" or text == "7" or text == "8" or text == "9" or text == "10" then
				if text2 == "1" or text2 == "2" or text2 == "3" or text2 == "4" or text2 == "5" or text2 == "6" or text2 == "7" or text2 == "8" or text2 == "9" or text2 == "10" then
					if text3 == "1" or text3 == "2" or text3 == "3" or text3 == "4" or text3 == "5" or text3 == "6" or text3 == "7" or text3 == "8" or text3 == "9" or text3 == "10" then
						plugin:SetSetting(key,text.." "..text2.." "..text3)
						Size1V.Value = text
						Size2V.Value = text2
						Size3V.Value = text3
					end
				end
			end
		end)
		--------------------------------------------------------------------------------
		--                                  Button                                    --
		--------------------------------------------------------------------------------
		local TS = game:GetService("TweenService")
		local Button1 = gui.Frame6.Button
		local Button = Button1.Button
		local Icon = Button.Icon
		local TWInfo = TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In)

		Icon.MouseEnter:Connect(function()
			if Button1.Open.Value == true then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Icon.MouseLeave:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Button.MouseButton1Down:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
				Button1.Open.Value = true
				--Button1.Size = UDim2.new(1, 0,0.27, 0)
				gui.Frame6.Frame.Visible = true
				TS:Create(gui.Frame6,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				TS:Create(gui.Frame6.Frame,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				--Button1.UICorner.CornerRadius = UDim.new(0,4)
			else
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
				Button1.Open.Value = false
				--Button1.Size = UDim2.new(1,0,1,0)
				TS:Create(gui.Frame6,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				TS:Create(gui.Frame6.Frame,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				task.wait(0.3)
				gui.Frame6.Frame.Visible = false
				--Button1.UICorner.CornerRadius = UDim.new(0,0)
			end
		end)
	end
	------------------------------------
	if gui:FindFirstChild("Frame7") then
		local key = "ResetOnSpawn"
		local check = plugin:GetSetting(key)

		if check == false then
			gui.Frame7:FindFirstChildOfClass("BoolValue").Value = false
			gui.Frame7.Frame.ImageButton.Image = "rbxassetid://7745061180"
		elseif check == true then
			gui.Frame7:FindFirstChildOfClass("BoolValue").Value = true
			gui.Frame7.Frame.ImageButton.Image =  "rbxassetid://7745010012"
		end

		local ImageButton = gui.Frame7.Frame.ImageButton
		local label = ImageButton.Parent.Info
		local player = game.Players.LocalPlayer
		local mouse = g:GetRelativeMousePosition()
		local mouseMove = nil
		
		ImageButton.MouseEnter:Connect(function() 
			label.Visible = true
		end)

		ImageButton.MouseLeave:Connect(function()
			label.Visible = false
		end) 


		ImageButton.MouseButton1Down:Connect(function()
			label.Visible = false
			if ImageButton.Image == "rbxassetid://7745010012"  then -- on muss off
				ImageButton.Image = "rbxassetid://7745061180"
				plugin:SetSetting(key,false)
				gui.Frame7:FindFirstChildOfClass("BoolValue").Value = false
			elseif ImageButton.Image == "rbxassetid://7745061180"  then -- off muss on
				ImageButton.Image = "rbxassetid://7745010012"
				plugin:SetSetting(key,true)
				gui.Frame7:FindFirstChildOfClass("BoolValue").Value = true
			end
		end)
		--------------------------------------------------------------------------------
		--                                  Button                                    --
		--------------------------------------------------------------------------------
		local TS = game:GetService("TweenService")
		local Button1 = gui.Frame7.Button
		local Button = Button1.Button
		local Icon = Button.Icon
		local TWInfo = TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In)

		Icon.MouseEnter:Connect(function()
			if Button1.Open.Value == true then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Icon.MouseLeave:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
			else
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
			end
		end)

		Button.MouseButton1Down:Connect(function()
			if Button1.Open.Value == false then
				TS:Create(Icon,TWInfo,{Rotation = 90}):Play()
				Button1.Open.Value = true
				--Button1.Size = UDim2.new(1, 0,0.27, 0)
				--TS:Create(gui.Frame4,TWInfo,{Size = UDim2.new(0.99,0,0.15,0)}):Play()
				gui.Frame7.Frame.Visible = true
				TS:Create(gui.Frame7,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				TS:Create(gui.Frame7.Frame,TWInfo,{Size = UDim2.new(1,0,0,105)}):Play()
				--Button1.UICorner.CornerRadius = UDim.new(0,4)
			else
				TS:Create(Icon,TWInfo,{Rotation = 0}):Play()
				Button1.Open.Value = false
				--Button1.Size = UDim2.new(1,0,1,0)
				TS:Create(gui.Frame7,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				TS:Create(gui.Frame7.Frame,TWInfo,{Size = UDim2.new(1,0,0,30)}):Play()
				task.wait(0.3)
				gui.Frame7.Frame.Visible = false
				--Button1.UICorner.CornerRadius = UDim.new(0,0)
			end
		end)
	end
end




return manage
