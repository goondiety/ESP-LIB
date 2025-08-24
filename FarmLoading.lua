local G2L = {}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
G2L["1"]["Name"] = "AFKFarmOverlay"
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["1"]["ResetOnSpawn"] = false


G2L["Blur"] = Instance.new("BlurEffect", Lighting)
G2L["Blur"]["Size"] = 8
G2L["Blur"]["Name"] = "AFKFarmBlur"


local screenSize = workspace.CurrentCamera.ViewportSize
local frameSize = Vector2.new(screenSize.X * 0.7, screenSize.Y * 0.7)
local centerPosition = UDim2.new(0.5, 0, 0.5, 0)


G2L["s"] = Instance.new("ImageLabel", G2L["1"])
G2L["s"]["Name"] = "Shadow"
G2L["s"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["s"]["Position"] = centerPosition
G2L["s"]["Size"] = UDim2.fromOffset(frameSize.X + 30, frameSize.Y + 30)
G2L["s"]["BackgroundTransparency"] = 1.0
G2L["s"]["ZIndex"] = 0
G2L["s"]["Image"] = "rbxassetid://17290899982"


G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"]["Name"] = "MainFrame"
G2L["2"]["Active"] = true
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["2"]["Position"] = centerPosition
G2L["2"]["Size"] = UDim2.fromOffset(frameSize.X, frameSize.Y)
G2L["2"]["BackgroundTransparency"] = 1
G2L["2"]["BorderSizePixel"] = 0
G2L["2"]["ClipsDescendants"] = true
G2L["2"]["ZIndex"] = 1


G2L["MainCorner"] = Instance.new("UICorner", G2L["2"])
G2L["MainCorner"]["CornerRadius"] = UDim.new(0, 30)


G2L["BackgroundContainer"] = Instance.new("Frame", G2L["2"])
G2L["BackgroundContainer"]["Name"] = "BackgroundContainer"
G2L["BackgroundContainer"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["BackgroundContainer"]["BackgroundTransparency"] = 1
G2L["BackgroundContainer"]["ZIndex"] = 1

G2L["BgCorner"] = Instance.new("UICorner", G2L["BackgroundContainer"])
G2L["BgCorner"]["CornerRadius"] = UDim.new(0, 30)


G2L["Background"] = Instance.new("ImageLabel", G2L["BackgroundContainer"])
G2L["Background"]["Name"] = "Background"
G2L["Background"]["Size"] = UDim2.new(1.2, 0, 1.2, 0)  
G2L["Background"]["Position"] = UDim2.new(-0.1, 0, -0.1, 0)  
G2L["Background"]["BackgroundTransparency"] = 1
G2L["Background"]["Image"] = ""
G2L["Background"]["ScaleType"] = Enum.ScaleType.Crop
G2L["Background"]["ImageTransparency"] = 0.0  
G2L["Background"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["Background"]["ZIndex"] = 1

G2L["BgImageCorner"] = Instance.new("UICorner", G2L["Background"])
G2L["BgImageCorner"]["CornerRadius"] = UDim.new(0, 30)


G2L["BgOverlay"] = Instance.new("Frame", G2L["BackgroundContainer"])
G2L["BgOverlay"]["Name"] = "BgOverlay"
G2L["BgOverlay"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["BgOverlay"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 20)
G2L["BgOverlay"]["BackgroundTransparency"] = 0.5 
G2L["BgOverlay"]["ZIndex"] = 2

G2L["BgOverlayCorner"] = Instance.new("UICorner", G2L["BgOverlay"])
G2L["BgOverlayCorner"]["CornerRadius"] = UDim.new(0, 30)


for i = 1, 40 do
    local star = Instance.new("Frame", G2L["BackgroundContainer"])
    local size = math.random(1, 3)
    star.Size = UDim2.new(0, size, 0, size)
    star.Position = UDim2.new(math.random(), 0, math.random(), 0)
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BackgroundTransparency = math.random(3, 7) / 10
    star.BorderSizePixel = 0
    star.AnchorPoint = Vector2.new(0.5, 0.5)
    star.ZIndex = 3

    G2L["StarCorner" .. i] = Instance.new("UICorner", star)
    G2L["StarCorner" .. i]["CornerRadius"] = UDim.new(1, 0)

    local starGlow = Instance.new("ImageLabel", star)
    starGlow.Size = UDim2.new(2, 0, 2, 0)
    starGlow.Position = UDim2.new(-0.5, 0, -0.5, 0)
    starGlow.BackgroundTransparency = 1
    starGlow.Image = "rbxassetid://6947150722"
    starGlow.ImageTransparency = math.random(5, 8) / 10
    starGlow.ImageColor3 = Color3.fromRGB(255, 200, 200)
    starGlow.ZIndex = 4

  
    coroutine.wrap(function()
        while star and star.Parent do
            local duration = math.random(8, 15) / 10
            local targetTransparency = math.random(2, 8) / 10
            
            TweenService:Create(star, TweenInfo.new(duration), {
                BackgroundTransparency = targetTransparency,
                Rotation = math.random(0, 360)
            }):Play()
            
            TweenService:Create(starGlow, TweenInfo.new(duration), {
                ImageTransparency = targetTransparency + 0.2
            }):Play()
            
            wait(duration + math.random(0, 5) / 10)
        end
    end)()
end


G2L["ContentContainer"] = Instance.new("Frame", G2L["2"])
G2L["ContentContainer"]["Name"] = "ContentContainer"
G2L["ContentContainer"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["ContentContainer"]["BackgroundTransparency"] = 1
G2L["ContentContainer"]["ZIndex"] = 5


G2L["CloseButton"] = Instance.new("TextButton", G2L["ContentContainer"])
G2L["CloseButton"]["Name"] = "CloseButton"
G2L["CloseButton"]["Size"] = UDim2.new(0, 40, 0, 40)
G2L["CloseButton"]["Position"] = UDim2.new(1, -50, 0, 20)
G2L["CloseButton"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["CloseButton"]["BackgroundTransparency"] = 0.3
G2L["CloseButton"]["BackgroundColor3"] = Color3.fromRGB(200, 50, 50)
G2L["CloseButton"]["BorderSizePixel"] = 0
G2L["CloseButton"]["Text"] = ""
G2L["CloseButton"]["ZIndex"] = 10

G2L["CloseButtonCorner"] = Instance.new("UICorner", G2L["CloseButton"])
G2L["CloseButtonCorner"]["CornerRadius"] = UDim.new(0, 12)

G2L["CloseButtonStroke"] = Instance.new("UIStroke", G2L["CloseButton"])
G2L["CloseButtonStroke"]["Color"] = Color3.fromRGB(255, 100, 100)
G2L["CloseButtonStroke"]["Thickness"] = 2
G2L["CloseButtonStroke"]["Transparency"] = 0.4


G2L["CloseIcon"] = Instance.new("ImageLabel", G2L["CloseButton"])
G2L["CloseIcon"]["Name"] = "CloseIcon"
G2L["CloseIcon"]["Size"] = UDim2.new(0.6, 0, 0.6, 0)
G2L["CloseIcon"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
G2L["CloseIcon"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["CloseIcon"]["BackgroundTransparency"] = 1
G2L["CloseIcon"]["Image"] = "rbxassetid://133495621202705"
G2L["CloseIcon"]["ImageColor3"] = Color3.fromRGB(255, 255, 255)
G2L["CloseIcon"]["ZIndex"] = 11


G2L["TextContainer"] = Instance.new("Frame", G2L["ContentContainer"])
G2L["TextContainer"]["Name"] = "TextContainer"
G2L["TextContainer"]["Size"] = UDim2.new(1, 0, 0.7, 0)
G2L["TextContainer"]["Position"] = UDim2.fromScale(0.5, 0.35)
G2L["TextContainer"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["TextContainer"]["BackgroundTransparency"] = 1


G2L["TitleText"] = Instance.new("TextLabel", G2L["TextContainer"])
G2L["TitleText"]["Name"] = "TitleText"
G2L["TitleText"]["Size"] = UDim2.new(1, -60, 0, 80)
G2L["TitleText"]["Position"] = UDim2.fromScale(0.5, 0.15)
G2L["TitleText"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["TitleText"]["BackgroundTransparency"] = 1
G2L["TitleText"]["Font"] = Enum.Font.GothamBlack
G2L["TitleText"]["Text"] = "DO NOT TOUCH SCREEN"
G2L["TitleText"]["TextColor3"] = Color3.new(1, 1, 1)
G2L["TitleText"]["TextSize"] = 42
G2L["TitleText"]["TextWrapped"] = true
G2L["TitleText"]["TextStrokeTransparency"] = 0.8
G2L["TitleText"]["TextStrokeColor3"] = Color3.fromRGB(200, 0, 0)
G2L["TitleText"]["TextTransparency"] = 1


G2L["TitleGradient"] = Instance.new("UIGradient", G2L["TitleText"])
G2L["TitleGradient"]["Color"] = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 0))
})
G2L["TitleGradient"]["Rotation"] = 90


G2L["StatusText"] = Instance.new("TextLabel", G2L["TextContainer"])
G2L["StatusText"]["Name"] = "StatusText"
G2L["StatusText"]["Size"] = UDim2.new(1, -60, 0, 60)
G2L["StatusText"]["Position"] = UDim2.fromScale(0.5, 0.4)
G2L["StatusText"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["StatusText"]["BackgroundTransparency"] = 1
G2L["StatusText"]["Font"] = Enum.Font.GothamBold
G2L["StatusText"]["Text"] = "AFK Win Farm running..."
G2L["StatusText"]["TextColor3"] = Color3.new(1, 1, 1)
G2L["StatusText"]["TextSize"] = 32
G2L["StatusText"]["TextWrapped"] = true
G2L["StatusText"]["TextTransparency"] = 1


G2L["StatusGradient"] = Instance.new("UIGradient", G2L["StatusText"])
G2L["StatusGradient"]["Color"] = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 255, 150)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 255, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 50))
})
G2L["StatusGradient"]["Rotation"] = 90


G2L["CreatorText"] = Instance.new("TextLabel", G2L["TextContainer"])
G2L["CreatorText"]["Name"] = "CreatorText"
G2L["CreatorText"]["Size"] = UDim2.new(1, -60, 0, 50)
G2L["CreatorText"]["Position"] = UDim2.fromScale(0.5, 0.6)
G2L["CreatorText"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["CreatorText"]["BackgroundTransparency"] = 1
G2L["CreatorText"]["Font"] = Enum.Font.GothamBold
G2L["CreatorText"]["Text"] = "Made by Moondiety"
G2L["CreatorText"]["TextColor3"] = Color3.new(1, 1, 1)
G2L["CreatorText"]["TextSize"] = 28
G2L["CreatorText"]["TextWrapped"] = true
G2L["CreatorText"]["TextTransparency"] = 1


G2L["CreatorGradient"] = Instance.new("UIGradient", G2L["CreatorText"])
G2L["CreatorGradient"]["Color"] = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 230, 100)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 215, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 180, 0))
})
G2L["CreatorGradient"]["Rotation"] = 90


