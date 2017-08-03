-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\profile\panel_window_profile.luac 

-- params : ...
-- function num : 0
Panel_Window_Profile:SetShow(false)
Panel_Window_Profile:RegisterShowEventFunc(true, "ProfileShowAni()")
Panel_Window_Profile:RegisterShowEventFunc(false, "ProfileHideAni()")
local buttonClose = (UI.getChildControl)(Panel_Window_Profile, "Button_Win_Close")
local labelStatic = (UI.getChildControl)(Panel_Window_Profile, "StaticText_ProfileInfo")
Profile_registEventHandler = function()
  -- function num : 0_0 , upvalues : buttonClose
  buttonClose:addInputEvent("Mouse_LUp", "HandleClicked_ProfileWindow_Close()")
end

HandleClicked_ProfileWindow_Close = function()
  -- function num : 0_1
  if Panel_Window_Profile:IsShow() then
    Panel_Window_Profile:SetShow(false)
  end
end

ProfileShowAni = function()
  -- function num : 0_2
end

ProfileHideAni = function()
  -- function num : 0_3
end

registerEvent("Profile_Updatelist", "Profile_Updatelist")
Profile_Updatelist = function()
  -- function num : 0_4 , upvalues : labelStatic
  _PA_LOG("규보", "    ProfileShowAni")
  Panel_Window_Profile:SetShow(true)
  local strHelpText_Type = {"---------Accum----------", "---------Day------------", "---------Week-----------", "---------Month----------"}
  local strHelpText = {"[Monster Kill Count] : ", "[Fishing Count] : ", "[PickupItem Count] : ", "[PickupItem Weight Accum] : "}
  local nArrTerm = {(CppEnums.ProfileInitTermType).eProfileInitTermType_None, (CppEnums.ProfileInitTermType).eProfileInitTermType_Day, (CppEnums.ProfileInitTermType).eProfileInitTermType_Week, (CppEnums.ProfileInitTermType).eProfileInitTermType_Month}
  local strSet = ""
  for k = 0, (CppEnums.ProfileInitTermType).eProfileInitTermType_Maxcount - 1 do
    strSet = strSet .. strHelpText_Type[k + 1] .. "\n"
    for i = 0, (CppEnums.ProfileIndex).eUserProfileValueType_Count - 1 do
      local profileInfo = ToClient_GetProfileInfo(nArrTerm[k + 1], i)
      strSet = strSet .. strHelpText[i + 1] .. tostring(profileInfo) .. "\n"
    end
    strSet = strSet .. "\n\n"
  end
  labelStatic:SetText(strSet)
end

Profile_registEventHandler()

