-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\lobby\panel_lobby_selectcharacter.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local ePcWorkingType = CppEnums.PcWorkType
local UI_Class = CppEnums.ClassType
local const_64 = Defines.s64_const
local UCT_BUTTON = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON
local UCT_RADIOBUTTON = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON
local UCT_STATICTEXT = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
local UCT_STATIC = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC
local isSpecialCharacterOpen = ToClient_IsContentsGroupOpen("281")
local CharacterListIndex = 0
local SpecialCharacterListIndex = 1
local isChangeCharacterTab = false
local isGhostMode = false
Panel_CharacterSelectNew:SetShow(false)
local SelectCharacter = {panelTitle = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_CharacterSelect"), btn_EmptySlot = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_CreateSlot"), btn_CharacterSlot = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_Character0"), static_CharacterState = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_Character0"), static_ConnectionState = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_UserCount"), static_CharacterLevel = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_CharLevel"), btn_Create = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_CharacterCreate"), btn_Delete = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_CharacterDelete"), btn_StartGame = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_Start"), static_PenelBG = (UI.getChildControl)(Panel_CharacterSelectNew, "Static_BG"), static_FamilyName = (UI.getChildControl)(Panel_CharacterSelectNew, "FamilyName"), btn_ServerSelect = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_BackServerSelect"), btn_EndGame = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_EndGame"), btn_ChangeLocate = (UI.getChildControl)(Panel_CharacterSelectNew, "CheckButton_CharacterLocateChange"), static_DeleteCancelTitle = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_DeleteTitle"), static_DeleteCancelDate = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_DeleteDate"), btn_DeleteCancel = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_CharacterDeleteCancel"), static_DeleteBox = (UI.getChildControl)(Panel_CharacterSelectNew, "Static_DeleteBox"), static_CharacterInfoBG = (UI.getChildControl)(Panel_CharacterSelectNew, "Static_CharInfo_BG"), btn_ChaInfoStart = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_StartCharacter"), btn_ChaInfoDelete = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_DeleteCharacter"), static_ChaInfoName = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_CharInfo_Name"), static_ChaInfoProgressBG = (UI.getChildControl)(Panel_CharacterSelectNew, "Static_CharInfo_GaugeBG"), static_ChaInfoProgress = (UI.getChildControl)(Panel_CharacterSelectNew, "Progress2_CharInfo_Gauge"), static_ChaInfoProgressText = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_CharInfo_Do"), static_ChaInfo_DoRemainTime = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_CharInfo_RemainTime"), static_ChaInfoNowLoc = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_CharInfo_NowPos"), static_ChaInfoNowLocValue = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_CharInfo_Where"), static_ticketNoByRegion = (UI.getChildControl)(Panel_CharacterSelectNew, "StaticText_TicketNoByRegion"), _scroll = (UI.getChildControl)(Panel_CharacterSelectNew, "Scroll_SlotList"), btn_Link1 = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_Link1"), btn_Link2 = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_Link2"), block_BG = (UI.getChildControl)(Panel_CharacterSelectNew, "Static_block_BG"), radioBtnBG = (UI.getChildControl)(Panel_CharacterSelectNew, "Static_RadioBtnBg"), radioBtn_CharacterList = (UI.getChildControl)(Panel_CharacterSelectNew, "RadioButton_Tab_CharacterList"), radioBtn_SpecialCharacterList = (UI.getChildControl)(Panel_CharacterSelectNew, "RadioButton_Tab_SpecialCharacterList"), premiumPcRoomSizeY = 0}
SelectCharacter._ScrollBtn = (UI.getChildControl)(SelectCharacter._scroll, "Scroll_CtrlButton")
local btn_SaveCustomization = (UI.getChildControl)(Panel_CharacterSelectNew, "Button_LoadCustomization")
btn_SaveCustomization:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERCREATION_MAIN_BUTTON_SAVECUSTOMIZATION"))
btn_SaveCustomization:addInputEvent("Mouse_LUp", "HandleClicked_SaveCustomizationFile()")
local configData = {maxSlot = 0, maxCountSlot = 0, maxScrollCount = 0, freeCount = 0, haveCount = 0, useAbleCount = 0, _startIndex = 0, _listCount = 9, _initList = 12, selectCaracterIdx = -1, isWaitLine = false, 
slotUiPool = {}
}
local getCharacterMaxSlotData = function(isCharacterSpecial)
  -- function num : 0_0
  local maxcount = 0
  if getCharacterDataCount(isCharacterSpecial) <= getCharacterSlotMaxCount(isCharacterSpecial) then
    maxcount = getCharacterSlotLimit(isCharacterSpecial) + 1
  else
    maxcount = getCharacterDataCount(isCharacterSpecial)
  end
  return maxcount
end

local getMaxCharacsterCount = function(isCharacterSpecial)
  -- function num : 0_1
  local characterMaxCount = 0
  local scrSizeY = getScreenSizeY()
  if getCharacterDataCount(isCharacterSpecial) < getCharacterSlotMaxCount(isCharacterSpecial) then
    characterMaxCount = getCharacterSlotMaxCount(isCharacterSpecial)
  else
    characterMaxCount = getCharacterDataCount(isCharacterSpecial)
  end
  return characterMaxCount
end

