-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\menu\panel_menu_new.luac 

-- params : ...
-- function num : 0
PaGlobal_Menu = {
_ui = {_mainMenuBg = (UI.getChildControl)(Panel_Menu_New, "Static_MainMenuBg"), _categoryMenuBg = (UI.getChildControl)(Panel_Menu_New, "Static_SubGroupBg"), 
_radioButtonGroup = {[0] = (UI.getChildControl)(Panel_Menu_New, "RadioButton_Menu_0"), [1] = (UI.getChildControl)(Panel_Menu_New, "RadioButton_Menu_1"), [2] = (UI.getChildControl)(Panel_Menu_New, "RadioButton_Menu_2"), [3] = (UI.getChildControl)(Panel_Menu_New, "RadioButton_Menu_3")}
, _radioButtonCustom = (UI.getChildControl)(Panel_Menu_New, "RadioButton_Custom"), _customWindow = (UI.getChildControl)(Panel_Menu_New, "Static_CustomBg"), _customTitle = (UI.getChildControl)(Panel_Menu_New, "StaticText_CustomTitle"), _bottomBannerBg = (UI.getChildControl)(Panel_Menu_New, "Static_BottomGroupBg"), _effect_SubMenuButton = (UI.getChildControl)(Panel_Menu_New, "Static_OverEffect_SubMenu"), _effect_MainMenuButton = (UI.getChildControl)(Panel_Menu_New, "Static_OverEffect_MainMenu"), _effect_BottomBanner = (UI.getChildControl)(Panel_Menu_New, "Static_OverEffect_BottomBanner"), _isLeft = (UI.getChildControl)(Panel_Menu_New, "RadioButton_Left"), _isRight = (UI.getChildControl)(Panel_Menu_New, "RadioButton_Right"), _buttonCustom = nil, _buttonCustom720 = nil, _buttonSaveCustom = nil, _buttonCancelCustom = nil, 
_main = {}
, 
_subButton = {}
, 
_subIcon = {}
, 
_hotKey = {}
, 
_newIcon = {}
, 
_hotIcon = {}
, 
_checkIcon = {}
, 
_banner = {}
, 
_custom = {}
, 
_customButton = {}
, 
_customButtonBg = {}
}
, 
_contentsGroup = {_isLocalwarOpen = ToClient_IsContentsGroupOpen("43"), _isBlackSpiritAdventure = ToClient_IsContentsGroupOpen("1015"), _isBlackSpiritAdventureForPc = ToClient_IsContentsGroupOpen("1021"), _webAlbumOpen = ToClient_IsContentsGroupOpen("205"), _photoGalleryOpen = ToClient_IsContentsGroupOpen("213"), _remoteControlOpen = ToClient_IsContentsGroupOpen("241"), _isTradeEventOpen = ToClient_IsContentsGroupOpen("26"), _joinCheckOpen = ToClient_IsContentsGroupOpen("1025"), _isMercenaryOpen = ToClient_IsContentsGroupOpen("245"), _isMonsterRanking = ToClient_IsContentsGroupOpen("275"), _isSavageOpen = ToClient_IsContentsGroupOpen("249"), _isContentsArsha = ToClient_IsContentsGroupOpen("227"), _partyListOpen = ToClient_IsContentsGroupOpen("254"), _isFreeFight = ToClient_IsContentsGroupOpen("255"), _isBlackSpiritAdventure2 = ToClient_IsContentsGroupOpen("277"), _isMasterpieceOpen = ToClient_IsContentsGroupOpen("270"), _isSiegeEnable = ToClient_IsContentsGroupOpen("21"), _isMemoOpen = isUsedMemoOpen()}
, 
_categoryData = {}
, _mainButtonCount = 5, _categoryCount = 4, _maxUiSlotCount = 16, _currentCategoryIndex = 1, 
_customIndex = {}
, _isCustomMode = false, 
_beforeMenu = {_categoryIndex, _menuIndex, _realIndex}
, 
_afterMenu = {_categoryIndex, _menuIndex}
, _beforeIndex = nil, _isLeft = true, 
_color = {_defaultIconColor = 4289642191, _defaultNormalFontColor = 4286352799, _defaultOverFontColor = 4289449972, _defaultClickFontColor = 4289449972, _newIconColor = 4292520281, _newNormalFontColor = 4293639262, _newOverFontColor = 4294960300, _newClickFontColor = 4294960300, _hotIconColor = 4287996368, _hotNormalFontColor = 4286813382, _hotOverFontColor = 4285830305, _hotClickFontColor = 4285830305, _customIconColor = 4288857556, _customNormalFontColor = 4289320682, _customOverFontColor = 4289320682, _customClickFontColor = 4289320682}
}
-- DECOMPILER ERROR at PC280: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_Menu._ui)._custom = {_bg = (UI.getChildControl)((PaGlobal_Menu._ui)._customWindow, "Static_Bg"), _templeteButtonBg = (UI.getChildControl)((PaGlobal_Menu._ui)._customWindow, "Static_IconBg"), _templeteButton = (UI.getChildControl)((PaGlobal_Menu._ui)._customWindow, "Button_Icon"), _beforeMenu = (UI.getChildControl)((PaGlobal_Menu._ui)._customWindow, "StaticText_SelectedMenu"), _afterMenu = (UI.getChildControl)((PaGlobal_Menu._ui)._customWindow, "StaticText_SelectedChangeMenu"), _effect = nil, _checkIcon = nil}
-- DECOMPILER ERROR at PC292: Confused about usage of register: R0 in 'UnsetPending'

;
((PaGlobal_Menu._ui)._custom)._beforeIcon = (UI.getChildControl)(((PaGlobal_Menu._ui)._custom)._beforeMenu, "Button_MenuIcon")
-- DECOMPILER ERROR at PC304: Confused about usage of register: R0 in 'UnsetPending'

;
((PaGlobal_Menu._ui)._custom)._afterIcon = (UI.getChildControl)(((PaGlobal_Menu._ui)._custom)._afterMenu, "Button_MenuIcon")
-- DECOMPILER ERROR at PC314: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._main = {_help = 0, _cashShop = 1, _escape = 2, _option = 3, _inven = 4, _gameExit = 5, _count = 6}
-- DECOMPILER ERROR at PC332: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._contents = {_beauty = 0, _dye = 1, _pallet = 2, _pet = 3, _blackSpirit = 4, _questInfo = 5, _skill = 6, _manufacture = 7, _uiSetting = 8, _dailyStamp = 9, _blackSpiritAdventure = 10, _blackSpiritAdventure2 = 11, _beautyAlbum = 12, _photoGallery = 13, _count = 14}
-- DECOMPILER ERROR at PC342: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._cooperation = {_localWar = 0, _freeFighting = 1, _waveDefence = 2, _arsha = 3, _militia = 4, _partyFind = 5, _count = 6}
-- DECOMPILER ERROR at PC362: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._infomation = {_keyboard = 0, _productNote = 1, _myInfo = 2, _serverChange = 3, _fishEncyclopedia = 4, _knowledge = 5, _worldMap = 6, _workerList = 7, _itemMarket = 8, _tradeInfo = 9, _warInfo = 10, _event = 11, _update = 12, _steam = 13, _notice = 14, _masterpiece = 15, _count = 16}
-- DECOMPILER ERROR at PC377: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._community = {_guild = 0, _friend = 1, _mail = 2, _guildRank = 3, _lifeRank = 4, _monsterRank = 5, _chattingFilter = 6, _language = 7, _blackDesertTv = 8, _socialAction = 9, _memo = 10, _count = 11}
-- DECOMPILER ERROR at PC383: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._banner = {_blackDesertTv = 0, _socialAction = 1, _count = 2}
-- DECOMPILER ERROR at PC391: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._myMenu = {_graphic = 0, _sound = 1, _game = 2, _performance = 3, _count = 4}
-- DECOMPILER ERROR at PC408: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu._customIndex = {6, 16, 20, 21, 22, 24, 35, 25, 29, 34, 44, 49; [0] = 14}
-- DECOMPILER ERROR at PC2442: Confused about usage of register: R0 in 'UnsetPending'

