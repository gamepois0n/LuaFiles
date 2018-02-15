-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movieskillguide_weblist.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieSkillGuide_Weblist = {btn_Close = (UI.getChildControl)(Panel_MovieSkillGuide_Weblist, "Button_Close"), txt_Title = (UI.getChildControl)(Panel_MovieSkillGuide_Weblist, "StaticText_Title")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieSkillGuide_Weblist, "WebControl_MovieGuideList_WebLink")
_Web:SetShow(true)
_Web:SetPosX(11)
_Web:SetPosY(50)
_Web:SetSize(640, 544)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Weblist.init = function(self)
  -- function num : 0_0
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieSkillGuide_Weblist:Close()")
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Weblist.Open = function(self, title, youtubeURL, strKey)
  -- function num : 0_1 , upvalues : _Web
  if title ~= nil then
    (self.txt_Title):SetText(tostring(title))
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local userNo = ((getSelfPlayer()):get()):getUserNo()
  local url = PaGlobal_URL_Check(worldNo)
  Panel_MovieSkillGuide_Weblist:SetPosX(getScreenSizeX() / 2 - Panel_MovieSkillGuide_Weblist:GetSizeX() / 2)
  Panel_MovieSkillGuide_Weblist:SetPosY(getScreenSizeY() / 2 - Panel_MovieSkillGuide_Weblist:GetSizeY() / 2)
  do
    if url ~= nil then
      local realURL = url .. "/MovieGuide/Index/IngameSkillPop?ComboDesc=" .. tostring(strKey) .. "&YoutubeUrl=" .. youtubeURL .. "&userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey)
      _Web:SetUrl(640, 544, realURL, false, true)
    end
    Panel_MovieSkillGuide_Weblist:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Weblist.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieSkillGuide_Weblist:SetShow(false)
  _Web:ResetUrl()
end

PaGlobal_MovieSkillGuide_Weblist:init()

