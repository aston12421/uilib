local library = {}

function library:CreateWindow(title)

    for i, v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") then
            if v.Name == title then
                v:Destroy()
            end
        end
    end

    local window = {}

    title = title or "Your title"
    local UILib = Instance.new("ScreenGui")
    local TopFrame = Instance.new("Frame")
    local Contianer = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local TitleText = Instance.new("TextLabel")
    
    UILib.Name = title
    UILib.Parent = game.CoreGui
    
    TopFrame.Name = "TopFrame"
    TopFrame.Parent = UILib
    TopFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 43)
    TopFrame.BorderSizePixel = 0
    TopFrame.Position = UDim2.new(0.361603707, 0, 0.275151521, 0)
    TopFrame.Size = UDim2.new(0, 335, 0, 30)
    TopFrame.Active = true
    TopFrame.Draggable = true
    TopFrame.Visible = true
    
    Contianer.Name = "Contianer"
    Contianer.Parent = TopFrame
    Contianer.BackgroundColor3 = Color3.fromRGB(31, 31, 32)
    Contianer.BorderSizePixel = 0
    Contianer.Position = UDim2.new(0, 0, 1, 0)
    Contianer.Size = UDim2.new(0, 335, 0, 204)
    
    UIListLayout.Parent = Contianer
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)
    
    UIPadding.Parent = Contianer
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.PaddingTop = UDim.new(0, 10)
    UIPadding.PaddingBottom = UDim.new(0, 10)

    TitleText.Name = "TitleText"
    TitleText.Parent = TopFrame
    TitleText.BackgroundColor3 = Color3.fromRGB(42, 42, 43)
    TitleText.BorderSizePixel = 0
    TitleText.Position = UDim2.new(0.24179104, 0, 0, 0)
    TitleText.Size = UDim2.new(0, 172, 0, 30)
    TitleText.Font = Enum.Font.SourceSansBold
    TitleText.TextColor3 = Color3.fromRGB(203, 203, 204)
    TitleText.TextSize = 14.000
    TitleText.Text = title

    function window:ToggleVisibility()
        if TopFrame.Visible then
            TopFrame.Visible = false
        else
            TopFrame.Visible = true
        end

    end

    function window:CreateSlider(text, width, min, max, callback)
        text = text or "Slider"
        min = min or 0
        max = max or 100
        callback = callback or function() end
        
        local mouse = game.Players.LocalPlayer:GetMouse()
        local uis = game:GetService("UserInputService")
        local Value;
        
        local Slider = Instance.new("Frame")
        local SliderText = Instance.new("TextLabel")
        local SliderButton = Instance.new("TextButton")
        local SliderInner = Instance.new("Frame")
        local SliderValue = Instance.new("TextBox")
        
        Slider.Name = "Slider"
        Slider.Parent = Contianer
        Slider.BackgroundColor3 = Color3.fromRGB(31, 31, 32)
        Slider.BorderSizePixel = 0
        Slider.Position = UDim2.new(0.0298507456, 0, 0.220588237, 0)
        Slider.Size = UDim2.new(0, 325, 0, 30)
        
        SliderButton.Name = "SliderButton"
        SliderButton.Parent = Slider
        SliderButton.BackgroundColor3 = Color3.fromRGB(24, 24, 25)
        SliderButton.BorderColor3 = Color3.fromRGB(42, 42, 43)
        SliderButton.Position = UDim2.new(0, 0, 0.377092928, 0)
        SliderButton.Size = UDim2.new(0, width, 0, 12)
        SliderButton.Font = Enum.Font.SourceSans
        SliderButton.Text = ""
        SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        SliderButton.TextSize = 14.000
        SliderButton.TextXAlignment = Enum.TextXAlignment.Left
        
        SliderInner.Name = "SliderInner"
        SliderInner.Parent = SliderButton
        SliderInner.BackgroundColor3 = Color3.fromRGB(60, 73, 255)
        SliderInner.BorderSizePixel = 0
        SliderInner.Size = UDim2.new(0, 0, 0, 12)
        
        SliderText.Name = "SliderText"
        SliderText.Parent = Slider
        SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderText.BackgroundTransparency = 1.000
        SliderText.BorderSizePixel = 0
        SliderText.Position = UDim2.new(0, 0, -0.213369071, 0)
        SliderText.Size = UDim2.new(0, 29, 0, 18)
        SliderText.Font = Enum.Font.SourceSans
        SliderText.Text = text
        SliderText.TextColor3 = Color3.fromRGB(203, 203, 204)
        SliderText.TextSize = 14.000
        SliderText.TextXAlignment = Enum.TextXAlignment.Left
        
        SliderValue.Name = "SliderValue"
        SliderValue.Parent = Slider
        SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderValue.BackgroundTransparency = 1.000
        SliderValue.BorderSizePixel = 0
        SliderValue.Position = UDim2.new(0, 0, 0.5, 0)
        SliderValue.Size = UDim2.new(0, 10, 0, 18)
        SliderValue.ClearTextOnFocus = false
        SliderValue.Font = Enum.Font.SourceSans
        SliderValue.Text = min
        SliderValue.TextColor3 = Color3.fromRGB(203, 203, 204)
        SliderValue.TextSize = 14.000
        
        SliderButton.MouseButton1Down:Connect(function()
            Value = math.floor((((tonumber(max) - tonumber(min)) / width) * SliderInner.AbsoluteSize.X) + tonumber(min)) or 0
            pcall(function()
                callback(Value)
            end)
            SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, width), 0, 12)
            SliderValue.Position = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, width), 0, 12)
            moveconnection = mouse.Move:Connect(function()
                SliderValue.Text = Value
                Value = math.floor((((tonumber(max) - tonumber(min)) / width) * SliderInner.AbsoluteSize.X) + tonumber(min))
                pcall(function()
                    callback(Value)
                    SliderValue.Text = Value
                end)
                SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, width), 0, 12)
                SliderValue.Position = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, width), 0, 12)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    SliderValue.Text = Value
                    Value = math.floor((((tonumber(max) - tonumber(min)) / width) * SliderInner.AbsoluteSize.X) + tonumber(min))
                    pcall(function()
                        callback(Value)
                        SliderValue.Text = Value
                    end)
                    SliderInner.Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, width), 0, 12)
                    SliderValue.Position = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, width), 0, 12)
                    moveconnection:Disconnect()
                    releaseconnection:Disconnect()
                end
            end)
        end)
    end

    function window:CreateButton(text, callback)
        text = text or "Button"
        callback = callback or function() end

        local TextButton = Instance.new("TextButton")
        TextButton.Parent = Contianer
        TextButton.BackgroundColor3 = Color3.fromRGB(24, 24, 25)
        TextButton.BorderColor3 = Color3.fromRGB(55, 55, 56)
        TextButton.Position = UDim2.new(0.0298507456, 0, 0.0490196086, 0)
        TextButton.Size = UDim2.new(0, 60, 0, 25)
        TextButton.Font = Enum.Font.SourceSans
        TextButton.TextColor3 = Color3.fromRGB(203, 203, 204)
        TextButton.TextSize = 14.000
        TextButton.Text = text

        TextButton.MouseButton1Down:Connect(function()
            pcall(callback)
        end)
    end

    function window:CreateToggle(text, callback)
        local toggled = false
        text = text or "Toggle"
        callback = callback or function() end


        local Toggle = Instance.new("TextButton")
        Toggle.Name = "Toggle"
        Toggle.Parent = Contianer
        Toggle.BackgroundColor3 = Color3.fromRGB(24, 24, 25)
        Toggle.BorderColor3 = Color3.fromRGB(55, 55, 56)
        Toggle.Position = UDim2.new(0.03292666, 0, 0.11999996, 0)
        Toggle.Size = UDim2.new(0, 12, 0, 12)
        Toggle.Font = Enum.Font.SourceSans
        Toggle.Text = ("           "..text)
        Toggle.TextColor3 = Color3.fromRGB(203, 203, 204)
        Toggle.TextSize = 14.000
        Toggle.TextXAlignment = Enum.TextXAlignment.Left

        local function Fire()
            toggled = not toggled
            Toggle.BackgroundColor3 = toggled and Color3.fromRGB(60, 73, 255) or Color3.fromRGB(24, 24, 25)
            pcall(callback, toggled)
        end

        Toggle.MouseButton1Down:Connect(Fire)
    end
    return window
end

return library