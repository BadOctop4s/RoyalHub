-- RoyalHub Source.lua
-- GitHub: https://github.com/BadOctop4s/RoyalHub

print("=== RoyalHub Carregando ===")

-- Detectar ambiente
local RunService = game:GetService("RunService")
local IsStudio = RunService:IsStudio()
local testingMode = IsStudio

-- Configuração de usuário
local Players = game:GetService("Players")
local localPlayer
local success, err = pcall(function()
    localPlayer = Players.LocalPlayer
end)

if not success then
    warn("Aguardando jogador...")
    repeat wait() until Players.LocalPlayer
    localPlayer = Players.LocalPlayer
end

local playerName = localPlayer.Name

-- Whitelist + modo teste
local isWhitelisted = (playerName == "S1wlkrX" or playerName == "thenoctisblack78" or "DARK_ZINN")

print("Usuário:", playerName)
print("Whitelistado:", isWhitelisted)
print("Modo Teste:", testingMode)

-- Carregar bibliotecas
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Icons = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"))()

Icons.SetIconsType("geist")

-- Configurações
local PrimaryColor = Color3.fromHex("#ffffff")
local SecondaryColor = Color3.fromHex("#315dff")

-------------------------------------------------------------SERVICES---------------------------------------------------------
local S = {
    Players = game:GetService("Players"),
    Tween = game:GetService("TweenService"),
    RS = game:GetService("ReplicatedStorage"),
    WS = game:GetService("Workspace"),
    Run = game:GetService("RunService"),
    UI = game:GetService("UserInputService"),
    Sound = game:GetService("SoundService"),
}

--------------------------------------------------- Funções do personagem------------------------------------------------------
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

-- Função de Teleporte
local function teleportToPlayer(targetPlayer)
    local player = S.Players.LocalPlayer
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end

local function copySkin(targetPlayer)
    local localPlayer = S.Players.LocalPlayer
    local targetChar = targetPlayer.Character
    local localChar = localPlayer.Character

    if not targetChar or not localChar then return end

    -- Limpa roupas e acessórios atuais (opcional)
    for _, item in pairs(localChar:GetChildren()) do
        if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("Accessory") then
            item:Destroy()
        end
    end

    -- Copia roupas e acessórios do jogador alvo
    for _, item in pairs(targetChar:GetChildren()) do
        if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("Accessory") then
            local clone = item:Clone()
            clone.Parent = localChar
        end
    end
end

-----------------------------------------------------------Key-------------------------------------------------------
-- Função para criar a window baseada no status do usuário
local function createWindow()
    if isWhitelisted then
        -- Se for usuário whitelistado ou modo teste
        print("RoyalHub: Modo diretor ativado")
        
        local Window = WindUI:CreateWindow({
            Title = "RoyalHub King Legacy",
            Icon = "settings",
            Author = "Einzbern, Eodraxkk",
            Folder = "RoyalHub",
            Size = UDim2.fromOffset(500, 460),
            MinSize = Vector2.new(550, 350),
            MaxSize = Vector2.new(850, 560),
            Transparent = true,
            Theme = "Dark",
            Resizable = true,
            SideBarWidth = 200,
            BackgroundImageTransparency = 0.42,
            HideSearchBar = true,
            ScrollBarEnabled = true,
            user = {
                Enabled = true,
                Anonymous = false,
                Callback = function()
                    print("RoyalHub inicializado.")
                end
            }
        })
        
        return Window
    else
        -- Se não for whitelistado, usa o sistema de key
        print("RoyalHub: Sistema de key ativado")
        
        local Window = WindUI:CreateWindow({
            Title = "RoyalHub King Legacy",
            Icon = "settings",
            Author = "Einzbern",
            Folder = "RoyalHub",
            Size = UDim2.fromOffset(500, 460),
            MinSize = Vector2.new(550, 350),
            MaxSize = Vector2.new(850, 560),
            Transparent = true,
            Theme = "Dark",
            Resizable = true,
            SideBarWidth = 200,
            BackgroundImageTransparency = 0.42,
            HideSearchBar = true,
            ScrollBarEnabled = true,
            KeySystem = {                                                   
                Note = "RoyalHub Key System",              
                API = {                                                     
                    { -- PlatoBoost
                        Type = "platoboost",                                
                        ServiceId = 19220,
                        Secret = "b549aa50-d100-4cfa-a4b4-cb5503d207af",
                    },                                                      
                },                                                          
            },
            user = {
                Enabled = true,
                Anonymous = true,
                Callback = function()
                    print("RoyalHub inicializado com key.")
                end
            }
        })
        
        -- Callback quando a key é validada
        if Window and Window.OnKeyValidated then
            Window:OnKeyValidated(function()
                print("RoyalHub: Key validada com sucesso!")
            end)
        end
        
        return Window
    end
