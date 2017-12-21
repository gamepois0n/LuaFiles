-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movieguide_web.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieGuide_Web = {btn_Close = (UI.getChildControl)(Panel_MovieGuide_Web, "Button_Close")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieGuide_Web, "WebControl_MovieGuideWeb_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(320, 430)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.init = function(self)
  -- function num : 0_0
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieGuide_Web:Close()")
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.Open = function(self)
  -- function num : 0_1 , upvalues : _Web
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local movieGuideWeb = PaGlobal_URL_Check(worldNo)
  Panel_MovieGuide_Web:SetPosX(getScreenSizeX() / 2 - Panel_MovieGuide_Web:GetSizeX() / 2)
  Panel_MovieGuide_Web:SetPosY(getScreenSizeY() / 2 - Panel_MovieGuide_Web:GetSizeY() / 2)
  if movieGuideWeb ~= nil then
    local url = movieGuideWeb .. "/MovieGuide/Index"
    _Web:SetUrl(320, 430, url, false, true)
    Panel_MovieGuide_Web:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieGuide_Web:SetShow(false)
  _Web:ResetUrl()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.GuideWebCodeExecute = function(self, titleName, youtubeUrl)
  -- function num : 0_3
end

PaGlobal_MovieGuide_Web:init()

