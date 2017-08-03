-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\housing\panel_house_installationmode_villagetentpopup.luac 

-- params : ...
-- function num : 0
Panel_House_InstallationMode_VillageTent:SetShow(false)
Panel_House_InstallationMode_VillageTent:setMaskingChild(true)
Panel_House_InstallationMode_VillageTent:ActiveMouseEventEffect(true)
Panel_House_InstallationMode_VillageTent:setGlassBackground(true)
local bg = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "Static_VillageTentBG")
local btnClose = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "Button_CloseIcon")
local btnApply = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "Button_Apply")
local templateDay = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "StaticText_DayTemplate")
local templateRegion = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "StaticText_RegionTemplate")
local joinDesc = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "StaticText_VillageTent_JoinDesc")
local bottomBg = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "Static_NoticeBg")
local bottomDesc = (UI.getChildControl)(Panel_House_InstallationMode_VillageTent, "StaticText_NoticeDesc")
bottomDesc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
bottomDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_VILLAGETENTPOPUP_DESC"))
local regionInfoWrapper = {}
local dayControl = {}
local dayCount = 0
joinDesc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
btnClose:addInputEvent("Mouse_LUp", "VillageTent_Close()")
btnApply:addInputEvent("Mouse_LUp", "VillageTent_SetRegion()")
templateDay:SetShow(false)
templateRegion:SetShow(false)
local posY = templateDay:GetPosY()
local textGap = 25
local maxCount = 7
local dayString = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_SUNDAY"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_MONDAY"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_TUESDAY"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_WEDNESDAY"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_THUSDAY"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_FRIDAY"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGETENT_SATURDAY")}
VillageTent_Init = function()
  -- function num : 0_0 , upvalues : dayControl, maxCount, templateDay, posY, textGap, templateRegion
  dayControl = {}
  local temp = {}
  for index = 0, maxCount - 1 do
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

    dayControl[index] = {}
    temp[index] = {}
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (temp[index])._day = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_House_InstallationMode_VillageTent, "StaticText_Day_" .. index)
    CopyBaseProperty(templateDay, (temp[index])._day)
    ;
    ((temp[index])._day):SetPosY(posY + index * textGap)
    ;
    ((temp[index])._day):SetShow(false)
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (temp[index])._regionName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_House_InstallationMode_VillageTent, "StaticText_RegionName_" .. index)
    CopyBaseProperty(templateRegion, (temp[index])._regionName)
    ;
    ((temp[index])._regionName):SetPosY(posY + index * textGap)
    ;
    ((temp[index])._regionName):SetShow(false)
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R5 in 'UnsetPending'

    dayControl[index] = temp[index]
  end
end

FGlobal_VillageTent_SelectPopup = function()
  -- function num : 0_1 , upvalues : dayCount
  if Panel_House_InstallationMode_VillageTent:GetShow() then
    return 
  end
  local position = housing_getInstallationPos()
  local count = housing_getInstallableSiegeKeyList(position)
  dayCount = count
  Panel_House_InstallationMode_VillageTent:SetShow(true)
  VillageTent_ChangeFontColor(7)
  VillageTent_SetText(count)
end

VillageTent_SetText = function(count)
  -- function num : 0_2 , upvalues : maxCount, regionInfoWrapper, dayControl, dayString, joinDesc
  local position = housing_getInstallationPos()
  local warDay = ToClient_GetCurrentInstallableTentDayOfWeek(position)
  local currentDayIndex = -1
  for index = 0, maxCount - 1 do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R8 in 'UnsetPending'

    if index < count then
      regionInfoWrapper[index] = housing_getInstallableSiegeRegionInfo(index)
      local day = (regionInfoWrapper[index]):getVillageSiegeType()
      local regionName = (regionInfoWrapper[index]):getAreaName()
      local taxLevel = ((regionInfoWrapper[index]):get()):getVillageTaxLevel()
      ;
      ((dayControl[index])._day):SetText(dayString[day])
      ;
      ((dayControl[index])._day):SetShow(true)
      ;
      ((dayControl[index])._regionName):SetText(regionName .. "(" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_VILLAGETENT_GRADE", "index", taxLevel) .. ")")
      ;
      ((dayControl[index])._regionName):SetShow(true)
      if warDay == day then
        currentDayIndex = index
      end
    else
      do
        do
          ;
          ((dayControl[index])._day):SetShow(false)
          ;
          ((dayControl[index])._regionName):SetShow(false)
          -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if currentDayIndex >= 0 then
    VillageTent_ChangeFontColor(currentDayIndex)
    joinDesc:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_VILLAGETENT_SETDESC", "day", ((dayControl[currentDayIndex])._day):GetText(), "regionName", ((dayControl[currentDayIndex])._regionName):GetText()))
    joinDesc:SetShow(true)
  else
    joinDesc:SetShow(false)
  end
  VillageTent_SetSize(count)
end

VillageTent_SetSize = function(count)
  -- function num : 0_3 , upvalues : bg, textGap, joinDesc, dayControl, bottomDesc, bottomBg, btnApply
  bg:SetSize(bg:GetSizeX(), 70 + (count - 1) * textGap)
  joinDesc:SetPosY(((dayControl[count - 1])._day):GetPosY() + 30)
  bottomDesc:SetPosY(joinDesc:GetPosY() + joinDesc:GetTextSizeY() + 15)
  bottomBg:SetSize(bottomBg:GetSizeX(), bottomDesc:GetTextSizeY() + 15)
  Panel_House_InstallationMode_VillageTent:SetSize(Panel_House_InstallationMode_VillageTent:GetSizeX(), joinDesc:GetPosY() + joinDesc:GetTextSizeY() + bottomBg:GetSizeY() + 70)
  bottomBg:ComputePos()
  btnApply:ComputePos()
end

VillageTent_ChangeFontColor = function(index)
  -- function num : 0_4 , upvalues : dayCount, dayControl
  for ii = 0, dayCount - 1 do
    if ii == index then
      ((dayControl[ii])._day):SetFontColor((Defines.Color).C_FFFFCE22)
      ;
      ((dayControl[ii])._regionName):SetFontColor((Defines.Color).C_FFFFCE22)
      dayCheck = true
    else
      ;
      ((dayControl[ii])._day):SetFontColor((Defines.Color).C_FFC4BEBE)
      ;
      ((dayControl[ii])._regionName):SetFontColor((Defines.Color).C_FFC4BEBE)
    end
  end
end

VillageTent_SetRegion = function()
  -- function num : 0_5 , upvalues : dayCount
  local position = housing_getInstallationPos()
  local currentDay = ToClient_GetCurrentInstallableTentDayOfWeek(position)
  for ii = 0, dayCount - 1 do
    local regionInfoWrapper = housing_getInstallableSiegeRegionInfo(ii)
    local day = regionInfoWrapper:getVillageSiegeType()
    if currentDay == day then
      local regionKeyRaw = ((regionInfoWrapper:get())._regionKey):get()
      if ToClient_IsVillageSiegeInThisWeek(regionKeyRaw) then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_VILLAGETENTPOPUP_LASTWEEK"))
      else
        housing_InstallObject(regionKeyRaw)
        FGlobal_HouseInstallationControl_Close()
        FGlobal_House_InstallationMode_Close()
      end
    end
  end
end

VillageTent_Close = function()
  -- function num : 0_6
  Panel_House_InstallationMode_VillageTent:SetShow(false)
end

VillageTent_Init()