G2L["SupportText"] = Instance.new("TextLabel", G2L["TextContainer"])
G2L["SupportText"]["Name"] = "SupportText"
G2L["SupportText"]["Size"] = UDim2.new(1, -60, 0, 60)
G2L["SupportText"]["Position"] = UDim2.fromScale(0.5, 0.8)
G2L["SupportText"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["SupportText"]["BackgroundTransparency"] = 1
G2L["SupportText"]["Font"] = Enum.Font.GothamMedium
G2L["SupportText"]["Text"] = "Join discord to report bugs or suggestions"
G2L["SupportText"]["TextColor3"] = Color3.new(1, 1, 1)
G2L["SupportText"]["TextSize"] = 24
G2L["SupportText"]["TextWrapped"] = true
G2L["SupportText"]["TextTransparency"] = 1


G2L["SupportGradient"] = Instance.new("UIGradient", G2L["SupportText"])
G2L["SupportGradient"]["Color"] = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 255))
})
G2L["SupportGradient"]["Rotation"] = 90


G2L["DiscordContainer"] = Instance.new("Frame", G2L["ContentContainer"])
G2L["DiscordContainer"]["Name"] = "DiscordContainer"
G2L["DiscordContainer"]["Size"] = UDim2.new(1, 0, 0.2, 0)
G2L["DiscordContainer"]["Position"] = UDim2.fromScale(0.5, 0.85)
G2L["DiscordContainer"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["DiscordContainer"]["BackgroundTransparency"] = 1


G2L["DiscordButton"] = Instance.new("TextButton", G2L["DiscordContainer"])
G2L["DiscordButton"]["Name"] = "DiscordButton"
G2L["DiscordButton"]["Size"] = UDim2.new(0, 320, 0, 70)
G2L["DiscordButton"]["Position"] = UDim2.fromScale(0.5, 0.5)
G2L["DiscordButton"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["DiscordButton"]["Text"] = ""
G2L["DiscordButton"]["BackgroundTransparency"] = 0.1
G2L["DiscordButton"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 40)
G2L["DiscordButton"]["BorderSizePixel"] = 0
G2L["DiscordButton"]["AutoButtonColor"] = false
G2L["DiscordButton"]["ZIndex"] = 6

G2L["DiscordButtonCorner"] = Instance.new("UICorner", G2L["DiscordButton"])
G2L["DiscordButtonCorner"]["CornerRadius"] = UDim.new(0, 22)

G2L["DiscordButtonStroke"] = Instance.new("UIStroke", G2L["DiscordButton"])
G2L["DiscordButtonStroke"]["Color"] = Color3.fromRGB(88, 101, 242)
G2L["DiscordButtonStroke"]["Thickness"] = 3
G2L["DiscordButtonStroke"]["Transparency"] = 0.2


G2L["DiscordButtonText"] = Instance.new("TextLabel", G2L["DiscordButton"])
G2L["DiscordButtonText"]["Name"] = "DiscordButtonText"
G2L["DiscordButtonText"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["DiscordButtonText"]["BackgroundTransparency"] = 1
G2L["DiscordButtonText"]["Font"] = Enum.Font.GothamBlack
G2L["DiscordButtonText"]["Text"] = "Join Discord"
G2L["DiscordButtonText"]["TextColor3"] = Color3.new(1, 1, 1)
G2L["DiscordButtonText"]["TextSize"] = 36
G2L["DiscordButtonText"]["TextTransparency"] = 1
G2L["DiscordButtonText"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["DiscordButtonText"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)


G2L["DiscordGradient"] = Instance.new("UIGradient", G2L["DiscordButtonText"])
G2L["DiscordGradient"]["Color"] = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(88, 101, 242)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255)),
})
G2L["DiscordGradient"]["Rotation"] = 15
G2L["DiscordGradient"]["Offset"] = Vector2.new(-2, 0)


