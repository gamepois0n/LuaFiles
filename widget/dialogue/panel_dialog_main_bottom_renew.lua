local Panel_Dialog_Main_Bottom_Info = {
  _initialize = false,
  _ui = {
    static_BottomBG = UI.getChildControl(Panel_Dialog_Main, "Static_BottomBG"),
    btn_FuncTemplete = nil,
    btn_FuncIconTemplete = nil,
    btn_Func_List = {
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    },
    static_Base_Line = nil,
    staticText_NPCName = nil,
    staticText_NPCTitle = nil,
    btn_LB = nil,
    btn_RB = nil,
    static_ConsoleKeyGuide = nil,
    btn_B = nil,
    btn_RT = nil
  },
  _config = {
    maxFuncButtonCount = 10,
    endFuncButtonIndex = 8,
    firstFuncButtonIndex = -1
  },
  _space = {functionButtonSpace = 32, defaultBottomSize = 282},
  _size = {funcButtonSizeX = nil, funcButtonSizeY = nil},
  _value = {
    lastFuncButtonIndex = -1,
    leastFuncButtonIndex = -1,
    questFuncButtonIndex = nil
  },
  _enum = {eButtonTypeDefault = -1},
  _funcButtonIcon = {
    ["texture"] = "Renewal/UI_Icon/Console_DialogueIcon_00.dds",
    ["greeting"] = {
      x1 = 356,
      y1 = 458,
      x2 = 426,
      y2 = 528
    },
    [0] = {
      x1 = 1,
      y1 = 32,
      x2 = 71,
      y2 = 102
    },
    [1] = {
      x1 = 1,
      y1 = 32,
      x2 = 71,
      y2 = 102
    },
    [2] = {
      x1 = 72,
      y1 = 32,
      x2 = 142,
      y2 = 102
    },
    [3] = {
      x1 = 72,
      y1 = 174,
      x2 = 142,
      y2 = 244
    },
    [4] = {
      x1 = 214,
      y1 = 387,
      x2 = 284,
      y2 = 457
    },
    [5] = {
      x1 = 285,
      y1 = 32,
      x2 = 355,
      y2 = 102
    },
    [7] = {
      x1 = 1,
      y1 = 387,
      x2 = 71,
      y2 = 457
    },
    [8] = {
      x1 = 214,
      y1 = 32,
      x2 = 284,
      y2 = 102
    },
    [9] = {
      x1 = 143,
      y1 = 245,
      x2 = 213,
      y2 = 315
    },
    [10] = {
      x1 = 72,
      y1 = 387,
      x2 = 142,
      y2 = 457
    },
    [11] = {
      x1 = 356,
      y1 = 245,
      x2 = 426,
      y2 = 315
    },
    [12] = {
      x1 = 356,
      y1 = 32,
      x2 = 426,
      y2 = 102
    },
    [13] = {
      x1 = 231,
      y1 = 24,
      x2 = 205,
      y2 = 227
    },
    [14] = {
      x1 = 427,
      y1 = 32,
      x2 = 497,
      y2 = 102
    },
    [15] = {
      x1 = 427,
      y1 = 103,
      x2 = 497,
      y2 = 173
    },
    [16] = {
      x1 = 143,
      y1 = 174,
      x2 = 213,
      y2 = 244
    },
    [18] = {
      x1 = 214,
      y1 = 458,
      x2 = 284,
      y2 = 528
    },
    [19] = {
      x1 = 356,
      y1 = 387,
      x2 = 426,
      y2 = 457
    },
    [20] = {
      x1 = 143,
      y1 = 32,
      x2 = 213,
      y2 = 102
    },
    [21] = {
      x1 = 1,
      y1 = 458,
      x2 = 71,
      y2 = 528
    },
    [22] = {
      x1 = 72,
      y1 = 32,
      x2 = 142,
      y2 = 102
    },
    [23] = {
      x1 = 285,
      y1 = 32,
      x2 = 355,
      y2 = 102
    },
    [24] = {
      x1 = 1,
      y1 = 103,
      x2 = 71,
      y2 = 173
    },
    [25] = {
      x1 = 427,
      y1 = 245,
      x2 = 497,
      y2 = 315
    },
    [27] = {
      x1 = 285,
      y1 = 458,
      x2 = 355,
      y2 = 528
    },
    [31] = {
      x1 = 427,
      y1 = 174,
      x2 = 497,
      y2 = 244
    },
    [32] = {
      x1 = 1,
      y1 = 32,
      x2 = 71,
      y2 = 102
    }
  },
  _hideDialog = {
    [-1] = true,
    [0] = false,
    [1] = false,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = false,
    [6] = false,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = false,
    [12] = false,
    [13] = false,
    [14] = true,
    [15] = true,
    [16] = false,
    [17] = false,
    [18] = false,
    [19] = true,
    [20] = true,
    [21] = true,
    [22] = true,
    [23] = true,
    [24] = false,
    [25] = false,
    [26] = true,
    [27] = false,
    [28] = true,
    [29] = false,
    [30] = true,
    [31] = false,
    [32] = true,
    [33] = false
  },
  _shopType = {
    eShopType_None = 0,
    eShopType_Potion = 1,
    eShopType_Weapon = 2,
    eShopType_Jewel = 3,
    eShopType_Furniture = 4,
    eShopType_Collect = 5,
    eShopType_Fish = 6,
    eShopType_Worker = 7,
    eShopType_Alchemy = 8,
    eShopType_Cook = 9,
    eShopType_PC = 10,
    eShopType_Grocery = 11,
    eShopType_RandomShop = 12,
    eShopType_DayRandomShop = 13,
    eShopType_Count = 14
  },
  _UI_color = Defines.Color,
  _currentTabIndex = -1,
  _currentMaxFuncButtonCount = 1
}
local slot = {
  btn_Func = nil,
  static_Icon = nil,
  funcButtonType = -1
}
function FGlobal_AddEffect_DialogButton(buttonNo, effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
  local self = Panel_Dialog_Main_Bottom_Info
  FGlobal_EraseAllEffect_DialogButton()
  if -1 == buttonNo then
    return
  end
  local button
  button = self._ui.btn_Func_List[buttonNo].btn_Func
  if nil == button then
    return
  end
  button:AddEffect(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
end
function FGlobal_EraseAllEffect_DialogButton(buttonNo)
  local self = Panel_Dialog_Main_Bottom_Info
  local maxButtonFuncCount = self._config.endFuncButtonIndex
  for index = self._config.firstFuncButtonIndex, maxButtonFuncCount do
    local button = self._ui.btn_Func_List[index].btn_Func
    if nil ~= button then
      button:EraseAllEffect()
    end
  end
end
function FGlobal_EraseAllEffect_ExitButton()
  local self = Panel_Dialog_Main_Bottom_Info
  self._ui.btn_B:EraseAllEffect()
end
function FGlobal_AddEffect_ExitButton(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
  local self = Panel_Dialog_Main_Bottom_Info
  self._ui.btn_B:AddEffect(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
end
function FGlobal_Dialog_FindFuncButtonIndexByType(targetFuncButtonType)
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return -1
  end
  local dialogButtonCount = dialogData:getFuncButtonCount()
  for index = 0, dialogButtonCount - 1 do
    local funcButton = dialogData:getFuncButtonAt(index)
    local funcButtonType = tonumber(funcButton._param)
    if targetFuncButtonType == funcButtonType then
      return index
    end
  end
  return -1
end
function Panel_Dialog_Main_Bottom_Info:registerMessageHandler()
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog_Bottom")
end
function Panel_Dialog_Main_Bottom_Info:initialize()
  self:close()
  self:initControl()
  self:initValue()
  self:registerMessageHandler()
end
function Panel_Dialog_Main_Bottom_Info:initValue()
  self._initialize = true
  self._value.lastFuncButtonIndex = self._enum.eButtonTypeDefault
  self._value.leastFuncButtonIndex = self._enum.eButtonTypeDefault
  self._value.questFuncButtonIndex = nil
end
function Panel_Dialog_Main_Bottom_Info:initControl()
  self._ui.btn_FuncTemplete = UI.getChildControl(self._ui.static_BottomBG, "Button_FuncTemplete")
  self._ui.btn_FuncIconTemplete = UI.getChildControl(self._ui.btn_FuncTemplete, "Static_Icon")
  self._ui.btn_FuncTemplete:SetShow(false)
  self._size.funcButtonSizeX = self._ui.btn_FuncTemplete:GetSizeX()
  self._size.funcButtonSizeY = self._ui.btn_FuncTemplete:GetSizeY()
  for index = self._config.firstFuncButtonIndex, self._config.endFuncButtonIndex do
    local btn_slot = {}
    btn_slot.btn_Func = UI.createAndCopyBasePropertyControl(self._ui.static_BottomBG, "Button_FuncTemplete", self._ui.static_BottomBG, "Button_Func_" .. index)
    btn_slot.static_Icon = UI.createAndCopyBasePropertyControl(self._ui.btn_FuncTemplete, "Static_Icon", self._ui.static_BottomBG, "Static_Icon_" .. index)
    self._ui.btn_Func_List[index] = btn_slot
  end
  self._ui.static_Base_Line = UI.getChildControl(self._ui.static_BottomBG, "Static_Base_Line")
  self._ui.staticText_NPCName = UI.getChildControl(self._ui.static_BottomBG, "StaticText_NPCName")
  self._ui.staticText_NPCTitle = UI.getChildControl(self._ui.static_BottomBG, "StaticText_NPCTitle")
  self._ui.btn_LB = UI.getChildControl(self._ui.static_BottomBG, "Button_LB")
  self._ui.btn_RB = UI.getChildControl(self._ui.static_BottomBG, "Button_RB")
  self._ui.static_ConsoleKeyGuide = UI.getChildControl(self._ui.static_BottomBG, "Static_ConsoleKeyGuide")
  self._ui.btn_B = UI.getChildControl(self._ui.static_ConsoleKeyGuide, "Button_B")
  self._ui.btn_RT = UI.getChildControl(self._ui.static_ConsoleKeyGuide, "Button_RT")
  self._ui.btn_RT:SetShow(false)
  Toggle_DialogMainTab_forPadEventFunc(0)
end
function Panel_Dialog_Main_Bottom_Info:open()
  self._ui.static_BottomBG:SetShow(true)
end
function Panel_Dialog_Main_Bottom_Info:close()
  self._ui.static_BottomBG:SetShow(false)
end
function Panel_Dialog_Main_Bottom_Info:update()
  self:open()
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  local npcTitle = dialogData:getContactNpcTitle()
  local npcName = dialogData:getContactNpcName()
  local talkerNpcKey = dialog_getTalkNpcKey()
  if "" == npcTitle or nil == npcTitle then
    self._ui.staticText_NPCTitle:SetText(" ")
  else
    self._ui.staticText_NPCTitle:SetText(npcTitle)
  end
  if 0 ~= talkerNpcKey then
    self._ui.staticText_NPCName:SetText(npcName)
  else
    self._ui.staticText_NPCName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BLACKSPIRIT"))
  end
  self._ui.staticText_NPCName:SetPosX(self._space.functionButtonSpace)
  self._ui.staticText_NPCTitle:SetPosX(self._space.functionButtonSpace)
  self:funcButton_Update(dialogData)
  self:guideButtonSetting(dialogData)
end
function Panel_Dialog_Main_Bottom_Info:perFrameUpdate()
end
function Panel_Dialog_Main_Bottom_Info:hide_SubDialog()
  PaGlobalFunc_MainDialog_Intimacy_Close()
  PaGlobalFunc_MainDialog_Right_Close()
end
function Panel_Dialog_Main_Bottom_Info:guideButtonSetting(dialogData)
  local buttonType = self._ui.btn_Func_List[self._currentTabIndex].funcButtonType
  local funcButtonCount = dialogData:getFuncButtonCount()
  if 0 == funcButtonCount then
    self._ui.btn_RT:SetShow(false)
  elseif nil ~= buttonType and self._hideDialog[buttonType] == false then
    self._ui.btn_RT:SetShow(false)
  end
  self._ui.btn_B:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Hide()")
end
function Panel_Dialog_Main_Bottom_Info:funcButton_Update(dialogData)
  for index = self._config.firstFuncButtonIndex, self._config.endFuncButtonIndex do
    self._ui.btn_Func_List[index].btn_Func:SetShow(false)
    self._ui.btn_Func_List[index].static_Icon:SetShow(false)
  end
  self._ui.btn_LB:SetShow(false)
  self._ui.btn_RB:SetShow(false)
  local funcButtonCount = 1
  funcButtonCount = funcButtonCount + dialogData:getFuncButtonCount()
  self._currentMaxFuncButtonCount = funcButtonCount
  if 1 == funcButtonCount then
    return
  end
  local funcButtonsSizeX = self._ui.btn_FuncTemplete:GetSizeX()
  local funcButtonsIconSizeX = self._ui.btn_FuncIconTemplete:GetSizeX()
  local iconGap = (funcButtonsSizeX - funcButtonsIconSizeX) / 2
  local borderX = self._space.functionButtonSpace
  local centerX = getScreenSizeX() / 2
  local totalSapceX, startButtonPosX, endButtonPosX
  if 1 == funcButtonCount % 2 then
    totalSapceX = (funcButtonCount - 1) * borderX + funcButtonsSizeX * funcButtonCount
  end
  totalSapceX = funcButtonCount * borderX + funcButtonsSizeX * funcButtonCount
  startButtonPosX = centerX - totalSapceX / 2
  endButtonPosX = startButtonPosX + totalSapceX
  for index = self._config.firstFuncButtonIndex, self._config.endFuncButtonIndex do
    local funcButtonControl = self._ui.btn_Func_List[index].btn_Func
    local funcButtonIconControl = self._ui.btn_Func_List[index].static_Icon
    funcButtonControl:SetPosX(startButtonPosX + (funcButtonsSizeX + borderX) * (index + 1))
    funcButtonIconControl:SetPosXY(startButtonPosX + (funcButtonsSizeX + borderX) * (index + 1) + iconGap, funcButtonControl:GetPosY() + iconGap)
    funcButtonControl:SetShow(true)
    funcButtonIconControl:SetShow(true)
    if self._config.firstFuncButtonIndex == index then
      self._ui.btn_Func_List[index].funcButtonType = -1
      funcButtonControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_GREETING"))
      funcButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Bottom_HandleClickedGoFirstButton()")
      local iconData = self._funcButtonIcon.greeting
      funcButtonIconControl:ChangeTextureInfoName(self._funcButtonIcon.texture)
      local x1, y1, x2, y2 = setTextureUV_Func(funcButtonIconControl, iconData.x1, iconData.y1, iconData.x2, iconData.y2)
      funcButtonIconControl:getBaseTexture():setUV(x1, y1, x2, y2)
      funcButtonIconControl:setRenderTexture(funcButtonIconControl:getBaseTexture())
    elseif index < funcButtonCount - 1 then
      local funcButton = dialogData:getFuncButtonAt(index)
      local funcButtonType = tonumber(funcButton._param)
      self._ui.btn_Func_List[index].funcButtonType = funcButtonType
      self:funcButton_ChangeIcon(funcButtonIconControl, funcButton)
      self:funcButton_CreatTypeBranch(funcButtonIconControl, funcButtonControl, funcButton, index)
    else
      funcButtonControl:SetShow(false)
      funcButtonIconControl:SetShow(false)
    end
  end
  if funcButtonCount > 0 then
    local LBbuttonSizeX = self._ui.btn_LB:GetSizeX()
    local RBbuttonSizeX = self._ui.btn_RB:GetSizeX()
    self._ui.btn_LB:SetShow(true)
    self._ui.btn_RB:SetShow(true)
    self._ui.btn_LB:SetPosX(startButtonPosX - borderX - LBbuttonSizeX)
    self._ui.btn_RB:SetPosX(endButtonPosX)
  end
end
function Panel_Dialog_Main_Bottom_Info:funcButton_ChangeIcon(funcButtonIconControl, funcButton)
  local funcButtonType = tonumber(funcButton._param)
  local iconData = self._funcButtonIcon[funcButtonType]
  if nil == iconData then
    funcButtonIconControl:SetShow(false)
    return
  end
  funcButtonIconControl:SetShow(true)
  funcButtonIconControl:ChangeTextureInfoName(self._funcButtonIcon.texture)
  local x1, y1, x2, y2 = setTextureUV_Func(funcButtonIconControl, iconData.x1, iconData.y1, iconData.x2, iconData.y2)
  funcButtonIconControl:getBaseTexture():setUV(x1, y1, x2, y2)
  funcButtonIconControl:setRenderTexture(funcButtonIconControl:getBaseTexture())
end
function Panel_Dialog_Main_Bottom_Info:funcButton_CreatTypeBranch(IconControl, ButtonControl, funcButton, index)
  local funcButtonType = tonumber(funcButton._param)
  local funcButtonName = funcButton:getText()
  ButtonControl:SetText(funcButtonName)
  ButtonControl:SetMonoTone(false)
  ButtonControl:SetFontColor(self._UI_color.C_FFFFFFFF)
  if funcButtonType == CppEnums.ContentsType.Contents_Quest or funcButtonType == CppEnums.ContentsType.Contents_NewQuest then
    audioPostEvent_SystemUi(4, 4)
    self._value.questFuncButtonIndex = index
  elseif funcButtonType == CppEnums.ContentsType.Contents_Shop then
    FGlobal_RemoteControl_Show(5)
  elseif funcButtonType == CppEnums.ContentsType.Contents_Skill then
  elseif funcButtonType == CppEnums.ContentsType.Contents_Auction then
    PaGlobalFunc_Dialog_Main_SetisAuctionDialog(true)
  elseif funcButtonType == CppEnums.ContentsType.Contents_Warehouse then
    FGlobal_RemoteControl_Show(6)
  elseif funcButtonType == CppEnums.ContentsType.Contents_IntimacyGame then
    if true == funcButton._enable then
      ButtonControl:SetMonoTone(false)
      ButtonControl:SetText(funcButtonName)
    else
      ButtonControl:SetMonoTone(true)
    end
    local selfPlayer = getSelfPlayer()
    if nil ~= selfPlayer then
      local Wp = selfPlayer:getWp()
      ButtonControl:SetText(funcButtonName .. " (" .. funcButton:getNeedWp() .. "/" .. Wp .. ")")
    end
  elseif funcButtonType == CppEnums.ContentsType.Contents_Stable then
    if stable_doHaveRegisterItem() then
    else
    end
  elseif funcButtonType == CppEnums.ContentsType.Contents_Explore then
    if false == dialog_getIsExplorationUseableCurrentTalker() then
    else
    end
  elseif funcButtonType == CppEnums.ContentsType.Contents_Enchant then
    if isBlackStone_16001 or isBlackStone_16002 then
      ButtonControl:EraseAllEffect()
    end
  elseif funcButtonType == CppEnums.ContentsType.Contents_Socket then
    if value_IsSocket == true then
      ButtonControl:EraseAllEffect()
    end
  elseif funcButtonType == CppEnums.ContentsType.Contents_Awaken then
  elseif funcButtonType == CppEnums.ContentsType.Contents_ReAwaken then
  else
    ButtonControl:SetText(funcButtonName)
    ButtonControl:SetMonoTone(false)
  end
  ButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(" .. index .. ")")
end
function Panel_Dialog_Main_Bottom_Info:checkInfoFuncButton()
  local talker = dialog_getTalker()
  if nil == talker then
    return
  end
  local actorKeyRaw = talker:getActorKey()
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  local knowledge = getSelfPlayer():get():getMentalKnowledge()
  local mentalObject = knowledge:getThemeByKeyRaw(npcActorProxyWrapper:getNpcThemeKey())
  if nil == mentalObject then
    return false
  else
    return true
  end
end
function Panel_Dialog_Main_Bottom_Info:button_Func_Branch(buttonType)
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  local count = 0
  local targetWindowList = {}
  audioPostEvent_SystemUi(0, 0)
  local MyWp = getSelfPlayer():getWp()
  local inventory = getSelfPlayer():get():getInventory()
  local invenSize = inventory:getFreeCount()
  if CppEnums.ContentsType.Contents_Quest == buttonType or CppEnums.ContentsType.Contents_NewQuest == buttonType then
    local talker = dialog_getTalker()
    PaGlobalFunc_MainDialog_Quest_Open()
  elseif CppEnums.ContentsType.Contents_HelpDesk == buttonType then
  elseif CppEnums.ContentsType.Contents_Shop == buttonType then
    local shopType = dialogData:getShopType()
    if self._shopType.eShopType_Worker == shopType then
      _indexWhenWorkerShopClicked = index
      local pcPosition = getSelfPlayer():get():getPosition()
      local regionInfo = getRegionInfoByPosition(pcPosition)
      local region = regionInfo:get()
      local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
      local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
      local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
      local s64_allWeight = Int64toInt32(getSelfPlayer():get():getCurrentWeight_s64())
      local s64_maxWeight = Int64toInt32(getSelfPlayer():get():getPossessableWeight_s64())
      if s64_allWeight >= s64_maxWeight then
        local messageboxData = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"),
          content = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTDESC"),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData)
        return
      end
      if 0 ~= getSelfPlayer():get():checkWorkerWorkingServerNo() then
        local messageboxData3 = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
          content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ_NotSameServerNo"),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData3)
        return
      end
      if waitWorkerCount == maxWorkerCount then
        local messageboxData = {
          title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"),
          content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ"),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData)
        return
      end
      if MyWp >= 5 then
        local messageboxData2 = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
          content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_WORKER", "MyWp", MyWp),
          functionYes = PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm,
          functionNo = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData2)
        return
      end
    end
    if self._shopType.eShopType_RandomShop == shopType then
      if invenSize <= 0 then
        local messageboxData = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
          content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData)
        return
      end
      local s64_allWeight = Int64toInt32(getSelfPlayer():get():getCurrentWeight_s64())
      local s64_maxWeight = Int64toInt32(getSelfPlayer():get():getPossessableWeight_s64())
      if s64_allWeight >= s64_maxWeight then
        local messageboxData = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"),
          content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData)
        return
      end
      local IsRamdomShopkeepItem = ToClient_IsRandomShopKeepItem()
      if IsRamdomShopkeepItem == false then
        local randomShopConsumeWp = ToClient_getRandomShopConsumWp()
        if MyWp < randomShopConsumeWp then
          local messageboxData2 = {
            title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
            content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp),
            functionApply = PaGlobalFunc_MainDialog_ReOpen,
            priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
          }
          MessageBox.showMessageBox(messageboxData2)
          return
        elseif MyWp >= randomShopConsumeWp then
          local messageboxData2 = {
            title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
            content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp),
            functionYes = PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm,
            functionNo = PaGlobalFunc_MainDialog_ReOpen,
            priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
          }
          MessageBox.showMessageBox(messageboxData2)
          return
        end
      end
    end
    if self._shopType.eShopType_DayRandomShop == shopType then
      if invenSize <= 0 then
        local messageboxData = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
          content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData)
        return
      end
      local s64_allWeight = Int64toInt32(getSelfPlayer():get():getCurrentWeight_s64())
      local s64_maxWeight = Int64toInt32(getSelfPlayer():get():getPossessableWeight_s64())
      if s64_allWeight >= s64_maxWeight then
        local messageboxData = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"),
          content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData)
        return
      end
      local randomShopConsumeWp = 10
      if MyWp < randomShopConsumeWp then
        local messageboxData2 = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
          content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp),
          functionApply = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData2)
        return
      elseif MyWp >= randomShopConsumeWp then
        local messageboxData2 = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
          content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp),
          functionYes = PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm,
          functionNo = PaGlobalFunc_MainDialog_ReOpen,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData2)
        return
      end
    end
    count = 2
    targetWindowList = {Panel_Dialog_NPCShop, Panel_Window_Inventory}
  elseif CppEnums.ContentsType.Contents_Skill == buttonType then
    count = 1
    if false == _ContentsGroup_RenewUI_Skill then
      targetWindowList = {Panel_Window_Skill}
    else
      targetWindowList = {
        PaGlobalFunc_Skill_GetPanel()
      }
    end
  elseif CppEnums.ContentsType.Contents_Auction == buttonType then
  elseif CppEnums.ContentsType.Contents_Inn == buttonType then
  elseif CppEnums.ContentsType.Contents_IntimacyGame == buttonType then
  elseif CppEnums.ContentsType.Contents_DeliveryPerson == buttonType then
    count = 1
    targetWindowList = {Panel_Window_DeliveryForPerson}
  elseif CppEnums.ContentsType.Contents_Guild == buttonType then
    if true == _ContentsGroup_RenewUI then
      PaGlobalFunc_GuildPopup_Open()
    else
      FGlobal_GuildCreateManagerPopup()
    end
  elseif CppEnums.ContentsType.Contents_Explore == buttonType then
  elseif CppEnums.ContentsType.Contents_Enchant == buttonType then
    PaGlobalFunc_EnchantInfo_Open()
  elseif CppEnums.ContentsType.Contents_Socket == buttonType then
    PaGlobalFunc_SocketInfo_Open()
  elseif CppEnums.ContentsType.Contents_LordMenu == buttonType then
    LordMenu_Show()
  elseif CppEnums.ContentsType.Contents_Extract == buttonType then
    PaGlobal_Extraction:togglePanel()
  elseif CppEnums.ContentsType.Contents_TerritoryTrade == buttonType then
    npcShop_requestList(buttonType)
  elseif CppEnums.ContentsType.Contents_TerritorySupply == buttonType then
    npcShop_requestList(buttonType)
  elseif CppEnums.ContentsType.Contents_GuildShop == buttonType then
    count = 2
    targetWindowList = {Panel_Dialog_NPCShop, Panel_Window_Inventory}
  elseif CppEnums.ContentsType.Contents_SupplyShop == buttonType then
    npcShop_requestList(buttonType)
  elseif CppEnums.ContentsType.Contents_FishSupplyShop == buttonType then
    npcShop_requestList(buttonType)
  elseif CppEnums.ContentsType.Contents_GuildSupplyShop == buttonType then
    npcShop_requestList(buttonType)
  elseif CppEnums.ContentsType.Contents_MinorLordMenu == buttonType then
    FGlobal_NodeWarMenuOpen()
  elseif CppEnums.ContentsType.Contents_Improve == buttonType then
    Panel_Improvement_Show()
  end
  self:Dialog_innerPanelShow(count, targetWindowList)
  if CppEnums.ContentsType.Contents_Shop == buttonType then
    npcShop_requestList(buttonType)
    FGlobal_NodeWarMenuClose()
  elseif CppEnums.ContentsType.Contents_Skill == buttonType then
    if false == _ContentsGroup_RenewUI_Skill then
      HandleMLUp_SkillWindow_OpenForLearn()
    else
      PaGlobalFunc_Skill_Open(true)
    end
  elseif CppEnums.ContentsType.Contents_Repair == buttonType then
    if true == _ContentsGroup_RenewUI_Repair then
      PaGlobalFunc_RepairInfo_Open()
    else
      PaGlobal_Repair:repair_OpenPanel(true)
    end
  elseif CppEnums.ContentsType.Contents_Warehouse == buttonType then
    Warehouse_OpenPanelFromDialog()
  elseif CppEnums.ContentsType.Contents_Stable == buttonType then
    if isGuildStable() then
      if CppEnums.ServantType.Type_Vehicle == stable_getServantType() then
        GuildStableFunction_Open()
      elseif CppEnums.ServantType.Type_Ship == stable_getServantType() then
        GuildWharfFunction_Open()
      end
    else
      warehouse_requestInfoFromNpc()
      if CppEnums.ServantType.Type_Vehicle == stable_getServantType() then
        if false == _ContentsGroup_RenewUI_Stable then
          StableFunction_Open()
        else
          PaGlobalFunc_Stable_Function_Open()
        end
      elseif CppEnums.ServantType.Type_Ship == stable_getServantType() then
        WharfFunction_Open()
      else
        PetFunction_Open()
        PetList_Open()
      end
    end
    show_DialogPanel()
  elseif CppEnums.ContentsType.Contents_Transfer == buttonType then
    DeliveryInformation_OpenPanelFromDialog()
  elseif CppEnums.ContentsType.Contents_Explore == buttonType then
  elseif CppEnums.ContentsType.Contents_DeliveryPerson == buttonType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_ReMake"))
  elseif CppEnums.ContentsType.Contents_GuildShop == buttonType then
    npcShop_requestList(buttonType)
  elseif CppEnums.ContentsType.Contents_ItemMarket == buttonType then
    if Panel_Window_ItemMarket:IsUISubApp() then
      Panel_Window_ItemMarket:CloseUISubApp()
      Panel_Window_ItemMarket:SetShow(false)
    end
    if not Panel_Window_ItemMarket:GetShow() then
      FGolbal_ItemMarket_Function_Open()
    else
      FGolbal_ItemMarket_Function_Close()
    end
  elseif CppEnums.ContentsType.Contents_Knowledge == buttonType then
    FGlobal_KnowledgeManagementShow()
  elseif CppEnums.ContentsType.Contents_Join == buttonType then
    Panel_Join_Show()
  elseif CppEnums.ContentsType.Contents_NpcGift == buttonType then
    FGlobal_NpcGift_Open()
  elseif CppEnums.ContentsType.Contents_WeakenEnchant == buttonType then
    PuriManager:Open()
  end
