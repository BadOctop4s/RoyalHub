local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)


local NotifySound = Instance.new("Sound")
NotifySound.SoundId = "rbxassetid://6518811702"
NotifySound.Volume = 0.5
NotifySound.Parent = game:GetService("SoundService")


local Lighting = game:GetService("Lighting")

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

local function ativarBlur()
    local tween = game:GetService("TweenService"):Create(
        blur,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        { Size = 20 }
    )
    tween:Play()
end

local function desativarBlur()
    local tween = game:GetService("TweenService"):Create(
        blur,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        { Size = 0 }
    )
    tween:Play()
    tween.Completed:Connect(function()
        blur.Size = 0
    end)
end

-------------------------------* Idioma salvo *-------------------------------
-- Lê o idioma salvo anteriormente (se existir)
local selectedLang = "en"
pcall(function()
    if isfile("RoyalHub/lang.txt") then
        selectedLang = readfile("RoyalHub/lang.txt")
    end
end)

------------------* Language *-------------------
local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = selectedLang, -- já abre no idioma salvo
    Translations = {
        ["en"] = {
            ["TITLE_SECTION1"] = "Loader",
            ["TITLE_SECTION2"] = "Select language",
            ["LANGUAGE_TAB"] = "Language",
            ["LOADER"] = "Loader",
            ["EXECUTE"] = "Execute",  
            ["CANCELAR"] = "Cancel",
            ["LOAD_DESC"] = "Royal Hub is under development, functions may be unavailable or unstable. Join our discord for more information: https://discord.gg/royalhub",
        },

        ["pt-br"] = {
            ["TITLE_SECTION1"] = "Carregar",
            ["TITLE_SECTION2"] = "Selecionar idioma",
            ["LANGUAGE_TAB"] = "Idioma",
            ["LOADER"] = "Carregar",
            ["EXECUTE"] = "Executar",
            ["CANCELAR"] = "Cancelar",
            ["LOAD_DESC"] = "Royal Hub está em desenvolvimento, funções podem estar indisponíveis ou instáveis. Entre no nosso discord para mais informações: https://discord.gg/royalhub",
        },

        ["es"] = {
            ["TITLE_SECTION1"] = "Cargar",
            ["TITLE_SECTION2"] = "Seleccionar idioma",
            ["LANGUAGE_TAB"] = "Idioma",
            ["LOADER"] = "Cargador",
            ["EXECUTE"] = "Ejecutar",
            ["CANCELAR"] = "Cancelar",
            ["LOAD_DESC"] = "Royal Hub está en desarrollo, las funciones pueden no estar disponibles o ser inestables. Únase a nuestro discord para obtener más información: https://discord.gg/royalhub",
        },

        ["ru"] = {
            ["TITLE_SECTION1"] = "Загрузить",
            ["TITLE_SECTION2"] = "Выбор языка",
            ["LANGUAGE_TAB"] = "Язык",
            ["LOADER"] = "Загрузчик",
            ["EXECUTE"] = "Выполнить",
            ["CANCELAR"] = "Отмена",
            ["LOAD_DESC"] = "Royal Hub находится в стадии разработки, функции могут быть недоступны или нестабильны. Присоединяйтесь к нашему Discord для получения дополнительной информации: https://discord.gg/royalhub",
        }
    }
})

-------------------* Janela principal *-------------------
ativarBlur()

local Window = WindUI:CreateWindow({
    Title = "RoyalHub  |  Loader",
    Folder = "RoyalHub",
    Icon = "solar:folder-2-bold-duotone",
    NewElements = true,
    HideSearchBar = true,
    
    OpenButton = {
        Title = "Open RoyalHub loader",
        CornerRadius = UDim.new(1,0), 
        StrokeThickness = 3, 
        Enabled = true, 
        Draggable = true,
        OnlyMobile = true,
        Scale = 0.5,
        Color = ColorSequence.new(
            Color3.fromHex("#30FF6A"), 
            Color3.fromHex("#e7ff2f")
        )
    },
    Topbar = {
        Height = 44,
        ButtonsType = "Mac",
    },
})

-------------* Aba Loader *----------------
local Tab = Window:Tab({
    Title = "loc:LOADER",
    Icon = "solar:loader-duotone",
})

local SectionLoader = Tab:Section({
    Title = "loc:TITLE_SECTION1",
    Opened = true,
    Box = true,
    BoxBorder = true,
})

local ButtonExecute = SectionLoader:Button({
    Title = "loc:EXECUTE",
    Icon = "arrow-right",
    Variant = "Primary",
    Highlight = true,
    Callback = function()
         _G.RoyalHubLang = selectedLang  -- ← salva na global

        loadstring(game:HttpGet("https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/Source.lua"))()
        NotifySound:Play()
        desativarBlur()
        Window:Destroy()
    end
})

-------------* Aba Language *----------------
local TabLanguage = Window:Tab({
    Title = "loc:LANGUAGE_TAB",
    Icon = "solar:language-duotone",
})

TabLanguage:Select()

local SectionLanguage = TabLanguage:Section({
    Title = "loc:TITLE_SECTION2",
    Opened = true,
    Box = true,
    BoxBorder = true,
})

local ButtonEnglish = SectionLanguage:Button({
    Title = "🇺🇸 English",
    Icon = "arrow-right",
    Variant = selectedLang == "en" and "Primary" or "Secondary",
    Callback = function()
        selectedLang = "en"
        WindUI:SetLanguage("en")
    end
})

local ButtonPortuguese = SectionLanguage:Button({
    Title = "🇧🇷 Português",
    Icon = "arrow-right",
    Variant = selectedLang == "pt-br" and "Primary" or "Secondary",
    Callback = function()
        selectedLang = "pt-br"
        WindUI:SetLanguage("pt-br")
    end
})

local ButtonSpanish = SectionLanguage:Button({
    Title = "🇪🇸 Español",
    Icon = "arrow-right",
    Variant = selectedLang == "es" and "Primary" or "Secondary",
    Callback = function()
        selectedLang = "es"
        WindUI:SetLanguage("es")
    end
})

local ButtonRussian = SectionLanguage:Button({
    Title = "🇷🇺 Русский",
    Icon = "arrow-right",
    Variant = selectedLang == "ru" and "Primary" or "Secondary",
    Callback = function()
        selectedLang = "ru"
        WindUI:SetLanguage("ru")
    end
})