G2L["CopiedText"] = Instance.new("TextLabel", G2L["DiscordButton"])
G2L["CopiedText"]["Name"] = "CopiedText"
G2L["CopiedText"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["CopiedText"]["BackgroundTransparency"] = 1
G2L["CopiedText"]["Font"] = Enum.Font.GothamBold
G2L["CopiedText"]["Text"] = "Link Copied!"
G2L["CopiedText"]["TextColor3"] = Color3.fromRGB(100, 255, 150)
G2L["CopiedText"]["TextSize"] = 32
G2L["CopiedText"]["TextTransparency"] = 1
G2L["CopiedText"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["CopiedText"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)


task.spawn(function()
  
    TweenService:Create(G2L["Blur"], TweenInfo.new(1), {Size = 12}):Play()
    
  
    TweenService:Create(G2L["Background"], TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        ImageTransparency = 0.0  
    }):Play()
    
    TweenService:Create(G2L["BgOverlay"], TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.4 
    }):Play()
    

    task.wait(0.5)
    local textTweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    TweenService:Create(G2L["TitleText"], textTweenInfo, {TextTransparency = 0}):Play()
    task.wait(0.2)
    
    TweenService:Create(G2L["StatusText"], textTweenInfo, {TextTransparency = 0}):Play()
    task.wait(0.2)
    
    TweenService:Create(G2L["CreatorText"], textTweenInfo, {TextTransparency = 0}):Play()
    task.wait(0.2)
    
    TweenService:Create(G2L["SupportText"], textTweenInfo, {TextTransparency = 0}):Play()
    task.wait(0.3)
    
    TweenService:Create(G2L["DiscordButtonText"], textTweenInfo, {TextTransparency = 0}):Play()
end)

