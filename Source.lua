local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

-------------------------------* Cores *--------------------------

local Purple = Color3.fromHex("#7775F2")
local Yellow = Color3.fromHex("#ECA201")
local Green = Color3.fromHex("#10C550")
local Grey = Color3.fromHex("#83889E")
local Blue = Color3.fromHex("#257AF7")
local Red = Color3.fromHex("#EF4F1D")

-------------------------------* Icones *---------------------------------
local Janela = "geist:window"
local wrench = "geist:wrench"
local Home = "geist:home"
local InfoICO = "geist:asterisk"
local Key = "geist:key"
local discord = "geist:logo-discord"
local box = "geist:box"
local config = "geist:agents"
local accessibility = "geist:accessibility"
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
    Background = Color3.fromHex("#101010"),
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

-------------------------------* Notificação *-------------------------------

WindUI:Notify({
    Title = "Royal Hub - Aviso!",
    Content = "Script em desenvolvimento, funções podem quebrar com o decorrer do tempo.",
    Duration = 8, -- 3 seconds
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
	Content = "Usuario registrado com sucesso!, carregando hub...",
	Duration = 3,
	Ico = "bug"
})
wait(4)

-------------------------------* Janela principal *-------------------------------

local Window = WindUI:CreateWindow({
    Title = "Royal Hub - King Legacy",
    Author = "Eodraxkk • Einzbern",
    Folder = "RoyalHub",
    Icon = "solar:crown-minimalistic-bold",
    Theme = "Dark Amoled ( Default )",
    --IconSize = 22*2,
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
    Title = "Royal Hub - 1.0",
    Icon = "github",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 13, -- from 0 to 13
})

Window:Tag({
	Title = "Secure",
	Icon = "shield",
	Color = Color3.fromHex("#30ff6a"),
	Radius = 13
})

-------------------------------* KeyBinds *-------------------------------

 Window:SetToggleKey(Enum.KeyCode.RightShift)

----------------------------Tabs-----------------------
local Home = Window:Tab({
    Title = "Inicio",
    Icon = "solar:home-bold", -- optional
    Locked = false,
})


local TabPersonagem = Window:Tab({
	Title = "Personagem",
	Icon = "solar:user-bold",
	Locked = false,
})

local TabFarm = Window:Tab({
	Title = "Farm",
	Icon = "solar:black-hole-bold",
	Locked = false,

})

local TabShopping = Window:Tab({
	Title = "Loja",
	Icon = "solar:cart-large-bold",
	Locked = false,

})

local TabTeleport Window:Tab({
	Title = "TP & WBHK",
	Icon = "solar:cloud-bold",
	Locked = false,

})

local TabMisc = Window:Tab({ 
	Title = "Misc",
	Icon = "box",
	Locked = false,

})

local TabSettings = Window:Tab({
	Title = "Configurações",
	Icon = "solar:settings-minimalistic-bold",
	Locked = false,
})

local TabInfo = Window:Tab({
	Title = "Info",
	Icon = "solar:info-circle-bold",
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



-------------------------------* DropDown Settings *-------------------------------

local DropdownTemas = TabSettings:Dropdown({
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
    },
    Value = "Dark Amoled ( Default )",
    Callback = function(option)
        WindUI:SetTheme(option.Title)
        print("Category selected: " .. option.Title) 
    end
})

local DropDownKeyBind = TabSettings:Dropdown({
    Title = "KeyBinds",
    Desc = "Altera a tecla que esconde | Mostra o menu!",
    Values = {
        {
            Title = "RightShift",
        },
        {
            Title = "H",
        },
        {
            Title = "RightCtrl",
        },
        {
            Title = "F1",
        },
        {
            Title = "RightAlt",
        },

    },
    Value = "RightShift",
    Callback = function(option)
        WindUI:Notify({
            Title = "Aviso!",
            Content = "Função indisponivel no momento!",
            Duration = 3,
            Icon = "bug"
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
    Icon = "bird",
    Type = "Checkbox",
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

local ResetGravity = TabPersonagem:Button({
    Title = "Reset Gravity",
    Desc = "Reseta a gravidade para o valor padrão (196.2)",
    Locked = false,
    Callback = function()
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
    Color = "Red",
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

