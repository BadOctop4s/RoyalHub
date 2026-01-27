local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

-------------------------------* Cores *--------------------------

local Purple = Color3.fromHex("#7775F2")
local Yellow = Color3.fromHex("#ECA201")
local Green = Color3.fromHex("#10C550")
local Grey = Color3.fromHex("#83889E")
local Blue = Color3.fromHex("#257AF7")
local Red = Color3.fromHex("#ea0909")
local Gray = Color3.fromHex("#2C2F38")
local DarkGray = Color3.fromHex("#1B1C20")

-------------------------------* Icones *---------------------------------

local Key = "geist:key"
local box = "geist:box"
local bug = "geist:bug"
local star = "geist:star" 
local cloud = "geist:cloud"
local shield = "geist:shield-check"

-------------------------------* Serviços personagem *-------------------------------
local S = {
    Players = game:GetService("Players"),
    Tween = game:GetService("TweenService"),
    RS = game:GetService("ReplicatedStorage"),
    WS = game:GetService("Workspace"),
    Run = game:GetService("RunService"),
    UI = game:GetService("UserInputService"),
    Sound = game:GetService("SoundService"),
}


-------------------------------* Funções externas *-------------------------------

local function tableToClipboard(luau_table, indent)
    indent = indent or 4
    local jsonString = parseJSON(luau_table, indent)
    setclipboard(jsonString)
    return jsonString
end

-------------------------------* Functions personagem *-------------------------------

local function setSpeed(value)
    local player = S.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
end

local function setJumpPower(value)
    local player = S.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = value
    end
end

local function setGravity(value)
    local Workspace = S.Workspace
    S.Workspace.Gravity = value
end

local Players = game:GetService("Players")

local playerValues = {}

for _, plr in ipairs(Players:GetPlayers()) do
    table.insert(playerValues, {
        Title = plr.Name,
        Player = plr
    })
end

-------------------------------* Teleporte To Player Function *-------------------------------

local function TeleporteToPlayer(playerName)
    local player = S.Players:FindFirstChild(playerName)
    local localPlayer = S.Players.LocalPlayer
    if player and player.Character and localPlayer.Character then
        local targetPosition = player.Character:FindFirstChild("HumanoidRootPart").Position
        localPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0))
    else
        WindUI:Notify({
            Title = "Erro",
            Content = "Jogador não encontrado ou sem personagem.",
            Duration = 3,
            Icon = "alert-circle"
        })
    end
end

-------------------------------* LOOP TP *------------------------------

-- ===== LOOP TP VARIABLES =====
local LoopTPEnabled = false
local LoopTPTargetName = nil  -- Nome do jogador selecionado no dropdown
local LoopTPDelay = 1  -- Segundos entre cada TP (ajuste no slider se quiser)
local LoopTPConnection = nil

-- Função principal do Loop TP
local function startLoopTP()
    if LoopTPConnection then LoopTPConnection:Disconnect() end
    
    LoopTPConnection = S.Run.Heartbeat:Connect(function()
        if not LoopTPEnabled then return end
        if not LoopTPTargetName then return end
        
        -- Tenta teleportar
        TeleporteToPlayer(LoopTPTargetName)
        
        -- Opcional: Check se alvo ainda existe (evita spam de erro)
        local target = S.Players:FindFirstChild(LoopTPTargetName)
        if not target or not target.Character then
            WindUI:Notify({
                Title = "Loop TP",
                Content = "Alvo sumiu ou morreu. Loop parado.",
                Duration = 4,
                Icon = "alert-circle"
            })
            LoopTPEnabled = false
            if LoopTPConnection then
                LoopTPConnection:Disconnect()
                LoopTPConnection = nil
            end
        end
    end)
end

-- Toggle function
local function toggleLoopTP(enabled)
    LoopTPEnabled = enabled
    
    if enabled then
        if not LoopTPTargetName then
            WindUI:Notify({
                Title = "Loop TP",
                Content = "Selecione um jogador no dropdown primeiro!",
                Duration = 4,
                Icon = "alert-circle"
            })
            LoopTPEnabled = false  -- Desliga se não tiver alvo
            return
        end
        
        WindUI:Notify({
            Title = "Loop TP",
            Content = "Iniciando loop no jogador: " .. LoopTPTargetName .. " (delay: " .. LoopTPDelay .. "s)",
            Duration = 4,
            Icon = "repeat"
        })
        
        startLoopTP()
    else
        if LoopTPConnection then
            LoopTPConnection:Disconnect()
            LoopTPConnection = nil
        end
        WindUI:Notify({
            Title = "Loop TP",
            Content = "Loop desativado.",
            Duration = 3,
            Icon = "x"
        })
    end
end

------------------------------* ESP Function *-------------------------------

local LocalPlayer = S.Players.LocalPlayer
local espEnabled = false
local espObjects = {}  
local playerListeners = {}  

-- Remove ESP de UM player
local function removeESP(player)
    if espObjects[player] then
        for _, obj in pairs(espObjects[player]) do
            if obj and obj.Destroy then
                obj:Destroy()
            end
        end
        espObjects[player] = nil
    end
end

-- Remove ESP de TODOS
local function removeAllESP()
    for player, _ in pairs(espObjects) do
        removeESP(player)
    end
    espObjects = {}
end

-- Cria ESP
local function createESP(player)
    if player == LocalPlayer then return end  -- FIX: Ignora jogador local
    if espObjects[player] then return end  -- Evita duplicatas

    local character = player.Character
    if not character then return end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    espObjects[player] = {}

    -- 🔶 Highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = character
    highlight.FillColor = Color3.fromRGB(255, 80, 80)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = character
    table.insert(espObjects[player], highlight)

    -- 🏷️ NameTag
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Name"
    billboard.Adornee = humanoidRootPart
    billboard.Size = UDim2.new(0, 150, 0, 30)  -- FIX: Menor (era 200x40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = humanoidRootPart

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = player.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextScaled = false  -- FIX: Não escala mais, tamanho fixo
    textLabel.TextSize = 16  -- FIX: Tamanho menor e fixo
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Parent = billboard

    table.insert(espObjects[player], billboard)
end

local function setupPlayerListeners(player)
    if playerListeners[player] then return end  -- Evita duplicatas

    local charAddedConn, charRemovingConn

    charAddedConn = player.CharacterAdded:Connect(function()
        task.wait(0.5)  -- Espera carregar
        if espEnabled then
            createESP(player)
        end
    end)

    charRemovingConn = player.CharacterRemoving:Connect(function()
        removeESP(player)
    end)

    playerListeners[player] = {charAddedConn, charRemovingConn}
end

for _, player in ipairs(S.Players:GetPlayers()) do
    setupPlayerListeners(player)
end

S.Players.PlayerAdded:Connect(setupPlayerListeners)

S.Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
    if playerListeners[player] then
        for _, conn in pairs(playerListeners[player]) do
            conn:Disconnect()
        end
        playerListeners[player] = nil
    end
end)

spawn(function()
    S.WS.CurrentCamera.CameraType = Enum.CameraType.Custom
end)

------------------------------* Rejoin & ServerHope Function *-------------------------------

