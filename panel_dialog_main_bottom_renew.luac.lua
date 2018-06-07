-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_dialog_main_bottom_renew.luac 

-- params : ...
-- function num : 0
local Panel_Dialog_Main_Bottom_Info = {_initialize = false, 
_ui = {static_BottomBG = (UI.getChildControl)(Panel_Dialog_Main, "Static_BottomBG"), btn_FuncTemplete = nil, btn_FuncIconTemplete = nil, 
btn_Func_List = {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil}
, static_Base_Line = nil, staticText_NPCName = nil, staticText_NPCTitle = nil, btn_LB = nil, btn_RB = nil, static_ConsoleKeyGuide = nil, btn_B = nil, btn_X = nil, btn_A = nil}
, 
_config = {maxFuncButtonCount = 10}
, 
_space = {functionButtonSpace = 32, defaultBottomSize = 282}
, 
_size = {funcButtonSizeX = nil, funcButtonSizeY = nil}
, 
_value = {leastFuncButtonIndex = -1, isHide = false}
, 
_text = {blackSpriteName = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_BLACKSPIRIT")}
, 
_enum = {eButtonTypeDefault = -1}
, 
_funcButtonIcon = {texture = "Renewal/UI_Icon/Console_DialogueIcon_00.dds", 
greeting = {x1 = 356, y1 = 458, x2 = 426, y2 = 528}
, 
[0] = {x1 = 1, y1 = 32, x2 = 71, y2 = 102}
, 
[1] = {x1 = 1, y1 = 32, x2 = 71, y2 = 102}
, 
[2] = {x1 = 72, y1 = 32, x2 = 142, y2 = 102}
, 
[3] = {x1 = 72, y1 = 174, x2 = 142, y2 = 244}
, 
[4] = {x1 = 214, y1 = 387, x2 = 284, y2 = 457}
, 
[5] = {x1 = 285, y1 = 32, x2 = 355, y2 = 102}
, 
[7] = {x1 = 1, y1 = 387, x2 = 71, y2 = 457}
, 
[8] = {x1 = 214, y1 = 32, x2 = 284, y2 = 102}
, 
[9] = {x1 = 143, y1 = 245, x2 = 213, y2 = 315}
, 
[10] = {x1 = 72, y1 = 387, x2 = 142, y2 = 457}
, 
[11] = {x1 = 356, y1 = 245, x2 = 426, y2 = 315}
, 
[12] = {x1 = 356, y1 = 32, x2 = 426, y2 = 102}
, 
[13] = {x1 = 231, y1 = 24, x2 = 205, y2 = 227}
, 
[14] = {x1 = 427, y1 = 32, x2 = 497, y2 = 102}
, 
[15] = {x1 = 427, y1 = 103, x2 = 497, y2 = 173}
, 
[16] = {x1 = 143, y1 = 174, x2 = 213, y2 = 244}
, 
[18] = {x1 = 214, y1 = 458, x2 = 284, y2 = 528}
, 
[19] = {x1 = 356, y1 = 387, x2 = 426, y2 = 457}
, 
[20] = {x1 = 143, y1 = 32, x2 = 213, y2 = 102}
, 
[21] = {x1 = 1, y1 = 458, x2 = 71, y2 = 528}
, 
[22] = {x1 = 72, y1 = 32, x2 = 142, y2 = 102}
, 
[23] = {x1 = 285, y1 = 32, x2 = 355, y2 = 102}
, 
[24] = {x1 = 1, y1 = 103, x2 = 71, y2 = 173}
, 
[25] = {x1 = 427, y1 = 245, x2 = 497, y2 = 315}
, 
[27] = {x1 = 285, y1 = 458, x2 = 355, y2 = 528}
, 
[31] = {x1 = 427, y1 = 174, x2 = 497, y2 = 244}
, 
[32] = {x1 = 1, y1 = 32, x2 = 71, y2 = 102}
}
, 
_shopType = {eShopType_None = 0, eShopType_Potion = 1, eShopType_Weapon = 2, eShopType_Jewel = 3, eShopType_Furniture = 4, eShopType_Collect = 5, eShopType_Fish = 6, eShopType_Worker = 7, eShopType_Alchemy = 8, eShopType_Cook = 9, eShopType_PC = 10, eShopType_Grocery = 11, eShopType_RandomShop = 12, eShopType_DayRandomShop = 13, eShopType_Count = 14}
, _UI_color = Defines.Color, _currentTabIndex = 0, _currentMaxFuncButtonCount = 1}
FGlobal_AddEffect_DialogButton = function(buttonNo, effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
  -- function num : 0_0 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  FGlobal_EraseAllEffect_DialogButton()
  if buttonNo == -1 then
    return 
  end
  local button = nil
  button = (((self._ui).btn_Func_List)[buttonNo + 1]).btn_Func
  if button == nil then
    return 
  end
  button:AddEffect(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
end

FGlobal_EraseAllEffect_DialogButton = function(buttonNo)
  -- function num : 0_1 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  local maxButtonFuncCount = (self._config).maxFuncButtonCount - 1
  for index = 0, maxButtonFuncCount do
    local button = (((self._ui).btn_Func_List)[index]).btn_Func
    if button ~= nil then
      button:EraseAllEffect()
    end
  end
end

FGlobal_EraseAllEffect_ExitButton = function()
  -- function num : 0_2 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  ;
  ((self._ui).btn_B):EraseAllEffect()
end

FGlobal_AddEffect_ExitButton = function(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
  -- function num : 0_3 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  ;
  ((self._ui).btn_B):AddEffect(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
end

FGlobal_Dialog_FindFuncButtonIndexByType = function(targetFuncButtonType)
  -- function num : 0_4
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
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

Panel_Dialog_Main_Bottom_Info.registerMessageHandler = function(self)
  -- function num : 0_5
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog_Bottom")
end

Panel_Dialog_Main_Bottom_Info.initialize = function(self)
  -- function num : 0_6
  self:close()
  self:initControl()
  self:initValue()
  self:registerMessageHandler()
end

Panel_Dialog_Main_Bottom_Info.initValue = function(self)
  -- function num : 0_7
  self._initialize = true
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).leastFuncButtonIndex = (self._enum).eButtonTypeDefault
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).isHide = false
end

Panel_Dialog_Main_Bottom_Info.initControl = function(self)
  -- function num : 0_8
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).btn_FuncTemplete = (UI.getChildControl)((self._ui).static_BottomBG, "Button_FuncTemplete")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_FuncIconTemplete = (UI.getChildControl)((self._ui).btn_FuncTemplete, "Static_Icon")
  ;
  ((self._ui).btn_FuncTemplete):SetShow(false)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._size).funcButtonSizeX = ((self._ui).btn_FuncTemplete):GetSizeX()
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._size).funcButtonSizeY = ((self._ui).btn_FuncTemplete):GetSizeY()
  for index = 0, (self._config).maxFuncButtonCount - 1 do
    local btn_slot = {}
    btn_slot.btn_Func = (UI.createAndCopyBasePropertyControl)((self._ui).static_BottomBG, "Button_FuncTemplete", (self._ui).static_BottomBG, "Button_Func_" .. index)
    btn_slot.static_Icon = (UI.createAndCopyBasePropertyControl)((self._ui).btn_FuncTemplete, "Static_Icon", (self._ui).static_BottomBG, "Static_Icon_" .. index)
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).btn_Func_List)[index] = btn_slot
  end
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Base_Line = (UI.getChildControl)((self._ui).static_BottomBG, "Static_Base_Line")
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_NPCName = (UI.getChildControl)((self._ui).static_BottomBG, "StaticText_NPCName")
  -- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_NPCTitle = (UI.getChildControl)((self._ui).static_BottomBG, "StaticText_NPCTitle")
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_LB = (UI.getChildControl)((self._ui).static_BottomBG, "Button_LB")
  -- DECOMPILER ERROR at PC107: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_RB = (UI.getChildControl)((self._ui).static_BottomBG, "Button_RB")
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_ConsoleKeyGuide = (UI.getChildControl)((self._ui).static_BottomBG, "Static_ConsoleKeyGuide")
  -- DECOMPILER ERROR at PC123: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_B = (UI.getChildControl)((self._ui).static_ConsoleKeyGuide, "Button_B")
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_A = (UI.getChildControl)((self._ui).static_ConsoleKeyGuide, "Button_A")
  Toggle_DialogMainTab_forPadEventFunc(0)