end
function Panel_Dialog_Main_Bottom_Info:Dialog_innerPanelShow(count, targetWindowList)
  if count <= 50 then
    return
  end
  dialog_setPositionSelectList(count)
  local index = 0
  for _, v in pairs(targetWindowList) do
    dialog_setPositionSelectSizeSet(index, v:GetSizeX(), v:GetSizeY())
    index = index + 1
  end
  dialog_calcPositionSelectList()
  index = 0
  for _, v in pairs(targetWindowList) do
    if false == v:GetShow() then
      local pos = dialog_PositionSelect(index)
      if 0 ~= pos.x or 0 ~= pos.y then
        if v == Panel_Window_Inventory then
        end
        v:ComputePos()
        v:SetPosX(pos.x)
        v:SetPosY(pos.y)
        index = index + 1
      else
        break
      end
    end
  end
end
function Panel_Dialog_Main_Bottom_Info:Resize()
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  self._ui.static_BottomBG:SetSize(sizeX, self._ui.static_BottomBG:GetSizeY())
  self._ui.static_Base_Line:SetSize(sizeX, self._ui.static_Base_Line:GetSizeY())
  self._ui.static_BottomBG:ComputePos()
  self._ui.static_ConsoleKeyGuide:ComputePos()
  self._ui.staticText_NPCName:ComputePos()
  self._ui.staticText_NPCTitle:ComputePos()
