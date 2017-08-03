-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap\workerrandomselect\ui_new_workerrandomselect.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local ENT = CppEnums.ExplorationNodeType
local UI_color = Defines.Color
local UI_TYPE = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
Panel_Window_WorkerRandomSelect:ActiveMouseEventEffect(true)
Panel_Window_WorkerRandomSelect:setGlassBackground(true)
local _selectSlotNo = -1
local _selectWorkPrice = 0
local panelBG = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "Static_WorkerRandomSelectBG")
panelBG:ActiveMouseEventEffect(true)
panelBG:setGlassBackground(true)
local _workerPicture = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "Static_WorkerPicture")
local _workerActionCount = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_ActionValue")
local _workerMoveSpeed = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_MoveSpeedValue")
local _workerWorkingSpeed = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_WorkSpeedValue")
local _workerLucky = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_LuckyValue")
local _workerRandomName = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_WokerRandomSelectName1")
local _workerLevel = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_Lev")
local _workerPriceNameTag = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_EmploymentPriceTitle")
local _workerPrice = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_Gold_Icon3")
local _workerCountEmployment = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_WorkerEmployment")
local _workerCountValue = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_WorkerEmploymentValue")
local _workerInventoryMoney = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_MyMoney")
local _workerWareHouseInventoryMoney = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "StaticText_MyWareHouseMoney")
local _workerButtonReSelect = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "Button_WorkerReSelect")
local _workerButtonSelect = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "Button_WorkerSelect")
local _workerInventoryMoneyButton = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "RadioButton_InventoryMoney")
local _workerWareHouseInventoryMoneyButton = (UI.getChildControl)(Panel_Window_WorkerRandomSelect, "RadioButton_WareHouseMoney")
_workerInventoryMoneyButton:SetEnableArea(0, 0, 300, _workerInventoryMoneyButton:GetSizeY())
_workerWareHouseInventoryMoneyButton:SetEnableArea(0, 0, 300, _workerWareHouseInventoryMoneyButton:GetSizeY())
workerRandomShopShow = function(workerShopSlotNo)
  -- function num : 0_0 , upvalues : _selectSlotNo, _selectWorkPrice, _workerPicture, _workerActionCount, _workerLucky, _workerMoveSpeed, _workerWorkingSpeed, _workerPrice, _workerRandomName, _workerInventoryMoney, _workerWareHouseInventoryMoney, _workerPriceNameTag, _workerCountValue, _workerButtonReSelect, _workerInventoryMoneyButton, _workerWareHouseInventoryMoneyButton, _workerButtonSelect, _workerCountEmployment
  local sellCount = npcShop_getBuyCount()
  local selfPlayer = getSelfPlayer()
  local pcPosition = (selfPlayer:get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  local MyWp = selfPlayer:getWp()
  local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
  local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
  local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
  for ii = 0, sellCount - 1 do
    local itemwrapper = npcShop_getItemBuy(ii)
    local shopItem = itemwrapper:get()
    if workerShopSlotNo == shopItem.shopSlotNo then
      _selectSlotNo = shopItem.shopSlotNo
      _selectWorkPrice = shopItem.price_s64
      plantWorkerSS = itemwrapper:getPlantWorkerStaticStatus()
      efficiency = plantWorkerSS:getEfficiency(2, ItemExchangeKey(0))
      local plantWorkerGrade = ((plantWorkerSS:getCharacterStaticStatus())._gradeType):get()
      if (CppEnums.CharacterGradeType).CharacterGradeType_Normal == plantWorkerGrade then
        workerColorSet = "<PAColor0xffc4bebe>"
      else
        if (CppEnums.CharacterGradeType).CharacterGradeType_Elite == plantWorkerGrade then
          workerColorSet = "<PAColor0xFF5DFF70>"
        else
          if (CppEnums.CharacterGradeType).CharacterGradeType_Hero == plantWorkerGrade then
            workerColorSet = "<PAColor0xFF4B97FF>"
          else
            if (CppEnums.CharacterGradeType).CharacterGradeType_Legend == plantWorkerGrade then
              workerColorSet = "<PAColor0xFFFFC832>"
            else
              if (CppEnums.CharacterGradeType).CharacterGradeType_Boss == plantWorkerGrade then
                workerColorSet = "<PAColor0xFFFF6C00>"
              else
                if (CppEnums.CharacterGradeType).CharacterGradeType_Assistant == plantWorkerGrade then
                  workerColorSet = "<PAColor0xffc4bebe>"
                else
                  workerColorSet = "<PAColor0xffc4bebe>"
                end
              end
            end
          end
        end
      end
      if plantWorkerSS ~= nil then
        local workerIconPath = getWorkerIcon(plantWorkerSS)
        _workerPicture:ChangeTextureInfoName(workerIconPath)
        _workerActionCount:SetText(plantWorkerSS._actionPoint)
        _workerLucky:SetText(plantWorkerSS._luck / 10000)
        _workerMoveSpeed:SetText(plantWorkerSS._moveSpeed / 100)
        _workerWorkingSpeed:SetText(efficiency / 1000000)
        _workerPrice:SetText(makeDotMoney(shopItem.price_s64))
        _workerRandomName:SetText(workerColorSet .. getWorkerName(plantWorkerSS) .. "<PAOldColor>")
        local myInvenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
        local myWareHouseMoney = warehouse_moneyFromNpcShop_s64()
        _workerInventoryMoney:SetText(makeDotMoney(myInvenMoney))
        _workerWareHouseInventoryMoney:SetText(makeDotMoney(myWareHouseMoney))
      end
    end
  end
  _workerPrice:SetPosX(_workerPriceNameTag:GetPosX() + _workerPriceNameTag:GetTextSizeX() + 5)
  _workerCountValue:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_WORKERCOUNTVALUE", "value", maxWorkerCount - waitWorkerCount))
  if MyWp < 10 then
    _workerButtonReSelect:SetEnable(false)
    _workerButtonReSelect:SetMonoTone(true)
  else
    _workerButtonReSelect:SetEnable(true)
    _workerButtonReSelect:SetMonoTone(false)
  end
  if ToClient_HasWareHouseFromNpc() then
    if toInt64(0, 0) == warehouse_moneyFromNpcShop_s64() then
      _workerInventoryMoneyButton:SetCheck(true)
      _workerWareHouseInventoryMoneyButton:SetCheck(false)
    else
      _workerInventoryMoneyButton:SetCheck(false)
      _workerWareHouseInventoryMoneyButton:SetCheck(true)
    end
  else
    _workerInventoryMoneyButton:SetCheck(false)
    _workerWareHouseInventoryMoneyButton:SetCheck(true)
  end
  local btnReSelectSizeX = _workerButtonReSelect:GetSizeX() + 23
  local btnReSelectTextPosX = btnReSelectSizeX - btnReSelectSizeX / 2 - _workerButtonReSelect:GetTextSizeX() / 2
  _workerButtonReSelect:SetTextSpan(btnReSelectTextPosX, 5)
  local btnSelectSizeX = _workerButtonSelect:GetSizeX() + 23
  local btnSelectTextPosX = btnSelectSizeX - btnSelectSizeX / 2 - _workerButtonSelect:GetTextSizeX() / 2
  _workerButtonSelect:SetTextSpan(btnSelectTextPosX, 5)
  _workerInventoryMoney:SetPosX(_workerInventoryMoneyButton:GetPosX() + _workerInventoryMoneyButton:GetTextSizeX() + 35)
  _workerWareHouseInventoryMoney:SetPosX(_workerWareHouseInventoryMoneyButton:GetPosX() + _workerWareHouseInventoryMoneyButton:GetTextSizeX() + 35)
  _workerCountValue:SetPosX(_workerCountEmployment:GetPosX() + _workerCountEmployment:GetTextSizeX() + 5)
  workerRandomSelectShow()
end

workerRandomSelectShow = function()
  -- function num : 0_1
  Panel_Window_WorkerRandomSelect:SetShow(true)
end

workerRandomSelectHide = function()
  -- function num : 0_2
  Panel_Window_WorkerRandomSelect:SetShow(false)
end

click_WorkerReSelect = function()
  -- function num : 0_3
  local pcPosition = ((getSelfPlayer()):get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  local region = regionInfo:get()
  local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
  local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
  local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
  do
    if waitWorkerCount == maxWorkerCount then
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
      return 
    end
    local contentString = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect_Question") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_NOWWP", "getWp", (getSelfPlayer()):getWp())
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"), content = contentString, functionYes = Worker_RequestShopList, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
end

Worker_RequestShopList = function()
  -- function num : 0_4 , upvalues : _workerButtonReSelect
  local myWp = (getSelfPlayer()):getWp()
  if myWp < 5 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_SHORTAGE_WP_ACK"))
    workerRandomSelectHide()
  else
    npcShop_requestList((CppEnums.ContentsType).Contents_Shop)
    if myWp < 5 then
      _workerButtonReSelect:SetEnable(false)
      _workerButtonReSelect:SetMonoTone(true)
    else
      _workerButtonReSelect:SetEnable(true)
      _workerButtonReSelect:SetMonoTone(false)
    end
  end
end

click_WorkerSelect = function()
  -- function num : 0_5 , upvalues : _selectWorkPrice, _workerInventoryMoneyButton, _workerWareHouseInventoryMoneyButton
  local selfPlayer = getSelfPlayer()
  local myInvenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
  local myWareHouseMoney = warehouse_moneyFromNpcShop_s64()
  if (myInvenMoney < _selectWorkPrice and _workerInventoryMoneyButton:IsCheck()) or myWareHouseMoney < _selectWorkPrice and _workerWareHouseInventoryMoneyButton:IsCheck() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_ACK_MAKEBOOK"))
  else
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Employ"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Employ_Question"), functionYes = Worker_RequestDoBuy, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
end

