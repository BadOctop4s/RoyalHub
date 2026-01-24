local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

------------------------------Icones---------------------------------
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
------------------------------Serviços personagem--------------------
local S = {
    Players = game:GetService("Players"),
    Tween = game:GetService("TweenService"),
    RS = game:GetService("ReplicatedStorage"),
    WS = game:GetService("Workspace"),
    Run = game:GetService("RunService"),
    UI = game:GetService("UserInputService"),
    Sound = game:GetService("SoundService"),
}

--local ESPEnabled = false  -- Toggle para ligar/desligar
--local ESPObjects = {}
------------------------------Functions personagem------------------
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

--local function createESP(player)
 --   if player == LocalPlayer or not player.Character then return end
 --   
 --   local box = Drawing.new("Square")
 --   box.Thickness = 2
 --   box.Filled = false
 --   box.Color = Color3.fromRGB(255, 0, 0)  -- Vermelho para inimigos
 --   box.Transparency = 1
 --   
 --   local nameText = Drawing.new("Text")
 --   nameText.Size = 16
 --   nameText.Color = Color3.fromRGB(255, 255, 255)
 --   nameText.Transparency = 1
 --   nameText.Outline = true
--    
--    ESPObjects[player] = {box = box, text = nameText}
-- end

--local function updateESP()
--    for player, objects in pairs(ESPObjects) do
--        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
--            local root = player.Character.HumanoidRootPart
--            local camera = workspace.CurrentCamera
--            local screenPos, onScreen = camera:WorldToViewportPoint(root.Position)
--            
--            if onScreen then
--                local headPos = camera:WorldToViewportPoint(player.Character.Head.Position)
--                local legPos = camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
--                
--                local height = math.abs(headPos.Y - legPos.Y)
--                local width = height / 2
--                
--                objects.box.Size = Vector2.new(width, height)
--               objects.box.Position = Vector2.new(screenPos.X - width / 2, screenPos.Y - height / 2)
--               objects.box.Visible = true
--                
--                objects.text.Text = player.Name
--                objects.text.Position = Vector2.new(screenPos.X, screenPos.Y - height / 2 - 20)
--                objects.text.Visible = true
--            else
--                objects.box.Visible = false
--                objects.text.Visible = false
--            end
--       else
--           objects.box:Remove()
--            objects.text:Remove()
--            ESPObjects[player] = nil
--        end
--    end
--end
----------------------------------Temas-----------------------------

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
    Name = "Dark Theme",
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#000000"),
    Outline = Color3.fromHex("#020101"),
    Text = Color3.fromHex("#222222"),
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
    Icon = Color3.fromHex("#000000"),
})

----------------------------Notificação---------------------

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
----------------------------Janela principal----------------
local Window = WindUI:CreateWindow({
    Title = "Royal Hub - King Legacys",
    Icon = "door-open", -- lucide icon
    Author = "Eodraxkk & Einzbern",
    Folder = "Royal Hub",
    
    -- ↓ Opcionais (Alterar apenas o tamanho das janelas)
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
})
---------------------------Aviso Keybind-----------------
WindUI:Notify({
    Title = "KeyBind",
    Content = "Aperte H para esconder | Mostrar o menu",
    Duration = 4,
    Icon = "user"
})

print("===== Royal Hub carregado com sucesso! =====")
print("E ali diante dos meus olhos estava um cavalo branco e seu cavaleiro segurou uma reverência. Ele recebeu uma coroa e partiu, conquistando e conquistar... E saiu outro cavalo, todo vermelho. Ao seu cavaleiro recebeu o poder de tirar a paz da terra e fazer os homens massacrarem um ao outro; e ele recebeu uma grande espada... E ali, enquanto eu olhava, estava um cavalo preto; e seu cavaleiro segurava em sua mão um par de balanças... E lá, enquanto eu olhava, estava outro cavalo, doente e pálido; e o nome do seu cavaleiro era Morte, e Hades veio logo atrás. A ele foi dado poder sobre um quarto da terra, com o direito de matar pela espada e pela fome, pela peste e feras selvagens.")
print("Apocalipse 6:1-6")

-------------------------------Tags-------------------------

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
----------------------------KeyBinds--------------------

Window:SetToggleKey(Enum.KeyCode.H)

----------------------------Tabs-----------------------
local Home = Window:Tab({
    Title = "Inicio",
    Icon = "Janela", -- optional
    Locked = false,
})


local TabPersonagem = Window:Tab({
	Title = "Personagem",
	Icon = "user",
	Locked = false,
})

local TabFarm = Window:Tab({
	Title = "Farm",
	Icon = "star",
	Locked = false,

})

local TabShopping = Window:Tab({
	Title = "Loja",
	Icon = "box",
	Locked = false,

})

local TabTeleport Window:Tab({
	Title = "TP & WBHK",
	Icon = "cloud",
	Locked = false,

})

local TabMisc = Window:Tab({ 
	Title = "Misc",
	Icon = "box",
	Locked = false,

})

local TabSettings = Window:Tab({
	Title = "Configurações",
	Icon = "config",
	Locked = false,
})

local TabInfo = Window:Tab({
	Title = "Info",
	Icon = "wrench",
	Locked = false,
})

----------------------Buttons Settings--------------------

local ChangeTheme = TabSettings:Button({
    Title = "Alterar tema",
    Desc = "Altera o tema da UI",
    Locked = false,
    Callback = function()
        WindUI:SetTheme("Hutao By Einzbern")
    end
})

local InputKey = TabSettings:Input({
    Title = "Input",
    Desc = "Altera a tecla de abrir e fechar o menu",
    Value = "Default value",
    InputIcon = "bird",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter text...",
    Callback = function(input) 
    end
})

----------------Buttons Personagem------------------------

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
	Title = "Altura do pulo",
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


----------------Buttons TP & WEBHOOK-------------------

--local Dropdown = TabTeleport:Dropdown({
--    Title = "Dropdown",
--    Desc = "Dropdown Description",
--    Values = { "Category A", "Category B", "Category C" },
--    Value = "Category A",
--   Callback = function(option) 
--        print("Category selected: " .. option) 
--    end
--})

-------------------Paragrafos-------------------------

local Paragraph = TabInfo:Paragraph({
    Title = "Teste paragrafo",
    Desc = "???",
    Color = "Red",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function()
			print("Button registrado!")
			WindUI:Notify({
				Title = "Funcionando!",
				Content = "Esta função foi executada corretamente!, aperte F9 para ver o log.",
				Duration = 3,
				Icon = "bug",
			})
		end,
        }
    }
})