end
function PaGlobalFunc_MainDialog_Bottom_GetLeastFunButtonIndex()
  local self = Panel_Dialog_Main_Bottom_Info
  return self._value.leastFuncButtonIndex
end
function PaGlobalFunc_MainDialog_Bottom_SetLeastFunButtonIndex(index)
  local self = Panel_Dialog_Main_Bottom_Info
  self._value.lastFuncButtonIndex = self._value.leastFuncButtonIndex
  self._value.leastFuncButtonIndex = index
end
function PaGlobalFunc_MainDialog_Bottom_ResetLeastFunButtonIndex()
  local self = Panel_Dialog_Main_Bottom_Info
  self._enum.eButtonTypeDefault = self._enum.eButtonTypeDefault
  self._value.leastFuncButtonIndex = self._enum.eButtonTypeDefault
end
function PaGlobalFunc_MainDialog_Bottom_IsLeastFunButtonDefault()
  local self = Panel_Dialog_Main_Bottom_Info
  if self._value.leastFuncButtonIndex == self._enum.eButtonTypeDefault then
    return true
  else
    return false
  end
end
function PaGlobalFunc_MainDialog_Bottom_InitValue()
  local self = Panel_Dialog_Main_Bottom_Info
  self:initValue()
end
function PaGlobalFunc_MainDialog_Bottom_Open()
  local self = Panel_Dialog_Main_Bottom_Info
  self:open()
