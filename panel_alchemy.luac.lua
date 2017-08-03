-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\alchemy\panel_alchemy.luac 

-- params : ...
-- function num : 0
Panel_Alchemy:ActiveMouseEventEffect(true)
Panel_Alchemy:SetShow(false, false)
Panel_Alchemy:setGlassBackground(true)
Panel_Alchemy:RegisterShowEventFunc(true, "AlchemyShowAni()")
Panel_Alchemy:RegisterShowEventFunc(false, "AlchemyHideAni()")
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_AH = CppEnums.PA_UI_ALIGNHORIZON
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
local _slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true}
local RecentCook = {recentCookCount = 10, _listStartPosY = 41, _listPosYGap = 43, _listNumStartPosY = 48, _listNumPosYGap = 43, _listSlotStartPosX = 10, _listSlotPosXGap = 35, _listSlotStartPosY = 45, _listSlotPosYGap = 43, 
_listPool = {}
, 
_itemPool = {}
}
local _cookBG_Back = (UI.getChildControl)(Panel_Alchemy, "Static_Pot_Back")
local _cookBG_Front = (UI.getChildControl)(Panel_Alchemy, "Static_Pot_Front")
local _alchemyBG_Back = (UI.getChildControl)(Panel_Alchemy, "Static_Pot_Back_2")
local _alchemyBG_Front = (UI.getChildControl)(Panel_Alchemy, "Static_Pot_Front_2")
local recentCookClose = (UI.getChildControl)(Panel_RecentCook, "Button_Close")
local recentCookTitle = ((UI.getChildControl)(Panel_RecentCook, "StaticText_Title"))
local _aniSlotParent, _aniItemSlot = nil, nil
local SLOT_START_POSX = 81
local SLOT_START_POSY = 378
local SLOT_GAP_POSX = 10
local _slotCount = 5
local _slotItemKey = {}
local _slotList = {}
for index = 0, _slotCount - 1 do
  local createdSlot = {}
  ;
  (SlotItem.new)(createdSlot, "ItemIconSlot" .. index, 0, Panel_Alchemy, _slotConfig)
  createdSlot:createChild()
  ;
  (createdSlot.icon):addInputEvent("Mouse_RUp", "Alchemy_MaterialSlot_Mouse_RUp(" .. index .. ")")
  ;
  (createdSlot.icon):addInputEvent("Mouse_On", "Alchemy_Tooltip_Item_Show(" .. index .. ")")
  ;
  (createdSlot.icon):addInputEvent("Mouse_Out", "Alchemy_Tooltip_Item_Hide(" .. index .. ")")
  ;
  (createdSlot.icon):SetIgnore(false)
  local posX = SLOT_START_POSX + index * (createdSlot.icon):GetSizeX() + index * SLOT_GAP_POSX
  local posY = SLOT_START_POSY
  ;
  (createdSlot.icon):SetPosX(posX)
  ;
  (createdSlot.icon):SetPosY(posY)
  if index < 8 then
    posX = SLOT_START_POSX + index * (createdSlot.icon):GetSizeX() + index * SLOT_GAP_POSX
    posY = SLOT_START_POSY
  else
    posX = SLOT_START_POSX + (index - 8) * (createdSlot.icon):GetSizeX() + index * SLOT_GAP_POSX
    posY = SLOT_START_POSY + (createdSlot.icon):GetSizeY()
  end
  _slotList[index] = createdSlot
end
local _uiButtonStartAlchemy = (UI.getChildControl)(Panel_Alchemy, "Button_StartAlchemy")
_uiButtonStartAlchemy:addInputEvent("Mouse_LUp", "Alchemy_Start()")
local _uiButtonMassProduction = (UI.getChildControl)(Panel_Alchemy, "Button_MassProduction")
_uiButtonMassProduction:addInputEvent("Mouse_LUp", "Alchemy_MassProductionMSG()")
local _uiButtonClose = (UI.getChildControl)(Panel_Alchemy, "Button_Close")
_uiButtonClose:addInputEvent("Mouse_LUp", "Alchemy_Close()")
local _buttonQuestion = (UI.getChildControl)(Panel_Alchemy, "Button_Question")
_buttonQuestion:SetShow(false)
local _uiWindowTitle = (UI.getChildControl)(Panel_Alchemy, "StaticText_Title")
local _uiCircleName = (UI.getChildControl)(Panel_Alchemy, "StaticText_CircleName")
local _uiAlchemyIcon = (UI.getChildControl)(Panel_Alchemy, "Static_AlchemyIcon")
local _frameAlchemy = (UI.getChildControl)(Panel_Alchemy, "Frame_Alchemy")
local _frameContent = (UI.getChildControl)(_frameAlchemy, "Frame_1_Content")
local _uiAlchemyDesc = (UI.getChildControl)(_frameContent, "StaticText_AlchemyDesc")
local list2 = (UI.getChildControl)(Panel_Alchemy, "List2_AlchemyRecipe")
local _uiNotice1 = (UI.getChildControl)(Panel_Alchemy, "Static_description1")
local _frameAlchemyDesc = (UI.getChildControl)(Panel_Alchemy, "Frame_AlchemyDesc")
local _frameDescContent = (UI.getChildControl)(_frameAlchemyDesc, "Frame_1_Content")
local _alchemyDesc = (UI.getChildControl)(_frameDescContent, "StaticText_AlchemyDesc")
local _scroll = (UI.getChildControl)(_frameAlchemyDesc, "VerticalScroll")
local _scrollCtrlBtn = (UI.getChildControl)(_scroll, "VerticalScroll_CtrlButton")
local _scrollIndex = 0
local _scrollSizeY = 0
local _scrollBGSizeY = 0
local KNOWLEDGE_TEXT_COUNT = 13
local _uiListText = {}
local COOK_MENTALTHEMEKEY = 30010
local COOK_NORMAL_MENTALTHEMEKEY = 28001
local COOK_SPECIAL_MENTALTHEMEKEY = 28002
local AlCHEMY_MENTALTHEMEKEY = 31000
local _currentMentalKey = 0
local _startKnowledgeIndex = 0
local prevSelectIndex = -1
local selectIndex = -1
AlchemyShowAni = function()
  -- function num : 0_0 , upvalues : IM, _aniSlotParent, UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Alchemy)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
  FGlobal_SetNumberPadUiModeNotInput(true)
  _aniSlotParent:AddEffect("fUI_AlchemyCook01", true, 0, 0)
  local aniInfo1 = Panel_Alchemy:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Alchemy:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Alchemy:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Alchemy:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Alchemy:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Alchemy:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

AlchemyHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color, IM, _aniSlotParent
  Panel_Alchemy:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Alchemy:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  FGlobal_SetNumberPadUiModeNotInput(false)
  _aniSlotParent:EraseAllEffect()
end

AlchemyItemSlotAni = function()
  -- function num : 0_2 , upvalues : _aniItemSlot, UI_ANI_ADV, UI_AH
  local posX = 80
  local posY = -100
  local timeRate = 1
  audioPostEvent_SystemUi(12, 12)
  local aniCtrl = _aniItemSlot.icon
  aniCtrl:SetShow(true)
  aniCtrl:AddEffect("fUI_AlchemySplash01", false, 0, 0)
  local aniInfo = aniCtrl:addMoveAnimation(0 * timeRate, 1.5 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo:SetStartPosition(posX, posY)
  aniInfo:SetEndPosition(posX, posY + 180)
  local aniInfo2 = aniCtrl:addRotateAnimation(0 * timeRate, 1.5 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo2:SetStartRotate(0)
  aniInfo2:SetEndRotate(1)
  aniInfo2:SetRotateCount(1)
end

Alchemy_Show = function(_isCook)
  -- function num : 0_3 , upvalues : _startKnowledgeIndex, _currentMentalKey, _uiAlchemyDesc, UI_TM, _buttonQuestion, _frameContent
  if Panel_Alchemy:GetShow() then
    return 
  end
  Inventory_SetFunctor(Alchemy_InvenFilter, Alchemy_PushItemFromInventory, Alchemy_Close, nil)
  _startKnowledgeIndex = 0
  RequestAlchemy_clear()
  Alchemy_UpdateSlot()
  ReconstructionAlchemyKnowledge(_currentMentalKey)
  Alchemy_UpdateKnowledge()
  Panel_Alchemy:SetShow(true, true)
  if getScreenSizeX() / 2 < Panel_Window_Inventory:GetSizeX() + Panel_Alchemy:GetSizeX() / 2 then
    Panel_Alchemy:SetPosX(getScreenSizeX() - Panel_Window_Inventory:GetSizeX() - Panel_Alchemy:GetSizeX() + 20)
  end
  FGlobal_SetInventoryDragNoUse(Panel_Alchemy)
  _uiAlchemyDesc:SetAutoResize(true)
  _uiAlchemyDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  if _isCook == true then
    _uiAlchemyDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_WANTMORE_SELECT_COOKKNOWLEDGE"))
    _buttonQuestion:SetShow(true)
    _buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelCook\" )")
    _buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelCook\", \"true\")")
    _buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelCook\", \"false\")")
    audioPostEvent_SystemUi(12, 11)
  else
    _uiAlchemyDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_WANTMORE_SELECT_ALCHEMYKNOWLEDGE"))
    _buttonQuestion:SetShow(true)
    _buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelAlchemy\" )")
    _buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelAlchemy\", \"true\")")
    _buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelAlchemy\", \"false\")")
    audioPostEvent_SystemUi(12, 11)
  end
  RecnetCookSlotClear()
  _frameContent:SetSize(_frameContent:GetSizeX(), _uiAlchemyDesc:GetSizeY())
end

Alchemy_InvenFilter = function(slotNo, itemWrapper)
  -- function num : 0_4
  local isVested = (itemWrapper:get()):isVested()
  local isPersonalTrade = (itemWrapper:getStaticStatus()):isPersonalTrade()
  if isVested then
    local isFilter = not isUsePcExchangeInLocalizingValue() or isPersonalTrade
  end
  if isFilter then
    return isFilter
  end
end

