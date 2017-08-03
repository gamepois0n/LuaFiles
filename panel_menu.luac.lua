-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\menu\panel_menu.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_IT = CppEnums.UiInputType
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
local isLocalwarOpen = ToClient_IsContentsGroupOpen("43")
local isBlackSpiritAdventure = ToClient_IsContentsGroupOpen("1015")
local isBlackSpiritAdventureForPc = ToClient_IsContentsGroupOpen("1021")
local webAlbumOpen = ToClient_IsContentsGroupOpen("205")
local photoGalleryOpen = ToClient_IsContentsGroupOpen("213")
local remoteControlOpen = ToClient_IsContentsGroupOpen("241")
local isTradeEventOpen = ToClient_IsContentsGroupOpen("26")
local joinCheckOpen = ToClient_IsContentsGroupOpen("1025")
local isMercenaryOpen = ToClient_IsContentsGroupOpen("245")
local isMonsterRanking = ToClient_IsContentsGroupOpen("275")
local isSavageOpen = ToClient_IsContentsGroupOpen("249")
local isContentsArsha = ToClient_IsContentsGroupOpen("227")
local partyListOpen = ToClient_IsContentsGroupOpen("254")
local isFreeFight = ToClient_IsContentsGroupOpen("255")
local isBlackSpiritAdventure2 = ToClient_IsContentsGroupOpen("277")
Panel_Menu:SetShow(false)
Panel_Menu:setGlassBackground(true)
Panel_Menu:ActiveMouseEventEffect(true)
Panel_Menu:RegisterShowEventFunc(true, "Panel_Menu_ShowAni()")
Panel_Menu:RegisterShowEventFunc(false, "Panel_Menu_HideAni()")
local userConnectionType = 0
local MenuButtonId = {btn_HelpGuide = 1, btn_KeyboardHelp = 2, btn_Productnote = 3, btn_CashShop = 4, btn_Beauty = 5, btn_Dye = 6, btn_ColorMix = 7, btn_Pet = 8, btn_PlayerInfo = 9, btn_Inventory = 10, btn_BlackSpirit = 11, btn_Quest = 12, btn_Skill = 13, btn_Guild = 14, btn_Manufacture = 15, btn_FishEncyclopedia = 16, btn_Knowledge = 17, btn_WorldMap = 18, btn_Rescue = 19, btn_FriendList = 20, btn_Mail = 21, btn_Worker = 22, btn_Itemmarket = 23, btn_TradeEvent = 24, btn_UiSetting = 25, btn_GuildRanker = 26, btn_LifeRanker = 27, btn_MonsterRanking = 28, btn_Event = 29, btn_DailyCheck = 30, btn_Notice = 31, btn_BlackSpritAdventure = 32, btn_BSAdventure2 = 33, btn_WebAlbum = 34, btn_ScreenShotAlbum = 35, btn_Siege = 36, btn_LocalWar = 37, btn_FreeFight = 38, btn_SavageDefence = 39, btn_GameOption = 40, btn_ChattingFilter = 41, btn_Language = 42, btn_Channel = 43, btn_Competition = 44, btn_Steam = 45, btn_Update = 46, btn_Mercenary = 47, btn_PartyList = 48, btn_Twitch = 49, btn_GameExit = 50}
local MenuButtonTextId = {[MenuButtonId.btn_HelpGuide] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_HELP"), [MenuButtonId.btn_KeyboardHelp] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_KEY"), [MenuButtonId.btn_PlayerInfo] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MYINFO"), [MenuButtonId.btn_Inventory] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BAG"), [MenuButtonId.btn_Skill] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_SKILL"), [MenuButtonId.btn_Guild] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_GUILD"), [MenuButtonId.btn_WorldMap] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_WORLDMAP"), [MenuButtonId.btn_BlackSpirit] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BLACKSPIRIT"), [MenuButtonId.btn_Quest] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_QUESTHISTORY"), [MenuButtonId.btn_Knowledge] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MENTALKNOWLEDGE"), [MenuButtonId.btn_Productnote] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_PRODUCTIONNOTE"), [MenuButtonId.btn_FriendList] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_FRIENDLIST"), [MenuButtonId.btn_Mail] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MAIL"), [MenuButtonId.btn_Pet] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_PET"), [MenuButtonId.btn_Dye] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_DYE"), [MenuButtonId.btn_CashShop] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_CASHSHOP"), [MenuButtonId.btn_Beauty] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BEAUTY"), [MenuButtonId.btn_GameOption] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_OPTION"), [MenuButtonId.btn_Language] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_LANGUAGE"), [MenuButtonId.btn_GameExit] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_EXIT"), [MenuButtonId.btn_Rescue] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_ESCAPE"), [MenuButtonId.btn_UiSetting] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_INTERFACEMOVE"), [MenuButtonId.btn_Manufacture] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_MANUFACTURE"), [MenuButtonId.btn_FishEncyclopedia] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_FISHENCYCLOPEDIA"), [MenuButtonId.btn_ColorMix] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_COLORMIX"), [MenuButtonId.btn_Event] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_EVENT"), [MenuButtonId.btn_BlackSpritAdventure] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BLACKSPIRIT_TRESURE"), [MenuButtonId.btn_GuildRanker] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_GUILDRANKER"), [MenuButtonId.btn_LifeRanker] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_LIFERANKER"), [MenuButtonId.btn_Siege] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_SIEGE"), [MenuButtonId.btn_Worker] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WORKERTITLE"), [MenuButtonId.btn_TradeEvent] = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_TXT_COMMERCE"), [MenuButtonId.btn_Channel] = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), [MenuButtonId.btn_Notice] = PAGetString(Defines.StringSheet_GAME, "CHATTING_NOTICE"), [MenuButtonId.btn_LocalWar] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_LOCALWAR_INFO"), [MenuButtonId.btn_FreeFight] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_FREEFIGHT"), [MenuButtonId.btn_Itemmarket] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_ITEMMARKET"), [MenuButtonId.btn_ChattingFilter] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_CHATTING_FILTER"), [MenuButtonId.btn_WebAlbum] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BEAUTYALBUM"), [MenuButtonId.btn_DailyCheck] = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MSGTITLE"), [MenuButtonId.btn_Competition] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_COMPETITIONGAME"), [MenuButtonId.btn_ScreenShotAlbum] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SCREENSHOTALBUM_TITLE"), [MenuButtonId.btn_Mercenary] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MILITIA"), [MenuButtonId.btn_SavageDefence] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WAVE"), [MenuButtonId.btn_PartyList] = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_TITLE"), [MenuButtonId.btn_MonsterRanking] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MONSTERRANKING"), [MenuButtonId.btn_Steam] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_EXTRACTIONGAME"), [MenuButtonId.btn_Update] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_UPDATE"), [MenuButtonId.btn_BSAdventure2] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BLACKSPIRITADVANTURE2"), [MenuButtonId.btn_Twitch] = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_TWITCH")}
local MenuButtonHotKeyID = {[MenuButtonId.btn_HelpGuide] = "", [MenuButtonId.btn_KeyboardHelp] = keyCustom_GetString_UiKey(UI_IT.UiInputType_Help), [MenuButtonId.btn_PlayerInfo] = keyCustom_GetString_UiKey(UI_IT.UiInputType_PlayerInfo), [MenuButtonId.btn_Inventory] = keyCustom_GetString_UiKey(UI_IT.UiInputType_Inventory), [MenuButtonId.btn_Skill] = keyCustom_GetString_UiKey(UI_IT.UiInputType_Skill), [MenuButtonId.btn_Guild] = keyCustom_GetString_UiKey(UI_IT.UiInputType_Guild), [MenuButtonId.btn_WorldMap] = keyCustom_GetString_UiKey(UI_IT.UiInputType_WorldMap), [MenuButtonId.btn_BlackSpirit] = keyCustom_GetString_UiKey(UI_IT.UiInputType_BlackSpirit), [MenuButtonId.btn_Quest] = keyCustom_GetString_UiKey(UI_IT.UiInputType_QuestHistory), [MenuButtonId.btn_Knowledge] = keyCustom_GetString_UiKey(UI_IT.UiInputType_MentalKnowledge), [MenuButtonId.btn_Productnote] = keyCustom_GetString_UiKey(UI_IT.UiInputType_ProductionNote), [MenuButtonId.btn_FriendList] = keyCustom_GetString_UiKey(UI_IT.UiInputType_FriendList), [MenuButtonId.btn_Mail] = keyCustom_GetString_UiKey(UI_IT.UiInputType_Mail), [MenuButtonId.btn_Pet] = "", [MenuButtonId.btn_Dye] = keyCustom_GetString_UiKey(UI_IT.UiInputType_Dyeing), [MenuButtonId.btn_CashShop] = keyCustom_GetString_UiKey(UI_IT.UiInputType_CashShop), [MenuButtonId.btn_Beauty] = "F4", [MenuButtonId.btn_GameOption] = "", [MenuButtonId.btn_Language] = "", [MenuButtonId.btn_GameExit] = "", [MenuButtonId.btn_Rescue] = "", [MenuButtonId.btn_UiSetting] = "", [MenuButtonId.btn_Manufacture] = keyCustom_GetString_UiKey(UI_IT.UiInputType_Manufacture), [MenuButtonId.btn_FishEncyclopedia] = "", [MenuButtonId.btn_ColorMix] = "", [MenuButtonId.btn_Event] = "", [MenuButtonId.btn_BlackSpritAdventure] = "", [MenuButtonId.btn_GuildRanker] = "", [MenuButtonId.btn_LifeRanker] = "", [MenuButtonId.btn_Siege] = "", [MenuButtonId.btn_Worker] = "", [MenuButtonId.btn_TradeEvent] = "", [MenuButtonId.btn_Channel] = "", [MenuButtonId.btn_Notice] = "", [MenuButtonId.btn_LocalWar] = "", [MenuButtonId.btn_FreeFight] = "", [MenuButtonId.btn_Itemmarket] = "", [MenuButtonId.btn_ChattingFilter] = "", [MenuButtonId.btn_WebAlbum] = "", [MenuButtonId.btn_DailyCheck] = "", [MenuButtonId.btn_Competition] = "", [MenuButtonId.btn_ScreenShotAlbum] = "", [MenuButtonId.btn_Mercenary] = "", [MenuButtonId.btn_SavageDefence] = "", [MenuButtonId.btn_PartyList] = "", [MenuButtonId.btn_MonsterRanking] = "", [MenuButtonId.btn_Steam] = "", [MenuButtonId.btn_Update] = "", [MenuButtonId.btn_BSAdventure2] = "", [MenuButtonId.btn_Twitch] = ""}
local contry = {kr = 0, jp = 1, ru = 2, cn = 3, tw = 4}
local cashIconTexture = {
{232, 357, 276, 401}
, 
{94, 173, 138, 217}
, 
{278, 219, 322, 263}
, 
{278, 219, 322, 263}
; 
[0] = {94, 173, 138, 217}
}
local cashIcon_changeButtonTexture = function(control, contry)
  -- function num : 0_0 , upvalues : cashIconTexture
  local x1, y1, x2, y2 = setTextureUV_Func(control, (cashIconTexture[contry])[1], (cashIconTexture[contry])[2], (cashIconTexture[contry])[3], (cashIconTexture[contry])[4])
  return x1, y1, x2, y2