end
function PaGlobalFunc_MainDialog_Bottom_Close()
  local self = Panel_Dialog_Main_Bottom_Info
  self:close()
end
function PaGlobalFunc_MainDialog_Bottom_Update()
  local self = Panel_Dialog_Main_Bottom_Info
  self:update()
end
function PaGlobalFunc_MainDialog_Bottom_GetSizeY()
  local self = Panel_Dialog_Main_Bottom_Info
  if true == self._initialize then
    return self._ui.static_BottomBG:GetSizeY()
  else
    return self._space.defaultBottomSize
  end
end
function PaGlobalFunc_MainDialog_Bottom_FuncButtonUpdate()
  local self = Panel_Dialog_Main_Bottom_Info
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  self:funcButton_Update(dialogData)
end
function PaGlobalFunc_MainDialog_Bottom_FindQuestControlIndex()
  local self = Panel_Dialog_Main_Bottom_Info
  local retval = self._config.firstFuncButtonIndex
  for index = self._config.firstFuncButtonIndex, self._config.endFuncButtonIndex do
    local funcButtonType = self._ui.btn_Func_List[index].funcButtonType
    if funcButtonType == CppEnums.ContentsType.Contents_Quest or funcButtonType == CppEnums.ContentsType.Contents_NewQuest then
      retval = index
      break
    end
  end
  return retval