Alchemy_Close = function()
  -- function num : 0_5 , upvalues : _slotCount, _slotList, list2, selectIndex, _scrollCtrlBtn
  do
    if Panel_Alchemy:IsShow() then
      local slotCount = RequestAlchemy_getSlotCount()
      for index = 0, _slotCount - 1 do
        ((_slotList[index]).icon):SetShow(false)
      end
      Panel_Alchemy:SetShow(false, true)
      Panel_Window_Inventory:SetShow(false, true)
      RecentCookClose()
    end
    ;
    (list2:getElementManager()):clearKey()
    selectIndex = -1
    _scrollCtrlBtn:SetPosY(0)
  end
end

Alchemy_PushItemFromInventory = function(slotNo, itemWrapper, count)
  -- function num : 0_6
  if checkAlchemyAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NOT_CHANGE"))
    return 
  end
  Panel_NumberPad_Show(true, count, slotNo, Alchemy_NumberPad_ConfirmBtn)
end

Alchemy_NumberPad_ConfirmBtn = function(inputNumber, slotNo)
  -- function num : 0_7 , upvalues : _slotCount, _aniItemSlot
  local count = RequestAlchemy_getSlotCount()
  if _slotCount <= count then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_CANT_ADD_ITEM"))
    return 
  end
  local itemWrapper = getInventoryItem(slotNo)
  if itemWrapper ~= nil and _aniItemSlot ~= nil then
    _aniItemSlot:setItemByStaticStatus(itemWrapper:getStaticStatus(), inputNumber)
    AlchemyItemSlotAni()
  end
  RequestAlchemy_PushItemFromInventory(slotNo, inputNumber)
  Alchemy_UpdateSlot()
end

registerEvent("Event_AlchemyResultList", "ResponseAlchemyResultList")
registerEvent("ResponseShowAlchemy", "ResponseShowAlchemy")
registerEvent("ResponseAlchemy_updateSlots", "ResponseAlchemy_updateSlots")
registerEvent("FromClient_AlchemyFail", "FromClient_AlchemyFail")
registerEvent("FromClient_UpdateAlchemyRecord", "FromClient_UpdateAlchemyRecord")
FromClient_UpdateAlchemyRecord = function(mentalcardKey)
  -- function num : 0_8
  RecentCookUpdate(mentalcardKey)
end

ResponseAlchemy_updateSlots = function()
  -- function num : 0_9
  Alchemy_UpdateSlot()
  Alchemy_UpdateKnowledge()
end

Alchemy_UpdateSlot = function()
  -- function num : 0_10 , upvalues : _slotItemKey, _slotCount, _slotList
  local slotCount = RequestAlchemy_getSlotCount()
  _slotItemKey = {}
  for index = 0, _slotCount - 1 do
    if index < slotCount then
      local itemStatic = RequestAlchemy_getSlotAt(index)
      local itemKey = (itemStatic:get())._key
      local itemCount = RequestAlchemy_getSlotItemCount_s64(index)
      ;
      (_slotList[index]):setItemByStaticStatus(itemStatic, itemCount)
      ;
      ((_slotList[index]).icon):SetShow(true)
      -- DECOMPILER ERROR at PC33: Confused about usage of register: R8 in 'UnsetPending'

      _slotItemKey[index] = itemKey
    else
      do
        do
          ;
          ((_slotList[index]).icon):SetShow(false)
          -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC41: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

Alchemy_UpdateKnowledge = function()
  -- function num : 0_11 , upvalues : _startKnowledgeIndex, list2
  local count = getCountAlchemyKnowledge()
  for index = _startKnowledgeIndex, count - 1 do
    local mentalCardStaticWrapper = getAlchemyKnowledge(index)
    if mentalCardStaticWrapper ~= nil then
      (list2:getElementManager()):pushKey(toInt64(0, index))
    end
  end
end

AlchemyList_SelectKnowledge = function(index)
  -- function num : 0_12 , upvalues : _startKnowledgeIndex, _uiAlchemyDesc, _uiAlchemyIcon, _frameContent, UI_TM, selectIndex, list2
  local knowledgeIndex = _startKnowledgeIndex + index
  local mentalCardStaticWrapper = getAlchemyKnowledge(knowledgeIndex)
  do
    if mentalCardStaticWrapper ~= nil then
      local isLearn = isLearnMentalCardForAlchemy(mentalCardStaticWrapper:getKey())
      if isLearn == true then
        _uiAlchemyDesc:SetText(mentalCardStaticWrapper:getDesc())
        _uiAlchemyIcon:ChangeTextureInfoName(mentalCardStaticWrapper:getImagePath())
        _frameContent:SetSize(_frameContent:GetSizeX(), _uiAlchemyDesc:GetSizeY())
        alchemy_RequestRecord(knowledgeIndex)
        Panel_RecentCook:SetShow(true)
        Panel_RecentCook:SetPosX(Panel_Alchemy:GetSizeX() + Panel_Alchemy:GetPosX() - 25)
        Panel_RecentCook:SetPosY(Panel_Alchemy:GetPosY() + 25)
        Panel_RecentCook:ComputePos()
        RecnetCookSlotClear()
      else
        _uiAlchemyDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
        _uiAlchemyDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_THISKNOWLEDGE_NOT_YET"))
        _uiAlchemyIcon:ChangeTextureInfoName("UI_Artwork/Unkown_Intelligence.dds")
        _frameContent:SetSize(_frameContent:GetSizeX(), _uiAlchemyDesc:GetSizeY())
        Panel_RecentCook:SetShow(false)
        RecnetCookSlotClear()
      end
    end
    local prevSelectIndex = selectIndex
    selectIndex = index
    list2:requestUpdateByKey(toInt64(0, index))
    list2:requestUpdateByKey(toInt64(0, prevSelectIndex))
  end