if ((((isGameTypeEnglish() or isGameTypeSA() or not isGameTypeKorea()) and isGameTypeEnglish()) or not isGameTypeEnglish()) and isGameTypeEnglish()) or not isGameTypeEnglish() then
  PaGlobal_Menu._categoryData = {
[0] = {
[(PaGlobal_Menu._main)._help] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_HELP"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 201, _y1 = 3, _x2 = 261, _y2 = 63, _isContentOpen = not isGameTypeKR2(), _isNew = false, _isHot = false, _index = 0}
, 
[(PaGlobal_Menu._main)._escape] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_ESCAPE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 387, _y1 = 3, _x2 = 447, _y2 = 63, _isContentOpen = true, _isNew = false, _isHot = false, _index = 1}
, 
[(PaGlobal_Menu._main)._option] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_OPTION"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 325, _y1 = 3, _x2 = 385, _y2 = 63, _isContentOpen = true, _isNew = false, _isHot = false, _index = 2}
, 
[(PaGlobal_Menu._main)._inven] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BAG"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Inventory), _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 449, _y1 = 3, _x2 = 509, _y2 = 63, _isContentOpen = true, _isNew = false, _isHot = false, _index = 3}
, 
[(PaGlobal_Menu._main)._gameExit] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_EXIT"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 263, _y1 = 3, _x2 = 323, _y2 = 63, _isContentOpen = true, _isNew = false, _isHot = false, _index = 4}
, 
[(PaGlobal_Menu._main)._cashShop] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_CASHSHOP"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_CashShop), _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 449, _y1 = 189, _x2 = 509, _y2 = 249, _isContentOpen = not isGameTypeTR(), _isNew = false, _isHot = true, _index = 5}
, _name = "", _count = (PaGlobal_Menu._main)._count}
, 
[1] = {
[(PaGlobal_Menu._contents)._beauty] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BEAUTY"), _hotKey = "F4", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 126, _x2 = 186, _y2 = 186, _isContentOpen = (CppEnums.ContentsServiceType).eContentsServiceType_Commercial == getContentsServiceType(), _isNew = false, _isHot = true, _index = 6}
, 
[(PaGlobal_Menu._contents)._dye] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_DYE"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Dyeing), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 188, _y1 = 188, _x2 = 248, _y2 = 248, _isContentOpen = true, _isNew = false, _isHot = false, _index = 7}
, 
[(PaGlobal_Menu._contents)._pallet] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_COLORMIX"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 2, _y1 = 126, _x2 = 62, _y2 = 186, _isContentOpen = true, _isNew = false, _isHot = false, _index = 8}
, 
[(PaGlobal_Menu._contents)._pet] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_PET"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 374, _y1 = 64, _x2 = 434, _y2 = 124, _isContentOpen = true, _isNew = false, _isHot = true, _index = 9}
, 
[(PaGlobal_Menu._contents)._blackSpirit] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BLACKSPIRIT"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_BlackSpirit), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 2, _y1 = 64, _x2 = 62, _y2 = 124, _isContentOpen = true, _isNew = false, _isHot = false, _index = 10}
, 
[(PaGlobal_Menu._contents)._questInfo] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_QUESTHISTORY"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_QuestHistory), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 64, _x2 = 124, _y2 = 124, _isContentOpen = true, _isNew = false, _isHot = false, _index = 11}
, 
[(PaGlobal_Menu._contents)._skill] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_SKILL"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Skill), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 188, _y1 = 2, _x2 = 248, _y2 = 62, _isContentOpen = true, _isNew = false, _isHot = false, _index = 12}
, 
[(PaGlobal_Menu._contents)._manufacture] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_MANUFACTURE"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Manufacture), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 188, _x2 = 186, _y2 = 248, _isContentOpen = true, _isNew = false, _isHot = false, _index = 13}
, 
[(PaGlobal_Menu._contents)._uiSetting] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_INTERFACEMOVE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 436, _y1 = 126, _x2 = 496, _y2 = 186, _isContentOpen = true, _isNew = false, _isHot = false, _index = 14}
, 
[(PaGlobal_Menu._contents)._dailyStamp] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MSGTITLE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 2, _y1 = 312, _x2 = 62, _y2 = 372, _isContentOpen = (PaGlobal_Menu._contentsGroup)._joinCheckOpen, _isNew = false, _isHot = true, _index = 15}
, 
[(PaGlobal_Menu._contents)._blackSpiritAdventure] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BLACKSPIRIT_TRESURE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 436, _x2 = 186, _y2 = 496, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isBlackSpiritAdventure, _isNew = false, _isHot = false, _index = 16}
, 
[(PaGlobal_Menu._contents)._blackSpiritAdventure2] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BLACKSPIRITADVANTURE2"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 436, _y1 = 64, _x2 = 496, _y2 = 124, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isBlackSpiritAdventure2, _isNew = true, _isHot = false, _index = 17}
, 
[(PaGlobal_Menu._contents)._beautyAlbum] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BEAUTYALBUM"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 374, _x2 = 124, _y2 = 434, _isContentOpen = (PaGlobal_Menu._contentsGroup)._webAlbumOpen, _isNew = false, _isHot = false, _index = 18}
, 
[(PaGlobal_Menu._contents)._photoGallery] = {_string = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SCREENSHOTALBUM_TITLE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 2, _y1 = 250, _x2 = 62, _y2 = 310, _isContentOpen = (PaGlobal_Menu._contentsGroup)._photoGalleryOpen, _isNew = false, _isHot = false, _index = 19}
, _name = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_CATEGORYTITLE_1"), _count = (PaGlobal_Menu._contents)._count}
, 
[2] = {
[(PaGlobal_Menu._cooperation)._localWar] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_LOCALWAR_INFO"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 2, _y1 = 374, _x2 = 62, _y2 = 434, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isLocalwarOpen, _isNew = false, _isHot = false, _index = 20}
, 
[(PaGlobal_Menu._cooperation)._freeFighting] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_FREEFIGHT"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 374, _x2 = 186, _y2 = 434, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isFreeFight, _isNew = false, _isHot = false, _index = 21}
, 
[(PaGlobal_Menu._cooperation)._waveDefence] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WAVE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 374, _y1 = 2, _x2 = 434, _y2 = 62, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isSavageOpen, _isNew = true, _isHot = false, _index = 22}
, 
[(PaGlobal_Menu._cooperation)._arsha] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_COMPETITIONGAME"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 250, _x2 = 186, _y2 = 310, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isContentsArsha, _isNew = false, _isHot = false, _index = 23}
, 
[(PaGlobal_Menu._cooperation)._militia] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MILITIA"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 188, _y1 = 250, _x2 = 248, _y2 = 310, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isMercenaryOpen, _isNew = false, _isHot = true, _index = 24}
, 
[(PaGlobal_Menu._cooperation)._partyFind] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_TITLE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 436, _x2 = 124, _y2 = 496, _isContentOpen = (PaGlobal_Menu._contentsGroup)._partyListOpen, _isNew = false, _isHot = true, _index = 25}
, _name = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_CATEGORYTITLE_2"), _count = (PaGlobal_Menu._cooperation)._count}
, 
[3] = {
[(PaGlobal_Menu._infomation)._keyboard] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_KEY"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Help), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 250, _x2 = 372, _y2 = 310, _isContentOpen = true, _isNew = false, _isHot = false, _index = 26}
, 
[(PaGlobal_Menu._infomation)._productNote] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_PRODUCTIONNOTE"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_ProductionNote), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 188, _y1 = 64, _x2 = 248, _y2 = 124, _isContentOpen = not isGameTypeKR2(), _isNew = false, _isHot = false, _index = 27}
, 
[(PaGlobal_Menu._infomation)._myInfo] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MYINFO"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_PlayerInfo), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 2, _x2 = 124, _y2 = 62, _isContentOpen = true, _isNew = false, _isHot = false, _index = 28}
, 
[(PaGlobal_Menu._infomation)._serverChange] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 250, _x2 = 124, _y2 = 310, _isContentOpen = true, _isNew = false, _isHot = true, _index = 29}
, 
[(PaGlobal_Menu._infomation)._fishEncyclopedia] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_FISHENCYCLOPEDIA"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 188, _x2 = 124, _y2 = 248, _isContentOpen = true, _isNew = false, _isHot = false, _index = 30}
, 
[(PaGlobal_Menu._infomation)._knowledge] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MENTALKNOWLEDGE"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_MentalKnowledge), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 64, _x2 = 186, _y2 = 124, _isContentOpen = true, _isNew = false, _isHot = false, _index = 31}
, 
[(PaGlobal_Menu._infomation)._worldMap] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_WORLDMAP"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_WorldMap), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 2, _x2 = 372, _y2 = 62, _isContentOpen = true, _isNew = false, _isHot = false, _index = 32}
, 
[(PaGlobal_Menu._infomation)._workerList] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WORKERTITLE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 374, _y1 = 250, _x2 = 434, _y2 = 310, _isContentOpen = true, _isNew = false, _isHot = false, _index = 33}
, 
[(PaGlobal_Menu._infomation)._itemMarket] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_ITEMMARKET"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 188, _y1 = 374, _x2 = 248, _y2 = 434, _isContentOpen = true, _isNew = false, _isHot = true, _index = 34}
, 
[(PaGlobal_Menu._infomation)._tradeInfo] = {_string = PAGetString(Defines.StringSheet_RESOURCE, "TRADEMARKET_GRAPH_TXT_COMMERCE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 312, _x2 = 372, _y2 = 372, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isTradeEventOpen, _isNew = false, _isHot = false, _index = 35}
, 
[(PaGlobal_Menu._infomation)._warInfo] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_SIEGE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 374, _x2 = 372, _y2 = 434, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isSiegeEnable, _isNew = false, _isHot = false, _index = 36}
, 
[(PaGlobal_Menu._infomation)._event] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_EVENT"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 250, _y1 = 188, _x2 = 310, _y2 = 248, _isContentOpen = (not isGameTypeKR2() and not isGameTypeEnglish() and not isServerFixedCharge()), _isNew = false, _isHot = false, _index = 37}
, 
[(PaGlobal_Menu._infomation)._steam] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_EXTRACTIONGAME"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 374, _y1 = 188, _x2 = 434, _y2 = 248, _isContentOpen = isGameServiceTypeDev(), _isNew = false, _isHot = false, _index = 38}
, 
[(PaGlobal_Menu._infomation)._update] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_UPDATE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 312, _x2 = 186, _y2 = 372, _isContentOpen = isGameServiceTypeDev(), _isNew = false, _isHot = true, _index = 39}
, 
[(PaGlobal_Menu._infomation)._notice] = {_string = PAGetString(Defines.StringSheet_GAME, "CHATTING_NOTICE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 436, _y1 = 312, _x2 = 496, _y2 = 372, _isContentOpen = isGameTypeEnglish(), _isNew = false, _isHot = false, _index = 40}
, 
[(PaGlobal_Menu._infomation)._masterpiece] = {_string = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MASTERPIECEAUCTION_TITLE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 374, _y1 = 436, _x2 = 434, _y2 = 496, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isMasterpieceOpen, _isNew = true, _isHot = false, _index = 53}
, _name = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_CATEGORYTITLE_3"), _count = (PaGlobal_Menu._infomation)._count}
, 
[4] = {
[(PaGlobal_Menu._community)._guild] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_GUILD"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Guild), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 250, _y1 = 2, _x2 = 310, _y2 = 62, _isContentOpen = true, _isNew = false, _isHot = true, _index = 41}
, 
[(PaGlobal_Menu._community)._friend] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_FRIENDLIST"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_FriendList), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 250, _y1 = 64, _x2 = 310, _y2 = 124, _isContentOpen = true, _isNew = false, _isHot = false, _index = 42}
, 
[(PaGlobal_Menu._community)._mail] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MAIL"), _hotKey = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Mail), _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 64, _x2 = 372, _y2 = 124, _isContentOpen = true, _isNew = false, _isHot = false, _index = 43}
, 
[(PaGlobal_Menu._community)._guildRank] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_GUILDRANKER"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 436, _y1 = 250, _x2 = 496, _y2 = 310, _isContentOpen = true, _isNew = false, _isHot = true, _index = 44}
, 
[(PaGlobal_Menu._community)._lifeRank] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_LIFERANKER"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 436, _y1 = 188, _x2 = 496, _y2 = 248, _isContentOpen = true, _isNew = false, _isHot = false, _index = 45}
, 
[(PaGlobal_Menu._community)._monsterRank] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MONSTERRANKING"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 374, _y1 = 126, _x2 = 434, _y2 = 186, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isMonsterRanking, _isNew = false, _isHot = false, _index = 46}
, 
[(PaGlobal_Menu._community)._chattingFilter] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_CHATTING_FILTER"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 2, _y1 = 436, _x2 = 62, _y2 = 496, _isContentOpen = isGameServiceTypeDev(), _isNew = false, _isHot = false, _index = 47}
, 
[(PaGlobal_Menu._community)._language] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_LANGUAGE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 374, _y1 = 374, _x2 = 434, _y2 = 434, _isContentOpen = isGameServiceTypeDev(), _isNew = false, _isHot = false, _index = 48}
, 
[(PaGlobal_Menu._community)._blackDesertTv] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_TWITCH"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 436, _x2 = 372, _y2 = 496, _isContentOpen = isGameServiceTypeDev(), _isNew = true, _isHot = false, _index = 49}
, 
[(PaGlobal_Menu._community)._socialAction] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_SOCIALACTION"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 126, _x2 = 372, _y2 = 186, _isContentOpen = isGameServiceTypeDev(), _isNew = true, _isHot = false, _index = 50}
, 
[(PaGlobal_Menu._community)._memo] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MEMONAME"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 436, _y1 = 436, _x2 = 496, _y2 = 496, _isContentOpen = (PaGlobal_Menu._contentsGroup)._isMemoOpen, _isNew = true, _isHot = false, _index = 58}
, _name = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_CATEGORYTITLE_4"), _count = (PaGlobal_Menu._community)._count}
, 
[5] = {
[(PaGlobal_Menu._banner)._blackDesertTv] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_TWITCH"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 2, _x2 = 124, _y2 = 62, _isContentOpen = true, _isNew = false, _isHot = false, _index = 51}
, 
[(PaGlobal_Menu._banner)._socialAction] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_SOCIALACTION"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 250, _y1 = 64, _x2 = 310, _y2 = 124, _isContentOpen = true, _isNew = false, _isHot = false, _index = 52}
, _name = "", _count = (PaGlobal_Menu._banner)._count}
, 
[6] = {
[(PaGlobal_Menu._myMenu)._graphic] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_OPTIONSCREEN"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 387, _y1 = 189, _x2 = 447, _y2 = 249, _isContentOpen = true, _isNew = false, _isHot = false, _index = 54}
, 
[(PaGlobal_Menu._myMenu)._sound] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_OPTIONSOUND"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 263, _y1 = 189, _x2 = 323, _y2 = 249, _isContentOpen = true, _isNew = false, _isHot = false, _index = 55}
, 
[(PaGlobal_Menu._myMenu)._game] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_OPTIONGAME"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 201, _y1 = 189, _x2 = 261, _y2 = 249, _isContentOpen = true, _isNew = false, _isHot = false, _index = 56}
, 
[(PaGlobal_Menu._myMenu)._performance] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_OPTIONPERFORMANCE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 325, _y1 = 189, _x2 = 385, _y2 = 249, _isContentOpen = true, _isNew = false, _isHot = false, _index = 57}
, _name = "", _count = (PaGlobal_Menu._myMenu)._count}
}
  -- DECOMPILER ERROR at PC2446: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.Init = function(self)
  -- function num : 0_0
  Panel_Menu_New:SetShow(false)
  Panel_Menu_New:setGlassBackground(true)
  Panel_Menu_New:ActiveMouseEventEffect(true)
  Panel_Menu_New:RegisterShowEventFunc(true, "PaGlobal_Menu:ShowAni()")
  Panel_Menu_New:RegisterShowEventFunc(false, "PaGlobal_Menu:HideAni()")
  do
    local group_0 = Panel_Menu_New:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT_GROUPMOVE)
    group_0:setConsoleKeyEventForLUA("ToClient_onGroupPrevMoveEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_UP)
    group_0:setConsoleKeyEventForLUA("ToClient_onGroupNextMoveEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_DOWN)
    for index = 0, self._categoryCount - 1 do
      (((self._ui)._radioButtonGroup)[index]):SetCheck(index == 0)
      ;
      (((self._ui)._radioButtonGroup)[index]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      ;
      (((self._ui)._radioButtonGroup)[index]):SetText(((self._categoryData)[index + 1])._name)
      group_0:addControl(index, 0, 4, 1, ((self._ui)._radioButtonGroup)[index])
    end
    ;
    ((self._ui)._radioButtonCustom):SetCheck(false)
    ;
    ((self._ui)._radioButtonCustom):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    ((self._ui)._radioButtonCustom):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MYMENU"))
    for index = 0, self._maxUiSlotCount - 1 do
      -- DECOMPILER ERROR at PC118: Confused about usage of register: R6 in 'UnsetPending'

      ((self._ui)._subButton)[index] = (UI.getChildControl)((self._ui)._categoryMenuBg, "StaticText_ButtonBg_" .. R10_PC116)
      ;
      (((self._ui)._subButton)[index]):SetSize(95, 95)
      ;
      (((self._ui)._subButton)[index]):SetShow(false)
      -- DECOMPILER ERROR at PC141: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((self._ui)._subIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Button_MenuIcon")
      -- DECOMPILER ERROR at PC151: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((self._ui)._hotKey)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "StaticText_HotKey")
      -- DECOMPILER ERROR at PC161: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((self._ui)._newIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Static_NewIcon")
      -- DECOMPILER ERROR at PC171: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((self._ui)._hotIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Static_HotIcon")
      -- DECOMPILER ERROR at PC181: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((self._ui)._checkIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Static_CheckIcon")
    end
    self:SetMainMenu()
    self:SetBanner()
    self:CustomIndex_Init()
    self:SetCustomWindow()
    self:ResetVertexAni()
    self._isLeft = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MenuOpenWay) == 0
    ;
    ((self._ui)._isLeft):SetCheck(self._isLeft)
    ;
    ((self._ui)._isRight):SetCheck(not self._isLeft)
    ;
    ((self._ui)._isLeft):addInputEvent("Mouse_LUp", "PaGlobal_Menu:SetMenuOpenWay(true)")
    ;
    ((self._ui)._isLeft):addInputEvent("Mouse_On", "PaGlobal_Menu:HandleOver_MenuOpenWay(" .. 0 .. ")")
    ;
    ((self._ui)._isLeft):addInputEvent("Mouse_Out", "PaGlobal_Menu:CustomWindow_TooltipHide()")
    ;
    ((self._ui)._isRight):addInputEvent("Mouse_LUp", "PaGlobal_Menu:SetMenuOpenWay(false)")
    ;
    ((self._ui)._isRight):addInputEvent("Mouse_On", "PaGlobal_Menu:HandleOver_MenuOpenWay(" .. 1 .. ")")
    ;
    ((self._ui)._isRight):addInputEvent("Mouse_Out", "PaGlobal_Menu:CustomWindow_TooltipHide()")
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

  -- DECOMPILER ERROR at PC2450: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HandleOver_MenuOpenWay = function(self, openType)
  -- function num : 0_1
  local uiControl, desc = nil
  if openType == 0 then
    uiControl = (self._ui)._isLeft
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_LEFTSLIDE")
  else
    if openType == 1 then
      uiControl = (self._ui)._isRight
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_RIGHTSLIDE")
    end
  end
  TooltipSimple_Show(uiControl, desc)
end

  -- DECOMPILER ERROR at PC2454: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HandleOver_ChangeMenu = function(self)
  -- function num : 0_2
  TooltipSimple_Show(((self._ui)._main)._btnChange, PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MENU_CHANGEUI"))
end

  -- DECOMPILER ERROR at PC2458: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetMainMenu = function(self)
  -- function num : 0_3
  local group_2 = Panel_Menu_New:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT_GROUPMOVE)
  group_2:setConsoleKeyEventForLUA("ToClient_onGroupNextMoveEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_DOWN)
  for index = 0, (self._main)._count - 1 do
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R6 in 'UnsetPending'

    ((self._ui)._main)[index] = (UI.getChildControl)((self._ui)._mainMenuBg, "Button_MainMenu_" .. index)
    ;
    (((self._ui)._main)[index]):SetText((((self._categoryData)[0])[index])._string)
    ;
    (((self._ui)._main)[index]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:HandleClicked_MenuButton(" .. index .. "," .. 0 .. ")")
    ;
    (((self._ui)._main)[index]):addInputEvent("Mouse_On", "PaGlobal_Menu:HandleOvered_MainMenuButon(" .. index .. ")")
    ;
    (((self._ui)._main)[index]):addInputEvent("Mouse_Out", "")
    self:ChangeTexture(index, 0, index, nil, true)
    group_2:addControl(index, 0, (self._main)._count, 1, ((self._ui)._main)[index])
  end
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._main)._btnChange = (UI.getChildControl)(Panel_Menu_New, "Button_Change")
  ;
  (((self._ui)._main)._btnChange):addInputEvent("Mouse_LUp", "ChangeUI_Menu_New()")
  ;
  (((self._ui)._main)._btnChange):addInputEvent("Mouse_On", "PaGlobal_Menu:HandleOver_ChangeMenu()")
  ;
  (((self._ui)._main)._btnChange):addInputEvent("Mouse_Out", "PaGlobal_Menu:CustomWindow_TooltipHide()")
end

  -- DECOMPILER ERROR at PC2462: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetBanner = function(self)
  -- function num : 0_4
  for index = 0, (self._banner)._count - 1 do
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._banner)[index] = (UI.getChildControl)((self._ui)._bottomBannerBg, "Button_Banner_" .. index)
    ;
    (((self._ui)._banner)[index]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:HandleClicked_MenuButton(" .. index .. "," .. 5 .. ")")
    ;
    (((self._ui)._banner)[index]):addInputEvent("Mouse_On", "PaGlobal_Menu:HandleOvered_Banner(" .. index .. ")")
    ;
    (((self._ui)._banner)[index]):addInputEvent("Mouse_Out", "")
    ;
    (((self._ui)._banner)[index]):SetText((((self._categoryData)[5])[index])._string)
  end
end

  -- DECOMPILER ERROR at PC2466: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetCustomWindow = function(self)
  -- function num : 0_5
  local realIndex = 0
  for cIndex = 1, self._categoryCount do
    for mIndex = 0, ((self._categoryData)[cIndex])._count - 1 do
      local categoryData = ((self._categoryData)[cIndex])[mIndex]
      -- DECOMPILER ERROR at PC31: Confused about usage of register: R11 in 'UnsetPending'

      if categoryData._isContentOpen then
        ((self._ui)._customButtonBg)[realIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._customWindow, "CustomButtonBg_" .. realIndex)
        CopyBaseProperty(((self._ui)._custom)._templeteButtonBg, ((self._ui)._customButtonBg)[realIndex])
        ;
        (((self._ui)._customButtonBg)[realIndex]):SetPosX(17 + realIndex % 7 * 45)
        ;
        (((self._ui)._customButtonBg)[realIndex]):SetPosY(132 + (math.floor)(realIndex / 7) * 45)
        ;
        (((self._ui)._customButtonBg)[realIndex]):SetShow(true)
        -- DECOMPILER ERROR at PC78: Confused about usage of register: R11 in 'UnsetPending'

        ;
        ((self._ui)._customButton)[realIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, (self._ui)._customWindow, "CustomButton_" .. realIndex)
        CopyBaseProperty(((self._ui)._custom)._templeteButton, ((self._ui)._customButton)[realIndex])
        ;
        (((self._ui)._customButton)[realIndex]):ChangeTextureInfoName(categoryData._path)
        local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._customButton)[realIndex], categoryData._x1, categoryData._y1, categoryData._x2, categoryData._y2)
        ;
        ((((self._ui)._customButton)[realIndex]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((self._ui)._customButton)[realIndex]):setRenderTexture((((self._ui)._customButton)[realIndex]):getBaseTexture())
        ;
        (((self._ui)._customButton)[realIndex]):SetPosX(17 + realIndex % 7 * 45)
        ;
        (((self._ui)._customButton)[realIndex]):SetPosY(132 + (math.floor)(realIndex / 7) * 45)
        ;
        (((self._ui)._customButton)[realIndex]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:SetChangeMenu(" .. cIndex .. "," .. mIndex .. "," .. realIndex .. ")")
        ;
        (((self._ui)._customButton)[realIndex]):addInputEvent("Mouse_On", "PaGlobal_Menu:CustomWindow_OverEffect(" .. realIndex .. "," .. categoryData._index .. ")")
        ;
        (((self._ui)._customButton)[realIndex]):addInputEvent("Mouse_Out", "PaGlobal_Menu:CustomWindow_TooltipHide()")
        realIndex = realIndex + 1
      end
    end
  end
  for mIndex = 0, ((self._categoryData)[6])._count - 1 do
    local categoryData = ((self._categoryData)[6])[mIndex]
    -- DECOMPILER ERROR at PC204: Confused about usage of register: R7 in 'UnsetPending'

    if categoryData._isContentOpen then
      ((self._ui)._customButtonBg)[realIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._customWindow, "CustomButtonBg_" .. realIndex)
      CopyBaseProperty(((self._ui)._custom)._templeteButtonBg, ((self._ui)._customButtonBg)[realIndex])
      ;
      (((self._ui)._customButtonBg)[realIndex]):SetPosX(17 + (realIndex) % 7 * 45)
      ;
      (((self._ui)._customButtonBg)[realIndex]):SetPosY(132 + (math.floor)((realIndex) / 7) * 45)
      ;
      (((self._ui)._customButtonBg)[realIndex]):SetShow(true)
      -- DECOMPILER ERROR at PC251: Confused about usage of register: R7 in 'UnsetPending'

      ;
      ((self._ui)._customButton)[realIndex] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, (self._ui)._customWindow, "CustomButton_" .. realIndex)
      CopyBaseProperty(((self._ui)._custom)._templeteButton, ((self._ui)._customButton)[realIndex])
      ;
      (((self._ui)._customButton)[realIndex]):ChangeTextureInfoName(categoryData._path)
      local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._customButton)[realIndex], categoryData._x1, categoryData._y1, categoryData._x2, categoryData._y2)
      ;
      ((((self._ui)._customButton)[realIndex]):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((self._ui)._customButton)[realIndex]):setRenderTexture((((self._ui)._customButton)[realIndex]):getBaseTexture())
      ;
      (((self._ui)._customButton)[realIndex]):SetPosX(17 + (realIndex) % 7 * 45)
      ;
      (((self._ui)._customButton)[realIndex]):SetPosY(132 + (math.floor)((realIndex) / 7) * 45)
      ;
      (((self._ui)._customButton)[realIndex]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:SetChangeMenu(" .. 6 .. "," .. mIndex .. "," .. realIndex .. ")")
      ;
      (((self._ui)._customButton)[realIndex]):addInputEvent("Mouse_On", "PaGlobal_Menu:CustomWindow_OverEffect_MyMenu(" .. realIndex .. "," .. categoryData._index .. ")")
      ;
      (((self._ui)._customButton)[realIndex]):addInputEvent("Mouse_Out", "PaGlobal_Menu:CustomWindow_TooltipHide()")
      ;
      (((self._ui)._customButton)[realIndex]):SetColor((Defines.Color).C_FFB5FF6D)
      realIndex = realIndex + 1
    end
  end
  -- DECOMPILER ERROR at PC369: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._custom)._effect = (UI.createAndCopyBasePropertyControl)((self._ui)._customWindow, "Static_Effect", (self._ui)._customWindow, "Static_Effect_Copy")
  ;
  (((self._ui)._custom)._effect):SetShow(true)
  ;
  (((self._ui)._custom)._effect):SetPosX(16)
  ;
  (((self._ui)._custom)._effect):SetPosY(131)
  -- DECOMPILER ERROR at PC399: Confused about usage of register: R2 in 'UnsetPending'

  ;
  ((self._ui)._custom)._checkIcon = (UI.createAndCopyBasePropertyControl)((self._ui)._customWindow, "Static_Check", (self._ui)._customWindow, "Static_CheckIcon_Copy")
  ;
  (((self._ui)._custom)._checkIcon):SetSize(40, 40)
  ;
  (((self._ui)._custom)._checkIcon):SetShow(false)
  do
    local isWide = getScreenSizeY() >= 800
    -- DECOMPILER ERROR at PC426: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self._ui)._buttonCustom = (UI.getChildControl)((self._ui)._categoryMenuBg, "Button_EditCustom")
    -- DECOMPILER ERROR at PC434: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self._ui)._buttonCustom720 = (UI.getChildControl)((self._ui)._categoryMenuBg, "Button_EditCustom720")
    -- DECOMPILER ERROR at PC442: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self._ui)._buttonSaveCustom = (UI.getChildControl)((self._ui)._customWindow, "Button_Save720")
    -- DECOMPILER ERROR at PC450: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self._ui)._buttonCancelCustom = (UI.getChildControl)((self._ui)._customWindow, "Button_Cancel720")
    ;
    (((self._ui)._custom)._bg):SetSize((((self._ui)._custom)._bg):GetSizeX(), 55 + (math.floor)((realIndex - 1) / 7) * 45)
    ;
    ((self._ui)._customWindow):SetSize(((self._ui)._customWindow):GetSizeX(), 223 + (math.floor)((realIndex - 1) / 7) * 45)
    ;
    ((self._ui)._buttonSaveCustom):ComputePos()
    ;
    ((self._ui)._buttonCancelCustom):ComputePos()
    ;
    ((self._ui)._customWindow):SetShow(false)
    ;
    ((self._ui)._buttonCustom):addInputEvent("Mouse_LUp", "PaGlobal_Menu:SetCustomMode()")
    ;
    ((self._ui)._buttonCustom720):addInputEvent("Mouse_LUp", "PaGlobal_Menu:SetCustomMode()")
    ;
    ((self._ui)._buttonSaveCustom):addInputEvent("Mouse_LUp", "PaGlobal_Menu:SaveChangeMenu()")
    ;
    ((self._ui)._buttonCancelCustom):addInputEvent("Mouse_LUp", "PaGlobal_Menu:CancelChangeMenu()")
    ;
    ((self._ui)._buttonCustom):SetShow(isWide)
    ;
    ((self._ui)._buttonCustom720):SetShow(not isWide)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

  -- DECOMPILER ERROR at PC2470: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetMenuOpenWay = function(self, isLeft)
  -- function num : 0_6
  local way = 0
  if not isLeft then
    way = 1
  end
  self._isLeft = isLeft
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MenuOpenWay, way, (CppEnums.VariableStorageType).eVariableStorageType_User)
end

  -- DECOMPILER ERROR at PC2474: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.ComboGuideShowToggle = function(self)
  -- function num : 0_7
  PaGlobal_Menu:SetShow(false)
  PaGlobal_ConsoleKeyFirstCombo:showToggle()