end
function PaGlobalFunc_MainDialog_Bottom_HandleClickedGoFirstButton()
  if Panel_Win_System:GetShow() then
    return
  end
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:enchantClose()
  end
  if check_ShowWindow() then
    close_WindowPanelList()
  end
  if false == _ContentsGroup_RenewUI_Skill and Panel_Window_Skill:IsShow() then
    HandleMLUp_SkillWindow_Close()
  end
  if Panel_Window_Warehouse:IsShow() then
    Warehouse_Close()
  end
  if PaGlobalFunc_Dialog_NPCShop_IsShow() then
    PaGlobalFunc_Dialog_NPCShop_Close()
  end
  if Panel_AskKnowledge:IsShow() then
    Panel_AskKnowledge:SetShow(false)
  end
  if Panel_TerritoryAuth_Auction:IsShow() then
    TerritoryAuth_Auction_Close()
  end
  if Panel_Dialog_Search:IsShow() then
    searchView_Close()
  end
  if true == _ContentsGroup_RenewUI_ReinforceSkill then
    PaGlobalFunc_Dialog_SkillSpecialize_Close(false)
  else
    if Panel_Window_ReinforceSkill:GetShow() then
      Panel_Window_ReinforceSkill_Close()
    end
    if Panel_SkillReinforce:GetShow() then
      Panel_SkillReinforce_Close()
    end
  end
  if Panel_Window_MasterpieceAuction:GetShow() then
    PaGlobal_MasterpieceAuction:close()
  end
  ToClient_SetFilterType(0, false)
  local self = Panel_Dialog_Main_Bottom_Info
  PaGlobalFunc_MainDialog_CloseIniteValues()
  PaGlobalFunc_Dialog_Main_SetShowCheckOnce(false)
  self:hide_SubDialog()
  ReqeustDialog_retryTalk()