end

Alchemy_MaterialSlot_Mouse_RUp = function(index)
  -- function num : 0_13
  RequestAlchemy_PopMaterial(index)
  Alchemy_UpdateSlot()
  Panel_Tooltip_Item_hideTooltip()
end

local _isCook = false
ResponseShowAlchemy = function(isCook, usingInstallationType)
  -- function num : 0_14 , upvalues : _isCook, _aniItemSlot, _cookBG_Back, _cookBG_Front, _alchemyBG_Back, _alchemyBG_Front, _aniSlotParent, recentCookTitle, _uiButtonStartAlchemy, _currentMentalKey, AlCHEMY_MENTALTHEMEKEY, COOK_MENTALTHEMEKEY, _slotConfig
  _isCook = isCook
  if _aniItemSlot ~= nil then
    _aniItemSlot:destroyChild()
    _aniItemSlot = nil
  end
  _cookBG_Back:SetShow(false)
  _cookBG_Front:SetShow(false)
  _alchemyBG_Back:SetShow(false)
  _alchemyBG_Front:SetShow(false)
  if _isCook == false then
    _aniItemSlot = {}
    _aniSlotParent = _alchemyBG_Back
    _alchemyBG_Back:SetShow(true)
    _alchemyBG_Front:SetShow(true)
    recentCookTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_RECENTALCHEMYTITLE"))
    ;
    ((UI.getChildControl)(Panel_Alchemy, "StaticText_Title")):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_ALCHEMY"))
    _uiButtonStartAlchemy:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_REFINING"))
    _currentMentalKey = AlCHEMY_MENTALTHEMEKEY
  else
    _aniItemSlot = {}
    _aniSlotParent = _cookBG_Back
    _cookBG_Back:SetShow(true)
    _cookBG_Front:SetShow(true)
    recentCookTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_RECENTCOOKTITLE"))
    ;
    ((UI.getChildControl)(Panel_Alchemy, "StaticText_Title")):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_COOKING"))
    _uiButtonStartAlchemy:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_COOK"))
    _currentMentalKey = COOK_MENTALTHEMEKEY
  end
  ;
  (SlotItem.new)(_aniItemSlot, "AniItemSlot1", 0, _aniSlotParent, _slotConfig)
  _aniItemSlot:createChild()
  ;
  (_aniItemSlot.icon):SetShow(false)
  InventoryWindow_Show()
  Alchemy_Show(_isCook)
end

ResponseAlchemyResultList = function(itemDynamicListWrapper)
  -- function num : 0_15
  local size = itemDynamicListWrapper:getSize()
  for index = 0, size - 1 do
    local itemDynamicInformationWrapper = itemDynamicListWrapper:getElement(index)
    local ItemEnchantStaticStatusWrapper = itemDynamicInformationWrapper:getStaticStatus()
    local s64_stackCount = itemDynamicInformationWrapper:getCount_s64()
  end
end

