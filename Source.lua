local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)
--*updated
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

-------------------------------* Variáveis globais *-------------------------------
local LoopEmote = false
local CurrentEmoteTrack = nil
local EmoteLoopConnection = nil

local NotifySound = Instance.new("Sound")
NotifySound.SoundId = "rbxassetid://6518811702"
NotifySound.Volume = 1.0
NotifySound.Parent = game:GetService("SoundService")


-- Silent Aim
local SilentAimEnabled = false
local SilentAimPart = "HumanoidRootPart"

-- Hit Prediction
local HitPredictionEnabled = false
local PredictionAmount = 1.0

-- Hitbox Expander
local HitboxEnabled = false
local HitboxSize = 8
local OriginalHitboxes = {}
local hitboxConnection = nil

-- Anti-Ragdoll
local AntiRagdollEnabled = false
local AntiRagdollConnection = nil

-- Auto Parry
local AutoParryEnabled = false
local AutoParryKey = Enum.KeyCode.Q
local AutoParryDistance = 12
local AutoParryCooldown = false
local AutoParryConnection = nil

-- Anti-Kick
local AntiKickEnabled = false

-- Remote Spy
local RemoteSpyEnabled = false
local RemoteLogs = {}

-- Radar 2D
local RadarEnabled = false
local RadarRange = 150
local radarDots = {}
local radarUpdateConn = nil

-- Copy Player
local CopyTargetPlayer = nil
------------------------------* Funções externas *-------------------------------

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

------------------------------* Set rpName *-------------------------

local function SetRPNameAndBio()
    local admins = {"DARK_ZIINN", "S1wlkrX", "thenoctisblack78"}
    local player = game:GetService("Players").LocalPlayer
    local isAdmin = table.find(admins, player.Name) ~= nil
    local rpName = isAdmin and " [ DEV ]" or "CLIENTE ROYAL HUB"
    local bio = isAdmin and "CREATOR OF ROYAL HUB" or ""
    print("[RoyalHub] Aplicando RP Name: '" .. rpName .. "' | Bio: '" .. bio .. "' | Admin: " .. tostring(isAdmin))

    local PlayersBag = player:WaitForChild("PlayersBag", 10)
    if PlayersBag then
        if PlayersBag:FindFirstChild("RPName") then PlayersBag.RPName.Value = rpName end
        if PlayersBag:FindFirstChild("RPBio") then PlayersBag.RPBio.Value = bio end
        print("[RoyalHub] PlayersBag texto atualizado")
    end
    local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE", 5)
    if not RE then
        warn("[RoyalHub] Pasta RE não encontrada!")
        return
    end

    local textRemote = RE:FindFirstChild("1RPNam1eTex1t")
    if textRemote and textRemote:IsA("RemoteEvent") then
        textRemote:FireServer("RolePlayName", rpName)
        textRemote:FireServer("RolePlayBio", bio)
        print("[RoyalHub] Texto Name e Bio disparados")
    end

    local nameColorRemote = RE:FindFirstChild("1RPNam1eColo1r")
    local bioColorRemote = RE:FindFirstChild("1RPNam1eColo1r")
    if isAdmin then
        local nameR, nameG, nameB = 1, 0, 0 
        local bioR, bioG, bioB = 0, 1, 1
        if nameColorRemote then
            nameColorRemote:FireServer("PickingRPNamColor", nameR, nameG, nameB)
            print("[RoyalHub] Cor Nome disparada: " .. nameR .. ", " .. nameG .. ", " .. nameB)
        end
        if bioColorRemote then
            bioColorRemote:FireServer("PickingRPNameColor", bioR, bioG, bioB)
            print("[RoyalHub] Cor Bio disparada: " .. bioR .. ", " .. bioG .. ", " .. bioB)
        end
    else
        local whiteR, whiteG, whiteB = 1, 1, 1
        if nameColorRemote then nameColorRemote:FireServer("PickingRPNamColor", whiteR, whiteG, whiteB) end
        if bioColorRemote then bioColorRemote:FireServer("PickingRPNameColor", whiteR, whiteG, whiteB) end
    end
end


local function CheckAndSetRP()
    local placeId = game.PlaceId
    local brookhavenPlaceId = 4924922222
    if placeId == brookhavenPlaceId then
        WindUI:Notify({
            Title = "AVISO!",
            Content = '<font color="#FF0000">POR FAVOR, DEIXE O JOGO CARREGAR, APERTE EM JOGAR ASSIM QUE POSSIVEL!</font>',
        })
        print("[RoyalHub] Detectado Brookhaven (PlaceId " .. placeId .. ") - Aplicando RP custom")
        Wait(8)
        SetRPNameAndBio()
    else
        print("[RoyalHub] Não é Brookhaven (PlaceId " .. placeId .. ") - Pulando RP custom e indo para load do menu")
    end
end

wait(1) 
CheckAndSetRP()

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

local LoopTPEnabled = false
local LoopTPTargetName = nil 
local LoopTPDelay = 1 
local LoopTPConnection = nil

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

local function removeAllESP()
    for player, _ in pairs(espObjects) do
        removeESP(player)
    end
    espObjects = {}
end

local function createESP(player)
    if player == LocalPlayer then return end 
    if espObjects[player] then return end  

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
    billboard.Size = UDim2.new(0, 150, 0, 30)  
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = humanoidRootPart

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = player.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextScaled = false  
    textLabel.TextSize = 16  
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Parent = billboard

    table.insert(espObjects[player], billboard)
end

local function setupPlayerListeners(player)
    if playerListeners[player] then return end

    local charAddedConn, charRemovingConn

    charAddedConn = player.CharacterAdded:Connect(function()
        task.wait(0.5)  -- Espera carregar
        if espEnabled then
            createESP(player)
            -- WindUI:Notify({
            --     Title = "Esp ativado!",
            --     Icon = "Crosshair",
            -- })
        end
    end)

    charRemovingConn = player.CharacterRemoving:Connect(function()
        removeESP(player)
        -- WindUI:Notify({
        --     Title = "Esp desativado!",
        --     Icon = "Crosshair",
        -- })
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

-------------------------* SERVER HOP FUNCTION *------------------------- 

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
                root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(360 * delta), 0)
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
local TargetPart = "Head" 
local MaxDistance = 1500
local UseTeamCheck = true

-------------------------------* Aimbot Functions *-------------------------------

local AimbotEnabled = {normal = false, rage = false}
local AimbotConnections = {}
local TargetPart = "Head" 
local MaxDistance = 1500
local UseTeamCheck = true
local UseWallCheck = true 


