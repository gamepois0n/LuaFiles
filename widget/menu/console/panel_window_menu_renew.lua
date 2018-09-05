PaGlobal_Menu_Renew_Renew = {
  _ui = {
    _subButton = {},
    _subIcon = {},
    _hotKey = {},
    _newIcon = {},
    _hotIcon = {},
    _checkIcon = {},
    _topBg = UI.getChildControl(Panel_Window_Menu_Renew, "Static_TopBg")
  },
  _xbox = {}
}
PaGlobal_Menu_Renew_Renew._xbox = {
  _help = 0,
  _escape = 1,
  _inven = 2,
  _option = 3,
  _gameExit = 4,
  _blackSpirit = 5,
  _questInfo = 6,
  _skill = 7,
  _myInfo = 8,
  _knowledge = 9,
  _worldMap = 10,
  _guild = 11,
  _friend = 12,
  _ringMenu = 13,
  _pet = 14,
  _beauty = 15,
  _partyRecruite = 16,
  _localWar = 17,
  _count = 18
}
local index = 1
while index * index < PaGlobal_Menu_Renew_Renew._xbox._count do
  index = index + 1
end
local horizontalCount = math.max(4, index)
PaGlobal_Menu_Renew_Renew._categoryData = {
  [PaGlobal_Menu_Renew_Renew._xbox._help] = {
    _string = "Policy",
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds",
    _x1 = 201,
    _y1 = 3,
    _x2 = 261,
    _y2 = 63
  },
  [PaGlobal_Menu_Renew_Renew._xbox._escape] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_ESCAPE"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds",
    _x1 = 387,
    _y1 = 3,
    _x2 = 447,
    _y2 = 63
  },
  [PaGlobal_Menu_Renew_Renew._xbox._option] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_OPTION"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds",
    _x1 = 325,
    _y1 = 3,
    _x2 = 385,
    _y2 = 63
  },
  [PaGlobal_Menu_Renew_Renew._xbox._inven] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BAG"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds",
    _x1 = 449,
    _y1 = 3,
    _x2 = 509,
    _y2 = 63
  },
  [PaGlobal_Menu_Renew_Renew._xbox._gameExit] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_EXIT"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds",
    _x1 = 263,
    _y1 = 3,
    _x2 = 323,
    _y2 = 63
  },
  [PaGlobal_Menu_Renew_Renew._xbox._blackSpirit] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BLACKSPIRIT"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 2,
    _y1 = 64,
    _x2 = 62,
    _y2 = 124
  },
  [PaGlobal_Menu_Renew_Renew._xbox._questInfo] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_QUESTHISTORY"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 64,
    _y1 = 64,
    _x2 = 124,
    _y2 = 124
  },
  [PaGlobal_Menu_Renew_Renew._xbox._skill] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_SKILL"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 188,
    _y1 = 2,
    _x2 = 248,
    _y2 = 62
  },
  [PaGlobal_Menu_Renew_Renew._xbox._myInfo] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MYINFO"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 64,
    _y1 = 2,
    _x2 = 124,
    _y2 = 62
  },
  [PaGlobal_Menu_Renew_Renew._xbox._knowledge] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MENTALKNOWLEDGE"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 126,
    _y1 = 64,
    _x2 = 186,
    _y2 = 124
  },
  [PaGlobal_Menu_Renew_Renew._xbox._worldMap] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_WORLDMAP"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 312,
    _y1 = 2,
    _x2 = 372,
    _y2 = 62
  },
  [PaGlobal_Menu_Renew_Renew._xbox._guild] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_GUILD"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 250,
    _y1 = 2,
    _x2 = 310,
    _y2 = 62
  },
  [PaGlobal_Menu_Renew_Renew._xbox._friend] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_FRIENDLIST"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 250,
    _y1 = 64,
    _x2 = 310,
    _y2 = 124
  },
  [PaGlobal_Menu_Renew_Renew._xbox._ringMenu] = {
    _string = "Edit RingMenu",
    _hotKey = "",
    _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
    _x1 = 205,
    _y1 = 445,
    _x2 = 255,
    _y2 = 495
  },
  [PaGlobal_Menu_Renew_Renew._xbox._pet] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_PET"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 374,
    _y1 = 64,
    _x2 = 434,
    _y2 = 124
  },
  [PaGlobal_Menu_Renew_Renew._xbox._beauty] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BEAUTY"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 126,
    _y1 = 126,
    _x2 = 186,
    _y2 = 186
  },
  [PaGlobal_Menu_Renew_Renew._xbox._partyRecruite] = {
    _string = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PARTYLISTRECRUITE_TITLE"),
    _hotKey = "",
    _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
    _x1 = 64,
    _y1 = 436,
    _x2 = 124,
    _y2 = 496
  },
  [PaGlobal_Menu_Renew_Renew._xbox._localWar] = {
    _string = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_LOCALWAR"),
    _hotKey = "",
    _path = "Renewal/UI_Icon/Console_Icon_Title.dds",
    _x1 = 344,
    _y1 = 230,
    _x2 = 399,
    _y2 = 285
  }
}
function PaGlobal_Menu_Renew_Renew:ShowAni()
end
function PaGlobal_Menu_Renew_Renew:HideAni()
end
function PaGlobal_Menu_Renew_Renew:Init()
  Panel_Window_Menu_Renew:SetShow(false)
  Panel_Window_Menu_Renew:setGlassBackground(true)
  Panel_Window_Menu_Renew:ActiveMouseEventEffect(true)
  Panel_Window_Menu_Renew:RegisterShowEventFunc(true, "PaGlobal_Menu_Renew_Renew:ShowAni()")
  Panel_Window_Menu_Renew:RegisterShowEventFunc(false, "PaGlobal_Menu_Renew_Renew:HideAni()")
  local buttonTemplate = UI.getChildControl(Panel_Window_Menu_Renew, "StaticText_ButtonBg_Template")
  buttonTemplate:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  for index = 0, self._xbox._count - 1 do
    self._ui._subButton[index] = UI.createAndCopyBasePropertyControl(Panel_Window_Menu_Renew, "StaticText_ButtonBg_Template", Panel_Window_Menu_Renew, "StaticText_ButtonBg_" .. index)
    self._ui._subButton[index]:SetText(self._categoryData[index]._string)
    self._ui._subButton[index]:addInputEvent("Mouse_LUp", "PaGlobal_Menu_Renew_Renew:HandleClicked_MenuButton(" .. index .. ")")
    self._ui._subButton[index]:SetPosX(20 + index % horizontalCount * (self._ui._subButton[index]:GetSizeX() + 10))
    self._ui._subButton[index]:SetPosY(90 + math.floor(index / horizontalCount) * (self._ui._subButton[index]:GetSizeX() + 10))
    self._ui._subIcon[index] = UI.createAndCopyBasePropertyControl(buttonTemplate, "Button_MenuIcon", self._ui._subButton[index], "Button_MenuIcon")
    self._ui._hotKey[index] = UI.createAndCopyBasePropertyControl(buttonTemplate, "StaticText_HotKey", self._ui._subButton[index], "StaticText_HotKey")
    self._ui._newIcon[index] = UI.createAndCopyBasePropertyControl(buttonTemplate, "Static_NewIcon", self._ui._subButton[index], "Static_NewIcon")
    self._ui._hotIcon[index] = UI.createAndCopyBasePropertyControl(buttonTemplate, "Static_HotIcon", self._ui._subButton[index], "Static_HotIcon")
    self._ui._checkIcon[index] = UI.createAndCopyBasePropertyControl(buttonTemplate, "Static_CheckIcon", self._ui._subButton[index], "Static_CheckIcon")
    local categoryData = self._categoryData[index]
    self._ui._subIcon[index]:ChangeTextureInfoName(categoryData._path)
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui._subIcon[index], categoryData._x1, categoryData._y1, categoryData._x2, categoryData._y2)
    self._ui._subIcon[index]:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui._subIcon[index]:setRenderTexture(self._ui._subIcon[index]:getBaseTexture())
    self._ui._hotKey[index]:SetShow(false)
    self._ui._newIcon[index]:SetShow(false)
    self._ui._hotIcon[index]:SetShow(false)
    self._ui._checkIcon[index]:SetShow(false)
  end
  Panel_Window_Menu_Renew:SetSize((self._ui._subButton[index]:GetSizeX() + 10) * horizontalCount + 30, (self._ui._subButton[index]:GetSizeY() + 10) * math.ceil(self._xbox._count / horizontalCount) + 110)
  Panel_Window_Menu_Renew:SetPosX(getScreenSizeX() / 2 - Panel_Window_Menu_Renew:GetSizeX() / 2)
  Panel_Window_Menu_Renew:SetPosY(getScreenSizeY() / 2 - Panel_Window_Menu_Renew:GetSizeY() / 2)
  self._ui._topBg:SetSize(Panel_Window_Menu_Renew:GetSizeX() - 10, self._ui._topBg:GetSizeY())