FromClient_AlchemyFail = function(hint, alchemyType, strErr, bShowMessageBox)
  -- function num : 0_16 , upvalues : IM
  if hint == 1 then
    local msg = {main = PAGetString(Defines.StringSheet_GAME, "ALCHEMYFAIL_REASON_1"), sub = ""}
    if alchemyType == 0 then
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 27)
    else
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 26)
    end
  else
    do
      if hint == 2 then
        local msg = {main = PAGetString(Defines.StringSheet_GAME, "ALCHEMYFAIL_REASON_2"), sub = ""}
        if alchemyType == 0 then
          Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 27)
        else
          Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 26)
        end
      else
        do
          if hint == 3 then
            local msg = {main = PAGetString(Defines.StringSheet_GAME, "ALCHEMYFAIL_REASON_3"), sub = ""}
            if alchemyType == 0 then
              Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 27)
            else
              Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 26)
            end
          else
            do
              if hint == 4 then
                Proc_ShowMessage_Ack(strErr)
                MassProduction_Cancel()
                return 
              else
                Proc_ShowMessage_Ack(strErr)
                bShowMessageBox = false
              end
              if bShowMessageBox then
                local failMsg = ""
                if alchemyType == 0 then
                  failMsg = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_ALCHEMY")
                else
                  if alchemyType == 1 then
                    failMsg = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_COOKING")
                  end
                end
                local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_FAIL_MEMO", "failMsg", failMsg)
                local messageBoxData = {title = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_FAIL_TITLE", "failMsg", failMsg), content = messageBoxMemo, functionYes = MassProduction_Continue, functionNo = MassProduction_Cancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                ;
                (MessageBox.showMessageBox)(messageBoxData)
              end
              do
                ;
                (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
              end
            end
          end
        end
      end
    end
  end
end

MassProduction_Continue = function()
  -- function num : 0_17 , upvalues : _isCook, IM
  local s64_doAlchemyCount = ToClient_GetDoingAlchemyCount()
  RequestAlchemy_AlchemyStart(_isCook, s64_doAlchemyCount)
  if getSelfPlayer() == nil then
    _PA_ASSERT(false, "selfplayer�\128 없습니다. 비정상입니다")
    return 
  end
  local tempTime = alchemy_AlchemyTime(_isCook) / 1000
  if tempTime == 0 then
    return 
  end
  if _isCook then
    EventProgressBarShow(true, tempTime, 7)
    audioPostEvent_SystemUi(1, 0)
  else
    EventProgressBarShow(true, tempTime, 9)
    audioPostEvent_SystemUi(1, 0)
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
end

MassProduction_Cancel = function()
  -- function num : 0_18 , upvalues : IM
  ToClient_CancelAlchemy()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

Alchemy_Start = function()
  -- function num : 0_19 , upvalues : _isCook
  local slotCount = RequestAlchemy_getSlotCount()
  if slotCount <= 0 then
    return 
  end
  if getSelfPlayer() == nil then
    _PA_ASSERT(false, "selfplayer�\128 없습니다. 비정상입니다")
    return 
  end
  RequestAlchemy_AlchemyStart(_isCook, (Defines.s64_const).s64_1)
  local tempTime = alchemy_AlchemyTime(_isCook) / 1000
  if tempTime == 0 then
    return 
  end
  if _isCook then
    EventProgressBarShow(true, tempTime, 7)
    audioPostEvent_SystemUi(1, 0)
  else
    EventProgressBarShow(true, tempTime, 9)
    audioPostEvent_SystemUi(1, 0)
  end
  InventoryWindow_Close()
end

Alchemy_MassProductionMSG = function()
  -- function num : 0_20 , upvalues : _isCook
  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  if _isCook then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_COOK_SEQUENCE_MSG")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_ALCHEMY_SEQUENCE_MSG")
  end
  local messageBoxData = {title = messageTitle, content = messageBoxMemo, functionYes = Alchemy_MassProduction, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData, "middle")
end

local s64_maxCount = (Defines.s64_const).s64_0
Alchemy_MassProduction = function()
  -- function num : 0_21 , upvalues : s64_maxCount
  local slotCount = RequestAlchemy_getSlotCount()
  if slotCount <= 0 then
    return 
  end
  s64_maxCount = RequestAlchemy_getAlchemyDoMaxCount()
  local s64_2 = toInt64(0, 2)
  if s64_maxCount < (Defines.s64_const).s64_1 then
    return 
  else
    if s64_maxCount < s64_2 then
      Alchemy_Start()
      return 
    end
  end
  Panel_NumberPad_Show(true, s64_maxCount, nil, Alchemy_MassProductionNumberPad_ConfirmBtn)
end

Alchemy_MassProductionNumberPad_ConfirmBtn = function(inputNumber)
  -- function num : 0_22 , upvalues : s64_maxCount, _isCook
  if s64_maxCount < inputNumber then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_STREAMMAKECANTCOUNT"))
    return 
  end
  local s64_2 = toInt64(0, 2)
  if inputNumber < (Defines.s64_const).s64_1 then
    return 
  else
    if inputNumber < s64_2 then
      Alchemy_Start()
      return 
    else
      RequestAlchemy_AlchemyStart(_isCook, inputNumber)
      if getSelfPlayer() == nil then
        _PA_ASSERT(false, "selfplayer�\128 없습니다. 비정상입니다")
        return 
      end
      local tempTime = alchemy_AlchemyTime(_isCook) / 1000
      if tempTime == 0 then
        return 
      end
      if _isCook then
        EventProgressBarShow(true, tempTime, 7)
        audioPostEvent_SystemUi(1, 0)
      else
        EventProgressBarShow(true, tempTime, 9)
        audioPostEvent_SystemUi(1, 0)
      end
      InventoryWindow_Close()
    end
  end
end

Alchemy_Do = function()
  -- function num : 0_23
  if checkAlchemyAction() == false then
    return 
  end
  RequestAlchemy_AlchemyDo()
end

AlchemyKnowledge_ClearList = function()
  -- function num : 0_24 , upvalues : KNOWLEDGE_TEXT_COUNT, _uiListText, _uiAlchemyIcon, _isCook, _uiAlchemyDesc, _frameContent
  for index = 0, KNOWLEDGE_TEXT_COUNT - 1 do
    (_uiListText[index]):SetText("")
    ;
    (_uiListText[index]):SetShow(false)
  end
  _uiAlchemyIcon:ReleaseTexture()
  _uiAlchemyIcon:SetShow(true)
  if _isCook then
    _uiAlchemyDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_WANTMORE_SELECT_COOKKNOWLEDGE"))
  else
    _uiAlchemyDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_WANTMORE_SELECT_ALCHEMYKNOWLEDGE"))
  end
  _frameContent:SetSize(_frameContent:GetSizeX(), _uiAlchemyDesc:GetSizeY())
  _uiAlchemyDesc:SetShow(true)
end

local _tooltip_Index = nil
Alchemy_Tooltip_Item_Show = function(index)
  -- function num : 0_25 , upvalues : _tooltip_Index, _slotItemKey, _slotList
  _tooltip_Index = index
  local itemKey = _slotItemKey[index]
  if itemKey == nil then
    return 
  end
  local staticStatusWrapper = getItemEnchantStaticStatus(itemKey)
  local uiBase = (_slotList[index]).icon
  Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
end

Alchemy_Tooltip_Item_Hide = function(index)
  -- function num : 0_26 , upvalues : _tooltip_Index
  if _tooltip_Index ~= index then
    return 
  end
  _tooltip_Index = nil
  Panel_Tooltip_Item_hideTooltip()
end

local _slotIconList = {}
RecentCookInit = function()
  -- function num : 0_27 , upvalues : RecentCook, _slotConfig, _alchemyDesc, _scrollBGSizeY, _uiNotice1, _scrollSizeY, _frameAlchemyDesc, _scroll, _frameDescContent
  local self = RecentCook
  for listIdx = 0, self.recentCookCount - 1 do
    local recentCookList = {}
    recentCookList.cookBG = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "Static_CookRecipeBG", Panel_RecentCook, "RecentCookListBG_" .. listIdx)
    ;
    (recentCookList.cookBG):SetPosX(12)
    ;
    (recentCookList.cookBG):SetPosY(self._listStartPosY + self._listPosYGap * listIdx)
    recentCookList.cookNum = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "StaticText_RecentCookNum", Panel_RecentCook, "RecentCookNum_" .. listIdx)
    ;
    (recentCookList.cookNum):SetPosX(10)
    ;
    (recentCookList.cookNum):SetText(listIdx + 1)
    ;
    (recentCookList.cookNum):SetPosY(self._listNumStartPosY + self._listNumPosYGap * listIdx)
    recentCookList[0] = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "Static_IconSlot1", Panel_RecentCook, "RecentCookSlot1_" .. listIdx)
    ;
    (recentCookList[0]):SetPosX(35)
    ;
    (recentCookList[0]):SetPosY(self._listSlotStartPosY + self._listSlotPosYGap * listIdx)
    recentCookList[1] = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "Static_IconSlot2", Panel_RecentCook, "RecentCookSlot2_" .. listIdx)
    ;
    (recentCookList[1]):SetPosX(75)
    ;
    (recentCookList[1]):SetPosY(self._listSlotStartPosY + self._listSlotPosYGap * listIdx)
    recentCookList[2] = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "Static_IconSlot2", Panel_RecentCook, "RecentCookSlot3_" .. listIdx)
    ;
    (recentCookList[2]):SetPosX(115)
    ;
    (recentCookList[2]):SetPosY(self._listSlotStartPosY + self._listSlotPosYGap * listIdx)
    recentCookList[3] = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "Static_IconSlot2", Panel_RecentCook, "RecentCookSlot4_" .. listIdx)
    ;
    (recentCookList[3]):SetPosX(155)
    ;
    (recentCookList[3]):SetPosY(self._listSlotStartPosY + self._listSlotPosYGap * listIdx)
    recentCookList[4] = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "Static_IconSlot2", Panel_RecentCook, "RecentCookSlot5_" .. listIdx)
    ;
    (recentCookList[4]):SetPosX(195)
    ;
    (recentCookList[4]):SetPosY(self._listSlotStartPosY + self._listSlotPosYGap * listIdx)
    recentCookList.item = {}
    for idx = 0, 4 do
      local recentSlot = {}
      ;
      (SlotItem.new)(recentSlot, "IconSlot_" .. listIdx .. "_" .. idx, listIdx, recentCookList[idx], _slotConfig)
      recentSlot:createChild()
      ;
      (recentSlot.icon):SetPosX(0)
      ;
      (recentSlot.icon):SetPosY(0)
      ;
      (recentSlot.icon):SetSize(32, 32)
      ;
      (recentSlot.count):SetHorizonRight()
      ;
      (recentSlot.count):SetVerticalBottom()
      ;
      (recentSlot.count):SetSpanSize(5, 2)
      ;
      (recentSlot.border):SetSize(32, 32)
      -- DECOMPILER ERROR at PC209: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (recentCookList.item)[idx] = recentSlot
    end
    recentCookList.cookSetupBtn = (UI.createAndCopyBasePropertyControl)(Panel_RecentCook, "Button_Setup", Panel_RecentCook, "RecentCookSetup_" .. listIdx)
    ;
    (recentCookList.cookSetupBtn):SetPosX(250)
    ;
    (recentCookList.cookSetupBtn):SetPosY(self._listNumStartPosY + self._listNumPosYGap * listIdx)
    -- DECOMPILER ERROR at PC233: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._listPool)[listIdx] = recentCookList
  end
  local beforeSizeY = _alchemyDesc:GetSizeY()
  _alchemyDesc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  _alchemyDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "ALCHEMY_COOK_TEXT_DESCRPITION"))
  _scrollBGSizeY = _uiNotice1:GetSizeY()
  _scrollSizeY = _alchemyDesc:GetTextSizeY()
  if _scrollBGSizeY < _scrollSizeY then
    local sizeY1 = _scrollSizeY % 21
    local sizeY2 = _scrollSizeY % 20
    if sizeY1 == 0 then
      _frameAlchemyDesc:SetSize(_frameAlchemyDesc:GetSizeX(), _frameAlchemyDesc:GetSizeY() - 6)
    else
      if sizeY2 == 0 then
        _frameAlchemyDesc:SetSize(_frameAlchemyDesc:GetSizeX(), _frameAlchemyDesc:GetSizeY() - 8)
      else
        _frameAlchemyDesc:SetSize(_frameAlchemyDesc:GetSizeX(), _frameAlchemyDesc:GetSizeY() - 6)
      end
    end
    _scroll:SetShow(true)
  else
    do
      _scroll:SetShow(false)
      do
        local sizeY = (_scrollBGSizeY - _scrollSizeY) / 2
        _frameAlchemyDesc:SetPosY(_frameAlchemyDesc:GetPosY() + sizeY)
        _frameDescContent:SetSize(_frameDescContent:GetSizeX(), _alchemyDesc:GetTextSizeY())
        _uiNotice1:SetShow(true)
      end
    end
  end