end

local _badges = {
[MenuButtonId.btn_Quest] = {count = 0, isShow = false}
, 
[MenuButtonId.btn_BlackSpirit] = {count = 0, isShow = false}
, 
[MenuButtonId.btn_Skill] = {count = 0, isShow = false}
, 
[MenuButtonId.btn_Inventory] = {count = 0, isShow = false}
, 
[MenuButtonId.btn_Knowledge] = {count = 0, isShow = false}
, 
[MenuButtonId.btn_FriendList] = {count = 0, isShow = false}
}
local btn_Close = (UI.getChildControl)(Panel_Menu, "Button_Win_Close")
btn_Close:addInputEvent("Mouse_LUp", "Panel_Menu_ShowToggle()")
local menu_Bg = (UI.getChildControl)(Panel_Menu, "Static_MenuBG")
local menuIconBg = (UI.getChildControl)(Panel_Menu, "Static_MenuIconBG")
local menuIcon = (UI.getChildControl)(Panel_Menu, "StaticText_MenuIcon")
local menuBadge = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Number")
local menuNew = (UI.getChildControl)(Panel_Menu, "Static_New")
local menuHotkey = (UI.getChildControl)(Panel_Menu, "StaticText_MenuHotkey")
local menuTitleBar = (UI.getChildControl)(Panel_Menu, "StaticText_Title")
local menuText = (UI.getChildControl)(Panel_Menu, "StaticText_MenuText")
local maxButtonCount = #MenuButtonTextId
local menuButtonBG = {}
local menuButtonIcon = {}
local menuBadgePool = {}
local menuNewPool = {}
local menuTextPool = {}
local menuButtonHotkey = {}
local iconBgPosX = menuIconBg:GetPosX()
local iconBgPosY = menuIconBg:GetPosY()
local iconPosX = menuIcon:GetPosX()
local iconPosY = menuIcon:GetPosY()
local countrySizeNum = 68
local buttonTexture = {
[MenuButtonId.btn_HelpGuide] = {2, 81, 46, 125}
, 
[MenuButtonId.btn_KeyboardHelp] = {48, 357, 92, 401}
, 
[MenuButtonId.btn_UiSetting] = {2, 219, 46, 263}
, 
[MenuButtonId.btn_PlayerInfo] = {48, 81, 92, 125}
, 
[MenuButtonId.btn_Inventory] = {94, 81, 138, 125}
, 
[MenuButtonId.btn_Skill] = {140, 81, 184, 125}
, 
[MenuButtonId.btn_Guild] = {186, 81, 230, 125}
, 
[MenuButtonId.btn_WorldMap] = {232, 81, 276, 125}
, 
[MenuButtonId.btn_BlackSpirit] = {2, 127, 46, 171}
, 
[MenuButtonId.btn_Quest] = {48, 127, 92, 171}
, 
[MenuButtonId.btn_Knowledge] = {94, 127, 138, 171}
, 
[MenuButtonId.btn_Productnote] = {140, 127, 184, 171}
, 
[MenuButtonId.btn_FriendList] = {186, 127, 230, 171}
, 
[MenuButtonId.btn_Mail] = {232, 127, 276, 171}
, 
[MenuButtonId.btn_Pet] = {2, 173, 46, 217}
, 
[MenuButtonId.btn_Dye] = {48, 173, 92, 217}
, 
[MenuButtonId.btn_CashShop] = {94, 173, 138, 217}
, 
[MenuButtonId.btn_Beauty] = {140, 173, 184, 217}
, 
[MenuButtonId.btn_GameOption] = {186, 173, 230, 217}
, 
[MenuButtonId.btn_Language] = {140, 449, 184, 493}
, 
[MenuButtonId.btn_GameExit] = {232, 173, 276, 217}
, 
[MenuButtonId.btn_Rescue] = {48, 219, 92, 263}
, 
[MenuButtonId.btn_Manufacture] = {140, 219, 184, 263}
, 
[MenuButtonId.btn_FishEncyclopedia] = {94, 219, 138, 263}
, 
[MenuButtonId.btn_ColorMix] = {186, 219, 230, 263}
, 
[MenuButtonId.btn_Event] = {232, 219, 276, 263}
, 
[MenuButtonId.btn_BlackSpritAdventure] = {186, 449, 230, 493}
, 
[MenuButtonId.btn_GuildRanker] = {140, 357, 184, 401}
, 
[MenuButtonId.btn_LifeRanker] = {2, 265, 46, 309}
, 
[MenuButtonId.btn_Siege] = {2, 357, 46, 401}
, 
[MenuButtonId.btn_Worker] = {94, 357, 138, 401}
, 
[MenuButtonId.btn_TradeEvent] = {94, 403, 138, 447}
, 
[MenuButtonId.btn_Channel] = {140, 403, 184, 447}
, 
[MenuButtonId.btn_Notice] = {186, 403, 230, 447}
, 
[MenuButtonId.btn_LocalWar] = {202, 403, 276, 447}
, 
[MenuButtonId.btn_FreeFight] = {324, 403, 368, 447}
, 
[MenuButtonId.btn_Itemmarket] = {2, 449, 46, 493}
, 
[MenuButtonId.btn_ChattingFilter] = {278, 449, 322, 493}
, 
[MenuButtonId.btn_WebAlbum] = {278, 403, 322, 447}
, 
[MenuButtonId.btn_DailyCheck] = {186, 357, 230, 401}
, 
[MenuButtonId.btn_Competition] = {278, 311, 322, 355}
, 
[MenuButtonId.btn_ScreenShotAlbum] = {278, 265, 322, 309}
, 
[MenuButtonId.btn_Mercenary] = {324, 311, 368, 355}
, 
[MenuButtonId.btn_SavageDefence] = {278, 81, 322, 125}
, 
[MenuButtonId.btn_PartyList] = {324, 449, 368, 493}
, 
[MenuButtonId.btn_MonsterRanking] = {324, 173, 368, 217}
, 
[MenuButtonId.btn_Steam] = {324, 219, 368, 263}
, 
[MenuButtonId.btn_Update] = {324, 357, 368, 401}
, 
[MenuButtonId.btn_BSAdventure2] = {324, 127, 368, 171}
, 
[MenuButtonId.btn_Twitch] = {370, 81, 414, 125}
}
TargetWindow_ShowToggle = function(index)
  -- function num : 0_1 , upvalues : MenuButtonId, UI_IT
  Panel_UIControl_SetShow(false)
  if MenuButtonId.btn_GameExit == index then
    GameExitShowToggle(false)
  else
    if MenuButtonId.btn_Rescue == index then
      if ToClient_IsMyselfInArena() then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_COMMON_ARLERT"))
        return 
      else
        HandleClicked_RescueConfirm()
      end
    else
      if MenuButtonId.btn_GameOption == index then
        showGameOption()
      else
        if MenuButtonId.btn_UiSetting == index then
          FGlobal_UiSet_Open()
        else
          if MenuButtonId.btn_FriendList == index then
            GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_FriendList)
          else
            if MenuButtonId.btn_Mail == index then
              GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_Mail)
            else
              if MenuButtonId.btn_Pet == index then
                FGlobal_PetListNew_Toggle()
              else
                if MenuButtonId.btn_Knowledge == index then
                  GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_MentalKnowledge)
                else
                  if MenuButtonId.btn_Productnote == index then
                    Panel_ProductNote_ShowToggle()
                  else
                    if MenuButtonId.btn_Inventory == index then
                      GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_Inventory)
                    else
                      if MenuButtonId.btn_Skill == index then
                        GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_Skill)
                      else
                        if MenuButtonId.btn_BlackSpirit == index then
                          GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_BlackSpirit)
                        else
                          if MenuButtonId.btn_Quest == index then
                            GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_QuestHistory)
                          else
                            if MenuButtonId.btn_WorldMap == index then
                              GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_WorldMap)
                            else
                              if MenuButtonId.btn_PlayerInfo == index then
                                GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_PlayerInfo)
                              else
                                if MenuButtonId.btn_Guild == index then
                                  GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_Guild)
                                else
                                  if MenuButtonId.btn_HelpGuide == index then
                                    FGlobal_Panel_WebHelper_ShowToggle()
                                  else
                                    if MenuButtonId.btn_Dye == index then
                                      GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_Dyeing)
                                    else
                                      if MenuButtonId.btn_Beauty == index then
                                        GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_BeautyShop)
                                      else
                                        if MenuButtonId.btn_CashShop == index then
                                          GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_CashShop)
                                        else
                                          if MenuButtonId.btn_Manufacture == index then
                                            GlobalKeyBinder_MouseKeyMap(UI_IT.UiInputType_Manufacture)
                                          else
                                            if MenuButtonId.btn_FishEncyclopedia == index then
                                              FGlobal_FishEncyclopedia_Open()
                                            else
                                              if MenuButtonId.btn_ColorMix == index then
                                                Panel_ColorBalance_Show()
                                              else
                                                if MenuButtonId.btn_Event == index then
                                                  EventNotify_Open(true, true)
                                                else
                                                  if MenuButtonId.btn_BlackSpritAdventure == index then
                                                    FGlobal_BlackSpiritAdventure_Open()
                                                  else
                                                    if MenuButtonId.btn_DailyCheck == index then
                                                      DailyStamp_ShowToggle()
                                                    else
                                                      if MenuButtonId.btn_GuildRanker == index then
                                                        GuildRank_Web_Show()
                                                      else
                                                        if MenuButtonId.btn_LifeRanker == index then
                                                          FGlobal_LifeRanking_Open()
                                                        else
                                                          if MenuButtonId.btn_KeyboardHelp == index then
                                                            FGlobal_KeyboardHelpShow()
                                                          else
                                                            if MenuButtonId.btn_Siege == index then
                                                              FGlobal_GuildWarInfo_Show()
                                                              if Panel_Menu:GetShow() then
                                                                Panel_Menu:SetShow(false, false)
                                                              end
                                                            else
                                                              if MenuButtonId.btn_Worker == index then
                                                                workerManager_Toggle()
                                                              else
                                                                if MenuButtonId.btn_TradeEvent == index then
                                                                  TradeEventInfo_Show()
                                                                else
                                                                  if MenuButtonId.btn_Channel == index then
                                                                    audioPostEvent_SystemUi(1, 41)
                                                                    FGlobal_ChannelSelect_Show()
                                                                  else
                                                                    if MenuButtonId.btn_Notice == index then
                                                                      EventNotify_Open(true, true)
                                                                    else
                                                                      if MenuButtonId.btn_LocalWar == index then
                                                                        audioPostEvent_SystemUi(1, 6)
                                                                        local playerWrapper = getSelfPlayer()
                                                                        local player = playerWrapper:get()
                                                                        local hp = player:getHp()
                                                                        local maxHp = player:getMaxHp()
                                                                        local isGameMaster = ToClient_SelfPlayerIsGM()
                                                                        if ToClient_GetMyTeamNoLocalWar() == 0 then
                                                                          FGlobal_LocalWarInfo_Open()
                                                                        else
                                                                          if hp == maxHp or isGameMaster then
                                                                            local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_LOCALWAR_GETOUT_MEMO")
                                                                            local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = FGlobal_LocalWarInfo_GetOut, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                                                            ;
                                                                            (MessageBox.showMessageBox)(messageBoxData, "middle")
                                                                          else
                                                                            do
                                                                              do
                                                                                Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_MAXHP_CHECK"))
                                                                                if MenuButtonId.btn_FreeFight == index then
                                                                                  local player = (getSelfPlayer()):get()
                                                                                  local maxHp = player:getMaxHp()
                                                                                  local playerHp = player:getHp()
                                                                                  if ToClient_IsJoinPvpBattleGround() then
                                                                                    local FunctionYesUnJoinPvpBattle = function()
    -- function num : 0_1_0
    ToClient_UnJoinPvpBattleGround()
  end

                                                                                    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_PVPBATTLEGROUND_UNJOIN")
                                                                                    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = FunctionYesUnJoinPvpBattle, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                                                                    ;
                                                                                    (MessageBox.showMessageBox)(messageBoxData)
                                                                                    return 
                                                                                  else
                                                                                    do
                                                                                      if maxHp == playerHp then
                                                                                        if IsSelfPlayerWaitAction() == false then
                                                                                          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_PVPBATTLEGROUND_CONDITION_WAIT"))
                                                                                          return 
                                                                                        end
                                                                                        local FunctionYesJoinPvpBattle = function()
    -- function num : 0_1_1
    ToClient_JoinPvpBattleGround(0)
  end

                                                                                        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_PVPBATTLEGROUND_JOIN")
                                                                                        local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = FunctionYesJoinPvpBattle, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                                                                        ;
                                                                                        (MessageBox.showMessageBox)(messageBoxData)
                                                                                        return 
                                                                                      else
                                                                                        do
                                                                                          do
                                                                                            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_CHECKHP"))
                                                                                            if MenuButtonId.btn_Itemmarket == index then
                                                                                              FGlobal_ItemMarket_Open_ForWorldMap(1, true)
                                                                                              audioPostEvent_SystemUi(1, 30)
                                                                                            else
                                                                                              if MenuButtonId.btn_Language == index and (isGameTypeEnglish() or isGameServiceTypeDev()) then
                                                                                                FGlobal_GameOptionOpen()
                                                                                              end
                                                                                            end
                                                                                            if MenuButtonId.btn_ChattingFilter == index then
                                                                                              FGlobal_ChattingFilterList_Open()
                                                                                            else
                                                                                              if MenuButtonId.btn_WebAlbum == index then
                                                                                                FGlobal_CustomizingAlbum_Show(false, (CppEnums.ClientSceneState).eClientSceneStateType_InGame)
                                                                                              else
                                                                                                if MenuButtonId.btn_Competition == index then
                                                                                                  if ToClient_IsHostInArena() and ToClient_IsCompetitionHost() then
                                                                                                    FGlobal_ArshaPvP_Open()
                                                                                                  else
                                                                                                    if ToClient_IsMyselfInArena() then
                                                                                                      FGlobal_ArshaPvP_Open()
                                                                                                    else
                                                                                                      if ToClient_IsCompetitionHost() == false then
                                                                                                        FGlobal_Panel_CompetitionGame_JoinDesc_Open()
                                                                                                      else
                                                                                                        FGlobal_ArshaPvP_HostJoin()
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                else
                                                                                                  if MenuButtonId.btn_ScreenShotAlbum == index then
                                                                                                    ScreenshotAlbum_Open()
                                                                                                  else
                                                                                                    if MenuButtonId.btn_Mercenary == index then
                                                                                                      FGlobal_MercenaryOpen()
                                                                                                    else
                                                                                                      if MenuButtonId.btn_SavageDefence == index then
                                                                                                        if ToClient_getPlayNowSavageDefence() then
                                                                                                          FGlobal_SavegeDefenceInfo_unjoin()
                                                                                                        else
                                                                                                          FGlobal_SavageDefenceInfo_Open()
                                                                                                        end
                                                                                                      else
                                                                                                        if MenuButtonId.btn_PartyList == index then
                                                                                                          FGlobal_PartyList_ShowToggle()
                                                                                                        else
                                                                                                          if MenuButtonId.btn_MonsterRanking == index then
                                                                                                            FGlobal_MonsterRanking_Open()
                                                                                                          else
                                                                                                            if MenuButtonId.btn_Steam == index then
                                                                                                              PaGlobal_Steam_Redemption()
                                                                                                            else
                                                                                                              if MenuButtonId.btn_Update == index then
                                                                                                                Panel_WebHelper_ShowToggle("Update")
                                                                                                              else
                                                                                                                if MenuButtonId.btn_BSAdventure2 == index then
                                                                                                                  FGlobal_BlackSpiritAdventure2_Open()
                                                                                                                else
                                                                                                                  if MenuButtonId.btn_Twitch == index then
                                                                                                                    PaGlobal_Twitch:ShowWindow()
                                                                                                                  end
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                            if Panel_Menu:GetShow() then
                                                                                              Panel_Menu:SetShow(false, false)
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

