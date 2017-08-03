-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dailystamp\panel_window_dailystamp.luac 

-- params : ...
-- function num : 0
Panel_Window_DailyStamp:SetShow(false, false)
Panel_Window_DailyStamp:ActiveMouseEventEffect(true)
Panel_Window_DailyStamp:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local userConnectionType = 0
Panel_Window_DailyStamp:RegisterShowEventFunc(true, "DailyStampShowAni()")
Panel_Window_DailyStamp:RegisterShowEventFunc(false, "DailyStampHideAni()")
DailyStampShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_TT
  Panel_Window_DailyStamp:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_MidHorizon.dds")
  local FadeMaskAni = Panel_Window_DailyStamp:addTextureUVAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(1, 0, 1)
  FadeMaskAni:SetEndUV(0.4, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
  FadeMaskAni.IsChangeChild = true
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  dailyStamp.animationTime = 0
end

DailyStampHideAni = function()
  -- function num : 0_1
  Panel_Window_DailyStamp:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_DailyStamp, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local dailyStamp = {tempDailySlot = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_DaySlot"), tempDay = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_Day"), tempStamp = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_Stamp"), tempName = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_RewardName"), eventEntry = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_EventEntry"), dailyStampTap = (UI.getChildControl)(Panel_Window_DailyStamp, "RadioButton_Tap"), 
entryIcon = {[0] = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_EventEntryComplete1"), [1] = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_EventEntryComplete2"), [2] = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_EventEntryComplete3")}
, mainBg = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_Bg"), eventDescBg = (UI.getChildControl)(Panel_Window_DailyStamp, "Static_EventPeriodBg"), eventPeriodTitle = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_EventPeriodTitle"), eventPeriod = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_EventPeriodValue"), acceptPeriodTitle = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_RewardAcceptPeriodTitle"), acceptPeriod = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_RewardAcceptPeriodValue"), weekEndDesc = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_WeekEndDesc"), attendanceTimeTitle = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_AttendanceTimeCheckTitle"), attendanceTime = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_AttendanceTimeCheckValue"), eventDesc = (UI.getChildControl)(Panel_Window_DailyStamp, "StaticText_EventPeriodAlert"), btnClose = (UI.getChildControl)(Panel_Window_DailyStamp, "Button_Win_Close"), 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
, 
goodItemSlotConfig = {createIcon = true, createBorder = false, createCount = true, createClassEquipBG = true, createCash = true}
, rewardCount = 35, tapIndex = 0, 
dayControl = {}
, 
eventEntryCount = {}
, 
entryReward = {}
, 
entryComplete = {}
, 
tapControl = {}
, 
prevAttendanceCount = {}
, 
goodDay = {}
, animationTabIndex = nil, 
animationdayIndex = {}
, animationTime = 0, nextDayShow = false, secondAttendanceCheck = false}
DailyStamp_DescSet = function()
  -- function num : 0_2 , upvalues : dailyStamp, UI_TM
  local _eventPeriodTitle = (dailyStamp.eventPeriodTitle):GetText()
  local _eventPeriod = (dailyStamp.eventPeriod):GetText()
  local _acceptPeriodTitle = (dailyStamp.acceptPeriodTitle):GetText()
  local _acceptPeriod = (dailyStamp.acceptPeriod):GetText()
  local _desc = (dailyStamp.eventDesc):GetText()
  local _weekendDesc = (dailyStamp.weekEndDesc):GetText()
  ;
  (dailyStamp.eventPeriod):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (dailyStamp.acceptPeriod):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (dailyStamp.eventDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (dailyStamp.weekEndDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (dailyStamp.eventPeriodTitle):SetText(_eventPeriodTitle)
  ;
  (dailyStamp.eventPeriod):SetText(_eventPeriod)
  ;
  (dailyStamp.acceptPeriodTitle):SetText(_acceptPeriodTitle)
  ;
  (dailyStamp.acceptPeriod):SetText(_acceptPeriod)
  ;
  (dailyStamp.eventDesc):SetText(_desc)
  ;
  (dailyStamp.weekEndDesc):SetText(_weekendDesc)
  do
    if (dailyStamp.eventDesc):GetTextSizeY() > 80 then
      local addSizeY = (dailyStamp.eventDesc):GetTextSizeY() - 80 + 15
      Panel_Window_DailyStamp:SetSize(Panel_Window_DailyStamp:GetSizeX(), Panel_Window_DailyStamp:GetSizeY() + addSizeY)
      ;
      (dailyStamp.mainBg):SetSize((dailyStamp.mainBg):GetSizeX(), (dailyStamp.mainBg):GetSizeY() + addSizeY)
      ;
      (dailyStamp.eventDescBg):SetSize((dailyStamp.eventDescBg):GetSizeX(), (dailyStamp.eventDescBg):GetSizeY() + addSizeY)
      ;
      (dailyStamp.eventDesc):SetSpanSize(((dailyStamp.eventDesc):GetSpanSize()).x, ((dailyStamp.eventDesc):GetSpanSize()).y + addSizeY)
      ;
      (dailyStamp.eventPeriodTitle):SetSpanSize(((dailyStamp.eventPeriodTitle):GetSpanSize()).x, ((dailyStamp.eventPeriodTitle):GetSpanSize()).y + addSizeY)
      ;
      (dailyStamp.eventPeriod):SetSpanSize(((dailyStamp.eventPeriod):GetSpanSize()).x, ((dailyStamp.eventPeriod):GetSpanSize()).y + addSizeY)
      ;
      (dailyStamp.acceptPeriodTitle):SetSpanSize(((dailyStamp.acceptPeriodTitle):GetSpanSize()).x, ((dailyStamp.acceptPeriodTitle):GetSpanSize()).y + addSizeY - 20)
      ;
      (dailyStamp.acceptPeriod):SetSpanSize(((dailyStamp.acceptPeriod):GetSpanSize()).x, ((dailyStamp.acceptPeriod):GetSpanSize()).y + addSizeY - 20)
    end
    local titleSizeX = (math.max)((dailyStamp.eventPeriodTitle):GetTextSizeX(), (dailyStamp.acceptPeriodTitle):GetTextSizeX())
    local baseSizeX = (dailyStamp.eventPeriodTitle):GetPosX() + titleSizeX
    if (dailyStamp.eventPeriod):GetPosX() < baseSizeX + 10 then
      (dailyStamp.eventPeriod):SetPosX(baseSizeX + 10)
      ;
      (dailyStamp.acceptPeriod):SetPosX(baseSizeX + 10)
    end
    -- DECOMPILER ERROR at PC238: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (dailyStamp.goodItemSlotConfig).createBorder = true
  end
end

DailyStamp_DescSet()
if isGameTypeKorea() then
  dailyStamp.eventEntryCount = {20, 30; [0] = 10}
  ;
  (dailyStamp.eventEntry):SetShow(false)
end
local dailyStampCount = ToClient_GetAttendanceInfoCount()
local dailyStampKeys = {}
local dailyStampReciveAttendance = {}
for index = 0, dailyStampCount - 1 do
  dailyStampKeys[index] = ToClient_GetAttendanceInfoWrapper(index)
  dailyStampReciveAttendance[index] = false
  if dailyStampKeys[index] ~= nil and (dailyStampKeys[index]):isPossibleOverlapAttendance() == false and (dailyStampKeys[index]):isPossibleAttendance() == false then
    dailyStampReciveAttendance[index] = true
  end
end
local yesterdayTabCount = dailyStampCount
dailyStamp.TapInit = function(self)
  -- function num : 0_3 , upvalues : dailyStampCount, yesterdayTabCount, dailyStampKeys
  if dailyStampCount < yesterdayTabCount then
    for index = 0, yesterdayTabCount - 1 do
      if index < dailyStampCount then
        local dailyStampTapName = (dailyStampKeys[index]):getName()
        -- DECOMPILER ERROR at PC27: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self.tapControl)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, Panel_Window_DailyStamp, "DailyStamp_Tap_" .. index)
        CopyBaseProperty(self.dailyStampTap, (self.tapControl)[index])
        ;
        ((self.tapControl)[index]):SetShow(true)
        ;
        ((self.tapControl)[index]):SetCheck(false)
        ;
        ((self.tapControl)[index]):SetText(dailyStampTapName)
        ;
        ((self.tapControl)[index]):addInputEvent("Mouse_LUp", "DailyStamp_TapClicked(" .. index .. ")")
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self.prevAttendanceCount)[index] = nil
        if dailyStampCount >= 4 then
          ((self.tapControl)[index]):SetSize(155, 40)
        end
        ;
        ((self.tapControl)[index]):SetPosX(((self.tapControl)[index]):GetPosX() + (((self.tapControl)[index]):GetSizeX() + 5) * index)
        ;
        ((self.tapControl)[index]):SetPosY(62)
      else
        do
          do
            ;
            ((self.tapControl)[index]):SetShow(false)
            -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC94: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    yesterdayTabCount = dailyStampCount
  else
    for index = 0, dailyStampCount - 1 do
      local dailyStampTapName = (dailyStampKeys[index]):getName()
      -- DECOMPILER ERROR at PC118: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (self.tapControl)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, Panel_Window_DailyStamp, "DailyStamp_Tap_" .. index)
      CopyBaseProperty(self.dailyStampTap, (self.tapControl)[index])
      ;
      ((self.tapControl)[index]):SetShow(true)
      ;
      ((self.tapControl)[index]):SetCheck(false)
      ;
      ((self.tapControl)[index]):SetText(dailyStampTapName)
      ;
      ((self.tapControl)[index]):addInputEvent("Mouse_LUp", "DailyStamp_TapClicked(" .. index .. ")")
      -- DECOMPILER ERROR at PC149: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (self.prevAttendanceCount)[index] = nil
      if dailyStampCount >= 4 then
        ((self.tapControl)[index]):SetSize(155, 40)
      end
      ;
      ((self.tapControl)[index]):SetPosX(((self.tapControl)[index]):GetPosX() + (((self.tapControl)[index]):GetSizeX() + 5) * index)
      ;
      ((self.tapControl)[index]):SetPosY(62)
    end
  end