end

Panel_Dialog_Main_Bottom_Info.open = function(self)
  -- function num : 0_9
  if (self._value).isHide == false then
    ((self._ui).static_BottomBG):SetShow(true)
  end
end

Panel_Dialog_Main_Bottom_Info.close = function(self)
  -- function num : 0_10
  ((self._ui).static_BottomBG):SetShow(false)
end

Panel_Dialog_Main_Bottom_Info.hideMonent = function(self)
  -- function num : 0_11
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._value).isHide = true
  self:close()
end

Panel_Dialog_Main_Bottom_Info.update = function(self)
  -- function num : 0_12
  self:open()
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local npcTitle = dialogData:getContactNpcTitle()
  local npcName = dialogData:getContactNpcName()
  local talkerNpcKey = dialog_getTalkNpcKey()
  if npcTitle == "" or npcTitle == nil then
    ((self._ui).staticText_NPCTitle):SetText(" ")
  else
    ;
    ((self._ui).staticText_NPCTitle):SetText(npcTitle)
  end
  if talkerNpcKey ~= 0 then
    ((self._ui).staticText_NPCName):SetText(npcName)
  else
    ;
    ((self._ui).staticText_NPCName):SetText((self._text).blackSpriteName)
  end
  ;
  ((self._ui).staticText_NPCName):SetPosX((self._space).functionButtonSpace)
  ;
  ((self._ui).staticText_NPCTitle):SetPosX((self._space).functionButtonSpace)
  self:funcButton_Update(dialogData)
  self:guideButtonSetting()