end

  -- DECOMPILER ERROR at PC2478: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.ChangeTexture = function(self, menuIndex, categoryIndex, uiIndex, isCustom, isMain)
  -- function num : 0_8
  if categoryIndex == nil then
    categoryIndex = self._currentCategoryIndex
  end
  local menuButton, icon, newIcon, hotIcon, checkIcon = nil, nil, nil, nil, nil
  if categoryIndex == 0 and isMain then
    icon = ((self._ui)._main)[menuIndex]
  else
    menuButton = ((self._ui)._subButton)[uiIndex]
    icon = ((self._ui)._subIcon)[uiIndex]
    newIcon = ((self._ui)._newIcon)[uiIndex]
    hotIcon = ((self._ui)._hotIcon)[uiIndex]
    checkIcon = ((self._ui)._checkIcon)[uiIndex]
  end
  local categoryData = ((self._categoryData)[categoryIndex])[menuIndex]
  if categoryData._isContentOpen then
    icon:ChangeTextureInfoName(categoryData._path)
    if menuIndex == (PaGlobal_Menu._infomation)._steam and isGameTypeSA() then
      categoryData._x1 = 250
      categoryData._y1 = 312
      categoryData._x2 = 310
      categoryData._y2 = 372
    end
    local x1, y1, x2, y2 = setTextureUV_Func(icon, categoryData._x1, categoryData._y1, categoryData._x2, categoryData._y2)
    ;
    (icon:getBaseTexture()):setUV(x1, y1, x2, y2)
    icon:setRenderTexture(icon:getBaseTexture())
  else
    do
      icon:ChangeTextureInfoName("")
      if isCustom then
        icon:SetColor((self._color)._customIconColor)
      else
        if categoryData._isNew then
          icon:SetColor((self._color)._newIconColor)
        else
          if categoryData._isHot then
            icon:SetColor((self._color)._hotIconColor)
          else
            icon:SetColor((self._color)._defaultIconColor)
          end
        end
      end
      if menuButton ~= nil then
        checkIcon:SetShow(false)
        if isCustom then
          newIcon:SetShow(false)
          hotIcon:SetShow(false)
          menuButton:ChangeTextureInfoName("Renewal/Button/Console_Btn_ESCMenu_02.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 2, 98, 98)
          ;
          (menuButton:getBaseTexture()):setUV(x1, y1, x2, y2)
          menuButton:setRenderTexture(menuButton:getBaseTexture())
          menuButton:ChangeOnTextureInfoName("Renewal/Button/Console_Btn_ESCMenu_02.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 101, 98, 197)
          ;
          (menuButton:getOnTexture()):setUV(x1, y1, x2, y2)
          menuButton:ChangeClickTextureInfoName("Renewal/Button/Console_Btn_ESCMenu_02.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 200, 98, 296)
          ;
          (menuButton:getClickTexture()):setUV(x1, y1, x2, y2)
          menuButton:SetFontColor((self._color)._customNormalFontColor)
          menuButton:SetOverFontColor((self._color)._customOverFontColor)
        else
          do
            if not categoryData._isContentOpen then
              menuButton:ChangeTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 2, 98, 98)
              ;
              (menuButton:getBaseTexture()):setUV(x1, y1, x2, y2)
              menuButton:setRenderTexture(menuButton:getBaseTexture())
              menuButton:ChangeOnTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 101, 98, 197)
              ;
              (menuButton:getOnTexture()):setUV(x1, y1, x2, y2)
              menuButton:ChangeClickTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 200, 98, 296)
              ;
              (menuButton:getClickTexture()):setUV(x1, y1, x2, y2)
              menuButton:SetFontColor((self._color)._defaultNormalFontColor)
              menuButton:SetOverFontColor((self._color)._defaultOverFontColor)
              return 
            end
            do
              if newIcon ~= nil then
                newIcon:SetShow(categoryData._isNew)
              end
              if hotIcon ~= nil then
                hotIcon:SetShow(categoryData._isHot)
              end
              if categoryData._isNew then
                menuButton:ChangeTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 403, 399, 499, 495)
                ;
                (menuButton:getBaseTexture()):setUV(x1, y1, x2, y2)
                menuButton:setRenderTexture(menuButton:getBaseTexture())
                menuButton:ChangeOnTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 403, 299, 499, 395)
                ;
                (menuButton:getOnTexture()):setUV(x1, y1, x2, y2)
                menuButton:ChangeClickTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 403, 299, 499, 395)
                ;
                (menuButton:getClickTexture()):setUV(x1, y1, x2, y2)
                menuButton:SetFontColor((self._color)._newNormalFontColor)
                menuButton:SetOverFontColor((self._color)._newOverFontColor)
              else
                do
                  if categoryData._isHot then
                    menuButton:ChangeTextureInfoName("Renewal/Button/Console_Btn_ESCMenu_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 2, 98, 98)
                    ;
                    (menuButton:getBaseTexture()):setUV(x1, y1, x2, y2)
                    menuButton:setRenderTexture(menuButton:getBaseTexture())
                    menuButton:ChangeOnTextureInfoName("Renewal/Button/Console_Btn_ESCMenu_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 101, 98, 197)
                    ;
                    (menuButton:getOnTexture()):setUV(x1, y1, x2, y2)
                    menuButton:ChangeClickTextureInfoName("Renewal/Button/Console_Btn_ESCMenu_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 200, 98, 296)
                    ;
                    (menuButton:getClickTexture()):setUV(x1, y1, x2, y2)
                    menuButton:SetFontColor((self._color)._hotNormalFontColor)
                    menuButton:SetOverFontColor((self._color)._hotOverFontColor)
                  else
                    do
                      menuButton:ChangeTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
                      local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 2, 98, 98)
                      ;
                      (menuButton:getBaseTexture()):setUV(x1, y1, x2, y2)
                      menuButton:setRenderTexture(menuButton:getBaseTexture())
                      menuButton:ChangeOnTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
                      local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 101, 98, 197)
                      ;
                      (menuButton:getOnTexture()):setUV(x1, y1, x2, y2)
                      menuButton:ChangeClickTextureInfoName("New_UI_Common_forLua/Default/Console_Btn_ESCMenu_01.dds")
                      local x1, y1, x2, y2 = setTextureUV_Func(menuButton, 2, 200, 98, 296)
                      ;
                      (menuButton:getClickTexture()):setUV(x1, y1, x2, y2)
                      menuButton:SetFontColor((self._color)._defaultNormalFontColor)
                      menuButton:SetOverFontColor((self._color)._defaultOverFontColor)
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

  Menu_ConsoleGroupMove = function(eventType)
  -- function num : 0_9
  if (CppEnums.PA_CONSOLE_UI_INPUT_TYPE).eCONSOLE_UI_INPUT_TYPE_UP == eventType then
    ToClient_onGroupPrevMoveEvent()
  end
end

  -- DECOMPILER ERROR at PC2484: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetSubButtonIcon = function(self, count)
  -- function num : 0_10
  for index = 0, self._maxUiSlotCount - 1 do
    (((self._ui)._subButton)[index]):SetSize(95, 95)
    ;
    (((self._ui)._subButton)[index]):SetShow(false)
  end
  Panel_Menu_New:deleteConsoleUIGroup(1)
  local group_1 = Panel_Menu_New:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NORANGE_GROUPMOVE)
  group_1:setConsoleKeyEventForLUA("Menu_ConsoleGroupMove", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_UP)
  local realIndex = 0
  if count == 6 then
    for index = 0, 7 do
      if index == 0 or index == 6 then
        (((self._ui)._subButton)[index]):SetSize(200, 95)
        ;
        (((self._ui)._subButton)[index]):SetShow(true)
        group_1:addControl(index % 4, (math.floor)(index / 4), 4, 2, ((self._ui)._subButton)[index])
      else
        if index == 1 then
          (((self._ui)._subButton)[index]):SetShow(false)
          group_1:addFakeControl(1, 0, 4, 2, 0, 0)
        else
          if index == 7 then
            (((self._ui)._subButton)[index]):SetShow(false)
            group_1:addFakeControl(3, 1, 4, 2, 2, 1)
          else
            ;
            (((self._ui)._subButton)[index]):SetShow(true)
            group_1:addControl(index % 4, (math.floor)(index / 4), 4, 2, ((self._ui)._subButton)[index])
          end
        end
      end
    end
  else
    do
      if count == 7 then
        for index = 0, 7 do
          if index == 0 then
            (((self._ui)._subButton)[index]):SetSize(200, 95)
            ;
            (((self._ui)._subButton)[index]):SetShow(true)
            group_1:addControl(index % 4, (math.floor)(index / 4), 4, 2, ((self._ui)._subButton)[index])
          else
            if index == 1 then
              (((self._ui)._subButton)[index]):SetShow(false)
              group_1:addFakeControl(1, 0, 4, 2, 0, 0)
            else
              ;
              (((self._ui)._subButton)[index]):SetShow(true)
              group_1:addControl(index % 4, (math.floor)(index / 4), 4, 2, ((self._ui)._subButton)[index])
            end
          end
        end
      else
        do
          if count == 9 then
            for index = 0, 11 do
              if index == 0 or index == 5 or index == 10 then
                (((self._ui)._subButton)[index]):SetSize(200, 95)
                ;
                (((self._ui)._subButton)[index]):SetShow(true)
                group_1:addControl(index % 4, (math.floor)(index / 4), 4, 3, ((self._ui)._subButton)[index])
              else
                if index == 1 then
                  (((self._ui)._subButton)[index]):SetShow(false)
                  group_1:addFakeControl(1, 0, 4, 3, 0, 0)
                else
                  if index == 6 then
                    (((self._ui)._subButton)[index]):SetShow(false)
                    group_1:addFakeControl(2, 1, 4, 3, 1, 1)
                  else
                    if index == 11 then
                      (((self._ui)._subButton)[index]):SetShow(false)
                      group_1:addFakeControl(3, 2, 4, 3, 2, 2)
                    else
                      ;
                      (((self._ui)._subButton)[index]):SetShow(true)
                      group_1:addControl(index % 4, (math.floor)(index / 4), 4, 3, ((self._ui)._subButton)[index])
                    end
                  end
                end
              end
            end
          else
            do
              if count == 10 then
                for index = 0, 11 do
                  if index == 0 or index == 10 then
                    (((self._ui)._subButton)[index]):SetSize(200, 95)
                    ;
                    (((self._ui)._subButton)[index]):SetShow(true)
                    group_1:addControl(index % 4, (math.floor)(index / 4), 4, 3, ((self._ui)._subButton)[index])
                  else
                    if index == 1 then
                      (((self._ui)._subButton)[index]):SetShow(false)
                      group_1:addFakeControl(1, 0, 4, 3, 0, 0)
                    else
                      if index == 11 then
                        (((self._ui)._subButton)[index]):SetShow(false)
                        group_1:addFakeControl(3, 2, 4, 3, 2, 2)
                      else
                        ;
                        (((self._ui)._subButton)[index]):SetShow(true)
                        group_1:addControl(index % 4, (math.floor)(index / 4), 4, 3, ((self._ui)._subButton)[index])
                      end
                    end
                  end
                end
              else
                do
                  if count == 11 then
                    for index = 0, 11 do
                      if index == 0 then
                        (((self._ui)._subButton)[index]):SetSize(200, 95)
                        ;
                        (((self._ui)._subButton)[index]):SetShow(true)
                        group_1:addControl(index % 4, (math.floor)(index / 4), 4, 3, ((self._ui)._subButton)[index])
                      else
                        if index == 1 then
                          (((self._ui)._subButton)[index]):SetShow(false)
                          group_1:addFakeControl(1, 0, 4, 3, 0, 0)
                        else
                          ;
                          (((self._ui)._subButton)[index]):SetShow(true)
                          group_1:addControl(index % 4, (math.floor)(index / 4), 4, 3, ((self._ui)._subButton)[index])
                        end
                      end
                    end
                  else
                    do
                      if count == 13 then
                        for index = 0, 15 do
                          if index == 2 or index == 8 or index == 14 then
                            (((self._ui)._subButton)[index]):SetSize(200, 95)
                            ;
                            (((self._ui)._subButton)[index]):SetShow(true)
                            group_1:addControl(index % 4, index / 4, 4, 4, ((self._ui)._subButton)[index])
                          else
                            if index == 3 then
                              (((self._ui)._subButton)[index]):SetShow(false)
                              group_1:addFakeControl(3, 0, 4, 4, 2, 0)
                            else
                              if index == 9 then
                                (((self._ui)._subButton)[index]):SetShow(false)
                                group_1:addFakeControl(1, 2, 4, 4, 1, 1)
                              else
                                if index == 15 then
                                  (((self._ui)._subButton)[index]):SetShow(false)
                                  group_1:addFakeControl(3, 3, 4, 4, 2, 3)
                                else
                                  ;
                                  (((self._ui)._subButton)[index]):SetShow(true)
                                  group_1:addControl(index % 4, index / 4, 4, 4, ((self._ui)._subButton)[index])
                                end
                              end
                            end
                          end
                        end
                      else
                        do
                          if count == 14 then
                            for index = 0, 15 do
                              if index == 1 or index == 14 then
                                (((self._ui)._subButton)[index]):SetSize(200, 95)
                                ;
                                (((self._ui)._subButton)[index]):SetShow(true)
                                group_1:addControl(index % 4, index / 4, 4, 4, ((self._ui)._subButton)[index])
                              else
                                if index == 2 then
                                  (((self._ui)._subButton)[index]):SetShow(false)
                                  group_1:addFakeControl(2, 0, 4, 4, 1, 0)
                                else
                                  if index == 15 then
                                    (((self._ui)._subButton)[index]):SetShow(false)
                                    group_1:addFakeControl(3, 3, 4, 4, 2, 3)
                                  else
                                    ;
                                    (((self._ui)._subButton)[index]):SetShow(true)
                                    group_1:addControl(index % 4, index / 4, 4, 4, ((self._ui)._subButton)[index])
                                  end
                                end
                              end
                            end
                          else
                            do
                              if count == 15 then
                                for index = 0, 15 do
                                  if index == 0 then
                                    (((self._ui)._subButton)[index]):SetSize(200, 95)
                                    ;
                                    (((self._ui)._subButton)[index]):SetShow(true)
                                    group_1:addControl(index % 4, index / 4, 4, 4, ((self._ui)._subButton)[index])
                                  else
                                    if index == 1 then
                                      (((self._ui)._subButton)[index]):SetShow(false)
                                      group_1:addFakeControl(1, 0, 4, 4, 0, 0)
                                    else
                                      ;
                                      (((self._ui)._subButton)[index]):SetShow(true)
                                      group_1:addControl(index % 4, index / 4, 4, 4, ((self._ui)._subButton)[index])
                                    end
                                  end
                                end
                              else
                                do
                                  for index = 0, count - 1 do
                                    (((self._ui)._subButton)[index]):SetShow(true)
                                    if (((self._ui)._subButton)[index]):GetShow() then
                                      group_1:addControl(index % 4, (math.floor)(index / 4), 4, (math.floor)(count / 4), ((self._ui)._subButton)[index])
                                    end
                                  end
                                  do
                                    for index = 0, self._maxUiSlotCount - 1 do
                                      (((self._ui)._subIcon)[index]):ComputePos()
                                      ;
                                      (((self._ui)._hotKey)[index]):ComputePos()
                                      ;
                                      (((self._ui)._checkIcon)[index]):ComputePos()
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

  -- DECOMPILER ERROR at PC2488: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HandleClicked_CategoryGroup = function(self, index)
  -- function num : 0_11
  if self._isCustomMode then
    for categoryIndex = 0, self._categoryCount - 1 do
      (((self._ui)._radioButtonGroup)[categoryIndex]):SetCheck(false)
    end
    ;
    ((self._ui)._radioButtonCustom):SetCheck(true)
    return 
  end
  self:ResetVertexAni()
  for categoryIndex = 0, self._categoryCount - 1 do
    (((self._ui)._radioButtonGroup)[categoryIndex]):SetCheck(index == categoryIndex + 1)
  end
  ;
  ((self._ui)._radioButtonCustom):SetCheck(false)
  ;
  ((self._ui)._buttonCustom):SetShow(false)
  ;
  ((self._ui)._buttonCustom720):SetShow(false)
  local count = ((self._categoryData)[index])._count
  local viewableCount = 0
  for menuIndex = 0, count - 1 do
    if (((self._categoryData)[index])[menuIndex])._isContentOpen then
      viewableCount = viewableCount + 1
    end
  end
  self:SetSubButtonIcon(viewableCount)
  local realIndex = 0
  do
    local viewableCount = 0
    for menuIndex = 0, count - 1 do
      if (((self._categoryData)[index])[menuIndex])._isContentOpen then
        if ((self._ui)._subButton)[viewableCount + realIndex] ~= nil and not (((self._ui)._subButton)[viewableCount + realIndex]):GetShow() then
          realIndex = realIndex + 1
        end
        if viewableCount + (realIndex) <= count then
          (((self._ui)._subButton)[viewableCount + (realIndex)]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
          ;
          (((self._ui)._subButton)[viewableCount + (realIndex)]):SetText((((self._categoryData)[index])[menuIndex])._string)
          ;
          (((self._ui)._hotKey)[viewableCount + (realIndex)]):SetText((((self._categoryData)[index])[menuIndex])._hotKey)
          self:ChangeTexture(menuIndex, index, viewableCount + (realIndex))
          ;
          (((self._ui)._subButton)[viewableCount + (realIndex)]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:HandleClicked_MenuButton(" .. menuIndex .. ")")
          ;
          (((self._ui)._subButton)[viewableCount + (realIndex)]):addInputEvent("Mouse_On", "PaGlobal_Menu:SetVertexAni(" .. viewableCount + (realIndex) .. ")")
        end
        viewableCount = viewableCount + 1
      end
    end
    self._currentCategoryIndex = index
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

  -- DECOMPILER ERROR at PC2492: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HandleClicked_CustomCategory = function(self, isCustom)
  -- function num : 0_12
  self:ResetVertexAni()
  for categoryIndex = 0, self._categoryCount - 1 do
    (((self._ui)._radioButtonGroup)[categoryIndex]):SetCheck(false)
  end
  ;
  ((self._ui)._radioButtonCustom):SetCheck(true)
  local count = #self._customIndex + 1
  self:SetSubButtonIcon(count)
  local realIndex = 0
  for menuIndex = 0, count - 1 do
    if not (((self._ui)._subButton)[menuIndex + realIndex]):GetShow() then
      realIndex = realIndex + 1
    end
    local temp = {}
    temp = self:Check_MenuIndex((self._customIndex)[menuIndex])
    if (((self._categoryData)[temp._categoryIndex])[temp._menuIndex])._isContentOpen then
      (((self._ui)._subButton)[menuIndex + (realIndex)]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      ;
      (((self._ui)._subButton)[menuIndex + (realIndex)]):SetText((((self._categoryData)[temp._categoryIndex])[temp._menuIndex])._string)
      ;
      (((self._ui)._hotKey)[menuIndex + (realIndex)]):SetText((((self._categoryData)[temp._categoryIndex])[temp._menuIndex])._hotKey)
      self:ChangeTexture(temp._menuIndex, temp._categoryIndex, menuIndex + (realIndex), isCustom)
      ;
      (((self._ui)._subButton)[menuIndex + (realIndex)]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:HandleClicked_MenuButton(" .. temp._menuIndex .. "," .. temp._categoryIndex .. "," .. menuIndex + (realIndex) .. ")")
      ;
      (((self._ui)._subButton)[menuIndex + (realIndex)]):addInputEvent("Mouse_On", "PaGlobal_Menu:SetVertexAni(" .. menuIndex + (realIndex) .. ")")
    else
      ;
      (((self._ui)._subButton)[menuIndex + (realIndex)]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      ;
      (((self._ui)._subButton)[menuIndex + (realIndex)]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_NOTSETTING"))
      ;
      (((self._ui)._hotKey)[menuIndex + (realIndex)]):SetText("")
      self:ChangeTexture(temp._menuIndex, temp._categoryIndex, menuIndex + (realIndex), isCustom)
      ;
      (((self._ui)._subButton)[menuIndex + (realIndex)]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:HandleClicked_MenuButton(" .. temp._menuIndex .. "," .. temp._categoryIndex .. "," .. menuIndex + (realIndex) .. ")")
      ;
      (((self._ui)._subButton)[menuIndex + (realIndex)]):addInputEvent("Mouse_On", "PaGlobal_Menu:SetVertexAni(" .. menuIndex + (realIndex) .. ")")
    end
  end
  do
    local isWide = getScreenSizeY() >= 800
    ;
    ((self._ui)._buttonCustom):SetShow(isWide)
    ;
    ((self._ui)._buttonCustom720):SetShow(not isWide)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

  -- DECOMPILER ERROR at PC2496: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.Check_MenuIndex = function(self, index)
  -- function num : 0_13
  local rv = {}
  for cIndex = 0, self._categoryCount do
    local menuCount = ((self._categoryData)[cIndex])._count
    for mIndex = 0, menuCount - 1 do
      local categoryData = ((self._categoryData)[cIndex])[mIndex]
      if index == categoryData._index then
        rv._categoryIndex = cIndex
        rv._menuIndex = mIndex
        return rv
      end
    end
  end
  for mIndex = 0, ((self._categoryData)[6])._count - 1 do
    local categoryData = ((self._categoryData)[6])[mIndex]
    if index == categoryData._index then
      rv._categoryIndex = 6
      rv._menuIndex = mIndex
      return rv
    end
  end
  return nil
end

  -- DECOMPILER ERROR at PC2500: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetCustomMode = function(self)
  -- function num : 0_14
  self:CustomWindow_Init()
  self._isCustomMode = not self._isCustomMode
  if self._isCustomMode then
    ((self._ui)._buttonCustom):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_EDITCLOSE"))
  else
    ;
    ((self._ui)._buttonCustom):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_DOEDIT"))
    ;
    ((self._ui)._customWindow):SetShow(false)
  end
  ;
  ((self._ui)._buttonCustom720):SetText("")
  self:HandleClicked_CustomCategory(self._isCustomMode)
  if Panel_Menu_New:GetPosX() < getScreenSizeX() / 2 then
    self:CustomModeAnimation(self._isCustomMode, true)
  else
    self:CustomModeAnimation(self._isCustomMode, false)
  end
end

  -- DECOMPILER ERROR at PC2504: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.CustomModeAnimation = function(self, isCustom, isLeft)
  -- function num : 0_15
  self:Resize()
  local gap = -400
  if not isLeft then
    gap = 400
  end
  if isCustom then
    for categoryIndex = 0, self._categoryCount - 1 do
      local ImageMoveAni = (((self._ui)._radioButtonGroup)[categoryIndex]):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      ImageMoveAni:SetStartPosition((((self._ui)._radioButtonGroup)[categoryIndex]):GetPosX(), (((self._ui)._radioButtonGroup)[categoryIndex]):GetPosY())
      ImageMoveAni:SetEndPosition((((self._ui)._radioButtonGroup)[categoryIndex]):GetPosX() + gap, (((self._ui)._radioButtonGroup)[categoryIndex]):GetPosY())
      ;
      (((self._ui)._radioButtonGroup)[categoryIndex]):CalcUIAniPos(ImageMoveAni)
      ImageMoveAni:SetDisableWhileAni(true)
      ImageMoveAni:SetHideAtEnd(true)
    end
    local ImageMoveAni = ((self._ui)._radioButtonCustom):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    ImageMoveAni:SetStartPosition(((self._ui)._radioButtonCustom):GetPosX(), ((self._ui)._radioButtonCustom):GetPosY())
    ImageMoveAni:SetEndPosition(((self._ui)._radioButtonCustom):GetPosX() + gap, ((self._ui)._radioButtonCustom):GetPosY())
    ;
    ((self._ui)._radioButtonCustom):CalcUIAniPos(ImageMoveAni)
    ImageMoveAni:SetDisableWhileAni(true)
    ImageMoveAni:SetHideAtEnd(true)
    local ImageMoveAni1 = ((self._ui)._customTitle):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    ImageMoveAni1:SetStartPosition(((self._ui)._customTitle):GetPosX() + gap, ((self._ui)._customTitle):GetPosY())
    ImageMoveAni1:SetEndPosition(((self._ui)._customTitle):GetPosX(), ((self._ui)._customTitle):GetPosY())
    ;
    ((self._ui)._customTitle):CalcUIAniPos(ImageMoveAni1)
    ImageMoveAni1:SetDisableWhileAni(true)
    ;
    ((self._ui)._customTitle):SetShow(isCustom)
  else
    do
      for categoryIndex = 0, self._categoryCount - 1 do
        local ImageMoveAni = (((self._ui)._radioButtonGroup)[categoryIndex]):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
        ImageMoveAni:SetStartPosition((((self._ui)._radioButtonGroup)[categoryIndex]):GetPosX() + gap, (((self._ui)._radioButtonGroup)[categoryIndex]):GetPosY())
        ImageMoveAni:SetEndPosition((((self._ui)._radioButtonGroup)[categoryIndex]):GetPosX(), (((self._ui)._radioButtonGroup)[categoryIndex]):GetPosY())
        ;
        (((self._ui)._radioButtonGroup)[categoryIndex]):CalcUIAniPos(ImageMoveAni)
        ImageMoveAni:SetDisableWhileAni(true)
        ;
        (((self._ui)._radioButtonGroup)[categoryIndex]):SetShow(true)
      end
      local ImageMoveAni = ((self._ui)._radioButtonCustom):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      ImageMoveAni:SetStartPosition(((self._ui)._radioButtonCustom):GetPosX() + gap, ((self._ui)._radioButtonCustom):GetPosY())
      ImageMoveAni:SetEndPosition(((self._ui)._radioButtonCustom):GetPosX(), ((self._ui)._radioButtonCustom):GetPosY())
      ;
      ((self._ui)._radioButtonCustom):CalcUIAniPos(ImageMoveAni)
      ImageMoveAni:SetDisableWhileAni(true)
      ;
      ((self._ui)._radioButtonCustom):SetShow(true)
      local ImageMoveAni1 = ((self._ui)._customTitle):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      ImageMoveAni1:SetStartPosition(((self._ui)._customTitle):GetPosX(), ((self._ui)._customTitle):GetPosY())
      ImageMoveAni1:SetEndPosition(((self._ui)._customTitle):GetPosX() + gap, ((self._ui)._customTitle):GetPosY())
      ;
      ((self._ui)._customTitle):CalcUIAniPos(ImageMoveAni1)
      ImageMoveAni1:SetDisableWhileAni(true)
      ImageMoveAni1:SetHideAtEnd(true)
    end
  end
end

  -- DECOMPILER ERROR at PC2508: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetCurrentMenu = function(self, categoryIndex, menuIndex, uiIndex)
  -- function num : 0_16
  local categoryData = ((self._categoryData)[categoryIndex])[menuIndex]
  if self._beforeIndex == nil then
    if categoryData._isContentOpen then
      (((self._ui)._custom)._beforeMenu):SetText(categoryData._string)
      ;
      (((self._ui)._custom)._beforeIcon):ChangeTextureInfoName(categoryData._path)
      local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._custom)._beforeIcon, categoryData._x1, categoryData._y1, categoryData._x2, categoryData._y2)
      ;
      ((((self._ui)._custom)._beforeIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((self._ui)._custom)._beforeIcon):setRenderTexture((((self._ui)._custom)._beforeIcon):getBaseTexture())
    else
      do
        ;
        (((self._ui)._custom)._beforeMenu):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_NOTSETTING"))
        ;
        (((self._ui)._custom)._beforeIcon):ChangeTextureInfoName("")
        -- DECOMPILER ERROR at PC69: Confused about usage of register: R5 in 'UnsetPending'

        ;
        (self._beforeMenu)._categoryIndex = categoryIndex
        -- DECOMPILER ERROR at PC71: Confused about usage of register: R5 in 'UnsetPending'

        ;
        (self._beforeMenu)._menuIndex = menuIndex
        self._beforeIndex = categoryData._index
        ;
        ((self._ui)._customWindow):SetShow(true)
        self:SetCheckIcon(uiIndex)
        if Panel_Menu_New:GetPosX() < getScreenSizeX() / 2 then
          ((self._ui)._customWindow):SetPosX(490)
        else
          ;
          ((self._ui)._customWindow):SetPosX(-355)
        end
        if self._beforeIndex == categoryData._index then
          self:CustomWindow_Init()
        else
          local realIndex = 0
          for cIndex = 1, self._categoryCount do
            for mIndex = 0, ((self._categoryData)[cIndex])._count - 1 do
              local currentCategoryData = ((self._categoryData)[cIndex])[mIndex]
              -- DECOMPILER ERROR at PC135: Unhandled construct in 'MakeBoolean' P1

              if currentCategoryData._isContentOpen and currentCategoryData._index == categoryData._index then
                self:SetChangeMenu(cIndex, mIndex, realIndex)
                return 
              end
              realIndex = realIndex + 1
            end
          end
          for mIndex = 0, ((self._categoryData)[6])._count - 1 do
            local currentCategoryData = ((self._categoryData)[6])[mIndex]
            -- DECOMPILER ERROR at PC161: Unhandled construct in 'MakeBoolean' P1

            if currentCategoryData._isContentOpen and currentCategoryData._index == categoryData._index then
              self:SetChangeMenu(6, mIndex, realIndex)
              return 
            end
            realIndex = realIndex + 1
          end
        end
      end
    end
  end
end

  -- DECOMPILER ERROR at PC2512: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetChangeMenu = function(self, categoryIndex, menuIndex, realIndex)
  -- function num : 0_17
  local categoryData = ((self._categoryData)[categoryIndex])[menuIndex]
  ;
  (((self._ui)._custom)._afterMenu):SetText(categoryData._string)
  ;
  (((self._ui)._custom)._afterIcon):ChangeTextureInfoName(categoryData._path)
  local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._custom)._afterIcon, categoryData._x1, categoryData._y1, categoryData._x2, categoryData._y2)
  ;
  ((((self._ui)._custom)._afterIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (((self._ui)._custom)._afterIcon):setRenderTexture((((self._ui)._custom)._afterIcon):getBaseTexture())
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R9 in 'UnsetPending'

  ;
  (self._afterMenu)._categoryIndex = categoryIndex
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R9 in 'UnsetPending'

  ;
  (self._afterMenu)._menuIndex = menuIndex
  ;
  (((self._ui)._custom)._checkIcon):SetShow(true)
  ;
  (((self._ui)._custom)._checkIcon):SetPosX(16 + realIndex % 7 * 45)
  ;
  (((self._ui)._custom)._checkIcon):SetPosY(131 + (math.floor)(realIndex / 7) * 45)
end

  -- DECOMPILER ERROR at PC2516: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.CustomWindow_OverEffect = function(self, index, dataIndex)
  -- function num : 0_18
  (((self._ui)._custom)._effect):SetPosX(16 + index % 7 * 45)
  ;
  (((self._ui)._custom)._effect):SetPosY(131 + (math.floor)(index / 7) * 45)
  local uiControl = ((self._ui)._customButton)[index]
  local temp = PaGlobal_Menu:Check_MenuIndex(dataIndex)
  if temp ~= nil then
    local categoryData = ((self._categoryData)[temp._categoryIndex])[temp._menuIndex]
    TooltipSimple_Show(uiControl, categoryData._string)
  end
end

  -- DECOMPILER ERROR at PC2520: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.CustomWindow_OverEffect_MyMenu = function(self, index, dataIndex)
  -- function num : 0_19
  (((self._ui)._custom)._effect):SetPosX(16 + index % 7 * 45)
  ;
  (((self._ui)._custom)._effect):SetPosY(131 + (math.floor)(index / 7) * 45)
  local uiControl = ((self._ui)._customButton)[index]
  for index = 0, ((self._categoryData)[6])._count - 1 do
    local data = ((self._categoryData)[6])[index]
    if dataIndex == data._index then
      TooltipSimple_Show(uiControl, data._string)
    end
  end
end

  -- DECOMPILER ERROR at PC2524: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.CustomWindow_TooltipHide = function(self)
  -- function num : 0_20
  TooltipSimple_Hide()
end

  -- DECOMPILER ERROR at PC2528: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SaveChangeMenu = function(self)
  -- function num : 0_21
  if (self._beforeMenu)._categoryIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_ALERT_BEFOREMENU"))
    return 
  end
  if (self._afterMenu)._categoryIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_ALERT_AFTERMENU"))
    return 
  end
  if (self._beforeMenu)._categoryIndex == (self._afterMenu)._categoryIndex and (self._beforeMenu)._menuIndex == (self._afterMenu)._menuIndex then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_ALERT_SAMEMENU"))
    return 
  end
  local afterCategoryData = ((self._categoryData)[(self._afterMenu)._categoryIndex])[(self._afterMenu)._menuIndex]
  local afterIndex = afterCategoryData._index
  local beforeIndex = (((self._categoryData)[(self._beforeMenu)._categoryIndex])[(self._beforeMenu)._menuIndex])._index
  for cIndex = 0, #self._customIndex do
    if afterIndex == (self._customIndex)[cIndex] then
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["Menu" .. cIndex], beforeIndex, (CppEnums.VariableStorageType).eVariableStorageType_User)
      -- DECOMPILER ERROR at PC84: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (self._customIndex)[cIndex] = beforeIndex
    else
      if beforeIndex == (self._customIndex)[cIndex] then
        (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["Menu" .. cIndex], afterIndex, (CppEnums.VariableStorageType).eVariableStorageType_User)
        -- DECOMPILER ERROR at PC105: Confused about usage of register: R8 in 'UnsetPending'

        ;
        (self._customIndex)[cIndex] = afterIndex
      end
    end
  end
  self:CustomWindow_Init()
  self:HandleClicked_CustomCategory(true)
end

  -- DECOMPILER ERROR at PC2532: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.CancelChangeMenu = function(self)
  -- function num : 0_22
  self:SetCustomMode()
  self:CustomWindow_Init()
  ;
  ((self._ui)._customWindow):SetShow(false)
end

  -- DECOMPILER ERROR at PC2536: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HandleClicked_MenuButton = function(self, index, categoryIndex, uiIndex)
  -- function num : 0_23
  if categoryIndex == nil then
    categoryIndex = self._currentCategoryIndex
  end
  -- DECOMPILER ERROR at PC12: Unhandled construct in 'MakeBoolean' P1

  if self._isCustomMode and uiIndex ~= nil then
    self:SetCurrentMenu(categoryIndex, index, uiIndex)
  end
  do return  end
  if not (((self._categoryData)[categoryIndex])[index])._isContentOpen then
    return 
  end
  Panel_Menu_ShowToggle()
  if categoryIndex == 0 then
    if (PaGlobal_Menu._main)._help == index then
      FGlobal_Panel_WebHelper_ShowToggle()
    else
      if (PaGlobal_Menu._main)._escape == index then
        if ToClient_IsMyselfInArena() then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_COMMON_ARLERT"))
          return 
        end
        HandleClicked_RescueConfirm()
      else
        if (PaGlobal_Menu._main)._option == index then
          showGameOption()
        else
          if (PaGlobal_Menu._main)._inven == index then
            GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Inventory)
          else
            if (PaGlobal_Menu._main)._gameExit == index then
              GameExitShowToggle(false)
            else
              if (PaGlobal_Menu._main)._cashShop == index then
                GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_CashShop)
              end
            end
          end
        end
      end
    end
  else
    if categoryIndex == 1 then
      if (PaGlobal_Menu._contents)._beauty == index then
        GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_BeautyShop)
      else
        if (PaGlobal_Menu._contents)._dye == index then
          GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Dyeing)
        else
          if (PaGlobal_Menu._contents)._pallet == index then
            Panel_ColorBalance_Show()
          else
            if (PaGlobal_Menu._contents)._pet == index then
              FGlobal_PetListNew_Toggle()
            else
              if (PaGlobal_Menu._contents)._blackSpirit == index then
                GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_BlackSpirit)
              else
                if (PaGlobal_Menu._contents)._questInfo == index then
                  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_QuestHistory)
                else
                  if (PaGlobal_Menu._contents)._skill == index then
                    GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Skill)
                  else
                    if (PaGlobal_Menu._contents)._manufacture == index then
                      GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Manufacture)
                    else
                      if (PaGlobal_Menu._contents)._uiSetting == index then
                        FGlobal_UiSet_Open()
                      else
                        if (PaGlobal_Menu._contents)._dailyStamp == index then
                          DailyStamp_ShowToggle()
                        else
                          if (PaGlobal_Menu._contents)._blackSpiritAdventure == index then
                            FGlobal_BlackSpiritAdventure_Open()
                          else
                            if (PaGlobal_Menu._contents)._blackSpiritAdventure2 == index then
                              FGlobal_BlackSpiritAdventure2_Open()
                            else
                              if (PaGlobal_Menu._contents)._beautyAlbum == index then
                                FGlobal_CustomizingAlbum_Show(false, (CppEnums.ClientSceneState).eClientSceneStateType_InGame)
                              else
                                if (PaGlobal_Menu._contents)._photoGallery == index then
                                  ScreenshotAlbum_Open()
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
    else
      if categoryIndex == 2 then
        if (PaGlobal_Menu._cooperation)._localWar == index then
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
                  if (PaGlobal_Menu._cooperation)._freeFighting == index then
                    local player = (getSelfPlayer()):get()
                    local maxHp = player:getMaxHp()
                    local playerHp = player:getHp()
                    if player:getLevel() < 50 then
                      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_FREEFIGHTALERT"))
                      return 
                    end
                    if ToClient_IsJoinPvpBattleGround() then
                      local FunctionYesUnJoinPvpBattle = function()
    -- function num : 0_23_0
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
    -- function num : 0_23_1
    ToClient_JoinPvpBattleGround(0)
  end

                          local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_PVPBATTLEGROUND_JOIN")
                          local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = FunctionYesJoinPvpBattle, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                          ;
                          (MessageBox.showMessageBox)(messageBoxData)
                        else
                          do
                            do
                              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_CHECKHP"))
                              if (PaGlobal_Menu._cooperation)._waveDefence == index then
                                if ToClient_getPlayNowSavageDefence() then
                                  FGlobal_SavegeDefenceInfo_unjoin()
                                else
                                  FGlobal_SavageDefenceInfo_Open()
                                end
                              else
                                if (PaGlobal_Menu._cooperation)._arsha == index then
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
                                  if (PaGlobal_Menu._cooperation)._militia == index then
                                    FGlobal_MercenaryOpen()
                                  else
                                    if (PaGlobal_Menu._cooperation)._partyFind == index then
                                      FGlobal_PartyList_ShowToggle()
                                    end
                                  end
                                end
                              end
                              if categoryIndex == 3 then
                                if (PaGlobal_Menu._infomation)._keyboard == index then
                                  FGlobal_KeyboardHelpShow()
                                else
                                  if (PaGlobal_Menu._infomation)._productNote == index then
                                    Panel_ProductNote_ShowToggle()
                                  else
                                    if (PaGlobal_Menu._infomation)._myInfo == index then
                                      GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_PlayerInfo)
                                    else
                                      if (PaGlobal_Menu._infomation)._fishEncyclopedia == index then
                                        FGlobal_FishEncyclopedia_Open()
                                      else
                                        if (PaGlobal_Menu._infomation)._knowledge == index then
                                          GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_MentalKnowledge)
                                        else
                                          if (PaGlobal_Menu._infomation)._worldMap == index then
                                            GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_WorldMap)
                                          else
                                            if (PaGlobal_Menu._infomation)._workerList == index then
                                              workerManager_Toggle()
                                            else
                                              if (PaGlobal_Menu._infomation)._itemMarket == index then
                                                FGlobal_ItemMarket_Open_ForWorldMap(1, true)
                                                audioPostEvent_SystemUi(1, 30)
                                              else
                                                if (PaGlobal_Menu._infomation)._tradeInfo == index then
                                                  if isUsedNewTradeEventNotice_chk() then
                                                    FGlobal_TradeEventNotice_Renewal_Show()
                                                  else
                                                    TradeEventInfo_Show()
                                                  end
                                                else
                                                  if (PaGlobal_Menu._infomation)._warInfo == index then
                                                    FGlobal_GuildWarInfo_Show()
                                                  else
                                                    if (PaGlobal_Menu._infomation)._event == index then
                                                      EventNotify_Open(true, true)
                                                    else
                                                      if (PaGlobal_Menu._infomation)._steam == index then
                                                        PaGlobal_Steam_Redemption()
                                                      else
                                                        if (PaGlobal_Menu._infomation)._update == index then
                                                          Panel_WebHelper_ShowToggle("Update")
                                                        else
                                                          if (PaGlobal_Menu._infomation)._notice == index then
                                                            EventNotify_Open(true, true)
                                                          else
                                                            if (PaGlobal_Menu._infomation)._serverChange == index then
                                                              FGlobal_ChannelSelect_Show()
                                                            else
                                                              if (PaGlobal_Menu._infomation)._masterpiece == index then
                                                                FGlobal_MasterpieceAuction_OpenAuctionItemNotNpc()
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
                              else
                                if categoryIndex == 4 then
                                  if (PaGlobal_Menu._community)._guild == index then
                                    GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Guild)
                                  else
                                    if (PaGlobal_Menu._community)._friend == index then
                                      GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_FriendList)
                                    else
                                      if (PaGlobal_Menu._community)._mail == index then
                                        GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Mail)
                                      else
                                        if (PaGlobal_Menu._community)._guildRank == index then
                                          GuildRank_Web_Show()
                                        else
                                          if (PaGlobal_Menu._community)._lifeRank == index then
                                            FGlobal_LifeRanking_Open()
                                          else
                                            if (PaGlobal_Menu._community)._monsterRank == index then
                                              FGlobal_MonsterRanking_Open()
                                            else
                                              if (PaGlobal_Menu._community)._chattingFilter == index then
                                                FGlobal_ChattingFilterList_Open()
                                              else
                                                if (PaGlobal_Menu._community)._language == index then
                                                  FGlobal_GameOptionOpen()
                                                else
                                                  if (PaGlobal_Menu._community)._blackDesertTv == index then
                                                    PaGlobal_Twitch:ShowWindow()
                                                  else
                                                    if (PaGlobal_Menu._community)._socialAction == index then
                                                      FGlobal_SocialAction_ShowToggle()
                                                    else
                                                      if (PaGlobal_Menu._community)._memo == index then
                                                        PaGlobal_Memo:ListOpen()
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
                                else
                                  if categoryIndex == 5 then
                                    if (PaGlobal_Menu._banner)._blackDesertTv == index then
                                      PaGlobal_Twitch:ShowWindow()
                                    else
                                      if (PaGlobal_Menu._banner)._socialAction == index then
                                        FGlobal_SocialAction_ShowToggle()
                                      end
                                    end
                                  else
                                    if categoryIndex == 6 then
                                      if (PaGlobal_Menu._myMenu)._graphic == index then
                                        FGlobal_GameOption_OpenByMenu(0)
                                      else
                                        if (PaGlobal_Menu._myMenu)._sound == index then
                                          FGlobal_GameOption_OpenByMenu(1)
                                        else
                                          if (PaGlobal_Menu._myMenu)._game == index then
                                            FGlobal_GameOption_OpenByMenu(2)
                                          else
                                            if (PaGlobal_Menu._myMenu)._performance == index then
                                              FGlobal_GameOption_OpenByMenu(5)
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

  -- DECOMPILER ERROR at PC2540: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetCheckIcon = function(self, uiIndex)
  -- function num : 0_24
  if uiIndex == nil then
    for index = 0, self._maxUiSlotCount - 1 do
      (((self._ui)._checkIcon)[index]):SetShow(false)
    end
  else
    do
      for index = 0, self._maxUiSlotCount - 1 do
        if uiIndex == index then
          (((self._ui)._checkIcon)[index]):SetShow(true)
        else
          ;
          (((self._ui)._checkIcon)[index]):SetShow(false)
        end
      end
    end
  end