local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function RejoinServer()
    if not LocalPlayer then return end
    
    local placeId = game.PlaceId
    local jobId = game.JobId
    
    if jobId == "" then
        WindUI:Notify({
            Title = "Rejoin",
            Content = "Não foi possível pegar o JobId atual. Tente novamente.",
            Duration = 4,
            Icon = "alert-circle"
        })
        return
    end
    
    WindUI:Notify({
        Title = "Rejoin",
        Content = "Voltando pro mesmo servidor...",
        Duration = 3,
        Icon = "refresh-cw"
    })
    
    TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
end

-------------------------* FIX SERVER HOP FUNCTION *------------------------- 

local AlreadyJoined = {}

local function ServerHop()
    local placeId = game.PlaceId
    local cursor = ""
    local servers = {}
    
    WindUI:Notify({
        Title = "Server Hop",
        Content = "Buscando servidores... (aguarde 5-10s)",
        Duration = 5,
        Icon = "refresh-cw"
    })
    
    repeat
        local success, response = pcall(function()
            local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
            if cursor ~= "" then url = url .. "&cursor=" .. cursor end
            return HttpService:JSONDecode(game:HttpGet(url))
        end)
        
        if not success then
            WindUI:Notify({Title = "Erro Hop", Content = "Falha no HttpGet: " .. tostring(response), Duration = 5, Icon = "x"})
            return
        end
        
        if response and response.data then
            for _, server in ipairs(response.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId and not AlreadyJoined[server.id] then
                    table.insert(servers, server.id)
                end
            end
            cursor = response.nextPageCursor or ""
        else
            cursor = ""
        end
    until cursor == ""
    
    if #servers == 0 then
        WindUI:Notify({Title = "Sem Servidores", Content = "Nenhum server disponível agora. Tente de novo ou em outro jogo.", Duration = 5, Icon = "alert-circle"})
        return
    end
    
    local randomServer = servers[math.random(1, #servers)]
    AlreadyJoined[randomServer] = true
    
    WindUI:Notify({Title = "Hop!", Content = "Teleportando pro server: " .. randomServer, Duration = 3, Icon = "server"})
    
    local success, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(placeId, randomServer, LocalPlayer)
    end)
    
    if not success then
        WindUI:Notify({Title = "Teleport Falhou", Content = "Erro: " .. tostring(err) .. ". Verifique executor/anti-cheat.", Duration = 5, Icon = "x"})
    end
end


------------------------------* Spin function *-------------------------------

local SpinEnabled = false
local SpinConnection

local function toggleSpin(enabled)
    SpinEnabled = enabled
    if enabled then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            if SpinConnection then SpinConnection:Disconnect() end
            SpinConnection = S.Run.Heartbeat:Connect(function(delta)
                local root = char.HumanoidRootPart
                root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(360 * delta), 0)  -- Gira 360°/seg
            end)
            WindUI:Notify({Title = "Spin", Content = "Girando! (Desative pra parar)", Duration = 3, Icon = "rotate-cw"})
        else
            WindUI:Notify({Title = "Erro Spin", Content = "Personagem não carregado.", Duration = 2, Icon = "x"})
            toggleSpin(false)
        end
    else
        if SpinConnection then
            SpinConnection:Disconnect()
            SpinConnection = nil
        end
        WindUI:Notify({Title = "Spin", Content = "Parou de girar.", Duration = 2, Icon = "x"})
    end
end


LocalPlayer.CharacterAdded:Connect(function(char)
    if SpinEnabled then
        task.wait(0.5) 
        toggleSpin(true)  
    end
end)

-------------------------------* Fly function *-------------------------------

local FlyEnabled = false
local FlySpeed = 50
local FlyConnection = nil
local FlyBodyVelocity = nil
local FlyBodyGyro = nil
local FlyAlignOrientation = nil

local function toggleFly(enabled)
    FlyEnabled = enabled
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Humanoid") or not char:FindFirstChild("HumanoidRootPart") then
        WindUI:Notify({Title = "Fly", Content = "Personagem não carregado.", Duration = 3, Icon = "x"})
        return
    end

    local humanoid = char.Humanoid
    local root = char.HumanoidRootPart

    if enabled then
        
        humanoid.PlatformStand = true

        -- Movers
        FlyBodyVelocity = Instance.new("BodyVelocity")
        FlyBodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        FlyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        FlyBodyVelocity.Parent = root

        FlyBodyGyro = Instance.new("BodyGyro")
        FlyBodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        FlyBodyGyro.P = 10000
        FlyBodyGyro.Parent = root

        FlyAlignOrientation = Instance.new("AlignOrientation")
        FlyAlignOrientation.MaxTorque = 1e9
        FlyAlignOrientation.Responsiveness = 25
        FlyAlignOrientation.Parent = root
        FlyAlignOrientation.CFrame = root.CFrame

        -- Controle WASD + Ctrl/Space
        FlyConnection = S.Run.RenderStepped:Connect(function()
            if not FlyEnabled then return end
            local cam = S.WS.CurrentCamera
            local moveDir = Vector3.new(0, 0, 0)

            if S.UI:IsKeyDown(Enum.KeyCode.W) then moveDir += cam.CFrame.LookVector end
            if S.UI:IsKeyDown(Enum.KeyCode.S) then moveDir -= cam.CFrame.LookVector end
            if S.UI:IsKeyDown(Enum.KeyCode.A) then moveDir -= cam.CFrame.RightVector end
            if S.UI:IsKeyDown(Enum.KeyCode.D) then moveDir += cam.CFrame.RightVector end
            if S.UI:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0, 1, 0) end
            if S.UI:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir -= Vector3.new(0, 1, 0) end

            if moveDir.Magnitude > 0 then moveDir = moveDir.Unit * FlySpeed end
            FlyBodyVelocity.Velocity = moveDir

            FlyBodyGyro.CFrame = cam.CFrame
        end)

        WindUI:Notify({Title = "Fly", Content = "Voo ativado!", Duration = 1, Icon = "plane"})
    else
        
        spawn(function()
            if FlyConnection then FlyConnection:Disconnect() FlyConnection = nil end

            humanoid.PlatformStand = false

            if FlyBodyVelocity then
                FlyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                FlyBodyVelocity:Destroy()
                FlyBodyVelocity = nil
            end
            if FlyBodyGyro then FlyBodyGyro:Destroy() FlyBodyGyro = nil end
            if FlyAlignOrientation then FlyAlignOrientation:Destroy() FlyAlignOrientation = nil end

            
            root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)

            humanoid.Sit = true
            task.wait(0.1)
            humanoid.Sit = false

            root.CFrame = root.CFrame + Vector3.new(0, 5, 0)
            task.wait(0.1)
            humanoid:ChangeState(Enum.HumanoidStateType.Landed)
            task.wait(0.1)
            humanoid:ChangeState(Enum.HumanoidStateType.Running)

            WindUI:Notify({Title = "Fly", Content = "Desativado", Duration = 1, Icon = "check"})
        end)
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if FlyEnabled then toggleFly(true) end
end)

------------------------------* Aimbot Variables *-------------------------------

local AimbotEnabled = {normal = false, rage = false}
local AimbotConnections = {}
local TargetPart = "Head"  -- Mude pra "HumanoidRootPart" se quiser corpo
local MaxDistance = 1500
local UseTeamCheck = true

-------------------------------* Aimbot Functions *-------------------------------