end

Panel_Dialog_Main_Bottom_Info.perFrameUpdate = function(self)
  -- function num : 0_13
end

Panel_Dialog_Main_Bottom_Info.hide_SubDialog = function(self)
  -- function num : 0_14
  PaGlobalFunc_MainDialog_Intimacy_Close()
  PaGlobalFunc_MainDialog_Right_Close()
end

Panel_Dialog_Main_Bottom_Info.guideButtonSetting = function(self, dialogData)
  -- function num : 0_15
  ((self._ui).btn_B):addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Hide()")
end

Panel_Dialog_Main_Bottom_Info.funcButton_Update = function(self, dialogData)
  -- function num : 0_16
  for index = 0, (self._config).maxFuncButtonCount - 1 do
    ((((self._ui).btn_Func_List)[index]).btn_Func):SetShow(false)
  end
  ;
  ((self._ui).btn_LB):SetShow(false)
  ;
  ((self._ui).btn_RB):SetShow(false)
  local funcButtonCount = 1
  funcButtonCount = funcButtonCount + dialogData:getFuncButtonCount()
  self._currentMaxFuncButtonCount = funcButtonCount
  if funcButtonCount == nil then
    return 
  end
  local funcButtonsSizeX = ((self._ui).btn_FuncTemplete):GetSizeX()
  local funcButtonsIconSizeX = ((self._ui).btn_FuncIconTemplete):GetSizeX()
  local iconGap = (funcButtonsSizeX - funcButtonsIconSizeX) / 2
  local borderX = (self._space).functionButtonSpace
  local centerX = getScreenSizeX() / 2
  local totalSapceX, startButtonPosX, endButtonPosX = nil, nil, nil
  if (funcButtonCount) % 2 == 1 then
    totalSapceX = (funcButtonCount - 1) * borderX + funcButtonsSizeX * (funcButtonCount)
  end
  totalSapceX = (funcButtonCount) * borderX + funcButtonsSizeX * (funcButtonCount)
  startButtonPosX = centerX - (totalSapceX) / 2
  endButtonPosX = startButtonPosX + (totalSapceX)
  for index = 0, (self._config).maxFuncButtonCount - 1 do
    local funcButtonControl = (((self._ui).btn_Func_List)[index]).btn_Func
    local funcButtonIconControl = (((self._ui).btn_Func_List)[index]).static_Icon
    funcButtonControl:SetPosX(startButtonPosX + (funcButtonsSizeX + borderX) * index)
    funcButtonIconControl:SetPosXY(startButtonPosX + (funcButtonsSizeX + borderX) * index + iconGap, funcButtonControl:GetPosY() + iconGap)
    funcButtonControl:SetShow(true)
    funcButtonIconControl:SetShow(true)
    if index == 0 then
      funcButtonControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_GREETING"))
      funcButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Bottom_HandleClickedGoFirstButton()")
      local iconData = (self._funcButtonIcon).greeting
      funcButtonIconControl:ChangeTextureInfoName((self._funcButtonIcon).texture)
      local x1, y1, x2, y2 = setTextureUV_Func(funcButtonIconControl, iconData.x1, iconData.y1, iconData.x2, iconData.y2)
      ;
      (funcButtonIconControl:getBaseTexture()):setUV(x1, y1, x2, y2)
      funcButtonIconControl:setRenderTexture(funcButtonIconControl:getBaseTexture())
    else
      do
        if index < funcButtonCount then
          local funcButton = dialogData:getFuncButtonAt(index - 1)
          self:funcButton_ChangeIcon(funcButtonIconControl, funcButton)
          self:funcButton_CreatTypeBranch(funcButtonIconControl, funcButtonControl, funcButton, index - 1)
        else
          do
            do
              funcButtonControl:SetShow(false)
              funcButtonIconControl:SetShow(false)
              -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if funcButtonCount > 0 then
    local LBbuttonSizeX = ((self._ui).btn_LB):GetSizeX()
    local RBbuttonSizeX = ((self._ui).btn_RB):GetSizeX()
    ;
    ((self._ui).btn_LB):SetShow(true)
    ;
    ((self._ui).btn_RB):SetShow(true)
    ;
    ((self._ui).btn_LB):SetPosX(startButtonPosX - borderX - LBbuttonSizeX)
    ;
    ((self._ui).btn_RB):SetPosX(endButtonPosX)
  end
end