Worker_RequestDoBuy = function()
  -- function num : 0_6 , upvalues : _workerWareHouseInventoryMoneyButton, _selectSlotNo
  local fromWhereType = 0
  if _workerWareHouseInventoryMoneyButton:IsCheck() then
    fromWhereType = 2
  end
  npcShop_doBuy(_selectSlotNo, 1, fromWhereType, 0, false)
  Panel_MyHouseNavi_Update(true)
  _selectSlotNo = -1
  Panel_Window_WorkerRandomSelect:SetShow(false)
end

workerShop_GuildCheckByBuy = function()
  -- function num : 0_7
  local isPass = true
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_NPCSHOP_GUILD1"))
    isPass = false
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  if guildGrade == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_NPCSHOP_GUILD2"))
    isPass = false
  end
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if not isGuildMaster and not isGuildSubMaster then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_NPCSHOP_GUILD3"))
    isPass = false
  end
  return isPass
end

workerShop_registEventHandler = function()
  -- function num : 0_8 , upvalues : _workerButtonReSelect, _workerButtonSelect, _workerInventoryMoneyButton, _workerWareHouseInventoryMoneyButton
  _workerButtonReSelect:addInputEvent("Mouse_LUp", "click_WorkerReSelect()")
  _workerButtonSelect:addInputEvent("Mouse_LUp", "click_WorkerSelect()")
  _workerInventoryMoneyButton:addInputEvent("Mouse_LUp", "WorkerShop_CheckFromMoney( 0 )")
  _workerWareHouseInventoryMoneyButton:addInputEvent("Mouse_LUp", "WorkerShop_CheckFromMoney( 1 )")
  _workerInventoryMoneyButton:addInputEvent("Mouse_On", "workerShop_SimpleTooltips( 0, true )")
  _workerInventoryMoneyButton:addInputEvent("Mouse_Out", "workerShop_SimpleTooltips( false )")
  _workerWareHouseInventoryMoneyButton:addInputEvent("Mouse_On", "workerShop_SimpleTooltips( 1, true )")
  _workerWareHouseInventoryMoneyButton:addInputEvent("Mouse_Out", "workerShop_SimpleTooltips( false )")
  _workerInventoryMoneyButton:setTooltipEventRegistFunc("workerShop_SimpleTooltips( 0, true )")
  _workerWareHouseInventoryMoneyButton:setTooltipEventRegistFunc("workerShop_SimpleTooltips( 1, true )")