task.spawn(function()
    
    local titleTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    TweenService:Create(G2L["TitleText"], titleTweenInfo, {
        TextStrokeTransparency = 0.6
    }):Play()
    
  
    local statusColors = {
        Color3.fromRGB(100, 255, 150),
        Color3.fromRGB(150, 255, 100),
        Color3.fromRGB(100, 255, 150)
    }
    
    local statusIndex = 1
    while G2L["1"] and G2L["1"].Parent do
        statusIndex = statusIndex % #statusColors + 1
        local tween = TweenService:Create(G2L["StatusText"], TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            TextColor3 = statusColors[statusIndex]
        })
        tween:Play()
        task.wait(1.5)
    end
    
   
    local creatorTweenInfo = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    TweenService:Create(G2L["CreatorGradient"], creatorTweenInfo, {
        Rotation = 120
    }):Play()
    
 
    local supportTweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    TweenService:Create(G2L["SupportText"], supportTweenInfo, {
        TextTransparency = 0.2
    }):Play()
end)


task.spawn(function()
    local background = G2L["Background"]
    local offset = 0
    RunService.Heartbeat:Connect(function()
        if not G2L["1"] or not G2L["1"].Parent then return end
        offset = offset + 0.005
        
        background.Position = UDim2.new(-0.1 + math.sin(offset * 0.2) * 0.02, 0, -0.1 + math.cos(offset * 0.15) * 0.02, 0)
    end)
end)