end
function PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(index)
  if Panel_Win_System:GetShow() then
    return
  end
  PaGlobalFunc_Dialog_NPCShop_Close()
  if false == _ContentsGroup_RenewUI_Skill then
    HandleMLUp_SkillWindow_Close()
  end
  Warehouse_Close()
  FGlobal_ItemMarketRegistItem_Close()
  TerritoryAuth_Auction_Close()
  InventoryWindow_Close()
  Panel_Dialogue_Itemtake:SetShow(false)
  LordMenu_Hide()
  if true == _ContentsGroup_RenewUI then
    PaGlobalFunc_GuildPopup_Close()
    PaGlobalFunc_GuildCreate_Close()
  else
    CreateClan_Close()
  end
  Manufacture_Close()
  WorkerAuction_Close()
  if true == _ContentsGroup_RenewUI_ReinforceSkill then
    PaGlobalFunc_Dialog_SkillSpecialize_Exit()
  else
    Panel_Window_ReinforceSkill_Close()
    Panel_SkillReinforce_Close()
  end
  if true == _ContentsGroup_RenewUI_Gift then
    PaGlobalFunc_NpcGift_Close()
  else
    FGlobal_NpcGift_Close()
  end
  PaGlobal_Purification_Close()
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:enchantClose()
  end
  if Panel_Window_Socket:GetShow() then
    Socket_WindowClose()
  end
  if Panel_Improvement:GetShow() then
    Panel_Improvement_Hide()
  end
  if Panel_SkillAwaken:GetShow() then
    SkillAwaken_Close()
  end
  if Panel_Window_MasterpieceAuction:GetShow() then
    PaGlobal_MasterpieceAuction:close()
  end
  audioPostEvent_SystemUi(0, 0)
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  local dlgFuncCnt = dialogData:getFuncButtonCount()
  if dlgFuncCnt <= 0 then
    return
  end
  local funcButton = dialogData:getFuncButtonAt(index)
  if nil == funcButton then
    return
  end
  local funcButtonType = tonumber(funcButton._param)
  local self = Panel_Dialog_Main_Bottom_Info
  PaGlobalFunc_MainDialog_Bottom_SetLeastFunButtonIndex(index)
  if self._hideDialog[funcButtonType] == true and true == funcButton._enable then
    PaGlobalFunc_MainDialog_CloseMoment()
  end
  PaGlobalFunc_MainDialog_Quest_Close()
  PaGlobalFunc_MainDialog_Right_Close()
  PaGlobalFunc_MainDialog_Bottom_SetLeastFunButtonIndex(index)
  Toggle_DialogMainTab_SetIndexHiligt(index)
  PaGlobal_TutorialManager:handleClickedDialogFuncButton(funcButtonType)
  Dialog_clickFuncButtonReq(index)
  self:button_Func_Branch(funcButtonType)
  Panel_Interest_Knowledge_Hide()