end

RecnetCookSlotClear = function()
  -- function num : 0_28 , upvalues : RecentCook
  local self = RecentCook
  for listIdx = 0, self.recentCookCount - 1 do
    local list = (self._listPool)[listIdx]
    ;
    (list.cookBG):SetShow(false)
    ;
    (list.cookNum):SetShow(false)
    ;
    (list.cookSetupBtn):SetShow(false)
    ;
    ((list.item)[0]):clearItem()
    ;
    ((list.item)[1]):clearItem()
    ;
    ((list.item)[2]):clearItem()
    ;
    ((list.item)[3]):clearItem()
    ;
    ((list.item)[4]):clearItem()
  end
end

RecentCookUpdate = function(mentalcardKey)
  -- function num : 0_29 , upvalues : RecentCook
  local self = RecentCook
  for listIdx = 0, self.recentCookCount - 1 do
    local list = (self._listPool)[listIdx]
    ;
    (list.cookBG):SetShow(false)
    ;
    (list.cookNum):SetShow(false)
    ;
    (list.cookSetupBtn):SetShow(false)
    ;
    ((list.item)[0]):clearItem()
    ;
    ((list.item)[1]):clearItem()
    ;
    ((list.item)[2]):clearItem()
    ;
    ((list.item)[3]):clearItem()
    ;
    ((list.item)[4]):clearItem()
    ;
    (((list.item)[0]).icon):SetIgnore(true)
    ;
    (((list.item)[1]).icon):SetIgnore(true)
    ;
    (((list.item)[2]).icon):SetIgnore(true)
    ;
    (((list.item)[3]).icon):SetIgnore(true)
    ;
    (((list.item)[4]).icon):SetIgnore(true)
  end
  local recentCookRecipeCount = alchemy_RecordCount()
  if recentCookRecipeCount > 0 then
    for index = 0, recentCookRecipeCount - 1 do
      local AlchemyRecordWrapper = alchemy_GetRecord(index)
      local materialCount = AlchemyRecordWrapper:getMaterialCount()
      local list = (self._listPool)[index]
      if AlchemyRecordWrapper ~= nil and materialCount > 0 then
        for itemIndex = 0, materialCount - 1 do
          local itemStaticWrapper = AlchemyRecordWrapper:getItemStaticStatusWrapper(itemIndex)
          local itemCount = AlchemyRecordWrapper:getItemCount(itemIndex)
          ;
          ((list.item)[itemIndex]):setItemByStaticStatus(itemStaticWrapper, itemCount)
          ;
          (((self._listPool)[index]).cookBG):SetShow(true)
          ;
          (((self._listPool)[index]).cookNum):SetShow(true)
          ;
          (((self._listPool)[index]).cookSetupBtn):SetShow(true)
          ;
          (((self._listPool)[index]).cookSetupBtn):addInputEvent("Mouse_LUp", "RecentCookSetup(" .. index .. ")")
          ;
          (((list.item)[itemIndex]).icon):SetIgnore(false)
          ;
          (((list.item)[itemIndex]).icon):addInputEvent("Mouse_On", "RecentCookItemToolTipShow(" .. itemIndex .. ", " .. index .. ")")
          ;
          (((list.item)[itemIndex]).icon):addInputEvent("Mouse_Out", "RecentCookItemToolTipHide()")
        end
      end
    end
  end
