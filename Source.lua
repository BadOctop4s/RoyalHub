local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)
--*updated

-- Logo após WindUI = loadstring(...)()
local savedLang = "pt-br" -- fallback padrão
pcall(function()
    if isfile("RoyalHub/lang.txt") then
        savedLang = readfile("RoyalHub/lang.txt")
    end
end)

local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = savedLang, --
    Translations = {

        ["en"] = {
            ["AVISO"] = "WARNING!",
            ["ERRO"] = "Error",
            ["JOGADOR_NAO_ENCONTRADO_OU_SEM_PERSONAGEM"] = "Player not found or no character.",
            ["LOOP_TP"] = "Loop TP",
            ["ALVO_SUMIU_OU_MORREU_LOOP_PARADO"] = "Target disappeared or died. Loop stopped.",
            ["SELECIONE_UM_JOGADOR_NO_DROPDOWN_PRIMEIR"] = "Select a player in the dropdown first!",
            ["INICIANDO_LOOP_NO_JOGADOR"] = "Starting loop on player:",
            ["LOOP_DESATIVADO"] = "Loop disabled.",
            ["ESP_ATIVADO"] = "ESP activated!",
            ["ESP_DESATIVADO"] = "ESP disabled!",
            ["REJOIN"] = "Rejoin",
            ["NAO_FOI_POSSIVEL_PEGAR_O_JOBID_ATUAL_TEN"] = "Could not get current JobId. Try again.",
            ["VOLTANDO_PRO_MESMO_SERVIDOR"] = "Returning to same server...",
            ["SERVER_HOP"] = "Server Hop",
            ["BUSCANDO_SERVIDORES_AGUARDE_510S"] = "Searching servers... (wait 5-10s)",
            ["ERRO_HOP"] = "Hop Error",
            ["SEM_SERVIDORES"] = "No Servers",
            ["NENHUM_SERVER_DISPONIVEL_AGORA_TENTE_DE_"] = "No server available now. Try again or in another game.",
            ["HOP"] = "Hop!",
            ["TELEPORTANDO_PRO_SERVER"] = "Teleporting to server:",
            ["TELEPORT_FALHOU"] = "Teleport Failed",
            ["ERRO_2"] = "Error:",
            ["SPIN"] = "Spin",
            ["GIRANDO_DESATIVE_PRA_PARAR"] = "Spinning! (Disable to stop)",
            ["ERRO_SPIN"] = "Spin Error",
            ["PERSONAGEM_NAO_CARREGADO"] = "Character not loaded.",
            ["PAROU_DE_GIRAR"] = "Stopped spinning.",
            ["FLY"] = "Fly",
            ["VOO_ATIVADO"] = "Fly activated!",
            ["DESATIVADO"] = "Disabled",
            ["FAKE_TP"] = "Fake TP",
            ["ATIVADO_DODGE_ANTIAIM_LIGADO"] = "Enabled! (Dodge anti-aim on)",
            ["DESATIVADO_2"] = "Disabled!",
            ["ORBIT"] = "Orbit",
            ["ALVO_SUMIU_OU_MORREU_ORBIT_PARADO"] = "Target disappeared or died. Orbit stopped.",
            ["ORBITANDO"] = "Orbiting",
            ["ORBIT_DESATIVADO"] = "Orbit disabled.",
            ["VELOCIDADE_ATUALIZADA_PARA"] = "Speed updated to",
            ["NOCLIP"] = "NoClip",
            ["NOCLIP_ATIVADO"] = "NoClip enabled!",
            ["NOCLIP_DESATIVADO"] = "NoClip disabled.",
            ["ROYAL_HUB_AVISO"] = "Royal Hub - Warning!",
            ["SCRIPT_EM_DESENVOLVIMENTO_FUNCOES_PODEM_"] = "Script in development, features may break over time.",
            ["VERIFICACAO"] = "Verification",
            ["VERIFICANDO_USUARIO"] = "Verifying user...",
            ["REGISTER"] = "Register",
            ["OPEN_ROYAL_HUB"] = "Open Royal Hub",
            ["USERID"] = "UserID:",
            ["COPIAR_USERID"] = "Copy UserID",
            ["COPIADO"] = "Copied!",
            ["USERID_COPIADO_PARA_A_AREA_DE_TRANSFEREN"] = "UserID copied to clipboard.",
            ["FECHAR"] = "Close",
            ["KEYBIND"] = "KeyBind",
            ["APERTE_A_TECLA_H_PARA_ESCONDER_MOSTRAR_O"] = "Press ( H ) key to hide | Show menu",
            ["V144"] = "v1.4.4",
            ["SECURE"] = "Secure",
            ["FPS_0"] = "FPS: 0",
            ["PING_0MS"] = "Ping: 0ms",
            ["INICIO"] = "Home",
            ["FUNCOES_PRINCIPAIS_DO_ROYAL_HUB"] = "Main features of Royal Hub.",
            ["PERSONAGEM"] = "Character",
            ["MODIFICACOES_NO_PERSONAGEM"] = "Character modifications.",
            ["FARM"] = "Farm",
            ["FUNCOES_DE_FARM_AUTOMATICO"] = "Auto farm features.",
            ["LOJA"] = "Shop",
            ["COMPRE_ITENS_AUTOMATICAMENTE"] = "Buy items automatically.",
            ["TP_AND_WBHK"] = "TP and WBHK",
            ["TELEPORTE_E_WEBHOOK"] = "Teleport and WebHook.",
            ["MISC"] = "Misc",
            ["FUNCOES_DIVERSAS"] = "Miscellaneous features.",
            ["EXPLOITS"] = "Exploits",
            ["SCRIPTS_QUE_PODEM_SER_UTEIS"] = "Scripts that may be useful",
            ["CONFIGURACOES"] = "Settings",
            ["CONFIGURACOES_DO_ROYAL_HUB"] = "Royal Hub settings.",
            ["INFO"] = "Info",
            ["INFORMACOES_SOBRE_O_ROYAL_HUB_E_DESENVOL"] = "Information about Royal Hub and Developers.",
            ["AIMBOT"] = "Aimbot",
            ["FUNCAO_DE_AIMBOT_PARA_FACILITAR_SEUS_TIR"] = "Aimbot feature to make your shots & attacks easier.",
            ["AIMBOT_COMUM"] = "Common aimbot",
            ["AIMBOT_RAGE"] = "Aimbot Rage",
            ["IGNORAR_ALIADOS_TEAM_CHECK"] = "Ignore Allies (Team Check)",
            ["TEAM_CHECK"] = "Team Check",
            ["WALL_CHECK_IGNORAR_PAREDES"] = "Wall Check (Ignore Walls)",
            ["WALL_CHECK"] = "Wall Check",
            ["ESP"] = "ESP",
            ["PLAYERS_FICAM_VISIVEIS_ATRAS_DE_PAREDES_"] = "Players are visible behind walls and marked.",
            ["EM_DESENVOLVIMENTO"] = "In Development",
            ["ESP_ATIVADO_2"] = "ESP Activated",
            ["PLAYERS_DESTACADOS"] = "Players highlighted!",
            ["ESP_DESATIVADO_2"] = "ESP Deactivated",
            ["REMOVIDO"] = "Removed.",
            ["ESP_20_TWILIGHT"] = "ESP 2.0 (Twilight)",
            ["ESP_COM_HEALTH_BAR_BOX_E_NOME_POWERED_BY"] = "ESP with health bar, box and name — powered by Twilight.",
            ["ESP_20"] = "ESP 2.0",
            ["FAKE_TP_DODGE"] = "Fake TP (Dodge)",
            ["DELAY_FAKE_TP"] = "Fake TP Delay",
            ["TEMPO_ENTRE_FAKES_MENOR_MAIS_RAPIDO"] = "Time between fakes (lower = faster)",
            ["DISTANCIA_FAKE_TP"] = "Fake TP Distance",
            ["QUAO_LONGE_O_FAKE_TP_VAI_EM_STUDS"] = "How far the fake TP goes (in studs)",
            ["VISUAL"] = "Visual",
            ["MODIFICACOES_VISUAIS_NO_JOGO"] = "Visual modifications in game.",
            ["SELECIONE_O_PLAYER"] = "Select Player",
            ["SELECIONA_O_PLAYER_PARA_APLICAR_AS_MODIF"] = "Select the player to apply visual modifications.",
            ["EM_DESENVOLVIMENTO_2"] = "In development.",
            ["VISUALIZAR_PLAYER"] = "Visualize Player",
            ["ATIVA_AS_MODIFICACOES_VISUAIS_NO_PLAYER_"] = "Activates visual modifications on the selected player above.",
            ["PERMITE_ATRAVESSAR_PAREDES_E_OBJETOS"] = "Allows passing through walls and objects.",
            ["AUTO_FARM_LEVEL"] = "Auto Farm Level",
            ["FARMA_AUTOMATICAMENTE_SEU_LEVEL_SE_NAO_E"] = "Automatically farms your level (if not at maximum)",
            ["ATIVAR_AUTO_FARM_LEVEL"] = "Enable Auto Farm Level",
            ["ATIVA_O_FARM_AUTOMATICO_DE_LEVEL"] = "Activates automatic level farming.",
            ["AUTO_FARM_LEVEL_ATIVADO"] = "Auto Farm Level enabled!",
            ["AUTO_FARM_LEVEL_DESATIVADO"] = "Auto Farm Level disabled!",
            ["AUTO_FARM_MATERIALS"] = "Auto Farm Materials",
            ["FARMA_AUTOMATICAMENTE_MATERIAIS_DO_JOGO"] = "Automatically farms game materials.",
            ["ATIVAR_AUTO_FARM_MATERIALS"] = "Enable Auto Farm Materials",
            ["ATIVA_O_FARM_AUTOMATICO_DE_MATERIAIS"] = "Activates automatic material farming.",
            ["AUTO_FARM_MATERIALS_ATIVADO"] = "Auto Farm Materials enabled!",
            ["AUTO_FARM_MATERIALS_DESATIVADO"] = "Auto Farm Materials disabled!",
            ["SELECIONAR_MATERIAL"] = "Select Material",
            ["SELECIONA_O_MATERIAL_QUE_DESEJA_FARMAR_A"] = "Select the material you want to farm automatically.",
            ["MATERIAL_1"] = "Material 1",
            ["MATERIAL_2"] = "Material 2",
            ["MATERIAL_3"] = "Material 3",
            ["AUTO_BUY"] = "Auto Buy",
            ["COMPRA_ITENS_AUTOMATICAMENTE_DO_BLACKMAR"] = "Automatically purchases items from the blackmarket.",
            ["SELECIONAR_ITEM"] = "Select Item",
            ["SELECIONA_O_ITEM_QUE_DESEJA_COMPRAR_AUTO"] = "Select the item you want to buy automatically.",
            ["ITEM_1"] = "Item 1",
            ["ITEM_2"] = "Item 2",
            ["ITEM_3"] = "Item 3",
            ["ATIVAR_AUTO_BUY"] = "Enable Auto Buy",
            ["ATIVA_A_COMPRA_AUTOMATICA_DO_ITEM_SELECI"] = "Enables automatic purchase of the selected item above.",
            ["AUTO_BUY_ATIVADO"] = "Auto Buy enabled!",
            ["AUTO_BUY_DESATIVADO"] = "Auto Buy disabled!",
            ["GENERAL_SETTINGS"] = "General Settings",
            ["CONFIGURACOES_DE_TEMA_KEYBIND_E_ETC"] = "Theme, Keybind and other settings.",
            ["BYPASS_ANTICHEAT"] = "Bypass Anti-Cheat",
            ["TENTA_BURLAR_O_SISTEMA_ANTICHEAT_DO_JOGO"] = "Attempts to bypass the game's anti-cheat system.",
            ["AVISO_2"] = "Warning!",
            ["BYPASS_ATIVADO_COM_SUCESSO_FUNCIONALIDAD"] = "Bypass activated successfully! (Feature in development)",
            ["TEMAS"] = "Themes",
            ["ALTERA_O_TEMA_DO_ROYAL_HUB"] = "Change the Royal Hub theme",
            ["DARK_AMOLED_DEFAULT"] = "Dark Amoled ( Default )",
            ["HUTAO_BY_EINZBERN"] = "Hutao By Einzbern",
            ["REDX_HUB"] = "RedX Hub",
            ["WHITE"] = "White",
            ["MAIN_THEME"] = "Main Theme",
            ["CYBERPUNK"] = "CyberPunk",
            ["SOLAR_THEME"] = "Solar Theme",
            ["MIDNIGHT"] = "Midnight",
            ["CRIMSON"] = "Crimson",
            ["SNOW"] = "Snow",
            ["TUNDRA"] = "Tundra",
            ["SAMURAI_DARK"] = "Samurai Dark",
            ["MONOKAI"] = "Monokai",
            ["MOONLIGHT"] = "Moonlight",
            ["LUNAR"] = "Lunar",
            ["INDIGO"] = "Indigo",
            ["STARTORCH"] = "Startorch",
            ["TOGGLE_UI"] = "Toggle UI",
            ["ALTERA_A_TECLA_QUE_MOSTRA_ESCONDE_O_MENU"] = "Change the key that shows | hides the menu.",
            ["SALVAR_CONFIG"] = "Save Config",
            ["SALVA_TEMA_SELECIONADO_E_ETC"] = "Saves selected theme and etc.",
            ["CONFIGURACAO_SALVA"] = "Configuration saved!",
            ["SUA_CONFIGURACAO_FOI_SALVA_COM_SUCESSO"] = "Your configuration was saved successfully!",
            ["CARREGAR_CONFIG"] = "Load Config",
            ["CARREGA_A_CONFIGURACAO_SALVA_ANTERIORMEN"] = "Loads the previously saved configuration.",
            ["CONFIGURACAO_CARREGADA"] = "Configuration loaded!",
            ["SUA_CONFIGURACAO_FOI_CARREGADA_COM_SUCES"] = "Your configuration was loaded successfully!",
            ["BACKDOOR_SCANNER"] = "Backdoor scanner",
            ["ESCANEIA_O_JOGO_EM_BUSCA_DE_BACKDOORS_CO"] = "Scans the game for known backdoors.",
            ["EJETAR_SCRIPT"] = "Eject script",
            ["EJETA_A_SCRIPT_DO_JOGO"] = "Ejects the script from the game.",
            ["CONFIRM_DELETE"] = "Confirm Delete",
            ["ESTA_ACAO_NAO_PODE_SER_DESFEITA"] = "This action cannot be undone.",
            ["CANCELAR"] = "Cancel",
            ["EJETAR"] = "Eject",
            ["KEYBINDS"] = "KeyBinds",
            ["AQUI_VOCE_PODE_ALTERAR_OS_KEYBINDS_DAS_F"] = "Here you can change the function keybinds.",
            ["AIMBOT_COMUM_K"] = "Common Aimbot (K)",
            ["AIMBOT_COMUM_2"] = "Common Aimbot",
            ["AIMBOT_RAGE_L"] = "Rage Aimbot (L)",
            ["AIMBOT_RAGE_2"] = "Rage Aimbot",
            ["ESP_E"] = "ESP (E)",
            ["ESP_2"] = "ESP",
            ["ATIVADO"] = "Enabled!",
            ["FLY_F"] = "Fly (F)",
            ["SPIN_G"] = "Spin (G)",
            ["LOOP_TP_T"] = "Loop TP (T)",
            ["CONFIGURACOES_DE_FUNCOES"] = "Function Settings",
            ["MODO_ANONYMOUS"] = "Anonymous mode",
            ["ATIVA_O_MODO_ANONYMOUS_QUE_ESCONDE_SEU_N"] = "Enables anonymous mode, which hides your name and image from the panel",
            ["MOVIMENTO"] = "Movement",
            ["SPEED"] = "Speed",
            ["ALTERA_VELOCIDADE_DO_JOGADOR"] = "Changes player speed",
            ["JUMP"] = "Jump",
            ["AUMENTA_A_FORCA_DO_PULO"] = "Increases jump power",
            ["ATIVA_O_MODO_VOO"] = "Enables flight mode",
            ["VELOCIDADE_DO_FLY"] = "Fly Speed",
            ["AJUSTE_A_VELOCIDADE_DO_VOO_QUANTO_MAIOR_"] = "Adjust the flight speed (higher = faster).",
            ["GRAVIDADE"] = "Gravity",
            ["GRAVITY"] = "Gravity",
            ["ALTERA_A_GRAVIDADE_DO_JOGO"] = "Changes the game's gravity",
            ["RESET_GRAVITY"] = "Reset Gravity",
            ["RESETA_A_GRAVIDADE_PARA_O_VALOR_PADRAO_1"] = "Resets gravity to default value (196.2)",
            ["GRAVIDADE_RESETADA"] = "Gravity reset!",
            ["A_GRAVIDADE_FOI_RESETADA_PARA_O_VALOR_PA"] = "Gravity has been reset to default value (196.2)",
            ["OUTROS"] = "Others",
            ["TELEPORT"] = "Teleport",
            ["PERMITE_TELEPORTAR_ATE_OUTROS_JOGADORES"] = "Allows teleporting to other players.",
            ["TELEPORTAR_ATE_JOGADOR"] = "Teleport to player",
            ["TELEPORTA_ATE_O_JOGADOR_SELECIONADO"] = "Teleports to the selected player",
            ["TELEPORTA_INFINITAMENTE_NO_JOGADO_QUE_FO"] = "Teleports infinitely to the player selected above.",
            ["DELAY_ENTRE_TPS"] = "Delay between TPs",
            ["TEMPO_EM_SEGUNDOS_ENTRE_CADA_TELEPORTE_M"] = "Time in seconds between each teleport (lower = faster)",
            ["LOOP_TP_DELAY"] = "Loop TP Delay",
            ["ATUALIZADO_PARA"] = "Updated to",
            ["TELEPORT_TO_ISLANDS"] = "Teleport to Islands",
            ["TELEPORTA_PARA_AS_ILHAS_PRINCIPAIS_DO_JO"] = "Teleport to the main islands of the game.",
            ["TELEPORTE_PARA_ILHA"] = "Teleport to Island",
            ["TELEPORTA_PARA_A_ILHA_SELECIONADA"] = "Teleport to the selected island.",
            ["STARTER_ISLAND"] = "Starter Island",
            ["FOREST_ISLAND"] = "Forest Island",
            ["DESERT_ISLAND"] = "Desert Island",
            ["SNOW_ISLAND"] = "Snow Island",
            ["VOLCANO_ISLAND"] = "Volcano Island",
            ["SKY_ISLAND"] = "Sky Island",
            ["MISCELLANEOUS"] = "Miscellaneous",
            ["FUNCOES_DIVERSAS_DO_ROYAL_HUB"] = "Various Royal Hub functions.",
            ["REENTRA_NA_PARTIDA_ATUAL"] = "Rejoin the current match.",
            ["ENTRA_EM_OUTRO_SERVIDOR_DA_PARTIDA_ATUAL"] = "Join another server of the current match.",
            ["REDEEM_CODES"] = "Redeem Codes",
            ["RESGATA_CODIGOS_AUTOMATICAMENTE"] = "Redeem codes automatically.",
            ["COLLECT_REWARDS"] = "Collect Rewards",
            ["COLETA_RECOMPENSAS_DIARIAS_AUTOMATICAMEN"] = "Collect daily rewards automatically.",
            ["FUNCOES_EXPLOITS_DO_ROYAL_HUB_PODE_NAO_F"] = "Royal Hub exploit functions. (may not work)",
            ["SELECIONE_JOGADOR"] = "Select Player",
            ["EM_MANUTENCAO"] = "Under maintenance.",
            ["FLING_POWER"] = "Fling Power",
            ["LOOP_FLING"] = "Loop Fling",
            ["SELECIONE_UM_ALVO"] = "Select a target!",
            ["FLING_PLAYER"] = "Fling Player",
            ["FAZ_O_JOGADOR_SELECIONADO_VOAR_PELO_MAPA"] = "Makes the selected player fly across the map.",
            ["FLING"] = "Fling",
            ["ARREMESSADO"] = "Flung:",
            ["SELECIONE_UM_ALVO_PRIMEIRO"] = "Select a target first!",
            ["SPYCHAT"] = "SpyChat",
            ["ESPIONA_TODOS_CHATS_PRIVADOSDMS"] = "Spies on ALL private chats/DMs.",
            ["FUN"] = "Fun",
            ["FUNCOES_DIVERTIDAS_DO_ROYAL_HUB"] = "Fun features from Royal Hub.",
            ["FAZ_O_PERSONAGEM_GIRAR_INFINITAMENTE"] = "Makes the character spin infinitely.",
            ["ATIVAR_ORBIT"] = "Enable Orbit",
            ["VELOCIDADE_ROTACAO"] = "Rotation Speed",
            ["IDS_TROLL_PRONTOS"] = "Ready Troll IDs",
            ["EM_MANUTENCAO_2"] = "Under maintenance",
            ["TROLL_SELECIONADO"] = "Selected Troll",
            ["CARREGADO"] = "Loaded:",
            ["VOLUME"] = "Volume",
            ["TOCAR_GLOBAL"] = "Play Global",
            ["SELECIONE_EMOTE"] = "Select Emote",
            ["EMOTES_DISPONIVEIS_MESMO_SEM_TER_NA_CONT"] = "Available emotes (even without owning them).",
            ["LOOP_EMOTE"] = "Loop Emote",
            ["FAZ_O_EMOTE_REPETIR_AUTOMATICAMENTE"] = "Makes the emote repeat automatically.",
            ["EMOTE"] = "Emote",
            ["LOOP"] = "Loop",
            ["USAR_EMOTE"] = "Use Emote",
            ["EXECUTA_O_EMOTE_SELECIONADO"] = "Executes the selected emote.",
            ["SELECIONE_UM_EMOTE_PRIMEIRO"] = "Select an emote first!",
            ["FALHA_AO_CARREGAR"] = "Failed to load",
            ["TOCANDO"] = "Playing",
            ["PARAR_EMOTE"] = "Stop Emote",
            ["INTERROMPE_O_EMOTE_ATUAL"] = "Stops the current emote.",
            ["EMOTE_E_LOOP_PARADOS"] = "Emote and loop stopped!",
            ["BROOKHAVEN"] = "BrookHaven",
            ["FAELZIN_HUB"] = "FAELZIN HUB",
            ["BRUTON_HUB"] = "BRUTON HUB",
            ["CARTOLA_HUB"] = "CARTOLA HUB",
            ["PILOT_HUB"] = "PILOT HUB",
            ["SALVATORE"] = "SALVATORE",
            ["SANDER_XY"] = "SANDER XY",
            ["HX_HEXAGON"] = "HX HEXAGON",
            ["COVET_HUB"] = "COVET HUB",
            ["LOBO_HUB"] = "LOBO HUB",
            ["FORBID_SPAMMER"] = "FORBID SPAMMER",
            ["SPECTRA_HUB"] = "SPECTRA HUB",
            ["CHAD_HUB"] = "CHAD HUB",
            ["MAX_HUB"] = "MAX HUB",
            ["CHAD_HUB_V2"] = "CHAD HUB V2",
            ["PHANTOM_CLIENT"] = "PHANTOM CLIENT",
            ["LYRA_HUB"] = "LYRA HUB",
            ["SANT_HUB"] = "SANT HUB",
            ["KINGLEGACY"] = "King-Legacy",
            ["ZEEHUB_UPD_9"] = "ZEE-HUB UPD 9",
            ["UNIVERSAIS"] = "Universal",
            ["DEXEXPLORER"] = "DEX-EXPLORER",
            ["TCA_GUI"] = "TCA GUI",
            ["INFINITE_YIELD"] = "INFINITE YIELD",
            ["INFORMACOES"] = "Information",
            ["EODRAXKK"] = "Eodraxkk",
            ["DESENVOLVEDOR_PRINCIPAL_DO_ROYAL_HUB_FOC"] = "Lead developer of Royal Hub, focused on programming and security.",
            ["EINZBERN"] = "Einzbern",
            ["CODESENVOLVEDOR_DO_ROYAL_HUB_FOCADO_EM_D"] = "Co-developer of Royal Hub, focused on design and feature ideas.",
            ["LINK_DO_DISCORD"] = "Discord Link",
            ["CLIQUE_PARA_COPIAR_O_LINK"] = "Click to copy the link",
            ["CLIPBOARD"] = "Clipboard",
            ["LINK_DO_DISCORD_COPIADO_PARA_A_AREA_DE_T"] = "Discord link copied to clipboard!",
            ["SOBRE_O_ROYAL_HUB"] = "About Royal Hub",
        },

        ["pt-br"] = {
            ["AVISO"] = "AVISO!",
            ["ERRO"] = "Erro",
            ["JOGADOR_NAO_ENCONTRADO_OU_SEM_PERSONAGEM"] = "Jogador não encontrado ou sem personagem.",
            ["LOOP_TP"] = "Loop TP",
            ["ALVO_SUMIU_OU_MORREU_LOOP_PARADO"] = "Alvo sumiu ou morreu. Loop parado.",
            ["SELECIONE_UM_JOGADOR_NO_DROPDOWN_PRIMEIR"] = "Selecione um jogador no dropdown primeiro!",
            ["INICIANDO_LOOP_NO_JOGADOR"] = "Iniciando loop no jogador:",
            ["LOOP_DESATIVADO"] = "Loop desativado.",
            ["ESP_ATIVADO"] = "ESP ativado!",
            ["ESP_DESATIVADO"] = "ESP desativado!",
            ["REJOIN"] = "Rejoin",
            ["NAO_FOI_POSSIVEL_PEGAR_O_JOBID_ATUAL_TEN"] = "Não foi possível pegar o JobId atual. Tente novamente.",
            ["VOLTANDO_PRO_MESMO_SERVIDOR"] = "Voltando pro mesmo servidor...",
            ["SERVER_HOP"] = "Server Hop",
            ["BUSCANDO_SERVIDORES_AGUARDE_510S"] = "Buscando servidores... (aguarde 5-10s)",
            ["ERRO_HOP"] = "Erro Hop",
            ["SEM_SERVIDORES"] = "Sem Servidores",
            ["NENHUM_SERVER_DISPONIVEL_AGORA_TENTE_DE_"] = "Nenhum server disponível agora. Tente de novo ou em outro jogo.",
            ["HOP"] = "Hop!",
            ["TELEPORTANDO_PRO_SERVER"] = "Teleportando pro server:",
            ["TELEPORT_FALHOU"] = "Teleport Falhou",
            ["ERRO_2"] = "Erro:",
            ["SPIN"] = "Spin",
            ["GIRANDO_DESATIVE_PRA_PARAR"] = "Girando! (Desative pra parar)",
            ["ERRO_SPIN"] = "Erro Spin",
            ["PERSONAGEM_NAO_CARREGADO"] = "Personagem não carregado.",
            ["PAROU_DE_GIRAR"] = "Parou de girar.",
            ["FLY"] = "Fly",
            ["VOO_ATIVADO"] = "Voo ativado!",
            ["DESATIVADO"] = "Desativado",
            ["FAKE_TP"] = "Fake TP",
            ["ATIVADO_DODGE_ANTIAIM_LIGADO"] = "Ativado! (Dodge anti-aim ligado)",
            ["DESATIVADO_2"] = "Desativado!",
            ["ORBIT"] = "Orbit",
            ["ALVO_SUMIU_OU_MORREU_ORBIT_PARADO"] = "Alvo sumiu ou morreu. Orbit parado.",
            ["ORBITANDO"] = "Orbitando",
            ["ORBIT_DESATIVADO"] = "Orbit desativado.",
            ["VELOCIDADE_ATUALIZADA_PARA"] = "Velocidade atualizada para",
            ["NOCLIP"] = "NoClip",
            ["NOCLIP_ATIVADO"] = "NoClip ativado!",
            ["NOCLIP_DESATIVADO"] = "NoClip desativado.",
            ["ROYAL_HUB_AVISO"] = "Royal Hub - Aviso!",
            ["SCRIPT_EM_DESENVOLVIMENTO_FUNCOES_PODEM_"] = "Script em desenvolvimento, funções podem quebrar com o decorrer do tempo.",
            ["VERIFICACAO"] = "Verificação",
            ["VERIFICANDO_USUARIO"] = "Verificando usuario...",
            ["REGISTER"] = "Register",
            ["OPEN_ROYAL_HUB"] = "Open Royal Hub",
            ["USERID"] = "UserID:",
            ["COPIAR_USERID"] = "Copiar UserID",
            ["COPIADO"] = "Copiado!",
            ["USERID_COPIADO_PARA_A_AREA_DE_TRANSFEREN"] = "UserID copiado para a área de transferência.",
            ["FECHAR"] = "Fechar",
            ["KEYBIND"] = "KeyBind",
            ["APERTE_A_TECLA_H_PARA_ESCONDER_MOSTRAR_O"] = "Aperte a tecla ( H )  para esconder | Mostrar o menu",
            ["V144"] = "v1.4.4",
            ["SECURE"] = "Secure",
            ["FPS_0"] = "FPS: 0",
            ["PING_0MS"] = "Ping: 0ms",
            ["INICIO"] = "Inicio",
            ["FUNCOES_PRINCIPAIS_DO_ROYAL_HUB"] = "Funções principais do Royal Hub.",
            ["PERSONAGEM"] = "Personagem",
            ["MODIFICACOES_NO_PERSONAGEM"] = "Modificações no personagem.",
            ["FARM"] = "Farm",
            ["FUNCOES_DE_FARM_AUTOMATICO"] = "Funções de farm automático.",
            ["LOJA"] = "Loja",
            ["COMPRE_ITENS_AUTOMATICAMENTE"] = "Compre itens automaticamente.",
            ["TP_AND_WBHK"] = "TP and WBHK",
            ["TELEPORTE_E_WEBHOOK"] = "Teleporte e WebHook.",
            ["MISC"] = "Misc",
            ["FUNCOES_DIVERSAS"] = "Funções diversas.",
            ["EXPLOITS"] = "Exploits",
            ["SCRIPTS_QUE_PODEM_SER_UTEIS"] = "Scripts que podem ser uteis",
            ["CONFIGURACOES"] = "Configurações",
            ["CONFIGURACOES_DO_ROYAL_HUB"] = "Configurações do Royal Hub.",
            ["INFO"] = "Info",
            ["INFORMACOES_SOBRE_O_ROYAL_HUB_E_DESENVOL"] = "Informações sobre o Royal Hub e Desenvolvedores.",
            ["AIMBOT"] = "Aimbot",
            ["FUNCAO_DE_AIMBOT_PARA_FACILITAR_SEUS_TIR"] = "Função de aimbot para facilitar seus tiros & Ataques.",
            ["AIMBOT_COMUM"] = "Aimbot comum",
            ["AIMBOT_RAGE"] = "Aimbot rage",
            ["IGNORAR_ALIADOS_TEAM_CHECK"] = "Ignorar Aliados (Team Check)",
            ["TEAM_CHECK"] = "Team Check",
            ["WALL_CHECK_IGNORAR_PAREDES"] = "Wall Check (Ignorar Paredes)",
            ["WALL_CHECK"] = "Wall Check",
            ["ESP"] = "Esp",
            ["PLAYERS_FICAM_VISIVEIS_ATRAS_DE_PAREDES_"] = "Players ficam visiveis atrás de paredes e marcados.",
            ["EM_DESENVOLVIMENTO"] = "Em desenvolvimento",
            ["ESP_ATIVADO_2"] = "ESP Ativado",
            ["PLAYERS_DESTACADOS"] = "Players destacados!",
            ["ESP_DESATIVADO_2"] = "ESP Desativado",
            ["REMOVIDO"] = "Removido.",
            ["ESP_20_TWILIGHT"] = "Esp 2.0 (Twilight)",
            ["ESP_COM_HEALTH_BAR_BOX_E_NOME_POWERED_BY"] = "ESP com health bar, box e nome — powered by Twilight.",
            ["ESP_20"] = "ESP 2.0",
            ["FAKE_TP_DODGE"] = "Fake TP (Dodge)",
            ["DELAY_FAKE_TP"] = "Delay Fake TP",
            ["TEMPO_ENTRE_FAKES_MENOR_MAIS_RAPIDO"] = "Tempo entre fakes (menor = mais rápido)",
            ["DISTANCIA_FAKE_TP"] = "Distância Fake TP",
            ["QUAO_LONGE_O_FAKE_TP_VAI_EM_STUDS"] = "Quão longe o fake TP vai (em studs)",
            ["VISUAL"] = "Visual",
            ["MODIFICACOES_VISUAIS_NO_JOGO"] = "Modificações visuais no jogo.",
            ["SELECIONE_O_PLAYER"] = "Selecione o Player",
            ["SELECIONA_O_PLAYER_PARA_APLICAR_AS_MODIF"] = "Seleciona o player para aplicar as modificações visuais.",
            ["EM_DESENVOLVIMENTO_2"] = "Em desenvolvimento.",
            ["VISUALIZAR_PLAYER"] = "Visualizar Player",
            ["ATIVA_AS_MODIFICACOES_VISUAIS_NO_PLAYER_"] = "Ativa as modificações visuais no player selecionado acima.",
            ["PERMITE_ATRAVESSAR_PAREDES_E_OBJETOS"] = "Permite atravessar paredes e objetos.",
            ["AUTO_FARM_LEVEL"] = "Auto Farm Level",
            ["FARMA_AUTOMATICAMENTE_SEU_LEVEL_SE_NAO_E"] = "Farma automaticamente seu level ( se não estiver no maximo )",
            ["ATIVAR_AUTO_FARM_LEVEL"] = "Ativar Auto Farm Level",
            ["ATIVA_O_FARM_AUTOMATICO_DE_LEVEL"] = "Ativa o farm automático de level.",
            ["AUTO_FARM_LEVEL_ATIVADO"] = "Auto Farm Level ativado!",
            ["AUTO_FARM_LEVEL_DESATIVADO"] = "Auto Farm Level desativado!",
            ["AUTO_FARM_MATERIALS"] = "Auto Farm Materials",
            ["FARMA_AUTOMATICAMENTE_MATERIAIS_DO_JOGO"] = "Farma automaticamente materiais do jogo.",
            ["ATIVAR_AUTO_FARM_MATERIALS"] = "Ativar Auto Farm Materials",
            ["ATIVA_O_FARM_AUTOMATICO_DE_MATERIAIS"] = "Ativa o farm automático de materiais.",
            ["AUTO_FARM_MATERIALS_ATIVADO"] = "Auto Farm Materials ativado!",
            ["AUTO_FARM_MATERIALS_DESATIVADO"] = "Auto Farm Materials desativado!",
            ["SELECIONAR_MATERIAL"] = "Selecionar Material",
            ["SELECIONA_O_MATERIAL_QUE_DESEJA_FARMAR_A"] = "Seleciona o material que deseja farmar automaticamente.",
            ["MATERIAL_1"] = "Material 1",
            ["MATERIAL_2"] = "Material 2",
            ["MATERIAL_3"] = "Material 3",
            ["AUTO_BUY"] = "Auto Buy",
            ["COMPRA_ITENS_AUTOMATICAMENTE_DO_BLACKMAR"] = "Compra itens automaticamente do blackmarket.",
            ["SELECIONAR_ITEM"] = "Selecionar Item",
            ["SELECIONA_O_ITEM_QUE_DESEJA_COMPRAR_AUTO"] = "Seleciona o item que deseja comprar automaticamente.",
            ["ITEM_1"] = "Item 1",
            ["ITEM_2"] = "Item 2",
            ["ITEM_3"] = "Item 3",
            ["ATIVAR_AUTO_BUY"] = "Ativar Auto Buy",
            ["ATIVA_A_COMPRA_AUTOMATICA_DO_ITEM_SELECI"] = "Ativa a compra automática do item selecionado acima.",
            ["AUTO_BUY_ATIVADO"] = "Auto Buy ativado!",
            ["AUTO_BUY_DESATIVADO"] = "Auto Buy desativado!",
            ["GENERAL_SETTINGS"] = "General Settings",
            ["CONFIGURACOES_DE_TEMA_KEYBIND_E_ETC"] = "Configurações de tema, keybind e etc.",
            ["BYPASS_ANTICHEAT"] = "Bypass Anti-Cheat",
            ["TENTA_BURLAR_O_SISTEMA_ANTICHEAT_DO_JOGO"] = "Tenta burlar o sistema anti-cheat do jogo.",
            ["AVISO_2"] = "Aviso!",
            ["BYPASS_ATIVADO_COM_SUCESSO_FUNCIONALIDAD"] = "Bypass ativado com sucesso! (Funcionalidade em desenvolvimento)",
            ["TEMAS"] = "Temas",
            ["ALTERA_O_TEMA_DO_ROYAL_HUB"] = "Altera o tema do Royal Hub",
            ["DARK_AMOLED_DEFAULT"] = "Dark Amoled ( Default )",
            ["HUTAO_BY_EINZBERN"] = "Hutao By Einzbern",
            ["REDX_HUB"] = "RedX Hub",
            ["WHITE"] = "White",
            ["MAIN_THEME"] = "Main Theme",
            ["CYBERPUNK"] = "CyberPunk",
            ["SOLAR_THEME"] = "Solar Theme",
            ["MIDNIGHT"] = "Midnight",
            ["CRIMSON"] = "Crimson",
            ["SNOW"] = "Snow",
            ["TUNDRA"] = "Tundra",
            ["SAMURAI_DARK"] = "Samurai Dark",
            ["MONOKAI"] = "Monokai",
            ["MOONLIGHT"] = "Moonlight",
            ["LUNAR"] = "Lunar",
            ["INDIGO"] = "Indigo",
            ["STARTORCH"] = "Startorch",
            ["TOGGLE_UI"] = "Toggle UI",
            ["ALTERA_A_TECLA_QUE_MOSTRA_ESCONDE_O_MENU"] = "Altera a tecla que mostra | esconde o menu.",
            ["SALVAR_CONFIG"] = "Salvar Config",
            ["SALVA_TEMA_SELECIONADO_E_ETC"] = "Salva tema selecionado e etc.",
            ["CONFIGURACAO_SALVA"] = "Configuração salva!",
            ["SUA_CONFIGURACAO_FOI_SALVA_COM_SUCESSO"] = "Sua configuração foi salva com sucesso!",
            ["CARREGAR_CONFIG"] = "Carregar config",
            ["CARREGA_A_CONFIGURACAO_SALVA_ANTERIORMEN"] = "Carrega a configuração salva anteriormente.",
            ["CONFIGURACAO_CARREGADA"] = "Configuração carregada!",
            ["SUA_CONFIGURACAO_FOI_CARREGADA_COM_SUCES"] = "Sua configuração foi carregada com sucesso!",
            ["BACKDOOR_SCANNER"] = "Backdoor scanner",
            ["ESCANEIA_O_JOGO_EM_BUSCA_DE_BACKDOORS_CO"] = "Escaneia o jogo em busca de backdoors conhecidos.",
            ["EJETAR_SCRIPT"] = "Ejetar script",
            ["EJETA_A_SCRIPT_DO_JOGO"] = "Ejeta a script do jogo.",
            ["CONFIRM_DELETE"] = "Confirm Delete",
            ["ESTA_ACAO_NAO_PODE_SER_DESFEITA"] = "Esta ação não pode ser desfeita.",
            ["CANCELAR"] = "Cancelar",
            ["EJETAR"] = "Ejetar",
            ["KEYBINDS"] = "KeyBinds",
            ["AQUI_VOCE_PODE_ALTERAR_OS_KEYBINDS_DAS_F"] = "Aqui você pode alterar os keybinds das funções.",
            ["AIMBOT_COMUM_K"] = "Aimbot Comum (K)",
            ["AIMBOT_COMUM_2"] = "Aimbot Comum",
            ["AIMBOT_RAGE_L"] = "Aimbot Rage (L)",
            ["AIMBOT_RAGE_2"] = "Aimbot Rage",
            ["ESP_E"] = "ESP (E)",
            ["ESP_2"] = "ESP",
            ["ATIVADO"] = "Ativado!",
            ["FLY_F"] = "Fly (F)",
            ["SPIN_G"] = "Spin (G)",
            ["LOOP_TP_T"] = "Loop TP (T)",
            ["CONFIGURACOES_DE_FUNCOES"] = "Configurações de funções",
            ["MODO_ANONYMOUS"] = "Modo anonymous",
            ["ATIVA_O_MODO_ANONYMOUS_QUE_ESCONDE_SEU_N"] = "Ativa o modo anonymous, que esconde seu nome e imagem do painel",
            ["MOVIMENTO"] = "Movimento",
            ["SPEED"] = "Speed",
            ["ALTERA_VELOCIDADE_DO_JOGADOR"] = "Altera velocidade do jogador",
            ["JUMP"] = "Jump",
            ["AUMENTA_A_FORCA_DO_PULO"] = "Aumenta a força do pulo",
            ["ATIVA_O_MODO_VOO"] = "Ativa o modo voo",
            ["VELOCIDADE_DO_FLY"] = "Velocidade do Fly",
            ["AJUSTE_A_VELOCIDADE_DO_VOO_QUANTO_MAIOR_"] = "Ajuste a velocidade do voo (quanto maior, mais rápido).",
            ["GRAVIDADE"] = "Gravidade",
            ["GRAVITY"] = "Gravity",
            ["ALTERA_A_GRAVIDADE_DO_JOGO"] = "Altera a gravidade do jogo",
            ["RESET_GRAVITY"] = "Reset Gravity",
            ["RESETA_A_GRAVIDADE_PARA_O_VALOR_PADRAO_1"] = "Reseta a gravidade para o valor padrão (196.2)",
            ["GRAVIDADE_RESETADA"] = "Gravidade resetada!",
            ["A_GRAVIDADE_FOI_RESETADA_PARA_O_VALOR_PA"] = "A gravidade foi resetada para o valor padrão (196.2)",
            ["OUTROS"] = "Outros",
            ["TELEPORT"] = "Teleport",
            ["PERMITE_TELEPORTAR_ATE_OUTROS_JOGADORES"] = "Permite teleportar até outros jogadores.",
            ["TELEPORTAR_ATE_JOGADOR"] = "Teleportar até jogador",
            ["TELEPORTA_ATE_O_JOGADOR_SELECIONADO"] = "Teleporta até o jogador selecionado",
            ["TELEPORTA_INFINITAMENTE_NO_JOGADO_QUE_FO"] = "Teleporta infinitamente no jogado que foi selecionado acima.",
            ["DELAY_ENTRE_TPS"] = "Delay entre TPs",
            ["TEMPO_EM_SEGUNDOS_ENTRE_CADA_TELEPORTE_M"] = "Tempo em segundos entre cada teleporte (menor = mais rápido)",
            ["LOOP_TP_DELAY"] = "Loop TP Delay",
            ["ATUALIZADO_PARA"] = "Atualizado para",
            ["TELEPORT_TO_ISLANDS"] = "Teleport to Islands",
            ["TELEPORTA_PARA_AS_ILHAS_PRINCIPAIS_DO_JO"] = "Teleporta para as ilhas principais do jogo.",
            ["TELEPORTE_PARA_ILHA"] = "Teleporte para ilha",
            ["TELEPORTA_PARA_A_ILHA_SELECIONADA"] = "Teleporta para a ilha selecionada.",
            ["STARTER_ISLAND"] = "Starter Island",
            ["FOREST_ISLAND"] = "Forest Island",
            ["DESERT_ISLAND"] = "Desert Island",
            ["SNOW_ISLAND"] = "Snow Island",
            ["VOLCANO_ISLAND"] = "Volcano Island",
            ["SKY_ISLAND"] = "Sky Island",
            ["MISCELLANEOUS"] = "Miscellaneous",
            ["FUNCOES_DIVERSAS_DO_ROYAL_HUB"] = "Funções diversas do Royal Hub.",
            ["REENTRA_NA_PARTIDA_ATUAL"] = "Reentra na partida atual.",
            ["ENTRA_EM_OUTRO_SERVIDOR_DA_PARTIDA_ATUAL"] = "Entra em outro servidor da partida atual.",
            ["REDEEM_CODES"] = "Redeem Codes",
            ["RESGATA_CODIGOS_AUTOMATICAMENTE"] = "Resgata códigos automaticamente.",
            ["COLLECT_REWARDS"] = "Collect Rewards",
            ["COLETA_RECOMPENSAS_DIARIAS_AUTOMATICAMEN"] = "Coleta recompensas diárias automaticamente.",
            ["FUNCOES_EXPLOITS_DO_ROYAL_HUB_PODE_NAO_F"] = "Funções exploits do Royal Hub. ( pode não funcionar )",
            ["SELECIONE_JOGADOR"] = "Selecione Jogador",
            ["EM_MANUTENCAO"] = "Em manutenção.",
            ["FLING_POWER"] = "Fling Power",
            ["LOOP_FLING"] = "Loop Fling",
            ["SELECIONE_UM_ALVO"] = "Selecione um alvo!",
            ["FLING_PLAYER"] = "Fling Player",
            ["FAZ_O_JOGADOR_SELECIONADO_VOAR_PELO_MAPA"] = "Faz o jogador selecionado voar pelo mapa.",
            ["FLING"] = "Fling",
            ["ARREMESSADO"] = "Arremessado:",
            ["SELECIONE_UM_ALVO_PRIMEIRO"] = "Selecione um alvo primeiro!",
            ["SPYCHAT"] = "SpyChat",
            ["ESPIONA_TODOS_CHATS_PRIVADOSDMS"] = "Espiona TODOS chats privados/DMs.",
            ["FUN"] = "Fun",
            ["FUNCOES_DIVERTIDAS_DO_ROYAL_HUB"] = "Funções divertidas do Royal Hub.",
            ["FAZ_O_PERSONAGEM_GIRAR_INFINITAMENTE"] = "Faz o personagem girar infinitamente.",
            ["ATIVAR_ORBIT"] = "Ativar Orbit",
            ["VELOCIDADE_ROTACAO"] = "Velocidade Rotação",
            ["IDS_TROLL_PRONTOS"] = "IDs Troll Prontos",
            ["EM_MANUTENCAO_2"] = "Em manutenção",
            ["TROLL_SELECIONADO"] = "Troll Selecionado",
            ["CARREGADO"] = "Carregado:",
            ["VOLUME"] = "Volume",
            ["TOCAR_GLOBAL"] = "Tocar Global",
            ["SELECIONE_EMOTE"] = "Selecione Emote",
            ["EMOTES_DISPONIVEIS_MESMO_SEM_TER_NA_CONT"] = "Emotes disponíveis (mesmo sem ter na conta).",
            ["LOOP_EMOTE"] = "Loop Emote",
            ["FAZ_O_EMOTE_REPETIR_AUTOMATICAMENTE"] = "Faz o emote repetir automaticamente.",
            ["EMOTE"] = "Emote",
            ["LOOP"] = "Loop",
            ["USAR_EMOTE"] = "Usar Emote",
            ["EXECUTA_O_EMOTE_SELECIONADO"] = "Executa o emote selecionado.",
            ["SELECIONE_UM_EMOTE_PRIMEIRO"] = "Selecione um emote primeiro!",
            ["FALHA_AO_CARREGAR"] = "Falha ao carregar",
            ["TOCANDO"] = "Tocando",
            ["PARAR_EMOTE"] = "Parar Emote",
            ["INTERROMPE_O_EMOTE_ATUAL"] = "Interrompe o emote atual.",
            ["EMOTE_E_LOOP_PARADOS"] = "Emote e loop parados!",
            ["BROOKHAVEN"] = "BrookHaven",
            ["FAELZIN_HUB"] = "FAELZIN HUB",
            ["BRUTON_HUB"] = "BRUTON HUB",
            ["CARTOLA_HUB"] = "CARTOLA HUB",
            ["PILOT_HUB"] = "PILOT HUB",
            ["SALVATORE"] = "SALVATORE",
            ["SANDER_XY"] = "SANDER XY",
            ["HX_HEXAGON"] = "HX HEXAGON",
            ["COVET_HUB"] = "COVET HUB",
            ["LOBO_HUB"] = "LOBO HUB",
            ["FORBID_SPAMMER"] = "FORBID SPAMMER",
            ["SPECTRA_HUB"] = "SPECTRA HUB",
            ["CHAD_HUB"] = "CHAD HUB",
            ["MAX_HUB"] = "MAX HUB",
            ["CHAD_HUB_V2"] = "CHAD HUB V2",
            ["PHANTOM_CLIENT"] = "PHANTOM CLIENT",
            ["LYRA_HUB"] = "LYRA HUB",
            ["SANT_HUB"] = "SANT HUB",
            ["KINGLEGACY"] = "King-Legacy",
            ["ZEEHUB_UPD_9"] = "ZEE-HUB UPD 9",
            ["UNIVERSAIS"] = "Universais",
            ["DEXEXPLORER"] = "DEX-EXPLORER",
            ["TCA_GUI"] = "TCA GUI",
            ["INFINITE_YIELD"] = "INFINITE YIELD",
            ["INFORMACOES"] = "Informações",
            ["EODRAXKK"] = "Eodraxkk",
            ["DESENVOLVEDOR_PRINCIPAL_DO_ROYAL_HUB_FOC"] = "Desenvolvedor principal do Royal Hub, focado em programação e segurança.",
            ["EINZBERN"] = "Einzbern",
            ["CODESENVOLVEDOR_DO_ROYAL_HUB_FOCADO_EM_D"] = "Co-desenvolvedor do Royal Hub, focado em design e ideias de funções.",
            ["LINK_DO_DISCORD"] = "Link do Discord",
            ["CLIQUE_PARA_COPIAR_O_LINK"] = "Clique para copiar o link",
            ["CLIPBOARD"] = "Clipboard",
            ["LINK_DO_DISCORD_COPIADO_PARA_A_AREA_DE_T"] = "Link do Discord copiado para a área de transferência!",
            ["SOBRE_O_ROYAL_HUB"] = "Sobre o Royal Hub",
        },

        ["es"] = {
            ["AVISO"] = "¡AVISO!",
            ["ERRO"] = "Error",
            ["JOGADOR_NAO_ENCONTRADO_OU_SEM_PERSONAGEM"] = "Jugador no encontrado o sin personaje.",
            ["LOOP_TP"] = "Loop TP",
            ["ALVO_SUMIU_OU_MORREU_LOOP_PARADO"] = "Objetivo desapareció o murió. Loop detenido.",
            ["SELECIONE_UM_JOGADOR_NO_DROPDOWN_PRIMEIR"] = "¡Selecciona un jugador en el dropdown primero!",
            ["INICIANDO_LOOP_NO_JOGADOR"] = "Iniciando loop en el jugador:",
            ["LOOP_DESATIVADO"] = "Loop desactivado.",
            ["ESP_ATIVADO"] = "¡ESP activado!",
            ["ESP_DESATIVADO"] = "¡ESP desactivado!",
            ["REJOIN"] = "Rejoin",
            ["NAO_FOI_POSSIVEL_PEGAR_O_JOBID_ATUAL_TEN"] = "No fue posible obtener el JobId actual. Intenta de nuevo.",
            ["VOLTANDO_PRO_MESMO_SERVIDOR"] = "Volviendo al mismo servidor...",
            ["SERVER_HOP"] = "Server Hop",
            ["BUSCANDO_SERVIDORES_AGUARDE_510S"] = "Buscando servidores... (espera 5-10s)",
            ["ERRO_HOP"] = "Error Hop",
            ["SEM_SERVIDORES"] = "Sin Servidores",
            ["NENHUM_SERVER_DISPONIVEL_AGORA_TENTE_DE_"] = "Ningún servidor disponible ahora. Intenta de nuevo o en otro juego.",
            ["HOP"] = "¡Hop!",
            ["TELEPORTANDO_PRO_SERVER"] = "Teletransportando al servidor:",
            ["TELEPORT_FALHOU"] = "Teletransporte Fallido",
            ["ERRO_2"] = "Error:",
            ["SPIN"] = "Spin",
            ["GIRANDO_DESATIVE_PRA_PARAR"] = "¡Girando! (Desactiva para parar)",
            ["ERRO_SPIN"] = "Error Spin",
            ["PERSONAGEM_NAO_CARREGADO"] = "Personaje no cargado.",
            ["PAROU_DE_GIRAR"] = "Dejó de girar.",
            ["FLY"] = "Fly",
            ["VOO_ATIVADO"] = "¡Vuelo activado!",
            ["DESATIVADO"] = "Desactivado",
            ["FAKE_TP"] = "Fake TP",
            ["ATIVADO_DODGE_ANTIAIM_LIGADO"] = "¡Activado! (Dodge anti-aim activado)",
            ["DESATIVADO_2"] = "¡Desactivado!",
            ["ORBIT"] = "Orbit",
            ["ALVO_SUMIU_OU_MORREU_ORBIT_PARADO"] = "Objetivo desapareció o murió. Orbit detenido.",
            ["ORBITANDO"] = "Orbitando",
            ["ORBIT_DESATIVADO"] = "Orbit desactivado.",
            ["VELOCIDADE_ATUALIZADA_PARA"] = "Velocidad actualizada a",
            ["NOCLIP"] = "NoClip",
            ["NOCLIP_ATIVADO"] = "¡NoClip activado!",
            ["NOCLIP_DESATIVADO"] = "NoClip desactivado.",
            ["ROYAL_HUB_AVISO"] = "Royal Hub - ¡Advertencia!",
            ["SCRIPT_EM_DESENVOLVIMENTO_FUNCOES_PODEM_"] = "Script en desarrollo, las funciones pueden fallar con el tiempo.",
            ["VERIFICACAO"] = "Verificación",
            ["VERIFICANDO_USUARIO"] = "Verificando usuario...",
            ["REGISTER"] = "Register",
            ["OPEN_ROYAL_HUB"] = "Open Royal Hub",
            ["USERID"] = "UserID:",
            ["COPIAR_USERID"] = "Copiar UserID",
            ["COPIADO"] = "¡Copiado!",
            ["USERID_COPIADO_PARA_A_AREA_DE_TRANSFEREN"] = "UserID copiado al portapapeles.",
            ["FECHAR"] = "Cerrar",
            ["KEYBIND"] = "KeyBind",
            ["APERTE_A_TECLA_H_PARA_ESCONDER_MOSTRAR_O"] = "Presiona la tecla ( H ) para ocultar | Mostrar el menú",
            ["V144"] = "v1.4.4",
            ["SECURE"] = "Secure",
            ["FPS_0"] = "FPS: 0",
            ["PING_0MS"] = "Ping: 0ms",
            ["INICIO"] = "Inicio",
            ["FUNCOES_PRINCIPAIS_DO_ROYAL_HUB"] = "Funciones principales de Royal Hub.",
            ["PERSONAGEM"] = "Personaje",
            ["MODIFICACOES_NO_PERSONAGEM"] = "Modificaciones del personaje.",
            ["FARM"] = "Farm",
            ["FUNCOES_DE_FARM_AUTOMATICO"] = "Funciones de farm automático.",
            ["LOJA"] = "Tienda",
            ["COMPRE_ITENS_AUTOMATICAMENTE"] = "Compra objetos automáticamente.",
            ["TP_AND_WBHK"] = "TP and WBHK",
            ["TELEPORTE_E_WEBHOOK"] = "Teletransporte y WebHook.",
            ["MISC"] = "Misc",
            ["FUNCOES_DIVERSAS"] = "Funciones diversas.",
            ["EXPLOITS"] = "Exploits",
            ["SCRIPTS_QUE_PODEM_SER_UTEIS"] = "Scripts que pueden ser útiles",
            ["CONFIGURACOES"] = "Configuración",
            ["CONFIGURACOES_DO_ROYAL_HUB"] = "Configuración de Royal Hub.",
            ["INFO"] = "Info",
            ["INFORMACOES_SOBRE_O_ROYAL_HUB_E_DESENVOL"] = "Información sobre Royal Hub y Desarrolladores.",
            ["AIMBOT"] = "Aimbot",
            ["FUNCAO_DE_AIMBOT_PARA_FACILITAR_SEUS_TIR"] = "Función de aimbot para facilitar tus disparos y ataques.",
            ["AIMBOT_COMUM"] = "Aimbot común",
            ["AIMBOT_RAGE"] = "Aimbot Rage",
            ["IGNORAR_ALIADOS_TEAM_CHECK"] = "Ignorar Aliados (Team Check)",
            ["TEAM_CHECK"] = "Team Check",
            ["WALL_CHECK_IGNORAR_PAREDES"] = "Wall Check (Ignorar Paredes)",
            ["WALL_CHECK"] = "Wall Check",
            ["ESP"] = "ESP",
            ["PLAYERS_FICAM_VISIVEIS_ATRAS_DE_PAREDES_"] = "Los jugadores son visibles detrás de paredes y marcados.",
            ["EM_DESENVOLVIMENTO"] = "En desarrollo",
            ["ESP_ATIVADO_2"] = "ESP Activado",
            ["PLAYERS_DESTACADOS"] = "¡Jugadores destacados!",
            ["ESP_DESATIVADO_2"] = "ESP Desactivado",
            ["REMOVIDO"] = "Eliminado.",
            ["ESP_20_TWILIGHT"] = "ESP 2.0 (Twilight)",
            ["ESP_COM_HEALTH_BAR_BOX_E_NOME_POWERED_BY"] = "ESP con barra de salud, caja y nombre — powered by Twilight.",
            ["ESP_20"] = "ESP 2.0",
            ["FAKE_TP_DODGE"] = "Fake TP (Dodge)",
            ["DELAY_FAKE_TP"] = "Delay Fake TP",
            ["TEMPO_ENTRE_FAKES_MENOR_MAIS_RAPIDO"] = "Tiempo entre fakes (menor = más rápido)",
            ["DISTANCIA_FAKE_TP"] = "Distancia Fake TP",
            ["QUAO_LONGE_O_FAKE_TP_VAI_EM_STUDS"] = "Qué tan lejos va el fake TP (en studs)",
            ["VISUAL"] = "Visual",
            ["MODIFICACOES_VISUAIS_NO_JOGO"] = "Modificaciones visuales en el juego.",
            ["SELECIONE_O_PLAYER"] = "Seleccionar Jugador",
            ["SELECIONA_O_PLAYER_PARA_APLICAR_AS_MODIF"] = "Selecciona el jugador para aplicar las modificaciones visuales.",
            ["EM_DESENVOLVIMENTO_2"] = "En desarrollo.",
            ["VISUALIZAR_PLAYER"] = "Visualizar Jugador",
            ["ATIVA_AS_MODIFICACOES_VISUAIS_NO_PLAYER_"] = "Activa las modificaciones visuales en el jugador seleccionado arriba.",
            ["PERMITE_ATRAVESSAR_PAREDES_E_OBJETOS"] = "Permite atravesar paredes y objetos.",
            ["AUTO_FARM_LEVEL"] = "Auto Farm Level",
            ["FARMA_AUTOMATICAMENTE_SEU_LEVEL_SE_NAO_E"] = "Farmea automáticamente tu nivel (si no está al máximo)",
            ["ATIVAR_AUTO_FARM_LEVEL"] = "Activar Auto Farm Level",
            ["ATIVA_O_FARM_AUTOMATICO_DE_LEVEL"] = "Activa el farmeo automático de nivel.",
            ["AUTO_FARM_LEVEL_ATIVADO"] = "¡Auto Farm Level activado!",
            ["AUTO_FARM_LEVEL_DESATIVADO"] = "¡Auto Farm Level desactivado!",
            ["AUTO_FARM_MATERIALS"] = "Auto Farm Materials",
            ["FARMA_AUTOMATICAMENTE_MATERIAIS_DO_JOGO"] = "Farmea automáticamente materiales del juego.",
            ["ATIVAR_AUTO_FARM_MATERIALS"] = "Activar Auto Farm Materials",
            ["ATIVA_O_FARM_AUTOMATICO_DE_MATERIAIS"] = "Activa el farmeo automático de materiales.",
            ["AUTO_FARM_MATERIALS_ATIVADO"] = "¡Auto Farm Materials activado!",
            ["AUTO_FARM_MATERIALS_DESATIVADO"] = "¡Auto Farm Materials desactivado!",
            ["SELECIONAR_MATERIAL"] = "Seleccionar Material",
            ["SELECIONA_O_MATERIAL_QUE_DESEJA_FARMAR_A"] = "Selecciona el material que deseas farmear automáticamente.",
            ["MATERIAL_1"] = "Material 1",
            ["MATERIAL_2"] = "Material 2",
            ["MATERIAL_3"] = "Material 3",
            ["AUTO_BUY"] = "Auto Buy",
            ["COMPRA_ITENS_AUTOMATICAMENTE_DO_BLACKMAR"] = "Compra artículos automáticamente del mercado negro.",
            ["SELECIONAR_ITEM"] = "Seleccionar Artículo",
            ["SELECIONA_O_ITEM_QUE_DESEJA_COMPRAR_AUTO"] = "Selecciona el artículo que deseas comprar automáticamente.",
            ["ITEM_1"] = "Artículo 1",
            ["ITEM_2"] = "Artículo 2",
            ["ITEM_3"] = "Artículo 3",
            ["ATIVAR_AUTO_BUY"] = "Activar Auto Buy",
            ["ATIVA_A_COMPRA_AUTOMATICA_DO_ITEM_SELECI"] = "Activa la compra automática del artículo seleccionado arriba.",
            ["AUTO_BUY_ATIVADO"] = "¡Auto Buy activado!",
            ["AUTO_BUY_DESATIVADO"] = "¡Auto Buy desactivado!",
            ["GENERAL_SETTINGS"] = "General Settings",
            ["CONFIGURACOES_DE_TEMA_KEYBIND_E_ETC"] = "Configuración de tema, Keybind, etc.",
            ["BYPASS_ANTICHEAT"] = "Bypass Anti-Cheat",
            ["TENTA_BURLAR_O_SISTEMA_ANTICHEAT_DO_JOGO"] = "Intenta eludir el sistema anti-trampas del juego.",
            ["AVISO_2"] = "¡Aviso!",
            ["BYPASS_ATIVADO_COM_SUCESSO_FUNCIONALIDAD"] = "¡Bypass activado con éxito! (Funcionalidad en desarrollo)",
            ["TEMAS"] = "Temas",
            ["ALTERA_O_TEMA_DO_ROYAL_HUB"] = "Cambiar el tema de Royal Hub",
            ["DARK_AMOLED_DEFAULT"] = "Dark Amoled ( Por defecto )",
            ["HUTAO_BY_EINZBERN"] = "Hutao By Einzbern",
            ["REDX_HUB"] = "RedX Hub",
            ["WHITE"] = "Blanco",
            ["MAIN_THEME"] = "Tema Principal",
            ["CYBERPUNK"] = "CyberPunk",
            ["SOLAR_THEME"] = "Tema Solar",
            ["MIDNIGHT"] = "Medianoche",
            ["CRIMSON"] = "Carmesí",
            ["SNOW"] = "Nieve",
            ["TUNDRA"] = "Tundra",
            ["SAMURAI_DARK"] = "Samurai Dark",
            ["MONOKAI"] = "Monokai",
            ["MOONLIGHT"] = "Luz de Luna",
            ["LUNAR"] = "Lunar",
            ["INDIGO"] = "Índigo",
            ["STARTORCH"] = "Startorch",
            ["TOGGLE_UI"] = "Toggle UI",
            ["ALTERA_A_TECLA_QUE_MOSTRA_ESCONDE_O_MENU"] = "Cambia la tecla que muestra | oculta el menú.",
            ["SALVAR_CONFIG"] = "Guardar Config",
            ["SALVA_TEMA_SELECIONADO_E_ETC"] = "Guarda el tema seleccionado y etc.",
            ["CONFIGURACAO_SALVA"] = "¡Configuración guardada!",
            ["SUA_CONFIGURACAO_FOI_SALVA_COM_SUCESSO"] = "¡Tu configuración fue guardada con éxito!",
            ["CARREGAR_CONFIG"] = "Cargar Config",
            ["CARREGA_A_CONFIGURACAO_SALVA_ANTERIORMEN"] = "Carga la configuración guardada anteriormente.",
            ["CONFIGURACAO_CARREGADA"] = "¡Configuración cargada!",
            ["SUA_CONFIGURACAO_FOI_CARREGADA_COM_SUCES"] = "¡Tu configuración fue cargada con éxito!",
            ["BACKDOOR_SCANNER"] = "Backdoor scanner",
            ["ESCANEIA_O_JOGO_EM_BUSCA_DE_BACKDOORS_CO"] = "Escanea el juego en busca de backdoors conocidos.",
            ["EJETAR_SCRIPT"] = "Expulsar script",
            ["EJETA_A_SCRIPT_DO_JOGO"] = "Expulsa el script del juego.",
            ["CONFIRM_DELETE"] = "Confirm Delete",
            ["ESTA_ACAO_NAO_PODE_SER_DESFEITA"] = "Esta acción no se puede deshacer.",
            ["CANCELAR"] = "Cancelar",
            ["EJETAR"] = "Expulsar",
            ["KEYBINDS"] = "KeyBinds",
            ["AQUI_VOCE_PODE_ALTERAR_OS_KEYBINDS_DAS_F"] = "Aquí puedes cambiar los keybinds de las funciones.",
            ["AIMBOT_COMUM_K"] = "Aimbot Común (K)",
            ["AIMBOT_COMUM_2"] = "Aimbot Común",
            ["AIMBOT_RAGE_L"] = "Aimbot Rage (L)",
            ["AIMBOT_RAGE_2"] = "Aimbot Rage",
            ["ESP_E"] = "ESP (E)",
            ["ESP_2"] = "ESP",
            ["ATIVADO"] = "¡Activado!",
            ["FLY_F"] = "Fly (F)",
            ["SPIN_G"] = "Spin (G)",
            ["LOOP_TP_T"] = "Loop TP (T)",
            ["CONFIGURACOES_DE_FUNCOES"] = "Configuración de funciones",
            ["MODO_ANONYMOUS"] = "Modo anonymous",
            ["ATIVA_O_MODO_ANONYMOUS_QUE_ESCONDE_SEU_N"] = "Activa el modo anonymous, que oculta tu nombre e imagen del panel",
            ["MOVIMENTO"] = "Movimiento",
            ["SPEED"] = "Speed",
            ["ALTERA_VELOCIDADE_DO_JOGADOR"] = "Cambia la velocidad del jugador",
            ["JUMP"] = "Jump",
            ["AUMENTA_A_FORCA_DO_PULO"] = "Aumenta la fuerza del salto",
            ["ATIVA_O_MODO_VOO"] = "Activa el modo vuelo",
            ["VELOCIDADE_DO_FLY"] = "Velocidad de Fly",
            ["AJUSTE_A_VELOCIDADE_DO_VOO_QUANTO_MAIOR_"] = "Ajusta la velocidad de vuelo (mayor = más rápido).",
            ["GRAVIDADE"] = "Gravedad",
            ["GRAVITY"] = "Gravity",
            ["ALTERA_A_GRAVIDADE_DO_JOGO"] = "Cambia la gravedad del juego",
            ["RESET_GRAVITY"] = "Reset Gravity",
            ["RESETA_A_GRAVIDADE_PARA_O_VALOR_PADRAO_1"] = "Restablece la gravedad al valor predeterminado (196.2)",
            ["GRAVIDADE_RESETADA"] = "¡Gravedad restablecida!",
            ["A_GRAVIDADE_FOI_RESETADA_PARA_O_VALOR_PA"] = "La gravedad ha sido restablecida al valor predeterminado (196.2)",
            ["OUTROS"] = "Otros",
            ["TELEPORT"] = "Teleport",
            ["PERMITE_TELEPORTAR_ATE_OUTROS_JOGADORES"] = "Permite teletransportarse a otros jugadores.",
            ["TELEPORTAR_ATE_JOGADOR"] = "Teletransportar a jugador",
            ["TELEPORTA_ATE_O_JOGADOR_SELECIONADO"] = "Teletransporta al jugador seleccionado",
            ["TELEPORTA_INFINITAMENTE_NO_JOGADO_QUE_FO"] = "Teletransporta infinitamente al jugador seleccionado arriba.",
            ["DELAY_ENTRE_TPS"] = "Delay entre TPs",
            ["TEMPO_EM_SEGUNDOS_ENTRE_CADA_TELEPORTE_M"] = "Tiempo en segundos entre cada teletransporte (menor = más rápido)",
            ["LOOP_TP_DELAY"] = "Loop TP Delay",
            ["ATUALIZADO_PARA"] = "Actualizado a",
            ["TELEPORT_TO_ISLANDS"] = "Teleport to Islands",
            ["TELEPORTA_PARA_AS_ILHAS_PRINCIPAIS_DO_JO"] = "Teletransporta a las islas principales del juego.",
            ["TELEPORTE_PARA_ILHA"] = "Teletransporte a isla",
            ["TELEPORTA_PARA_A_ILHA_SELECIONADA"] = "Teletransporta a la isla seleccionada.",
            ["STARTER_ISLAND"] = "Starter Island",
            ["FOREST_ISLAND"] = "Forest Island",
            ["DESERT_ISLAND"] = "Desert Island",
            ["SNOW_ISLAND"] = "Snow Island",
            ["VOLCANO_ISLAND"] = "Volcano Island",
            ["SKY_ISLAND"] = "Sky Island",
            ["MISCELLANEOUS"] = "Miscellaneous",
            ["FUNCOES_DIVERSAS_DO_ROYAL_HUB"] = "Funciones diversas de Royal Hub.",
            ["REENTRA_NA_PARTIDA_ATUAL"] = "Volver a unirse a la partida actual.",
            ["ENTRA_EM_OUTRO_SERVIDOR_DA_PARTIDA_ATUAL"] = "Unirse a otro servidor de la partida actual.",
            ["REDEEM_CODES"] = "Redeem Codes",
            ["RESGATA_CODIGOS_AUTOMATICAMENTE"] = "Canjear códigos automáticamente.",
            ["COLLECT_REWARDS"] = "Collect Rewards",
            ["COLETA_RECOMPENSAS_DIARIAS_AUTOMATICAMEN"] = "Recolectar recompensas diarias automáticamente.",
            ["FUNCOES_EXPLOITS_DO_ROYAL_HUB_PODE_NAO_F"] = "Funciones exploits de Royal Hub. (puede no funcionar)",
            ["SELECIONE_JOGADOR"] = "Seleccionar Jugador",
            ["EM_MANUTENCAO"] = "En mantenimiento.",
            ["FLING_POWER"] = "Fling Power",
            ["LOOP_FLING"] = "Loop Fling",
            ["SELECIONE_UM_ALVO"] = "¡Selecciona un objetivo!",
            ["FLING_PLAYER"] = "Fling Player",
            ["FAZ_O_JOGADOR_SELECIONADO_VOAR_PELO_MAPA"] = "Hace que el jugador seleccionado vuele por el mapa.",
            ["FLING"] = "Fling",
            ["ARREMESSADO"] = "Lanzado:",
            ["SELECIONE_UM_ALVO_PRIMEIRO"] = "¡Selecciona un objetivo primero!",
            ["SPYCHAT"] = "SpyChat",
            ["ESPIONA_TODOS_CHATS_PRIVADOSDMS"] = "Espía TODOS los chats privados/DMs.",
            ["FUN"] = "Fun",
            ["FUNCOES_DIVERTIDAS_DO_ROYAL_HUB"] = "Funciones divertidas de Royal Hub.",
            ["FAZ_O_PERSONAGEM_GIRAR_INFINITAMENTE"] = "Hace que el personaje gire infinitamente.",
            ["ATIVAR_ORBIT"] = "Activar Orbit",
            ["VELOCIDADE_ROTACAO"] = "Velocidad de Rotación",
            ["IDS_TROLL_PRONTOS"] = "IDs Troll Listos",
            ["EM_MANUTENCAO_2"] = "En mantenimiento",
            ["TROLL_SELECIONADO"] = "Troll Seleccionado",
            ["CARREGADO"] = "Cargado:",
            ["VOLUME"] = "Volumen",
            ["TOCAR_GLOBAL"] = "Reproducir Global",
            ["SELECIONE_EMOTE"] = "Seleccionar Emote",
            ["EMOTES_DISPONIVEIS_MESMO_SEM_TER_NA_CONT"] = "Emotes disponibles (incluso sin tenerlos en la cuenta).",
            ["LOOP_EMOTE"] = "Loop Emote",
            ["FAZ_O_EMOTE_REPETIR_AUTOMATICAMENTE"] = "Hace que el emote se repita automáticamente.",
            ["EMOTE"] = "Emote",
            ["LOOP"] = "Loop",
            ["USAR_EMOTE"] = "Usar Emote",
            ["EXECUTA_O_EMOTE_SELECIONADO"] = "Ejecuta el emote seleccionado.",
            ["SELECIONE_UM_EMOTE_PRIMEIRO"] = "¡Selecciona un emote primero!",
            ["FALHA_AO_CARREGAR"] = "Error al cargar",
            ["TOCANDO"] = "Reproduciendo",
            ["PARAR_EMOTE"] = "Detener Emote",
            ["INTERROMPE_O_EMOTE_ATUAL"] = "Detiene el emote actual.",
            ["EMOTE_E_LOOP_PARADOS"] = "¡Emote y loop detenidos!",
            ["BROOKHAVEN"] = "BrookHaven",
            ["FAELZIN_HUB"] = "FAELZIN HUB",
            ["BRUTON_HUB"] = "BRUTON HUB",
            ["CARTOLA_HUB"] = "CARTOLA HUB",
            ["PILOT_HUB"] = "PILOT HUB",
            ["SALVATORE"] = "SALVATORE",
            ["SANDER_XY"] = "SANDER XY",
            ["HX_HEXAGON"] = "HX HEXAGON",
            ["COVET_HUB"] = "COVET HUB",
            ["LOBO_HUB"] = "LOBO HUB",
            ["FORBID_SPAMMER"] = "FORBID SPAMMER",
            ["SPECTRA_HUB"] = "SPECTRA HUB",
            ["CHAD_HUB"] = "CHAD HUB",
            ["MAX_HUB"] = "MAX HUB",
            ["CHAD_HUB_V2"] = "CHAD HUB V2",
            ["PHANTOM_CLIENT"] = "PHANTOM CLIENT",
            ["LYRA_HUB"] = "LYRA HUB",
            ["SANT_HUB"] = "SANT HUB",
            ["KINGLEGACY"] = "King-Legacy",
            ["ZEEHUB_UPD_9"] = "ZEE-HUB UPD 9",
            ["UNIVERSAIS"] = "Universal",
            ["DEXEXPLORER"] = "DEX-EXPLORER",
            ["TCA_GUI"] = "TCA GUI",
            ["INFINITE_YIELD"] = "INFINITE YIELD",
            ["INFORMACOES"] = "Información",
            ["EODRAXKK"] = "Eodraxkk",
            ["DESENVOLVEDOR_PRINCIPAL_DO_ROYAL_HUB_FOC"] = "Desarrollador principal de Royal Hub, enfocado en programación y seguridad.",
            ["EINZBERN"] = "Einzbern",
            ["CODESENVOLVEDOR_DO_ROYAL_HUB_FOCADO_EM_D"] = "Co-desarrollador de Royal Hub, enfocado en diseño e ideas de funciones.",
            ["LINK_DO_DISCORD"] = "Enlace de Discord",
            ["CLIQUE_PARA_COPIAR_O_LINK"] = "Haz clic para copiar el enlace",
            ["CLIPBOARD"] = "Portapapeles",
            ["LINK_DO_DISCORD_COPIADO_PARA_A_AREA_DE_T"] = "¡Enlace de Discord copiado al portapapeles!",
            ["SOBRE_O_ROYAL_HUB"] = "Acerca de Royal Hub",
        },

        ["ru"] = {
            ["AVISO"] = "ВНИМАНИЕ!",
            ["ERRO"] = "Ошибка",
            ["JOGADOR_NAO_ENCONTRADO_OU_SEM_PERSONAGEM"] = "Игрок не найден или без персонажа.",
            ["LOOP_TP"] = "Loop TP",
            ["ALVO_SUMIU_OU_MORREU_LOOP_PARADO"] = "Цель исчезла или умерла. Loop остановлен.",
            ["SELECIONE_UM_JOGADOR_NO_DROPDOWN_PRIMEIR"] = "Сначала выберите игрока в выпадающем списке!",
            ["INICIANDO_LOOP_NO_JOGADOR"] = "Запуск loop на игрока:",
            ["LOOP_DESATIVADO"] = "Loop отключён.",
            ["ESP_ATIVADO"] = "ESP активирован!",
            ["ESP_DESATIVADO"] = "ESP отключён!",
            ["REJOIN"] = "Rejoin",
            ["NAO_FOI_POSSIVEL_PEGAR_O_JOBID_ATUAL_TEN"] = "Не удалось получить текущий JobId. Попробуйте снова.",
            ["VOLTANDO_PRO_MESMO_SERVIDOR"] = "Возврат на тот же сервер...",
            ["SERVER_HOP"] = "Server Hop",
            ["BUSCANDO_SERVIDORES_AGUARDE_510S"] = "Поиск серверов... (подождите 5-10с)",
            ["ERRO_HOP"] = "Ошибка Hop",
            ["SEM_SERVIDORES"] = "Нет Серверов",
            ["NENHUM_SERVER_DISPONIVEL_AGORA_TENTE_DE_"] = "Нет доступных серверов сейчас. Попробуйте снова или в другой игре.",
            ["HOP"] = "Hop!",
            ["TELEPORTANDO_PRO_SERVER"] = "Телепортация на сервер:",
            ["TELEPORT_FALHOU"] = "Телепорт не удался",
            ["ERRO_2"] = "Ошибка:",
            ["SPIN"] = "Spin",
            ["GIRANDO_DESATIVE_PRA_PARAR"] = "Вращение! (Отключите, чтобы остановить)",
            ["ERRO_SPIN"] = "Ошибка Spin",
            ["PERSONAGEM_NAO_CARREGADO"] = "Персонаж не загружен.",
            ["PAROU_DE_GIRAR"] = "Вращение остановлено.",
            ["FLY"] = "Fly",
            ["VOO_ATIVADO"] = "Полёт активирован!",
            ["DESATIVADO"] = "Отключено",
            ["FAKE_TP"] = "Fake TP",
            ["ATIVADO_DODGE_ANTIAIM_LIGADO"] = "Включено! (Dodge anti-aim включён)",
            ["DESATIVADO_2"] = "Отключено!",
            ["ORBIT"] = "Orbit",
            ["ALVO_SUMIU_OU_MORREU_ORBIT_PARADO"] = "Цель исчезла или умерла. Orbit остановлен.",
            ["ORBITANDO"] = "Орбита",
            ["ORBIT_DESATIVADO"] = "Orbit отключён.",
            ["VELOCIDADE_ATUALIZADA_PARA"] = "Скорость обновлена до",
            ["NOCLIP"] = "NoClip",
            ["NOCLIP_ATIVADO"] = "NoClip включен!",
            ["NOCLIP_DESATIVADO"] = "NoClip отключен.",
            ["ROYAL_HUB_AVISO"] = "Royal Hub - Предупреждение!",
            ["SCRIPT_EM_DESENVOLVIMENTO_FUNCOES_PODEM_"] = "Скрипт в разработке, функции могут сломаться со временем.",
            ["VERIFICACAO"] = "Проверка",
            ["VERIFICANDO_USUARIO"] = "Проверка пользователя...",
            ["REGISTER"] = "Register",
            ["OPEN_ROYAL_HUB"] = "Open Royal Hub",
            ["USERID"] = "UserID:",
            ["COPIAR_USERID"] = "Копировать UserID",
            ["COPIADO"] = "Скопировано!",
            ["USERID_COPIADO_PARA_A_AREA_DE_TRANSFEREN"] = "UserID скопирован в буфер обмена.",
            ["FECHAR"] = "Закрыть",
            ["KEYBIND"] = "KeyBind",
            ["APERTE_A_TECLA_H_PARA_ESCONDER_MOSTRAR_O"] = "Нажмите клавишу ( H ) чтобы скрыть | Показать меню",
            ["V144"] = "v1.4.4",
            ["SECURE"] = "Secure",
            ["FPS_0"] = "FPS: 0",
            ["PING_0MS"] = "Ping: 0ms",
            ["INICIO"] = "Главная",
            ["FUNCOES_PRINCIPAIS_DO_ROYAL_HUB"] = "Основные функции Royal Hub.",
            ["PERSONAGEM"] = "Персонаж",
            ["MODIFICACOES_NO_PERSONAGEM"] = "Модификации персонажа.",
            ["FARM"] = "Farm",
            ["FUNCOES_DE_FARM_AUTOMATICO"] = "Функции автоматического фарма.",
            ["LOJA"] = "Магазин",
            ["COMPRE_ITENS_AUTOMATICAMENTE"] = "Автоматическая покупка предметов.",
            ["TP_AND_WBHK"] = "TP and WBHK",
            ["TELEPORTE_E_WEBHOOK"] = "Телепорт и WebHook.",
            ["MISC"] = "Misc",
            ["FUNCOES_DIVERSAS"] = "Разные функции.",
            ["EXPLOITS"] = "Exploits",
            ["SCRIPTS_QUE_PODEM_SER_UTEIS"] = "Скрипты, которые могут быть полезны",
            ["CONFIGURACOES"] = "Настройки",
            ["CONFIGURACOES_DO_ROYAL_HUB"] = "Настройки Royal Hub.",
            ["INFO"] = "Info",
            ["INFORMACOES_SOBRE_O_ROYAL_HUB_E_DESENVOL"] = "Информация о Royal Hub и разработчиках.",
            ["AIMBOT"] = "Aimbot",
            ["FUNCAO_DE_AIMBOT_PARA_FACILITAR_SEUS_TIR"] = "Функция аимбота для облегчения стрельбы и атак.",
            ["AIMBOT_COMUM"] = "Обычный aimbot",
            ["AIMBOT_RAGE"] = "Aimbot Rage",
            ["IGNORAR_ALIADOS_TEAM_CHECK"] = "Игнорировать союзников (Team Check)",
            ["TEAM_CHECK"] = "Team Check",
            ["WALL_CHECK_IGNORAR_PAREDES"] = "Wall Check (игнорировать стены)",
            ["WALL_CHECK"] = "Wall Check",
            ["ESP"] = "ESP",
            ["PLAYERS_FICAM_VISIVEIS_ATRAS_DE_PAREDES_"] = "Игроки видны за стенами и отмечены.",
            ["EM_DESENVOLVIMENTO"] = "В разработке",
            ["ESP_ATIVADO_2"] = "ESP активирован",
            ["PLAYERS_DESTACADOS"] = "Игроки выделены!",
            ["ESP_DESATIVADO_2"] = "ESP деактивирован",
            ["REMOVIDO"] = "Удалено.",
            ["ESP_20_TWILIGHT"] = "ESP 2.0 (Twilight)",
            ["ESP_COM_HEALTH_BAR_BOX_E_NOME_POWERED_BY"] = "ESP с полосой здоровья, рамкой и именем — powered by Twilight.",
            ["ESP_20"] = "ESP 2.0",
            ["FAKE_TP_DODGE"] = "Fake TP (Dodge)",
            ["DELAY_FAKE_TP"] = "Задержка Fake TP",
            ["TEMPO_ENTRE_FAKES_MENOR_MAIS_RAPIDO"] = "Время между фейками (меньше = быстрее)",
            ["DISTANCIA_FAKE_TP"] = "Дистанция Fake TP",
            ["QUAO_LONGE_O_FAKE_TP_VAI_EM_STUDS"] = "Как далеко идёт fake TP (в стадах)",
            ["VISUAL"] = "Visual",
            ["MODIFICACOES_VISUAIS_NO_JOGO"] = "Визуальные модификации в игре.",
            ["SELECIONE_O_PLAYER"] = "Выбрать игрока",
            ["SELECIONA_O_PLAYER_PARA_APLICAR_AS_MODIF"] = "Выберите игрока для применения визуальных модификаций.",
            ["EM_DESENVOLVIMENTO_2"] = "В разработке.",
            ["VISUALIZAR_PLAYER"] = "Визуализировать игрока",
            ["ATIVA_AS_MODIFICACOES_VISUAIS_NO_PLAYER_"] = "Активирует визуальные модификации для выбранного игрока выше.",
            ["PERMITE_ATRAVESSAR_PAREDES_E_OBJETOS"] = "Позволяет проходить сквозь стены и объекты.",
            ["AUTO_FARM_LEVEL"] = "Auto Farm Level",
            ["FARMA_AUTOMATICAMENTE_SEU_LEVEL_SE_NAO_E"] = "Автоматически фармит ваш уровень (если не максимальный)",
            ["ATIVAR_AUTO_FARM_LEVEL"] = "Включить Auto Farm Level",
            ["ATIVA_O_FARM_AUTOMATICO_DE_LEVEL"] = "Активирует автоматический фарм уровня.",
            ["AUTO_FARM_LEVEL_ATIVADO"] = "Auto Farm Level включен!",
            ["AUTO_FARM_LEVEL_DESATIVADO"] = "Auto Farm Level выключен!",
            ["AUTO_FARM_MATERIALS"] = "Auto Farm Materials",
            ["FARMA_AUTOMATICAMENTE_MATERIAIS_DO_JOGO"] = "Автоматически фармит материалы игры.",
            ["ATIVAR_AUTO_FARM_MATERIALS"] = "Включить Auto Farm Materials",
            ["ATIVA_O_FARM_AUTOMATICO_DE_MATERIAIS"] = "Активирует автоматический фарм материалов.",
            ["AUTO_FARM_MATERIALS_ATIVADO"] = "Auto Farm Materials включен!",
            ["AUTO_FARM_MATERIALS_DESATIVADO"] = "Auto Farm Materials выключен!",
            ["SELECIONAR_MATERIAL"] = "Выбрать Материал",
            ["SELECIONA_O_MATERIAL_QUE_DESEJA_FARMAR_A"] = "Выберите материал для автоматической фарма.",
            ["MATERIAL_1"] = "Материал 1",
            ["MATERIAL_2"] = "Материал 2",
            ["MATERIAL_3"] = "Материал 3",
            ["AUTO_BUY"] = "Auto Buy",
            ["COMPRA_ITENS_AUTOMATICAMENTE_DO_BLACKMAR"] = "Автоматически покупает предметы на чёрном рынке.",
            ["SELECIONAR_ITEM"] = "Выбрать Предмет",
            ["SELECIONA_O_ITEM_QUE_DESEJA_COMPRAR_AUTO"] = "Выберите предмет для автоматической покупки.",
            ["ITEM_1"] = "Предмет 1",
            ["ITEM_2"] = "Предмет 2",
            ["ITEM_3"] = "Предмет 3",
            ["ATIVAR_AUTO_BUY"] = "Включить Auto Buy",
            ["ATIVA_A_COMPRA_AUTOMATICA_DO_ITEM_SELECI"] = "Включает автоматическую покупку выбранного предмета.",
            ["AUTO_BUY_ATIVADO"] = "Auto Buy включён!",
            ["AUTO_BUY_DESATIVADO"] = "Auto Buy выключен!",
            ["GENERAL_SETTINGS"] = "General Settings",
            ["CONFIGURACOES_DE_TEMA_KEYBIND_E_ETC"] = "Настройки темы, Keybind и т.д.",
            ["BYPASS_ANTICHEAT"] = "Bypass Anti-Cheat",
            ["TENTA_BURLAR_O_SISTEMA_ANTICHEAT_DO_JOGO"] = "Пытается обойти античит-систему игры.",
            ["AVISO_2"] = "Внимание!",
            ["BYPASS_ATIVADO_COM_SUCESSO_FUNCIONALIDAD"] = "Обход успешно активирован! (Функция в разработке)",
            ["TEMAS"] = "Темы",
            ["ALTERA_O_TEMA_DO_ROYAL_HUB"] = "Изменить тему Royal Hub",
            ["DARK_AMOLED_DEFAULT"] = "Dark Amoled ( По умолчанию )",
            ["HUTAO_BY_EINZBERN"] = "Hutao By Einzbern",
            ["REDX_HUB"] = "RedX Hub",
            ["WHITE"] = "Белый",
            ["MAIN_THEME"] = "Основная Тема",
            ["CYBERPUNK"] = "CyberPunk",
            ["SOLAR_THEME"] = "Солнечная Тема",
            ["MIDNIGHT"] = "Полночь",
            ["CRIMSON"] = "Багровый",
            ["SNOW"] = "Снег",
            ["TUNDRA"] = "Тундра",
            ["SAMURAI_DARK"] = "Samurai Dark",
            ["MONOKAI"] = "Monokai",
            ["MOONLIGHT"] = "Лунный Свет",
            ["LUNAR"] = "Лунный",
            ["INDIGO"] = "Индиго",
            ["STARTORCH"] = "Startorch",
            ["TOGGLE_UI"] = "Toggle UI",
            ["ALTERA_A_TECLA_QUE_MOSTRA_ESCONDE_O_MENU"] = "Изменяет клавишу, которая показывает | скрывает меню.",
            ["SALVAR_CONFIG"] = "Сохранить Config",
            ["SALVA_TEMA_SELECIONADO_E_ETC"] = "Сохраняет выбранную тему и т.д.",
            ["CONFIGURACAO_SALVA"] = "Конфигурация сохранена!",
            ["SUA_CONFIGURACAO_FOI_SALVA_COM_SUCESSO"] = "Ваша конфигурация была успешно сохранена!",
            ["CARREGAR_CONFIG"] = "Загрузить Config",
            ["CARREGA_A_CONFIGURACAO_SALVA_ANTERIORMEN"] = "Загружает ранее сохранённую конфигурацию.",
            ["CONFIGURACAO_CARREGADA"] = "Конфигурация загружена!",
            ["SUA_CONFIGURACAO_FOI_CARREGADA_COM_SUCES"] = "Ваша конфигурация была успешно загружена!",
            ["BACKDOOR_SCANNER"] = "Backdoor scanner",
            ["ESCANEIA_O_JOGO_EM_BUSCA_DE_BACKDOORS_CO"] = "Сканирует игру на наличие известных бэкдоров.",
            ["EJETAR_SCRIPT"] = "Извлечь скрипт",
            ["EJETA_A_SCRIPT_DO_JOGO"] = "Извлекает скрипт из игры.",
            ["CONFIRM_DELETE"] = "Confirm Delete",
            ["ESTA_ACAO_NAO_PODE_SER_DESFEITA"] = "Это действие нельзя отменить.",
            ["CANCELAR"] = "Отмена",
            ["EJETAR"] = "Извлечь",
            ["KEYBINDS"] = "KeyBinds",
            ["AQUI_VOCE_PODE_ALTERAR_OS_KEYBINDS_DAS_F"] = "Здесь вы можете изменить keybinds функций.",
            ["AIMBOT_COMUM_K"] = "Обычный Aimbot (K)",
            ["AIMBOT_COMUM_2"] = "Обычный Aimbot",
            ["AIMBOT_RAGE_L"] = "Aimbot Rage (L)",
            ["AIMBOT_RAGE_2"] = "Aimbot Rage",
            ["ESP_E"] = "ESP (E)",
            ["ESP_2"] = "ESP",
            ["ATIVADO"] = "Включено!",
            ["FLY_F"] = "Fly (F)",
            ["SPIN_G"] = "Spin (G)",
            ["LOOP_TP_T"] = "Loop TP (T)",
            ["CONFIGURACOES_DE_FUNCOES"] = "Настройки функций",
            ["MODO_ANONYMOUS"] = "Режим anonymous",
            ["ATIVA_O_MODO_ANONYMOUS_QUE_ESCONDE_SEU_N"] = "Включает режим anonymous, который скрывает ваше имя и изображение с панели",
            ["MOVIMENTO"] = "Движение",
            ["SPEED"] = "Speed",
            ["ALTERA_VELOCIDADE_DO_JOGADOR"] = "Изменяет скорость игрока",
            ["JUMP"] = "Jump",
            ["AUMENTA_A_FORCA_DO_PULO"] = "Увеличивает силу прыжка",
            ["ATIVA_O_MODO_VOO"] = "Включает режим полёта",
            ["VELOCIDADE_DO_FLY"] = "Скорость Fly",
            ["AJUSTE_A_VELOCIDADE_DO_VOO_QUANTO_MAIOR_"] = "Настройте скорость полёта (выше = быстрее).",
            ["GRAVIDADE"] = "Гравитация",
            ["GRAVITY"] = "Gravity",
            ["ALTERA_A_GRAVIDADE_DO_JOGO"] = "Изменяет гравитацию игры",
            ["RESET_GRAVITY"] = "Reset Gravity",
            ["RESETA_A_GRAVIDADE_PARA_O_VALOR_PADRAO_1"] = "Сбрасывает гравитацию до значения по умолчанию (196.2)",
            ["GRAVIDADE_RESETADA"] = "Гравитация сброшена!",
            ["A_GRAVIDADE_FOI_RESETADA_PARA_O_VALOR_PA"] = "Гравитация была сброшена до значения по умолчанию (196.2)",
            ["OUTROS"] = "Другое",
            ["TELEPORT"] = "Teleport",
            ["PERMITE_TELEPORTAR_ATE_OUTROS_JOGADORES"] = "Позволяет телепортироваться к другим игрокам.",
            ["TELEPORTAR_ATE_JOGADOR"] = "Телепорт к игроку",
            ["TELEPORTA_ATE_O_JOGADOR_SELECIONADO"] = "Телепортирует к выбранному игроку",
            ["TELEPORTA_INFINITAMENTE_NO_JOGADO_QUE_FO"] = "Бесконечно телепортируется к игроку, выбранному выше.",
            ["DELAY_ENTRE_TPS"] = "Delay между TPs",
            ["TEMPO_EM_SEGUNDOS_ENTRE_CADA_TELEPORTE_M"] = "Время в секундах между каждым телепортом (меньше = быстрее)",
            ["LOOP_TP_DELAY"] = "Loop TP Delay",
            ["ATUALIZADO_PARA"] = "Обновлено на",
            ["TELEPORT_TO_ISLANDS"] = "Teleport to Islands",
            ["TELEPORTA_PARA_AS_ILHAS_PRINCIPAIS_DO_JO"] = "Телепортироваться на основные острова игры.",
            ["TELEPORTE_PARA_ILHA"] = "Телепорт на остров",
            ["TELEPORTA_PARA_A_ILHA_SELECIONADA"] = "Телепортироваться на выбранный остров.",
            ["STARTER_ISLAND"] = "Starter Island",
            ["FOREST_ISLAND"] = "Forest Island",
            ["DESERT_ISLAND"] = "Desert Island",
            ["SNOW_ISLAND"] = "Snow Island",
            ["VOLCANO_ISLAND"] = "Volcano Island",
            ["SKY_ISLAND"] = "Sky Island",
            ["MISCELLANEOUS"] = "Miscellaneous",
            ["FUNCOES_DIVERSAS_DO_ROYAL_HUB"] = "Различные функции Royal Hub.",
            ["REENTRA_NA_PARTIDA_ATUAL"] = "Переподключиться к текущему матчу.",
            ["ENTRA_EM_OUTRO_SERVIDOR_DA_PARTIDA_ATUAL"] = "Присоединиться к другому серверу текущего матча.",
            ["REDEEM_CODES"] = "Redeem Codes",
            ["RESGATA_CODIGOS_AUTOMATICAMENTE"] = "Автоматически активировать коды.",
            ["COLLECT_REWARDS"] = "Collect Rewards",
            ["COLETA_RECOMPENSAS_DIARIAS_AUTOMATICAMEN"] = "Автоматически собирать ежедневные награды.",
            ["FUNCOES_EXPLOITS_DO_ROYAL_HUB_PODE_NAO_F"] = "Эксплойт функции Royal Hub. (может не работать)",
            ["SELECIONE_JOGADOR"] = "Выбрать игрока",
            ["EM_MANUTENCAO"] = "На обслуживании.",
            ["FLING_POWER"] = "Fling Power",
            ["LOOP_FLING"] = "Loop Fling",
            ["SELECIONE_UM_ALVO"] = "Выберите цель!",
            ["FLING_PLAYER"] = "Fling Player",
            ["FAZ_O_JOGADOR_SELECIONADO_VOAR_PELO_MAPA"] = "Заставляет выбранного игрока летать по карте.",
            ["FLING"] = "Fling",
            ["ARREMESSADO"] = "Запущен:",
            ["SELECIONE_UM_ALVO_PRIMEIRO"] = "Сначала выберите цель!",
            ["SPYCHAT"] = "SpyChat",
            ["ESPIONA_TODOS_CHATS_PRIVADOSDMS"] = "Шпионит за ВСЕМИ личными чатами/ЛС.",
            ["FUN"] = "Fun",
            ["FUNCOES_DIVERTIDAS_DO_ROYAL_HUB"] = "Веселые функции Royal Hub.",
            ["FAZ_O_PERSONAGEM_GIRAR_INFINITAMENTE"] = "Заставляет персонажа вращаться бесконечно.",
            ["ATIVAR_ORBIT"] = "Включить Orbit",
            ["VELOCIDADE_ROTACAO"] = "Скорость Вращения",
            ["IDS_TROLL_PRONTOS"] = "Готовые Troll ID",
            ["EM_MANUTENCAO_2"] = "На обслуживании",
            ["TROLL_SELECIONADO"] = "Выбранный Troll",
            ["CARREGADO"] = "Загружено:",
            ["VOLUME"] = "Громкость",
            ["TOCAR_GLOBAL"] = "Воспроизвести глобально",
            ["SELECIONE_EMOTE"] = "Выбрать эмоцию",
            ["EMOTES_DISPONIVEIS_MESMO_SEM_TER_NA_CONT"] = "Доступные эмоции (даже без наличия в аккаунте).",
            ["LOOP_EMOTE"] = "Loop эмоции",
            ["FAZ_O_EMOTE_REPETIR_AUTOMATICAMENTE"] = "Заставляет эмоцию повторяться автоматически.",
            ["EMOTE"] = "Эмоция",
            ["LOOP"] = "Loop",
            ["USAR_EMOTE"] = "Использовать эмоцию",
            ["EXECUTA_O_EMOTE_SELECIONADO"] = "Выполняет выбранную эмоцию.",
            ["SELECIONE_UM_EMOTE_PRIMEIRO"] = "Сначала выберите эмоцию!",
            ["FALHA_AO_CARREGAR"] = "Ошибка загрузки",
            ["TOCANDO"] = "Воспроизводится",
            ["PARAR_EMOTE"] = "Остановить эмоцию",
            ["INTERROMPE_O_EMOTE_ATUAL"] = "Останавливает текущую эмоцию.",
            ["EMOTE_E_LOOP_PARADOS"] = "Эмоция и loop остановлены!",
            ["BROOKHAVEN"] = "BrookHaven",
            ["FAELZIN_HUB"] = "FAELZIN HUB",
            ["BRUTON_HUB"] = "BRUTON HUB",
            ["CARTOLA_HUB"] = "CARTOLA HUB",
            ["PILOT_HUB"] = "PILOT HUB",
            ["SALVATORE"] = "SALVATORE",
            ["SANDER_XY"] = "SANDER XY",
            ["HX_HEXAGON"] = "HX HEXAGON",
            ["COVET_HUB"] = "COVET HUB",
            ["LOBO_HUB"] = "LOBO HUB",
            ["FORBID_SPAMMER"] = "FORBID SPAMMER",
            ["SPECTRA_HUB"] = "SPECTRA HUB",
            ["CHAD_HUB"] = "CHAD HUB",
            ["MAX_HUB"] = "MAX HUB",
            ["CHAD_HUB_V2"] = "CHAD HUB V2",
            ["PHANTOM_CLIENT"] = "PHANTOM CLIENT",
            ["LYRA_HUB"] = "LYRA HUB",
            ["SANT_HUB"] = "SANT HUB",
            ["KINGLEGACY"] = "King-Legacy",
            ["ZEEHUB_UPD_9"] = "ZEE-HUB UPD 9",
            ["UNIVERSAIS"] = "Универсальные",
            ["DEXEXPLORER"] = "DEX-EXPLORER",
            ["TCA_GUI"] = "TCA GUI",
            ["INFINITE_YIELD"] = "INFINITE YIELD",
            ["INFORMACOES"] = "Информация",
            ["EODRAXKK"] = "Eodraxkk",
            ["DESENVOLVEDOR_PRINCIPAL_DO_ROYAL_HUB_FOC"] = "Главный разработчик Royal Hub, специализируется на программировании и безопасности.",
            ["EINZBERN"] = "Einzbern",
            ["CODESENVOLVEDOR_DO_ROYAL_HUB_FOCADO_EM_D"] = "Со-разработчик Royal Hub, специализируется на дизайне и идеях функций.",
            ["LINK_DO_DISCORD"] = "Ссылка на Discord",
            ["CLIQUE_PARA_COPIAR_O_LINK"] = "Нажмите, чтобы скопировать ссылку",
            ["CLIPBOARD"] = "Буфер обмена",
            ["LINK_DO_DISCORD_COPIADO_PARA_A_AREA_DE_T"] = "Ссылка на Discord скопирована в буфер обмена!",
            ["SOBRE_O_ROYAL_HUB"] = "О Royal Hub",
        },
    }
})