local function getClosestTarget()
    local camera = S.WS.CurrentCamera
    local closest, shortestDist = nil, MaxDistance
    local localTeam = LocalPlayer.Team
    local origin = camera.CFrame.Position

    for _, player in ipairs(S.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local part = player.Character:FindFirstChild(TargetPart)
                if part then
                    local dist = (camera.CFrame.Position - part.Position).Magnitude
                    if dist < shortestDist then
                       
                        if not UseTeamCheck or not localTeam or player.Team ~= localTeam then
                           
                            local screenPos, onScreen = camera:WorldToViewportPoint(part.Position)
                            if onScreen and screenPos.Z > 0 then
                                
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


local function smoothAim(target)
    local camera = S.WS.CurrentCamera
    local part = target.Character:FindFirstChild(TargetPart)
    if part then
        local goalCFrame = CFrame.new(camera.CFrame.Position, part.Position)
        camera.CFrame = camera.CFrame:Lerp(goalCFrame, 0.2) 
    end
end


local function snapAim(target)
    local camera = S.WS.CurrentCamera
    local part = target.Character:FindFirstChild(TargetPart)
    if part then
        camera.CFrame = CFrame.new(camera.CFrame.Position, part.Position)
    end
end

local function toggleAimbot(mode)  
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
      
    else
        if AimbotConnections[mode] then
            AimbotConnections[mode]:Disconnect()
            AimbotConnections[mode] = nil
        end
    end
end

------------------------------* Fake TP Function *-------------------------------

local FakeTPEnabled = false
local FakeTPConnection = nil
local FakeTPDelay = 0.2  
local FakeTPDistance = 3 

local function toggleFakeTP(enabled)
    FakeTPEnabled = enabled
    if enabled then
        if FakeTPConnection then FakeTPConnection:Disconnect() end
        FakeTPConnection = S.Run.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end

            local root = char.HumanoidRootPart
            local originalCFrame = root.CFrame

            local randomOffset = Vector3.new(math.random(-FakeTPDistance, FakeTPDistance), math.random(1, FakeTPDistance), math.random(-FakeTPDistance, FakeTPDistance))
            root.CFrame = originalCFrame + randomOffset

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


LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if FakeTPEnabled then toggleFakeTP(true) end
end)

-------------------------------* Spectate player *-------------------------------

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local spectateConnection
local originalSubject
local originalType

local function startSpectate(targetPlayer)
    if not targetPlayer then return end
    if targetPlayer == Players.LocalPlayer then return end

    originalSubject = Camera.CameraSubject
    originalType = Camera.CameraType

    Camera.CameraType = Enum.CameraType.Custom

    local function applyCharacter(char)
        local humanoid = char:WaitForChild("Humanoid", 5)
        if humanoid then
            Camera.CameraSubject = humanoid
        end
    end

    if targetPlayer.Character then
        applyCharacter(targetPlayer.Character)
    end

    spectateConnection = targetPlayer.CharacterAdded:Connect(applyCharacter)
end

local function stopSpectate()
    if spectateConnection then
        spectateConnection:Disconnect()
        spectateConnection = nil
    end

    if originalSubject then
        Camera.CameraSubject = originalSubject
    end

    if originalType then
        Camera.CameraType = originalType
    end
end

------------------------------* Orbitar Player Function *-------------------------------

local OrbitEnabled = false
local OrbitTargetName = nil
local OrbitSpeed = 1
local OrbitRadius = 10
local OrbitConnection = nil

local function startOrbit()
    if OrbitConnection then OrbitConnection:Disconnect() end
    
    OrbitConnection = S.Run.Heartbeat:Connect(function(dt)
        if not OrbitEnabled then return end
        if not OrbitTargetName then return end
        
        local target = S.Players:FindFirstChild(OrbitTargetName)
        if not target or not target.Character then
            WindUI:Notify({
                Title = "Orbit",
                Content = "Alvo sumiu ou morreu. Orbit parado.",
                Duration = 4,
                Icon = "alert-circle"
            })
            OrbitEnabled = false
            if OrbitConnection then
                OrbitConnection:Disconnect()
                OrbitConnection = nil
            end
            return
        end
        
        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot then return end
        
        local localPlayer = S.Players.LocalPlayer
        local localChar = localPlayer.Character
        if not localChar then return end
        
        local localRoot = localChar:FindFirstChild("HumanoidRootPart")
        if not localRoot then return end
        
        local humanoid = localChar:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
        end
        
        local angle = tick() * OrbitSpeed
        local offset = Vector3.new(math.cos(angle) * OrbitRadius, 0, math.sin(angle) * OrbitRadius)
        
        local newPos = targetRoot.Position + offset
        localRoot.CFrame = CFrame.lookAt(newPos, targetRoot.Position)
    end)
end

local function toggleOrbit(enabled)
    OrbitEnabled = enabled
    
    if enabled then
        if not OrbitTargetName then
            WindUI:Notify({
                Title = "Orbit",
                Content = "Selecione um jogador no dropdown primeiro!",
                Duration = 4,
                Icon = "alert-circle"
            })
            OrbitEnabled = false
            return
        end
        
        WindUI:Notify({
            Title = "Orbit",
            Content = "Orbitando " .. OrbitTargetName .. " com velocidade " .. OrbitSpeed,
            Duration = 4,
            Icon = "rotate-cw"
        })
        
        startOrbit()
    else
        if OrbitConnection then
            OrbitConnection:Disconnect()
            OrbitConnection = nil
        end
        
        local localPlayer = S.Players.LocalPlayer
        local localChar = localPlayer.Character
        if localChar then
            local humanoid = localChar:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
        
        WindUI:Notify({
            Title = "Orbit",
            Content = "Orbit desativado.",
            Duration = 3,
            Icon = "x"
        })
    end
end

local function setOrbitSpeed(value)
    OrbitSpeed = value
    if OrbitEnabled then
        WindUI:Notify({
            Title = "Orbit",
            Content = "Velocidade atualizada para " .. value,
            Duration = 2,
            Icon = "wind"
        })
    end
end

--------------------------------* NoClip Function *-------------------------------