end

dailyStamp.TabUpdate = function(self)
  -- function num : 0_4 , upvalues : dailyStampCount, dailyStampKeys
  for index = 0, dailyStampCount - 1 do
    local dailyStampTapName = (dailyStampKeys[index]):getName()
    local attendanceKey = (dailyStampKeys[index]):getKey()
    local myAttendanceCount = ToClient_getAttendanceCount(attendanceKey)
    local rewardCount = ToClient_getReceivedRewardCount(attendanceKey)
    if myAttendanceCount - rewardCount > 0 then
      dailyStampTapName = dailyStampTapName .. "(" .. myAttendanceCount - rewardCount .. ")"
    end
    ;
    ((self.tapControl)[index]):SetText(dailyStampTapName)
  end
end

local basePosX = (dailyStamp.tempDailySlot):GetPosX() + 30
local basePosY = (dailyStamp.tempDailySlot):GetPosY() + 40
local gapX = 10
local gapY = 10
dailyStamp.Init = function(self)
  -- function num : 0_5 , upvalues : basePosX, gapX, basePosY, gapY, UI_TM
  for index = 0, self.rewardCount - 1 do
    local temp = {}
    temp._dayControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_DailyStamp, "Static_DailyStamp_Day_" .. index)
    CopyBaseProperty(self.tempDailySlot, temp._dayControl)
    ;
    (temp._dayControl):SetPosX(basePosX + ((self.tempDailySlot):GetSizeX() + gapX) * (index % 7))
    ;
    (temp._dayControl):SetPosY(basePosY + ((self.tempDailySlot):GetSizeY() + gapY) * (math.floor)(index / 7))
    temp._dayText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._dayControl, "StaticText_DailyStamp_Day_" .. index)
    CopyBaseProperty(self.tempDay, temp._dayText)
    ;
    (temp._dayText):SetPosX(5)
    ;
    (temp._dayText):SetPosY(5)
    ;
    (temp._dayText):SetText(index + 1)
    temp._rewardName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._dayControl, "StaticText_DailyStamp_RewardName_" .. index)
    CopyBaseProperty(self.tempName, temp._rewardName)
    ;
    (temp._rewardName):SetPosX(6)
    ;
    (temp._rewardName):SetPosY(70)
    ;
    (temp._rewardName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (temp._rewardName):SetShow(false)
    temp.slot = {}
    ;
    (SlotItem.new)(temp.slot, "DailyStamp_Reward_", index, temp._dayControl, self.slotConfig)
    ;
    (temp.slot):createChild()
    ;
    ((temp.slot).icon):SetPosX(47)
    ;
    ((temp.slot).icon):SetPosY(47)
    temp.goodItemSlot = {}
    ;
    (SlotItem.new)(temp.goodItemSlot, "DailyStamp_GoodReward_", index, temp._dayControl, self.goodItemSlotConfig)
    ;
    (temp.goodItemSlot):createChild()
    ;
    ((temp.goodItemSlot).icon):SetPosX(43)
    ;
    ((temp.goodItemSlot).icon):SetPosY(13)
    if isGameTypeEnglish() or isGameTypeRussia() then
      ((temp.goodItemSlot).icon):SetPosX(47)
      ;
      ((temp.goodItemSlot).icon):SetPosY(47)
    end
    temp._stamp = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._dayControl, "Static_DailyStamp_StampIcon_" .. index)
    CopyBaseProperty(self.tempStamp, temp._stamp)
    ;
    (temp._stamp):SetPosX(5)
    ;
    (temp._stamp):SetPosY(5)
    ;
    (temp._stamp):SetShow(false)
    -- DECOMPILER ERROR at PC199: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.dayControl)[index] = temp
  end
  ;
  (self.tempDailySlot):SetShow(false)
  ;
  (self.tempDay):SetShow(false)
  ;
  (self.btnClose):addInputEvent("Mouse_LUp", "DailStamp_Hide()")
end

convertYYMMDDString = function(str)
  -- function num : 0_6
  if not isGameTypeKorea() then
    return 
  end
  if str == nil then
    return 
  end
  local YY, MM, DD, hour = (string.match)(str, "(%d+)-(%d+)-(%d+)%s*0(%d+)")
  if tonumber(hour) > 12 then
    hour = "오후 " .. tonumber(hour) - 12
  else
    hour = "오전 " .. hour
  end
  local convertString = tostring(YY) .. "�\132 " .. tostring(MM) .. "�\148 " .. tostring(DD) .. "�\188 정기점검까지"
  return convertString