Panel_Dialog_Main_Bottom_Info.funcButton_ChangeIcon = function(self, funcButtonIconControl, funcButton)
  -- function num : 0_17
  local funcButtonType = tonumber(funcButton._param)
  _PA_LOG("mingu", "funcButtonType" .. funcButtonType)
  local iconData = (self._funcButtonIcon)[funcButtonType]
  if iconData == nil then
    funcButtonIconControl:SetShow(false)
    return 
  end
  _PA_LOG("mingu", "iconchange")
  funcButtonIconControl:SetShow(true)
  funcButtonIconControl:ChangeTextureInfoName((self._funcButtonIcon).texture)
  local x1, y1, x2, y2 = setTextureUV_Func(funcButtonIconControl, iconData.x1, iconData.y1, iconData.x2, iconData.y2)
  ;
  (funcButtonIconControl:getBaseTexture()):setUV(x1, y1, x2, y2)
  funcButtonIconControl:setRenderTexture(funcButtonIconControl:getBaseTexture())
end

Panel_Dialog_Main_Bottom_Info.funcButton_CreatTypeBranch = function(self, IconControl, ButtonControl, funcButton, index)
  -- function num : 0_18
  local funcButtonType = tonumber(funcButton._param)
  local funcButtonName = funcButton:getText()
  ButtonControl:SetText(funcButtonName)
  ButtonControl:SetMonoTone(false)
  ButtonControl:SetFontColor((self._UI_color).C_FFFFFFFF)
  if funcButtonType ~= (CppEnums.ContentsType).Contents_Quest or funcButtonType == (CppEnums.ContentsType).Contents_NewQuest then
    audioPostEvent_SystemUi(4, 4)
  else
    if funcButtonType == (CppEnums.ContentsType).Contents_Shop then
      FGlobal_RemoteControl_Show(5)
    else
    end
  end
  if funcButtonType ~= (CppEnums.ContentsType).Contents_Skill or funcButtonType == (CppEnums.ContentsType).Contents_Auction then
    PaGlobalFunc_Dialog_Main_SetisAuctionDialog(true)
  else
    if funcButtonType == (CppEnums.ContentsType).Contents_Warehouse then
      FGlobal_RemoteControl_Show(6)
    else
      if funcButtonType == (CppEnums.ContentsType).Contents_IntimacyGame then
        if funcButton._enable == true then
          ButtonControl:SetMonoTone(false)
          ButtonControl:SetText(funcButtonName)
        else
          ButtonControl:SetMonoTone(true)
        end
        local selfPlayer = getSelfPlayer()
        if selfPlayer ~= nil then
          local Wp = selfPlayer:getWp()
          ButtonControl:SetText(funcButtonName .. " (" .. funcButton:getNeedWp() .. "/" .. Wp .. ")")
        end
      else
      end
    end
  end
  do
    -- DECOMPILER ERROR at PC133: Unhandled construct in 'MakeBoolean' P1

    if (funcButtonType ~= (CppEnums.ContentsType).Contents_Stable or stable_doHaveRegisterItem() and (funcButtonType ~= (CppEnums.ContentsType).Contents_Explore or dialog_getIsExplorationUseableCurrentTalker() == false and funcButtonType == (CppEnums.ContentsType).Contents_Enchant) and (isBlackStone_16001 or isBlackStone_16002)) then
      ButtonControl:EraseAllEffect()
    end
    -- DECOMPILER ERROR at PC144: Unhandled construct in 'MakeBoolean' P1

    if funcButtonType == (CppEnums.ContentsType).Contents_Socket and value_IsSocket == true then
      ButtonControl:EraseAllEffect()
    end
    if funcButtonType ~= (CppEnums.ContentsType).Contents_Awaken or funcButtonType == (CppEnums.ContentsType).Contents_ReAwaken then
      ButtonControl:SetText(funcButtonName)
      ButtonControl:SetMonoTone(false)
      ButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(" .. index .. ")")
    end
  end
end

Panel_Dialog_Main_Bottom_Info.checkInfoFuncButton = function(self)
  -- function num : 0_19
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  local actorKeyRaw = talker:getActorKey()
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local mentalObject = knowledge:getThemeByKeyRaw(npcActorProxyWrapper:getNpcThemeKey())
  if mentalObject == nil then
    return false
  else
    return true
  end
end