local function toggleNoClip(enabled)
    NoClipEnabled = enabled
    
    if enabled then
        if NoClipConnection then NoClipConnection:Disconnect() end
        
        NoClipConnection = S.Run.Stepped:Connect(function(_, step)
            if not NoClipEnabled then return end
            
            local char = S.Players.LocalPlayer.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        
        WindUI:Notify({
            Title = "NoClip",
            Content = "NoClip ativado!",
            Duration = 3,
            Icon = "ghost"
        })
    else
        if NoClipConnection then
            NoClipConnection:Disconnect()
            NoClipConnection = nil
        end

        local char = S.Players.LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        
        WindUI:Notify({
            Title = "NoClip",
            Content = "NoClip desativado.",
            Duration = 3,
            Icon = "x"
        })
    end
end

------------------------------* Emotes Function *-------------------------------

local emoteList = {

    RockOut = 11753474067,
    Bow = 13823324057,
    Prayer = 114388371896974,
    WallLean = 10714392876,
    Greed = 507765000,
    CryForMeOG = 106082149118126,
    FFPushUp = 76988349893259,
    FFDemonDance = 103961097096319,
    NyaDance = 106516971471692,
    BrazilianFunkFootwork = 140219184038687,
    FrenchConfidence = 126275747804327,
    AuraPose = 133418516499878,
    VemCaNenem = 91032467964520,
    LegendAuraFly = 101420028871528,
    EmperorOfTheAuraverse = 119810104205917,
    GhostFaceEmote = 99850116159145,
    EndlessAuraFloating = 123349905320515,
    ZeroTwoDanceV2 = 82682811348660,
    Jumpstyledance = 112773902133223,
    MASSIVEPOOP = 125329959146841,
    PasinhoJamal = 100545872015841,
    FeelingCute = 73161476966723,
    SpiderJumpingAround = 70981302031949,
    RaceCar = 72382226286301,
    Possesed = 90708290447388,
    HalloweenHeadlessEffortlessAura = 121812124134821,
    invisibleMe = 126995783634131,
    GojoFloating = 111383986305209,
    SHAKE = 98719422024341,
    IWANNARUNAWAY = 104428851742579,
    TallScaryCreature = 130916388086314,
    FFLOL = 98316145061745,
    PainAndSuffering = 122319751392556,
    PossessedGlitcher = 80103653497738,
    Helicopter = 71527789940915,
    SummonAFriend = 118979452794479,
    Tank = 137814849942324,
    SadSit = 100798804992348,
    FFTheWalker = 121448822763616,
    FFpiopio = 131858162905276,
    HearMeNow = 88974065639269,
    PassinhoBolsonaro = 96673018720208,
    YNWallLean = 114388371896974,
    SHAKETHATTHANG = 103461852463003,
    StylishFloating = 112089880074848,
    Gangnamstyle = 131104967711844,
    sturdy = 132104757386824,
    ObbyHead = 125176243437210,

}

local function getEmoteValues()
    local values = {}
    local sortedNames = {}
    for name in pairs(emoteList) do
        table.insert(sortedNames, name)
    end
    table.sort(sortedNames)
    
    for _, name in ipairs(sortedNames) do
        table.insert(values, {Title = name})
    end
    return values
end

local function activateManualLoop(track)
    if EmoteLoopConnection then EmoteLoopConnection:Disconnect() end
    
    EmoteLoopConnection = track.Stopped:Connect(function()
        if LoopEmote and track == CurrentEmoteTrack then
            track:Play()
        else
            EmoteLoopConnection:Disconnect()
            EmoteLoopConnection = nil
        end
    end)
end

local emoteValues = getEmoteValues()


------------------------------* FLING Function *-------------------------------
local FlingTargetPlayer = nil
local FlingPower = 1000

local function Fling(targetPlayer, flingPower, direction)
    flingPower = flingPower or 1000
    direction = direction or Vector3.new(math.random(-1,1), 1, math.random(-1,1)).Unit * 50  -- Direção aleatória para cima
    
    if targetPlayer and targetPlayer.Character then
        local humanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
        
        if humanoidRootPart and humanoid and humanoid.Health > 0 then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            humanoidRootPart.Velocity = direction * flingPower
            task.wait(0.1)
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end
end

local function toggleSpyChat(state)
    WindUI:Notify({Title = "SpyChat", Content = "Em desenvolvimento.", Duration = 2, Icon = "eye"})
end

local function playGlobalAudioRemote(audioId, volume)
    WindUI:Notify({Title = "Audio", Content = "Em desenvolvimento.", Duration = 2, Icon = "music"})
end

-------------------------------* Temas *-------------------------------

WindUI:AddTheme({
    Name = "Hutao By Einzbern",
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#000000"),
    Outline = Color3.fromHex("#991b1b"),
    Text = Color3.fromHex("#991b1b"),
    Placeholder = Color3.fromHex("#141414"),
    Button = Color3.fromHex("#dc2626"),
    Icon = Color3.fromHex("#ef4444"),
})

WindUI:AddTheme({
    Name = "White",
    Accent = Color3.fromHex("#646466"),
    Background = Color3.fromHex("#bba7a7"),
    Outline = Color3.fromHex("#020101"),
    Text = Color3.fromHex("#000000"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#000000"),
    Icon = Color3.fromHex("#000000"),
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
        ["0"] = { Color = Color3.fromHex("#d1b201"), Transparency = 0 },
        ["50"]= { Color = Color3.fromHex("#000000"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#eeff00"), Transparency = 0}, 
    }, {

    })
})

WindUI:AddTheme({
    Name = "Solar Theme",
    Accent = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#ff6a30"), Transparency = 0 },
        ["100"]  = { Color = Color3.fromHex("ffe72f"), Transparency = 0 },
    }, {
        Rotation = 80,
    })
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
  Background = Color3.fromHex("#363434"),
  Outline = Color3.fromHex("#535151"),
  Text = Color3.fromHex("#aca1a1"),
  Placeholder = Color3.fromHex("#7a7a7a"),
  Button = Color3.fromHex("#52525b"),
  Icon = Color3.fromHex("#414142"),
})

WindUI:AddTheme({
  Name = "Tundra",
  Accent = Color3.fromHex("#342a1e"),
  Background = Color3.fromHex("#1c1002"),
  Outline = Color3.fromHex("#6b5a45"),
  Text = Color3.fromHex("#f5ebdd"),
  Placeholder = Color3.fromHex("#9c8b72"),
  Button = Color3.fromHex("#342a1e"),
  Icon = Color3.fromHex("#c9b79c"),
})

WindUI:AddTheme({
  Name = "Samurai Dark", -- theme name
  Accent = Color3.fromHex("#18181b"),
  Background = Color3.fromHex("#000000"),
  Outline = Color3.fromHex("#9b9b9b"),
  Text = Color3.fromHex("#aca1a1"),
  Placeholder = Color3.fromHex("#7a7a7a"),
  Button = Color3.fromHex("#52525b"),
  Icon = Color3.fromHex("#414142"),
})
WindUI:AddTheme({
  Name = "Monokai", -- theme name
  Accent = Color3.fromHex("#fc9867"),
  Background = Color3.fromHex("#191622"),
  Outline = Color3.fromHex("#78dce8"),
  Text = Color3.fromHex("#fcfcfa"),
  Placeholder = Color3.fromHex("#6f6f6f"),
  Button = Color3.fromHex("#ab9df2"),
  Icon = Color3.fromHex("#a9dc76"),
})