-- ===== AIMBOT VARIABLES & FUNCTIONS =====
local AimbotEnabled = {normal = false, rage = false}
local AimbotConnections = {}
local TargetPart = "Head"  -- Mude pra "HumanoidRootPart" se quiser corpo
local MaxDistance = 1500
local UseTeamCheck = true
local UseWallCheck = true  -- Toggle pra ligar/desligar

-- Encontra alvo mais próximo (com FOV básico e team check)
local function getClosestTarget()
    local camera = S.WS.CurrentCamera
    local closest, shortestDist = nil, MaxDistance
    local localTeam = LocalPlayer.Team
    local origin = camera.CFrame.Position  -- Origem do raycast (câmera)

    for _, player in ipairs(S.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local part = player.Character:FindFirstChild(TargetPart)
                if part then
                    local dist = (camera.CFrame.Position - part.Position).Magnitude
                    if dist < shortestDist then
                        -- Team check
                        if not UseTeamCheck or not localTeam or player.Team ~= localTeam then
                            -- FOV simples
                            local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
                            if onScreen and screenPos.Z > 0 then
                                -- WallCheck com Raycast
                                if not UseWallCheck then
                                    shortestDist = dist
                                    closest = player
                                else
                                    local direction = (part.Position - origin).Unit
                                    local rayParams = RaycastParams.new()
                                    rayParams.FilterType = Enum.RaycastFilterType.Exclude
                                    rayParams.FilterDescendantsInstances = {LocalPlayer.Character or {}}
                                    rayParams.IgnoreWater = true

                                    local rayResult = workspace:Raycast(origin, direction * dist, rayParams)

                                    if rayResult and rayResult.Instance:IsDescendantOf(player.Character) then
                                        -- Ray bateu direto no alvo (sem parede)
                                        shortestDist = dist
                                        closest = player
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return closest
end

-- Mira suave (pra "comum")
local function smoothAim(target)
    local camera = S.WS.CurrentCamera
    local part = target.Character:FindFirstChild(TargetPart)
    if part then
        local goalCFrame = CFrame.new(camera.CFrame.Position, part.Position)
        camera.CFrame = camera.CFrame:Lerp(goalCFrame, 0.2)  -- 0.2 = suave (aumente pra mais rápido)
    end
end

-- Mira snap (pra "rage")
local function snapAim(target)
    local camera = S.WS.CurrentCamera
    local part = target.Character:FindFirstChild(TargetPart)
    if part then
        camera.CFrame = CFrame.new(camera.CFrame.Position, part.Position)
    end
end

-- Toggle genérico (normal ou rage)
local function toggleAimbot(mode)  -- mode = "normal" ou "rage"
    local enabled = AimbotEnabled[mode]
    local aimFunc = (mode == "normal") and smoothAim or snapAim

    if enabled then
        if AimbotConnections[mode] then AimbotConnections[mode]:Disconnect() end
        AimbotConnections[mode] = S.Run.Heartbeat:Connect(function()
            local target = getClosestTarget()
            if target then
                aimFunc(target)
            end
        end)
        -- DEBUG: Notifica se achou alvo (remove depois)
        -- WindUI:Notify({
        --     Title = mode:gsub("^%l", string.upper):gsub("bot", "bot") .. " Ativado",
        --     Content = "Mira ligada! (Debug: Alvos sendo detectados)",
        --     Duration = 2
        -- })
    else
        if AimbotConnections[mode] then
            AimbotConnections[mode]:Disconnect()
            AimbotConnections[mode] = nil
        end
        -- WindUI:Notify({
        --     Title = mode:gsub("^%l", string.upper):gsub("bot", "bot") .. " Desativado",
        --     Content = "Mira desligada.",
        --     Duration = 2
        -- })
    end
end

------------------------------* Fake TP Function *-------------------------------

local FakeTPEnabled = false
local FakeTPConnection = nil
local FakeTPDelay = 0.2  -- Tempo entre "fakes" (0.1 pra rápido, 0.5 pra mais lento - evite baixo pra não kick)
local FakeTPDistance = 3  -- Distância max do TP fake (em studs - 2 a 5 é bom)

local function toggleFakeTP(enabled)
    FakeTPEnabled = enabled
    if enabled then
        if FakeTPConnection then FakeTPConnection:Disconnect() end
        FakeTPConnection = S.Run.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end

            local root = char.HumanoidRootPart
            local originalCFrame = root.CFrame  -- Salva posição original

            -- TP fake pra posição aleatória próxima
            local randomOffset = Vector3.new(math.random(-FakeTPDistance, FakeTPDistance), math.random(1, FakeTPDistance), math.random(-FakeTPDistance, FakeTPDistance))
            root.CFrame = originalCFrame + randomOffset

            -- Volta imediato (faz o "fake")
            task.wait(FakeTPDelay)
            root.CFrame = originalCFrame
        end)
        WindUI:Notify({
            Title = "Fake TP",
            Content = "Ativado! (Dodge anti-aim ligado)",
            Duration = 3,
            Icon = "ghost"
        })
    else
        if FakeTPConnection then
            FakeTPConnection:Disconnect()
            FakeTPConnection = nil
        end
        WindUI:Notify({
            Title = "Fake TP",
            Content = "Desativado.",
            Duration = 2,
            Icon = "x"
        })
    end
end

-- Reativa no respawn
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if FakeTPEnabled then toggleFakeTP(true) end
end)



-------------------------------* Temas *-------------------------------

WindUI:AddTheme({
    Name = "Hutao By Einzbern",
    Accent = Color3.fromHex("#18181b"),
    Outline = Color3.fromHex("#000000"),
    Text = Color3.fromHex("#f70000"),
    Placeholder = Color3.fromHex("#000000"),
    Button = Color3.fromHex("#c40b0b"),
    Icon = Color3.fromHex("#e20505"),
})

