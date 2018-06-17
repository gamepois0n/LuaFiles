local UI_TM = CppEnums.TextMode
PaGlobal_MovieSkillGuide_Web = {
  btn_Close = UI.getChildControl(Panel_MovieSkillGuide_Web, "Button_Close")
}
local _Web = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_WEBCONTROL, Panel_MovieSkillGuide_Web, "WebControl_MovieSkillGuideWeb_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(320, 430)
_Web:ResetUrl()
function PaGlobal_MovieSkillGuide_Web:init()
  self.btn_Close:addInputEvent("Mouse_LUp", "PaGlobal_MovieSkillGuide_Web:Close()")
end
function PaGlobal_MovieSkillGuide_Web:Open()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local classType = selfPlayer:getClassType()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local cryptKey = getSelfPlayer():get():getWebAuthenticKeyCryptString()
  local userNo = getSelfPlayer():get():getUserNo()
  local movieGuideWeb = PaGlobal_URL_Check(worldNo)
  Panel_MovieSkillGuide_Web:SetPosX(getScreenSizeX() / 2 - Panel_MovieSkillGuide_Web:GetSizeX() / 2)
  Panel_MovieSkillGuide_Web:SetPosY(getScreenSizeY() / 2 - Panel_MovieSkillGuide_Web:GetSizeY() / 2)
  if nil ~= movieGuideWeb then
    local url = movieGuideWeb .. "/MovieGuide/Index/IngameSkill?classType=" .. classType .. "&userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey)
    _Web:SetUrl(320, 430, url, false, true)
    Panel_MovieSkillGuide_Web:SetShow(true)
  end
end
function PaGlobal_MovieSkillGuide_Web:Close()
  Panel_MovieSkillGuide_Web:SetShow(false)
  _Web:ResetUrl()
  audioPostEvent_SystemUi(1, 1)
end
PaGlobal_MovieSkillGuide_Web:init()