end
function PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm(index)
  if nil == index then
    index = _indexWhenWorkerShopClicked
  end
  npcShop_requestList(CppEnums.ContentsType.Contents_Shop)
  Dialog_clickFuncButtonReq(index)
  Panel_Interest_Knowledge_Hide()
end
function PaGlobalFunc_MainDialog_Bottom_GetFuncPositionNewQuestButton()
  local Position = {
    _Return = false,
    _PosX = -1,
    _PosY = -1
  }
  local Index = PaGlobalFunc_MainDialog_Bottom_FindFuncButtonIndexByType(CppEnums.ContentsType.Contents_NewQuest)
  if -1 == Index then
    return Position
  end
  local self = Panel_Dialog_Main_Bottom_Info
  Position._Return = true
  Position._PosX = self._ui.btn_Func_List[Index]:GetPosX()
  Position._PosY = self._ui.btn_Func_List[Index]:GetPosY()
  return Position
end
function PaGlobalFunc_MainDialog_Bottom_FindFuncButtonIndexByType(targetFuncButtonType)
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return -1
  end
  local dialogButtonCount = dialogData:getFuncButtonCount()
  for index = 0, dialogButtonCount - 1 do
    local funcButton = dialogData:getFuncButtonAt(index)
    local funcButtonType = tonumber(funcButton._param)
    if targetFuncButtonType == funcButtonType then
      return index
    end
  end
  return -1
