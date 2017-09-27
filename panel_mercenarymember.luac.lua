-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\mercenary\panel_mercenarymember.luac 

-- params : ...
-- function num : 0
local CT_STRING = CppEnums.ClassType2String
Panel_Window_MercenaryList:SetShow(false)
local enTerritoryString = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYSTRING_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYSTRING_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYSTRING_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYSTRING_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYSTRING_4")}
local mercenaryList = {_territoryName, _myName; 
_ui = {_list2_Member, _text_MilitiaName, _text_Count, _text_TopGuide, _btn_exit, _btn_Attack, _btn_TerritoryBG}
, _isStart = false, _listCount = 0, _isAttackTeam = false, _currnetTerritory = 0, _realMemberCount = 0, _memberLimit = 50, _lastTick = 0}
mercenaryList.Initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._list2_Member = (UI.getChildControl)(Panel_Window_MercenaryList, "List2_MilitiaList")
  ;
  ((self._ui)._list2_Member):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._list2_Member):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobal_MercenaryMember_UpdateList")
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._text_MilitiaName = (UI.getChildControl)(Panel_Window_MercenaryList, "StaticText_MilitiaName")
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._text_Count = (UI.getChildControl)(Panel_Window_MercenaryList, "StaticText_Count")
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._text_TopGuide = (UI.getChildControl)(Panel_Window_MercenaryList, "StaticText_TopGuide")
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btn_exit = (UI.getChildControl)(Panel_Window_MercenaryList, "Button_Close")
  ;
  ((self._ui)._btn_exit):addInputEvent("Mouse_LUp", "PaGlobal_MercenaryList_Window_Close()")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btn_Attack = (UI.getChildControl)(Panel_Window_MercenaryList, "Button_Attack")
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btn_TerritoryBG = (UI.getChildControl)(Panel_Window_MercenaryList, "Static_TerritoryBG")
end