Panel_Menu_ShowAni = function()
  -- function num : 0_2 , upvalues : UI_ANI_ADV
  Panel_Menu:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Menu, 0, 0.15)
  local aniInfo1 = Panel_Menu:addScaleAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(1.5)
  aniInfo1:SetEndScale(0.8)
  aniInfo1.AxisX = Panel_Menu:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Menu:GetSizeY() / 2
  aniInfo1.ScaleType = 0
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Menu:addScaleAnimation(0.15, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(0.8)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Menu:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Menu:GetSizeY() / 2
  aniInfo2.ScaleType = 0
  aniInfo2.IsChangeChild = true
end

Panel_Menu_HideAni = function()
  -- function num : 0_3
  Panel_Menu:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Menu, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

GameMenu_Init = function()
  -- function num : 0_4 , upvalues : maxButtonCount, UI_PUCT, menu_Bg, menuIconBg, menuButtonBG, menuIcon, menuButtonIcon, menuHotkey, menuButtonHotkey, MenuButtonHotKeyID, menuBadge, menuBadgePool, menuNew, menuNewPool, menuText, UI_TM, menuTextPool, MenuButtonTextId
  local posIndex = 1
  for index = 1, maxButtonCount do
    local tempBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, menu_Bg, "Static_MenuBg_" .. index)
    CopyBaseProperty(menuIconBg, tempBg)
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'

    menuButtonBG[index] = tempBg
    ;
    (menuButtonBG[index]):SetShow(true)
    ;
    (menuButtonBG[index]):ResetVertexAni()
    local tempIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, menuButtonBG[index], "StaticText_MenuIcon_" .. index)
    CopyBaseProperty(menuIcon, tempIcon)
    -- DECOMPILER ERROR at PC44: Confused about usage of register: R7 in 'UnsetPending'

    menuButtonIcon[index] = tempIcon
    ;
    (menuButtonIcon[index]):SetShow(true)
    local tempHotkeyIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, menuButtonBG[index], "StaticText_MenuHotKey_" .. index)
    CopyBaseProperty(menuHotkey, tempHotkeyIcon)
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R8 in 'UnsetPending'

    menuButtonHotkey[index] = tempHotkeyIcon
    ;
    (menuButtonHotkey[index]):SetShow(true)
    ;
    (menuButtonHotkey[index]):SetText(MenuButtonHotKeyID[index])
    ;
    (menuButtonHotkey[index]):ComputePos()
    local badgeIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, menuButtonBG[index], "StaticText_MenuBadge_" .. index)
    CopyBaseProperty(menuBadge, badgeIcon)
    badgeIcon:SetPosX(tempBg:GetSizeX() - badgeIcon:GetSizeX() - 43)
    badgeIcon:SetPosY(5)
    -- DECOMPILER ERROR at PC107: Confused about usage of register: R9 in 'UnsetPending'

    menuBadgePool[index] = badgeIcon
    ;
    (menuBadgePool[index]):SetShow(false)
    local newIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, menuButtonBG[index], "StaticText_MenuNew_" .. index)
    CopyBaseProperty(menuNew, newIcon)
    newIcon:SetPosX(tempBg:GetSizeX() - newIcon:GetSizeX() - 38)
    newIcon:SetPosY(2)
    newIcon:SetIgnore(true)
    -- DECOMPILER ERROR at PC142: Confused about usage of register: R10 in 'UnsetPending'

    menuNewPool[index] = newIcon
    ;
    (menuNewPool[index]):SetShow(false)
    local tempText = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, menuButtonBG[index], "StaticText_MenuText_" .. index)
    CopyBaseProperty(menuText, tempText)
    tempText:SetTextMode(UI_TM.eTextMode_AutoWrap)
    -- DECOMPILER ERROR at PC167: Confused about usage of register: R11 in 'UnsetPending'

    menuTextPool[index] = tempText
    ;
    (menuTextPool[index]):SetShow(true)
    if isGameTypeEnglish() then
      (menuButtonIcon[index]):SetSize(44, 44)
      ;
      (menuTextPool[index]):SetSize(70, (menuTextPool[index]):GetSizeY())
      ;
      (menuTextPool[index]):SetSpanSize(0, 55)
    else
      if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
        (menuButtonIcon[index]):SetSize(44, 44)
        ;
        (menuButtonIcon[index]):SetTextVerticalTop()
        ;
        (menuButtonIcon[index]):SetSpanSize(((menuButtonIcon[index]):GetSpanSize()).x, 12)
        ;
        (menuTextPool[index]):SetSize(80, (menuTextPool[index]):GetSizeY())
        ;
        (menuTextPool[index]):SetSpanSize(0, 60)
      else
        ;
        (menuButtonIcon[index]):SetSize(44, 44)
        ;
        (menuButtonIcon[index]):SetTextVerticalTop()
        ;
        (menuTextPool[index]):SetSize(64, (menuTextPool[index]):GetSizeY())
        ;
        (menuButtonIcon[index]):SetTextSpan(0, 42)
      end
    end
    ;
    (menuTextPool[index]):SetText(MenuButtonTextId[index])
    GameMenu_ChangeButtonTexture(index)
  end