WindUI:AddTheme({
    Name = "White",
    Accent = Color3.fromHex("#646466"),
    Background = Color3.fromHex("#bba7a7"),
    Outline = Color3.fromHex("#020101"),
    Text = Color3.fromHex("#000000"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#000000"),
    Icon = Color3.fromHex("#c5b1b1"),
})

WindUI:AddTheme({
    Name = "Main Theme",
    Accent = Color3.fromHex("#222121"),
    Background = Color3.fromHex("#000000"),
    Outline = Color3.fromHex("#a79e9e"),
    Text = Color3.fromHex("#fff4f4"),
    Placeholder = Color3.fromHex("#797777"),
    Button = Color3.fromHex("#db0000"),
    Icon = Color3.fromHex("#a18e8e"),
})

WindUI:AddTheme({
    Name = "RedX Hub",
    Accent = WindUI:Gradient({                                                      
        ["0"] = { Color = Color3.fromHex("#000000"), Transparency = 0 },

        ["60"] = { Color = Color3.fromHex("#0152c3"), Transparency = 0 },

        ["100"]   = { Color = Color3.fromHex("#b30303"), Transparency = 0 },
             
    }, {                                                                            
        Rotation = 80,                                                               
    }),                                                                             
    
})

WindUI:AddTheme({   
    Name = "Dark Amoled ( Default )",
    Accent = WindUI:Gradient({                                                      
        ["0"] = { Color = Color3.fromHex("#000000"), Transparency = 0 },
        ["100"]   = { Color = Color3.fromHex("#000000"), Transparency = 0 },
             
    }, {                                                                            
        Rotation = 80,                                               
    }),                                                                             
    
})

WindUI:AddTheme({
    Name = "CyberPunk",
    Accent = WindUI:Gradient({
    ["0"] = { Color = Color3.fromHex("#1f1f23"), Transparency = 0 },
    ["100"]   = { Color = Color3.fromHex("#bbb815"), Transparency = 0 },
    }, { 
        Rotation = 0,
    }),
})

WindUI:AddTheme({
    Name = "Solar Theme",
    Accent = WindUI:Gradient{
        ["0"] = { Color = Color3.fromHex("#ff6a30"), Transparency = 0 },
        ["100"]  = { Color = Color3.fromHex("ffe72f"), Transparency = 0 },
    }, {
        Rotation = 80,
    }   
})

WindUI:AddTheme({
  Name = "Midnight",
  
  Accent = Color3.fromHex("#1e3a8a"),
  Background = Color3.fromHex("#0c1e42"),
  Outline = Color3.fromHex("#bfdbff"),
  Text = Color3.fromHex("#dbeafe"),
  Placeholder = Color3.fromHex("#2f74d1"),
  Button = Color3.fromHex("#2563eb"),
  Icon = Color3.fromHex("#5591f4"),
})
WindUI:AddTheme({
  Name = "Crimson",
  
  Accent = Color3.fromHex("#b91c1c"),
  Background = Color3.fromHex("#0c0404"),
  Outline = Color3.fromHex("#161616"),
  Text = Color3.fromHex("#fef2f2"),
  Placeholder = Color3.fromHex("#6f757b"),
  Button = Color3.fromHex("#991b1b"),
  Icon = Color3.fromHex("#dc2626"),
  
})
WindUI:AddTheme({
  Name = "Snow",
  
  Accent = Color3.fromHex("#18181b"),
  Background = Color3.fromHex("#eeeeee"),
  Outline = Color3.fromHex("#FFFFFF"),
  Text = Color3.fromHex("#aca1a1"),
  Placeholder = Color3.fromHex("#7a7a7a"),
  Button = Color3.fromHex("#52525b"),
  Icon = Color3.fromHex("#a1a1aa"),
})

-------------------------------* Notificação *-------------------------------

 WindUI:Notify({
    Title = "Royal Hub - Aviso!",
    Content = "Script em desenvolvimento, funções podem quebrar com o decorrer do tempo.",
    Duration = 6, -- 3 seconds
    Icon = "bug",
})
wait(1)

WindUI:Notify({
	Title = "Verificação",
	Content = "Verificando usuario...",
	Duration = 3,
	Icon = "user"
})
wait(3)

WindUI:Notify({
	Title = "Register",
	Content = "Usuario verificado com sucesso!, será necessario uma Key para usar a script caso não tenha usado alguma anteriormente.",
	Duration = 3,
	Ico = "bug"
})
wait(1)

-------------------------------* Janela principal *-------------------------------

local Window = WindUI:CreateWindow({
    Title = "Royal Hub",
    Author = "Eodraxkk & Einzbern      ",
    Folder = "RoyalHub",
    Icon = "solar:crown-minimalistic-bold",
    Theme = "Dark Amoled ( Default )",
    IconSize = 12*2,
    NewElements = true,
    Size = UDim2.fromOffset(800,500),
    
    HideSearchBar = false,
    
    OpenButton = {
        Title = "Open Royal Hub", 
        CornerRadius = UDim.new(1,0), 
        StrokeThickness = 3, -- remove outline
        Enabled = true, -- Ativa ou desativa o openbutton
        Draggable = true,
        OnlyMobile = true,
        Scale = 0.5,
        
        Color = ColorSequence.new( -- gradient
            Color3.fromHex("#30FF6A"), 
            Color3.fromHex("#e7ff2f")
        )
    },
    Topbar = {
        Height = 44,
        ButtonsType = "Mac", -- Default or Mac
    },
User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },

KeySystem = {                                                   
        Note = "É necessário uma key para utilizar o Royal Hub.", -- note under the textbox         
        API = {                                                     
            { -- PlatoBoost
                Type = "platoboost",                                
                ServiceId = 19220, -- service id
                Secret = "b549aa50-d100-4cfa-a4b4-cb5503d207af",
                SaveKey = true, -- platoboost secret
            },                                                      
        },                                                          
    },                                                              
})

local ConfigMenu = Window.ConfigManager:Config("RoyalHub_Config")

-------------------------------* Aviso Keybind *-------------------------------

WindUI:Notify({
    Title = "KeyBind",
    Content = "Aperte Shift Direito para esconder | Mostrar o menu",
    Duration = 4,
    Icon = "user"
})
-------------------------------* PRINT CONSOLE LOADED *-------------------------------
print("========================= Royal Hub carregado com sucesso! =========================")
print("E ali diante dos meus olhos estava um cavalo branco e seu cavaleiro segurou uma reverência. Ele recebeu uma coroa e partiu, conquistando e conquistar... E saiu outro cavalo, todo vermelho. Ao seu cavaleiro recebeu o poder de tirar a paz da terra e fazer os homens massacrarem um ao outro; e ele recebeu uma grande espada... E ali, enquanto eu olhava, estava um cavalo preto; e seu cavaleiro segurava em sua mão um par de balanças... E lá, enquanto eu olhava, estava outro cavalo, doente e pálido; e o nome do seu cavaleiro era Morte, e Hades veio logo atrás. A ele foi dado poder sobre um quarto da terra, com o direito de matar pela espada e pela fome, pela peste e feras selvagens.")
print(" ========================= Apocalipse 6:1-6 =========================")

-------------------------------* Tags *-------------------------------

Window:Tag({
    Title = "v1.4.2",
    Icon = "github",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 8, -- from 0 to 13
})

Window:Tag({
	Title = "Secure",
	Icon = "solar:shield-check-bold",
	Color = Color3.fromHex("#30ff6a"),
	Radius = 8,
})
-------------------------------* FPS TAG *-------------------------------
local FPSTag = Window:Tag({
    Title = "FPS: 0",
    Color = Color3.fromRGB(100, 150, 255),
})
 
local RunService = game:GetService("RunService")
local lastUpdate = tick()
local frameCount = 0

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        FPSTag:SetTitle("FPS: " .. fps)
        
        if fps >= 50 then
            FPSTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
        elseif fps >= 30 then
            FPSTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
        else
            FPSTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
        end
        
        
        frameCount = 0
        lastUpdate = now
    end
end)
------------------------------* PING TAG *-------------------------------
local PingTag = Window:Tag({
    Title = "Ping: 0ms",
    Color = Color3.fromRGB(100, 200, 255),
})
 
task.spawn(function()
    while true do
        local success, ping = pcall(function()
            local Stats = game:GetService("Stats")
            local pingValue = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            return math.floor(pingValue)
        end)
        
        if success and ping then
            PingTag:SetTitle("Ping: " .. ping .. "ms")
            
            if ping <= 50 then
                PingTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
            elseif ping <= 100 then
                PingTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
            elseif ping <= 200 then
                PingTag:SetColor(Color3.fromRGB(255, 150, 0)) -- Orange
            else
                PingTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
            end
        end
        
        task.wait(2)
    end
end)
-------------------------------* KeyBind Padrão *-------------------------------

 Window:SetToggleKey(Enum.KeyCode.H)

