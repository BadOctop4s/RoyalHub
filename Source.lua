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

-------------------------------* KEY SYSTEM *-------------------------------

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

------------------------------* Dialog DestroyGUI *-------------------------------

-------------------------------* Funções externas *-------------------------------

-- local invitecode = "DmdTDgJc"
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
wait(2)

-------------------------------* Janela principal *-------------------------------

local Window = WindUI:CreateWindow({
    Title = "Royal Hub",
    Author = "Eodraxkk & Einzbern  ",
    Folder = "RoyalHub",
    Icon = "solar:crown-minimalistic-bold",
    Theme = "Dark Amoled ( Default )",
    IconSize = 12*2,
    NewElements = true,
    Size = UDim2.fromOffset(700,500),
    
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


-------------------------------* Aviso Keybind *-------------------------------

WindUI:Notify({
    Title = "KeyBind",
    Content = "Aperte Shift Direito para esconder | Mostrar o menu",
    Duration = 4,
    Icon = "user"
})
-------------------------------* PRINT CONSOLE LOADED *-------------------------------
print("===== Royal Hub carregado com sucesso! =====")
print("E ali diante dos meus olhos estava um cavalo branco e seu cavaleiro segurou uma reverência. Ele recebeu uma coroa e partiu, conquistando e conquistar... E saiu outro cavalo, todo vermelho. Ao seu cavaleiro recebeu o poder de tirar a paz da terra e fazer os homens massacrarem um ao outro; e ele recebeu uma grande espada... E ali, enquanto eu olhava, estava um cavalo preto; e seu cavaleiro segurava em sua mão um par de balanças... E lá, enquanto eu olhava, estava outro cavalo, doente e pálido; e o nome do seu cavaleiro era Morte, e Hades veio logo atrás. A ele foi dado poder sobre um quarto da terra, com o direito de matar pela espada e pela fome, pela peste e feras selvagens.")
print(" ========================= Apocalipse 6:1-6 =========================")

-------------------------------* Tags *-------------------------------

Window:Tag({
    Title = "v1.0.9",
    Icon = "github",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 8, -- from 0 to 13
})

Window:Tag({
	Title = "Secure",
	Icon = "shield",
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
-------------------------------* KeyBinds *-------------------------------

 Window:SetToggleKey(Enum.KeyCode.H)

-------------------------------* Tabs *-------------------------------
local Home = Window:Tab({
    Title = "Inicio",
    Icon = "solar:home-2-bold",
    IconColor = DarkGray,
    IconShape = "Square",
    Border = true, 
    Locked = false,
})


local TabPersonagem = Window:Tab({
	Title = "Personagem",
	Icon = "solar:user-bold",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
})

local TabFarm = Window:Tab({
	Title = "Farm",
	Icon = "solar:black-hole-bold",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabShopping = Window:Tab({
	Title = "Loja",
	Icon = "solar:cart-large-bold",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabTeleport Window:Tab({
	Title = "TP & WBHK",
	Icon = "solar:cloud-bold",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabMisc = Window:Tab({ 
	Title = "Misc",
	Icon = "box",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabSettings = Window:Tab({
	Title = "Configurações",
	Icon = "solar:settings-minimalistic-bold",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
})

local TabInfo = Window:Tab({
	Title = "Info",
	Icon = "solar:info-circle-bold",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
    Border = true,
})


------------- *! | Sections | --> Por algum motivo está crashando o jogo, não descomente. ! -------------

--! local infoSection = TabInfo:Section({
--! 	Title = "Sobre Royal Hub",
--! })

--! infoSection:Space({ Columns = 3})

--! infoSection:Section({
--! 	Title = "Oque é Royal Hub",
--! 	TexSize = 24,
--! 	FontWeight = Enum.FontWeight.SemiBold, 
--! })

--! infoSection:Space({ Columns = 3 })

--! infoSectio:Section({
--! 	Title ="TESTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE",
--! 	TextSize = 18,
--! 	TextTransparency = 0.35,
--! 	FontWeight = Enum.FontWeigth.Medium,
--! })

--! TabInfo:Space({ Columns = 4 })

-------------------------------* Buttons Settings *--------------------
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
            WindUI:Notify({
                Title = "Aviso!",
                Content = "Bypass ativado com sucesso! (Funcionalidade em desenvolvimento)",
                Duration = 3,
                Icon = "shield-check"
            })
            print("Bypass Anti-Cheat acionado")
        end
})

-------------------------------* Buttons/Dropdown Settings *-------------------------------

local DropdownTemas = SectionConfig:Dropdown({
    Title = "Temas",
    Desc = "Altera o tema do Royal Hub",
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
        }
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
    Content = "This action cannot be undone.",
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
            Icon = "trash-2", -- optional
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

TabPersonagem:Space({ Columns = 2 })

TabPersonagem:Section({
    Title = "Outros",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

local Toggle = TabPersonagem:Toggle({
    Title = "Esp",
    Desc = "Players ficam visiveis atrás de paredes e marcados.",
    Icon = "solar:eye-bold",
    Type = "Checkbox",
    Locked = true,
    LockedTitle = "Em desenvolvimento",
    Value = false, -- default value
    Callback = function(state)
	--	WindUI:Notify({
	--		Title = "Aviso!",
	--		Content = "Em desenvolvimento!",
	--		Duration = 4,
	--		Icon = "bug"
	--	})
        print("Esp status =" .. tostring(state))
    end
})

ResetGravity = TabPersonagem:Button({
        Title = "Reset Gravity",
        Desc = "Reseta a gravidade para o valor padrão (196.2)",
        Locked = false,
        Callback = function()
            ResetGravity:Highlight()
            WindUI:Notify({
                Title = "Gravidade resetada!",
                Content = "A gravidade foi resetada para o valor padrão (196.2)",
                Duration = 3,
                Icon = "shield-check"
            })
            setGravity(196.2)
            print("Gravidade resetada para 196.2")
    end
})
-------------------------------! Buttons TP & WEBHOOK (Desativado até resolver o bug. !-------------------------------

--local Dropdown = TabTeleport:Dropdown({
--    Title = "Dropdown",
--    Desc = "Dropdown Description",
--    Values = { "Category A", "Category B", "Category C" },
--    Value = "Category A",
--   Callback = function(option) 
--        print("Category selected: " .. option) 
--    end
--})
-------------------------------* Paragrafos *-------------------------------
TabInfo:Section({
    Title = "Nosso Discord",
    TextSize = 24,
    FontWeight = Enum.FontWeight.SemiBold,
})

local Paragraph = TabInfo:Paragraph({
    Title = "Link do Discord",
    Desc = "Este é o link do nosso Discord, entre para ficar por dentro das novidades e atualizações do Royal Hub!",
    Color = "Grey",
    Image = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/icons8-logo-discord-96.png",
    ImageSize = 45,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "",
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

TabInfo:Section({
    Title = "Sobre o Royal Hub",
    TextSize = 24,
    FontWeight = Enum.FontWeight.SemiBold,
})

TabInfo:Section({
        Title = "Royal Hub é um script feito para o Roblox, Criado apenas por dois desenvolvedores e focado em entregar uma experiência completa e segura para os jogadores. Com uma variedade de funcionalidades, desde melhorias no personagem até opções de farm automatizado, o Royal Hub visa facilitar a jogabilidade e proporcionar vantagens estratégicas dentro do jogo. Desenvolvido com atenção à segurança, o script busca garantir que os usuários possam aproveitar suas funcionalidades sem comprometer a integridade de suas contas. Seja você um jogador casual ou um entusiasta dedicado, o Royal Hub oferece ferramentas que podem aprimorar sua experiência em diversos jogos.",
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
 })