G2L["DiscordButton"].MouseButton1Click:Connect(function()
   
    local originalSize = G2L["DiscordButton"].Size
    local pressTween = TweenService:Create(G2L["DiscordButton"], TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 300, 0, 65)
    })
    pressTween:Play()
    
    task.wait(0.1)
    
    local releaseTween = TweenService:Create(G2L["DiscordButton"], TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = originalSize
    })
    releaseTween:Play()
    
 
    if setclipboard then
        setclipboard("https://discord.gg/moondiety")
    end
    

    G2L["DiscordButtonText"].TextTransparency = 1
    G2L["CopiedText"].TextTransparency = 0
    

    local copiedTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local scaleTween = TweenService:Create(G2L["CopiedText"], copiedTweenInfo, {
        TextSize = 36
    })
    scaleTween:Play()
    
   
    task.wait(2)
    
    local revertTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(G2L["CopiedText"], revertTweenInfo, {
        TextTransparency = 1,
        TextSize = 32
    }):Play()
    
    TweenService:Create(G2L["DiscordButtonText"], revertTweenInfo, {
        TextTransparency = 0
    }):Play()
end)

G2L["CloseButton"].MouseButton1Click:Connect(function()
    
    local originalSize = G2L["CloseButton"].Size
    local pressTween = TweenService:Create(G2L["CloseButton"], TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 35, 0, 35)
    })
    pressTween:Play()
    
    task.wait(0.1)
    
    local releaseTween = TweenService:Create(G2L["CloseButton"], TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = originalSize
    })
    releaseTween:Play()
    

    local fadeTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
  
    TweenService:Create(G2L["Blur"], fadeTweenInfo, {Size = 0}):Play()
    TweenService:Create(G2L["Background"], fadeTweenInfo, {ImageTransparency = 1}):Play()
    TweenService:Create(G2L["BgOverlay"], fadeTweenInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(G2L["s"], fadeTweenInfo, {ImageTransparency = 1}):Play()
    TweenService:Create(G2L["2"], fadeTweenInfo, {BackgroundTransparency = 1}):Play()
    
  
    TweenService:Create(G2L["TitleText"], fadeTweenInfo, {TextTransparency = 1}):Play()
    TweenService:Create(G2L["StatusText"], fadeTweenInfo, {TextTransparency = 1}):Play()
    TweenService:Create(G2L["CreatorText"], fadeTweenInfo, {TextTransparency = 1}):Play()
    TweenService:Create(G2L["SupportText"], fadeTweenInfo, {TextTransparency = 1}):Play()
    TweenService:Create(G2L["DiscordButtonText"], fadeTweenInfo, {TextTransparency = 1}):Play()
    TweenService:Create(G2L["CloseButton"], fadeTweenInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(G2L["CloseIcon"], fadeTweenInfo, {ImageTransparency = 1}):Play()
    

    local shrinkTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    TweenService:Create(G2L["2"], shrinkTweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    
    TweenService:Create(G2L["s"], shrinkTweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    
    
    task.wait(0.6)
    
    
    if G2L["Blur"] then
        G2L["Blur"]:Destroy()
    end
    
   
    if G2L["1"] then
        G2L["1"]:Destroy()
    end
end)

task.spawn(function()
    local isDragging = false
    local dragStart, frameStart
    local mainFrame, shadow = G2L["2"], G2L["s"]
    
    G2L["ContentContainer"].InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging, dragStart, frameStart = true, input.Position, mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and isDragging then
            local delta = input.Position - dragStart
            local newPosition = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + delta.X, frameStart.Y.Scale, frameStart.Y.Offset + delta.Y)
            mainFrame.Position = newPosition
            shadow.Position = newPosition
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)
end)


task.spawn(function()
    local gradient = G2L["DiscordGradient"]
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
    TweenService:Create(gradient, tweenInfo, { Offset = Vector2.new(2, 0) }):Play()
end)


G2L["CloseButton"].MouseEnter:Connect(function()
    TweenService:Create(G2L["CloseButton"], TweenInfo.new(0.2), {
        BackgroundTransparency = 0.1,
        BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    }):Play()
end)

G2L["CloseButton"].MouseLeave:Connect(function()
    TweenService:Create(G2L["CloseButton"], TweenInfo.new(0.2), {
        BackgroundTransparency = 0.3,
        BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    }):Play()
end)

return G2L["1"]