end

  -- DECOMPILER ERROR at PC2544: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.CustomWindow_Init = function(self)
  -- function num : 0_25
  (((self._ui)._custom)._beforeMenu):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_EDITSLOTTEXT"))
  ;
  (((self._ui)._custom)._afterMenu):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_EDITSLOTTEXT"))
  ;
  (((self._ui)._custom)._beforeIcon):ChangeTextureInfoName("")
  ;
  (((self._ui)._custom)._afterIcon):ChangeTextureInfoName("")
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._beforeMenu)._categoryIndex = nil
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._beforeMenu)._menuIndex = nil
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._afterMenu)._categoryIndex = nil
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._afterMenu)._menuIndex = nil
  ;
  (((self._ui)._custom)._checkIcon):SetShow(false)
  self._beforeIndex = nil
  self:SetCheckIcon()
end

  -- DECOMPILER ERROR at PC2548: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.CustomIndex_Init = function(self)
  -- function num : 0_26
  for index = 0, #self._customIndex do
    local saveIndex = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["Menu" .. index])
    if saveIndex == 0 then
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType)["Menu" .. index], (self._customIndex)[index], (CppEnums.VariableStorageType).eVariableStorageType_User)
    else
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (self._customIndex)[index] = saveIndex
    end
  end
end

  -- DECOMPILER ERROR at PC2552: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetShow = function(self, isShow)
  -- function num : 0_27
  Panel_Menu_New:SetShow(isShow, true)
  if not isShow then
    return 
  end
  for index = 0, self._categoryCount - 1 do
    (((self._ui)._radioButtonGroup)[index]):SetCheck(index == 0)
  end
  self:HandleClicked_CustomCategory()
  ;
  ((self._ui)._customWindow):SetShow(false)
  self:ResetVertexAni()
  ;
  ((self._ui)._effect_SubMenuButton):SetShow(false)
  self:CustomWindow_Init()
  ;
  ((self._ui)._buttonCustom):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_DOEDIT"))
  ;
  ((self._ui)._buttonCustom720):SetText("")
  self._isCustomMode = false
  ;
  ((self._ui)._customTitle):SetShow(false)
  for categoryIndex = 0, self._categoryCount - 1 do
    (((self._ui)._radioButtonGroup)[categoryIndex]):SetShow(true)
  end
  ;
  ((self._ui)._radioButtonCustom):SetShow(true)
  self:Resize()
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

  Panel_Menu_ShowToggle_New = function()
  -- function num : 0_28
  local isShow = Panel_Menu_New:GetShow()
  PaGlobal_Menu:SetShow(not isShow)
  return isShow