end

GameMenu_CheckEnAble = function(buttonType)
  -- function num : 0_5 , upvalues : MenuButtonId, isLocalwarOpen, isFreeFight, isTradeEventOpen, webAlbumOpen, isBlackSpiritAdventure, joinCheckOpen, isContentsArsha, isMercenaryOpen, isSavageOpen, photoGalleryOpen, partyListOpen, isMonsterRanking, isBlackSpiritAdventure2, menuNewPool
  local returnValue = false
  if isGameTypeKorea() then
    if buttonType == MenuButtonId.btn_Notice then
      returnValue = false
    else
      returnValue = true
    end
  else
    if isGameTypeJapan() then
      if buttonType == MenuButtonId.btn_Notice then
        returnValue = false
      else
        returnValue = true
      end
    else
      if isGameTypeRussia() then
        if buttonType == MenuButtonId.btn_HelpGuide or buttonType == MenuButtonId.btn_Notice then
          returnValue = false
        else
          returnValue = true
        end
        if buttonType == MenuButtonId.btn_Event then
          if isServerFixedCharge() then
            returnValue = false
          else
            returnValue = true
          end
        end
        if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT or getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_OBT then
          if buttonType == MenuButtonId.btn_Dye then
            returnValue = false
          else
            returnValue = true
          end
        end
      else
        if isGameTypeEnglish() then
          if buttonType == MenuButtonId.btn_Event then
            returnValue = false
          else
            returnValue = true
          end
        else
          if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KR2) then
            returnValue = true
          else
            if isGameTypeTaiwan() then
              if buttonType == MenuButtonId.btn_Notice then
                returnValue = false
              else
                returnValue = true
              end
            else
              returnValue = true
            end
          end
        end
      end
    end
  end
  if buttonType == MenuButtonId.btn_LocalWar then
    if not isLocalwarOpen then
      returnValue = false
    else
      returnValue = true
    end
  end
  do
    if buttonType == MenuButtonId.btn_FreeFight then
      local playerLevel = ((getSelfPlayer()):get()):getLevel()
      if isFreeFight and playerLevel >= 50 then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_CashShop or buttonType == MenuButtonId.btn_Beauty then
      if getContentsServiceType() ~= (CppEnums.ContentsServiceType).eContentsServiceType_Commercial then
        returnValue = false
      else
        returnValue = true
      end
    end
    if buttonType == MenuButtonId.btn_TradeEvent then
      if isTradeEventOpen then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_Language then
      if isGameTypeEnglish() or isGameServiceTypeDev() then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_ChattingFilter then
      returnValue = true
    end
    if buttonType == MenuButtonId.btn_WebAlbum then
      if webAlbumOpen or isGameServiceTypeDev() then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_BlackSpritAdventure then
      if isBlackSpiritAdventure then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_DailyCheck then
      if joinCheckOpen then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_Competition then
      if isContentsArsha == false then
        returnValue = false
      else
        returnValue = true
      end
    end
    if buttonType == MenuButtonId.btn_Mercenary then
      if isMercenaryOpen then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_Steam then
      if isGameTypeEnglish() or isGameServiceTypeDev() then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_Update then
      if isGameTypeKorea() or isGameServiceTypeDev() then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_SavageDefence then
      if isSavageOpen then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_ScreenShotAlbum then
      returnValue = photoGalleryOpen
    end
    if buttonType == MenuButtonId.btn_PartyList then
      returnValue = partyListOpen
    end
    if buttonType == MenuButtonId.btn_MonsterRanking then
      if isMonsterRanking then
        returnValue = true
      else
        returnValue = false
      end
    end
    if buttonType == MenuButtonId.btn_Twitch then
      returnValue = true
    end
    if buttonType == MenuButtonId.btn_BSAdventure2 then
      returnValue = isBlackSpiritAdventure2
    end
    if (buttonType == MenuButtonId.btn_Siege or buttonType == MenuButtonId.btn_HelpGuide or buttonType == MenuButtonId.btn_Productnote or buttonType == MenuButtonId.btn_Event or buttonType == MenuButtonId.btn_Notice) and isGameTypeKR2() then
      returnValue = false
    end
    if not isGameTypeKR2() then
      if buttonType == MenuButtonId.btn_Twitch then
        (menuNewPool[buttonType]):SetShow(true)
      else
        ;
        (menuNewPool[buttonType]):SetShow(false)
      end
    end
    return returnValue
  end
