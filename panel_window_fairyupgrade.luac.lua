-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fairyinfo\panel_window_fairyupgrade.luac 

-- params : ...
-- function num : 0
Panel_Window_FairyUpgrade:SetShow(false)
local _Static_MainBG = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Static_MainBG")
local _Static_BottomBG = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Static_BottomBG")
local FairyUpgrade = {_FiaryNoStr = nil, _StoneNoStr = nil, _FairyName = nil, _isClickUpgrade = false, _aniMationTime = 5, 
_UI = {_Static_FairyIcon = (UI.getChildControl)(_Static_MainBG, "Static_FairyIcon"), _Static_StoneIcon = (UI.getChildControl)(_Static_MainBG, "Static_StoneIcon"), _StaticText_MainBGTitle = (UI.getChildControl)(_Static_MainBG, "StaticText_MainBGTitle"), _StaticText_Bottom_Tier = (UI.getChildControl)(_Static_MainBG, "StaticText_Bottom_Tier"), _StaticText_Bottom_NextInfo_Desc = (UI.getChildControl)(_Static_MainBG, "StaticText_Bottom_NextInfo_Desc"), _Button_Upgrade = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Button_Upgrade"), _BottomBG_Desc = (UI.getChildControl)(_Static_BottomBG, "StaticText_BottomDesc"), _Button_Close = (UI.getChildControl)(Panel_Window_FairyUpgrade, "Button_Win_Close")}
}
PaGlobal_FairyUpgrade_RegistFairy = function(fairyNoStr)
  -- function num : 0_0 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  self._FairyNoStr = fairyNoStr
  local fairyNo_s64 = (tonumber64(fairyNoStr))
  local iconPath, mainName, currentTier = nil, nil, nil
  local sealPetCount = ToClient_getFairySealedList()
  for index = 0, sealPetCount - 1 do
    local pcPetData = ToClient_getFairySealedDataByIndex(index)
    if pcPetData ~= nil and fairyNo_s64 == pcPetData._petNo then
      local petStaticStatus = pcPetData:getPetStaticStatus()
      iconPath = pcPetData:getIconPath()
      mainName = pcPetData:getName()
      currentTier = petStaticStatus:getPetTier()
    end
  end
  ;
  ((self._UI)._StaticText_MainBGTitle):SetText(mainName)
  ;
  ((self._UI)._StaticText_Bottom_Tier):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", tostring(currentTier + 1)) .. " -> " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", tostring(currentTier + 2)))
  local strText = "LUA_FAIRY_SKILL_TIER" .. tostring(currentTier + 2)
  ;
  ((self._UI)._StaticText_Bottom_NextInfo_Desc):SetText(PAGetString(Defines.StringSheet_GAME, strText))
  ;
  ((self._UI)._Static_FairyIcon):ChangeTextureInfoName(iconPath)
  ;
  ((self._UI)._Static_FairyIcon):SetShow(true)
  self._FairyName = mainName
end

PaGlobal_FairyUpgrade_RegistStone = function(stoneNoStr)
  -- function num : 0_1 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  self._StoneNoStr = stoneNoStr
  local fairyNo_s64 = (tonumber64(stoneNoStr))
  local iconPath = nil
  local sealPetCount = ToClient_getFairySealedList()
  for index = 0, sealPetCount - 1 do
    local pcPetData = ToClient_getFairySealedDataByIndex(index)
    if pcPetData ~= nil and fairyNo_s64 == pcPetData._petNo then
      iconPath = pcPetData:getIconPath()
    end
  end
  ;
  ((self._UI)._Static_StoneIcon):ChangeTextureInfoName(iconPath)
  ;
  ((self._UI)._Static_StoneIcon):SetShow(true)
end

PaGlobal_FairyUpgrade_Request = function()
  -- function num : 0_2 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  ToClient_requestPetFusion(self._FairyName, tonumber64(self._FairyNoStr), tonumber64(self._StoneNoStr), 0, 0)
end

PaGlobal_FairyUpgrade_Open = function()
  -- function num : 0_3 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  self:Clear()
  if Panel_Window_FairySetting:GetShow() then
    PaGlobal_FairySetting_Close()
  end
  if Panel_Window_FairyUpgrade:GetShow() then
    PaGlobal_FairyUpgrade_Close()
    return 
  end
  Panel_Window_FairyUpgrade:SetShow(true)
  Panel_Window_FairyUpgrade:SetPosX(Panel_Window_FairyListNew:GetPosX() + Panel_Window_FairyListNew:GetSizeX())
  Panel_Window_FairyUpgrade:SetPosY(Panel_Window_FairyListNew:GetPosY())
end

PaGlobal_FairyUpgrade_Close = function()
  -- function num : 0_4
  Panel_Window_FairyUpgrade:SetShow(false)
  FromClient_FairyUpdateNew()
end

FairyUpgrade.Clear = function(self)
  -- function num : 0_5
  ((self._UI)._Static_FairyIcon):SetShow(false)
  ;
  ((self._UI)._Static_StoneIcon):SetShow(false)
end

UpdateFunc_CheckFairyUpgradeAnime = function(deltaTime)
  -- function num : 0_6 , upvalues : FairyUpgrade
  local self = FairyUpgrade
  if self._isClickUpgrade == false then
    return 
  end
end

FairyUpgrade.RegistEvent = function(self)
  -- function num : 0_7
  ((self._UI)._Button_Upgrade):addInputEvent("Mouse_LUp", "PaGlobal_FairyUpgrade_Request()")
  Panel_Window_FairyUpgrade:RegisterUpdateFunc("UpdateFunc_CheckFairyUpgradeAnime")
  ;
  ((self._UI)._StaticText_Bottom_NextInfo_Desc):SetText(" ")
  ;
  ((self._UI)._Button_Close):addInputEvent("Mouse_LUp", "PaGlobal_FairyUpgrade_Close()")
  ;
  ((self._UI)._Button_Close):SetShow(true)
end

FairyUpgrade.Initialize = function(self)
  -- function num : 0_8
  self._FiaryNoStr = nil
  self._StoneNoStr = nil
  self._FairyName = nil
  self:RegistEvent()
end

FairyUpgrade:Initialize()