Panel_Dialog_Main_Bottom_Info.button_Func_Branch = function(self, buttonType)
  -- function num : 0_20
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local count = 0
  local targetWindowList = {}
  audioPostEvent_SystemUi(0, 0)
  local MyWp = (getSelfPlayer()):getWp()
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local invenSize = inventory:getFreeCount()
  do
    if (CppEnums.ContentsType).Contents_Quest == buttonType or (CppEnums.ContentsType).Contents_NewQuest == buttonType then
      local talker = dialog_getTalker()
    else
    end
    if talker ~= nil then
      if (CppEnums.ContentsType).Contents_HelpDesk ~= buttonType or (CppEnums.ContentsType).Contents_Shop == buttonType then
        local shopType = dialogData:getShopType()
        if (self._shopType).eShopType_Worker == shopType then
          _indexWhenWorkerShopClicked = index
          local pcPosition = ((getSelfPlayer()):get()):getPosition()
          local regionInfo = getRegionInfoByPosition(pcPosition)
          local region = regionInfo:get()
          local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
          local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
          local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
          local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
          local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
          do
            if s64_maxWeight <= s64_allWeight then
              local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTDESC"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageboxData)
              return 
            end
            do
              if ((getSelfPlayer()):get()):checkWorkerWorkingServerNo() ~= 0 then
                local messageboxData3 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ_NotSameServerNo"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                ;
                (MessageBox.showMessageBox)(messageboxData3)
                return 
              end
              do
                if waitWorkerCount == maxWorkerCount then
                  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                  ;
                  (MessageBox.showMessageBox)(messageboxData)
                  return 
                end
                do
                  if MyWp >= 5 then
                    local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_WORKER", "MyWp", MyWp), functionYes = PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                    ;
                    (MessageBox.showMessageBox)(messageboxData2)
                    return 
                  end
                  if (self._shopType).eShopType_RandomShop == shopType then
                    do
                      if invenSize <= 0 then
                        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                        ;
                        (MessageBox.showMessageBox)(messageboxData)
                        return 
                      end
                      local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
                      local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
                      do
                        if s64_maxWeight <= s64_allWeight then
                          local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                          ;
                          (MessageBox.showMessageBox)(messageboxData)
                          return 
                        end
                        local IsRamdomShopkeepItem = ToClient_IsRandomShopKeepItem()
                        if IsRamdomShopkeepItem == false then
                          local randomShopConsumeWp = ToClient_getRandomShopConsumWp()
                          if MyWp < randomShopConsumeWp then
                            local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                            ;
                            (MessageBox.showMessageBox)(messageboxData2)
                            return 
                          else
                            do
                              do
                                if randomShopConsumeWp <= MyWp then
                                  local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionYes = PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                  ;
                                  (MessageBox.showMessageBox)(messageboxData2)
                                  return 
                                end
                                if (self._shopType).eShopType_DayRandomShop == shopType then
                                  do
                                    if invenSize <= 0 then
                                      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                      ;
                                      (MessageBox.showMessageBox)(messageboxData)
                                      return 
                                    end
                                    local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
                                    local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
                                    do
                                      if s64_maxWeight <= s64_allWeight then
                                        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                        ;
                                        (MessageBox.showMessageBox)(messageboxData)
                                        return 
                                      end
                                      local randomShopConsumeWp = 10
                                      if MyWp < randomShopConsumeWp then
                                        local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                        ;
                                        (MessageBox.showMessageBox)(messageboxData2)
                                        return 
                                      else
                                        do
                                          do
                                            do
                                              if randomShopConsumeWp <= MyWp then
                                                local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionYes = PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                                ;
                                                (MessageBox.showMessageBox)(messageboxData2)
                                                return 
                                              end
                                              count = 2
                                              targetWindowList = {Panel_Dialog_NPCShop, Panel_Window_Inventory}
                                              self:hideMonent()
                                              if (CppEnums.ContentsType).Contents_Skill == buttonType then
                                                count = 1
                                                if _ContentsGroup_RenewUI_Skill == false then
                                                  targetWindowList = {Panel_Window_Skill}
                                                else
                                                  targetWindowList = {PaGlobalFunc_Skill_GetPanel()}
                                                end
                                              else
                                              end
                                              if (((CppEnums.ContentsType).Contents_Auction ~= buttonType or (CppEnums.ContentsType).Contents_Inn == buttonType) and (CppEnums.ContentsType).Contents_IntimacyGame ~= buttonType) or (CppEnums.ContentsType).Contents_DeliveryPerson == buttonType then
                                                count = 1
                                                targetWindowList = {Panel_Window_DeliveryForPerson}
                                              else
                                                if (CppEnums.ContentsType).Contents_Guild == buttonType then
                                                  FGlobal_GuildCreateManagerPopup()
                                                else
                                                end
                                              end
                                              if (CppEnums.ContentsType).Contents_Explore ~= buttonType or (CppEnums.ContentsType).Contents_Enchant == buttonType then
                                                PaGlobal_Enchant:enchant_Show()
                                              else
                                                if (CppEnums.ContentsType).Contents_Socket == buttonType then
                                                  Socket_Window_Show()
                                                else
                                                  if (CppEnums.ContentsType).Contents_LordMenu == buttonType then
                                                    LordMenu_Show()
                                                  else
                                                    if (CppEnums.ContentsType).Contents_Extract == buttonType then
                                                      PaGlobal_Extraction:togglePanel()
                                                    else
                                                      if (CppEnums.ContentsType).Contents_TerritoryTrade == buttonType then
                                                        npcShop_requestList(buttonType)
                                                      else
                                                        if (CppEnums.ContentsType).Contents_TerritorySupply == buttonType then
                                                          npcShop_requestList(buttonType)
                                                        else
                                                          if (CppEnums.ContentsType).Contents_GuildShop == buttonType then
                                                            count = 2
                                                            targetWindowList = {Panel_Dialog_NPCShop, Panel_Window_Inventory}
                                                            self:hideMonent()
                                                          else
                                                            if (CppEnums.ContentsType).Contents_SupplyShop == buttonType then
                                                              npcShop_requestList(buttonType)
                                                            else
                                                              if (CppEnums.ContentsType).Contents_FishSupplyShop == buttonType then
                                                                npcShop_requestList(buttonType)
                                                              else
                                                                if (CppEnums.ContentsType).Contents_GuildSupplyShop == buttonType then
                                                                  npcShop_requestList(buttonType)
                                                                else
                                                                  if (CppEnums.ContentsType).Contents_MinorLordMenu == buttonType then
                                                                    FGlobal_NodeWarMenuOpen()
                                                                  else
                                                                    if (CppEnums.ContentsType).Contents_Improve == buttonType then
                                                                      Panel_Improvement_Show()
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
                                              self:Dialog_innerPanelShow(count, targetWindowList)
                                              if (CppEnums.ContentsType).Contents_Shop == buttonType then
                                                npcShop_requestList(buttonType)
                                                FGlobal_NodeWarMenuClose()
                                              else
                                                if (CppEnums.ContentsType).Contents_Skill == buttonType then
                                                  if _ContentsGroup_RenewUI_Skill == false then
                                                    HandleMLUp_SkillWindow_OpenForLearn()
                                                  else
                                                    PaGlobalFunc_Skill_Open(true)
                                                  end
                                                else
                                                  if (CppEnums.ContentsType).Contents_Repair == buttonType then
                                                    if _ContentsGroup_RenewUI_Repair == true then
                                                      PaGlobalFunc_RepairInfo_Open()
                                                    else
                                                      PaGlobal_Repair:repair_OpenPanel(true)
                                                    end
                                                  else
                                                    if (CppEnums.ContentsType).Contents_Warehouse == buttonType then
                                                      Warehouse_OpenPanelFromDialog()
                                                    else
                                                      if (CppEnums.ContentsType).Contents_Stable == buttonType then
                                                        if isGuildStable() then
                                                          if (CppEnums.ServantType).Type_Vehicle == stable_getServantType() then
                                                            GuildStableFunction_Open()
                                                          else
                                                            if (CppEnums.ServantType).Type_Ship == stable_getServantType() then
                                                              GuildWharfFunction_Open()
                                                            end
                                                          end
                                                        else
                                                          warehouse_requestInfoFromNpc()
                                                          if (CppEnums.ServantType).Type_Vehicle == stable_getServantType() then
                                                            StableFunction_Open()
                                                          else
                                                            if (CppEnums.ServantType).Type_Ship == stable_getServantType() then
                                                              WharfFunction_Open()
                                                            else
                                                              PetFunction_Open()
                                                              PetList_Open()
                                                            end
                                                          end
                                                        end
                                                        show_DialogPanel()
                                                      else
                                                        if (CppEnums.ContentsType).Contents_Transfer == buttonType then
                                                          DeliveryInformation_OpenPanelFromDialog()
                                                        else
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                              if (CppEnums.ContentsType).Contents_Explore ~= buttonType or (CppEnums.ContentsType).Contents_DeliveryPerson == buttonType then
                                                Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_ReMake"))
                                              else
                                                if (CppEnums.ContentsType).Contents_GuildShop == buttonType then
                                                  npcShop_requestList(buttonType)
                                                else
                                                  if (CppEnums.ContentsType).Contents_ItemMarket == buttonType then
                                                    if Panel_Window_ItemMarket:IsUISubApp() then
                                                      Panel_Window_ItemMarket:CloseUISubApp()
                                                      Panel_Window_ItemMarket:SetShow(false)
                                                    end
                                                    if not Panel_Window_ItemMarket:GetShow() then
                                                      FGolbal_ItemMarket_Function_Open()
                                                    else
                                                      FGolbal_ItemMarket_Function_Close()
                                                    end
                                                  else
                                                    if (CppEnums.ContentsType).Contents_Knowledge == buttonType then
                                                      FGlobal_KnowledgeManagementShow()
                                                    else
                                                      if (CppEnums.ContentsType).Contents_Join == buttonType then
                                                        Panel_Join_Show()
                                                      else
                                                        if (CppEnums.ContentsType).Contents_NpcGift == buttonType then
                                                          FGlobal_NpcGift_Open()
                                                        else
                                                          if (CppEnums.ContentsType).Contents_WeakenEnchant == buttonType then
                                                            PuriManager:Open()
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