end
function PaGlobalFunc_MainDialog_Bottom_GetFuncButtonSizeXY()
  local self = Panel_Dialog_Main_Bottom_Info
  return self._size.funcButtonSizeX, self._size.funcButtonSizeY
end
function Toggle_DialogMainTab_forPadEventFunc(value)
  local self = Panel_Dialog_Main_Bottom_Info
  local _currentBottomButton = {}
  local _lastArrayIndex = self._currentMaxFuncButtonCount - 2
  for ii = self._config.firstFuncButtonIndex, _lastArrayIndex do
    _currentBottomButton[ii] = self._ui.btn_Func_List[ii].btn_Func
    _currentBottomButton[ii]:setRenderTexture(_currentBottomButton[ii]:getBaseTexture())
  end
  PaGlobalFunc_MainDialog_Intimacy_Close()
  if PaGlobalFunc_MainDialog_Quest_GetShow() then
    PaGlobalFunc_MainDialog_Quest_Close()
  end
  if check_ShowWindow() then
    close_WindowPanelList()
  end
  self._currentTabIndex = self._currentTabIndex + value
  if self._config.firstFuncButtonIndex > self._currentTabIndex then
    self._currentTabIndex = _lastArrayIndex
  elseif _lastArrayIndex < self._currentTabIndex then
    self._currentTabIndex = self._config.firstFuncButtonIndex
  end
  _currentBottomButton[self._currentTabIndex]:setRenderTexture(_currentBottomButton[self._currentTabIndex]:getOnTexture())
  local buttonType = self._ui.btn_Func_List[self._currentTabIndex].funcButtonType
  if nil ~= buttonType then
    if self._hideDialog[buttonType] == false then
      PaGlobalFunc_MainDialog_Right_Close()
      Toggle_DialogMainTab_Enter()
      self._ui.btn_RT:SetShow(false)
    else
      if false == PaGlobalFunc_MainDialog_Right_GetShow() then
        PaGlobalFunc_MainDialog_Right_ReOpen()
      end
      self._ui.btn_RT:SetShow(true)
    end
  end
end
function Toggle_DialogMainTab_Enter()
  local self = Panel_Dialog_Main_Bottom_Info
  if self._currentMaxFuncButtonCount == 1 then
    return
  end
  if self._config.firstFuncButtonIndex == self._currentTabIndex then
    PaGlobalFunc_MainDialog_Bottom_HandleClickedGoFirstButton()
  else
    PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(self._currentTabIndex)
  end
end
function Toggle_DialogMainTab_SetIndexHiligt(index)
  local self = Panel_Dialog_Main_Bottom_Info
  local _lastArrayIndex = self._currentMaxFuncButtonCount - 2
  local _currentBottomButton = {}
  for ii = self._config.firstFuncButtonIndex, _lastArrayIndex do
    _currentBottomButton[ii] = self._ui.btn_Func_List[ii].btn_Func
    _currentBottomButton[ii]:setRenderTexture(_currentBottomButton[ii]:getBaseTexture())
  end
  self._currentTabIndex = index
  if nil ~= _currentBottomButton[self._currentTabIndex] then
    _currentBottomButton[self._currentTabIndex]:setRenderTexture(_currentBottomButton[self._currentTabIndex]:getOnTexture())
  end
end
function PaGlobalFunc_Main_Dialog_Bottom_Index_Init()
  local self = Panel_Dialog_Main_Bottom_Info
  self._currentTabIndex = self._config.firstFuncButtonIndex
  local _lastArrayIndex = self._currentMaxFuncButtonCount - 2
  local _currentBottomButton = {}
  for ii = self._config.firstFuncButtonIndex, _lastArrayIndex do
    _currentBottomButton[ii] = self._ui.btn_Func_List[ii].btn_Func
    _currentBottomButton[ii]:setRenderTexture(_currentBottomButton[ii]:getBaseTexture())
  end
  _currentBottomButton[self._currentTabIndex]:setRenderTexture(_currentBottomButton[self._currentTabIndex]:getOnTexture())
end
Panel_Dialog_Main:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "Toggle_DialogMainTab_forPadEventFunc(-1)")
Panel_Dialog_Main:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "Toggle_DialogMainTab_forPadEventFunc(1)")
Panel_Dialog_Main:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "Toggle_DialogMainTab_Enter()")
function FromClient_InitMainDialog_Bottom()
  local self = Panel_Dialog_Main_Bottom_Info
  self:initialize()
  self:Resize()
end
function FromClient_onScreenResize_MainDialog_Bottom()
  local self = Panel_Dialog_Main_Bottom_Info
  self:Resize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog_Bottom")