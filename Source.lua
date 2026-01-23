local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Icons = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"))()

local PrimaryColor = Color3.fromHex("#ffffff")
local SecondaryColor = Color3.fromHex("#315dff")

-- Change default icon set
Icons.SetIconsType("geist")
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
-- function(Key):
--   local Window = WindUI:CreateWindow({
 --   KeySystem = {                                                   
 --      Note = "Example Key System. With platoboost.",              
 --       API = {                                                     
 --           { -- PlatoBoost
 --               Type = "platoboost",                                
 --               ServiceId = 19220, -- service id
  --              Secret = "b549aa50-d100-4cfa-a4b4-cb5503d207af", -- platoboost secret
 --           },                                                      
 --       },                                                          
 --   },                                                              
--})
--------------------------------------------------------------INFORMAÇÕES---------------------------------------------------------
--local Players = game:GetService("Players")
--local MarketplaceService = game:GetService("MarketplaceService")
--local RunService = game:GetService("RunService")

--local player = Players.LocalPlayer
--local placeId = game.PlaceId

-- Obter nome do lugar (mapa) via MarketplaceService (pode falhar em alguns jogos)
--local placeName = "Carregando..."
--local success, err = pcall(function()
 --   placeName = MarketplaceService:GetProductInfo(placeId).Name
--end)
--if not success then
--    placeName = "Mapa Desconhecido"   
----end

-- Tempo no servidor (atualizado a cada segundo)
--local startTime = os.time()
--local timeInServer = 0

-- Atualiza o tempo no servidor
--RunService.Heartbeat:Connect(function()
 --   timeInServer = os.time() - startTime
--end)

------------------------------------------------------- Icons --------------------------------------------------------------
local InicioIcon = Icons.Icon("user")
local trolIcon = Icons.Icon("crosshair")
local utilIcon = Icons.Icon("acessibility")
local settingIcon = Icons.Icon("settings-gear")
local UIcon = Icons.Icon("star")
local eye_dashed = Icons.Icon("eye-dashed")
--------------------------------------------------- Translations -----------------------------------------------------------
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
}})

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
----------------------------------------------DETECTAR USUARIO----------------------------------
local localPlayer = game:GetService("Players").LocalPlayer
local playerName = localPlayer.Name
local isWhitelisted = (playerName == "S1wlkrX" or playerName == "thenoctisblack78")

print("Usuário detectado:", playerName)
print("É whitelistado?", isWhitelisted)
---------------------------------------------- Popup -------------------------------------------

WindUI:Popup({ 
    Title = "Royal Hub King Legacy version",
    Icon = "info",
    Content = "Esta script está em desenvolvimento, pode ocorrer bugs!",
    Buttoms = { 
        { 
            Title = "Sair",
            Callback = function() end,
            Variant = "Tertiary",

        },
        { 
            Title = "Continuar mesmo assim",
            Callback = function() end,
            Variant = "Primary",
        }
    }
})

------------------------------------------ Notificação---------------------------------------------------

WindUi:Notify({
    Title = "Congratulations!",
    Content = "Obrigado por testar esta script, boa play!",
    Duration = 3,
    Icon = "acessibility"
})

------------------------------------------ Window ------------------------------------------------------
local function createWindow()
    if isWhitelisted then
        -- Se for usuário whitelistado, cria a window diretamente sem sistema de key
        print("Usuário whitelistado detectado. Pulando sistema de key...")
        
        local Window = WindUI:CreateWindow({
            Title = "RoyalHub King Legacy",
            Icon = "Open Configs",
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
            user = {
                Enabled = true,
                Anonymous = true,
                Callback = function()
                    print("Executado.")
             end
            }
        })

        return Window
        
    else
          -- Se não for whitelistado, usa o sistema de key
        print("Sistema de key ativado...")
        
        local Window = WindUI:CreateWindow({
            Title = "RoyalHub King Legacy",
            Icon = "Open Configs",
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
                Note = "RoyalHub Key System. With platoboost.",              
                API = {                                                     
                    { -- PlatoBoost
                        Type = "platoboost",                                
                        ServiceId = 19220, -- service id
                        Secret = "b549aa50-d100-4cfa-a4b4-cb5503d207af", -- platoboost secret
                    },                                                      
                },                                                          
            },
            user = {
                Enabled = true,
                Anonymous = true,
                Callback = function()
                    print("Executado.")
                end
            }
        })

          -- Callback quando a key é validada
        Window:OnKeyValidated(function()
            print("Key validada com sucesso!")
        end)
        
        return Window
    end
end
---------------------------------------TAB---------------------------------------
    local Tab = Window:Tab({
    Title = "Home",
    Icon = "crosshair", 
    Locked = false,
    Tab:Select() -- Select Tab
})

local Button = Tab:Button({
    Title = "Configurações",
    Desc = "Altere o tema da UI.",
    Locked = false,
    Callback = function()

    end

})

-----------------------------THEMES-------------------------------------

    WindUI:AddTheme({
    Name = "Hutao By Einzbern.", -- theme name
    
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#101010"), -- Accent
    Outline = Color3.fromHex("#000000"),
    Text = Color3.fromHex("#000000"),
    Placeholder = Color3.fromHex("#000000"),
    Button = Color3.fromHex("#c40b0b"),
    Icon = Color3.fromHex("#e20505"),
})

WindUI:SetTheme("Hutao By Einzbern.")

print("Executado com sucesso!")