local SelectCharacter_Init = function()
  -- function num : 0_2 , upvalues : btn_SaveCustomization, SelectCharacter, isSpecialCharacterOpen, configData, isGhostMode
  setShowBlockBG(false)
  Panel_CharacterSelectNew:SetShow(true)
  Panel_CharacterSelectNew:SetSize(getScreenSizeX(), getScreenSizeY())
  if isGameTypeEnglish() and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Pre then
    btn_SaveCustomization:SetShow(true)
  else
    btn_SaveCustomization:SetShow(false)
  end
  ;
  (SelectCharacter.radioBtn_CharacterList):addInputEvent("Mouse_LUp", "RadioButton_Click( 0 )")
  ;
  (SelectCharacter.radioBtn_SpecialCharacterList):addInputEvent("Mouse_LUp", "RadioButton_Click( 1 )")
  ;
  (SelectCharacter.static_PenelBG):AddChild(SelectCharacter.btn_ServerSelect)
  ;
  (SelectCharacter.static_PenelBG):AddChild(SelectCharacter.btn_EndGame)
  ;
  (SelectCharacter.static_PenelBG):AddChild(SelectCharacter.btn_ChangeLocate)
  ;
  (SelectCharacter.static_PenelBG):AddChild(SelectCharacter.static_FamilyName)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.btn_ServerSelect)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.btn_EndGame)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.btn_ChangeLocate)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_FamilyName)
  ;
  (SelectCharacter.static_PenelBG):SetSize((SelectCharacter.static_PenelBG):GetSizeX(), getScreenSizeY())
  ;
  (SelectCharacter.static_PenelBG):ComputePos()
  ;
  (SelectCharacter.static_FamilyName):ComputePos()
  ;
  (SelectCharacter.btn_ServerSelect):ComputePos()
  ;
  (SelectCharacter.btn_EndGame):ComputePos()
  ;
  (SelectCharacter.btn_ChangeLocate):ComputePos()
  ;
  (SelectCharacter.btn_DeleteCancel):ComputePos()
  ;
  (SelectCharacter._scroll):ComputePos()
  ;
  (SelectCharacter.btn_ServerSelect):addInputEvent("Mouse_LUp", "CharacterSelect_Back()")
  ;
  (SelectCharacter.btn_EndGame):addInputEvent("Mouse_LUp", "CharacterSelect_ExitGame()")
  ;
  (SelectCharacter.btn_ChangeLocate):addInputEvent("Mouse_LUp", "CharacterSelect_ChangeLocate()")
  ;
  (SelectCharacter.btn_DeleteCancel):addInputEvent("Mouse_LUp", "CharacterSelect_DeleteCancelCharacter()")
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.btn_ChaInfoStart)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.btn_ChaInfoDelete)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ChaInfoName)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ChaInfoProgressBG)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ChaInfoProgress)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ChaInfoProgressText)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ChaInfoNowLoc)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ChaInfoNowLocValue)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ticketNoByRegion)
  ;
  (SelectCharacter.static_CharacterInfoBG):AddChild(SelectCharacter.static_ChaInfo_DoRemainTime)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.btn_ChaInfoStart)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.btn_ChaInfoDelete)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ChaInfoName)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ChaInfoProgressBG)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ChaInfoProgress)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ChaInfoProgressText)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ChaInfoNowLoc)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ChaInfoNowLocValue)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ticketNoByRegion)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_ChaInfo_DoRemainTime)
  ;
  (SelectCharacter.static_CharacterInfoBG):ComputePos()
  ;
  (SelectCharacter.static_CharacterInfoBG):SetSpanSize((SelectCharacter.static_PenelBG):GetSizeX() + 15, 5)
  ;
  (SelectCharacter.static_CharacterInfoBG):SetShow(false)
  ;
  (SelectCharacter.static_ticketNoByRegion):SetShow(true)
  ;
  (SelectCharacter.btn_ChaInfoStart):addInputEvent("Mouse_LUp", "CharacterSelect_SelectEnterToGame()")
  ;
  (SelectCharacter.btn_ChaInfoDelete):addInputEvent("Mouse_LUp", "CharacterSelect_DeleteCharacter()")
  ;
  (SelectCharacter.static_DeleteBox):AddChild(SelectCharacter.static_DeleteCancelTitle)
  ;
  (SelectCharacter.static_DeleteBox):AddChild(SelectCharacter.static_DeleteCancelDate)
  ;
  (SelectCharacter.static_DeleteBox):AddChild(SelectCharacter.btn_DeleteCancel)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_DeleteCancelTitle)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.static_DeleteCancelDate)
  Panel_CharacterSelectNew:RemoveControl(SelectCharacter.btn_DeleteCancel)
  ;
  (SelectCharacter.static_DeleteBox):ComputePos()
  ;
  (SelectCharacter.static_DeleteBox):SetSpanSize(-((SelectCharacter.static_PenelBG):GetSizeX() / 2), 0)
  ;
  (SelectCharacter.static_DeleteBox):SetShow(false)
  local self = SelectCharacter
  if isSpecialCharacterOpen == true then
    (SelectCharacter.radioBtn_CharacterList):SetShow(false)
    ;
    (SelectCharacter.radioBtn_SpecialCharacterList):SetShow(false)
    ;
    (SelectCharacter.radioBtnBG):SetShow(false)
  else
    ;
    (SelectCharacter.radioBtn_CharacterList):SetShow(false)
    ;
    (SelectCharacter.radioBtn_SpecialCharacterList):SetShow(false)
  end
  local scrSizeY = getScreenSizeY()
  local scrSizeSumY = scrSizeY - (SelectCharacter.static_FamilyName):GetSizeY() - (SelectCharacter.btn_EndGame):GetSizeY() - (SelectCharacter.btn_ChangeLocate):GetSizeY() - 25 - self.premiumPcRoomSizeY + 5
  local btnSizeY = (SelectCharacter.btn_Create):GetSizeY() + 15
  local _btnCount = (math.floor)(scrSizeSumY / btnSizeY)
  ;
  (SelectCharacter._scroll):SetSize((SelectCharacter._scroll):GetSizeX(), btnSizeY * _btnCount - self.premiumPcRoomSizeY)
  -- DECOMPILER ERROR at PC423: Confused about usage of register: R5 in 'UnsetPending'

  configData._listCount = _btnCount
  for slotIdx = 0, configData._listCount - 1 do
    local slot = {}
    slot._btn_Slot = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_CreateSlot", self.static_PenelBG, "SelectCharacter_EmptySlot_" .. slotIdx)
    slot._ChaStat = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_Character0", slot._btn_Slot, "SelectCharacter_ChaStat_" .. slotIdx)
    slot._ContStat = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_UserCount", slot._btn_Slot, "SelectCharacter_ContStat_" .. slotIdx)
    slot._ChaLev = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_CharLevel", slot._btn_Slot, "SelectCharacter_ChaLev_" .. slotIdx)
    slot._btnCreate = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_CharacterCreate", slot._btn_Slot, "SelectCharacter_btnCreate_" .. slotIdx)
    slot._btnStart = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_Start", slot._btn_Slot, "SelectCharacter_btnStart_" .. slotIdx)
    slot._btnUp = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_Up", slot._btn_Slot, "SelectCharacter_btnUp_" .. slotIdx)
    slot._btnDown = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_Down", slot._btn_Slot, "SelectCharacter_btnDown_" .. slotIdx)
    slot._centerBg = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Static_Center", slot._btn_Slot, "SelectCharacter_CenterIcon_" .. slotIdx)
    slot._possibleStat = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_PossibleEnter", slot._btn_Slot, "SelectCharacter_PossibleEnter_" .. slotIdx)
    ;
    (slot._btn_Slot):SetText("")
    ;
    (slot._btn_Slot):SetPosX(12)
    ;
    (slot._btn_Slot):SetPosY((SelectCharacter.static_FamilyName):GetSizeY() + 5 + ((slot._btn_Slot):GetSizeY() + 5) * slotIdx + self.premiumPcRoomSizeY + 5)
    ;
    (slot._ChaStat):SetPosX(300)
    ;
    (slot._ChaStat):SetPosY(15)
    ;
    (slot._ContStat):SetPosX(300)
    ;
    (slot._ContStat):SetPosY(20)
    ;
    (slot._ChaLev):SetPosX(65)
    ;
    (slot._ChaLev):SetPosY(35)
    ;
    (slot._btnCreate):SetPosX(280)
    ;
    (slot._btnCreate):SetPosY(5)
    ;
    (slot._btnStart):SetPosX(280)
    ;
    (slot._btnStart):SetPosY(5)
    ;
    (slot._possibleStat):SetPosX(180)
    ;
    (slot._possibleStat):SetPosY(20)
    ;
    (slot._btn_Slot):SetShow(false)
    ;
    (slot._ChaStat):SetShow(false)
    ;
    (slot._ContStat):SetShow(false)
    ;
    (slot._ChaLev):SetShow(false)
    ;
    (slot._btnCreate):SetShow(false)
    ;
    (slot._btnStart):SetShow(false)
    ;
    (slot._btnUp):SetShow(false)
    ;
    (slot._btnDown):SetShow(false)
    ;
    (slot._centerBg):SetShow(false)
    ;
    (slot._possibleStat):SetShow(false)
    ;
    (slot._btn_Slot):addInputEvent("Mouse_UpScroll", "SelectCharacter_ScrollEvent( true )")
    ;
    (slot._btn_Slot):addInputEvent("Mouse_DownScroll", "SelectCharacter_ScrollEvent( false )")
    ;
    (slot._btnStart):addInputEvent("Mouse_UpScroll", "SelectCharacter_ScrollEvent( true )")
    ;
    (slot._btnStart):addInputEvent("Mouse_DownScroll", "SelectCharacter_ScrollEvent( false )")
    -- DECOMPILER ERROR at PC666: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (configData.slotUiPool)[slotIdx] = slot
  end
  Panel_CharacterSelectNew:SetChildIndex(self.radioBtnBG, 0)
  ;
  (SelectCharacter.btn_Link1):ComputePos()
  ;
  (SelectCharacter.btn_Link2):ComputePos()
  if isGameTypeEnglish() and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Pre then
    (SelectCharacter.btn_Link1):SetShow(true)
    ;
    (SelectCharacter.btn_Link2):SetShow(true)
  else
    ;
    (SelectCharacter.btn_Link1):SetShow(false)
    ;
    (SelectCharacter.btn_Link2):SetShow(false)
  end
  btn_SaveCustomization:ComputePos()
  ;
  (SelectCharacter.btn_Link1):addInputEvent("Mouse_LUp", "HandleClicked_PreOrderAndEvent( 0 )")
  ;
  (SelectCharacter.btn_Link2):addInputEvent("Mouse_LUp", "HandleClicked_PreOrderAndEvent( 1 )")
  ;
  (SelectCharacter.static_PenelBG):addInputEvent("Mouse_UpScroll", "SelectCharacter_ScrollEvent( true )")
  ;
  (SelectCharacter.static_PenelBG):addInputEvent("Mouse_DownScroll", "SelectCharacter_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)(SelectCharacter._scroll, "SelectCharacter_ScrollEvent")
  ;
  (UIScroll.InputEventByControl)(SelectCharacter._scroll, "SelectCharacter_ScrollEvent")
  if ToClient_IsDevelopment() then
    isGhostMode = ToClient_getGhostMode()
    local CheckButton = (UI.getChildControl)(Panel_CharacterSelectNew, "check_GhostMode")
    CheckButton:SetShow(true)
    CheckButton:addInputEvent("Mouse_LUp", "HandleClicked_ToggleGhostMode()")
  end
end

Panel_Lobby_SelectCharacter_EnableSelectButton = function(enableValue)
  -- function num : 0_3 , upvalues : configData, SelectCharacter
  for slotIdx = 0, configData._listCount - 1 do
    _PA_LOG("�\128규보", "Idx:" .. tostring(slotIdx) .. "     " .. tostring(_btnCount))
    local slot = (configData.slotUiPool)[slotIdx]
    ;
    (slot._btn_Slot):SetEnable(enableValue)
    ;
    (slot._btn_Slot):SetMonoTone(not enableValue)
    ;
    (slot._ChaStat):SetEnable(enableValue)
    ;
    (slot._ChaStat):SetMonoTone(not enableValue)
    ;
    (slot._ContStat):SetEnable(enableValue)
    ;
    (slot._ContStat):SetMonoTone(not enableValue)
    ;
    (slot._ChaLev):SetEnable(enableValue)
    ;
    (slot._ChaLev):SetMonoTone(not enableValue)
    ;
    (slot._btnCreate):SetEnable(enableValue)
    ;
    (slot._btnCreate):SetMonoTone(not enableValue)
    ;
    (slot._btnStart):SetEnable(enableValue)
    ;
    (slot._btnStart):SetMonoTone(not enableValue)
    ;
    (slot._btnUp):SetEnable(enableValue)
    ;
    (slot._btnUp):SetMonoTone(not enableValue)
    ;
    (slot._btnDown):SetEnable(enableValue)
    ;
    (slot._btnDown):SetMonoTone(not enableValue)
    ;
    (slot._centerBg):SetEnable(enableValue)
    ;
    (slot._centerBg):SetMonoTone(not enableValue)
  end
  local selChar = SelectCharacter
  ;
  (selChar.btn_ChaInfoStart):SetEnable(enableValue)
  ;
  (selChar.btn_ChaInfoStart):SetMonoTone(not enableValue)
  ;
  (selChar.btn_ChaInfoDelete):SetEnable(enableValue)
  ;
  (selChar.btn_ChaInfoDelete):SetMonoTone(not enableValue)
  ;
  (selChar.btn_ChangeLocate):SetEnable(enableValue)
  ;
  (selChar.btn_ChangeLocate):SetMonoTone(not enableValue)
  ;
  (selChar.btn_EndGame):SetEnable(enableValue)
  ;
  (selChar.btn_EndGame):SetMonoTone(not enableValue)
  ;
  (selChar.btn_ServerSelect):SetEnable(enableValue)
  ;
  (selChar.btn_ServerSelect):SetMonoTone(not enableValue)
end

local CharacterView = function(index, classType, isSpecialCharacter, isChangeSpecialTab)
  -- function num : 0_4 , upvalues : UI_Class
  if classType == UI_Class.ClassType_Warrior then
    viewCharacter(index, -50, -40, -65, 0.15, isSpecialCharacter, isChangeSpecialTab)
    viewCharacterPitchRoll(0, 0)
    viewCharacterFov(0.75)
    setWeatherTime(8, 1)
  else
    if classType == UI_Class.ClassType_Ranger then
      viewCharacter(index, -40, -10, -40, 0.45, isSpecialCharacter, isChangeSpecialTab)
      viewCharacterPitchRoll(-0.05, 0)
      viewCharacterFov(0.55)
      setWeatherTime(8, 0)
    else
      if classType == UI_Class.ClassType_Sorcerer then
        viewCharacter(index, -40, -30, -75, 0.55, isSpecialCharacter, isChangeSpecialTab)
        viewCharacterPitchRoll(0, 0)
        setWeatherTime(8, 9)
        viewCharacterFov(0.55)
      else
        if classType == UI_Class.ClassType_Giant then
          viewCharacter(index, -50, -25, -94, -0.6, isSpecialCharacter, isChangeSpecialTab)
          viewCharacterPitchRoll(0.2, 0)
          setWeatherTime(8, 3)
        else
          if classType == UI_Class.ClassType_Tamer then
            viewCharacter(index, -30, -50, -94, -0.1, isSpecialCharacter, isChangeSpecialTab)
            viewCharacterPitchRoll(0, 0)
            setWeatherTime(8, 17)
            viewCharacterFov(0.55)
          else
            if classType == UI_Class.ClassType_BladeMaster then
              viewCharacter(index, -20, -45, -94, -0.1, isSpecialCharacter, isChangeSpecialTab)
              viewCharacterPitchRoll(0, 0)
              setWeatherTime(8, 21)
              viewCharacterFov(0.75)
            else
              if classType == UI_Class.ClassType_BladeMasterWomen then
                viewCharacter(index, -20, -25, -114, -0.1, isSpecialCharacter, isChangeSpecialTab)
                viewCharacterPitchRoll(0, 0)
                setWeatherTime(8, 23)
                viewCharacterFov(0.75)
              else
                if classType == UI_Class.ClassType_Valkyrie then
                  viewCharacter(index, -20, -20, -94, 1.1, isSpecialCharacter, isChangeSpecialTab)
                  viewCharacterPitchRoll(0, 0)
                  viewCharacterFov(0.65)
                  setWeatherTime(8, 20)
                else
                  if classType == UI_Class.ClassType_Wizard then
                    viewCharacter(index, -20, -20, -94, 1.1, isSpecialCharacter, isChangeSpecialTab)
                    viewCharacterPitchRoll(0, 0)
                    setWeatherTime(8, 19)
                    viewCharacterFov(0.55)
                  else
                    if classType == UI_Class.ClassType_WizardWomen then
                      viewCharacter(index, -20, -20, -94, 1.1, isSpecialCharacter, isChangeSpecialTab)
                      viewCharacterPitchRoll(0, 0)
                      setWeatherTime(8, 21)
                      viewCharacterFov(0.55)
                    else
                      if classType == UI_Class.ClassType_NinjaWomen then
                        viewCharacter(index, -25, -25, -94, 1.1, isSpecialCharacter, isChangeSpecialTab)
                        viewCharacterPitchRoll(0, 0)
                        setWeatherTime(8, 18)
                        viewCharacterFov(0.55)
                      else
                        if classType == UI_Class.ClassType_NinjaMan then
                          viewCharacter(index, -20, -20, -100, 1.1, isSpecialCharacter, isChangeSpecialTab)
                          viewCharacterPitchRoll(0, 0)
                          setWeatherTime(8, 18)
                          viewCharacterFov(0.55)
                        else
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
    end
  end
  if (classType == UI_Class.ClassType_ShyWomen and classType ~= UI_Class.ClassType_Shy) or classType == UI_Class.ClassType_Temp then
    viewCharacter(index, -20, -45, -114, -0.1, isSpecialCharacter, isChangeSpecialTab)
    viewCharacterPitchRoll(0, 0)
    setWeatherTime(8, 23)
    viewCharacterFov(0.75)
  else
  end
  if classType ~= UI_Class.ClassType_Kunoichi or classType == UI_Class.ClassType_DarkElf then
    viewCharacter(index, -20, -45, -114, -0.1, isSpecialCharacter, isChangeSpecialTab)
    viewCharacterPitchRoll(0, 0)
    setWeatherTime(7, 7)
    viewCharacterFov(0.75)
  else
    if classType == UI_Class.ClassType_Combattant then
      viewCharacter(index, -50, -40, -65, 0.15, isSpecialCharacter, isChangeSpecialTab)
      viewCharacterPitchRoll(0, 0)
      viewCharacterFov(0.75)
      setWeatherTime(7, 16)
    else
      if classType == UI_Class.ClassType_CombattantWomen then
        viewCharacter(index, -20, -25, -114, -0.1, isSpecialCharacter, isChangeSpecialTab)
        viewCharacterPitchRoll(0, 0)
        setWeatherTime(7, 17)
        viewCharacterFov(0.75)
      else
        viewCharacter(index, 0, 0, 0, 0, isSpecialCharacter, isChangeSpecialTab)
        viewCharacterPitchRoll(3.14, 0)
      end
    end
  end
end

local ChangeTexture_Class = function(control, classType)
  -- function num : 0_5 , upvalues : UI_Class
  if classType == UI_Class.ClassType_Warrior then
    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
    ;
    (control:getOnTexture()):setUV(x1, y1, x2, y2)
    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
    ;
    (control:getClickTexture()):setUV(x1, y1, x2, y2)
  else
    do
      if classType == UI_Class.ClassType_Ranger then
        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
        ;
        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
        control:setRenderTexture(control:getBaseTexture())
        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
        ;
        (control:getOnTexture()):setUV(x1, y1, x2, y2)
        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
        ;
        (control:getClickTexture()):setUV(x1, y1, x2, y2)
      else
        do
          if classType == UI_Class.ClassType_Sorcerer then
            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 367, 458, 427)
            ;
            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
            control:setRenderTexture(control:getBaseTexture())
            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 428, 458, 488)
            ;
            (control:getOnTexture()):setUV(x1, y1, x2, y2)
            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
            ;
            (control:getClickTexture()):setUV(x1, y1, x2, y2)
          else
            do
              if classType == UI_Class.ClassType_Giant then
                control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                ;
                (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                control:setRenderTexture(control:getBaseTexture())
                control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                ;
                (control:getOnTexture()):setUV(x1, y1, x2, y2)
                control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                ;
                (control:getClickTexture()):setUV(x1, y1, x2, y2)
              else
                do
                  if classType == UI_Class.ClassType_Tamer then
                    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                    ;
                    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                    control:setRenderTexture(control:getBaseTexture())
                    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                    ;
                    (control:getOnTexture()):setUV(x1, y1, x2, y2)
                    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                    ;
                    (control:getClickTexture()):setUV(x1, y1, x2, y2)
                  else
                    do
                      if classType == UI_Class.ClassType_BladeMaster then
                        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                        ;
                        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                        control:setRenderTexture(control:getBaseTexture())
                        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                        ;
                        (control:getOnTexture()):setUV(x1, y1, x2, y2)
                        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                        ;
                        (control:getClickTexture()):setUV(x1, y1, x2, y2)
                      else
                        do
                          if classType == UI_Class.ClassType_BladeMasterWomen then
                            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                            ;
                            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                            control:setRenderTexture(control:getBaseTexture())
                            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                            ;
                            (control:getOnTexture()):setUV(x1, y1, x2, y2)
                            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                            ;
                            (control:getClickTexture()):setUV(x1, y1, x2, y2)
                          else
                            do
                              if classType == UI_Class.ClassType_Valkyrie then
                                control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                ;
                                (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                control:setRenderTexture(control:getBaseTexture())
                                control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                ;
                                (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                ;
                                (control:getClickTexture()):setUV(x1, y1, x2, y2)
                              else
                                do
                                  if classType == UI_Class.ClassType_Wizard then
                                    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                    ;
                                    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                    control:setRenderTexture(control:getBaseTexture())
                                    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                    ;
                                    (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                    ;
                                    (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                  else
                                    do
                                      if classType == UI_Class.ClassType_WizardWomen then
                                        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                        ;
                                        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                        control:setRenderTexture(control:getBaseTexture())
                                        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                        ;
                                        (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                        ;
                                        (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                      else
                                        do
                                          if classType == UI_Class.ClassType_NinjaWomen then
                                            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_06.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                            ;
                                            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                            control:setRenderTexture(control:getBaseTexture())
                                            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_06.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                            ;
                                            (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_06.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                            ;
                                            (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                          else
                                            do
                                              if classType == UI_Class.ClassType_NinjaMan then
                                                control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                                ;
                                                (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                control:setRenderTexture(control:getBaseTexture())
                                                control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                                ;
                                                (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                                ;
                                                (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                              else
                                                do
                                                  if classType == UI_Class.ClassType_DarkElf then
                                                    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                                    ;
                                                    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    control:setRenderTexture(control:getBaseTexture())
                                                    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                                    ;
                                                    (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                                    ;
                                                    (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                                  else
                                                    do
                                                      if classType == UI_Class.ClassType_Combattant then
                                                        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 367, 458, 427)
                                                        ;
                                                        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                        control:setRenderTexture(control:getBaseTexture())
                                                        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 428, 458, 488)
                                                        ;
                                                        (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                                        ;
                                                        (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                                      else
                                                        do
                                                          if classType == UI_Class.ClassType_CombattantWomen then
                                                            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                                            ;
                                                            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                            control:setRenderTexture(control:getBaseTexture())
                                                            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                                            ;
                                                            (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                                            ;
                                                            (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                                          else
                                                            do
                                                              control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                                              ;
                                                              (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                              control:setRenderTexture(control:getBaseTexture())
                                                              control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                                              ;
                                                              (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                              control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 367, 458, 427)
                                                              ;
                                                              (control:getClickTexture()):setUV(x1, y1, x2, y2)
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
end

local ChangeTexture_Slot = function(isFree, control)
  -- function num : 0_6
  if isFree == true then
    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/lobby_classselect_btn_01.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/lobby_classselect_btn_01.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
    ;
    (control:getOnTexture()):setUV(x1, y1, x2, y2)
    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/lobby_classselect_btn_01.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 367, 458, 427)
    ;
    (control:getClickTexture()):setUV(x1, y1, x2, y2)
  else
    do
      control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
      ;
      (control:getBaseTexture()):setUV(x1, y1, x2, y2)
      control:setRenderTexture(control:getBaseTexture())
      control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
      ;
      (control:getOnTexture()):setUV(x1, y1, x2, y2)
      control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
      ;
      (control:getClickTexture()):setUV(x1, y1, x2, y2)
    end
  end
end

local What_R_U_Doing_Now = function(isSpecialCharacter)
  -- function num : 0_7 , upvalues : configData, SelectCharacter, ePcWorkingType
  local characterData = getCharacterDataByIndex(configData.selectCaracterIdx, isSpecialCharacter)
  local workName = "-"
  local progressRate = 0
  if characterData ~= nil then
    local characterName = getCharacterName(characterData)
    local removeTime = getCharacterDataRemoveTime(configData.selectCaracterIdx, isSpecialCharacter)
    local pcDeliveryRegionKey = characterData._arrivalRegionKey
    local serverUtc64 = getServerUtc64()
    local whereIs = "-"
    local regionInfo = nil
    if (characterData._currentPosition).x ~= 0 and (characterData._currentPosition).y ~= 0 and (characterData._currentPosition).z ~= 0 then
      if pcDeliveryRegionKey:get() ~= 0 and characterData._arrivalTime < serverUtc64 then
        regionInfo = getRegionInfoByRegionKey(pcDeliveryRegionKey)
        local retionInfoArrival = getRegionInfoByRegionKey(pcDeliveryRegionKey)
        whereIs = retionInfoArrival:getAreaName()
      else
        do
          regionInfo = getRegionInfoByPosition(characterData._currentPosition)
          whereIs = regionInfo:getAreaName()
          ;
          (SelectCharacter.static_ChaInfo_DoRemainTime):SetShow(false)
          if pcDeliveryRegionKey:get() ~= 0 then
            if serverUtc64 < characterData._arrivalTime then
              local remainTime = characterData._arrivalTime - serverUtc64
              local strTime = convertStringFromDatetime(remainTime)
              ;
              (SelectCharacter.static_ChaInfo_DoRemainTime):SetShow(true)
              ;
              (SelectCharacter.static_ChaInfo_DoRemainTime):SetText(strTime)
            end
            do
              workName = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_DELIVERY")
              if ePcWorkingType.ePcWorkType_Empty == characterData._pcWorkingType or ePcWorkingType.ePcWorkType_Play == characterData._pcWorkingType then
                workName = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_NONE")
              else
                if ePcWorkingType.ePcWorkType_RepairItem == characterData._pcWorkingType then
                  workName = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_REPAIRITEM")
                else
                  if ePcWorkingType.ePcWorkType_Relax == characterData._pcWorkingType then
                    workName = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_RELEX")
                  else
                    if ePcWorkingType.ePcWorkType_ReadBook == characterData._pcWorkingType then
                      local totalWorkingTime = characterData._workingStartCompletingDate - characterData._workingStartDate
                      local workedTime = serverUtc64 - characterData._workingStartDate
                      progressRate = (string.format)("%.1f", Int64toInt32(workedTime) / Int64toInt32(totalWorkingTime) * 100)
                      workName = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_READBOOK")
                    else
                      do
                        do
                          _PA_ASSERT(false, "캐릭�\176 작업 �\128입이 추가 되었습니�\164. Lobby_New.lua 에도 추가�\180 주어�\188 합니�\164.")
                          ;
                          (SelectCharacter.static_ChaInfoName):SetText(characterName)
                          ;
                          (SelectCharacter.static_ChaInfoProgress):SetProgressRate(progressRate)
                          ;
                          (SelectCharacter.static_ChaInfoProgressText):SetText(workName)
                          ;
                          (SelectCharacter.static_ChaInfoNowLocValue):SetText(whereIs)
                          ;
                          (SelectCharacter.static_ticketNoByRegion):SetText(whereIs)
                          if removeTime ~= nil then
                            (SelectCharacter.static_DeleteCancelDate):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_DELETE") .. " ( " .. removeTime .. " )")
                            ;
                            (SelectCharacter.static_DeleteBox):SetShow(true)
                            ;
                            (SelectCharacter.btn_ChaInfoDelete):SetShow(false)
                            ;
                            (SelectCharacter.btn_ChaInfoStart):SetShow(false)
                            ;
                            (SelectCharacter.static_ticketNoByRegion):SetShow(false)
                            ;
                            (SelectCharacter.static_ChaInfoProgressText):SetText(PAGetString(Defines.StringSheet_GAME, "CHARACTER_DELETING"))
                          else
                            ;
                            (SelectCharacter.static_DeleteBox):SetShow(false)
                            ;
                            (SelectCharacter.btn_ChaInfoDelete):SetShow(true)
                            if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Pre then
                              (SelectCharacter.btn_ChaInfoStart):SetShow(false)
                              ;
                              (SelectCharacter.static_ticketNoByRegion):SetShow(false)
                            else
                              ;
                              (SelectCharacter.btn_ChaInfoStart):SetShow(true)
                              ;
                              (SelectCharacter.static_ticketNoByRegion):SetShow(true)
                            end
                          end
                          if progressRate == 0 then
                            (SelectCharacter.static_ChaInfoProgress):SetShow(false)
                            ;
                            (SelectCharacter.static_ChaInfoProgressBG):SetShow(false)
                          else
                            ;
                            (SelectCharacter.static_ChaInfoProgress):SetShow(true)
                            ;
                            (SelectCharacter.static_ChaInfoProgressBG):SetShow(true)
                          end
                          ;
                          (SelectCharacter.static_ChaInfoName):SetShow(true)
                          ;
                          (SelectCharacter.static_ChaInfoProgressText):SetShow(true)
                          ;
                          (SelectCharacter.static_ChaInfoNowLoc):SetShow(true)
                          ;
                          (SelectCharacter.static_ChaInfoNowLocValue):SetShow(true)
                          ;
                          (SelectCharacter.static_CharacterInfoBG):SetShow(true)
                          ;
                          (SelectCharacter.static_ChaInfo_DoRemainTime):SetShow(false)
                          ;
                          (SelectCharacter.static_DeleteBox):SetShow(false)
                          ;
                          (SelectCharacter.btn_ChaInfoDelete):SetShow(false)
                          ;
                          (SelectCharacter.btn_ChaInfoStart):SetShow(false)
                          ;
                          (SelectCharacter.static_ticketNoByRegion):SetShow(false)
                          ;
                          (SelectCharacter.static_ChaInfoProgress):SetShow(false)
                          ;
                          (SelectCharacter.static_ChaInfoProgressBG):SetShow(false)
                          ;
                          (SelectCharacter.static_ChaInfoName):SetShow(false)
                          ;
                          (SelectCharacter.static_ChaInfoProgressText):SetShow(false)
                          ;
                          (SelectCharacter.static_ChaInfoNowLoc):SetShow(false)
                          ;
                          (SelectCharacter.static_ChaInfoNowLocValue):SetShow(false)
                          ;
                          (SelectCharacter.static_CharacterInfoBG):SetShow(false)
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
    end
  end
end

local CharacterCustomization_Close = function()
  -- function num : 0_8
  Panel_Customization_Control:SetShow(false, false)
  Panel_CustomizationTest:SetShow(false, false)
  Panel_CharacterCreateSelectClass:SetShow(false, false)
  Panel_CustomizationTransform:SetShow(false, false)
  Panel_CustomizationMesh:SetShow(false, false)
  Panel_CustomizationMain:SetShow(false, false)
  Panel_CustomizationStatic:SetShow(false, false)
  Panel_CustomizationMessage:SetShow(false, false)
  Panel_CustomizationFrame:SetShow(false, false)
  Panel_CustomizationMotion:SetShow(false, false)
  Panel_CustomizationExpression:SetShow(false, false)
  Panel_CustomizationCloth:SetShow(false, false)
end

local getMaxCharacsterScrollCount = function(isSpecialCharacter)
  -- function num : 0_9 , upvalues : SelectCharacter, configData
  local scrSizeY = getScreenSizeY()
  local scrSizeSumY = scrSizeY - (SelectCharacter.static_FamilyName):GetSizeY() - (SelectCharacter.btn_EndGame):GetSizeY() - (SelectCharacter.btn_ChangeLocate):GetSizeY() - 25 - SelectCharacter.premiumPcRoomSizeY + 5
  local btnSizeY = (SelectCharacter.btn_Create):GetSizeY() + 15
  local _btnCount = (math.floor)(scrSizeSumY / btnSizeY)
  local characterCount = getCharacterDataCount(isSpecialCharacter)
  local useableSlotCount = getCharacterSlotLimit(isSpecialCharacter)
  local maxSlotCount = getCharacterSlotMaxCount(isSpecialCharacter)
  local scrollCount = 0
  scrollCount = scrollCount + characterCount
  if characterCount < useableSlotCount then
    scrollCount = scrollCount + 1
  end
  if characterCount + 1 < useableSlotCount then
    scrollCount = scrollCount + (useableSlotCount - (characterCount + 1))
  end
  if characterCount < maxSlotCount and useableSlotCount < maxSlotCount then
    scrollCount = scrollCount + 1
  end
  scrollCount = scrollCount - configData._startIndex
  if _btnCount < scrollCount then
    scrollCount = _btnCount
  end
  return scrollCount
end

local getMaxSPCharacsterScrollCount = function()
  -- function num : 0_10 , upvalues : SelectCharacter, configData
  local scrSizeY = getScreenSizeY()
  local scrSizeSumY = scrSizeY - (SelectCharacter.static_FamilyName):GetSizeY() - (SelectCharacter.btn_EndGame):GetSizeY() - (SelectCharacter.btn_ChangeLocate):GetSizeY() - 25 - SelectCharacter.premiumPcRoomSizeY + 5
  local btnSizeY = (SelectCharacter.btn_Create):GetSizeY() + 15
  local _btnCount = (math.floor)(scrSizeSumY / btnSizeY)
  local characterCount = getSpecialCharacterDataCount()
  local useableSlotCount = getSpecialCharacterSlotLimit()
  local maxSlotCount = getSpecialCharacterSlotMaxCount()
  local scrollCount = 0
  scrollCount = scrollCount + characterCount
  if characterCount < useableSlotCount then
    scrollCount = scrollCount + 1
  end
  if characterCount + 1 < useableSlotCount then
    scrollCount = scrollCount + (useableSlotCount - (characterCount + 1))
  end
  if characterCount < maxSlotCount and useableSlotCount < maxSlotCount then
    scrollCount = scrollCount + 1
  end
  scrollCount = scrollCount - configData._startIndex
  if _btnCount < scrollCount then
    scrollCount = _btnCount
  end
  return scrollCount
end

scrollTotalCount = function()
  -- function num : 0_11 , upvalues : SelectCharacter
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  local characterCount = getCharacterDataCount(isSpecialCharacter)
  local useableSlotCount = getCharacterSlotLimit(isSpecialCharacter)
  local maxSlotCount = getCharacterSlotMaxCount(isSpecialCharacter)
  local maxCount = characterCount
  if characterCount < useableSlotCount then
    maxCount = maxCount + (useableSlotCount - characterCount)
  end
  if maxCount < maxSlotCount then
    maxCount = maxCount + 1
  end
  return maxCount
end

local CharacterList_Update = function(isChangeSpecialTab)
  -- function num : 0_12 , upvalues : SelectCharacter, configData, getCharacterMaxSlotData, getMaxCharacsterCount, getMaxCharacsterScrollCount, ChangeTexture_Slot, ChangeTexture_Class, CharacterView, What_R_U_Doing_Now, isGhostMode
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R2 in 'UnsetPending'

  configData.maxSlot = getCharacterMaxSlotData(isSpecialCharacter)
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

  configData.maxCountSlot = getMaxCharacsterCount(isSpecialCharacter)
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

  configData.maxScrollCount = getMaxCharacsterScrollCount(isSpecialCharacter)
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  configData.freeCount = getCharacterSlotDefaultCount(isSpecialCharacter)
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

  configData.haveCount = getCharacterDataCount(isSpecialCharacter)
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

  configData.useAbleCount = getCharacterSlotLimit(isSpecialCharacter)
  for slotIdx = 0, configData._listCount - 1 do
    local slot = (configData.slotUiPool)[slotIdx]
    ;
    (slot._btn_Slot):SetShow(false)
    ;
    (slot._ChaStat):SetShow(false)
    ;
    (slot._ContStat):SetShow(false)
    ;
    (slot._ChaLev):SetShow(false)
    ;
    (slot._btnCreate):SetShow(false)
    ;
    (slot._btnStart):SetShow(false)
    ;
    (slot._btnUp):SetShow(false)
    ;
    (slot._btnDown):SetShow(false)
    ;
    (slot._centerBg):SetShow(false)
    ;
    (slot._btn_Slot):SetMonoTone(false)
    ;
    (slot._btn_Slot):SetIgnore(false)
    ;
    (slot._btn_Slot):SetEnable(true)
  end
  ;
  (SelectCharacter.static_ChaInfoName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. ". 0")
  ;
  (SelectCharacter.static_ChaInfoProgressText):SetText("-")
  ;
  (SelectCharacter.static_ChaInfoNowLocValue):SetText("")
  ;
  (SelectCharacter.static_ticketNoByRegion):SetText("")
  ;
  (SelectCharacter.static_FamilyName):SetText(getFamilyName())
  -- DECOMPILER ERROR at PC133: Confused about usage of register: R2 in 'UnsetPending'

  if configData.selectCaracterIdx == -1 then
    configData.selectCaracterIdx = 0
  end
  local scrollListIndex = 0
  local maxCharacter = getMaxCharacsterScrollCount(isSpecialCharacter)
  ;
  (SelectCharacter.radioBtnBG):SetSize((SelectCharacter.radioBtnBG):GetSizeX(), (SelectCharacter.static_FamilyName):GetSizeY() + 5 + ((((configData.slotUiPool)[0])._btn_Slot):GetSizeY() + 5) * maxCharacter - 31)
  local iii = 0
  for slotIdx = configData._startIndex, maxCharacter + configData._startIndex - 1 do
    local slot = (configData.slotUiPool)[iii]
    iii = iii + 1
    ;
    (slot._btn_Slot):SetTextHorizonLeft()
    ;
    (slot._btn_Slot):SetTextVerticalTop()
    ;
    (slot._btn_Slot):SetTextSpan(70, 7)
    if slotIdx < configData.freeCount then
      ChangeTexture_Slot(true, slot._btn_Slot)
    else
      if slotIdx < configData.useAbleCount then
        ChangeTexture_Slot(true, slot._btn_Slot)
      else
        ChangeTexture_Slot(false, slot._btn_Slot)
      end
    end
    if slotIdx < configData.haveCount then
      local characterData = getCharacterDataByIndex(slotIdx, isSpecialCharacter)
      local characterName = getCharacterName(characterData)
      local classType = getCharacterClassType(characterData)
      local characterLevel = ((string.format)("%d", characterData._level))
      local regionInfo = nil
      local removeTime = getCharacterDataRemoveTime(slotIdx, isSpecialCharacter)
      if removeTime ~= nil then
        characterName = characterName .. " " .. PAGetString(Defines.StringSheet_GAME, "CHARACTER_DELETING")
      end
      ChangeTexture_Class(slot._btn_Slot, classType)
      ;
      (slot._btn_Slot):SetText(characterName)
      ;
      (slot._ChaLev):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. characterLevel)
      if configData.selectCaracterIdx == slotIdx then
        CharacterView(configData.selectCaracterIdx, classType, isSpecialCharacter, isChangeSpecialTab)
        ;
        (slot._btn_Slot):SetCheck(true)
      else
        ;
        (slot._btn_Slot):SetCheck(false)
      end
      ;
      (slot._btn_Slot):addInputEvent("Mouse_LUp", "CharacterSelect_selected( " .. slotIdx .. " )")
      ;
      (slot._btnStart):addInputEvent("Mouse_LUp", "CharacterSelect_PlayGame( " .. slotIdx .. " )")
      ;
      (slot._btnUp):addInputEvent("Mouse_LUp", "CharacterSelect_ChangeCharacterPosition( " .. slotIdx .. ", true )")
      ;
      (slot._btnDown):addInputEvent("Mouse_LUp", "CharacterSelect_ChangeCharacterPosition( " .. slotIdx .. ", false )")
      ;
      (slot._btn_Slot):SetShow(true)
      ;
      (slot._ChaStat):SetShow(false)
      ;
      (slot._ContStat):SetShow(false)
      ;
      (slot._ChaLev):SetShow(true)
      ;
      (slot._btnCreate):SetShow(false)
      if removeTime ~= nil then
        (slot._btnStart):SetShow(false)
      else
        if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Pre then
          (slot._btnStart):SetShow(false)
        else
          if (SelectCharacter.btn_ChangeLocate):IsCheck() then
            (slot._ChaStat):SetPosX(300)
            ;
            (slot._ChaStat):SetPosY(15)
            ;
            (slot._ContStat):SetPosX(300)
            ;
            (slot._ContStat):SetPosY(20)
            ;
            (slot._ChaLev):SetPosX(85)
            ;
            (slot._ChaLev):SetPosY(35)
            ;
            (slot._btnCreate):SetPosX(280)
            ;
            (slot._btnCreate):SetPosY(5)
            ;
            (slot._btnStart):SetPosX(280)
            ;
            (slot._btnStart):SetPosY(5)
            ;
            (slot._btnUp):SetPosX(62)
            ;
            (slot._btnUp):SetPosY(5)
            ;
            (slot._btnDown):SetPosX(62)
            ;
            (slot._btnDown):SetPosY(37)
            ;
            (slot._centerBg):SetPosX(62)
            ;
            (slot._centerBg):SetPosY(25)
            ;
            (slot._btnUp):SetShow(true)
            ;
            (slot._btnDown):SetShow(true)
            ;
            (slot._centerBg):SetShow(true)
            ;
            (slot._btn_Slot):SetTextSpan(90, 7)
          else
            ;
            (slot._ChaStat):SetPosX(300)
            ;
            (slot._ChaStat):SetPosY(15)
            ;
            (slot._ContStat):SetPosX(300)
            ;
            (slot._ContStat):SetPosY(20)
            ;
            (slot._ChaLev):SetPosX(65)
            ;
            (slot._ChaLev):SetPosY(35)
            ;
            (slot._btnCreate):SetPosX(280)
            ;
            (slot._btnCreate):SetPosY(5)
            ;
            (slot._btnStart):SetPosX(280)
            ;
            (slot._btnStart):SetPosY(5)
            ;
            (slot._btnUp):SetShow(false)
            ;
            (slot._btnDown):SetShow(false)
            ;
            (slot._centerBg):SetShow(false)
          end
          if ToClient_isDataStreamingContentsOpen() then
            (slot._possibleStat):SetPosX(180)
            ;
            (slot._possibleStat):SetPosY(20)
            ;
            (slot._possibleStat):SetShow(true)
            if ToClient_isPossibleEnterToField(characterData._currentPosition) then
              (slot._possibleStat):SetText("접속 �\128�\165")
            else
              ;
              (slot._possibleStat):SetText("접속 불가�\165")
              Panel_DataProgress:SetShow(true)
              PaGlobal_Dataprogress:Initialize()
            end
          else
            ;
            (slot._possibleStat):SetShow(false)
          end
          ;
          (slot._btnStart):SetShow(true)
        end
      end
      ;
      (slot._btn_Slot):SetIgnore(false)
    else
      do
        do
          ;
          (slot._btn_Slot):addInputEvent("Mouse_LUp", "CharacterSelect_CreateNewCharacter()")
          ;
          (slot._btnStart):addInputEvent("Mouse_LUp", "")
          ;
          (slot._btnUp):addInputEvent("Mouse_LUp", "")
          ;
          (slot._btnDown):addInputEvent("Mouse_LUp", "")
          ;
          (slot._btn_Slot):SetShow(true)
          ;
          (slot._ChaStat):SetShow(false)
          ;
          (slot._ContStat):SetShow(false)
          ;
          (slot._ChaLev):SetShow(false)
          ;
          (slot._btnCreate):SetShow(false)
          ;
          (slot._btnStart):SetShow(false)
          ;
          (slot._btnUp):SetShow(false)
          ;
          (slot._btnDown):SetShow(false)
          ;
          (slot._centerBg):SetShow(false)
          ;
          (slot._btn_Slot):SetIgnore(false)
          if configData.haveCount == slotIdx then
            (slot._btn_Slot):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERSELECT_CREATENEWCHARACTER_BTN"))
            ;
            (slot._btn_Slot):SetTextHorizonCenter()
            ;
            (slot._btn_Slot):SetTextVerticalCenter()
            ;
            (slot._btn_Slot):SetTextSpan(50, 0)
            ;
            (slot._btn_Slot):SetEnable(true)
            ;
            (slot._btn_Slot):SetMonoTone(false)
            ;
            (slot._btnCreate):SetShow(false)
            if configData.freeCount <= slotIdx and configData.useAbleCount <= slotIdx then
              (slot._btn_Slot):SetIgnore(true)
              ;
              (slot._btn_Slot):SetText("")
              ;
              (slot._btnCreate):SetShow(false)
            end
          else
            if configData.freeCount <= slotIdx and configData.useAbleCount <= slotIdx then
              (slot._btn_Slot):SetText("")
            end
            ;
            (slot._btn_Slot):SetText("")
            ;
            (slot._btn_Slot):SetIgnore(true)
            ;
            (slot._btn_Slot):SetEnable(false)
            ;
            (slot._btn_Slot):SetMonoTone(true)
            ;
            (slot._btnCreate):SetShow(false)
          end
          scrollListIndex = scrollListIndex + 1
          -- DECOMPILER ERROR at PC691: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC691: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC691: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(SelectCharacter._scroll, configData.maxScrollCount, scrollTotalCount())
  What_R_U_Doing_Now(isSpecialCharacter)
  local selectedCharacterData = getCharacterDataByIndex(configData.selectCaracterIdx, isSpecialCharacter)
  if selectedCharacterData ~= nil then
    CharacterSelect_setUpdateTicketNo(selectedCharacterData)
  end
  local GhostButton = (UI.getChildControl)(Panel_CharacterSelectNew, "check_GhostMode")
  isGhostMode = ToClient_getGhostMode()
  if isGhostMode then
    GhostButton:SetText("GhostMode ON")
  else
    GhostButton:SetText("GhostMode OFF")
  end
end

CharacterSelect_ChangeLocate = function()
  -- function num : 0_13 , upvalues : SelectCharacter, CharacterList_Update
  if not (SelectCharacter.btn_ChangeLocate):IsCheck() then
    ToClient_SaveClientCacheData()
  end
  CharacterList_Update(false)
end

SelectCharacter_ScrollEvent = function(isUp)
  -- function num : 0_14 , upvalues : SelectCharacter, configData, CharacterList_Update
  local self = SelectCharacter
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

  configData._startIndex = (UIScroll.ScrollEvent)(self._scroll, isUp, configData.maxScrollCount, scrollTotalCount(), configData._startIndex, 1)
  CharacterList_Update(false)
end

CharacterSelect_selected = function(index)
  -- function num : 0_15 , upvalues : configData, CharacterList_Update
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  configData.selectCaracterIdx = index
  CharacterList_Update(false)
end

CharacterSelect_PlayGame = function(index)
  -- function num : 0_16 , upvalues : SelectCharacter, configData, ePcWorkingType
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  configData.selectCaracterIdx = index
  local characterData = getCharacterDataByIndex(index, isSpecialCharacter)
  local classType = getCharacterClassType(characterData)
  local characterCount = getCharacterDataCount()
  local serverUtc64 = getServerUtc64()
  do
    if ToClient_IsCustomizeOnlyClass(classType) then
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_SELECTCHARACTER_NOTYET"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
      return 
    end
    if characterData ~= nil then
      if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT or getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_OBT or getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Commercial then
        if characterData._level == 1 and characterCount == 1 then
          FGlobal_FirstLogin_Open(index)
        else
          local pcDeliveryRegionKey = characterData._arrivalRegionKey
          if (ePcWorkingType.ePcWorkType_Empty ~= characterData._pcWorkingType and ePcWorkingType.ePcWorkType_Play ~= characterData._pcWorkingType) or pcDeliveryRegionKey:get() ~= 0 and serverUtc64 < characterData._arrivalTime then
            if pcDeliveryRegionKey:get() ~= 0 then
              contentString = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_WORKING_NOW_CHANGE_Q") .. PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_MAIN_MOVECHARACTER_MSG")
            else
              if ePcWorkingType.ePcWorkType_ReadBook == characterData._pcWorkingType then
                contentString = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_WORKING_NOW_READ_BOOK")
              else
                if ePcWorkingType.ePcWorkType_RepairItem == characterData._pcWorkingType then
                  contentString = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_WORKING_NOW_REPAIR")
                end
              end
            end
            local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"), content = contentString, functionYes = CharacterSelect_SelectEnterToGame, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageboxData)
          else
            do
              if ToClient_IsCustomizeOnlyClass(classType) then
                local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_SELECTCHARACTER_CUSTOMIZEONLYCLASS_MEMO"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                ;
                (MessageBox.showMessageBox)(messageboxData)
              else
                do
                  do
                    if selectCharacter(configData.selectCaracterIdx, isSpecialCharacter) == true then
                      Panel_Lobby_SelectCharacter_EnableSelectButton(false)
                    end
                    local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
                    local messageboxData = {title = titleText, content = PAGetString(Defines.StringSheet_GAME, "PANEL_LOBBY_PREDOWNLOAD"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, exitButton = false}
                    ;
                    (MessageBox.showMessageBox)(messageboxData)
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

CharacterSelect_ChangeCharacterPosition = function(index, isUp)
  -- function num : 0_17 , upvalues : CharacterList_Update
  if index == nil and isUp == nil then
    return 
  end
  ToClient_ChangeCharacterListOrder(index, isUp)
  ToClient_SaveClientCacheData()
  CharacterList_Update(false)
end

CharacterSelect_SelectEnterToGame = function()
  -- function num : 0_18 , upvalues : SelectCharacter, configData
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  local characterData = getCharacterDataByIndex(configData.selectCaracterIdx, isSpecialCharacter)
  local classType = getCharacterClassType(characterData)
  if characterData ~= nil then
    if ToClient_IsCustomizeOnlyClass(classType) then
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_SELECTCHARACTER_NOTYET_1") .. PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_SELECTCHARACTER_NOTYET_2"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    else
      do
        selectCharacter(configData.selectCaracterIdx, isSpecialCharacter)
      end
    end
  end
end

CharacterSelect_Open = function(characterIndex)
  -- function num : 0_19 , upvalues : configData, CharacterCustomization_Close, SelectCharacter, CharacterList_Update
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if characterIndex == -1 or configData.haveCount <= characterIndex then
    configData.selectCaracterIdx = 0
  else
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

    if characterIndex == -2 then
      configData.selectCaracterIdx = configData.selectCaracterIdx
    else
      -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

      configData.selectCaracterIdx = characterIndex
    end
  end
  CharacterCustomization_Close()
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  configData._startIndex = 0
  ;
  (SelectCharacter.btn_ChangeLocate):SetCheck(false)
  CharacterList_Update(false)
  ;
  (SelectCharacter._scroll):SetControlPos(0)
  Panel_CharacterSelectNew:SetShow(true)
end

CharacterSelect_ExitGame = function()
  -- function num : 0_20
  local do_Exit = function()
    -- function num : 0_20_0
    disConnectToGame()
    GlobalExitGameClient()
  end

  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "GAME_EXIT_MESSAGEBOX_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "GAME_EXIT_MESSAGEBOX_MEMO"), functionYes = do_Exit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

CharacterSelect_Back = function()
  -- function num : 0_21
  Panel_CharacterSelectNew:SetShow(false)
  backServerSelect()
end

CharacterSelect_DeleteCharacter = function()
  -- function num : 0_22 , upvalues : SelectCharacter, configData
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  if configData.selectCaracterIdx ~= -1 then
    local do_Delete = function()
    -- function num : 0_22_0 , upvalues : configData, isSpecialCharacter
    deleteCharacter(configData.selectCaracterIdx, isSpecialCharacter)
  end

    local characterData = getCharacterDataByIndex(configData.selectCaracterIdx, isSpecialCharacter)
    if characterData == nil then
      return 
    end
    local characterData = getCharacterDataByIndex(configData.selectCaracterIdx, isSpecialCharacter)
    local removeTimeCheckLevel = (getCharacterRemoveTimeCheckLevel())
    local removeTime = nil
    if characterData._level < removeTimeCheckLevel then
      removeTime = Int64toInt32(getLowLevelCharacterRemoveDate())
    else
      removeTime = Int64toInt32(getCharacterRemoveDate())
    end
    local characterNameRestoreTime = Int64toInt32(getNameRemoveDate())
    local remainTime = convertStringFromDatetime(toInt64(0, characterNameRestoreTime - removeTime))
    local messageContent = PAGetStringParam3(Defines.StringSheet_GAME, "CHARACTER_LATER_DELETE_MESSAGEBOX_MEMO", "removeTime", convertStringFromDatetime(toInt64(0, removeTime)), "characterName", getCharacterName(characterData), "remainTime", remainTime)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "CHARACTER_DELETE_MESSAGEBOX_TITLE"), content = messageContent, functionYes = do_Delete, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
end

CharacterSelect_DeleteCancelCharacter = function()
  -- function num : 0_23 , upvalues : SelectCharacter, configData
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  if configData.selectCaracterIdx ~= -1 then
    deleteCancelCharacter(configData.selectCaracterIdx, isSpecialCharacter)
  end
end

FGlobal_CharacterSelect_Close = function()
  -- function num : 0_24
  Panel_CharacterSelectNew:SetShow(false)
end

CharacterSelect_CreateNewCharacter = function()
  -- function num : 0_25 , upvalues : SelectCharacter
  if Panel_Win_System:GetShow() then
    return 
  end
  local do_Create = function()
    -- function num : 0_25_0 , upvalues : SelectCharacter
    local isSpecialCharacter = false
    if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
      isSpecialCharacter = true
    end
    changeCreateCharacterMode_SelectClass(isSpecialCharacter)
    FGlobal_SetSpecialCharacter(isSpecialCharacter)
  end

  local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERSELECT_CREATENEWCHARACTER_NOTIFY")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERSELECT_CREATENEWCHARACTER_BTN"), content = messageContent, functionYes = do_Create, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "middle")
end

CharacterSelect_setUpdateTicketNo = function(characterData)
  -- function num : 0_26 , upvalues : const_64, SelectCharacter
  local firstTicketNo = getFirstTicketNoByAll()
  local currentTicketNo = getCurrentTicketNo()
  local ticketCountByRegion = characterData._lastTicketNoByRegion
  local myRegionWaitingPlayerCount = currentTicketNo - ticketCountByRegion
  local serverPlayingCount = currentTicketNo - firstTicketNo
  local classType = getCharacterClassType(characterData)
  local isPossibleClass = ToClient_IsCustomizeOnlyClass(classType)
  if const_64.s64_m1 ~= firstTicketNo or const_64.s64_m1 ~= ticketCountByRegion then
    (SelectCharacter.static_ticketNoByRegion):SetFontColor((Defines.Color).C_FFD20000)
    ;
    (SelectCharacter.static_ticketNoByRegion):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NOT_ENTER_TO_FIELD"))
  else
    if isPossibleClass == true then
      (SelectCharacter.static_ticketNoByRegion):SetFontColor((Defines.Color).C_FFD20000)
      ;
      (SelectCharacter.static_ticketNoByRegion):SetText("")
    else
      ;
      (SelectCharacter.static_ticketNoByRegion):SetFontColor((Defines.Color).C_FF96D4FC)
      ;
      (SelectCharacter.static_ticketNoByRegion):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENTER_TO_FIELD"))
    end
  end
end

cancelEnterWaitingLine = function()
  -- function num : 0_27 , upvalues : configData
  setShowBlockBG(false)
  if configData.isWaitLine == true then
    MessageBox_HideAni()
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

    configData.isWaitLine = false
  end
end

makeEnterWaitingUserMsg = function(receiveTicketNoMyRegion)
  -- function num : 0_28 , upvalues : SelectCharacter, configData, const_64
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  local ticketCountByRegion = receiveTicketNoMyRegion
  local waitingLineCancelCount = getCancelCount()
  if ticketCountByRegion == -1 then
    local selectedCharacterData = getCharacterDataByIndex(configData.selectCaracterIdx, isSpecialCharacter)
    local regionInfo = getRegionInfoByPosition(selectedCharacterData._currentPosition)
    local regionGroupKey = 1
    if regionInfo ~= nil then
      regionGroupKey = regionInfo:getRegionGroupKey()
    end
    ticketCountByRegion = getTicketCountByRegion(regionGroupKey)
  end
  do
    local currentTicketNo = getCurrentTicketNo()
    local firstTicketNoByAll = getFirstTicketNoByAll()
    local totalWaitingPlayerCount = getAllWaitingLine() - getAllCancelCount()
    local myRegionWaitingPlayerCount = getMyWaitingLine() - getCancelCount()
    if totalWaitingPlayerCount < 0 then
      totalWaitingPlayerCount = 0
    end
    if myRegionWaitingPlayerCount <= 0 then
      myRegionWaitingPlayerCount = 0
    end
    local waitMsg = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WAIT_MESSAGE")
    local serverWaitStr = PAGetStringParam1(Defines.StringSheet_GAME, "CHARACTER_SERVER_WAIT_COUNT", "iCount", tostring(totalWaitingPlayerCount))
    local regionWaitStr = PAGetStringParam1(Defines.StringSheet_GAME, "CHARACTER_REGION_WAIT_COUNT", "iCount", tostring(myRegionWaitingPlayerCount))
    local emptyStr = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WAITING_PLAYER_EMPTY")
    local taiwanMsg = ""
    if isGameTypeTaiwan() then
      taiwanMsg = "\n\n黑色沙漠為單�\128世界全伺服器共�\128�，在遊戲時可在各頻道間自由移動，請選擇進行較順利的頻道登入遊戲即可"
    end
    if const_64.s64_m1 == firstTicketNoByAll and const_64.s64_m1 ~= ticketCountByRegion then
      strWaitingMsg = waitMsg .. "\n\n" .. regionWaitStr .. taiwanMsg
    else
      if (const_64.s64_m1 == ticketCountByRegion and const_64.s64_m1 ~= firstTicketNoByAll) or const_64.s64_m1 ~= ticketCountByRegion and myRegionWaitingPlayerCount == 0 then
        strWaitingMsg = waitMsg .. "\n\n" .. serverWaitStr .. "\n\n" .. PAGetString(Defines.StringSheet_GAME, "CHARACTER_REGION_WAIT_TEXT") .. emptyStr .. taiwanMsg
      else
        strWaitingMsg = waitMsg .. "\n\n" .. serverWaitStr .. "\n\n" .. regionWaitStr .. taiwanMsg
      end
    end
    return strWaitingMsg
  end
end

setShowBlockBG = function(isShow)
  -- function num : 0_29 , upvalues : SelectCharacter
  (SelectCharacter.block_BG):SetShow(isShow)
  ;
  (SelectCharacter.block_BG):SetSize(getScreenSizeX() + 200, getScreenSizeY() + 200)
  ;
  (SelectCharacter.block_BG):SetHorizonCenter()
  ;
  (SelectCharacter.block_BG):SetVerticalMiddle()
end

receiveEnterWaiting = function()
  -- function num : 0_30 , upvalues : SelectCharacter, configData
  local isSpecialCharacter = false
  if (SelectCharacter.radioBtn_SpecialCharacterList):IsCheck() == true then
    isSpecialCharacter = true
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  configData.isWaitLine = true
  local characterData = getCharacterDataByIndex(configData.selectCaracterIdx, isSpecialCharacter)
  if characterData == nil then
    (UI.ASSERT)(false, "캐릭�\176 선택�\180 되지 않았�\152...?")
    return 
  end
  ;
  (SelectCharacter.static_ticketNoByRegion):SetFontColor((Defines.Color).C_FFD20000)
  ;
  (SelectCharacter.static_ticketNoByRegion):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NOT_ENTER_TO_FIELD"))
  setShowBlockBG(true)
  local strWaitingMsg = makeEnterWaitingUserMsg(characterData._lastTicketNoByRegion)
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "CHARACTER_ENTER_WAITING_TITLE"), content = strWaitingMsg, functionCancel = click_EnterWaitingCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_1m, enablePriority = true}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

setEnterWaitingUserCount = function()
  -- function num : 0_31 , upvalues : configData
  if configData.isWaitLine == false then
    return 
  end
  local strWaitingMsg = makeEnterWaitingUserMsg(-1)
  setShowBlockBG(true)
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "CHARACTER_ENTER_WAITING_TITLE"), content = strWaitingMsg, functionCancel = click_EnterWaitingCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_1m, enablePriority = true}
  if (MessageBox.doHaveMessageBoxData)(messageboxData.title) == true then
    setCurrentMessageData(messageboxData)
  else
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
end

click_EnterWaitingCancel = function()
  -- function num : 0_32 , upvalues : configData
  setShowBlockBG(false)
  allClearMessageData()
  if configData.isWaitLine == true then
    sendEnterWaitingCancel()
  end
end

HandleClicked_PreOrderAndEvent = function(linkType)
  -- function num : 0_33
  local linkURL = ""
  if linkType == 0 then
    linkURL = "https://www.blackdesertonline.com/preorder/?trcode=CCM001"
  else
    if linkType == 1 then
      linkURL = "https://www.blackdesertonline.com/events/ccm/ShowEvent.html"
    end
  end
  ToClient_OpenChargeWebPage(linkURL, false)
end

HandleClicked_SaveCustomizationFile = function()
  -- function num : 0_34
  OpenExplorerSaveCustomizing()
end

RadioButton_Click = function(radioIndex)
  -- function num : 0_35 , upvalues : CharacterListIndex, SelectCharacter, isChangeCharacterTab, SpecialCharacterListIndex, configData, CharacterList_Update
  if radioIndex == CharacterListIndex then
    if (SelectCharacter.btn_ChangeLocate):GetShow() == true then
      isChangeCharacterTab = false
    else
      isChangeCharacterTab = true
    end
    ;
    (SelectCharacter.radioBtn_CharacterList):SetCheck(true)
    ;
    (SelectCharacter.radioBtn_SpecialCharacterList):SetCheck(false)
    ;
    (SelectCharacter.btn_ChangeLocate):SetShow(true)
  else
    if radioIndex == SpecialCharacterListIndex then
      if (SelectCharacter.btn_ChangeLocate):GetShow() == false then
        isChangeCharacterTab = false
      else
        isChangeCharacterTab = true
      end
      ;
      (SelectCharacter.radioBtn_CharacterList):SetCheck(false)
      ;
      (SelectCharacter.radioBtn_SpecialCharacterList):SetCheck(true)
      ;
      (SelectCharacter.btn_ChangeLocate):SetShow(false)
      if (SelectCharacter.btn_ChangeLocate):IsCheck() then
        (SelectCharacter.btn_ChangeLocate):SetCheck(false)
      end
    end
  end
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  configData.selectCaracterIdx = 0
  -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

  configData._startIndex = 0
  ;
  (SelectCharacter._scroll):SetControlPos(0)
  ;
  (SelectCharacter.static_CharacterInfoBG):SetShow(false)
  ToClient_viewCharacterDelete(isChangeCharacterTab)
  CharacterList_Update(isChangeCharacterTab)
end

HandleClicked_ToggleGhostMode = function()
  -- function num : 0_36 , upvalues : isGhostMode
  ToClient_ToggleGhostMode()
  local GhostButton = (UI.getChildControl)(Panel_CharacterSelectNew, "check_GhostMode")
  isGhostMode = ToClient_getGhostMode()
  if isGhostMode then
    GhostButton:SetText("GhostMode ON")
  else
    GhostButton:SetText("GhostMode OFF")
  end
end

UpdateSpecialCharacterTab = function()
  -- function num : 0_37 , upvalues : SelectCharacter, isSpecialCharacterOpen, configData
  local self = SelectCharacter
  local temporaryWrapper = getTemporaryInformationWrapper()
  temporaryWrapper:ToClient_completeInitialUI()
  if isSpecialCharacterOpen == false then
    return 
  end
  local isPremiumPcRoom = temporaryWrapper:isPremiumPcRoom()
  if isPremiumPcRoom == false then
    return 
  end
  ;
  (SelectCharacter.radioBtn_CharacterList):SetShow(true)
  ;
  (SelectCharacter.radioBtn_CharacterList):SetPosX((SelectCharacter.static_PenelBG):GetPosX() + 5)
  ;
  (SelectCharacter.radioBtn_SpecialCharacterList):SetShow(true)
  ;
  (SelectCharacter.radioBtn_SpecialCharacterList):SetPosX((SelectCharacter.static_PenelBG):GetPosX() + (SelectCharacter.radioBtn_CharacterList):GetSizeX() + 5)
  ;
  (SelectCharacter.radioBtnBG):SetPosX((SelectCharacter.static_PenelBG):GetPosX() + 5)
  ;
  (SelectCharacter.radioBtnBG):SetShow(true)
  -- DECOMPILER ERROR at PC66: Confused about usage of register: R3 in 'UnsetPending'

  SelectCharacter.premiumPcRoomSizeY = (SelectCharacter.radioBtn_CharacterList):GetSizeY()
  ;
  (SelectCharacter._scroll):SetPosY((SelectCharacter._scroll):GetPosY() + SelectCharacter.premiumPcRoomSizeY)
  local scrSizeY = getScreenSizeY()
  local scrSizeSumY = scrSizeY - (SelectCharacter.static_FamilyName):GetSizeY() - (SelectCharacter.btn_EndGame):GetSizeY() - (SelectCharacter.btn_ChangeLocate):GetSizeY() - 25 - self.premiumPcRoomSizeY + 5
  local btnSizeY = (SelectCharacter.btn_Create):GetSizeY() + 15
  local _btnCount = (math.floor)(scrSizeSumY / btnSizeY)
  ;
  (SelectCharacter._scroll):SetSize((SelectCharacter._scroll):GetSizeX(), btnSizeY * _btnCount - self.premiumPcRoomSizeY)
  -- DECOMPILER ERROR at PC120: Confused about usage of register: R7 in 'UnsetPending'

  configData._listCount = _btnCount
  -- DECOMPILER ERROR at PC123: Confused about usage of register: R7 in 'UnsetPending'

  configData.slotUiPool = {}
  for slotIdx = 0, configData._listCount - 1 do
    local slot = {}
    slot._btn_Slot = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_CreateSlot", self.static_PenelBG, "SelectCharacter_EmptySlot_" .. slotIdx)
    slot._ChaStat = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_Character0", slot._btn_Slot, "SelectCharacter_ChaStat_" .. slotIdx)
    slot._ContStat = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_UserCount", slot._btn_Slot, "SelectCharacter_ContStat_" .. slotIdx)
    slot._ChaLev = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_CharLevel", slot._btn_Slot, "SelectCharacter_ChaLev_" .. slotIdx)
    slot._btnCreate = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_CharacterCreate", slot._btn_Slot, "SelectCharacter_btnCreate_" .. slotIdx)
    slot._btnStart = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_Start", slot._btn_Slot, "SelectCharacter_btnStart_" .. slotIdx)
    slot._btnUp = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_Up", slot._btn_Slot, "SelectCharacter_btnUp_" .. slotIdx)
    slot._btnDown = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Button_Down", slot._btn_Slot, "SelectCharacter_btnDown_" .. slotIdx)
    slot._centerBg = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "Static_Center", slot._btn_Slot, "SelectCharacter_CenterIcon_" .. slotIdx)
    slot._possibleStat = (UI.createAndCopyBasePropertyControl)(Panel_CharacterSelectNew, "StaticText_PossibleEnter", slot._btn_Slot, "SelectCharacter_PossibleEnter_" .. slotIdx)
    ;
    (slot._btn_Slot):SetText("")
    ;
    (slot._btn_Slot):SetPosX(12)
    ;
    (slot._btn_Slot):SetPosY((SelectCharacter.static_FamilyName):GetSizeY() + 5 + ((slot._btn_Slot):GetSizeY() + 5) * slotIdx + self.premiumPcRoomSizeY + 5)
    ;
    (slot._ChaStat):SetPosX(300)
    ;
    (slot._ChaStat):SetPosY(15)
    ;
    (slot._ContStat):SetPosX(300)
    ;
    (slot._ContStat):SetPosY(20)
    ;
    (slot._ChaLev):SetPosX(65)
    ;
    (slot._ChaLev):SetPosY(35)
    ;
    (slot._btnCreate):SetPosX(280)
    ;
    (slot._btnCreate):SetPosY(5)
    ;
    (slot._btnStart):SetPosX(280)
    ;
    (slot._btnStart):SetPosY(5)
    ;
    (slot._possibleStat):SetPosX(180)
    ;
    (slot._possibleStat):SetPosY(20)
    ;
    (slot._btn_Slot):SetShow(false)
    ;
    (slot._ChaStat):SetShow(false)
    ;
    (slot._ContStat):SetShow(false)
    ;
    (slot._ChaLev):SetShow(false)
    ;
    (slot._btnCreate):SetShow(false)
    ;
    (slot._btnStart):SetShow(false)
    ;
    (slot._btnUp):SetShow(false)
    ;
    (slot._btnDown):SetShow(false)
    ;
    (slot._centerBg):SetShow(false)
    ;
    (slot._possibleStat):SetShow(false)
    ;
    (slot._btn_Slot):addInputEvent("Mouse_UpScroll", "SelectCharacter_ScrollEvent( true )")
    ;
    (slot._btn_Slot):addInputEvent("Mouse_DownScroll", "SelectCharacter_ScrollEvent( false )")
    ;
    (slot._btnStart):addInputEvent("Mouse_UpScroll", "SelectCharacter_ScrollEvent( true )")
    ;
    (slot._btnStart):addInputEvent("Mouse_DownScroll", "SelectCharacter_ScrollEvent( false )")
    -- DECOMPILER ERROR at PC366: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (configData.slotUiPool)[slotIdx] = slot
  end
  RadioButton_Click(0)
end

SelectCharacter_Init()
registerEvent("EventChangeLobbyStageToCharacterSelect", "CharacterSelect_Open")
registerEvent("FromClient_UpdateSpecialCharacterTab", "UpdateSpecialCharacterTab")
registerEvent("EventCancelEnterWating", "cancelEnterWaitingLine")
registerEvent("EventReceiveEnterWating", "receiveEnterWaiting")
registerEvent("EventSetEnterWating", "setEnterWaitingUserCount")

