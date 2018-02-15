-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movieworldmapguide_web.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieWorldMapGuide_Web = {btn_Close = (UI.getChildControl)(Panel_MovieWorldMapGuide_Web, "Button_Close")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieWorldMapGuide_Web, "WebControl_MovieGuideWeb_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(260, 210)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieWorldMapGuide_Web.init = function(self)
  -- function num : 0_0
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieWorldMapGuide_Web:Close()")
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieWorldMapGuide_Web.Open = function(self)
  -- function num : 0_1 , upvalues : _Web
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local userNo = ((getSelfPlayer()):get()):getUserNo()
  local movieGuideWeb = PaGlobal_URL_Check(worldNo)
  Panel_MovieWorldMapGuide_Web:SetPosX(getScreenSizeX() / 2 - Panel_MovieWorldMapGuide_Web:GetSizeX() / 2)
  Panel_MovieWorldMapGuide_Web:SetPosY(getScreenSizeY() / 2 - Panel_MovieWorldMapGuide_Web:GetSizeY() / 2)
  if movieGuideWeb ~= nil then
    local url = movieGuideWeb .. "/MovieGuide/Index/WorldMapGuide?userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey)
    _Web:SetUrl(260, 210, url, false, true)
    Panel_MovieWorldMapGuide_Web:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieWorldMapGuide_Web.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieWorldMapGuide_Web:SetShow(false)
  _Web:ResetUrl()
  PaGlobal_MovieGuide_Weblist:Close()
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieWorldMapGuide_Web.GuideWebCodeExecute = function(self, titleName, youtubeUrl)
  -- function num : 0_3
end

PaGlobal_MovieWorldMapGuide_Web:init()

