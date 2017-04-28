-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\mercenary\panel_mercenary.luac 

-- params : ...
-- function num : 0
Panel_Window_Mercenary:SetShow(false)
local mercenaryInfo = {list2 = (UI.getChildControl)(Panel_Window_Mercenary, "List2_MercenaryList"), btn_Close = (UI.getChildControl)(Panel_Window_Mercenary, "Button_Close"), applyButton = (UI.getChildControl)(Panel_Window_Mercenary, "Button_Enter"), cancelButton = (UI.getChildControl)(Panel_Window_Mercenary, "Button_Leave")}
Mercenary_Initialize = function()
  -- function num : 0_0 , upvalues : mercenaryInfo
  local self = mercenaryInfo
end

FGlobal_MercenaryOpen = function()
  -- function num : 0_1
  Panel_Window_Mercenary:SetShow(true)
  Mercenary_Update()
end

FGlbal_MercenaryClose = function()
  -- function num : 0_2
  Panel_Window_Mercenary:SetShow(false)
end

Mercenary_Update = function()
  -- function num : 0_3 , upvalues : mercenaryInfo
  local self = mercenaryInfo
  local applyCount = ToClient_GetMilitiaListCount()
  local applyList = ToClient_MilitiaListReq()
  _PA_LOG("임승�\177", " count :" .. tostring(applyCount) .. " / list :" .. tostring(applyList))
  ;
  ((self.list2):getElementManager()):clearKey()
  for count = 0, applyCount - 1 do
    local militiaInfo = ToClient_GetMilitiaInfoIndex(count)
    _PA_LOG("임승�\177", " userNo :" .. tostring(militiaInfo:getUserNo()))
    ;
    ((self.list2):getElementManager()):pushKey(toInt64(0, count))
  end
end

Mercenary_ListControlCreate = function(content, key)
  -- function num : 0_4 , upvalues : mercenaryInfo
  local self = mercenaryInfo
  local index = Int64toInt32(key)
  local militiaInfo = ToClient_GetMilitiaInfoIndex(index)
  if militiaInfo == nil then
    return 
  end
  local name = (UI.getChildControl)(content, "StaticText_List2_CharacterName")
  name:SetText("캐릭터명 : " .. militiaInfo:getCharacterName() .. " / 유저넘버 : " .. tostring(militiaInfo:getUserNo()))
end

Mercenary_Apply = function()
  -- function num : 0_5
  ToClient_MilitiaEnterReq()
  Mercenary_Update()
end

Mercenary_Cancel = function()
  -- function num : 0_6
  ToClient_MilitiaLeaveReq()
  Mercenary_Update()
end

Mercenary_registMessageHandler = function()
  -- function num : 0_7 , upvalues : mercenaryInfo
  local self = mercenaryInfo
  ;
  (self.list2):changeAnimationSpeed(10)
  ;
  (self.list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Mercenary_ListControlCreate")
  ;
  (self.list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.applyButton):addInputEvent("Mouse_LUp", "Mercenary_Apply()")
  ;
  (self.cancelButton):addInputEvent("Mouse_LUp", "Mercenary_Cancel()")
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "FGlbal_MercenaryClose()")
end

Mercenary_Initialize()
Mercenary_registMessageHandler()