end

  -- DECOMPILER ERROR at PC2558: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.Resize = function(self)
  -- function num : 0_29
  Panel_Menu_New:SetSize(Panel_Menu_New:GetSizeX(), getScreenSizeY())
  ;
  ((self._ui)._mainMenuBg):ComputePos()
  ;
  ((self._ui)._categoryMenuBg):ComputePos()
  ;
  (((self._ui)._radioButtonGroup)[0]):ComputePos()
  ;
  (((self._ui)._radioButtonGroup)[1]):ComputePos()
  ;
  (((self._ui)._radioButtonGroup)[2]):ComputePos()
  ;
  (((self._ui)._radioButtonGroup)[3]):ComputePos()
  ;
  ((self._ui)._radioButtonCustom):ComputePos()
  ;
  ((self._ui)._bottomBannerBg):ComputePos()
  ;
  ((self._ui)._customWindow):SetPosY(220)
  ;
  ((self._ui)._customTitle):ComputePos()
  do
    if getScreenSizeY() > 720 then
      local gapY = (getScreenSizeY() - 720) / 5
      ;
      ((self._ui)._mainMenuBg):SetPosY(gapY * 0.9)
      ;
      (((self._ui)._radioButtonGroup)[0]):SetPosY((((self._ui)._radioButtonGroup)[0]):GetPosY() + gapY * 1.5)
      ;
      (((self._ui)._radioButtonGroup)[1]):SetPosY((((self._ui)._radioButtonGroup)[1]):GetPosY() + gapY * 1.5)
      ;
      (((self._ui)._radioButtonGroup)[2]):SetPosY((((self._ui)._radioButtonGroup)[2]):GetPosY() + gapY * 1.5)
      ;
      (((self._ui)._radioButtonGroup)[3]):SetPosY((((self._ui)._radioButtonGroup)[3]):GetPosY() + gapY * 1.5)
      ;
      ((self._ui)._radioButtonCustom):SetPosY(((self._ui)._radioButtonCustom):GetPosY() + gapY * 1.5)
      ;
      ((self._ui)._categoryMenuBg):SetPosY(((self._ui)._categoryMenuBg):GetPosY() + gapY * 1.5)
      ;
      ((self._ui)._customWindow):SetPosY(((self._ui)._customWindow):GetPosY() + gapY * 1.5 - 50)
      ;
      ((self._ui)._customTitle):SetPosY(((self._ui)._customTitle):GetPosY() + gapY * 1.5)
      ;
      ((self._ui)._bottomBannerBg):SetPosY(((self._ui)._bottomBannerBg):GetPosY() - gapY / 2)
    end
    if getScreenSizeY() < 800 then
      do
        local isWide = (self._ui)._buttonCustom == nil
        ;
        ((self._ui)._buttonCustom):SetShow(isWide)
        ;
        ((self._ui)._buttonCustom720):SetShow(not isWide)
        -- DECOMPILER ERROR: 2 unprocessed JMP targets
      end
    end
  end
