-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\menu\console\panel_window_menu_renew.luac 

-- params : ...
-- function num : 0
PaGlobal_Menu_Renew_Renew = {
_ui = {
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
}
, 
_xbox = {}
}
-- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew._xbox = {_help = 0, _escape = 1, _inven = 2, _option = 3, _gameExit = 4, _blackSpirit = 5, _questInfo = 6, _skill = 7, _manufacture = 8, _myInfo = 9, _knowledge = 10, _worldMap = 11, _guild = 12, _friend = 13, _ringMenu = 14, _count = 15}
-- DECOMPILER ERROR at PC284: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew._categoryData = {
[(PaGlobal_Menu_Renew_Renew._xbox)._help] = {_string = "Policy", _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 201, _y1 = 3, _x2 = 261, _y2 = 63}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._escape] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_ESCAPE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 387, _y1 = 3, _x2 = 447, _y2 = 63}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._option] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_OPTION"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 325, _y1 = 3, _x2 = 385, _y2 = 63}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._inven] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BAG"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 449, _y1 = 3, _x2 = 509, _y2 = 63}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._gameExit] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_EXIT"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu_01.dds", _x1 = 263, _y1 = 3, _x2 = 323, _y2 = 63}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._blackSpirit] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BLACKSPIRIT"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 2, _y1 = 64, _x2 = 62, _y2 = 124}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._questInfo] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_QUESTHISTORY"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 64, _x2 = 124, _y2 = 124}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._skill] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_SKILL"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 188, _y1 = 2, _x2 = 248, _y2 = 62}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._manufacture] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_BTN_MANUFACTURE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 188, _x2 = 186, _y2 = 248}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._myInfo] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MYINFO"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 64, _y1 = 2, _x2 = 124, _y2 = 62}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._knowledge] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_MENTALKNOWLEDGE"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 126, _y1 = 64, _x2 = 186, _y2 = 124}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._worldMap] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_WORLDMAP"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 312, _y1 = 2, _x2 = 372, _y2 = 62}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._guild] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_GUILD"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 250, _y1 = 2, _x2 = 310, _y2 = 62}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._friend] = {_string = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_FRIENDLIST"), _hotKey = "", _path = "Renewal/Button/Console_Btn_ESCMenu.dds", _x1 = 250, _y1 = 64, _x2 = 310, _y2 = 124}
, 
[(PaGlobal_Menu_Renew_Renew._xbox)._ringMenu] = {_string = "Edit RingMenu", _hotKey = "", _path = "Renewal/Function/Console_Function_RingMenu_01.dds", _x1 = 205, _y1 = 445, _x2 = 255, _y2 = 495}
}
-- DECOMPILER ERROR at PC287: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew.ShowAni = function(self)
  -- function num : 0_0
end

-- DECOMPILER ERROR at PC290: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew.HideAni = function(self)
  -- function num : 0_1
end

-- DECOMPILER ERROR at PC293: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew.Init = function(self)
  -- function num : 0_2
  Panel_Window_Menu_Renew:SetShow(false)
  Panel_Window_Menu_Renew:setGlassBackground(true)
  Panel_Window_Menu_Renew:ActiveMouseEventEffect(true)
  Panel_Window_Menu_Renew:RegisterShowEventFunc(true, "PaGlobal_Menu_Renew_Renew:ShowAni()")
  Panel_Window_Menu_Renew:RegisterShowEventFunc(false, "PaGlobal_Menu_Renew_Renew:HideAni()")
  for index = 0, 14 do
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._subButton)[index] = (UI.getChildControl)(Panel_Window_Menu_Renew, "StaticText_ButtonBg_" .. index)
    ;
    (((self._ui)._subButton)[index]):SetText(((self._categoryData)[index])._string)
    ;
    (((self._ui)._subButton)[index]):addInputEvent("Mouse_LUp", "PaGlobal_Menu_Renew_Renew:HandleClicked_MenuButton(" .. index .. ")")
    -- DECOMPILER ERROR at PC63: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._subIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Button_MenuIcon")
    -- DECOMPILER ERROR at PC73: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._hotKey)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "StaticText_HotKey")
    -- DECOMPILER ERROR at PC83: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._newIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Static_NewIcon")
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._hotIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Static_HotIcon")
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._checkIcon)[index] = (UI.getChildControl)(((self._ui)._subButton)[index], "Static_CheckIcon")
    local categoryData = (self._categoryData)[index]
    ;
    (((self._ui)._subIcon)[index]):ChangeTextureInfoName(categoryData._path)
    local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._subIcon)[index], categoryData._x1, categoryData._y1, categoryData._x2, categoryData._y2)
    ;
    ((((self._ui)._subIcon)[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (((self._ui)._subIcon)[index]):setRenderTexture((((self._ui)._subIcon)[index]):getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC296: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew.HandleClicked_MenuButton = function(self, index)
  -- function num : 0_3
  audioPostEvent_SystemUi(0, 0)
  if (self._xbox)._help == index then
    PaGlobal_Policy_ShowWindow(false)
  else
    if (self._xbox)._escape == index then
      if ToClient_IsMyselfInArena() then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_COMMON_ARLERT"))
        return 
      else
        if ToClient_getJoinGuildBattle() == true then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TAG_CANTDO_GUILDBATTLE"))
          return 
        end
      end
      HandleClicked_RescueConfirm()
    else
      if (self._xbox)._inven == index then
        GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Inventory)
      else
        if (self._xbox)._option == index then
          showGameOption()
        else
          if (self._xbox)._gameExit == index then
            GameExitShowToggle(false)
          else
            if (self._xbox)._blackSpirit == index then
              GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_BlackSpirit)
            else
              if (self._xbox)._questInfo == index then
                GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_QuestHistory)
              else
                if (self._xbox)._skill == index then
                  GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Skill)
                else
                  if (self._xbox)._manufacture == index then
                    GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Manufacture)
                  else
                    if (self._xbox)._myInfo == index then
                      GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_PlayerInfo)
                    else
                      if (self._xbox)._knowledge == index then
                        GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_MentalKnowledge)
                      else
                        if (self._xbox)._worldMap == index then
                          GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_WorldMap)
                        else
                          if (self._xbox)._guild == index then
                            GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_Guild)
                          else
                            if (self._xbox)._friend == index then
                              GlobalKeyBinder_MouseKeyMap((CppEnums.UiInputType).UiInputType_FriendList)
                            else
                              if (self._xbox)._ringMenu == index then
                                FromClient_ConsoleQuickMenu_OpenCustomPage(2)
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
  Panel_Window_Menu_ShowToggle()
end

Panel_Window_Menu_ShowToggle = function()
  -- function num : 0_4
  local isShow = Panel_Window_Menu_Renew:GetShow()
  Panel_Window_Menu_Renew:SetShow(not isShow)
end

-- DECOMPILER ERROR at PC301: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew.ShowAni = function(self)
  -- function num : 0_5
end

-- DECOMPILER ERROR at PC304: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Menu_Renew_Renew.HideAni = function(self)
  -- function num : 0_6
end

PaGlobal_Menu_Renew_Renew_Init = function()
  -- function num : 0_7
  PaGlobal_Menu_Renew_Renew:Init()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobal_Menu_Renew_Renew_Init")

