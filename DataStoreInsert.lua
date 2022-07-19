local DataStroeWidgetInfo = DockWidgetPluginGuiInfo.new(
			Enum.InitialDockState.Float, 
			false, -- Widget will be initially enabled
			false, --Do not override the previous enabled state
			200, -- Default width of the floating window 
			300, -- Default height of the floating window
			150, -- Minimum width of the floating window
			150 -- Minimum height of the floating window
		)
local SettingsWidget = plugin:CreateDockWidgetPluginGui("DataStore", DataStroeWidgetInfo)
SettingsWidget.Title = "DataStore"
SettingsWidget.Name = "DevPlugin - DataStoreInsert"
script.Parent.DataStoreFrame.Parent = SettingsWidget



script.Parent.Values.DataStoreIns:GetPropertyChangedSignal("Value"):Connect(function()
	local val = script.Parent.Values.DataStoreIns.Value
	if val == true then
		SettingsWidget.Enabled = not SettingsWidget.Enabled
	end
end)