end

GameMenu_ChangeButtonTexture = function(index)
  -- function num : 0_6 , upvalues : menuButtonIcon, MenuButtonId, cashIcon_changeButtonTexture, contry, menuTextPool, buttonTexture
  (menuButtonIcon[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Menu/Menu_01.dds")
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if index == MenuButtonId.btn_CashShop then
    if getGameServiceType() == 0 or getGameServiceType() == 1 or getGameServiceType() == 2 or getGameServiceType() == 3 or getGameServiceType() == 4 then
      x1 = cashIcon_changeButtonTexture(menuButtonIcon[index], contry.kr)
    else
      -- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC60: Overwrote pending register: R2 in 'AssignReg'

      if getGameServiceType() == 5 or getGameServiceType() == 6 then
        x1 = cashIcon_changeButtonTexture(menuButtonIcon[index], contry.jp)
      else
        -- DECOMPILER ERROR at PC77: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC78: Overwrote pending register: R3 in 'AssignReg'

        -- DECOMPILER ERROR at PC79: Overwrote pending register: R2 in 'AssignReg'

        if getGameServiceType() == 7 or getGameServiceType() == 8 then
          x1 = cashIcon_changeButtonTexture(menuButtonIcon[index], contry.ru)
        else
          -- DECOMPILER ERROR at PC96: Overwrote pending register: R4 in 'AssignReg'

          -- DECOMPILER ERROR at PC97: Overwrote pending register: R3 in 'AssignReg'

          -- DECOMPILER ERROR at PC98: Overwrote pending register: R2 in 'AssignReg'

          if getGameServiceType() == 9 or getGameServiceType() == 10 then
            x1 = cashIcon_changeButtonTexture(menuButtonIcon[index], contry.cn)
          else
            -- DECOMPILER ERROR at PC111: Overwrote pending register: R4 in 'AssignReg'

            -- DECOMPILER ERROR at PC112: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC113: Overwrote pending register: R2 in 'AssignReg'

            if isGameTypeTaiwan() then
              x1 = cashIcon_changeButtonTexture(menuButtonIcon[index], contry.tw)
            else
              -- DECOMPILER ERROR at PC122: Overwrote pending register: R4 in 'AssignReg'

              -- DECOMPILER ERROR at PC123: Overwrote pending register: R3 in 'AssignReg'

              -- DECOMPILER ERROR at PC124: Overwrote pending register: R2 in 'AssignReg'

              x1 = cashIcon_changeButtonTexture(menuButtonIcon[index], contry.kr)
            end
          end
        end
      end
    end
  else
    -- DECOMPILER ERROR at PC143: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC144: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC145: Overwrote pending register: R2 in 'AssignReg'

    if index == MenuButtonId.btn_LocalWar then
      if ToClient_GetMyTeamNoLocalWar() == 0 then
        x1 = setTextureUV_Func(menuButtonIcon[index], 232, 403, 276, 447)
        ;
        (menuTextPool[MenuButtonId.btn_LocalWar]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_LOCALWAR_INFO"))
      else
        -- DECOMPILER ERROR at PC167: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC168: Overwrote pending register: R3 in 'AssignReg'

        -- DECOMPILER ERROR at PC169: Overwrote pending register: R2 in 'AssignReg'

        x1 = setTextureUV_Func(menuButtonIcon[index], 232, 449, 276, 493)
        ;
        (menuTextPool[MenuButtonId.btn_LocalWar]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_LOCALWAR_GETOUT"))
      end
    else
      -- DECOMPILER ERROR at PC199: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC200: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC201: Overwrote pending register: R2 in 'AssignReg'

      if index == MenuButtonId.btn_SavageDefence then
        if ToClient_getPlayNowSavageDefence() then
          x1 = setTextureUV_Func(menuButtonIcon[index], 324, 265, 368, 309)
          ;
          (menuTextPool[MenuButtonId.btn_SavageDefence]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WAVE_OUT"))
        else
          -- DECOMPILER ERROR at PC223: Overwrote pending register: R4 in 'AssignReg'

          -- DECOMPILER ERROR at PC224: Overwrote pending register: R3 in 'AssignReg'

          -- DECOMPILER ERROR at PC225: Overwrote pending register: R2 in 'AssignReg'

          x1 = setTextureUV_Func(menuButtonIcon[index], 278, 81, 322, 125)
          ;
          (menuTextPool[MenuButtonId.btn_SavageDefence]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WAVE"))
        end
      else
        -- DECOMPILER ERROR at PC255: Overwrote pending register: R4 in 'AssignReg'

        -- DECOMPILER ERROR at PC256: Overwrote pending register: R3 in 'AssignReg'

        -- DECOMPILER ERROR at PC257: Overwrote pending register: R2 in 'AssignReg'

        x1 = setTextureUV_Func(menuButtonIcon[index], (buttonTexture[index])[1], (buttonTexture[index])[2], (buttonTexture[index])[3], (buttonTexture[index])[4])
      end
    end
  end
  ;
  ((menuButtonIcon[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (menuButtonIcon[index]):setRenderTexture((menuButtonIcon[index]):getBaseTexture())
end

HandleOn_SlotBg = function(index)
  -- function num : 0_7 , upvalues : menuButtonBG
  GameMenu_ResetVertexAni()
  if index ~= nil then
    (menuButtonBG[index]):SetVertexAniRun("Ani_Color_New", true)
  end
end

GameMenu_ResetVertexAni = function()
  -- function num : 0_8 , upvalues : maxButtonCount, menuButtonBG
  for i = 1, maxButtonCount do
    if GameMenu_CheckEnAble(i) then
      (menuButtonBG[i]):ResetVertexAni()
      ;
      (menuButtonBG[i]):SetVertexAniRun("Ani_Color_Reset", true)
    end
  end
end

mainUI_Badges_Count = function()
  -- function num : 0_9 , upvalues : _badges, MenuButtonId, menuBadgePool
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if (_badges[MenuButtonId.btn_Quest]).isShow == true then
    (_badges[MenuButtonId.btn_Quest]).count = (_badges[MenuButtonId.btn_Quest]).count + 1
  end
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

  if (_badges[MenuButtonId.btn_BlackSpirit]).isShow == true then
    (_badges[MenuButtonId.btn_BlackSpirit]).count = (_badges[MenuButtonId.btn_BlackSpirit]).count + 1
  end
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

  if (_badges[MenuButtonId.btn_Skill]).isShow == true then
    (_badges[MenuButtonId.btn_Skill]).count = (_badges[MenuButtonId.btn_Skill]).count + 1
  end
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

  if (_badges[MenuButtonId.btn_FriendList]).isShow == true then
    (_badges[MenuButtonId.btn_FriendList]).count = (_badges[MenuButtonId.btn_FriendList]).count + 1
  end
  ;
  (menuBadgePool[MenuButtonId.btn_Quest]):SetText((_badges[MenuButtonId.btn_Quest]).count)
  ;
  (menuBadgePool[MenuButtonId.btn_BlackSpirit]):SetText((_badges[MenuButtonId.btn_BlackSpirit]).count)
  ;
  (menuBadgePool[MenuButtonId.btn_Skill]):SetText((_badges[MenuButtonId.btn_Skill]).count)
  ;
  (menuBadgePool[MenuButtonId.btn_FriendList]):SetText((_badges[MenuButtonId.btn_FriendList]).count)
end

UIMain_ItemUpdate = function()
  -- function num : 0_10 , upvalues : menuBadgePool, MenuButtonId
  local newItemCount = Inventory_GetFirstItemCount()
  if not (menuBadgePool[MenuButtonId.btn_Inventory]):GetShow() then
    (menuBadgePool[MenuButtonId.btn_Inventory]):SetShow(true)
  end
  ;
  (menuBadgePool[MenuButtonId.btn_Inventory]):SetText(newItemCount)
end

UIMain_ItemUpdateRemove = function()
  -- function num : 0_11 , upvalues : menuBadgePool, MenuButtonId
  (menuBadgePool[MenuButtonId.btn_Inventory]):SetText(0)
  ;
  (menuBadgePool[MenuButtonId.btn_Inventory]):SetShow(false)
end

UIMain_FriendListUpdate = function()
  -- function num : 0_12 , upvalues : _badges, MenuButtonId, menuBadgePool
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  if (_badges[MenuButtonId.btn_FriendList]).isShow == false then
    (_badges[MenuButtonId.btn_FriendList]).isShow = true
    ;
    (menuBadgePool[MenuButtonId.btn_FriendList]):SetShow(true)
    mainUI_Badges_Count()
  end
end

UIMain_FriendListUpdateRemove = function()
  -- function num : 0_13 , upvalues : _badges, MenuButtonId, menuBadgePool
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  (_badges[MenuButtonId.btn_FriendList]).isShow = false
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (_badges[MenuButtonId.btn_FriendList]).count = 0
  ;
  (menuBadgePool[MenuButtonId.btn_FriendList]):SetShow(false)
  mainUI_Badges_Count()
end

local knowledgePoint = 0
UIMain_KnowledgeUpdate = function()
  -- function num : 0_14 , upvalues : knowledgePoint, menuBadgePool, MenuButtonId
  knowledgePoint = knowledgePoint + 1
  if knowledgePoint ~= 0 then
    if knowledgePoint > 1 then
      return 
    end
    ;
    (menuBadgePool[MenuButtonId.btn_Knowledge]):SetShow(true)
    ;
    (menuBadgePool[MenuButtonId.btn_Knowledge]):SetText("N")
  end
end

UIMain_KnowledgeUpdateRemove = function()
  -- function num : 0_15 , upvalues : knowledgePoint, menuBadgePool, MenuButtonId
  knowledgePoint = 0
  ;
  (menuBadgePool[MenuButtonId.btn_Knowledge]):SetShow(false)
end

UI_MAIN_checkSkillLearnable = function()
  -- function num : 0_16 , upvalues : menuBadgePool, MenuButtonId
  local isLearnable = PaGlobal_Skill:SkillWindow_PlayerLearnableSkill()
  if isLearnable then
    (menuBadgePool[MenuButtonId.btn_Skill]):SetShow(true)
    ;
    (menuBadgePool[MenuButtonId.btn_Skill]):SetText("N")
  end
end

UIMain_SkillPointUpdateRemove = function()
  -- function num : 0_17 , upvalues : menuBadgePool, MenuButtonId
  (menuBadgePool[MenuButtonId.btn_Skill]):SetShow(false)
end

Panel_Menu_ShowToggle = function()
  -- function num : 0_18
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MENUOPENALERT_INDEAD"))
    return 
  end
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  if GetUIMode() == (Defines.UIMode).eUIMode_Gacha_Roulette then
    return 
  end
  if Panel_Menu:IsShow() == true then
    Panel_Menu_Close()
    return false
  else
    _Panel_Menu_OpenLimit()
    Panel_Menu:SetPosX(scrSizeX - scrSizeX / 2 - Panel_Menu:GetSizeX() / 2)
    Panel_Menu:SetPosY(scrSizeY - scrSizeY / 2 - Panel_Menu:GetSizeY() / 2)
    Panel_Menu:SetShow(true, true)
    Panel_Menu:SetDragAll(true)
    Panel_Menu:SetIgnore(false)
    audioPostEvent_SystemUi(1, 37)
    return true
  end
  return false
end

local group_0 = Panel_Menu:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
_Panel_Menu_OpenLimit = function()
  -- function num : 0_19 , upvalues : maxButtonCount, menuButtonBG, menuButtonIcon, menuButtonHotkey, countrySizeNum, iconBgPosX, iconBgPosY, group_0, menu_Bg, menuTitleBar, MenuButtonId
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  for index = 1, maxButtonCount do
    (menuButtonBG[index]):SetShow(false)
  end
  local columnCount = 0
  local columnCountByRaw = 7
  local rowCount = 0
  local posIndex = 1
  if getSelfPlayer() ~= nil then
    for index = 1, maxButtonCount do
      if GameMenu_CheckEnAble(index) and menuButtonBG[index] ~= nil and menuButtonIcon[index] ~= nil and menuButtonHotkey[index] ~= nil then
        (menuButtonBG[index]):SetEnable(true)
        ;
        (menuButtonBG[index]):SetMonoTone(false)
        ;
        (menuButtonIcon[index]):SetEnable(true)
        ;
        (menuButtonIcon[index]):SetMonoTone(false)
        ;
        (menuButtonHotkey[index]):SetEnable(true)
        ;
        (menuButtonHotkey[index]):SetMonoTone(false)
        ;
        (menuButtonBG[index]):SetSize(68, 68)
        if isGameTypeEnglish() then
          (menuButtonBG[index]):SetSize(83, 83)
          countrySizeNum = 83
        else
          if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
            (menuButtonBG[index]):SetSize(90, 90)
            countrySizeNum = 90
          else
            ;
            (menuButtonBG[index]):SetSize(68, 68)
            countrySizeNum = 68
          end
        end
        ;
        (menuButtonBG[index]):SetShow(true)
        ;
        (menuButtonBG[index]):SetPosX(iconBgPosX + (menuButtonBG[index]):GetSizeX() * columnCount)
        ;
        (menuButtonBG[index]):SetPosY(iconBgPosY + (menuButtonBG[index]):GetSizeY() * rowCount)
        ;
        (menuButtonBG[index]):addInputEvent("Mouse_LUp", "TargetWindow_ShowToggle(" .. index .. ")")
        ;
        (menuButtonBG[index]):addInputEvent("Mouse_On", "HandleOn_SlotBg(" .. index .. ")")
        ;
        (menuButtonBG[index]):addInputEvent("Mouse_Out", "HandleOn_SlotBg()")
        group_0:addControl((posIndex - 1) % 7, (posIndex - 1) / 7, 7, 7, menuButtonBG[index])
        if posIndex % columnCountByRaw == 0 then
          columnCount = 0
          rowCount = rowCount + 1
        else
          columnCount = columnCount + 1
        end
        posIndex = posIndex + 1
      end
    end
    local totalRaw = (math.ceil)((posIndex - 1) / columnCountByRaw)
    local buttonSizeX = (menuButtonBG[2]):GetSizeX()
    local buttonGapX = 7
    local bgSizeX = buttonSizeX * columnCountByRaw
    menu_Bg:SetSize(bgSizeX + buttonGapX * 2, (countrySizeNum + 2) * totalRaw + buttonGapX)
    Panel_Menu:SetSize(menu_Bg:GetSizeX() + buttonGapX * 6, menu_Bg:GetSizeY() + 70)
    menuTitleBar:SetSize(Panel_Menu:GetSizeX() - 16, menuTitleBar:GetSizeY())
    if CheckTutorialEnd() == false then
      (menuButtonBG[MenuButtonId.btn_UiSetting]):SetEnable(false)
      ;
      (menuButtonBG[MenuButtonId.btn_UiSetting]):SetMonoTone(true)
      ;
      (menuButtonIcon[MenuButtonId.btn_UiSetting]):SetEnable(false)
      ;
      (menuButtonIcon[MenuButtonId.btn_UiSetting]):SetMonoTone(true)
      ;
      (menuButtonHotkey[MenuButtonId.btn_UiSetting]):SetEnable(false)
      ;
      (menuButtonHotkey[MenuButtonId.btn_UiSetting]):SetMonoTone(true)
    end
  end
  do
    local curChannelData = getCurrentChannelServerData()
    if GameMenu_CheckEnAble(MenuButtonId.btn_Siege) then
      (menuButtonBG[MenuButtonId.btn_Siege]):SetEnable(true)
      ;
      (menuButtonBG[MenuButtonId.btn_Siege]):SetMonoTone(false)
      ;
      (menuButtonIcon[MenuButtonId.btn_Siege]):SetEnable(true)
      ;
      (menuButtonIcon[MenuButtonId.btn_Siege]):SetMonoTone(false)
      ;
      (menuButtonHotkey[MenuButtonId.btn_Siege]):SetEnable(true)
      ;
      (menuButtonHotkey[MenuButtonId.btn_Siege]):SetMonoTone(false)
    end
    local dailyCheckTabCount = ToClient_GetAttendanceInfoCount()
    if dailyCheckTabCount > 0 then
      (menuButtonBG[MenuButtonId.btn_DailyCheck]):SetEnable(true)
      ;
      (menuButtonBG[MenuButtonId.btn_DailyCheck]):SetMonoTone(false)
    else
      ;
      (menuButtonBG[MenuButtonId.btn_DailyCheck]):SetEnable(false)
      ;
      (menuButtonBG[MenuButtonId.btn_DailyCheck]):SetMonoTone(true)
    end
    if ToClient_IsConferenceMode() then
      (menuButtonBG[MenuButtonId.btn_DailyCheck]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_DailyCheck]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_CashShop]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_CashShop]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_Productnote]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_Productnote]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_TradeEvent]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_TradeEvent]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_GuildRanker]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_GuildRanker]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_LifeRanker]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_LifeRanker]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_BlackSpritAdventure]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_BlackSpritAdventure]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_Event]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_Event]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_ScreenShotAlbum]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_ScreenShotAlbum]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_WebAlbum]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_WebAlbum]):SetMonoTone(true)
      ;
      (menuButtonBG[MenuButtonId.btn_WebAlbum]):SetIgnore(true)
      ;
      (menuButtonBG[MenuButtonId.btn_WebAlbum]):SetMonoTone(true)
    end
  end
end

Panel_Menu_Close = function()
  -- function num : 0_20 , upvalues : IM
  Panel_Menu:SetShow(false, true)
  Panel_Menu:SetDragAll(false)
  Panel_Menu:SetIgnore(true)
  if check_ShowWindow() == false then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  end
end

HandleClicked_RescueConfirm = function()
  -- function num : 0_21
  audioPostEvent_SystemUi(1, 41)
  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MSGBOX_RESCUE")
  local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = RescueExecute, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

RescueExecute = function()
  -- function num : 0_22
  callRescue()
end

panelMenu_OnScreenResize = function()
  -- function num : 0_23
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  Panel_Menu:SetPosX(scrSizeX - scrSizeX / 2 - Panel_Menu:GetSizeX() / 2)
  Panel_Menu:SetPosY(scrSizeY - scrSizeY / 2 - Panel_Menu:GetSizeY() / 2)
  Panel_Menu:ComputePos()
end

FGlobal_GetGameExitIndex = function()
  -- function num : 0_24 , upvalues : MenuButtonId
  local exitIndex = MenuButtonId.btn_GameExit
  return exitIndex
end

GameMenu_Init()
registerEvent("onScreenResize", "panelMenu_OnScreenResize")