end

  -- DECOMPILER ERROR at PC2562: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.ShowAni = function(self)
  -- function num : 0_30
  if self._isLeft then
    local ImageMoveAni = Panel_Menu_New:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    ImageMoveAni:SetStartPosition(0 - Panel_Menu_New:GetSizeX(), 0)
    ImageMoveAni:SetEndPosition(0, 0)
    ImageMoveAni.IsChangeChild = true
    Panel_Menu_New:CalcUIAniPos(ImageMoveAni)
    ImageMoveAni:SetDisableWhileAni(true)
  else
    do
      local ImageMoveAni = Panel_Menu_New:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      ImageMoveAni:SetStartPosition(getScreenSizeX(), 0)
      ImageMoveAni:SetEndPosition(getScreenSizeX() - Panel_Menu_New:GetSizeX() + 8, 0)
      ImageMoveAni.IsChangeChild = true
      Panel_Menu_New:CalcUIAniPos(ImageMoveAni)
      ImageMoveAni:SetDisableWhileAni(true)
    end
  end
end

  -- DECOMPILER ERROR at PC2566: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HideAni = function(self)
  -- function num : 0_31
  local ImageMoveAni = Panel_Menu_New:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni:SetStartPosition(Panel_Menu_New:GetPosX(), 0)
  if Panel_Menu_New:GetPosX() < getScreenSizeX() / 2 then
    ImageMoveAni:SetEndPosition(0 - Panel_Menu_New:GetSizeX(), 0)
  else
    ImageMoveAni:SetEndPosition(getScreenSizeX(), 0)
  end
  ImageMoveAni.IsChangeChild = true
  Panel_Menu_New:CalcUIAniPos(ImageMoveAni)
  ImageMoveAni:SetDisableWhileAni(true)
  ImageMoveAni:SetHideAtEnd(true)
  ImageMoveAni:SetDisableWhileAni(true)
  if Panel_Npc_Dialog:GetShow() == false then
    ToClient_setConsoleUIMode(false)
  end
