local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

-- WindUI:Notify("Loading", "Loading Hub... please wait.", 5)

------------------* Language *-------------------
local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["TITLE_SECTION1"] = "Loader",
            ["TITLE_SECTION2"] = "Select language",
            ["LANGUAGE_TAB"] = "Language",
            ["LOADER"] = "Loader",
            ["EXECUTE"] = "Execute",  
            ["CANCELAR"] = "Cancelar",
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

local Window = WindUI:CreateWindow({
    Title = "RoyalHub  |  Loader",
    Folder = "RoyalHub",
    Icon = "solar:folder-2-bold-duotone",
    --Theme = "Mellowsi",
    --IconSize = 22*2,
    NewElements = true,
    --Size = UDim2.fromOffset(700,700),
    
    HideSearchBar = true,
    
    OpenButton = {
        Title = "Open RoyalHub loader", -- can be changed
        CornerRadius = UDim.new(1,0), -- fully rounded
        StrokeThickness = 3, -- removing outline
        Enabled = true, -- enable or disable openbutton
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
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/Source.lua"))()
            WindUI:Notify("Success", "RoyalHub loaded successfully!", 5)
            Wait(2)
            Window:Destroy()
    end
})
--------------* Section Language *----------------
local Section = Tab:Section({
    Title = "loc:LOADER",
})


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
    Title = "English",
    Icon = "arrow-right",
    Variant = "Primary",
    Callback = function()
        WindUI:Localization():SetLanguage("en")
    end
})

local ButtonPortuguese = SectionLanguage:Button({
    Title = "Português",
    Icon = "arrow-right",
    Variant = "Secondary",
    Callback = function()
         WindUI:SetLanguage("pt-br")
    end
})

local ButtonSpanish = SectionLanguage:Button({
    Title = "Español",
    Icon = "arrow-right", 
    Variant = "Secondary",
    Callback = function()
        WindUI:SetLanguage("es")
    end
})

local ButtonRussian = SectionLanguage:Button({
    Title = "Русский",
    Icon = "arrow-right",
    Variant = "Secondary",
    Callback = function()
        WindUI:SetLanguage("ru")
    end
})
-- local Popup = WindUI:Popup({
--     Title = "loc:TITLE",
--     Icon = "alert",
--     Content = "loc:LOAD_DESC",
--     Buttons = {
--         {
--             Title = "English",
--             Icon = "arrow-right",
--             Variant = "Primary",
--             Callback = function()
--                 WindUI:Localization():SetLanguage("en")
--             end
--         },
--         {
--             Title = "Português",
--             Icon = "arrow-right",
--             Variant = "Secondary",
--             Callback = function()
--                  WindUI:SetLanguage("pt-br")
--             end
--         },
--         {
--             Title = "Español",
--             Icon = "arrow-right", 
--             Variant = "Secondary",
--             Callback = function()
--                 WindUI:SetLanguage("es")
--             end
--         },
--         {
--             Title = "Русский",
--             Icon = "arrow-right",
--             Variant = "Secondary",
--             Callback = function()
--                 WindUI:SetLanguage("ru")
--             end
--         }
--     }
-- })