end

RecentCookSetup = function(recipeCountIndex)
  -- function num : 0_30 , upvalues : RecentCook, _slotList
  local self = RecentCook
  local slotCount = RequestAlchemy_getSlotCount()
  local resetSlot = function()
    -- function num : 0_30_0 , upvalues : slotCount, _slotList
    for index = slotCount - 1, 0, -1 do
      ((_slotList[index]).icon):SetShow(false)
      RequestAlchemy_PopMaterial(index)
    end
    Alchemy_UpdateSlot()
    RequestAlchemy_clear()
  end

  resetSlot()
  local selfProxy = (getSelfPlayer()):get()
  local inventory = selfProxy:getInventory()
  local AlchemyRecordWrapper = alchemy_GetRecord(recipeCountIndex)
  local materialCount = AlchemyRecordWrapper:getMaterialCount()
  local isProcessingCheck = true
  if AlchemyRecordWrapper ~= nil and materialCount > 0 then
    for itemIndex = 0, materialCount - 1 do
      local itemStaticWrapper = AlchemyRecordWrapper:getItemStaticStatusWrapper(itemIndex)
      local itemKey = ((itemStaticWrapper:get())._key):getItemKey()
      local itemCount = AlchemyRecordWrapper:getItemCount(itemIndex)
      local hasItem = inventory:getItemCount_s64(ItemEnchantKey(itemKey, 0))
      local isMaterialCheck = false
      if FGlobal_RecentCookItemCheck(itemKey, itemCount) == nil then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NO_MATERIAL"))
        resetSlot()
      else
        if hasItem < itemCount then
          resetSlot()
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NO_MATERIAL_COUNT"))
        else
          isMaterialCheck = true
        end
      end
      if isProcessingCheck then
        isProcessingCheck = isMaterialCheck
      end
    end
    if isProcessingCheck then
      for itemIndex = 0, materialCount - 1 do
        local itemStaticWrapper = AlchemyRecordWrapper:getItemStaticStatusWrapper(itemIndex)
        local itemKey = ((itemStaticWrapper:get())._key):getItemKey()
        local itemCount = AlchemyRecordWrapper:getItemCount(itemIndex)
        ;
        (_slotList[itemIndex]):setItemByStaticStatus(itemStaticWrapper, itemCount)
        ;
        ((_slotList[itemIndex]).icon):SetShow(true)
        if FGlobal_RecentCookItemCheck(itemKey, itemCount) ~= nil then
          RequestAlchemy_PushItemFromInventory(FGlobal_RecentCookItemCheck(itemKey, itemCount), itemCount)
          Alchemy_UpdateSlot()
        end
      end
    end
  end