WindUI:AddTheme({
  Name = "Moonlight", -- theme name
  Accent = Color3.fromHex("#18181B"),
  Background = Color3.fromHex("#000000"),
  Outline = Color3.fromHex("#989898"),
  Text = Color3.fromHex("#D4D4D4"),
  Placeholder = Color3.fromHex("#7A7A7A"),
  Button = Color3.fromHex("#52525b"),
  Icon = Color3.fromHex("#414142"),
})

WindUI:AddTheme({
  Name = "Lunar",
  Accent = Color3.fromHex("#0a0f1e"),
  Background = Color3.fromHex("#101722"),
  Outline = Color3.fromHex("#2391ff"),
  Text = Color3.fromHex("#ffffff"),
  Placeholder = Color3.fromHex("#2391ff"),
  Button = Color3.fromHex("#2563eb"),
  Icon = Color3.fromHex("#2391ff"),
})

WindUI:AddTheme({
  Name = "Indigo",
  Accent = Color3.fromHex("#3730a3"),
  Background = Color3.fromHex("#0f0a2e"),
  Outline = Color3.fromHex("#c7d2fe"),
  Text = Color3.fromHex("#f1f5f9"),
  Placeholder = Color3.fromHex("#7078d9"),
  Button = Color3.fromHex("#4f46e5"),
  Icon = Color3.fromHex("#6366f1"),
})

WindUI:AddTheme({
  Name = "Startorch",
  Accent = Color3.fromHex("#b45309"),
  Background = Color3.fromHex("#1c1003"),
  Outline = Color3.fromHex("#fcd34d"),
  Text = Color3.fromHex("#fffbeb"),
  Placeholder = Color3.fromHex("#fbbf24"),
  Button = Color3.fromHex("#d97706"),
  Icon = Color3.fromHex("#f59e0b"),
})

WindUI:AddTheme({
  Name = "Nod Krai",
  Accent = Color3.fromHex("#1e3a8a"),
  Background = Color3.fromHex("#0a0f1e"),
  Outline = Color3.fromHex("#bfdbfe"),
  Text = Color3.fromHex("#dbeafe"), 
  Placeholder = Color3.fromHex("#2f74d1"),
  Button = Color3.fromHex("#2563eb"),
  Icon = Color3.fromHex("#5591f4"),
})

WindUI:AddTheme({
  Name = "Hoshimi",
  Accent = Color3.fromHex("#166534"),
  Background = Color3.fromHex("#0a1b0f"),
  Outline = Color3.fromHex("#101010"),
  Text = Color3.fromHex("#f0fdf4"),
  Placeholder = Color3.fromHex("#4fbf7a"),
  Button = Color3.fromHex("#16a34a"),
  Icon = Color3.fromHex("#4ade80"),
})

WindUI:AddTheme({
  Name = "Kumokiri",
  Accent = Color3.fromHex("#991b1b"),
  Background = Color3.fromHex("#000000"),
  Outline = Color3.fromHex("#0a0f1e"),
  Text = Color3.fromHex("#575656"),
  Placeholder = Color3.fromHex("#1f1d1d"),
  Button = Color3.fromHex("#991b1b"),
  Icon = Color3.fromHex("#dc2626"),
})

WindUI:AddTheme({
  Name = "Emerald",
  Accent = Color3.fromHex("#047857"),
  Background = Color3.fromHex("#011411"),
  Outline = Color3.fromHex("#a7f3d0"),
  Text = Color3.fromHex("#ecfdf5"),
  Placeholder = Color3.fromHex("#3fbf8f"),
  Button = Color3.fromHex("#059669"),
  Icon = Color3.fromHex("#10b981"),
})

WindUI:AddTheme({
  Name = "Lost At Sea",
  Accent = Color3.fromHex("#000000"),
  Background = Color3.fromHex("#0a0f1e"),
  Outline = Color3.fromHex("#131f55"),
  Text = Color3.fromHex("#ffffff"),
  Placeholder = Color3.fromHex("#040661"),
  Button = Color3.fromHex("#52525b"),
  Icon = Color3.fromHex("#000068"),
})

