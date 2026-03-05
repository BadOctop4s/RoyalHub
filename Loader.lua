local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

local IconsV1 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua"))()
local IconsV2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"))()

IconsV2.SetIconsType("lucide")

WindUI:Notify("Loading", "Loading Hub... please wait.", 5)

------------------* Language *-------------------
local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "pt-br",
    Translations = {
        ["en"] = {
            ["TITLE"] = "Important Message",
            ["EXECUTE"] = "Execute",  
            ["CANCELAR"] = "Cancelar",
            ["LOAD_DESC"] = "Royal Hub is under development, functions may be unavailable or unstable. Join our discord for more information: https://discord.gg/royalhub",
    },

        ["pt-br"] = {
            ["TITLE"] = "Mensagem Importante",
            ["EXECUTE"] = "Executar",
            ["CANCELAR"] = "Cancelar",
            ["LOAD_DESC"] = "Royal Hub está em desenvolvimento, funções podem estar indisponíveis ou instáveis. Entre no nosso discord para mais informações: https://discord.gg/royalhub",

        },

        ["es"] = {
            ["TITLE"] = "Mensaje Importante",
            ["EXECUTE"] = "Ejecutar",
            ["CANCELAR"] = "Cancelar",
            ["LOAD_DESC"] = "Royal Hub está en desarrollo, las funciones pueden no estar disponibles o ser inestables. Únase a nuestro discord para obtener más información: https://discord.gg/royalhub",
        },

        ["ru"] = {
            ["TITLE"] = "Важное сообщение",
            ["EXECUTE"] = "Выполнить",
            ["CANCELAR"] = "Отмена",
            ["LOAD_DESC"] = "Royal Hub находится в стадии разработки, функции могут быть недоступны или нестабильны. Присоединяйтесь к нашему Discord для получения дополнительной информации: https://discord.gg/royalhub",
        }
    }
})

-------------------* Popups *-------------------

local PopupLanguage = WindUI:Popup({
    Title = "Language Selection",
    Icon = "globe",
    Content = "Please select your language / Por favor, selecione seu idioma",
    Buttons = {
        {
            Title = "English",
            Icon = "flag-usa",
            Variant = "Primary",
            Callback = function()
                WindUI:SetLanguage("en")
                PopupLanguage:Close()
                WindUI:Notify("Language Set", "Language has been set to English.", 3)
                Popup:Open()
            end
        },
        {
            Title = "Português",
            Icon = "flag-brazil",
            Variant = "Secondary",
            Callback = function()
                WindUI:SetLanguage("pt-br")
                PopupLanguage:Close()
                WindUI:Notify("Idioma definido", "O idioma foi definido para Português.", 3)
                Popup:Open()
            end
        },
        {
            Title = "Español",
            Icon = "flag-spain",
            Variant = "Secondary",
            Callback = function()
                WindUI:SetLanguage("es")
                PopupLanguage:Close()
                WindUI:Notify("Idioma establecido", "El idioma se ha establecido en Español.", 3)
                Popup:Open()
            end
        },
        {
            Title = "Русский",
            Icon = "flag-russia",
            Variant = "Secondary", 
            Callback = function()
                WindUI:SetLanguage("ru")
                PopupLanguage:Close()
                WindUI:Notify("Язык установлен", "Язык был установлен на Русский.", 3)
                Popup:Open()
            end
        }
    }
})

WindUI:Notify("Carregando loader", 3)
Wait(3)

print("Loaded")

local Popup = WindUI:Popup({
    Title = "loc:TITLE",
    Icon = "alert",
    Content = "loc:LOAD_DESC",
    Buttons = {
        {
            Title = "loc:EXECUTE",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function()
                print("Proceeding...")
                loadstring(game:HttpGet("https://raw.githubusercontent.com/BadOctop4s/RoyalHub/main/Source.lua", true))()
            end
        },
        {
            Title = "loc:CANCELAR",
            Icon = "x",
            Variant = "Secondary",
            Callback = function()
                Popup:Close()
                print("Cancelled")
            
        }
    }
})