Panel_Dialog_Main_Bottom_Info.Dialog_innerPanelShow = function(self, count, targetWindowList)
  -- function num : 0_21
  if count <= 50 then
    return 
  end
  dialog_setPositionSelectList(count)
  local index = 0
  for _,v in pairs(targetWindowList) do
    dialog_setPositionSelectSizeSet(index, v:GetSizeX(), v:GetSizeY())
    index = index + 1
  end
  dialog_calcPositionSelectList()
  index = 0
  for _,v in pairs(targetWindowList) do
    if v:GetShow() == false then
      local pos = dialog_PositionSelect(index)
      if (pos.x ~= 0 or pos.y ~= 0) and (v == Panel_Window_Inventory) then
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

Panel_Dialog_Main_Bottom_Info.Resize = function(self)
  -- function num : 0_22
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  ;
  ((self._ui).static_BottomBG):SetSize(sizeX, ((self._ui).static_BottomBG):GetSizeY())
  ;
  ((self._ui).static_Base_Line):SetSize(sizeX, ((self._ui).static_Base_Line):GetSizeY())
  ;
  ((self._ui).static_BottomBG):ComputePos()
  ;
  ((self._ui).static_ConsoleKeyGuide):ComputePos()
  ;
  ((self._ui).staticText_NPCName):ComputePos()
  ;
  ((self._ui).staticText_NPCTitle):ComputePos()