-------------------------------* NotifySound *-------------------------------
local NotifySound = Instance.new("Sound")
NotifySound.SoundId = "rbxassetid://6518811702"
NotifySound.Volume = 1.0
NotifySound.Parent = game:GetService("SoundService")
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
            Title = "loc:AVISO",
            Content = '<font color="#FF0000">POR FAVOR, DEIXE O JOGO CARREGAR, APERTE EM JOGAR ASSIM QUE POSSIVEL!</font>',
        })
        print("[RoyalHub] Detectado Brookhaven (PlaceId " .. placeId .. ") - Aplicando RP custom")
        task.wait(8)
        SetRPNameAndBio()
    else
        print("[RoyalHub] Não é Brookhaven (PlaceId " .. placeId .. ") - Pulando RP custom e indo para load do menu")
    end
end

task.wait(1) 
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
            Title = "loc:ERRO",
            Content = "loc:JOGADOR_NAO_ENCONTRADO_OU_SEM_PERSONAGEM",
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
                Title = "loc:LOOP_TP",
                Content = "loc:ALVO_SUMIU_OU_MORREU_LOOP_PARADO",
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
                Title = "loc:LOOP_TP",
                Content = "loc:SELECIONE_UM_JOGADOR_NO_DROPDOWN_PRIMEIR",
                Duration = 4,
                Icon = "alert-circle"
            })
            LoopTPEnabled = false  -- Desliga se não tiver alvo
            return
        end
        
        WindUI:Notify({
            Title = "loc:LOOP_TP",
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
            Title = "loc:LOOP_TP",
            Content = "loc:LOOP_DESATIVADO",
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
            --     Title = "loc:ESP_ATIVADO",
            --     Icon = "Crosshair",
            -- })
        end
    end)

    charRemovingConn = player.CharacterRemoving:Connect(function()
        removeESP(player)
        -- WindUI:Notify({
        --     Title = "loc:ESP_DESATIVADO",
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

task.spawn(function()
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
            Title = "loc:REJOIN",
            Content = "loc:NAO_FOI_POSSIVEL_PEGAR_O_JOBID_ATUAL_TEN",
            Duration = 4,
            Icon = "alert-circle"
        })
        return
    end
    
    WindUI:Notify({
        Title = "loc:REJOIN",
        Content = "loc:VOLTANDO_PRO_MESMO_SERVIDOR",
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
        Title = "loc:SERVER_HOP",
        Content = "loc:BUSCANDO_SERVIDORES_AGUARDE_510S",
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
            WindUI:Notify({Title = "loc:ERRO_HOP", Content = "Falha no HttpGet: " .. tostring(response), Duration = 5, Icon = "x"})
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
        WindUI:Notify({Title = "loc:SEM_SERVIDORES", Content = "loc:NENHUM_SERVER_DISPONIVEL_AGORA_TENTE_DE_", Duration = 5, Icon = "alert-circle"})
        return
    end
    
    local randomServer = servers[math.random(1, #servers)]
    AlreadyJoined[randomServer] = true
    
    WindUI:Notify({Title = "loc:HOP", Content = "Teleportando pro server: " .. randomServer, Duration = 3, Icon = "server"})
    
    local success, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(placeId, randomServer, LocalPlayer)
    end)
    
    if not success then
        WindUI:Notify({Title = "loc:TELEPORT_FALHOU", Content = "Erro: " .. tostring(err) .. ". Verifique executor/anti-cheat.", Duration = 5, Icon = "x"})
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
            WindUI:Notify({Title = "loc:SPIN", Content = "loc:GIRANDO_DESATIVE_PRA_PARAR", Duration = 3, Icon = "rotate-cw"})
        else
            WindUI:Notify({Title = "loc:ERRO_SPIN", Content = "loc:PERSONAGEM_NAO_CARREGADO", Duration = 2, Icon = "x"})
            toggleSpin(false)
        end
    else
        if SpinConnection then
            SpinConnection:Disconnect()
            SpinConnection = nil
        end
        WindUI:Notify({Title = "loc:SPIN", Content = "loc:PAROU_DE_GIRAR", Duration = 2, Icon = "x"})
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
        WindUI:Notify({Title = "loc:FLY", Content = "loc:PERSONAGEM_NAO_CARREGADO", Duration = 3, Icon = "x"})
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

        WindUI:Notify({Title = "loc:FLY", Content = "loc:VOO_ATIVADO", Duration = 1, Icon = "plane"})
    else
        
        task.spawn(function()
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

            WindUI:Notify({Title = "loc:FLY", Content = "loc:DESATIVADO", Duration = 1, Icon = "check"})
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
            Title = "loc:FAKE_TP",
            Content = "loc:ATIVADO_DODGE_ANTIAIM_LIGADO",
            Duration = 3,
            Icon = "ghost"
        })
    else
        if FakeTPConnection then
            FakeTPConnection:Disconnect()
            FakeTPConnection = nil
        end
        WindUI:Notify({
            Title = "loc:FAKE_TP",
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
                Title = "loc:ORBIT",
                Content = "loc:ALVO_SUMIU_OU_MORREU_ORBIT_PARADO",
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
                Title = "loc:ORBIT",
                Content = "loc:SELECIONE_UM_JOGADOR_NO_DROPDOWN_PRIMEIR",
                Duration = 4,
                Icon = "alert-circle"
            })
            OrbitEnabled = false
            return
        end
        
        WindUI:Notify({
            Title = "loc:ORBIT",
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
            Title = "loc:ORBIT",
            Content = "loc:ORBIT_DESATIVADO",
            Duration = 3,
            Icon = "x"
        })
    end
end

local function setOrbitSpeed(value)
    OrbitSpeed = value
    if OrbitEnabled then
        WindUI:Notify({
            Title = "loc:ORBIT",
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
            Title = "loc:NOCLIP",
            Content = "loc:NOCLIP_ATIVADO",
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
            Title = "loc:NOCLIP",
            Content = "loc:NOCLIP_DESATIVADO",
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
  Accent = Color3.fromHex("#3a3a3a"),
  Background = Color3.fromHex("#000000"),
  Outline = Color3.fromHex("#b3b3b3"),
  Text = Color3.fromHex("#e0e0e0"),
  Placeholder = Color3.fromHex("#7a7a7a"),
  Button = Color3.fromHex("#5c5c5c"),
  Icon = Color3.fromHex("#444444"),
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

------------------------------* Notificação *-------------------------------

 WindUI:Notify({
    Title = "loc:ROYAL_HUB_AVISO",
    Content = "loc:SCRIPT_EM_DESENVOLVIMENTO_FUNCOES_PODEM_",
    Duration = 6, -- 3 seconds
    Icon = "bug",
})
task.wait(1)

WindUI:Notify({
	Title = "loc:VERIFICACAO",
	Content = "loc:VERIFICANDO_USUARIO",
	Duration = 3,
	Icon = "user"
})
task.wait(2)

WindUI:Notify({
	Title = "loc:REGISTER",
	Content = "Usuario verificado com sucesso!, será necessario uma Key para usar a script caso não tenha usado alguma anteriormente.",
	Duration = 3,
	Ico = "bug"
})
task.wait(2)

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
        Title = "loc:OPEN_ROYAL_HUB", 
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
                    Title = "loc:COPIAR_USERID",
                    Icon = "copy",
                    Variant = "secondary",
                    Callback = function()
                        setclipboard(tostring(player.UserId))
                        WindUI:Notify({
                            Title = "loc:COPIADO",
                            Content = "loc:USERID_COPIADO_PARA_A_AREA_DE_TRANSFEREN",
                            Duration = 2,
                            Icon = "copy",
                        })
                    end
                },
                {
                    Title = "loc:FECHAR",
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
    Title = "loc:KEYBIND",
    Content = "loc:APERTE_A_TECLA_H_PARA_ESCONDER_MOSTRAR_O",
    Duration = 4,
    Icon = "user"
})
-------------------------------* PRINT CONSOLE LOADED *-------------------------------
print("========================= Royal Hub carregado com sucesso! =========================")
print("E ali diante dos meus olhos estava um cavalo branco e seu cavaleiro segurou uma reverência. Ele recebeu uma coroa e partiu, conquistando e conquistar... E saiu outro cavalo, todo vermelho. Ao seu cavaleiro recebeu o poder de tirar a paz da terra e fazer os homens massacrarem um ao outro; e ele recebeu uma grande espada... E ali, enquanto eu olhava, estava um cavalo preto; e seu cavaleiro segurava em sua mão um par de balanças... E lá, enquanto eu olhava, estava outro cavalo, doente e pálido; e o nome do seu cavaleiro era Morte, e Hades veio logo atrás. A ele foi dado poder sobre um quarto da terra, com o direito de matar pela espada e pela fome, pela peste e feras selvagens.")
print(" ========================= Apocalipse 6:1-6 =========================")

-------------------------------* Tags *-------------------------------

Window:Tag({
    Title = "loc:V144",
    Icon = "github",
    Color = Color3.fromHex("#f0d01a"),
    Radius = 8,
})

Window:Tag({
	Title = "loc:SECURE",
	Icon = "solar:shield-check-bold",
	Color = Color3.fromHex("#30ff6a"),
	Radius = 8,
})
-------------------------------* FPS TAG *-------------------------------
local FPSTag = Window:Tag({
    Title = "loc:FPS_0",
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
    Title = "loc:PING_0MS",
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
    Title = "loc:INICIO",
    Icon = "solar:home-2-bold",
    Desc = "loc:FUNCOES_PRINCIPAIS_DO_ROYAL_HUB",
    IconColor = DarkGray,
    IconShape = "Square",
   -- ShowTabTitle = true,
    Border = true, 
    Locked = false,
})


local TabPersonagem = Window:Tab({
	Title = "loc:PERSONAGEM",
	Icon = "solar:user-bold",
    Desc = "loc:MODIFICACOES_NO_PERSONAGEM",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
})

local TabFarm = Window:Tab({
	Title = "loc:FARM",
	Icon = "solar:black-hole-bold",
    Desc = "loc:FUNCOES_DE_FARM_AUTOMATICO",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabShopping = Window:Tab({
	Title = "loc:LOJA",
	Icon = "solar:cart-large-bold",
    Desc = "loc:COMPRE_ITENS_AUTOMATICAMENTE",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabTeleport = Window:Tab({
	Title = "loc:TP_AND_WBHK",
	Icon = "solar:cloud-bold",
    Desc = "loc:TELEPORTE_E_WEBHOOK",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabMisc = Window:Tab({ 
	Title = "loc:MISC",
    Desc = "loc:FUNCOES_DIVERSAS",
	Icon = "box",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,

})

local TabExploits = Window:Tab({
    Title = "loc:EXPLOITS",
    Desc = "loc:SCRIPTS_QUE_PODEM_SER_UTEIS",
    Icon = "solar:bolt-bold",
    IconColor = DarkGray,
    IconShape = "Square",
    Locked = false,
})

local TabSettings = Window:Tab({
	Title = "loc:CONFIGURACOES",
	Icon = "solar:settings-minimalistic-bold",
    Desc = "loc:CONFIGURACOES_DO_ROYAL_HUB",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
})

local TabInfo = Window:Tab({
	Title = "loc:INFO",
	Icon = "solar:info-circle-bold",
    Desc = "loc:INFORMACOES_SOBRE_O_ROYAL_HUB_E_DESENVOL",
    IconColor = DarkGray,
    IconShape = "Square",
	Locked = false,
    Border = true,
})


TabHome:Select()
-------------------------------* TabHome * -------------------------

local SectionAimbot = TabHome:Section({
	Title = "loc:AIMBOT",
	Desc = "loc:FUNCAO_DE_AIMBOT_PARA_FACILITAR_SEUS_TIR",
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
    
GrupoAimbot:Toggle({ Title = "loc:AIMBOT_COMUM", Default = false, Locked = false, Callback = function(enabled) AimbotEnabled.normal = enabled toggleAimbot("normal") end })

GrupoAimbot:Space()

GrupoAimbot:Toggle({ Title = "loc:AIMBOT_RAGE", Default = false, Locked = false, Callback = function(enabled) AimbotEnabled.rage = enabled toggleAimbot("rage") end })

SectionAimbot:Space()

SectionAimbot:Toggle({ Title = "loc:IGNORAR_ALIADOS_TEAM_CHECK", Default = true, Callback = function(enabled) UseTeamCheck = enabled WindUI:Notify({Title = "loc:TEAM_CHECK", Content = enabled and "Ligado" or "Desligado", Duration = 2}) end })

SectionAimbot:Toggle({ Title = "loc:WALL_CHECK_IGNORAR_PAREDES", Default = true, Callback = function(enabled) UseWallCheck = enabled WindUI:Notify({Title = "loc:WALL_CHECK", Content = enabled and "Ligado (só mira visível)" or "Desligado (mira através)", Duration = 2}) end })

SectionAimbot:Space({ Columns = 1 })

local ToggleESP = SectionAimbot:Toggle({
    Title = "loc:ESP",
    Desc = "loc:PLAYERS_FICAM_VISIVEIS_ATRAS_DE_PAREDES_",
    Icon = "solar:eye-bold",
    --Type = "Checkbox",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO",
    Value = false, 
    Callback = function(state)
		espEnabled = state
    if state then
        for _, player in ipairs(S.Players:GetPlayers()) do
            createESP(player)
        end
        WindUI:Notify({Title = "loc:ESP_ATIVADO_2", Content = "loc:PLAYERS_DESTACADOS", Duration = 3, Icon = "eye"})
    else
        removeAllESP()  
        WindUI:Notify({Title = "loc:ESP_DESATIVADO_2", Content = "loc:REMOVIDO", Duration = 2, Icon = "x"})
    end
end
})

SectionAimbot:Space({ Columns = 1 })

--! Blocqueado até o velocity atualizar e voltar a injetar no roblox, fiz alterações mas ainda não consegui testar.
local ToggleEsp2 = SectionAimbot:Toggle({
    Title = "loc:ESP_20_TWILIGHT",
    Desc = "loc:ESP_COM_HEALTH_BAR_BOX_E_NOME_POWERED_BY",
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
                Title = "loc:ESP_20",
                Content = state and "Twilight ESP ativado!" or "Desativado.",
                Duration = 2,
                Icon = state and "eye" or "x"
            })
    end
})
-------------------------------------------------------------------------------------------------------------------!

SectionAimbot:Space({ Columns = 1 })

SectionAimbot:Toggle({
    Title = "loc:FAKE_TP_DODGE",
    Default = false,
    Callback = function(enabled)
        toggleFakeTP(enabled)
    end
})

SectionAimbot:Slider({
    Title = "loc:DELAY_FAKE_TP",
    Desc = "loc:TEMPO_ENTRE_FAKES_MENOR_MAIS_RAPIDO",
    Step = 0.1,
    Value = { Min = 0.1, Max = 1, Default = 0.2 },
    Callback = function(value)
        FakeTPDelay = value
    end
})

SectionAimbot:Slider({
    Title = "loc:DISTANCIA_FAKE_TP",
    Desc = "loc:QUAO_LONGE_O_FAKE_TP_VAI_EM_STUDS",
    Step = 1,
    Value = { Min = 1, Max = 10, Default = 3 },
    Callback = function(value)
        FakeTPDistance = value
    end
})

TabHome:Space({ Columns = 2 })

-------------------------------* Section Visuals *-------------------------------
local SectionView = TabHome:Section({
    Title = "loc:VISUAL",
    Desc = "loc:MODIFICACOES_VISUAIS_NO_JOGO",
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
    Title = "loc:SELECIONE_O_PLAYER",
    Desc = "loc:SELECIONA_O_PLAYER_PARA_APLICAR_AS_MODIF",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Values = playerValues,
    Value = playerValues[0],
    Callback = function(option)
        SelectedPlayerToView = Players:FindFirstChild(option.Title)
        print("Selecionado:", option.Title)
    end
})

local ViewPlayerToggle = SectionView:Toggle({
    Title = "loc:VISUALIZAR_PLAYER",
    Desc = "loc:ATIVA_AS_MODIFICACOES_VISUAIS_NO_PLAYER_",
    Icon = "solar:eye-bold",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
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
    Title = "loc:NOCLIP",
    Desc = "loc:PERMITE_ATRAVESSAR_PAREDES_E_OBJETOS",
    Icon = "solar:ghost-bold",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Value = false, 
    Callback = function(state)
        toggleNoClip(state)
    end
})


-------------------------------* Auto Farm Level *-------------------------------

local SectionAutofarmLevel = TabFarm:Section({
    Icon = "solar:info-circle-bold",
    Title = "loc:AUTO_FARM_LEVEL",
    Desc = "loc:FARMA_AUTOMATICAMENTE_SEU_LEVEL_SE_NAO_E",
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
    Title = "loc:ATIVAR_AUTO_FARM_LEVEL",
    Desc = "loc:ATIVA_O_FARM_AUTOMATICO_DE_LEVEL",
    Icon = "",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Value = false, 
    Callback = function(state)
        if state then
            WindUI:Notify({
                Title = "loc:AUTO_FARM_LEVEL",
                Content = "loc:AUTO_FARM_LEVEL_ATIVADO",
                Duration = 3,
                Icon = "solar:check-circle-bold"
            })
        else
            WindUI:Notify({
                Title = "loc:AUTO_FARM_LEVEL",
                Content = "loc:AUTO_FARM_LEVEL_DESATIVADO",
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
    Title = "loc:AUTO_FARM_MATERIALS",
    Desc = "loc:FARMA_AUTOMATICAMENTE_MATERIAIS_DO_JOGO",
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
    Title = "loc:ATIVAR_AUTO_FARM_MATERIALS",
    Desc = "loc:ATIVA_O_FARM_AUTOMATICO_DE_MATERIAIS",
    Icon = "solar:check-circle-bold",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Value = false, 
    Callback = function(state)
        if state then
            WindUI:Notify({
                Title = "loc:AUTO_FARM_MATERIALS",
                Content = "loc:AUTO_FARM_MATERIALS_ATIVADO",
                Duration = 3,
                Icon = "solar:check-circle-bold"
            })
        else
            WindUI:Notify({
                Title = "loc:AUTO_FARM_MATERIALS",
                Content = "loc:AUTO_FARM_MATERIALS_DESATIVADO",
                Duration = 3,
                Icon = "x"
            })
        end
        print("Auto Farm Materials:", state)
    end
})
SectionAutoF:Space({ Columns = 1 })

local MaterialSelect = SectionAutoF:Dropdown({
    Title = "loc:SELECIONAR_MATERIAL",
    Desc = "loc:SELECIONA_O_MATERIAL_QUE_DESEJA_FARMAR_A",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Values = {
        { Title = "loc:MATERIAL_1" },
        { Title = "loc:MATERIAL_2" },
        { Title = "loc:MATERIAL_3" },
    },
    Value = "Material 1",
    Callback = function(option)
        print("Selecionado:", option.Title)
    end
})
-------------------------------* Auto Buy Itens ( TAB SHOPPING ) *-------------------------------
local SectionLoja = TabShopping:Section({
    Title = "loc:AUTO_BUY",
    Desc = "loc:COMPRA_ITENS_AUTOMATICAMENTE_DO_BLACKMAR",
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
    Title = "loc:SELECIONAR_ITEM",
    Desc = "loc:SELECIONA_O_ITEM_QUE_DESEJA_COMPRAR_AUTO",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Values = {
        { Title = "loc:ITEM_1" },
        { Title = "loc:ITEM_2" },
        { Title = "loc:ITEM_3" },
    },
    Value = "Item 1",
    Callback = function(option)
        print("Selecionado:", option.Title)
    end
})

local AutoBuyToggle = SectionLoja:Toggle({
    Title = "loc:ATIVAR_AUTO_BUY",
    Desc = "loc:ATIVA_A_COMPRA_AUTOMATICA_DO_ITEM_SELECI",
    Icon = "solar:cart-large-bold",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Value = false, 
    Callback = function(state)
        if state then
            WindUI:Notify({
                Title = "loc:AUTO_BUY",
                Content = "loc:AUTO_BUY_ATIVADO",
                Duration = 3,
                Icon = "solar:check-circle-bold"
            })
        else
            WindUI:Notify({
                Title = "loc:AUTO_BUY",
                Content = "loc:AUTO_BUY_DESATIVADO",
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
    Title = "loc:GENERAL_SETTINGS",
    Desc = "loc:CONFIGURACOES_DE_TEMA_KEYBIND_E_ETC", 
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
        Title = "loc:BYPASS_ANTICHEAT",
        Desc = "loc:TENTA_BURLAR_O_SISTEMA_ANTICHEAT_DO_JOGO",
        Locked = false,
         Callback = function()
            ButtonBypass:Highlight()
			task.wait(2)
            NotifySound:Play()
            WindUI:Notify({
                Title = "loc:AVISO_2",
                Content = "loc:BYPASS_ATIVADO_COM_SUCESSO_FUNCIONALIDAD",
                Duration = 3,
                Icon = "shield-check"
            })
            print("Bypass Anti-Cheat ativado")
        end
})

local DropdownTemas = SectionConfig:Dropdown({
    Title = "loc:TEMAS",
    Desc = "loc:ALTERA_O_TEMA_DO_ROYAL_HUB",
    Flag = "tema_selecionado",
    Values = {
        {
            Title = "loc:DARK_AMOLED_DEFAULT",
        },
        {
            Title = "loc:HUTAO_BY_EINZBERN",
        },
        {
            Title = "loc:REDX_HUB",
        },
        {
            Title = "loc:WHITE",
        },
        {
            Title = "loc:MAIN_THEME",
        },
        {
            Title = "loc:CYBERPUNK",
        },
        {
            Title = "loc:SOLAR_THEME",
        },
        {
            Title = "loc:MIDNIGHT",
        },
        {
            Title = "loc:CRIMSON",
        },
        {
            Title = "loc:SNOW",
        },
        {
            Title = "loc:TUNDRA",
        },
        {
            Title = "loc:SAMURAI_DARK",
        },
        {
            Title = "loc:MONOKAI",
        },
        {
            Title = "loc:MOONLIGHT",
        },
        {
            Title = "loc:LUNAR",
        },
        {
            Title = "loc:INDIGO"
        },
        {
            Title = "loc:STARTORCH"
        },
    },
    Value = "Dark Amoled ( Default )",
    Callback = function(option)
        WindUI:SetTheme(option.Title)
    end
})

local Keybind = SectionConfig:Keybind({
    Title = "loc:TOGGLE_UI",
    Desc = "loc:ALTERA_A_TECLA_QUE_MOSTRA_ESCONDE_O_MENU",
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
    Title = "loc:SALVAR_CONFIG",
    Desc = "loc:SALVA_TEMA_SELECIONADO_E_ETC", 
    Icon = "save", 
    --Color = "Green", 
    Callback = function()
        ConfigMenu:Save()
        NotifySound:Play()
        WindUI:Notify({
            Title = "loc:CONFIGURACAO_SALVA",
            Content = "loc:SUA_CONFIGURACAO_FOI_SALVA_COM_SUCESSO",
            Duration = 3,
            Icon = "save"
        })
        print("Configuration saved.")
    end
})

local Load = SectionConfig:Button({
    Title = "loc:CARREGAR_CONFIG",
    Desc = "loc:CARREGA_A_CONFIGURACAO_SALVA_ANTERIORMEN",
    Icon = "save",
    Callback = function()
        ConfigMenu:Load()
        NotifySound:Play()
        WindUI:Notify({
            Title = "loc:CONFIGURACAO_CARREGADA",
            Content = "loc:SUA_CONFIGURACAO_FOI_CARREGADA_COM_SUCES",
            Duration = 3,
            Icon = "save"
        })
    end
})

SectionConfig:Space({ Columns = 1 })

SectionConfig:Button({
    Title = "loc:BACKDOOR_SCANNER",
    Desc = "loc:ESCANEIA_O_JOGO_EM_BUSCA_DE_BACKDOORS_CO",
    Icon = "door-open",
    Callback = function()
        loadstring(game:HttpGet("https://spawnix.github.io/DevTools.rbxm/Loader/index.lua", true))() 

    end
})

SectionConfig:Space({ Columns = 1 })

local DestruirHub = SectionConfig:Button({
	Title = "loc:EJETAR_SCRIPT",
	Desc = "loc:EJETA_A_SCRIPT_DO_JOGO",
	Icon = "",
	Color = "Red",
	Callback = function()
		local Dialog = Window:Dialog({
    Icon = "alert-circle",
    Title = "loc:CONFIRM_DELETE",
    IconThemed = true,
    Content = "loc:ESTA_ACAO_NAO_PODE_SER_DESFEITA",
    Buttons = {
        {
            Title = "loc:CANCELAR",
            Icon = "x",
            Variant = "secondary",
            Callback = function()
				Destroy(Window)
                print("Ejetado")
            end
        },
        {
            Title = "loc:EJETAR",
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
    Title = "loc:KEYBINDS",
    Desc = "loc:AQUI_VOCE_PODE_ALTERAR_OS_KEYBINDS_DAS_F",
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
    Title = "loc:AIMBOT_COMUM_K",
    Flag = "aimbot_comum_keybind",
    Value = "K", 
    Callback = function(key)
        AimbotEnabled.normal = not AimbotEnabled.normal
        toggleAimbot("normal")
        WindUI:Notify({
            Title = "loc:AIMBOT_COMUM_2",
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
    Title = "loc:AIMBOT_RAGE_L",
    Flag = "aimbot_rage_keybind",
    Value = "L",
    Callback = function(key)
        AimbotEnabled.rage = not AimbotEnabled.rage
        toggleAimbot("rage")
        WindUI:Notify({
            Title = "loc:AIMBOT_RAGE_2",
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
    Title = "loc:ESP_E",
    Flag = "esp_keybind",
    Value = "E",
    Callback = function(key)
        espEnabled = not espEnabled
        if espEnabled then
            for _, player in ipairs(S.Players:GetPlayers()) do
                createESP(player)
            end
            WindUI:Notify({Title = "loc:ESP_2", Content = "loc:ATIVADO", Duration = 2, Icon = "eye"})
        else
            removeAllESP()
           -- WindUI:Notify({Title = "loc:ESP_2", Content = "loc:DESATIVADO_2", Duration = 2, Icon = "x"})
        end
        print("ESP toggled via keybind:", key)
    end
})

SectionKeyBinds:Space({ Columns = 1 })

-- Keybind pro Fly
SectionKeyBinds:Keybind({
    Title = "loc:FLY_F",
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
    Title = "loc:SPIN_G",
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
    Title = "loc:LOOP_TP_T",
    Flag = "looptp_keybind",
    Value = "T",
    Callback = function(key)
        toggleLoopTP(not LoopTPEnabled)
        print("Loop TP toggled via keybind:", key)
    end
})

TabSettings:Space({ Columns = 2 })

local SectionConfigFuncs = TabSettings:Section({
    Title = "loc:CONFIGURACOES_DE_FUNCOES",
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
    Title = "loc:MODO_ANONYMOUS",
    Desc = "loc:ATIVA_O_MODO_ANONYMOUS_QUE_ESCONDE_SEU_N",
    Icon = "user",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Value = false,
    Callback = function(state)
        Window.User:SetAnonymous(state)
    end
})

SectionConfigFuncs:Space({ Columns = 1 })

SectionConfigFuncs:Button({
    Title = "🌐 Idioma",
    Icon = "solar:language-bold",
    Callback = function()
        Window:Dialog({
            Title = "Selecionar Idioma",
            Icon = "solar:language-bold",
            Content = "Escolha o idioma do Royal Hub:",
            Buttons = {
                    { Title = "🇧🇷 Português", Variant = "secondary", Callback = function() setLang("pt-br") end },
                    { Title = "🇺🇸 English",   Variant = "secondary", Callback = function() setLang("en") end },
                    { Title = "🇪🇸 Español",   Variant = "secondary", Callback = function() setLang("es") end },
                    { Title = "🇷🇺 Русский",   Variant = "secondary", Callback = function() setLang("ru") end },
            }
        })
    end
})

-------------------------------* Buttons TabPersonagem *------------------------
TabPersonagem:Section({
    Title = "loc:MOVIMENTO",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

local SliderVelocidade = TabPersonagem:Slider({
    Title = "loc:SPEED",
    Desc = "loc:ALTERA_VELOCIDADE_DO_JOGADOR",
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
	Title = "loc:JUMP",
	Desc = "loc:AUMENTA_A_FORCA_DO_PULO",
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
    Title = "loc:FLY",
    Desc = "loc:ATIVA_O_MODO_VOO",
    Icon = "solar:rocket-bold",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Value = false,
    Callback = function(state)
        toggleFly(state)
    end
})

local SliderFlySpeed = TabPersonagem:Slider({
    Title = "loc:VELOCIDADE_DO_FLY",
    Desc = "loc:AJUSTE_A_VELOCIDADE_DO_VOO_QUANTO_MAIOR_",
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
    Title = "loc:GRAVIDADE",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

local SliderGravity = TabPersonagem:Slider({
    Title = "loc:GRAVITY",
    Desc = "loc:ALTERA_A_GRAVIDADE_DO_JOGO",
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
        Title = "loc:RESET_GRAVITY",
        Desc = "loc:RESETA_A_GRAVIDADE_PARA_O_VALOR_PADRAO_1",
        Locked = false,
		LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
        Callback = function()
            setGravity(196.2)
            ResetGravity:Highlight()
            WindUI:Notify({
                Title = "loc:GRAVIDADE_RESETADA",
                Content = "loc:A_GRAVIDADE_FOI_RESETADA_PARA_O_VALOR_PA",
                Duration = 3,
                Icon = "shield-check"
            })
            print("Gravidade resetada para 196.2")
    end
})


TabPersonagem:Space({ Columns = 2 })

TabPersonagem:Section({
    Title = "loc:OUTROS",
    TextSize = 20,
    FontWeight = Enum.FontWeight.SemiBold,
})

-------------------------------* Buttons TabTeleport *-------------------------------

local SectionTP = TabTeleport:Section({
    Title = "Teleport ",
    Desc = "loc:PERMITE_TELEPORTAR_ATE_OUTROS_JOGADORES", 
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
	Title = "loc:TELEPORTAR_ATE_JOGADOR",
    Desc = "loc:TELEPORTA_ATE_O_JOGADOR_SELECIONADO",
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
	Title = "loc:LOOP_TP",
	Desc = "loc:TELEPORTA_INFINITAMENTE_NO_JOGADO_QUE_FO",
	Icon = "",
	Locked = false,
	LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
	Value = false,
	Callback = function(state)
        toggleLoopTP(state)
		print("Em desenvolvimento.")	
	end
})

SectionTP:Space({ Columns = 1 })

local SliderLoopDelay = SectionTP:Slider({
    Title = "loc:DELAY_ENTRE_TPS",
    Desc = "loc:TEMPO_EM_SEGUNDOS_ENTRE_CADA_TELEPORTE_M",
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
            Title = "loc:LOOP_TP_DELAY",
            Content = "Atualizado para " .. value .. " segundos",
            Duration = 2,
            Icon = "timer"
        })
    end
})

TabTeleport:Space({ Columns = 2 })

local SectionTeleportToIsland = TabTeleport:Section({
    Title = "loc:TELEPORT_TO_ISLANDS",
    Desc = "loc:TELEPORTA_PARA_AS_ILHAS_PRINCIPAIS_DO_JO", 
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
    Title = "loc:TELEPORTE_PARA_ILHA",
    Desc = "loc:TELEPORTA_PARA_A_ILHA_SELECIONADA",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Values = {
        { Title = "loc:STARTER_ISLAND" },
        { Title = "loc:FOREST_ISLAND" },
        { Title = "loc:DESERT_ISLAND" },
        { Title = "loc:SNOW_ISLAND" },
        { Title = "loc:VOLCANO_ISLAND" },
        { Title = "loc:SKY_ISLAND" },
    },
    Value = "Starter Island",
    Callback = function(option)
        print("Selecionado:", option.Title)
    end
})


-------------------------------* TabMisc *-------------------------------

local SectionMisc = TabMisc:Section({
    Title = "loc:MISCELLANEOUS",
    Desc = "loc:FUNCOES_DIVERSAS_DO_ROYAL_HUB", 
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
    Title = "loc:REJOIN",
    Desc = "loc:REENTRA_NA_PARTIDA_ATUAL",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Callback = function()
        RejoinServer()
        print("Rejoining...")
    end
})

SectionMisc:Space({ Columns = 1 })

local ButtonServerHop = SectionMisc:Button({
    Title = "loc:SERVER_HOP",
    Desc = "loc:ENTRA_EM_OUTRO_SERVIDOR_DA_PARTIDA_ATUAL",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Callback = function()
        ServerHop()
        print("Server Hopping...")
    end
})

SectionMisc:Space({ Columns = 1 })

local ButtonRedeemCodes = SectionMisc:Button({
    Title = "loc:REDEEM_CODES",
    Desc = "loc:RESGATA_CODIGOS_AUTOMATICAMENTE",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Callback = function()
        print("Redeeming Codes...")
    end
})

SectionMisc:Space({ Columns = 1 })

local ButtonCollectRewards = SectionMisc:Button({
    Title = "loc:COLLECT_REWARDS",
    Desc = "loc:COLETA_RECOMPENSAS_DIARIAS_AUTOMATICAMEN",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Callback = function()
        print("Collecting Rewards...")
    end
})

TabMisc:Space({ Columns = 1 })

local SectionExploits = TabMisc:Section({
    Title = "loc:EXPLOITS",
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
    Title = "loc:SELECIONE_JOGADOR",
    Values = playerValues,
    Locked = false,
    LockedTitle = "loc:EM_MANUTENCAO",
    Multi = false,
    Default = nil,
    Callback = function(selected)
       FlingTargetPlayer = selected.Player
    end
})

local SliderFling = SectionExploits:Slider({
    Title = "loc:FLING_POWER",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
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
    Title = "loc:LOOP_FLING",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO",
    Default = false,
    Callback = function(enabled)
        LoopFlingEnabled = enabled
        if enabled then
            if not FlingTargetPlayer then
                WindUI:Notify({Title = "loc:ERRO", Content = "loc:SELECIONE_UM_ALVO", Duration = 3})
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
    Title = "loc:FLING_PLAYER",
    Locked = true,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Desc = "loc:FAZ_O_JOGADOR_SELECIONADO_VOAR_PELO_MAPA",
    Locked = false,
    LockedTitle = "loc:EM_MANUTENCAO",
    Callback = function()
        if FlingTargetPlayer then
            Fling(FlingTargetPlayer, FlingPower)
            WindUI:Notify({
                Title = "loc:FLING",
                Content = "Arremessado: " .. FlingTargetPlayer.Name,
                Duration = 3,
                Icon = "wind"
            })
        else
            WindUI:Notify({
                Title = "loc:ERRO",
                Content = "loc:SELECIONE_UM_ALVO_PRIMEIRO",
                Duration = 3,
                Icon = "alert-circle"
            })
        end
    end
})

TabMisc:Space({ Columns = 1 })

local spyToggle = SectionExploits:Toggle({
    Title = "loc:SPYCHAT",
    Desc = "loc:ESPIONA_TODOS_CHATS_PRIVADOSDMS",
    Locked = true,
    LockedTitle = "loc:EM_MANUTENCAO",
    Icon = "solar:eye-bold",
    Value = false,
    Callback = toggleSpyChat
})


local SectionFun = TabMisc:Section({
    Title = "loc:FUN",
    Desc = "loc:FUNCOES_DIVERTIDAS_DO_ROYAL_HUB", 
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
    Title = "loc:SPIN",
    Desc = "loc:FAZ_O_PERSONAGEM_GIRAR_INFINITAMENTE",
    Locked = false,
    LockedTitle = "loc:EM_DESENVOLVIMENTO_2",
    Value = false,
    Callback = function(state)
        toggleSpin(state)
        print("Spin toggled:", state)
    end
})

SectionFun:Space({ Columns = 1 })

local orbitDropdown = SectionFun:Dropdown({
    Title = "loc:SELECIONE_JOGADOR",
    Values = playerValues,  -- Use o mesmo playerValues do seu script
    Multi = false,
    Default = nil,
    Callback = function(selected)
        OrbitTargetName = selected.Title  -- Ou selected.Player.Name
    end
})

local orbitToggle = SectionFun:Toggle({
    Title = "loc:ATIVAR_ORBIT",
    Default = false,
    Callback = toggleOrbit
})


local orbitSlider = SectionFun:Slider({
    Title = "loc:VELOCIDADE_ROTACAO",
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
    Title = "loc:IDS_TROLL_PRONTOS",
    Locked = true,
    LockedTitle = "loc:EM_MANUTENCAO_2",
    Values = trollAudios,
    Multi = false,
    Default = nil,
    Callback = function(selected)
        if selected and selected.id then
            currentAudioId = selected.id
            WindUI:Notify({
                Title = "loc:TROLL_SELECIONADO",
                Content = "Carregado: " .. selected.Title .. " (ID: " .. selected.id .. ")",
                Duration = 3,
                Icon = "zap"
            })
        end
    end
})

local volumeSlider = SectionFun:Slider({
    Title = "loc:VOLUME",
    Locked = true,
    LockedTitle = "loc:EM_MANUTENCAO",
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
    Title = "loc:TOCAR_GLOBAL",
    locked = true,
    LockedTitle = "loc:EM_MANUTENCAO",
    Callback = function()
        playGlobalAudioRemote(currentAudio, currentVolume)
        game:GetService("ReplicatedStorage").Remotes:FindFirstChild("BuyMusicPass"):FireServer()  -- Tenta bypass (pode não funcionar)
    end
})

SectionFun:Space({ Columns = 1 })

local EmoteDropdown = SectionFun:Dropdown({
    Title = "loc:SELECIONE_EMOTE",
    Desc = "loc:EMOTES_DISPONIVEIS_MESMO_SEM_TER_NA_CONT",
    Values = emoteValues,
    Multi = false,
    Default = nil,
    Callback = function(selected)
        SelectedEmote = selected.Title
    end
})

local emoteLoopToggle = SectionFun:Toggle({
    Title = "loc:LOOP_EMOTE",
    Desc = "loc:FAZ_O_EMOTE_REPETIR_AUTOMATICAMENTE",
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
            Title = "loc:EMOTE",
            Content = "Loop " .. (state and "ativado!" or "desativado!"),
            Duration = 2,
            Icon = "repeat"
        })
    end
})

SectionFun:Space({ Columns = 1 })

local EmoteStart = SectionFun:Button({
    Title = "loc:USAR_EMOTE",
    Desc = "loc:EXECUTA_O_EMOTE_SELECIONADO",
    Icon = "solar:emoji-funny-square-bold",
    Callback = function()
        if not SelectedEmote then
            WindUI:Notify({
                Title = "loc:EMOTE",
                Content = "loc:SELECIONE_UM_EMOTE_PRIMEIRO",
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
                Title = "loc:EMOTE",
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
            Title = "loc:EMOTE",
            Content = "Tocando " .. SelectedEmote .. (LoopEmote and " em LOOP INFINITO!" or "!"),
            Duration = 3,
            Icon = "smile"
        })
    end
})

local emoteStopButton = SectionFun:Button({
    Title = "loc:PARAR_EMOTE",
    Desc = "loc:INTERROMPE_O_EMOTE_ATUAL",
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
            Title = "loc:EMOTE",
            Content = "loc:EMOTE_E_LOOP_PARADOS",
            Duration = 3,
            Icon = "x"
        })
    end
})

------------------------------* TabExploits *-------------------------------

local SectionExploitsTab = TabExploits:Section({
    Title = "loc:BROOKHAVEN",
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
    Title = "loc:FAELZIN_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/PhantomClientDEV/6d65c2e0f668d998b4be8dcab6d9f969/raw/6d1f08a15d890149f5c033b6f29d51eda3de7149/HalloweenV2.lua", true))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:BRUTON_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua-sources/BRUTON-HUB-/refs/heads/main/BRUTON"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:CARTOLA_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:PILOT_HUB",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/mbm9XDQG'))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:SALVATORE",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RFR-R1CH4RD/Loader/main/Salvatore.lua"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:SANDER_XY",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:HX_HEXAGON",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nxvap/hexagon/refs/heads/main/brookhaven"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:COVET_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pl4y80ytt-a11y/VoidHub/refs/heads/main/covet"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:LOBO_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/luauhubs666/lobohub/refs/heads/main/lobohub.luau"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:FORBID_SPAMMER",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/QjmKIpUW/raw"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:SPECTRA_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/assure157tv157157157-boop/Spectra-HUB-V2-/refs/heads/main/URL%20do%20scriptblox"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:CHAD_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bjair5955-wq/Chad-Hub-V2.0/refs/heads/main/obfuscated.lua%20(3).txt"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:MAX_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://scriptsneonauth.vercel.app/api/scripts/565a57db-dea3-46cf-b46d-1cfcdcbe7700/raw"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:CHAD_HUB_V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bjair5955-wq/Chad-Hub-V2.0/refs/heads/main/obfuscated.lua%20(3).txt"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:PHANTOM_CLIENT",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/phantomdevelopers078-star/125196a67d4baa872a569230471dd38b/raw/20eed7bae23eac4fddf8177ca64a3f6323313aca/PhantomClienteasy.lua"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:LYRA_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kayrus999/Lyrapainel/refs/heads/main/Lyrabrookhaven"))()
    end
})

SectionExploitsTab:Space({ Columns = 1 })

SectionExploitsTab:Button({
    Title = "loc:SANT_HUB",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Nytherune-Hub-58124"))()
    end
})

TabExploits:Space({ Columns = 2 })

local SectionExpUniv = TabExploits:Section({
    Title = "loc:KINGLEGACY",
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
    Title = "loc:ZEEHUB_UPD_9",
    Desc = "",
    Callback = function()
        loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))()
    end
})
TabExploits:Space({ Columns = 1 })


local SectionUniversal = TabExploits:Section({
    Title = "loc:UNIVERSAIS",
    Desc = "",
    Icon = "solar:bolt-bold",
    Box = true,
    BoxBorder = true,
    Opened = true,
})

SectionUniversal:Button({
     Title = "loc:DEXEXPLORER",
     Desc = "",
     Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end
})

SectionUniversal:Space({ Columns = 1 })

SectionUniversal:Button({
     Title = "loc:TCA_GUI",
     Desc = "",
     Callback = function()
        require(82040251531905):TCA("username")
    end
})

SectionUniversal:Space({ Columns = 1 })

SectionUniversal:Button({
     Title = "loc:INFINITE_YIELD",
     Desc = "",
     Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

-------------------------------* Paragrafos *-------------------------------

local SectionInfo = TabInfo:Section({
    Title = "loc:INFORMACOES",
    Icon = "solar:info-circle-bold",
    TextSize = 24,
    FontWeight = Enum.FontWeight.SemiBold,
})

local DevParagraph = TabInfo:Paragraph({
    Title = "loc:EODRAXKK",
    Desc = "loc:DESENVOLVEDOR_PRINCIPAL_DO_ROYAL_HUB_FOC",
    Color = "Grey",
    Image = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/Devs%20icon/EodraxkkRounded.png",
    ImageSize = 60,
    Locked = false,
})

TabInfo:Space({ Columns = 1 })

local DevParagraph2 = TabInfo:Paragraph({
    Title = "loc:EINZBERN",
    Desc = "loc:CODESENVOLVEDOR_DO_ROYAL_HUB_FOCADO_EM_D",
    Color = "Grey",
    Image = "https://raw.githubusercontent.com/BadOctop4s/RoyalHub/refs/heads/main/assets/Devs%20icon/EinzbernRounded.png",
    ImageSize = 60,
    Locked = false,
})

TabInfo:Space({ Columns = 2 })

local ParagraphLink = TabInfo:Paragraph({
    Title = "loc:LINK_DO_DISCORD",
    Desc = "Este é o link do nosso Discord, entre para ficar por dentro das novidades e atualizações do Royal Hub!",
    Color = "Grey",
    Image = "geist:logo-discord",
    ImageSize = 40,
    Locked = false,
    Buttons = {
        {
            Icon = "solar:clipboard-bold",
            Title = "loc:CLIQUE_PARA_COPIAR_O_LINK",
            Callback = function()
                setclipboard("https://discord.gg/DmdTDgJc")
			WindUI:Notify({
				Title = "loc:CLIPBOARD",
				Content = "loc:LINK_DO_DISCORD_COPIADO_PARA_A_AREA_DE_T",
				Duration = 3,
				Icon = "discord",
			})
		end,
        }
    }
})

TabInfo:Space({ Columns = 2 })

local SobreRoyalHub = TabInfo:Section({
    Title = "loc:SOBRE_O_ROYAL_HUB",
    TextSize = 24,
    FontWeight = Enum.FontWeight.SemiBold,
})

SobreRoyalHub:Section({
        Title = "Royal Hub é um script feito para o Roblox, Criado apenas por dois desenvolvedores e focado em entregar uma experiência completa e segura para os jogadores. Com uma variedade de funcionalidades, desde melhorias no personagem até opções de farm automatizado, o Royal Hub visa facilitar a jogabilidade e proporcionar vantagens estratégicas dentro do jogo. Desenvolvido com atenção à segurança, o script busca garantir que os usuários possam aproveitar suas funcionalidades sem comprometer a integridade de suas contas. Seja você um jogador casual ou um entusiasta dedicado, o Royal Hub oferece ferramentas que podem aprimorar sua experiência em diversos jogos.",
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
 })