WindUI:AddTheme({
  Name = "Night Fall", 
  Accent = Color3.fromHex("#1e3a8a"),
  Background = Color3.fromHex("#0a0f1e"),
  Outline = Color3.fromHex("#141414"),
  Text = Color3.fromHex("#ffffff"),
  Placeholder = Color3.fromHex("#2f74d1"),
  Button = Color3.fromHex("#010015"),
  Icon = Color3.fromHex("#4d95ff"),
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
wait(2)

WindUI:Notify({
	Title = "Register",
	Content = "Usuario verificado com sucesso!, será necessario uma Key para usar a script caso não tenha usado alguma anteriormente.",
	Duration = 3,
	Ico = "bug"
})
wait(2)

-------------------------------* Janela principal *-------------------------------

local Window = WindUI:CreateWindow({
    Title = '<font color="#c8ee1f">RoyalHub</font>',
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
        local player = game:GetService("Players").LocalPlayer

        NotifySound:Play()
        Window:Dialog({
            Icon = "user",
            Title = player.Name,
            IconThemed = true,
            Content = "UserID: " .. player.UserId ..
                      "\nConta criada há " .. player.AccountAge .. " dias" ..
                      "\nTime: " .. (player.Team and player.Team.Name or "Nenhum"),
            Buttons = {
                {
                    Title = "Copiar UserID",
                    Icon = "copy",
                    Variant = "secondary",
                    Callback = function()
                        setclipboard(tostring(player.UserId))
                        WindUI:Notify({
                            Title = "Copiado!",
                            Content = "UserID copiado para a área de transferência.",
                            Duration = 2,
                            Icon = "copy",
                        })
                    end
                },
                {
                    Title = "Fechar",
                    Icon = "x",
                    Variant = "secondary",
                    Callback = function() end
                },
            }
        })
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
    Content = "Aperte a tecla ( H )  para esconder | Mostrar o menu",
    Duration = 4,
    Icon = "user"
})
-------------------------------* PRINT CONSOLE LOADED *-------------------------------
print("========================= Royal Hub carregado com sucesso! =========================")
print("E ali diante dos meus olhos estava um cavalo branco e seu cavaleiro segurou uma reverência. Ele recebeu uma coroa e partiu, conquistando e conquistar... E saiu outro cavalo, todo vermelho. Ao seu cavaleiro recebeu o poder de tirar a paz da terra e fazer os homens massacrarem um ao outro; e ele recebeu uma grande espada... E ali, enquanto eu olhava, estava um cavalo preto; e seu cavaleiro segurava em sua mão um par de balanças... E lá, enquanto eu olhava, estava outro cavalo, doente e pálido; e o nome do seu cavaleiro era Morte, e Hades veio logo atrás. A ele foi dado poder sobre um quarto da terra, com o direito de matar pela espada e pela fome, pela peste e feras selvagens.")
print(" ========================= Apocalipse 6:1-6 =========================")

-------------------------------* Tags *-------------------------------

Window:Tag({
    Title = "v1.4.4",
    Icon = "github",
    Color = Color3.fromHex("#f0d01a"),
    Radius = 8,
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

local TabExploits = Window:Tab({
    Title = "Exploits",
    Desc = "Scripts que podem ser uteis",
    Icon = "solar:bolt-bold",
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
    Value = false, 
    Callback = function(state)
		espEnabled = state
    if state then
        for _, player in ipairs(S.Players:GetPlayers()) do
            createESP(player)
        end
        WindUI:Notify({Title = "ESP Ativado", Content = "Players destacados!", Duration = 3, Icon = "eye"})
    else
        removeAllESP()  
        WindUI:Notify({Title = "ESP Desativado", Content = "Removido.", Duration = 2, Icon = "x"})
    end
end
})

SectionAimbot:Space({ Columns = 1 })

--! Blocqueado até o velocity atualizar e voltar a injetar no roblox, fiz alterações mas ainda não consegui testar.
local ToggleEsp2 = SectionAimbot:Toggle({
    Title = "Esp 2.0 (Twilight)",
    Desc = "ESP com health bar, box e nome — powered by Twilight.",
    Icon = "solar:eye-bold",
    Locked = true,
    Value = false,
    Callback = function(state)

        if state and espEnabled then
            espEnabled = false
            removeAllESP()
            ToggleESP:Set(false)
        end

        Twilight:SetOptions({ Enabled = state })

            WindUI:Notify({
                Title = "ESP 2.0",
                Content = state and "Twilight ESP ativado!" or "Desativado.",
                Duration = 2,
                Icon = state and "eye" or "x"
            })
    end
})
-------------------------------------------------------------------------------------------------------------------!

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

TabHome:Space({ Columns = 2 })

local SectionCombat = TabHome:Section({
    Title = "Combat",
    Desc = "Silent Aim, Hit Prediction, Hitbox Expander e Auto Parry.",
    Icon = "geist:crosshair",
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

SectionCombat:Toggle({
    Title = "Silent Aim",
    Desc = "Acerta o alvo sem mover a câmera.",
    Icon = "solar:eye-bold",
    Value = false,
    Callback = function(state)
        SilentAimEnabled = state
        WindUI:Notify({
            Title = "Silent Aim",
            Content = state and "Ativado!" or "Desativado.",
            Duration = 2,
            Icon = state and "target" or "x"
        })
    end
})

SectionCombat:Dropdown({
    Title = "Parte do Silent Aim",
    Desc = "Qual parte do corpo mira.",
    Values = {
        {Title = "HumanoidRootPart"},
        {Title = "Head"},
        {Title = "UpperTorso"},
    },
    Value = "HumanoidRootPart",
    Callback = function(option)
        SilentAimPart = option.Title
    end
})

SectionCombat:Space({Columns = 1})

SectionCombat:Toggle({
    Title = "Hit Prediction",
    Desc = "Compensa o lag prevendo a posição do alvo.",
    Icon = "solar:clock-circle-bold",
    Value = false,
    Callback = function(state)
        HitPredictionEnabled = state
        WindUI:Notify({
            Title = "Hit Prediction",
            Content = state and "Ativado!" or "Desativado.",
            Duration = 2,
            Icon = state and "check" or "x"
        })
    end
})

SectionCombat:Slider({
    Title = "Fator de Predição",
    Desc = "Quanto maior, mais à frente mira (1.0 = 100% do ping).",
    Step = 0.1,
    Value = {Min = 0.1, Max = 3.0, Default = 1.0},
    Callback = function(value)
        PredictionAmount = value
    end
})

SectionCombat:Space({Columns = 1})

SectionCombat:Toggle({
    Title = "Hitbox Expander",
    Desc = "Expande a hitbox dos jogadores para facilitar acertos.",
    Icon = "geist:box",
    Value = false,
    Callback = function(state)
        toggleHitbox(state)
    end
})

SectionCombat:Slider({
    Title = "Tamanho da Hitbox",
    Desc = "Em studs. Padrão = 4.",
    Step = 1,
    Value = {Min = 4, Max = 30, Default = 8},
    Callback = function(value)
        HitboxSize = value
        if HitboxEnabled then
            removeHitboxes()
            applyHitboxes()
        end
    end
})

SectionCombat:Space({Columns = 1})

SectionCombat:Toggle({
    Title = "Auto Parry",
    Desc = "Aperta a tecla de parry automaticamente quando inimigo está próximo.",
    Icon = "solar:shield-bold",
    Value = false,
    Callback = function(state)
        toggleAutoParry(state)
    end
})

SectionCombat:Dropdown({
    Title = "Tecla de Parry",
    Desc = "Tecla que o jogo usa para parry.",
    Values = {
        {Title = "Q"},
        {Title = "F"},
        {Title = "E"},
        {Title = "R"},
        {Title = "LeftControl"},
    },
    Value = "Q",
    Callback = function(option)
        AutoParryKey = Enum.KeyCode[option.Title]
        if AutoParryEnabled then toggleAutoParry(true) end
    end
})

SectionCombat:Slider({
    Title = "Distância do Auto Parry",
    Desc = "Distância máxima (studs) para ativar o parry.",
    Step = 1,
    Value = {Min = 5, Max = 30, Default = 12},
    Callback = function(value)
        AutoParryDistance = value
    end
})
-------------------------------* Section Visuals *-------------------------------
local SectionView = TabHome:Section({
    Title = "Visual",
    Desc = "Modificações visuais no jogo.",
    Icon = "solar:eye-bold",
    --IconColor = "Green" ,
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


local SelectPlayerToView = SectionView:Dropdown({
    Title = "Selecione o Player",
    Desc = "Seleciona o player para aplicar as modificações visuais.",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Values = playerValues,
    Value = playerValues[0],
    Callback = function(option)
        SelectedPlayerToView = Players:FindFirstChild(option.Title)
        print("Selecionado:", option.Title)
    end
})

local ViewPlayerToggle = SectionView:Toggle({
    Title = "Visualizar Player",
    Desc = "Ativa as modificações visuais no player selecionado acima.",
    Icon = "solar:eye-bold",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Value = false, 
    Callback = function(state)
        if state then
        if SelectedPlayerToView then
            startSpectate(SelectedPlayerToView)
        end
    else
        stopSpectate()
    end
end
})

SectionView:Space({ Columns = 1 })

local ToggleNoclip = SectionView:Toggle({
    Title = "NoClip",
    Desc = "Permite atravessar paredes e objetos.",
    Icon = "solar:ghost-bold",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Value = false, 
    Callback = function(state)
        toggleNoClip(state)
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
    Desc = "Configurações de tema, keybind e etc.", 
    Icon = "settings", 
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

ButtonBypass = SectionConfig:Button({
        Title = "Bypass Anti-Cheat",
        Desc = "Tenta burlar o sistema anti-cheat do jogo.",
        Locked = false,
         Callback = function()
            ButtonBypass:Highlight()
			wait(2)
            NotifySound:Play()
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
        {
            Title = "Tundra",
        },
        {
            Title = "Samurai Dark",
        },
        {
            Title = "Monokai",
        },
        {
            Title = "Moonlight",
        },
        {
            Title = "Lunar",
        },
        {
            Title = "Indigo"
        },
        {
            Title = "Startorch"
        },
        {
            Title = "Nod Krai"
        },
        {
            Title = "Hoshimi"
        },
        {
            Title = "Kumokiri"
        },
        {
            Title = "Emerald"
        },
        {
            Title = "Lost At Sea"
        },
        {
            Title = "Night Fall"
        },
    },
    Value = "Dark Amoled ( Default )",
    Callback = function(option)
        WindUI:SetTheme(option.Title)
    end
})

local Keybind = SectionConfig:Keybind({
    Title = "Toggle UI",
    Desc = "Altera a tecla que mostra | esconde o menu.",
    Value = "H",
    Locked = false,
    Flag = "toggle_ui_key",
    Callback = function(key)
	Window:SetToggleKey(Enum.KeyCode[key])
        print("Keybind activated, key:", key)
    end
})

SectionConfig:Space({ Columns = 1 })

local SaveConfigButton = SectionConfig:Button({
    Title = "Salvar Config",
    Desc = "Salva tema selecionado e etc.", 
    Icon = "save", 
    --Color = "Green", 
    Callback = function()
        ConfigMenu:Save()
        NotifySound:Play()
        WindUI:Notify({
            Title = "Configuração salva!",
            Content = "Sua configuração foi salva com sucesso!",
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
        NotifySound:Play()
        WindUI:Notify({
            Title = "Configuração carregada!",
            Content = "Sua configuração foi carregada com sucesso!",
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
    Icon = "alert-circle",
    Title = "Confirm Delete",
    IconThemed = true,
    Content = "Esta ação não pode ser desfeita.",
    Buttons = {
        {
            Title = "Cancelar",
            Icon = "x",
            Variant = "secondary",
            Callback = function()
				Destroy(Window)
                print("Ejetado")
            end
        },
        {
            Title = "Ejetar",
            Icon = "geist:rotate-clockwise",
            Variant = "Destructive",
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

SectionKeyBinds:Keybind({
    Title = "Aimbot Comum (K)",
    Flag = "aimbot_comum_keybind",
    Value = "K", 
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
    Flag = "aimbot_rage_keybind",
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
    Flag = "esp_keybind",
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
        end
        print("ESP toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Fly
SectionKeyBinds:Keybind({
    Title = "Fly (F)",
    Flag = "fly_keybind",
    Value = "F",
    Callback = function(key)
        toggleFly(not FlyEnabled)
        print("Fly toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Spin
SectionKeyBinds:Keybind({
    Title = "Spin (G)",
    Flag = "spin_keybind",
    Value = "G",
    Callback = function(key)
        toggleSpin(not SpinEnabled)
        print("Spin toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Loop TP
SectionKeyBinds:Keybind({
    Title = "Loop TP (T)",
    Flag = "looptp_keybind",
    Value = "T",
    Callback = function(key)
        toggleLoopTP(not LoopTPEnabled)
        print("Loop TP toggled via keybind:", key)
    end
})

TabSettings:Space({ Columns = 2 })

local SectionConfigFuncs = TabSettings:Section({
    Title = "Configurações de funções",
    Desc = "Aqui você pode encontrar funções para alterar comportamentos do jogo e do personagem.",
    Icon = "settings",
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


SectionConfigFuncs:Toggle({
    Title = "Modo anonymous",
    Desc = "Ativa o modo anonymous, que esconde seu nome e imagem do painel",
    Icon = "user",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Value = false,
    Callback = function(state)
        Window.User:SetAnonymous(state)
    end
})

SectionConfigFuncs:Space({ Columns = 1 })

SectionConfigFuncs:Toggle({ })

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
    Desc = "Ativa o modo voo",
    Icon = "solar:rocket-bold",
    Locked = false,
    LockedTitle = "Em desenvolvimento.",
    Value = false,
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

TabPersonagem:Space({Columns = 2})

local SectionMov2 = TabPersonagem:Section({
    Title = "Proteção",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

SectionMov2:Toggle({
    Title = "Anti-Ragdoll",
    Desc = "Impede o personagem de cair/ragdoll.",
    Icon = "solar:shield-bold",
    Value = false,
    Callback = function(state)
        toggleAntiRagdoll(state)
    end
})

TabPersonagem:Space({ Columns = 1 })

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
		LoopTPTargetName = option.Title
        TeleporteToPlayer(option.Title)
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

TabMisc:Space({ Columns = 1 })

local SectionExploits = TabMisc:Section({
    Title = "Exploits",
    Desc = " Funções exploits do Royal Hub. ( pode não funcionar )", 
    Icon = "solar:flash-bold", 
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

local DropdownSelectPlayerFling = SectionExploits:Dropdown({
    Title = "Selecione Jogador",
    Values = playerValues,
    Locked = false,
    LockedTitle = "Em manutenção.",
    Multi = false,
    Default = nil,
    Callback = function(selected)
       FlingTargetPlayer = selected.Player
    end
})

local SliderFling = SectionExploits:Slider({
    Title = "Fling Power",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
    Min = 0,
    Max = 5000,
    Default = 0,
    },
    Callback = function(value)
        FlingPower = value
    end
})

local LoopFling = SectionExploits:Toggle({
    Title = "Loop Fling",
    Locked = true,
    LockedTitle = "Em desenvolvimento",
    Default = false,
    Callback = function(enabled)
        LoopFlingEnabled = enabled
        if enabled then
            if not FlingTargetPlayer then
                WindUI:Notify({Title = "Erro", Content = "Selecione um alvo!", Duration = 3})
                return false
            end
            LoopFlingConnection = S.Run.Heartbeat:Connect(function()
                if LoopFlingEnabled then
                    Fling(FlingTargetPlayer, FlingPower)
                end
            end)
        else
            if LoopFlingConnection then
                LoopFlingConnection:Disconnect()
                LoopFlingConnection = nil
            end
        end
    end
})

local flingButton = SectionExploits:Button({
    Title = "Fling Player",
    Locked = true,
    LockedTitle = "Em desenvolvimento.",
    Desc = "Faz o jogador selecionado voar pelo mapa.",
    Locked = false,
    LockedTitle = "Em manutenção.",
    Callback = function()
        if FlingTargetPlayer then
            Fling(FlingTargetPlayer, FlingPower)
            WindUI:Notify({
                Title = "Fling",
                Content = "Arremessado: " .. FlingTargetPlayer.Name,
                Duration = 3,
                Icon = "wind"
            })
        else
            WindUI:Notify({
                Title = "Erro",
                Content = "Selecione um alvo primeiro!",
                Duration = 3,
                Icon = "alert-circle"
            })
        end
    end
})

TabMisc:Space({ Columns = 1 })

local spyToggle = SectionExploits:Toggle({
    Title = "SpyChat",
    Desc = "Espiona TODOS chats privados/DMs.",
    Locked = true,
    LockedTitle = "Em manutenção.",
    Icon = "solar:eye-bold",
    Value = false,
    Callback = toggleSpyChat
})


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

local ToggleSpin = SectionFun:Toggle({
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

SectionFun:Space({ Columns = 1 })

local orbitDropdown = SectionFun:Dropdown({
    Title = "Selecione Jogador",
    Values = playerValues, 
    Multi = false,
    Default = nil,
    Callback = function(selected)
        OrbitTargetName = selected.Title 
    end
})

local orbitToggle = SectionFun:Toggle({
    Title = "Ativar Orbit",
    Default = false,
    Callback = toggleOrbit
})


local orbitSlider = SectionFun:Slider({
    Title = "Velocidade Rotação",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
    Min = 0.1,
    Max = 10,
    Default = 1,
    },
    Callback = setOrbitSpeed
})

SectionFun:Space({ Columns = 1 })

local trollDropdown = SectionFun:Dropdown({
    Title = "IDs Troll Prontos",
    Locked = true,
    LockedTitle = "Em manutenção",
    Values = trollAudios,
    Multi = false,
    Default = nil,
    Callback = function(selected)
        if selected and selected.id then
            currentAudioId = selected.id
            WindUI:Notify({
                Title = "Troll Selecionado",
                Content = "Carregado: " .. selected.Title .. " (ID: " .. selected.id .. ")",
                Duration = 3,
                Icon = "zap"
            })
        end
    end
})

local volumeSlider = SectionFun:Slider({
    Title = "Volume",
    Locked = true,
    LockedTitle = "Em manutenção.",
    Value = {
        Min = 1,
        Max = 20,
        Default = 5
    },
    Callback = function(value)
        currentVolume = value
    end
})

local PlayAudio = SectionFun:Button({
    Title = "Tocar Global",
    locked = true,
    LockedTitle = "Em manutenção.",
    Callback = function()
        playGlobalAudioRemote(currentAudio, currentVolume)
        game:GetService("ReplicatedStorage").Remotes:FindFirstChild("BuyMusicPass"):FireServer()  -- Tenta bypass (pode não funcionar)
    end
})

SectionFun:Space({ Columns = 1 })

local EmoteDropdown = SectionFun:Dropdown({
    Title = "Selecione Emote",
    Desc = "Emotes disponíveis (mesmo sem ter na conta).",
    Values = emoteValues,
    Multi = false,
    Default = nil,
    Callback = function(selected)
        SelectedEmote = selected.Title
    end
})

local emoteLoopToggle = SectionFun:Toggle({
    Title = "Loop Emote",
    Desc = "Faz o emote repetir automaticamente.",
    Icon = "solar:repeat-bold",
    Value = false,
    Callback = function(state)
        LoopEmote = state
        
        if CurrentEmoteTrack and CurrentEmoteTrack.IsPlaying then
            if state then

                if not EmoteLoopConnection then
                    activateManualLoop(CurrentEmoteTrack)
                end
            else

                if EmoteLoopConnection then
                    EmoteLoopConnection:Disconnect()
                    EmoteLoopConnection = nil
                end
                CurrentEmoteTrack:Stop()
                CurrentEmoteTrack = nil
            end
        end
        
        WindUI:Notify({
            Title = "Emote",
            Content = "Loop " .. (state and "ativado!" or "desativado!"),
            Duration = 2,
            Icon = "repeat"
        })
    end
})

SectionFun:Space({ Columns = 1 })

local EmoteStart = SectionFun:Button({
    Title = "Usar Emote",
    Desc = "Executa o emote selecionado.",
    Icon = "solar:emoji-funny-square-bold",
    Callback = function()
        if not SelectedEmote then
            WindUI:Notify({
                Title = "Emote",
                Content = "Selecione um emote primeiro!",
                Duration = 4,
                Icon = "alert-circle"
            })
            return
        end
        
        local emoteID = emoteList[SelectedEmote]
        if not emoteID then return end
        
        local localPlayer = S.Players.LocalPlayer
        local localChar = localPlayer.Character
        if not localChar then return end
        
        local humanoid = localChar:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then return end
        
        if CurrentEmoteTrack then
            CurrentEmoteTrack:Stop()
            CurrentEmoteTrack = nil
        end
        if EmoteLoopConnection then
            EmoteLoopConnection:Disconnect()
            EmoteLoopConnection = nil
        end
        
        local success, track = pcall(function()
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. emoteID
            local loadedTrack = animator:LoadAnimation(anim)
            loadedTrack.Priority = Enum.AnimationPriority.Action
            loadedTrack.Looped = false 
            loadedTrack:Play()
            return loadedTrack
        end)
        
        if not success or not track then
            WindUI:Notify({
                Title = "Emote",
                Content = "Falha ao carregar " .. SelectedEmote .. "! ID inválido.",
                Duration = 5,
                Icon = "alert-circle"
            })
            return
        end
        
        CurrentEmoteTrack = track
        
        if LoopEmote then
            activateManualLoop(track)
        else

            track.Stopped:Connect(function()
                if track == CurrentEmoteTrack then
                    CurrentEmoteTrack = nil
                end
            end)
        end
        
        WindUI:Notify({
            Title = "Emote",
            Content = "Tocando " .. SelectedEmote .. (LoopEmote and " em LOOP INFINITO!" or "!"),
            Duration = 3,
            Icon = "smile"
        })
    end
})

local emoteStopButton = SectionFun:Button({
    Title = "Parar Emote",
    Desc = "Interrompe o emote atual.",
    Icon = "solar:stop-bold", 
    Callback = function()
       if CurrentEmoteTrack then
            CurrentEmoteTrack:Stop()
            CurrentEmoteTrack = nil
        end
        if EmoteLoopConnection then
            EmoteLoopConnection:Disconnect()
            EmoteLoopConnection = nil
        end
        LoopEmote = false
        emoteLoopToggle:Set(false)
        WindUI:Notify({
            Title = "Emote",
            Content = "Emote e loop parados!",
            Duration = 3,
            Icon = "x"
        })
    end
})

local SectionUtility = TabMisc:Section({
    Title = "Utilidades",
    Desc = "Copy Player, Anti-Kick e Remote Spy.",
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

-- Copy Player
SectionUtility:Dropdown({
    Title = "Copy Player — Selecionar",
    Desc = "Selecione o jogador para copiar o visual.",
    Values = playerValues,
    Value = playerValues[1],
    Callback = function(option)
        CopyTargetPlayer = S.Players:FindFirstChild(option.Title)
    end
})

SectionUtility:Button({
    Title = "Copiar Visual",
    Desc = "Copia o outfit do jogador selecionado.",
    Icon = "solar:user-bold",
    Callback = function()
        copyPlayerLook(CopyTargetPlayer)
    end
})

SectionUtility:Space({Columns = 1})

-- Anti-Kick
SectionUtility:Toggle({
    Title = "Anti-Kick",
    Desc = "Bloqueia tentativas de kick do servidor.",
    Icon = "solar:shield-check-bold",
    Value = false,
    Callback = function(state)
        AntiKickEnabled = state
        WindUI:Notify({
            Title = "Anti-Kick",
            Content = state and "Ativado!" or "Desativado.",
            Duration = 2,
            Icon = state and "shield" or "x"
        })
    end
})

SectionUtility:Space({Columns = 1})

-- Remote Spy
SectionUtility:Toggle({
    Title = "Remote Spy",
    Desc = "Loga todos os RemoteEvents disparados no console.",
    Icon = "solar:eye-bold",
    Value = false,
    Callback = function(state)
        RemoteSpyEnabled = state
        if state then RemoteLogs = {} end
        WindUI:Notify({
            Title = "Remote Spy",
            Content = state and "Logando remotes no console..." or "Parado.",
            Duration = 2,
            Icon = state and "eye" or "x"
        })
    end
})

SectionUtility:Button({
    Title = "Copiar Logs",
    Desc = "Copia todos os remotes capturados para a área de transferência.",
    Icon = "solar:copy-bold",
    Callback = function()
        if #RemoteLogs == 0 then
            WindUI:Notify({Title = "Remote Spy", Content = "Nenhum log capturado ainda.", Duration = 3, Icon = "alert-circle"})
            return
        end
        local lines = {}
        for _, entry in ipairs(RemoteLogs) do
            table.insert(lines, string.format("[%.2fs] %s", entry.t, entry.text))
        end
        pcall(function() setclipboard(table.concat(lines, "\n")) end)
        WindUI:Notify({
            Title = "Remote Spy",
            Content = #RemoteLogs .. " logs copiados!",
            Duration = 3,
            Icon = "check"
        })
    end
})

SectionUtility:Button({
    Title = "Limpar Logs",
    Icon = "solar:trash-bin-trash-bold",
    Callback = function()
        RemoteLogs = {}
        WindUI:Notify({Title = "Remote Spy", Content = "Logs limpos.", Duration = 2, Icon = "trash"})
    end
})

------------------------------* TabExploits *-------------------------------

local SectionExploitsTab = TabExploits:Section({
    Title = "BrookHaven",
    Desc = "", 
    Icon = "solar:bolt-bold", 
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

SectionExploitsTab:Button({
    Title = "FAELZIN HUB",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/PhantomClientDEV/6d65c2e0f668d998b4be8dcab6d9f969/raw/6d1f08a15d890149f5c033b6f29d51eda3de7149/HalloweenV2.lua", true))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "BRUTON HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/BRUTON-HUB-/refs/heads/main/BRUTON"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "CARTOLA HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "PILOT HUB",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/mbm9XDQG'))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "SALVATORE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RFR-R1CH4RD/Loader/main/Salvatore.lua"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "SANDER XY",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "HX HEXAGON",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nxvap/hexagon/refs/heads/main/brookhaven"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "COVET HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pl4y80ytt-a11y/VoidHub/refs/heads/main/covet"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "LOBO HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/luauhubs666/lobohub/refs/heads/main/lobohub.luau"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "FORBID SPAMMER",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/QjmKIpUW/raw"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "SPECTRA HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/assure157tv157157157-boop/Spectra-HUB-V2-/refs/heads/main/URL%20do%20scriptblox"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "CHAD HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bjair5955-wq/Chad-Hub-V2.0/refs/heads/main/obfuscated.lua%20(3).txt"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "MAX HUB",
    Callback = function()
        loadstring(game:HttpGet("https://scriptsneonauth.vercel.app/api/scripts/565a57db-dea3-46cf-b46d-1cfcdcbe7700/raw"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "CHAD HUB V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bjair5955-wq/Chad-Hub-V2.0/refs/heads/main/obfuscated.lua%20(3).txt"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "PHANTOM CLIENT",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/phantomdevelopers078-star/125196a67d4baa872a569230471dd38b/raw/20eed7bae23eac4fddf8177ca64a3f6323313aca/PhantomClienteasy.lua"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "LYRA HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kayrus999/Lyrapainel/refs/heads/main/Lyrabrookhaven"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "SANT HUB",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Nytherune-Hub-58124"))()
    end
})

TabExploits:Space({ Columns = 2 })

local SectionExpUniv = TabExploits:Section({
    Title = "King-Legacy",
    Desc = "", 
    Icon = "solar:bolt-bold", 
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

SectionExpUniv:Button({
    Title = "ZEE-HUB UPD 9",
    Desc = "",
    Callback = function()
        loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))()
    end
})
TabExploits:Space({ Columns = 1 })


local SectionUniversal = TabExploits:Section({
    Title = "Universais",
    Desc = "",
    Icon = "solar:bolt-bold",
    Box = true,
    BoxBorder = true,
    Opened = true,
})

SectionUniversal:Button({
     Title = "DEX-EXPLORER",
     Desc = "",
     Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end
})

SectionUniversal:Space({ Columns = 1 })

SectionUniversal:Button({
     Title = "TCA GUI",
     Desc = "",
     Callback = function()
        require(82040251531905):TCA("username")
    end
})

SectionUniversal:Space({ Columns = 1 })

SectionUniversal:Button({
     Title = "INFINITE YIELD",
     Desc = "",
     Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
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

    Locked = false,
})

TabInfo:Space({ Columns = 1 })

local DevParagraph2 = TabInfo:Paragraph({
    Title = "Einzbern",
    Desc = "Co-desenvolvedor do Royal Hub, focado em design e ideias de funções.",
    Color = "Grey",
    Image = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/Devs%20icon/EinzbernRounded.png",
    ImageSize = 60,

    Locked = false,
})

TabInfo:Space({ Columns = 2 })

local ParagraphLink = TabInfo:Paragraph({
    Title = "Link do Discord",
    Desc = "Este é o link do nosso Discord, entre para ficar por dentro das novidades e atualizações do Royal Hub!",
    Color = "Grey",
    Image = "geist:logo-discord",
    ImageSize = 40,

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