end

  -- DECOMPILER ERROR at PC2570: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.SetVertexAni = function(self, index)
  -- function num : 0_32
  self:ResetVertexAni()
  for menuIndex = 0, self._maxUiSlotCount - 1 do
    if index == menuIndex then
      (((self._ui)._subButton)[index]):SetVertexAniRun("Ani_Color_New", true)
      ;
      ((self._ui)._effect_SubMenuButton):SetShow(true)
      ;
      ((self._ui)._effect_SubMenuButton):SetSize((((self._ui)._subButton)[index]):GetSizeX() + 3, (((self._ui)._subButton)[index]):GetSizeY())
      ;
      ((self._ui)._effect_SubMenuButton):SetPosX(((self._ui)._categoryMenuBg):GetPosX() + (((self._ui)._subButton)[index]):GetPosX() - 1)
      ;
      ((self._ui)._effect_SubMenuButton):SetPosY(((self._ui)._categoryMenuBg):GetPosY() + (((self._ui)._subButton)[index]):GetPosY())
    else
      ;
      (((self._ui)._subButton)[index]):SetVertexAniRun("Ani_Color_Reset", true)
    end
  end
end

  -- DECOMPILER ERROR at PC2574: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.ResetVertexAni = function(self)
  -- function num : 0_33
  for index = 0, self._maxUiSlotCount - 1 do
    (((self._ui)._subButton)[index]):ResetVertexAni()
    ;
    (((self._ui)._subButton)[index]):SetVertexAniRun("Ani_Color_Reset", true)
  end
  ;
  ((self._ui)._effect_SubMenuButton):SetShow(false)
  ;
  ((self._ui)._effect_MainMenuButton):SetShow(false)
  ;
  ((self._ui)._effect_BottomBanner):SetShow(false)