end

dailyStamp:TapInit()
dailyStamp:Init()
DailyStamp_SetData = function(rewardIndex)
  -- function num : 0_7 , upvalues : dailyStamp, dailyStampCount, dailyStampKeys, UI_color
  local self = dailyStamp
  self.tapIndex = rewardIndex
  for index = 0, dailyStampCount - 1 do
    if rewardIndex == index then
      ((self.tapControl)[index]):SetCheck(true)
    else
      ;
      ((self.tapControl)[index]):SetCheck(false)
    end
  end
  local totalDayCount = (dailyStampKeys[rewardIndex]):getRewardCount()
  self.goodDay = {totalDayCount}
  local attendanceKey = (dailyStampKeys[rewardIndex]):getKey()
  local myAttendanceCount = ToClient_getAttendanceCount(attendanceKey)
  local recieveCount = ToClient_getReceivedRewardCount(attendanceKey)
  local yesterdayRecieveCount = (dailyStampKeys[rewardIndex]):getAttendanceYesterdayCount()
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R7 in 'UnsetPending'

  if (self.prevAttendanceCount)[rewardIndex] == nil then
    (self.prevAttendanceCount)[rewardIndex] = myAttendanceCount
  end
  if not (dailyStampKeys[rewardIndex]):isPossibleAttendance() and not (dailyStampKeys[rewardIndex]):isPossibleOverlapAttendance() then
    (dailyStamp.attendanceTime):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (dailyStamp.attendanceTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_TODAY_ATTENDANCE_COMPLETE"))
  end
  self.secondAttendanceCheck = false
  for index = 0, self.rewardCount - 1 do
    (((self.dayControl)[index])._dayControl):addInputEvent("Mouse_LUp", "")
    ;
    (((self.dayControl)[index])._dayControl):SetShow(false)
    ;
    (((self.dayControl)[index])._dayControl):addInputEvent("Mouse_RUp", "")
    ;
    (((self.dayControl)[index])._dayControl):addInputEvent("Mouse_On", "")
    ;
    (((self.dayControl)[index])._dayControl):addInputEvent("Mouse_Out", "")
    ;
    ((((self.dayControl)[index]).slot).icon):addInputEvent("Mouse_LUp", "")
    ;
    ((((self.dayControl)[index]).slot).icon):addInputEvent("Mouse_RUP", "")
    ;
    ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent("Mouse_LUp", "")
    ;
    ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent("Mouse_RUP", "")
    ;
    (((self.dayControl)[index])._stamp):SetShow(false)
    ;
    (((self.dayControl)[index])._stamp):ResetVertexAni()
    ;
    (((self.dayControl)[index])._stamp):SetSize(69, 69)
    ;
    (((self.dayControl)[index])._stamp):SetPosX(5)
    ;
    (((self.dayControl)[index])._stamp):SetPosY(5)
    ;
    ((((self.dayControl)[index]).slot).icon):SetShow(false)
    ;
    ((((self.dayControl)[index]).goodItemSlot).icon):SetShow(false)
    ;
    (((self.dayControl)[index])._rewardName):SetShow(false)
    ;
    ((((self.dayControl)[index]).goodItemSlot).icon):SetMonoTone(false)
    ;
    ((((self.dayControl)[index]).slot).icon):SetMonoTone(false)
    ;
    (((self.dayControl)[index])._dayControl):ResetVertexAni()
    ;
    (((self.dayControl)[index])._dayControl):SetColor((Defines.Color).C_FFFFFFFF)
  end
  self.animationdayIndex = {}
  for index = 0, totalDayCount - 1 do
    local itemWrapper = (dailyStampKeys[rewardIndex]):getRewardItem(R13_PC236)
    ;
    ((((self.dayControl)[index]).slot).icon):SetShow(true)
    -- DECOMPILER ERROR at PC247: Overwrote pending register: R13 in 'AssignReg'

    ;
    (((self.dayControl)[index])._dayControl):SetShow(true)
    -- DECOMPILER ERROR at PC253: Overwrote pending register: R13 in 'AssignReg'

    ;
    (((self.dayControl)[index]).slot):setItem(itemWrapper)
    -- DECOMPILER ERROR at PC260: Overwrote pending register: R13 in 'AssignReg'

    ;
    ((((self.dayControl)[index]).slot).icon):addInputEvent("Mouse_On", "DailyStamp_Tooltip_Show(" .. R16_PC267 .. "," .. rewardIndex .. ")")
    -- DECOMPILER ERROR at PC273: Overwrote pending register: R13 in 'AssignReg'

    ;
    ((((self.dayControl)[index]).slot).icon):addInputEvent("Mouse_Out", "DailyStamp_Tooltip_Show()")
    -- DECOMPILER ERROR at PC280: Overwrote pending register: R13 in 'AssignReg'

    ;
    (((self.dayControl)[index])._dayText):SetFontColor((Defines.Color).C_FFEFEFEF)
    -- DECOMPILER ERROR at PC290: Overwrote pending register: R13 in 'AssignReg'

    if index < myAttendanceCount then
      (((self.dayControl)[index])._stamp):SetShow(true)
      -- DECOMPILER ERROR at PC299: Overwrote pending register: R13 in 'AssignReg'

      if index < recieveCount then
        ((((self.dayControl)[index]).slot).icon):SetMonoTone(true)
        -- DECOMPILER ERROR at PC306: Overwrote pending register: R13 in 'AssignReg'

        ;
        ((((self.dayControl)[index]).goodItemSlot).icon):SetMonoTone(true)
        -- DECOMPILER ERROR at PC314: Overwrote pending register: R13 in 'AssignReg'

        if yesterdayRecieveCount <= index then
          (((self.dayControl)[index])._stamp):SetShow(false)
          self.animationTime = 0
          -- DECOMPILER ERROR at PC321: Overwrote pending register: R13 in 'AssignReg'

          ;
          (((self.dayControl)[index])._stamp):SetScale(1, 1)
          -- DECOMPILER ERROR at PC326: Overwrote pending register: R13 in 'AssignReg'

          DailyStamp_SetAnimation(R13_PC236, R14_PC328)
          -- DECOMPILER ERROR at PC330: Overwrote pending register: R13 in 'AssignReg'

          DailyStamp_ChangeTexture(R13_PC236, R14_PC328)
          -- DECOMPILER ERROR at PC336: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC337: Overwrote pending register: R14 in 'AssignReg'

          ;
          (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, "DailyStamp_TodayAttendance_TooltipShow(" .. R16_PC267 .. ")")
          -- DECOMPILER ERROR at PC346: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC347: Overwrote pending register: R14 in 'AssignReg'

          ;
          (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, "DailyStamp_TodayAttendance_TooltipHide()")
        else
          -- DECOMPILER ERROR at PC352: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC353: Overwrote pending register: R14 in 'AssignReg'

          DailyStamp_ChangeTexture(R13_PC236, R14_PC328)
        end
      else
        -- DECOMPILER ERROR at PC359: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC360: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC362: Overwrote pending register: R16 in 'AssignReg'

        ;
        (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, "DailyStamp_AcceptReward(" .. R16_PC267 .. ")")
        -- DECOMPILER ERROR at PC369: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC370: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC372: Overwrote pending register: R16 in 'AssignReg'

        ;
        (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, "DailyStamp_AcceptReward(" .. R16_PC267 .. ")")
        -- DECOMPILER ERROR at PC380: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC381: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC383: Overwrote pending register: R16 in 'AssignReg'

        ;
        ((((self.dayControl)[index]).slot).icon):addInputEvent(R14_PC328, "DailyStamp_AcceptReward(" .. R16_PC267 .. ")")
        -- DECOMPILER ERROR at PC391: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC392: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC394: Overwrote pending register: R16 in 'AssignReg'

        ;
        ((((self.dayControl)[index]).slot).icon):addInputEvent(R14_PC328, "DailyStamp_AcceptReward(" .. R16_PC267 .. ")")
        -- DECOMPILER ERROR at PC402: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC403: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC405: Overwrote pending register: R16 in 'AssignReg'

        ;
        ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent(R14_PC328, "DailyStamp_AcceptReward(" .. R16_PC267 .. ")")
        -- DECOMPILER ERROR at PC413: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC414: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC416: Overwrote pending register: R16 in 'AssignReg'

        ;
        ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent(R14_PC328, "DailyStamp_AcceptReward(" .. R16_PC267 .. ")")
        -- DECOMPILER ERROR at PC423: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC424: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC426: Overwrote pending register: R16 in 'AssignReg'

        ;
        (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, "DailyStamp_AcceptReward_TooltipShow(" .. R16_PC267 .. ")")
        -- DECOMPILER ERROR at PC433: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC434: Overwrote pending register: R14 in 'AssignReg'

        ;
        (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, "DailyStamp_AcceptReward_TooltipShow()")
        -- DECOMPILER ERROR at PC438: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC439: Overwrote pending register: R14 in 'AssignReg'

        DailyStamp_ChangeTexture(R13_PC236, R14_PC328)
        local waitingTime = 0
        -- DECOMPILER ERROR at PC442: Overwrote pending register: R13 in 'AssignReg'

        local possibleAttendance = R13_PC236
        -- DECOMPILER ERROR at PC443: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC446: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC447: Overwrote pending register: R14 in 'AssignReg'

        R14_PC328 = R14_PC328(R14_PC328)
        if R14_PC328 then
          R14_PC328 = ToClient_getWaitingTimeForAttendance
          R14_PC328 = R14_PC328()
          waitingTime = R14_PC328
          -- DECOMPILER ERROR at PC454: Overwrote pending register: R13 in 'AssignReg'

        end
        R14_PC328 = dailyStampKeys
        R14_PC328 = R14_PC328[dailyStamp.tapIndex]
        R14_PC328 = R14_PC328(R14_PC328)
        if R14_PC328 then
          R14_PC328 = ToClient_getWaitingTimeForNextAttendance
          -- DECOMPILER ERROR at PC465: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC466: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC468: Overwrote pending register: R16 in 'AssignReg'

          R14_PC328 = R14_PC328((dailyStampKeys[R16_PC267]):getKey())
          waitingTime = R14_PC328
          -- DECOMPILER ERROR at PC472: Overwrote pending register: R13 in 'AssignReg'

        end
        if waitingTime == 0 and not possibleAttendance then
          R14_PC328 = myAttendanceCount - 1
          if index == R14_PC328 then
            R14_PC328 = DailyStamp_ChangeTexture
            R14_PC328(R15_PC483, 0)
            R14_PC328 = self.dayControl
            R14_PC328 = R14_PC328[index]
            R14_PC328 = R14_PC328._dayControl
            R14_PC328, R15_PC483 = R14_PC328:SetVertexAniRun, R14_PC328
            R14_PC328(R15_PC483, "Ani_Color_New", true)
            R14_PC328 = dailyStamp
            R14_PC328 = R14_PC328.attendanceTime
            R14_PC328, R15_PC483 = R14_PC328:SetText, R14_PC328
            R14_PC328(R15_PC483, PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_TODAY_ATTENDANCE_COMPLETE"))
          end
        end
      end
    else
      do
        -- DECOMPILER ERROR at PC505: Overwrote pending register: R13 in 'AssignReg'

        if index == myAttendanceCount then
          if (dailyStampKeys[rewardIndex]):isPossibleAttendance() or (dailyStampKeys[rewardIndex]):isPossibleOverlapAttendance() then
            if isPossibleAttandanceCheck() then
              DailyStamp_ChangeTexture(R13_PC522, R14_PC328)
              -- DECOMPILER ERROR at PC527: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC531: Overwrote pending register: R15 in 'AssignReg'

              ;
              (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, R15_PC483)
              -- DECOMPILER ERROR at PC536: Overwrote pending register: R13 in 'AssignReg'

              -- DECOMPILER ERROR at PC537: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC538: Overwrote pending register: R15 in 'AssignReg'

              ;
              (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, R15_PC483)
            else
              -- DECOMPILER ERROR at PC542: Overwrote pending register: R13 in 'AssignReg'

              -- DECOMPILER ERROR at PC543: Overwrote pending register: R14 in 'AssignReg'

              DailyStamp_ChangeTexture(R13_PC522, R14_PC328)
              -- DECOMPILER ERROR at PC548: Overwrote pending register: R13 in 'AssignReg'

              -- DECOMPILER ERROR at PC549: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC550: Overwrote pending register: R15 in 'AssignReg'

              -- DECOMPILER ERROR at PC553: Overwrote pending register: R15 in 'AssignReg'

              ;
              (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, R15_PC483)
              -- DECOMPILER ERROR at PC558: Overwrote pending register: R13 in 'AssignReg'

              -- DECOMPILER ERROR at PC559: Overwrote pending register: R14 in 'AssignReg'

              -- DECOMPILER ERROR at PC560: Overwrote pending register: R15 in 'AssignReg'

              ;
              (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, R15_PC483)
              self.secondAttendanceCheck = true
            end
            -- DECOMPILER ERROR at PC566: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC567: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC568: Overwrote pending register: R15 in 'AssignReg'

            -- DECOMPILER ERROR at PC569: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC571: Overwrote pending register: R15 in 'AssignReg'

            ;
            (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, R15_PC483)
            -- DECOMPILER ERROR at PC576: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC577: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC578: Overwrote pending register: R15 in 'AssignReg'

            -- DECOMPILER ERROR at PC579: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC581: Overwrote pending register: R15 in 'AssignReg'

            ;
            (((self.dayControl)[index])._dayControl):addInputEvent(R14_PC328, R15_PC483)
            -- DECOMPILER ERROR at PC587: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC588: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC589: Overwrote pending register: R15 in 'AssignReg'

            -- DECOMPILER ERROR at PC590: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC592: Overwrote pending register: R15 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).slot).icon):addInputEvent(R14_PC328, R15_PC483)
            -- DECOMPILER ERROR at PC598: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC599: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC600: Overwrote pending register: R15 in 'AssignReg'

            -- DECOMPILER ERROR at PC601: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC603: Overwrote pending register: R15 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).slot).icon):addInputEvent(R14_PC328, R15_PC483)
            -- DECOMPILER ERROR at PC609: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC610: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC611: Overwrote pending register: R15 in 'AssignReg'

            -- DECOMPILER ERROR at PC612: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC614: Overwrote pending register: R15 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent(R14_PC328, R15_PC483)
            -- DECOMPILER ERROR at PC620: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC621: Overwrote pending register: R14 in 'AssignReg'

            -- DECOMPILER ERROR at PC622: Overwrote pending register: R15 in 'AssignReg'

            -- DECOMPILER ERROR at PC623: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC625: Overwrote pending register: R15 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent(R14_PC328, R15_PC483)
          else
            -- DECOMPILER ERROR at PC629: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC630: Overwrote pending register: R14 in 'AssignReg'

            DailyStamp_ChangeTexture(R13_PC522, R14_PC328)
          end
        else
          -- DECOMPILER ERROR at PC634: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC635: Overwrote pending register: R14 in 'AssignReg'

          DailyStamp_ChangeTexture(R13_PC522, R14_PC328)
        end
        -- DECOMPILER ERROR at PC638: Overwrote pending register: R13 in 'AssignReg'

        for R15_PC483,R16_PC531 in pairs(R13_PC522) do
          if gIndex == index + 1 then
            local goodItemWrapper = (dailyStampKeys[rewardIndex]):getRewardItem(R19_PC648)
            ;
            ((((self.dayControl)[index]).slot).icon):SetShow(false)
            -- DECOMPILER ERROR at PC660: Overwrote pending register: R19 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).goodItemSlot).icon):SetShow(true)
            -- DECOMPILER ERROR at PC666: Overwrote pending register: R19 in 'AssignReg'

            ;
            (((self.dayControl)[index]).goodItemSlot):setItem((dailyStampKeys[rewardIndex]):getRewardItem(R22_PC671))
            -- DECOMPILER ERROR at PC677: Overwrote pending register: R19 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent("Mouse_On", "DailyStamp_Tooltip_Show(" .. R22_PC671 .. "," .. rewardIndex .. ")")
            -- DECOMPILER ERROR at PC690: Overwrote pending register: R19 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).goodItemSlot).icon):addInputEvent("Mouse_Out", "DailyStamp_Tooltip_Show()")
            -- DECOMPILER ERROR at PC697: Overwrote pending register: R19 in 'AssignReg'

            ;
            (((self.dayControl)[index])._rewardName):SetShow(true)
            -- DECOMPILER ERROR at PC703: Overwrote pending register: R19 in 'AssignReg'

            ;
            (((self.dayControl)[index])._rewardName):SetText((goodItemWrapper:getStaticStatus()):getName())
            -- DECOMPILER ERROR at PC713: Overwrote pending register: R19 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).goodItemSlot).icon):SetPosX(43)
            -- DECOMPILER ERROR at PC720: Overwrote pending register: R19 in 'AssignReg'

            ;
            ((((self.dayControl)[index]).goodItemSlot).icon):SetPosY(13)
            -- DECOMPILER ERROR at PC733: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC740: Overwrote pending register: R19 in 'AssignReg'

            if isGameTypeEnglish() or isGameTypeRussia() or (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
              (((self.dayControl)[index])._rewardName):SetShow(false)
              -- DECOMPILER ERROR at PC747: Overwrote pending register: R19 in 'AssignReg'

              ;
              ((((self.dayControl)[index]).goodItemSlot).icon):SetPosX(47)
              -- DECOMPILER ERROR at PC754: Overwrote pending register: R19 in 'AssignReg'

              ;
              ((((self.dayControl)[index]).goodItemSlot).icon):SetPosY(47)
            end
            -- DECOMPILER ERROR at PC760: Overwrote pending register: R19 in 'AssignReg'

            ;
            (((self.dayControl)[index])._dayText):SetFontColor((Defines.Color).C_FFFFCE22)
          end
        end
        -- DECOMPILER ERROR at PC767: Confused about usage of register R14 for local variables in 'ReleaseLocals'

        -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_ELSE_STMT

        -- DECOMPILER ERROR at PC767: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  ;
  (self.eventPeriod):SetText((dailyStampKeys[rewardIndex]):getPeriodDate())
  ;
  (self.acceptPeriod):SetText((dailyStampKeys[rewardIndex]):getExpireDate())
  -- DECOMPILER ERROR at PC797: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC798: Overwrote pending register: R11 in 'AssignReg'

  if (self.eventPeriod):GetTextSizeY() > 25 then
    (self.acceptPeriodTitle):SetSpanSize(((self.acceptPeriodTitle):GetSpanSize()).x, ((self.eventPeriod):GetSpanSize()).y - itemWrapper)
    -- DECOMPILER ERROR at PC809: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC812: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC813: Overwrote pending register: R11 in 'AssignReg'

    ;
    (self.acceptPeriod):SetSpanSize(((self.acceptPeriod):GetSpanSize()).x, ((self.eventPeriod):GetSpanSize()).y - itemWrapper)
    local titleSizeX = nil
    local baseSizeX = nil
    -- DECOMPILER ERROR at PC838: Confused about usage of register: R8 in 'UnsetPending'

    -- DECOMPILER ERROR at PC838: Overwrote pending register: R11 in 'AssignReg'

    if (self.acceptPeriod):GetPosX() < (self.eventPeriodTitle):GetPosX() + (math.max)((self.eventPeriodTitle):GetTextSizeX(), (self.acceptPeriodTitle):GetTextSizeX()) + 10 then
      (self.eventPeriod):SetPosX(itemWrapper)
      -- DECOMPILER ERROR at PC842: Confused about usage of register: R8 in 'UnsetPending'

      -- DECOMPILER ERROR at PC842: Overwrote pending register: R11 in 'AssignReg'

      ;
      (self.acceptPeriod):SetPosX(itemWrapper)
    end
  end
  do
    if false then
      for index = 0, #self.eventEntryCount do
        local l_0_7_30, l_0_7_31, l_0_7_32, index = nil
        -- DECOMPILER ERROR at PC852: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC853: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC853: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC856: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC857: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC857: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC858: Overwrote pending register: R11 in 'AssignReg'

        if itemWrapper <= myAttendanceCount then
          itemWrapper(itemWrapper, true)
        else
          -- DECOMPILER ERROR at PC862: Overwrote pending register: R11 in 'AssignReg'

          -- DECOMPILER ERROR at PC863: Confused about usage of register: R10 in 'UnsetPending'

          -- DECOMPILER ERROR at PC863: Overwrote pending register: R11 in 'AssignReg'

          -- DECOMPILER ERROR at PC864: Overwrote pending register: R11 in 'AssignReg'

          itemWrapper(itemWrapper, false)
        end
      end
    end
    do
      dailyStamp:TabUpdate()
      -- DECOMPILER ERROR at PC871: Confused about usage of register R13 for local variables in 'ReleaseLocals'

    end
  end
end

DailyStamp_ChangeTexture = function(index, recieveType)
  -- function num : 0_8 , upvalues : dailyStamp
  local self = dailyStamp
  if recieveType == 0 then
    (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 10, 104, 105, 199)
    ;
    ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
    ;
    (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 108, 104, 203, 199)
    ;
    ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
    ;
    (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 206, 104, 301, 199)
    ;
    ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
    for v,gIndex in pairs(self.goodDay) do
      if gIndex == index + 1 then
        (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 407, 7, 502, 102)
        ;
        ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
        ;
        (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 407, 104, 502, 199)
        ;
        ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
        ;
        (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 407, 201, 502, 296)
        ;
        ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
      end
    end
  else
    do
      if recieveType == 1 then
        (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 10, 7, 105, 102)
        ;
        ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
        ;
        (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 10, 7, 105, 102)
        ;
        ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
        ;
        (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 10, 7, 105, 102)
        ;
        ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
        for v,gIndex in pairs(self.goodDay) do
          if gIndex == index + 1 then
            (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 307, 7, 402, 102)
            ;
            ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
            ;
            (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 307, 7, 402, 102)
            ;
            ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
            ;
            (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 307, 7, 402, 102)
            ;
            ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
          end
        end
      else
        do
          if recieveType == 2 then
            (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 1, 1, 96, 96)
            ;
            ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
            ;
            (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 99, 1, 194, 96)
            ;
            ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
            ;
            (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 197, 1, 292, 96)
            ;
            ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
            for v,gIndex in pairs(self.goodDay) do
              if gIndex == index + 1 then
                (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 1, 195, 96, 290)
                ;
                ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
                ;
                (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 99, 195, 194, 290)
                ;
                ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
                ;
                (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 197, 195, 292, 290)
                ;
                ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
              end
            end
          else
            do
              if recieveType == 3 then
                (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 1, 98, 96, 193)
                ;
                ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
                ;
                (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 99, 98, 194, 193)
                ;
                ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
                ;
                (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 197, 98, 292, 193)
                ;
                ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
                for v,gIndex in pairs(self.goodDay) do
                  if gIndex == index + 1 then
                    (((self.dayControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 1, 195, 96, 290)
                    ;
                    ((((self.dayControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (((self.dayControl)[index])._dayControl):setRenderTexture((((self.dayControl)[index])._dayControl):getBaseTexture())
                    ;
                    (((self.dayControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 99, 195, 194, 290)
                    ;
                    ((((self.dayControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (((self.dayControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/DailyCheck_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(((self.dayControl)[index])._dayControl, 197, 195, 292, 290)
                    ;
                    ((((self.dayControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

DailyStamp_RecieveReward = function(index, rewardIndex)
  -- function num : 0_9 , upvalues : dailyStampKeys
  local recieveReward = function()
    -- function num : 0_9_0 , upvalues : dailyStampKeys, rewardIndex
    ToClient_takeRewardItem((dailyStampKeys[rewardIndex]):getKey())
  end

  local receiveItemIndex = ToClient_getReceivedRewardCount((dailyStampKeys[rewardIndex]):getKey())
  if receiveItemIndex == 0 then
    receiveItemIndex = 0
  end
  TooltipSimple_Hide()
  local title = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MSGTITLE")
  local itemWrapper = (dailyStampKeys[rewardIndex]):getRewardItem(receiveItemIndex)
  local content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MSGCONTENT", "name", tostring((itemWrapper:getStaticStatus()):getName()))
  messageBoxData = {title = title, content = content, functionYes = recieveReward, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

DailyStamp_TodayAttendance_TooltipShow = function(index)
  -- function num : 0_10 , upvalues : dailyStamp
  local uiControl = ((dailyStamp.dayControl)[index])._dayControl
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_TODAYATTENDANCE_NAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_TODAYATTENDANCE_DESC")
  TooltipSimple_Show(uiControl, name, desc)
end

DailyStamp_TodayAttendance_TooltipHide = function()
  -- function num : 0_11
  TooltipSimple_Hide()
end

DailyStamp_AcceptReward_TooltipShow = function(index)
  -- function num : 0_12 , upvalues : dailyStamp
  if index == nil then
    TooltipSimple_Hide()
    return 
  end
  local uiControl = ((dailyStamp.dayControl)[index])._dayControl
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_RECEIVEPOSSIBLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MOUSE_CLICKRECEIVE")
  TooltipSimple_Show(uiControl, name, desc)
end

DailyStamp_Attendance_TooltipShow = function(index, isPossible)
  -- function num : 0_13 , upvalues : dailyStamp
  if index == nil then
    TooltipSimple_Hide()
    return 
  end
  local uiControl = ((dailyStamp.dayControl)[index])._dayControl
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_DAILYCHECK_POSSIBLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MOUSE_CLICKSTAMP")
  if isPossible == nil then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_DAILYCHECK_IMPOSSIBLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_CHECK_THIRTYMINUTE_POSSIBLE")
  end
  TooltipSimple_Show(uiControl, name, desc)
end

DailyStamp_TapClicked = function(rewardIndex)
  -- function num : 0_14 , upvalues : dailyStamp
  local self = dailyStamp
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R2 in 'UnsetPending'

  dailyStamp.animationdayIndex = {}
  DailyStamp_SetData(rewardIndex)
end

DailyStamp_SetAttendance = function(rewardIndex)
  -- function num : 0_15 , upvalues : dailyStampKeys
  do
    if not isPossibleAttandanceCheck() then
      local waitingTime = -1
      if (dailyStampKeys[rewardIndex]):isPossibleAttendance() then
        waitingTime = ToClient_getWaitingTimeForAttendance()
      end
      if (dailyStampKeys[rewardIndex]):isPossibleOverlapAttendance() then
        waitingTime = ToClient_getWaitingTimeForNextAttendance((dailyStampKeys[rewardIndex]):getKey())
      end
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_STILL_CHECK_IMPOSSIBLE_REMAINTIME", "remainTime", ((Util.Time).timeFormatting_Minute)(waitingTime)))
      return false
    end
    local attendanceKey = (dailyStampKeys[rewardIndex]):getKey()
    ToClient_onAttendance(attendanceKey)
    return true
  end
end

FGlobal_DailyStamp_SetAttendanceAll = function()
  -- function num : 0_16 , upvalues : dailyStampCount, dailyStampKeys, dailyStampReciveAttendance
  local openDailyStamp = false
  for index = dailyStampCount - 1, 0, -1 do
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R5 in 'UnsetPending'

    if dailyStampKeys[index] ~= nil and ((dailyStampKeys[index]):isPossibleAttendance() or (dailyStampKeys[index]):isPossibleOverlapAttendance()) and dailyStampReciveAttendance[index] == false then
      dailyStampReciveAttendance[index] = true
      if DailyStamp_SetAttendance(index) == true then
        openDailyStamp = true
      end
    end
  end
  if not Panel_Window_DailyStamp:GetShow() and openDailyStamp == true then
    DailyStamp_ShowToggle()
  end
end

DailyStamp_AcceptReward = function(rewardIndex)
  -- function num : 0_17 , upvalues : dailyStampKeys
  local attendanceKey = (dailyStampKeys[rewardIndex]):getKey()
  local recieveReward = function()
    -- function num : 0_17_0 , upvalues : attendanceKey
    ToClient_takeRewardItem(attendanceKey)
  end

  local myAttendanceCount = ToClient_getAttendanceCount(attendanceKey)
  local receiveItemIndex = ToClient_getReceivedRewardCount(attendanceKey)
  if myAttendanceCount <= receiveItemIndex then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_NOTHING_REWARD"))
    return 
  end
  if receiveItemIndex == 0 then
    receiveItemIndex = 0
  end
  local title = PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MSGTITLE")
  local itemWrapper = (dailyStampKeys[rewardIndex]):getRewardItem(receiveItemIndex)
  local content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_MSGCONTENT", "name", tostring((itemWrapper:getStaticStatus()):getName()))
  messageBoxData = {title = title, content = content, functionYes = recieveReward, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

DailyStamp_Tooltip_Show = function(index, rewardIndex)
  -- function num : 0_18 , upvalues : dailyStampKeys, dailyStamp
  if index == nil then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local itemWrapper = (dailyStampKeys[rewardIndex]):getRewardItem(index)
  local itemSSW = itemWrapper:getStaticStatus()
  local uiBase = (((dailyStamp.dayControl)[index]).slot).icon
  Panel_Tooltip_Item_Show(itemSSW, uiBase, true, false)
end

DailyStamp_ShowToggle = function(showType)
  -- function num : 0_19 , upvalues : dailyStampCount, dailyStampKeys, dailyStampReciveAttendance, dailyStamp
  if dailyStampCount < ToClient_GetAttendanceInfoCount() then
    dailyStampCount = ToClient_GetAttendanceInfoCount()
    for index = 0, dailyStampCount - 1 do
      -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

      dailyStampKeys[index] = ToClient_GetAttendanceInfoWrapper(index)
      -- DECOMPILER ERROR at PC19: Confused about usage of register: R5 in 'UnsetPending'

      dailyStampReciveAttendance[index] = false
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R5 in 'UnsetPending'

      if dailyStampKeys[index] ~= nil and (dailyStampKeys[index]):isPossibleOverlapAttendance() == false and (dailyStampKeys[index]):isPossibleAttendance() == false then
        dailyStampReciveAttendance[index] = true
      end
    end
    dailyStamp:TapInit()
  end
  if dailyStampCount <= 0 then
    return 
  end
  local self = dailyStamp
  if Panel_LevelupGuide:IsShow() then
    FGlobal_LevelupGuide_PowerClose()
  end
  if not Panel_Window_DailyStamp:GetShow() then
    for index = 0, dailyStampCount - 1 do
      ((self.tapControl)[index]):SetCheck(false)
    end
    Panel_Window_DailyStamp:SetShow(true, true)
    ;
    ((self.tapControl)[0]):SetCheck(true)
    DailyStamp_SetData(0)
    Panel_Window_DailyStamp_RePos()
  end
  TooltipSimple_Hide()
end

DailStamp_Hide = function()
  -- function num : 0_20
  Panel_Window_DailyStamp:SetShow(false, true)
  local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
  local isEventBeforShow = temporaryPCRoomWrapper:isEventBeforeShow()
  if isPremiumPcRoom then
    if isGameTypeEnglish() then
      FGlobal_LevelupGuide_Open(false)
    else
      if temporaryPCRoomWrapper:isPcRoomBeforeShow() and not isEventBeforShow then
        EventNotify_Open()
      end
    end
    PcRoomNotify_FirstUsePearl_Open()
  else
    EventNotify_Open()
  end
end

Panel_Window_DailyStamp_RePos = function()
  -- function num : 0_21
  Panel_Window_DailyStamp:SetPosX(getScreenSizeX() / 2 - Panel_Window_DailyStamp:GetSizeX() / 2)
  Panel_Window_DailyStamp:SetPosY(getScreenSizeY() / 2 - Panel_Window_DailyStamp:GetSizeY() / 2)
end

FromClient_receiveAttendanceReward = function(attendanceKey)
  -- function num : 0_22 , upvalues : dailyStampCount, dailyStampKeys
  for index = 0, dailyStampCount - 1 do
    local dailyKey = (dailyStampKeys[index]):getKey()
    if dailyKey:get() == attendanceKey:get() then
      DailyStamp_SetData(index)
      return 
    end
  end
end

local secondAttendanceCheck = false
FromClient_AttendanceUpdate = function(attendanceKey)
  -- function num : 0_23 , upvalues : secondAttendanceCheck, dailyStamp, dailyStampCount, dailyStampKeys, dailyStampReciveAttendance
  secondAttendanceCheck = dailyStamp.secondAttendanceCheck
  for index = 0, dailyStampCount - 1 do
    local dailyKey = (dailyStampKeys[index]):getKey()
    if dailyKey:get() == attendanceKey:get() then
      DailyStamp_AcceptRewardAll(index)
      DailyStamp_SetData(index)
      -- DECOMPILER ERROR at PC25: Confused about usage of register: R6 in 'UnsetPending'

      dailyStampReciveAttendance[index] = false
      -- DECOMPILER ERROR at PC43: Confused about usage of register: R6 in 'UnsetPending'

      if dailyStampKeys[index] ~= nil and (dailyStampKeys[index]):isPossibleOverlapAttendance() == false and (dailyStampKeys[index]):isPossibleAttendance() == false then
        dailyStampReciveAttendance[index] = true
      end
      break
    end
  end
  do
    if dailyStamp.nextDayShow or secondAttendanceCheck then
      local seflPlayer = getSelfPlayer()
      if seflPlayer == nil then
        return 
      end
      local regionInfo = getRegionInfoByPosition((seflPlayer:get()):getPosition())
      local isSafeZone = (regionInfo:get()):isSafeZone()
      if isSafeZone == false then
        return 
      end
      -- DECOMPILER ERROR at PC72: Confused about usage of register: R4 in 'UnsetPending'

      dailyStamp.nextDayShow = false
    end
    do
      if not Panel_Window_DailyStamp:GetShow() then
        Panel_Window_DailyStamp:SetShow(true, true)
      end
    end
  end
end

FromClient_AttendanceUpdateAll = function(isNextDay)
  -- function num : 0_24 , upvalues : dailyStamp, dailyStampCount, dailyStampKeys
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  if isNextDay then
    dailyStamp.nextDayShow = isNextDay
  end
  dailyStampCount = ToClient_GetAttendanceInfoCount()
  dailyStampKeys = {}
  for index = 0, dailyStampCount - 1 do
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R5 in 'UnsetPending'

    dailyStampKeys[index] = ToClient_GetAttendanceInfoWrapper(index)
  end
  dailyStamp:TapInit()
  dailyStamp:Init()
end

FromClient_DailyStampRegionCheck = function(regionData)
  -- function num : 0_25 , upvalues : dailyStamp, secondAttendanceCheck
  do
    if dailyStamp.nextDayShow then
      local isSafeZone = (regionData:get()):isSafeZone()
      -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

      if isSafeZone and not Panel_Window_DailyStamp:GetShow() then
        dailyStamp.nextDayShow = false
        DailyStamp_ShowToggle()
        return 
      end
    end
    if secondAttendanceCheck then
      local isSafeZone = (regionData:get()):isSafeZone()
      if isSafeZone and not Panel_Window_DailyStamp:GetShow() then
        secondAttendanceCheck = false
        DailyStamp_ShowToggle()
        return 
      end
    end
  end
end

DailyStamp_AcceptRewardAll = function(tabIndex)
  -- function num : 0_26 , upvalues : dailyStampKeys
  local attendanceKey = (dailyStampKeys[tabIndex]):getKey()
  local myAttendanceCount = ToClient_getAttendanceCount(attendanceKey)
  local receiveItemIndex = ToClient_getReceivedRewardCount(attendanceKey)
  if receiveItemIndex < myAttendanceCount then
    for index = receiveItemIndex, myAttendanceCount - 1 do
      ToClient_takeRewardItem(attendanceKey)
    end
  end
end

local attendanceTimeCheck = false
local timercount = 0
isPossibleAttandanceCheck = function()
  -- function num : 0_27 , upvalues : dailyStampKeys, dailyStamp, UI_color, attendanceTimeCheck
  if dailyStampKeys[dailyStamp.tapIndex] == nil then
    return false
  end
  local waitingTime = -1
  local possibleAttendance = false
  if (dailyStampKeys[dailyStamp.tapIndex]):isPossibleAttendance() then
    waitingTime = ToClient_getWaitingTimeForAttendance()
    possibleAttendance = true
  end
  if (dailyStampKeys[dailyStamp.tapIndex]):isPossibleOverlapAttendance() then
    waitingTime = ToClient_getWaitingTimeForNextAttendance((dailyStampKeys[dailyStamp.tapIndex]):getKey())
    possibleAttendance = true
  end
  if waitingTime < 0 then
    return false
  end
  if waitingTime == 0 then
    if possibleAttendance then
      (dailyStamp.attendanceTime):SetFontColor(UI_color.C_FF96D4FC)
      ;
      (dailyStamp.attendanceTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_NEWDAY_ATTENDANCE_CLICK"))
    else
      ;
      (dailyStamp.attendanceTime):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (dailyStamp.attendanceTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_TODAY_ATTENDANCE_COMPLETE"))
    end
    if not attendanceTimeCheck then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_TODAY_ATTENDANCE_POSSIBLE"))
      attendanceTimeCheck = true
      DailyStamp_SetData(dailyStamp.tapIndex)
    end
  else
    local remainTimeText = ""
    if waitingTime < 60 then
      remainTimeText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_REMAIN_SECOND", "remainTime", waitingTime)
    else
      remainTimeText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_REMAIN_MINUTE", "remainTime", (math.floor)(waitingTime / 60))
    end
    ;
    (dailyStamp.attendanceTime):SetFontColor(UI_color.C_FFEFEFEF)
    ;
    (dailyStamp.attendanceTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_DONOT_ATTENDANCE_AFTERPOSSIBLE", "remainTimeText", remainTimeText))
    if attendanceTimeCheck then
      attendanceTimeCheck = false
      DailyStamp_SetData(dailyStamp.tapIndex)
    end
  end
  do
    FGlobal_DailyStamp_CheckAttendance(isPossibleAttendance_AnyType(waitingTime))
    return attendanceTimeCheck
  end
end

isPossibleAttendance_AnyType = function(waitingTime)
  -- function num : 0_28 , upvalues : dailyStampCount, dailyStampKeys
  local isPossible = false
  for index = 0, dailyStampCount - 1 do
    if dailyStampKeys[index] ~= nil and waitingTime == 0 and ((dailyStampKeys[index]):isPossibleAttendance() or (dailyStampKeys[index]):isPossibleOverlapAttendance()) then
      isPossible = true
    end
  end
  return isPossible
end

FromClient_AttendanceTimer = function()
  -- function num : 0_29 , upvalues : dailyStampCount, dailyStampKeys, dailyStamp, UI_color
  if ((getSelfPlayer()):get()):getLevel() < 6 then
    return 
  end
  local waitingTime = -1
  local attendance = false
  local remainTimeText = ""
  for index = 0, dailyStampCount - 1 do
    if dailyStampKeys[index] ~= nil and (dailyStampKeys[index]):isPossibleAttendance() then
      waitingTime = ToClient_getWaitingTimeForAttendance()
      if waitingTime == 0 then
        local attendanceKey = (dailyStampKeys[index]):getKey()
        ToClient_onAttendance(attendanceKey)
        attendance = true
      else
        do
          do
            if waitingTime > 0 then
              if waitingTime < 60 then
                remainTimeText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_REMAIN_SECOND", "remainTime", waitingTime)
              else
                remainTimeText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_REMAIN_MINUTE", "remainTime", (math.floor)(waitingTime / 60))
              end
              ;
              (dailyStamp.attendanceTime):SetFontColor(UI_color.C_FFEFEFEF)
              ;
              (dailyStamp.attendanceTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_DONOT_ATTENDANCE_AFTERPOSSIBLE", "remainTimeText", remainTimeText))
            end
            -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  waitingTime = -1
  for index = 0, dailyStampCount - 1 do
    if dailyStampKeys[index] ~= nil and (dailyStampKeys[index]):isPossibleOverlapAttendance() then
      waitingTime = ToClient_getWaitingTimeForNextAttendance((dailyStampKeys[index]):getKey())
      if waitingTime == 0 then
        local attendanceKey = (dailyStampKeys[index]):getKey()
        ToClient_onAttendance(attendanceKey)
        attendance = true
      else
        do
          do
            if waitingTime > 0 then
              if waitingTime < 60 then
                remainTimeText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_REMAIN_SECOND", "remainTime", waitingTime)
              else
                remainTimeText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_REMAIN_MINUTE", "remainTime", (math.floor)(waitingTime / 60))
              end
              if dailyStamp.tapIndex == index then
                (dailyStamp.attendanceTime):SetFontColor(UI_color.C_FFEFEFEF)
                ;
                (dailyStamp.attendanceTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DAILYSTAMP_DONOT_ATTENDANCE_AFTERPOSSIBLE", "remainTimeText", remainTimeText))
              end
            end
            -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

FGlobal_DailyStamp_ShowCheck = function()
  -- function num : 0_30
  if ToClient_IsContentsGroupOpen("1025") then
    DailyStamp_ShowToggle()
  end
end

DailyStamp_SetAnimation = function(tabIndex, dayIndex)
  -- function num : 0_31 , upvalues : dailyStamp
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  dailyStamp.animationTabIndex = tabIndex
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  if (dailyStamp.animationdayIndex)[0] == nil then
    (dailyStamp.animationdayIndex)[0] = dayIndex
  else
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (dailyStamp.animationdayIndex)[1] = dayIndex
  end
end

DailStamp_StampAnimation = function(deltaTime)
  -- function num : 0_32 , upvalues : dailyStamp
  local self = dailyStamp
  self.animationTime = self.animationTime + deltaTime
  if self.tapIndex == self.animationTabIndex and self.animationTime > 0.3 and self.animationTime < 1 then
    for index = 0, #dailyStamp.animationdayIndex do
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):SetShow(true)
      ;
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):ResetVertexAni()
      ;
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):SetScale(1, 1)
      ;
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):SetSize(69, 69)
      ;
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):SetPosX(5)
      ;
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):SetPosY(5)
      ;
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):SetVertexAniRun("Ani_Move_Pos_New", true)
      ;
      (((self.dayControl)[(self.animationdayIndex)[index]])._stamp):SetVertexAniRun("Ani_Scale_New", true)
    end
    audioPostEvent_SystemUi(0, 21)
    self.animationTime = 5
  end
end

Panel_Window_DailyStamp:RegisterUpdateFunc("DailStamp_StampAnimation")
registerEvent("FromClient_AttendanceUpdate", "FromClient_AttendanceUpdate")
registerEvent("FromClient_AttendanceUpdateAll", "FromClient_AttendanceUpdateAll")
registerEvent("FromClient_receiveAttendanceReward", "FromClient_receiveAttendanceReward")
registerEvent("onScreenResize", "Panel_Window_DailyStamp_RePos")
registerEvent("selfPlayer_regionChanged", "FromClient_DailyStampRegionCheck")
registerEvent("FromClient_AttendanceTimer", "FromClient_AttendanceTimer")