end

-- Cria a window
local Window = createWindow()

--------------------------------------------------------------INFORMAÇÕES---------------------------------------------------------
local MarketplaceService = game:GetService("MarketplaceService")

local placeId = game.PlaceId

-- Obter nome do lugar (mapa) via MarketplaceService (pode falhar em alguns jogos)
local placeName = "Carregando..."
local success2, err2 = pcall(function()
    placeName = MarketplaceService:GetProductInfo(placeId).Name
end)
if not success2 then
    placeName = "Mapa Desconhecido"
end

-- Tempo no servidor (atualizado a cada segundo)
local startTime = os.time()
local timeInServer = 0

-- Atualiza o tempo no servidor
RunService.Heartbeat:Connect(function()
    timeInServer = os.time() - startTime
end)

------------------------------------------------------- Icons --------------------------------------------------------------
local InicioIcon = Icons.Icon("user")
local trolIcon = Icons.Icon("crosshair")
local utilIcon = Icons.Icon("acessibility")
local settingIcon = Icons.Icon("settings-gear")
local UIcon = Icons.Icon("star")
local eye_dashed = Icons.Icon("eye-dashed")

--------------------------------------------------- Translations -----------------------------------------------------------
-- CORRIGIDO: Fechando corretamente as tabelas
WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "pt",
    Translations = {
        ["ru"] = {
            ["TittleHub"] = "RoyalHub",
            ["Inicio"] = "You",
            ["WELCOME"] = "Добро пожаловать в RoyalHub!",
            ["LIB_DESC"] = "Библиотека для создания красивых интерфейсов",
            ["SETTINGS"] = "Настройки",
            ["APPEARANCE"] = "Внешний вид",
            ["FEATURES"] = "Функционал",
            ["UTILITIES"] = "Инструменты",
            ["UI_ELEMENTS"] = "UI Элементы",
            ["CONFIGURATION"] = "Конфигурация",
            ["SAVE_CONFIG"] = "Сохранить конфигурацию",
            ["LOAD_CONFIG"] = "Загрузить конфигурацию",
            ["THEME_SELECT"] = "Выберите тему",
        },
        ["en"] = {
            ["TittleHub"] = "RoyalHub demo",
            ["Inicio"] = "You",
            ["WELCOME"] = "Welcome to RoyalHub!",
            ["LIB_DESC"] = "Best universal script for Roblox!",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["ini_desc"] = "your profile description and etc",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
        },
        ["es"] = {
            ["TittleHub"] = "RoyalHub demo",
            ["Inicio"] = "Tu perfil",
            ["WELCOME"] = "¡Bienvenido a RoyalHub!",
            ["LIB_DESC"] = "¡Mejor script universal para Roblox!",
            ["SETTINGS"] = "Configuraciones",
            ["APPEARANCE"] = "Apariencia",
            ["FEATURES"] = "Características",
            ["UTILITIES"] = "Utilidades",
            ["UI_ELEMENTS"] = "Elementos de UI",
            ["CONFIGURATION"] = "Configuración",
            ["SAVE_CONFIG"] = "Guardar Configuración",
            ["LOAD_CONFIG"] = "Cargar Configuración",
            ["THEME_SELECT"] = "Seleccionar Tema",
        },
        ["pt"] = {
            ["TittleHub"] = "RoyalHub demo",
            ["Inicio"] = "Seu perfil",
            ["WELCOME"] = "Bem-vindo ao RoyalHub!",
            ["LIB_DESC"] = "Melhor script universal para Roblox!",
            ["SETTINGS"] = "Configuracões",
            ["APPEARANCE"] = "Aparencia",
            ["FEATURES"] = "Novidades",
            ["UTILITIES"] = "Utilidades",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configurar",
            ["SAVE_CONFIG"] = "Salvar Configuração",
            ["LOAD_CONFIG"] = "Carregar Configuração",
            ["THEME_SELECT"] = "Selecionar Tema",
        }
    }
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