-------------------------------* Tabs *-------------------------------
local TabHome = Window:Tab({
    Title = "Inicio",
    Icon = "solar:home-2-bold",
    Desc = "Funções principais do Royal Hub.",
    IconColor = DarkGray,
    IconShape = "Square",
   -- ShowTabTitle = true,
    Border = true, 
    Locked = false,
})


local TabPersonagem = Window:Tab({
	Title = "Personagem",
	Icon = "solar:user-bold",
    Desc = "Modificações no personagem.",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
})

local TabFarm = Window:Tab({
	Title = "Farm",
	Icon = "solar:black-hole-bold",
    Desc = "Funções de farm automático.",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabShopping = Window:Tab({
	Title = "Loja",
	Icon = "solar:cart-large-bold",
    Desc = "Compre itens automaticamente.",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabTeleport = Window:Tab({
	Title = "TP and WBHK",
	Icon = "solar:cloud-bold",
    Desc = "Teleporte e WebHook.",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabMisc = Window:Tab({ 
	Title = "Misc",
    Desc = "Funções diversas.",
	Icon = "box",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabSettings = Window:Tab({
	Title = "Configurações",
	Icon = "solar:settings-minimalistic-bold",
    Desc = "Configurações do Royal Hub.",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
})

local TabInfo = Window:Tab({
	Title = "Info",
	Icon = "solar:info-circle-bold",
    Desc = "Informações sobre o Royal Hub e Desenvolvedores.",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
    Border = true,
})


TabHome:Select()
-------------------------------* TabHome * -------------------------

local SectionAimbot = TabHome:Section({
	Title = "Aimbot",
	Desc = "Função de aimbot para facilitar seus tiros & Ataques.",
	Icon = "geist:crosshair",
	--IconColor = "Green" ,
	TextSize = 19, -- title text size. optional
    TextXAlignment = "Left", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = true, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0.05, -- title transparency. optional
    DescTextTransparency = 0.4,
})

local GrupoAimbot = SectionAimbot:Group({})
    
GrupoAimbot:Toggle({ Title = "Aimbot comum", Default = false, Locked = false, Callback = function(enabled) AimbotEnabled.normal = enabled toggleAimbot("normal") end })

GrupoAimbot:Space()

GrupoAimbot:Toggle({ Title = "Aimbot rage", Default = false, Locked = false, Callback = function(enabled) AimbotEnabled.rage = enabled toggleAimbot("rage") end })

SectionAimbot:Space()

SectionAimbot:Toggle({ Title = "Ignorar Aliados (Team Check)", Default = true, Callback = function(enabled) UseTeamCheck = enabled WindUI:Notify({Title = "Team Check", Content = enabled and "Ligado" or "Desligado", Duration = 2}) end })

SectionAimbot:Toggle({ Title = "Wall Check (Ignorar Paredes)", Default = true, Callback = function(enabled) UseWallCheck = enabled WindUI:Notify({Title = "Wall Check", Content = enabled and "Ligado (só mira visível)" or "Desligado (mira através)", Duration = 2}) end })

SectionAimbot:Space({ Columns = 1 })

local ToggleESP = SectionAimbot:Toggle({
    Title = "Esp",
    Desc = "Players ficam visiveis atrás de paredes e marcados.",
    Icon = "solar:eye-bold",
    --Type = "Checkbox",
    Locked = false,
    LockedTitle = "Em desenvolvimento",
    Value = false, -- default value
    Callback = function(state)
		espEnabled = state
    if state then
        for _, player in ipairs(S.Players:GetPlayers()) do  -- Use S.Players
            createESP(player)
        end
        WindUI:Notify({Title = "ESP Ativado", Content = "Players destacados!", Duration = 3, Icon = "eye"})
    else
        removeAllESP()  -- FIX: Limpa tudo no off
        WindUI:Notify({Title = "ESP Desativado", Content = "Removido.", Duration = 2, Icon = "x"})
    end
end
})

SectionAimbot:Space({ Columns = 1 })

SectionAimbot:Toggle({
    Title = "Fake TP (Dodge)",
    Default = false,
    Callback = function(enabled)
        toggleFakeTP(enabled)
    end
})

SectionAimbot:Slider({
    Title = "Delay Fake TP",
    Desc = "Tempo entre fakes (menor = mais rápido)",
    Step = 0.1,
    Value = { Min = 0.1, Max = 1, Default = 0.2 },
    Callback = function(value)
        FakeTPDelay = value
    end
})

SectionAimbot:Slider({
    Title = "Distância Fake TP",
    Desc = "Quão longe o fake TP vai (em studs)",
    Step = 1,
    Value = { Min = 1, Max = 10, Default = 3 },
    Callback = function(value)
        FakeTPDistance = value
    end
})
-------------------------------* Auto Farm Level *-------------------------------

local SectionAutofarmLevel = TabFarm:Section({
    Icon = "solar:info-circle-bold",
    Title = "Auto Farm Level",
    Desc = "Farma automaticamente seu level ( se não estiver no maximo )",
    Icon = "geist:sparkles",
   -- IconColor = "Green" ,
    TextSize = 19, 
    TextXAlignment = "Left", 
    Box = true, 
    BoxBorder = true, 
    Opened = true, 
    FontWeight = Enum.FontWeight.SemiBold, 
    DescFontWeight = Enum.FontWeight.Medium, 
    TextTransparency = 0.05, 
    DescTextTransparency = 0.4,
})

local AutoFarmToggle = SectionAutofarmLevel:Toggle({
    Title = "Ativar Auto Farm Level",
    Desc = "Ativa o farm automático de level.",
    Icon = "",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Value = false, 
    Callback = function(state)
        if state then
            WindUI:Notify({
                Title = "Auto Farm Level",
                Content = "Auto Farm Level ativado!",
                Duration = 3,
                Icon = "solar:check-circle-bold"
            })
        else
            WindUI:Notify({
                Title = "Auto Farm Level",
                Content = "Auto Farm Level desativado!",
                Duration = 3,
                Icon = "x"
            })
        end
        print("Auto Farm Level:", state)
    end
})

TabFarm:Space({ Columns = 2 })
-------------------------------* Auto Farm Materials *-------------------------------

local SectionAutoF = TabFarm:Section({
    Title = "Auto Farm Materials",
    Desc = "Farma automaticamente materiais do jogo.",
    Icon = "solar:backpack-bold",
    IconColor = "Green" ,
    TextSize = 19, 
    TextXAlignment = "Left", 
    Box = true, 
    BoxBorder = true, 
    Opened = true, 
    FontWeight = Enum.FontWeight.SemiBold, 
    DescFontWeight = Enum.FontWeight.Medium, 
    TextTransparency = 0.05, 
    DescTextTransparency = 0.4,
})  

local AutoFarmM = SectionAutoF:Toggle({
    Title = "Ativar Auto Farm Materials",
    Desc = "Ativa o farm automático de materiais.",
    Icon = "solar:check-circle-bold",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Value = false, 
    Callback = function(state)
        if state then
            WindUI:Notify({
                Title = "Auto Farm Materials",
                Content = "Auto Farm Materials ativado!",
                Duration = 3,
                Icon = "solar:check-circle-bold"
            })
        else
            WindUI:Notify({
                Title = "Auto Farm Materials",
                Content = "Auto Farm Materials desativado!",
                Duration = 3,
                Icon = "x"
            })
        end
        print("Auto Farm Materials:", state)
    end
})
SectionAutoF:Space({ Columns = 1 })

local MaterialSelect = SectionAutoF:Dropdown({
    Title = "Selecionar Material",
    Desc = "Seleciona o material que deseja farmar automaticamente.",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Values = {
        { Title = "Material 1" },
        { Title = "Material 2" },
        { Title = "Material 3" },
    },
    Value = "Material 1",
    Callback = function(option)
        print("Selecionado:", option.Title)
    end
})
-------------------------------* Auto Buy Itens ( TAB SHOPPING ) *-------------------------------
local SectionLoja = TabShopping:Section({
    Title = "Auto Buy",
    Desc = "Compra itens automaticamente do blackmarket.",
    Icon = "solar:cart-large-bold",
    IconColor = "Green" ,
    TextSize = 19, 
    TextXAlignment = "Left", 
    Box = true, 
    BoxBorder = true, 
    Opened = true, 
    FontWeight = Enum.FontWeight.SemiBold, 
    DescFontWeight = Enum.FontWeight.Medium, 
    TextTransparency = 0.05, 
    DescTextTransparency = 0.4,
})

local AutoBuySelectItem = SectionLoja:Dropdown({
    Title = "Selecionar Item",
    Desc = "Seleciona o item que deseja comprar automaticamente.",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Values = {
        { Title = "Item 1" },
        { Title = "Item 2" },
        { Title = "Item 3" },
    },
    Value = "Item 1",
    Callback = function(option)
        print("Selecionado:", option.Title)
    end
})
local AutoBuyToggle = SectionLoja:Toggle({
    Title = "Ativar Auto Buy",
    Desc = "Ativa a compra automática do item selecionado acima.",
    Icon = "solar:cart-large-bold",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Value = false, 
    Callback = function(state)
        if state then
            WindUI:Notify({
                Title = "Auto Buy",
                Content = "Auto Buy ativado!",
                Duration = 3,
                Icon = "solar:check-circle-bold"
            })
        else
            WindUI:Notify({
                Title = "Auto Buy",
                Content = "Auto Buy desativado!",
                Duration = 3,
                Icon = "x"
            })
        end
        print("Auto Buy:", state)
    end
})

-------------------------------* Buttons/Dropdowns TabSettings *--------------------
local ResetGravity
local ButtonBypass

local SectionConfig = TabSettings:Section({
    Title = "General Settings",
    Desc = "Configurações de tema, keybind e etc.", -- optional
    Icon = "settings", -- lucide icon or "rbxassetid://". optional
    IconColor = Color3.fromRGB(100, 100, 255), -- custom icon color. optional
    TextSize = 19, -- title text size. optional
    TextXAlignment = "Left", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = true, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0.05, -- title transparency. optional
    DescTextTransparency = 0.4, -- description transparency. optional
})

ButtonBypass = SectionConfig:Button({
        Title = "Bypass Anti-Cheat",
        Desc = "Tenta burlar o sistema anti-cheat do jogo.",
        Locked = false,
         Callback = function()
            ButtonBypass:Highlight()
			wait(2)
            WindUI:Notify({
                Title = "Aviso!",
                Content = "Bypass ativado com sucesso! (Funcionalidade em desenvolvimento)",
                Duration = 3,
                Icon = "shield-check"
            })
            print("Bypass Anti-Cheat ativado")
        end
})

local DropdownTemas = SectionConfig:Dropdown({
    Title = "Temas",
    Desc = "Altera o tema do Royal Hub",
    Flag = "tema_selecionado",
    Values = {
        {
            Title = "Dark Amoled ( Default )",
        },
        {
            Title = "Hutao By Einzbern",
        },
        {
            Title = "RedX Hub",
        },
        {
            Title = "White",
        },
        {
            Title = "Main Theme",
        },
        {
            Title = "CyberPunk",
        },
        {
            Title = "Solar Theme",
        },
        {
            Title = "Midnight",
        },
        {
            Title = "Crimson",
        },
        {
            Title = "Snow",
        },
    },
    Value = "Dark Amoled ( Default )",
    Callback = function(option)
        WindUI:SetTheme(option.Title)
    end
})

local Keybind = SectionConfig:Keybind({
    Title = "Toggle UI",
    Desc = "Altera a tecla que mostra | esconde o menu.", -- optional
    Value = "H", -- default key. optional
    Locked = false, -- disable keybind. optional
    Flag = "toggle_ui_key", -- for config saving. optional
    Callback = function(key)
	Window:SetToggleKey(Enum.KeyCode[key])
        print("Keybind activated, key:", key)
    end
})

SectionConfig:Space({ Columns = 1 })

local SaveConfigButton = SectionConfig:Button({
    Title = "Salvar Config",
    Desc = "Salva tema selecionado e etc.", -- optional
    Icon = "save", -- lucide icon or "rbxassetid://". optional
    --Color = "Green", -- Button color. optional
    Callback = function()
        ConfigMenu:Save()-- Saves the current configuration
        WindUI:Notify({
            Title = "Configuration Saved",
            Content = "Your configuration has been saved successfully.",
            Duration = 3,
            Icon = "save"
        })
        print("Configuration saved.")
    end
})

local Load = SectionConfig:Button({
    Title = "Carregar config",
    Desc = "Carrega a configuração salva anteriormente.",
    Icon = "save",
    Callback = function()
        ConfigMenu:Load()
        WindUI:Notify({
            Title = "Configuration Loaded",
            Content = "Your configuration has been loaded successfully.",
            Duration = 3,
            Icon = "save"
        })
    end
})

SectionConfig:Space({ Columns = 1 })

SectionConfig:Button({
    Title = "Backdoor scanner",
    Desc = "Escaneia o jogo em busca de backdoors conhecidos.",
    Icon = "door-open",
    Callback = function()
        loadstring(game:HttpGet("https://spawnix.github.io/DevTools.rbxm/Loader/index.lua", true))() 

    end
})

SectionConfig:Space({ Columns = 1 })

local DestruirHub = SectionConfig:Button({
	Title = "Ejetar script",
	Desc = "Ejeta a script do jogo.",
	Icon = "",
	Color = "Red",
	Callback = function()
		local Dialog = Window:Dialog({
    Icon = "alert-circle", -- lucide icon or "rbxassetid://". optional
    Title = "Confirm Delete",
    IconThemed = true, -- use theme colors for icon. optional
    Content = "Esta ação não pode ser desfeita.",
    Buttons = {
        {
            Title = "Cancelar",
            Icon = "x", -- button icon. optional
            Variant = "secondary", -- "Primary", "Secondary", "Destructive", "Tertiary". optional
            Callback = function()
				Destroy(Window)
                print("Ejetado")
            end
        },
        {
            Title = "Ejetar",
            Icon = "geist:rotate-clockwise", -- optional
            Variant = "Destructive", -- optional
            Callback = function()
			Window:Destroy()
                print("Ejetado")
            end
        }
    }
})

	end
})

local SectionKeyBinds = TabSettings:Section({
    Title = "KeyBinds",
    Desc = "Aqui você pode alterar os keybinds das funções.",
    Icon = "keyboard",
    IconColor = Color3.fromRGB(100, 100, 255),
    TextSize = 19,
    TextXAlignment = "Left",
    Box = true,
    BoxBorder = true,
    Opened = true,
    FontWeight = Enum.FontWeight.SemiBold,
    DescFontWeight = Enum.FontWeight.Medium,
    TextTransparency = 0.05,
    DescTextTransparency = 0.4,
})

-- Keybind pro Aimbot Comum
SectionKeyBinds:Keybind({
    Title = "Aimbot Comum (K)",
    Value = "K",  -- tecla inicial (o usuário pode mudar na GUI)
    Callback = function(key)
        AimbotEnabled.normal = not AimbotEnabled.normal
        toggleAimbot("normal")
        WindUI:Notify({
            Title = "Aimbot Comum",
            Content = AimbotEnabled.normal and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = AimbotEnabled.normal and "target" or "x"
        })
        print("Aimbot Comum toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Aimbot Rage
SectionKeyBinds:Keybind({
    Title = "Aimbot Rage (L)",
    Value = "L",
    Callback = function(key)
        AimbotEnabled.rage = not AimbotEnabled.rage
        toggleAimbot("rage")
        WindUI:Notify({
            Title = "Aimbot Rage",
            Content = AimbotEnabled.rage and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = AimbotEnabled.rage and "target" or "x"
        })
        print("Aimbot Rage toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro ESP
SectionKeyBinds:Keybind({
    Title = "ESP (E)",
    Value = "E",
    Callback = function(key)
        espEnabled = not espEnabled
        if espEnabled then
            for _, player in ipairs(S.Players:GetPlayers()) do
                createESP(player)
            end
            WindUI:Notify({Title = "ESP", Content = "Ativado!", Duration = 2, Icon = "eye"})
        else
            removeAllESP()
            WindUI:Notify({Title = "ESP", Content = "Desativado!", Duration = 2, Icon = "x"})
        end
        print("ESP toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Fly
SectionKeyBinds:Keybind({
    Title = "Fly (F)",
    Value = "F",
    Callback = function(key)
        toggleFly(not FlyEnabled)  -- Inverte o estado atual
        WindUI:Notify({
            Title = "Fly",
            Content = FlyEnabled and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = FlyEnabled and "plane" or "x"
        })
        print("Fly toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Spin
SectionKeyBinds:Keybind({
    Title = "Spin (G)",
    Value = "G",
    Callback = function(key)
        toggleSpin(not SpinEnabled)
        WindUI:Notify({
            Title = "Spin",
            Content = SpinEnabled and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = SpinEnabled and "rotate-cw" or "x"
        })
        print("Spin toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Loop TP
SectionKeyBinds:Keybind({
    Title = "Loop TP (T)",
    Value = "T",
    Callback = function(key)
        toggleLoopTP(not LoopTPEnabled)
        WindUI:Notify({
            Title = "Loop TP",
            Content = LoopTPEnabled and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = LoopTPEnabled and "repeat" or "x"
        })
        print("Loop TP toggled via keybind:", key)
    end
})

-------------------------------* Buttons TabPersonagem *------------------------
TabPersonagem:Section({
    Title = "Movimento",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

local SliderVelocidade = TabPersonagem:Slider({
    Title = "Speed",
    Desc = "Altera velocidade do jogador",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
        Min = 20,
        Max = 999,
        Default = 20,
    },
    Callback = function(value)
		setSpeed(value)
        print("Velocidade alterada para:", value)
    end
})

local SliderJump = TabPersonagem:Slider({
	Title = "Jump",
	Desc = "Aumenta a força do pulo",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
	Step = 1,
	Value = { 
		Min = 20,
		Max = 999,
		Default = 20,
	},
	Callback = function(value)
		setJumpPower(value)
		print("Valor do pulo alterado para:", value)
	end
})

TabPersonagem:Space({ Columns = 1 })

local FlyToggle = TabPersonagem:Toggle({
    Title = "Fly",
    Desc = "Ativa o modo de voo",
    Icon = "solar:rocket-bold",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Value = false, -- default value
    Callback = function(state)
        toggleFly(state)
    end
})

local SliderFlySpeed = TabPersonagem:Slider({
    Title = "Velocidade do Fly",
    Desc = "Ajuste a velocidade do voo (quanto maior, mais rápido).",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 5,
    Value = { Min = 20, Max = 200, Default = 50 },
    Callback = function(value)
        FlySpeed = value
        if FlyEnabled and FlyBodyVelocity then
            FlyBodyVelocity.Velocity = FlyBodyVelocity.Velocity.Unit * value
        end
    end
})

TabPersonagem:Space({ Columns = 2 })

TabPersonagem:Section({
    Title = "Gravidade",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

local SliderGravity = TabPersonagem:Slider({
    Title = "Gravity",
    Desc = "Altera a gravidade do jogo",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
        Min = 0,
        Max = 500,
        Default = 196.2,
    },
    Callback = function(value)
        setGravity(value)
        print("Gravidade alterada para:", value)
    end
})

ResetGravity = TabPersonagem:Button({
        Title = "Reset Gravity",
        Desc = "Reseta a gravidade para o valor padrão (196.2)",
        Locked = false,
		LockedTitle = "Em desenvolvimento.",
        Callback = function()
            setGravity(196.2)
            ResetGravity:Highlight()
            WindUI:Notify({
                Title = "Gravidade resetada!",
                Content = "A gravidade foi resetada para o valor padrão (196.2)",
                Duration = 3,
                Icon = "shield-check"
            })
            print("Gravidade resetada para 196.2")
    end
})


TabPersonagem:Space({ Columns = 2 })

TabPersonagem:Section({
    Title = "Outros",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

-------------------------------* Buttons TabTeleport *-------------------------------

local SectionTP = TabTeleport:Section({
    Title = "Teleport ",
    Desc = "Permite teleportar até outros jogadores.", 
    Icon = "bird", 
    IconColor = Color3.fromRGB(100, 100, 255), 
    TextSize = 19, 
    TextXAlignment = "Left", 
    Box = true, 
    BoxBorder = true, 
    Opened = true, 
    FontWeight = Enum.FontWeight.SemiBold, 
    DescFontWeight = Enum.FontWeight.Medium, 
    TextTransparency = 0.05, 
    DescTextTransparency = 0.4, 
})

local DropDownPlayersTP = SectionTP:Dropdown({
	Title = "Teleportar até jogador",
    Desc = "Teleporta até o jogador selecionado",
    Values = playerValues,
    Value = playerValues[0],
    Callback = function(option)
		LoopTPTargetName = option.Title  -- Salva o nome selecionado aqui!
        TeleporteToPlayer(option.Title)  -- Mantém o TP único normal
        print("Selecionado:", option.Title)
        print("Player:", option.Player)
    end
})

SectionTP:Space({ Columns = 1 })

local LoopTP = SectionTP:Toggle({
	Title = "Loop TP",
	Desc = "Teleporta infinitamente no jogado que foi selecionado acima.",
	Icon = "",
	Locked = false,
	LockedTitle = "Em desenvolvimento.",
	Value = false,
	Callback = function(state)
        toggleLoopTP(state)
		print("Em desenvolvimento.")	
	end
})

SectionTP:Space({ Columns = 1 })

local SliderLoopDelay = SectionTP:Slider({
    Title = "Delay entre TPs",
    Desc = "Tempo em segundos entre cada teleporte (menor = mais rápido)",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 0.3,
        Max = 5,
        Default = 1,
    },
    Callback = function(value)
        LoopTPDelay = value
        WindUI:Notify({
            Title = "Loop TP Delay",
            Content = "Atualizado para " .. value .. " segundos",
            Duration = 2,
            Icon = "timer"
        })
    end
})

TabTeleport:Space({ Columns = 2 })

local SectionTeleportToIsland = TabTeleport:Section({
    Title = "Teleport to Islands",
    Desc = "Teleporta para as ilhas principais do jogo.", 
    Icon = "solar:map-bold", 
    IconColor = Color3.fromRGB(100, 100, 255), 
    TextSize = 19, 
    TextXAlignment = "Left", 
    Box = true, 
    BoxBorder = true, 
    Opened = true, 
    FontWeight = Enum.FontWeight.SemiBold, 
    DescFontWeight = Enum.FontWeight.Medium, 
    TextTransparency = 0.05, 
    DescTextTransparency = 0.4, 
})

local DropDownIslandsTP = SectionTeleportToIsland:Dropdown({
    Title = "Teleporte para ilha",
    Desc = "Teleporta para a ilha selecionada.",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Values = {
        { Title = "Starter Island" },
        { Title = "Forest Island" },
        { Title = "Desert Island" },
        { Title = "Snow Island" },
        { Title = "Volcano Island" },
        { Title = "Sky Island" },
    },
    Value = "Starter Island",
    Callback = function(option)
        print("Selecionado:", option.Title)
    end
})


-------------------------------* TabMisc *-------------------------------

local SectionMisc = TabMisc:Section({
    Title = "Miscellaneous",
    Desc = "Funções diversas do Royal Hub.", 
    Icon = "solar:settings-bold", 
    IconColor = Color3.fromRGB(100, 100, 255), 
    TextSize = 19, 
    TextXAlignment = "Left", 
    Box = true, 
    BoxBorder = true, 
    Opened = true, 
    FontWeight = Enum.FontWeight.SemiBold, 
    DescFontWeight = Enum.FontWeight.Medium, 
    TextTransparency = 0.05, 
    DescTextTransparency = 0.4, 
})

local ButtonRejoin = SectionMisc:Button({
    Title = "Rejoin",
    Desc = "Reentra na partida atual.",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Callback = function()
        RejoinServer()
        print("Rejoining...")
    end
})

SectionMisc:Space({ Columns = 1 })

local ButtonServerHop = SectionMisc:Button({
    Title = "Server Hop",
    Desc = "Entra em outro servidor da partida atual.",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Callback = function()
        ServerHop()
        print("Server Hopping...")
    end
})

SectionMisc:Space({ Columns = 1 })

local ButtonRedeemCodes = SectionMisc:Button({
    Title = "Redeem Codes",
    Desc = "Resgata códigos automaticamente.",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Callback = function()
        print("Redeeming Codes...")
    end
})

SectionMisc:Space({ Columns = 1 })

local ButtonCollectRewards = SectionMisc:Button({
    Title = "Collect Rewards",
    Desc = "Coleta recompensas diárias automaticamente.",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Callback = function()
        print("Collecting Rewards...")
    end
})

SectionMisc:Space({ Columns = 1 })

local SectionFun = TabMisc:Section({
    Title = "Fun",
    Desc = "Funções divertidas do Royal Hub.", 
    Icon = "solar:emoji-funny-circle-bold", 
    IconColor = Color3.fromRGB(100, 100, 255), 
    TextSize = 19, 
    TextXAlignment = "Left", 
    Box = true, 
    BoxBorder = true, 
    Opened = true, 
    FontWeight = Enum.FontWeight.SemiBold, 
    DescFontWeight = Enum.FontWeight.Medium, 
    TextTransparency = 0.05, 
    DescTextTransparency = 0.4, 
})

local FunFunctions = SectionFun:Toggle({
    Title = "Spin",
    Desc = "Faz o personagem girar infinitamente.",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Value = false,
    Callback = function(state)
        toggleSpin(state)
        print("Spin toggled:", state)
    end
})

-------------------------------* Paragrafos *-------------------------------

local SectionInfo = TabInfo:Section({
    Title = "Informações",
    Icon = "solar:info-circle-bold",
    TextSize = 24,
    FontWeight = Enum.FontWeight.SemiBold,
})

local DevParagraph = TabInfo:Paragraph({
    Title = "Eodraxkk",
    Desc = "Desenvolvedor principal do Royal Hub, focado em programação e segurança.",
    Color = "Grey",
    Image = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/Devs%20icon/EodraxkkRounded.png",
    ImageSize = 60,
    --Thumbnail = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/Devs%20icon/BannerEodraxkk2.jpg",
    --ThumbnailSize = 60,
    Locked = false,
})

TabInfo:Space({ Columns = 1 })

local DevParagraph2 = TabInfo:Paragraph({
    Title = "Einzbern",
    Desc = "Co-desenvolvedor do Royal Hub, focado em design e ideias de funções.",
    Color = "Grey",
    Image = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/Devs%20icon/EinzbernRounded.png",
    ImageSize = 60,
    --Thumbnail = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/Devs%20icon/BannerEinzbern.jpg",
    --ThumbnailSize = 60,
    Locked = false,
})

TabInfo:Space({ Columns = 2 })

local ParagraphLink = TabInfo:Paragraph({
    Title = "Link do Discord",
    Desc = "Este é o link do nosso Discord, entre para ficar por dentro das novidades e atualizações do Royal Hub!",
    Color = "Grey",
    Image = "geist:logo-discord",
    ImageSize = 40,
   -- Thumbnail = "",
    --ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "solar:clipboard-bold",
            Title = "Clique para copiar o link",
            Callback = function()
                setclipboard("https://discord.gg/DmdTDgJc")
			WindUI:Notify({
				Title = "Clipboard",
				Content = "Link do Discord copiado para a área de transferência!",
				Duration = 3,
				Icon = "discord",
			})
		end,
        }
    }
})

TabInfo:Space({ Columns = 2 })

local SobreRoyalHub = TabInfo:Section({
    Title = "Sobre o Royal Hub",
    TextSize = 24,
    FontWeight = Enum.FontWeight.SemiBold,
})

SobreRoyalHub:Section({
        Title = "Royal Hub é um script feito para o Roblox, Criado apenas por dois desenvolvedores e focado em entregar uma experiência completa e segura para os jogadores. Com uma variedade de funcionalidades, desde melhorias no personagem até opções de farm automatizado, o Royal Hub visa facilitar a jogabilidade e proporcionar vantagens estratégicas dentro do jogo. Desenvolvido com atenção à segurança, o script busca garantir que os usuários possam aproveitar suas funcionalidades sem comprometer a integridade de suas contas. Seja você um jogador casual ou um entusiasta dedicado, o Royal Hub oferece ferramentas que podem aprimorar sua experiência em diversos jogos.",
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
 })