end

  -- DECOMPILER ERROR at PC2578: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HandleOvered_MainMenuButon = function(self, index)
  -- function num : 0_34
  if self._isCustomMode then
    return 
  end
  self:ResetVertexAni()
  ;
  ((self._ui)._effect_MainMenuButton):SetShow(true)
  ;
  ((self._ui)._effect_MainMenuButton):SetPosX(((self._ui)._mainMenuBg):GetPosX() + (((self._ui)._main)[index]):GetPosX() - 5)
  ;
  ((self._ui)._effect_MainMenuButton):SetPosY(((self._ui)._mainMenuBg):GetPosY() + (((self._ui)._main)[index]):GetPosY())
end

  -- DECOMPILER ERROR at PC2582: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.HandleOvered_Banner = function(self, index)
  -- function num : 0_35
  if self._isCustomMode then
    return 
  end
  self:ResetVertexAni()
  ;
  ((self._ui)._effect_BottomBanner):SetShow(true)
  ;
  ((self._ui)._effect_BottomBanner):SetPosX(((self._ui)._bottomBannerBg):GetPosX() + (((self._ui)._banner)[index]):GetPosX() - 4)
  ;
  ((self._ui)._effect_BottomBanner):SetPosY(((self._ui)._bottomBannerBg):GetPosY() + (((self._ui)._banner)[index]):GetPosY() - 4)
end

  Panel_Menu_Resize = function()
  -- function num : 0_36
  PaGlobal_Menu:Resize()
end

  Panel_Menu_Init = function()
  -- function num : 0_37
  PaGlobal_Menu:Init()
end

  -- DECOMPILER ERROR at PC2590: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Menu.registerEvent = function(self)
  -- function num : 0_38
  for index = 0, self._categoryCount - 1 do
    (((self._ui)._radioButtonGroup)[index]):addInputEvent("Mouse_LUp", "PaGlobal_Menu:HandleClicked_CategoryGroup(" .. index + 1 .. ")")
  end
  ;
  ((self._ui)._radioButtonCustom):addInputEvent("Mouse_LUp", "PaGlobal_Menu:HandleClicked_CustomCategory()")
  registerEvent("onScreenResize", "Panel_Menu_Resize")
  registerEvent("FromClient_luaLoadComplete", "Panel_Menu_Init")
end

  UIMain_ItemUpdate = function()
  -- function num : 0_39
end

  UIMain_ItemUpdateRemove = function()
  -- function num : 0_40
end

  UIMain_FriendListUpdate = function()
  -- function num : 0_41
end

  UIMain_FriendListUpdateRemove = function()
  -- function num : 0_42
end

  do
    local knowledgePoint = 0
    UIMain_KnowledgeUpdate = function()
  -- function num : 0_43
end

    UIMain_KnowledgeUpdateRemove = function()
  -- function num : 0_44
end

    UI_MAIN_checkSkillLearnable = function()
  -- function num : 0_45
end

    UIMain_SkillPointUpdateRemove = function()
  -- function num : 0_46
end

    Panel_Menu_Close_New = function()
  -- function num : 0_47
  Panel_Menu_New:SetShow(false, true)
  if check_ShowWindow() == false then
    (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
  end
end

    HandleClicked_RescueConfirm = function()
  -- function num : 0_48
  audioPostEvent_SystemUi(1, 41)
  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MSGBOX_RESCUE")
  local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = RescueExecute, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

    RescueExecute = function()
  -- function num : 0_49
  callRescue()
end

    ChangeUI_Menu_New = function()
  -- function num : 0_50
  Panel_Menu_Close_New()
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MenuType, 1, (CppEnums.VariableStorageType).eVariableStorageType_User)
  Panel_Menu_ShowToggle()
end

    PaGlobal_Menu:registerEvent()
    -- DECOMPILER ERROR: 9 unprocessed JMP targets
  end
end