---------------------------------------------- Popup -------------------------------------------
-- CORRIGIDO: "Buttoms" para "Buttons"
if Window then
    WindUI:Popup({ 
        Title = "Royal Hub King Legacy version",
        Icon = "info",
        Content = "Esta script está em desenvolvimento, pode ocorrer bugs!",
        Buttons = { 
            { 
                Title = "Sair",
                Callback = function() 
                    print("Popup fechado")
                end,
                Variant = "Tertiary",
            },
            { 
                Title = "Continuar mesmo assim",
                Callback = function() 
                    print("Continuando...")
                end,
                Variant = "Primary",
            }
        }
    })
--------------------------------------------Tema----------------------------------------------------------
WindUI:AddTheme({
        Name = "Hutao By Einzbern.", -- theme name
        Accent = Color3.fromHex("#18181b"),
        Background = Color3.fromHex("#101010"), -- Accent
        Outline = Color3.fromHex("#000000"),
        Text = Color3.fromHex("#f70000"),
        Placeholder = Color3.fromHex("#000000"),
        Button = Color3.fromHex("#c40b0b"),
        Icon = Color3.fromHex("#e20505"),
})
WindUI:AddTheme({
    Name = "Dark Theme", -- theme name
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#000000"), -- Accent
    Outline = Color3.fromHex("#020101"),
    Text = Color3.fromHex("#222222"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#000000"),
    Icon = Color3.fromHex("#000000"),   
})

WindUI:AddTheme({
    Name = "Main Theme",
    Accent = Color3.fromHex("#000000"),
    Background = Color3.fromHex("#000000"),
    Outline = Color3.fromHex("#000000"),
    Text = Color3.fromHex("#fff4f4"),
    Placeholder = Color3.fromHex("#ffffff"),
    Button = Color3.fromHex("#000000"),
    Icon = Color3.fromHex("#fffcfc"),
})

------------------------------------------ Notificação---------------------------------------------------
-- CORRIGIDO: Sintaxe correta para a notificação
if Window then
    WindUI:Notify({
        Title = "Congratulations!",
        Content = "Obrigado por testar esta script, boa jogatina!",
        Duration = 3,
        Icon = "accessibility"
    })
end

-- Só cria as tabs se a Window existir
if Window then
    ------------------------------------------- Window ------------------------------------------------------
    local Tab = Window:Tab({
        Title = "Home",
        Icon = "crosshair", 
        Locked = false,
    }) 
    
    Tab:Select() -- Select Tab

    local Button = Tab:Button({
        Title = "Tema",
        Desc = "Altere o tema da UI.",
        Locked = false,
        Callback = function()
            print("Botão de configurações clicado"),
            WindUI:SetTheme("Hutao By Einzbern.")
        end
    })

    local PersonagemTab = Window:Tab({
        Title = "Personagem"
        Icon = "user"
    }) 
       -- Adicione mais elementos aqui...
    Button:SetTitle("Settings")
    Button:SetDesc("False")
    -- Button:Lock() -- Descomente se quiser travar
    
    -- Adicione mais tabs e elementos conforme necessário
    local InfoTab = Window:Tab({
        Title = "Informações",
        Icon = "info",
    })
---------------------------------------Buttons--------------------------------------
local Slider = PersonagemTab:Slider({
    Title = "Velocidade"
    Desc =  "Nada ainda"

    Step = 1,
    value = {
        Min = 20,
        Max = 500,
        Default = 50,
    },
    Callback = function(value)
        local function setSpeed(value)
             local player = S.Players.LocalPlayer
             local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
             if humanoid then
                 humanoid.WalkSpeed = value
             end
        end
})
    
    local infoSection = InfoTab:CreateSection("Informações do Servidor")
    infoSection:CreateLabel("Nome do Mapa: " .. placeName)
    infoSection:CreateLabel("ID do Mapa: " .. game.PlaceId)
    infoSection:CreateLabel("Jogador: " .. playerName)
    
    -- Tempo no servidor
    local timeLabel = infoSection:CreateLabel("Tempo no servidor: 0s")
    
    game:GetService("RunService").Heartbeat:Connect(function()
        local currentTime = os.time() - startTime
        local hours = math.floor(currentTime / 3600)
        local minutes = math.floor((currentTime % 3600) / 60)
        local seconds = currentTime % 60
        timeLabel:SetText(string.format("Tempo no servidor: %02d:%02d:%02d", hours, minutes, seconds))
    end)
end

print("=== RoyalHub Carregado ===")