end
function PaGlobal_Menu_Renew_Renew:HandleClicked_MenuButton(index)
  audioPostEvent_SystemUi(0, 0)
  if self._xbox._help == index then
    PaGlobal_Policy_ShowWindow(false)
  elseif self._xbox._escape == index then
    if ToClient_IsMyselfInArena() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_COMMON_ARLERT"))
      return
    elseif true == ToClient_getJoinGuildBattle() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TAG_CANTDO_GUILDBATTLE"))
      return
    end
    HandleClicked_RescueConfirm()
  elseif self._xbox._inven == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Inventory)
  elseif self._xbox._option == index then
    showGameOption()
  elseif self._xbox._gameExit == index then
    GameExitShowToggle(false)
  elseif self._xbox._blackSpirit == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_BlackSpirit)
  elseif self._xbox._questInfo == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_QuestHistory)
  elseif self._xbox._skill == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Skill)
  elseif self._xbox._myInfo == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_PlayerInfo)
  elseif self._xbox._knowledge == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_MentalKnowledge)
  elseif self._xbox._worldMap == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_WorldMap)
  elseif self._xbox._guild == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Guild)
  elseif self._xbox._friend == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_FriendList)
  elseif self._xbox._ringMenu == index then
    FromClient_ConsoleQuickMenu_OpenCustomPage(2)
  elseif self._xbox._pet == index then
    FGlobal_PetListNew_Toggle()
  elseif self._xbox._beauty == index then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_BeautyShop)
  elseif self._xbox._partyRecruite == index then
    PaGlobalFunc_FindParty_Show()
  elseif self._xbox._localWar == index then
    PaGlobalFunc_LocalWarInfo_Show()
  end
  Panel_Window_Menu_ShowToggle()
end
function Panel_Window_Menu_ShowToggle()
  local isShow = Panel_Window_Menu_Renew:GetShow()
  Panel_Window_Menu_Renew:SetShow(not isShow)
end
function PaGlobal_Menu_Renew_Renew:ShowAni()
end
function PaGlobal_Menu_Renew_Renew:HideAni()
end
function PaGlobal_Menu_Renew_Renew_Init()
  PaGlobal_Menu_Renew_Renew:Init()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobal_Menu_Renew_Renew_Init")