end

WorkerShop_CheckFromMoney = function(check)
  -- function num : 0_9 , upvalues : _workerInventoryMoneyButton, _workerWareHouseInventoryMoneyButton
  if check == 0 then
    if _workerInventoryMoneyButton:IsCheck() then
      _workerWareHouseInventoryMoneyButton:SetCheck(false)
    else
      _workerWareHouseInventoryMoneyButton:SetCheck(true)
    end
  else
    if _workerWareHouseInventoryMoneyButton:IsCheck() then
      _workerInventoryMoneyButton:SetCheck(false)
    else
      _workerInventoryMoneyButton:SetCheck(true)
    end
  end
end

workerShop_SimpleTooltips = function(tipType, isShow)
  -- function num : 0_10 , upvalues : _workerInventoryMoneyButton, _workerWareHouseInventoryMoneyButton
  local name, desc, control = nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_INVEN_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_INVEN_DESC")
    control = _workerInventoryMoneyButton
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_WAREHOUSE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_WAREHOUSE_DESC")
      control = _workerWareHouseInventoryMoneyButton
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

FromClient_EventRandomShopShow_Worker = function(shoType, slotNo)
  -- function num : 0_11
  if shoType == 7 then
    workerRandomShopShow(slotNo)
  end
end

registerEvent("FromClient_EventRandomShopShow", "FromClient_EventRandomShopShow_Worker")
workerShop_registEventHandler()