end

PaGlobalFunc_MainDialog_Bottom_GetLeastFunButtonIndex = function()
  -- function num : 0_23 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  return (self._value).leastFuncButtonIndex
end

PaGlobalFunc_MainDialog_Bottom_SetLeastFunButtonIndex = function(index)
  -- function num : 0_24 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).leastFuncButtonIndex = index
end

PaGlobalFunc_MainDialog_Bottom_ResetLeastFunButtonIndex = function()
  -- function num : 0_25 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).leastFuncButtonIndex = (self._enum).eButtonTypeDefault
end

PaGlobalFunc_MainDialog_Bottom_IsLeastFunButtonDefault = function()
  -- function num : 0_26 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  if (self._value).leastFuncButtonIndex == (self._enum).eButtonTypeDefault then
    return true
  else
    return false
  end
end

PaGlobalFunc_MainDialog_Bottom_InitValue = function()
  -- function num : 0_27 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  self:initValue()
end

PaGlobalFunc_MainDialog_Bottom_Open = function()
  -- function num : 0_28 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  self:open()
end

PaGlobalFunc_MainDialog_Bottom_OpenEndHide = function()
  -- function num : 0_29 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).isHide = false
  self:open()
end

PaGlobalFunc_MainDialog_Bottom_Close = function()
  -- function num : 0_30 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  self:close()
end

PaGlobalFunc_MainDialog_Bottom_Update = function()
  -- function num : 0_31 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  self:update()
end

PaGlobalFunc_MainDialog_Bottom_GetSizeY = function()
  -- function num : 0_32 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  if self._initialize == true then
    return ((self._ui).static_BottomBG):GetSizeY()
  else
    return (self._space).defaultBottomSize
  end
end

PaGlobalFunc_MainDialog_Bottom_FuncButtonUpdate = function()
  -- function num : 0_33 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  self:funcButton_Update(dialogData)
end

PaGlobalFunc_MainDialog_Bottom_HandleClickedGoFirstButton = function()
  -- function num : 0_34 , upvalues : Panel_Dialog_Main_Bottom_Info
  if Panel_Win_System:GetShow() then
    return 
  end
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:enchantClose()
  end
  if check_ShowWindow() then
    close_WindowPanelList()
  end
  if _ContentsGroup_RenewUI_Skill == false and Panel_Window_Skill:IsShow() then
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
  if _ContentsGroup_RenewUI_ReinforceSkill == true then
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
  PaGlobalFunc_MainDialog_Bottom_ResetLeastFunButtonIndex()
  self:hide_SubDialog()
  ReqeustDialog_retryTalk()
end

PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom = function(index)
  -- function num : 0_35 , upvalues : Panel_Dialog_Main_Bottom_Info
  if Panel_Win_System:GetShow() then
    return 
  end
  PaGlobalFunc_Dialog_NPCShop_Close()
  if _ContentsGroup_RenewUI_Skill == false then
    HandleMLUp_SkillWindow_Close()
  end
  Warehouse_Close()
  FGlobal_ItemMarketRegistItem_Close()
  TerritoryAuth_Auction_Close()
  InventoryWindow_Close()
  Panel_Dialogue_Itemtake:SetShow(false)
  LordMenu_Hide()
  CreateClan_Close()
  Manufacture_Close()
  WorkerAuction_Close()
  if _ContentsGroup_RenewUI_ReinforceSkill == true then
    PaGlobalFunc_Dialog_SkillSpecialize_Exit()
  else
    Panel_Window_ReinforceSkill_Close()
    Panel_SkillReinforce_Close()
  end
  FGlobal_NpcGift_Close()
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
  if dialogData == nil then
    return 
  end
  local dlgFuncCnt = dialogData:getFuncButtonCount()
  if dlgFuncCnt <= 0 then
    return 
  end
  local funcButton = dialogData:getFuncButtonAt(index)
  if funcButton == nil then
    return 
  end
  local funcButtonType = tonumber(funcButton._param)
  local self = Panel_Dialog_Main_Bottom_Info
  PaGlobalFunc_MainDialog_Bottom_SetLeastFunButtonIndex(index)
  self:button_Func_Branch(funcButtonType)
  PaGlobalFunc_MainDialog_Right_Close()
  PaGlobalFunc_MainDialog_Quest_Close()
  PaGlobal_TutorialManager:handleClickedDialogFuncButton(funcButtonType)
  Dialog_clickFuncButtonReq(index)
  Panel_Interest_Knowledge_Hide()
end

PaGlobalFunc_MainDialog_Bottom_RandomWorkerSelectUseMyWpConfirm = function(index)
  -- function num : 0_36
  if index == nil then
    index = _indexWhenWorkerShopClicked
  end
  npcShop_requestList((CppEnums.ContentsType).Contents_Shop)
  Dialog_clickFuncButtonReq(index)
  Panel_Interest_Knowledge_Hide()
end

PaGlobalFunc_MainDialog_Bottom_GetFuncPositionNewQuestButton = function()
  -- function num : 0_37 , upvalues : Panel_Dialog_Main_Bottom_Info
  local Position = {_Return = false, _PosX = -1, _PosY = -1}
  local Index = PaGlobalFunc_MainDialog_Bottom_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
  if Index == -1 then
    return Position
  end
  local self = Panel_Dialog_Main_Bottom_Info
  Position._Return = true
  Position._PosX = (((self._ui).btn_Func_List)[Index + 1]):GetPosX()
  Position._PosY = (((self._ui).btn_Func_List)[Index + 1]):GetPosY()
  return Position
end

PaGlobalFunc_MainDialog_Bottom_FindFuncButtonIndexByType = function(targetFuncButtonType)
  -- function num : 0_38
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
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

PaGlobalFunc_MainDialog_Bottom_GetFuncButtonSizeXY = function()
  -- function num : 0_39 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  return (self._size).funcButtonSizeX, (self._size).funcButtonSizeY
end

Toggle_DialogMainTab_forPadEventFunc = function(value)
  -- function num : 0_40 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  local _currentBottomButton = {}
  for ii = 0, self._currentMaxFuncButtonCount - 1 do
    _currentBottomButton[ii] = (((self._ui).btn_Func_List)[ii]).btn_Func
    ;
    (_currentBottomButton[ii]):setRenderTexture((_currentBottomButton[ii]):getBaseTexture())
  end
  self._currentTabIndex = self._currentTabIndex + value
  if self._currentTabIndex < 0 then
    self._currentTabIndex = self._currentMaxFuncButtonCount - 1
  else
    if self._currentMaxFuncButtonCount - 1 < self._currentTabIndex then
      self._currentTabIndex = 0
    end
  end
  ;
  (_currentBottomButton[self._currentTabIndex]):setRenderTexture((_currentBottomButton[self._currentTabIndex]):getOnTexture())
end

Toggle_DialogMainTab_Enter = function()
  -- function num : 0_41 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  if self._currentTabIndex == 0 then
    PaGlobalFunc_MainDialog_Bottom_HandleClickedGoFirstButton()
  else
    PaGlobalFunc_MainDialog_Bottom_HandleClickedFuncButtonBottom(self._currentTabIndex - 1)
  end
end

PaGlobalFunc_Main_Dialog_Bottom_Index_Init = function()
  -- function num : 0_42 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  Toggle_DialogMainTab_forPadEventFunc(self._currentTabIndex)
  self._currentTabIndex = 0
end

Panel_Dialog_Main:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_MainDialog_Bottom_HandleClickedGoFirstButton()")
Panel_Dialog_Main:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "Toggle_DialogMainTab_forPadEventFunc(-1)")
Panel_Dialog_Main:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "Toggle_DialogMainTab_forPadEventFunc(1)")
Panel_Dialog_Main:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "Toggle_DialogMainTab_Enter()")
FromClient_InitMainDialog_Bottom = function()
  -- function num : 0_43 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  self:initialize()
  self:Resize()
end

FromClient_onScreenResize_MainDialog_Bottom = function()
  -- function num : 0_44 , upvalues : Panel_Dialog_Main_Bottom_Info
  local self = Panel_Dialog_Main_Bottom_Info
  self:Resize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog_Bottom")