PaGlobal_MercenaryList_Window_Open = function()
  -- function num : 0_1 , upvalues : mercenaryList, enTerritoryString
  if ((getSelfPlayer()):get()):isVolunteer() == false then
    return 
  end
  local self = mercenaryList
  local volunteerInfo = nil
  self._listCount = 0
  local memberCount = ToClient_GetOnlineVolunteerListCount()
  self._isAttackTeam = ((getSelfPlayer()):get()):isVolunteerAttackTeam()
  self._currentTerritory = ((getSelfPlayer()):get()):getVolunteerTerritorKeyForLua()
  self._realMemberCount = memberCount
  ;
  (((self._ui)._list2_Member):getElementManager()):clearKey()
  for index = 0, memberCount - 1 do
    volunteerInfo = nil
    volunteerInfo = ToClient_GetOnlineVolunteerInfoIndex(index)
    if volunteerInfo ~= nil then
      (((self._ui)._list2_Member):getElementManager()):pushKey(index)
    end
  end
  ;
  ((self._ui)._text_MilitiaName):SetText(enTerritoryString[self._currentTerritory] .. " " .. self:getAttackName() .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MERCENARY_TITLE"))
  ;
  ((self._ui)._text_Count):SetText("참여인원 : " .. tostring(memberCount) .. " �\133")
  ;
  ((self._ui)._text_TopGuide):SetText("")
  self:ChangeMillitiaTeam()
  Panel_Window_MercenaryList:SetShow(true)
end

mercenaryList.ChangeMillitiaTeam = function(self)
  -- function num : 0_2
  local x1, y1, x2, y2, x3, y3, x4, y4 = nil, nil, nil, nil, nil, nil, nil, nil
  if self._isAttackTeam == true then
    x1 = setTextureUV_Func((self._ui)._btn_Attack, 2, 2, 76, 96)
  else
    -- DECOMPILER ERROR at PC24: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC26: Overwrote pending register: R2 in 'AssignReg'

    x1 = setTextureUV_Func((self._ui)._btn_Attack, 2, 98, 76, 194)
  end
  if self._currentTerritory == 0 then
    x3 = setTextureUV_Func((self._ui)._btn_TerritoryBG, 1, 320, 478, 400)
  else
    -- DECOMPILER ERROR at PC55: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC56: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC57: Overwrote pending register: R6 in 'AssignReg'

    if self._currentTerritory == 1 then
      x3 = setTextureUV_Func((self._ui)._btn_TerritoryBG, 1, 2, 478, 80)
    else
      -- DECOMPILER ERROR at PC71: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC72: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC73: Overwrote pending register: R6 in 'AssignReg'

      if self._currentTerritory == 2 then
        x3 = setTextureUV_Func((self._ui)._btn_TerritoryBG, 1, 2, 478, 80)
      else
        -- DECOMPILER ERROR at PC87: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC88: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC89: Overwrote pending register: R6 in 'AssignReg'

        if self._currentTerritory == 3 then
          x3 = setTextureUV_Func((self._ui)._btn_TerritoryBG, 1, 160, 478, 240)
        else
          -- DECOMPILER ERROR at PC103: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC104: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC105: Overwrote pending register: R6 in 'AssignReg'

          if self._currentTerritory == 4 then
            x3 = setTextureUV_Func((self._ui)._btn_TerritoryBG, 1, 2, 478, 80)
          end
        end
      end
    end
  end
  ;
  (((self._ui)._btn_TerritoryBG):getBaseTexture()):setUV(x3, y3, x4, y4)
  ;
  ((self._ui)._btn_TerritoryBG):setRenderTexture(((self._ui)._btn_TerritoryBG):getBaseTexture())
  ;
  (((self._ui)._btn_Attack):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  ((self._ui)._btn_Attack):setRenderTexture(((self._ui)._btn_Attack):getBaseTexture())
  ;
  ((self._ui)._btn_Attack):SetText(self:getAttackName())
end

PaGlobal_MercenaryList_Window_Close = function()
  -- function num : 0_3
  Panel_Window_MercenaryList:SetShow(false)
end

mercenaryList.getAttackName = function(self)
  -- function num : 0_4
  if self._isAttackTeam == true then
    return PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MERCENARY_ATTACKTITLE")
  else
    return PAGetString(Defines.StringSheet_RESOURCE, "PANEL_MERCENARY_DEFFENCETITLE")
  end
end

PaGlobal_MercenaryMember_UpdateList = function(content, key)
  -- function num : 0_5 , upvalues : mercenaryList, CT_STRING
  local self = mercenaryList
  local index = Int64toInt32(key)
  local Text_level = (UI.getChildControl)(content, "StaticText_Level")
  local Text_classType = (UI.getChildControl)(content, "StaticText_Class")
  local Text_name = (UI.getChildControl)(content, "StaticText_CharacterName")
  local volunteerInfo = ToClient_GetOnlineVolunteerInfoIndex(index)
  Text_name:SetText(volunteerInfo:getCharacterName())
  Text_classType:SetText(CT_STRING[volunteerInfo:getClassType()])
  Text_level:SetText(volunteerInfo:getLevel())
end

FromClient_StartMercenaryMemberList = function()
  -- function num : 0_6
end

FromClient_EndMercenaryMemberList = function()
  -- function num : 0_7 , upvalues : mercenaryList
  local self = mercenaryList
  self._isStart = false
end

mercenaryList.registerEvent = function(self)
  -- function num : 0_8
  registerEvent("FromClient_StartMercenaryMemberList", "FromClient_StartMercenaryMemberList")
  registerEvent("FromClient_EndMercenaryMemberList", "FromClient_EndMercenaryMemberList")
  registerEvent("FromClient_CompleteRefresh", "PaGlobal_MercenaryList_Window_Open")
end

mercenaryList:Initialize()
mercenaryList:registerEvent()
PaGlobal_MercenaryList_Refresh = function()
  -- function num : 0_9
  ToClient_RequestOnlineVolunteerList()
end

mercenaryList.Start = function(self)
  -- function num : 0_10
  self:Initialize()
  PaGlobal_MercenaryMember_UpdateList()
  PaGlobal_MercenaryList_Window_Open()
end

mercenaryList.End = function(self)
  -- function num : 0_11
  PaGlobal_MercenaryList_Window_Close()
end

Test_mcupdate = function()
  -- function num : 0_12 , upvalues : mercenaryList
  mercenaryList:Start()
end

Test_RequestMember = function()
  -- function num : 0_13 , upvalues : mercenaryList
  local selfPlayer = (getSelfPlayer()):get()
  local myTerritoryKey = selfPlayer:getVolunteerTerritorKeyForLua()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  mercenaryList._isAttackTeam = selfPlayer:isVolunteerAttackTeam()
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  mercenaryList._currentTerritory = myTerritoryKey
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  mercenaryList._territoryName = ToClient_GetRegionNameByRegionKey(myTerritoryKey)
  ToClient_RequestOnlineVolunteerList()
end

Test_Open = function(isbool)
  -- function num : 0_14
  Panel_Window_MercenaryList:SetShow(isbool)
end

testShow = function(bool)
  -- function num : 0_15 , upvalues : mercenaryList
  local self = mercenaryList
  self._isAttackTeam = bool
  self:ChangeMillitiaTeam()
  Panel_Window_MercenaryList:SetShow(true)
end


