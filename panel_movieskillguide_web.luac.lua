-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movieskillguide_web.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieSkillGuide_Web = {btn_Close = (UI.getChildControl)(Panel_MovieSkillGuide_Web, "Button_Close")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieSkillGuide_Web, "WebControl_MovieSkillGuideWeb_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(320, 430)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Web.init = function(self)
  -- function num : 0_0 , upvalues : _Web
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieSkillGuide_Web:Close()")
  local checkAgeType = ToClient_isAdultUser()
  if checkAgeType then
    _Web:SetMonoTone(false)
  else
    _Web:SetMonoTone(true)
  end
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Web.Open = function(self)
  -- function num : 0_1 , upvalues : _Web
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local classType = selfPlayer:getClassType()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local movieGuideWeb = PaGlobal_URL_Check(worldNo)
  Panel_MovieSkillGuide_Web:SetPosX(getScreenSizeX() / 2 - Panel_MovieSkillGuide_Web:GetSizeX() / 2)
  Panel_MovieSkillGuide_Web:SetPosY(getScreenSizeY() / 2 - Panel_MovieSkillGuide_Web:GetSizeY() / 2)
  if movieGuideWeb ~= nil then
    local url = movieGuideWeb .. "/MovieGuide/Index/IngameSkill?classType=" .. classType
    _Web:SetUrl(320, 430, url, false, true)
    Panel_MovieSkillGuide_Web:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Web.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieSkillGuide_Web:SetShow(false)
  _Web:ResetUrl()
end

PaGlobal_MovieSkillGuide_Web:init()