end

RecentCookItemToolTipShow = function(itemIndex, index)
  -- function num : 0_31 , upvalues : RecentCook
  local self = RecentCook
  local AlchemyRecordWrapper = alchemy_GetRecord(index)
  local list = (self._listPool)[index]
  local itemStaticWrapper = AlchemyRecordWrapper:getItemStaticStatusWrapper(itemIndex)
  if itemStaticWrapper ~= nil or itemStaticWrapper ~= "" then
    Panel_Tooltip_Item_Show(itemStaticWrapper, ((list.item)[itemIndex]).icon, true, false, nil)
  end
end

RecentCookItemToolTipHide = function()
  -- function num : 0_32
  Panel_Tooltip_Item_hideTooltip()
end

RecentCookClose = function()
  -- function num : 0_33
  Panel_RecentCook:SetShow(false)
  Panel_Tooltip_Item_hideTooltip()
end

RecentCook_registEventHandler = function()
  -- function num : 0_34 , upvalues : recentCookClose
  recentCookClose:addInputEvent("Mouse_LUp", "RecentCookClose()")
end

Alchemy_ListControlCreate = function(content, key)
  -- function num : 0_35 , upvalues : selectIndex, UI_color
  local index = Int64toInt32(key)
  local recipe = (UI.getChildControl)(content, "StaticText_List2_AlchemyRecipe")
  local selectList = (UI.getChildControl)(content, "Static_List2_SelectList")
  local mentalCardStaticWrapper = getAlchemyKnowledge(index)
  if selectIndex == index then
    selectList:SetShow(true)
  else
    selectList:SetShow(false)
  end
  if mentalCardStaticWrapper ~= nil then
    local isLearn = isLearnMentalCardForAlchemy(mentalCardStaticWrapper:getKey())
    if isLearn == true then
      recipe:SetFontColor(UI_color.C_FF84FFF5)
      recipe:SetText(mentalCardStaticWrapper:getName())
    else
      recipe:SetFontColor(UI_color.C_FF888888)
      recipe:SetText("??? ( " .. mentalCardStaticWrapper:getKeyword() .. " )")
    end
    recipe:SetShow(true)
    recipe:SetPosY(6)
    recipe:addInputEvent("Mouse_LUp", "AlchemyList_SelectKnowledge( " .. index .. " )")
  else
    do
      recipe:SetShow(false)
    end
  end
end

RecentCook_registMessageHandler = function()
  -- function num : 0_36 , upvalues : list2
  list2:changeAnimationSpeed(10)
  list2:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Alchemy_ListControlCreate")
  list2:createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

RecentCookInit()
RecentCook_registEventHandler()
RecentCook_registMessageHandler()

