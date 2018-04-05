-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\movie\panel_movieguide_weblist.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieGuide_Weblist = {btn_Close = (UI.getChildControl)(Panel_MovieGuide_Weblist, "Button_Close"), txt_Title = (UI.getChildControl)(Panel_MovieGuide_Weblist, "StaticText_Title")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieGuide_Weblist, "WebControl_MovieGuideList_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(640, 480)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Weblist.init = function(self)
  -- function num : 0_0
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieGuide_Weblist:Close()")
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Weblist.Open = function(self, title, youtubeURL)
  -- function num : 0_1 , upvalues : _Web
  if title ~= nil then
    (self.txt_Title):SetText(tostring(title))
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local userNo = ((getSelfPlayer()):get()):getUserNo()
  local url = PaGlobal_URL_Check(worldNo)
  Panel_MovieGuide_Weblist:SetPosX(getScreenSizeX() / 2 - Panel_MovieGuide_Weblist:GetSizeX() / 2)
  Panel_MovieGuide_Weblist:SetPosY(getScreenSizeY() / 2 - Panel_MovieGuide_Weblist:GetSizeY() / 2)
  do
    if url ~= nil then
      local realUrl = url .. "/MovieGuide/Index/IngameMoviePop?YoutubeUrl=" .. youtubeURL .. "&userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey)
      _Web:SetUrl(640, 480, realUrl, false, true)
    end
    Panel_MovieGuide_Weblist:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Weblist.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieGuide_Weblist:SetShow(false)
  _Web:ResetUrl()
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
end

PaGlobal_MovieGuide_Weblist:init()

