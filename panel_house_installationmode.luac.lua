-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\housing\panel_house_installationmode.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_CCC = CppEnums.CashProductCategory
local UI_CIT = CppEnums.InstallationType
local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
Panel_House_InstallationMode:SetShow(false)
local renderMode = (RenderModeWrapper.new)(99, {(Defines.RenderMode).eRenderMode_HouseInstallation}, false)
local HouseInstallation = {panelTitle = (UI.getChildControl)(Panel_House_InstallationMode, "Static_Title"), installedObjectCount = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InstalledObject"), bg_Menu = (UI.getChildControl)(Panel_House_InstallationMode, "Static_MenuBG"), bg_Menu_Top = (UI.getChildControl)(Panel_House_InstallationMode, "Static_MenuTopBG"), radio_AttAll = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_AttributeAll"), radio_AttFloor = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_AttributeFloor"), radio_AttWall = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_AttributeWall"), radio_AttAllHarvest = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_AttributeAllHarvest"), radio_AttHarvest = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_AttributeHarvest"), radio_AttOthers = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_AttributeOthers"), radio_AttTabel = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_AttributeTabel"), edit_ItemName = (UI.getChildControl)(Panel_House_InstallationMode, "Edit_ItemName"), btn_Search = (UI.getChildControl)(Panel_House_InstallationMode, "Button_Search"), bg_Menu_Bottom = (UI.getChildControl)(Panel_House_InstallationMode, "Static_Menu_BottomBG"), btn_Exit = (UI.getChildControl)(Panel_House_InstallationMode, "Button_Exit"), btn_RotateLeft = (UI.getChildControl)(Panel_House_InstallationMode, "Button_CameraRotation_Left"), btn_RotateRight = (UI.getChildControl)(Panel_House_InstallationMode, "Button_CameraRotation_Right"), btn_RotateAngle = (UI.getChildControl)(Panel_House_InstallationMode, "CheckButton_ObjectRotateAngle45"), btn_ResetArrangement = (UI.getChildControl)(Panel_House_InstallationMode, "Button_ResetFurniture"), btn_ExitInstallMode = (UI.getChildControl)(Panel_House_InstallationMode, "Button_ExitInstallMode"), bg_List = (UI.getChildControl)(Panel_House_InstallationMode, "Static_ListBG"), scroll = (UI.getChildControl)(Panel_House_InstallationMode, "Scroll_List"), _staticBackFloor = (UI.getChildControl)(Panel_House_InstallationMode, "Static_BackFloor"), _staticTextFloor = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_Floor"), _radioBtnFirstFloor = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_FirstFloor"), _radioBtnSecondFloor = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_SecondFloor"), _radioBtnThirdFloor = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_ThirdFloor"), _radioBtnFourFloor = (UI.getChildControl)(Panel_House_InstallationMode, "RadioButton_FourFloor"), _staticInteriorSensePoint = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorSensePoint"), InteriorPointBG = (UI.getChildControl)(Panel_House_InstallationMode, "Static_InteriorPointBG"), InteriorPointBaseText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointBase"), InteriorPointOptionText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointOption"), InteriorPointBonusText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointBonus"), InteriorPointTotalText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointTotal"), InteriorPointBaseValueText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointBaseValue"), InteriorPointOptionValueText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointOptionValue"), InteriorPointBonusValueText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointBonusValue"), InteriorPointTotalValueText = (UI.getChildControl)(Panel_House_InstallationMode, "StaticText_InteriorPointTotalValue"), maxSlotCount = 36, 
slotUIPool = {}
, maxInterval = 0, nowInterval = 0, filter_ItemType = -1, filter_SearchKeyword = "", dataCount = 0, 
SlotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true, createCash = true}
, _isModeShow = false, isInstallMode = false, houseInstallationMode = false, deleteItemIdx = nil, _isMyHouse = false}
;
(HouseInstallation.bg_List):setGlassBackground(true)
;
(HouseInstallation.bg_Menu):setGlassBackground(true)
;
(HouseInstallation._staticInteriorSensePoint):SetFontColor(4293914607)
;
(HouseInstallation._staticInteriorSensePoint):useGlowFont(true, "BaseFont_10_Glow", 4292411606)
;
(HouseInstallation._staticInteriorSensePoint):SetShow(false)
HouseInstallation.scrollCTRLBTN = (UI.getChildControl)(HouseInstallation.scroll, "Scroll_CtrlButton")
local buttonEum = {All = 0, Floor = 1, Wall = 2, Table = 3, AllHarvest = 4, Harvest = 5, Tool = 6, Rotate_Right = 7, Rotate_Left = 8, RotateAngle_45 = 9, Reset = 10}
local Template = {nomalIconBG = (UI.getChildControl)(Panel_House_InstallationMode, "Template_Static_HaveFurnitureIconBG"), cashIconBG = (UI.getChildControl)(Panel_House_InstallationMode, "Template_Static_CashIconBG"), installedIcon = (UI.getChildControl)(Panel_House_InstallationMode, "Template_Static_IsInstalled"), slot = (UI.getChildControl)(Panel_House_InstallationMode, "Template_Static_Slot")}
local furnitureData = (Array.new)()
HouseInstallation.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_PUCT, Template
  local do_Initialize = function()
    -- function num : 0_0_0 , upvalues : self
    (self.bg_Menu):AddChild(self.bg_Menu_Top)
    ;
    (self.bg_Menu):AddChild(self.bg_Menu_Bottom)
    Panel_House_InstallationMode:RemoveControl(self.bg_Menu_Top)
    Panel_House_InstallationMode:RemoveControl(self.bg_Menu_Bottom)
    Panel_House_InstallationMode:RemoveControl(self._staticTextFloor)
    Panel_House_InstallationMode:RemoveControl(self._radioBtnFirstFloor)
    Panel_House_InstallationMode:RemoveControl(self._radioBtnSecondFloor)
    Panel_House_InstallationMode:RemoveControl(self._radioBtnThirdFloor)
    Panel_House_InstallationMode:RemoveControl(self._radioBtnFourFloor)
    ;
    (self._staticBackFloor):AddChild(self._staticTextFloor)
    ;
    (self._staticBackFloor):AddChild(self._radioBtnFirstFloor)
    ;
    (self._staticBackFloor):AddChild(self._radioBtnSecondFloor)
    ;
    (self._staticBackFloor):AddChild(self._radioBtnThirdFloor)
    ;
    (self._staticBackFloor):AddChild(self._radioBtnFourFloor)
    Panel_House_InstallationMode:RemoveControl(self.radio_AttAll)
    Panel_House_InstallationMode:RemoveControl(self.radio_AttFloor)
    Panel_House_InstallationMode:RemoveControl(self.radio_AttWall)
    Panel_House_InstallationMode:RemoveControl(self.radio_AttTabel)
    Panel_House_InstallationMode:RemoveControl(self.radio_AttAllHarvest)
    Panel_House_InstallationMode:RemoveControl(self.radio_AttHarvest)
    Panel_House_InstallationMode:RemoveControl(self.radio_AttOthers)
    Panel_House_InstallationMode:RemoveControl(self.edit_ItemName)
    Panel_House_InstallationMode:RemoveControl(self.btn_Search)
    ;
    (self.bg_Menu_Top):AddChild(self.radio_AttAll)
    ;
    (self.bg_Menu_Top):AddChild(self.radio_AttFloor)
    ;
    (self.bg_Menu_Top):AddChild(self.radio_AttWall)
    ;
    (self.bg_Menu_Top):AddChild(self.radio_AttTabel)
    ;
    (self.bg_Menu_Top):AddChild(self.radio_AttAllHarvest)
    ;
    (self.bg_Menu_Top):AddChild(self.radio_AttHarvest)
    ;
    (self.bg_Menu_Top):AddChild(self.radio_AttOthers)
    ;
    (self.bg_Menu_Top):AddChild(self.edit_ItemName)
    ;
    (self.bg_Menu_Top):AddChild(self.btn_Search)
    Panel_House_InstallationMode:RemoveControl(self.btn_Exit)
    Panel_House_InstallationMode:RemoveControl(self.btn_RotateLeft)
    Panel_House_InstallationMode:RemoveControl(self.btn_RotateRight)
    Panel_House_InstallationMode:RemoveControl(self.btn_RotateAngle)
    Panel_House_InstallationMode:RemoveControl(self.btn_ResetArrangement)
    ;
    (self.bg_Menu_Bottom):AddChild(self.btn_Exit)
    ;
    (self.bg_Menu_Bottom):AddChild(self.btn_RotateLeft)
    ;
    (self.bg_Menu_Bottom):AddChild(self.btn_RotateRight)
    ;
    (self.bg_Menu_Bottom):AddChild(self.btn_RotateAngle)
    ;
    (self.bg_Menu_Bottom):AddChild(self.btn_ResetArrangement)
    Panel_House_InstallationMode:RemoveControl(self.scroll)
    ;
    (self.bg_List):AddChild(self.scroll)
    ;
    (self.bg_Menu):SetVerticalBottom()
    ;
    (self.bg_Menu_Top):SetPosX(5)
    ;
    (self.bg_Menu_Top):SetPosY(5)
    local _menuTopPosX = 5
    local _menuTopPosY = 5
    ;
    (self.radio_AttAll):SetPosX(_menuTopPosX)
    ;
    (self.radio_AttAll):SetPosY(_menuTopPosY)
    ;
    (self.radio_AttAllHarvest):SetPosX(_menuTopPosX)
    ;
    (self.radio_AttAllHarvest):SetPosY(_menuTopPosY)
    _menuTopPosX = _menuTopPosX + (self.radio_AttAll):GetSizeX() + 3
    ;
    (self.radio_AttFloor):SetPosX(_menuTopPosX)
    ;
    (self.radio_AttFloor):SetPosY(_menuTopPosY)
    ;
    (self.radio_AttHarvest):SetPosX(_menuTopPosX)
    ;
    (self.radio_AttHarvest):SetPosY(_menuTopPosY)
    _menuTopPosX = _menuTopPosX + (self.radio_AttFloor):GetSizeX() + 3
    ;
    (self.radio_AttWall):SetPosX(_menuTopPosX)
    ;
    (self.radio_AttWall):SetPosY(_menuTopPosY)
    ;
    (self.radio_AttOthers):SetPosX(_menuTopPosX)
    ;
    (self.radio_AttOthers):SetPosY(_menuTopPosY)
    _menuTopPosX = _menuTopPosX + (self.radio_AttWall):GetSizeX() + 3
    ;
    (self.radio_AttTabel):SetPosX(_menuTopPosX)
    ;
    (self.radio_AttTabel):SetPosY(_menuTopPosY)
    _menuTopPosX = _menuTopPosX + (self.radio_AttTabel):GetSizeX() + 3
    _menuTopPosX = 10
    _menuTopPosY = _menuTopPosY + (self.radio_AttAll):GetSizeY() + 5
    ;
    (self.edit_ItemName):SetPosX(_menuTopPosX)
    ;
    (self.edit_ItemName):SetPosY(_menuTopPosY)
    _menuTopPosX = _menuTopPosX + (self.edit_ItemName):GetSizeX() + 2
    ;
    (self.btn_Search):SetPosX(_menuTopPosX)
    ;
    (self.btn_Search):SetPosY(_menuTopPosY)
    ;
    (self.bg_Menu_Bottom):SetPosX(5)
    ;
    (self.bg_Menu_Bottom):SetPosY((self.bg_Menu_Top):GetPosY() + (self.bg_Menu_Top):GetSizeY() + 5)
    local _menuBottomPosX = 5
    local _menuBottomPosY = 5
    ;
    (self.btn_Exit):SetPosX(_menuBottomPosX)
    ;
    (self.btn_Exit):SetPosY(_menuBottomPosY)
    _menuBottomPosX = _menuBottomPosX + (self.btn_Exit):GetSizeX() + 7
    ;
    (self.btn_RotateRight):SetPosX(_menuBottomPosX)
    ;
    (self.btn_RotateRight):SetPosY(_menuBottomPosY)
    _menuBottomPosX = _menuBottomPosX + (self.btn_RotateRight):GetSizeX() + 3
    ;
    (self.btn_RotateLeft):SetPosX(_menuBottomPosX)
    ;
    (self.btn_RotateLeft):SetPosY(_menuBottomPosY)
    _menuBottomPosX = _menuBottomPosX + (self.btn_RotateLeft):GetSizeX() + 3
    ;
    (self.btn_RotateAngle):SetPosX(_menuBottomPosX)
    ;
    (self.btn_RotateAngle):SetPosY(_menuBottomPosY)
    _menuBottomPosX = _menuBottomPosX + (self.btn_RotateAngle):GetSizeX() + 3
    ;
    (self.btn_ResetArrangement):SetPosX(_menuBottomPosX)
    ;
    (self.btn_ResetArrangement):SetPosY(_menuBottomPosY)
    ;
    (self.bg_List):SetVerticalBottom()
  end

  do_Initialize()
  local SlotStartX = 12
  local SlotStartY = 7
  local SlotGapX = 55
  local SlotGapY = 55
  local SlotCols = 18
  local do_MakeSlot = function()
    -- function num : 0_0_1 , upvalues : self, SlotCols, SlotStartX, SlotGapX, SlotStartY, SlotGapY, UI_PUCT, Template
    for slot_Idx = 0, self.maxSlotCount - 1 do
      local tempArray = {}
      local col = slot_Idx % SlotCols
      local row = (math.floor)(slot_Idx / SlotCols)
      local posX = SlotStartX + SlotGapX * col
      local posY = SlotStartY + SlotGapY * row
      local created_normalSlot = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.bg_List, "Panel_House_Installation_normalSlot_" .. slot_Idx)
      CopyBaseProperty(Template.nomalIconBG, created_normalSlot)
      created_normalSlot:SetShow(true)
      created_normalSlot:SetPosX(posX)
      created_normalSlot:SetPosY(posY)
      tempArray.normalBG = created_normalSlot
      local created_cashSlot = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.bg_List, "Panel_House_Installation_cashSlot_" .. slot_Idx)
      CopyBaseProperty(Template.cashIconBG, created_cashSlot)
      created_cashSlot:SetShow(false)
      created_cashSlot:SetPosX(posX)
      created_cashSlot:SetPosY(posY)
      tempArray.cashBG = created_cashSlot
      local slot = {}
      ;
      (SlotItem.new)(slot, "Panel_House_Installation_SlotItem_" .. slot_Idx, slot_Idx, self.bg_List, self.SlotConfig)
      slot:createChild()
      ;
      (slot.icon):SetPosX(posX + 3)
      ;
      (slot.icon):SetPosY(posY + 3)
      ;
      (slot.icon):SetShow(false)
      tempArray.slotItem = slot
      local created_InstalledMark = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.bg_List, "Panel_House_Installation_InstalledMark_" .. slot_Idx)
      CopyBaseProperty(Template.installedIcon, created_InstalledMark)
      created_InstalledMark:SetShow(false)
      created_InstalledMark:SetIgnore(true)
      created_InstalledMark:SetPosX((slot.icon):GetPosX() + (slot.icon):GetSizeX() - created_InstalledMark:GetSizeX() + 5)
      created_InstalledMark:SetPosY((slot.icon):GetPosY() + (slot.icon):GetSizeY() - created_InstalledMark:GetSizeY() + 5)
      tempArray.installedMark = created_InstalledMark
      -- DECOMPILER ERROR at PC150: Confused about usage of register: R13 in 'UnsetPending'

      ;
      (self.slotUIPool)[slot_Idx] = tempArray
    end
  end

  do_MakeSlot()
  ;
  (self.scroll):SetControlTop()
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
end

HouseInstallation.SetPosition = function(self)
  -- function num : 0_1
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  Panel_House_InstallationMode:SetSize(scrSizeX, scrSizeY)
  ;
  (self.bg_Menu):ComputePos()
  ;
  (self.bg_List):ComputePos()
  ;
  (self.scroll):ComputePos()
  ;
  (self.btn_ExitInstallMode):ComputePos()
  ;
  (self._staticBackFloor):SetPosX((self.installedObjectCount):GetPosX() + 10)
  ;
  (self._staticBackFloor):SetPosY((self.installedObjectCount):GetPosY() + (self.installedObjectCount):GetSizeY())
end

HouseInstallation.CheckFilter = function(self, objectStaticStatusWrapper, itemSS)
  -- function num : 0_2
  local installPosition = -1
  local isFilterPass = true
  if self.houseInstallationMode then
    if objectStaticStatusWrapper:isInstallableOnFloor() then
      installPosition = 0
    else
      if objectStaticStatusWrapper:isInstallableOnWall() then
        installPosition = 1
      else
        if objectStaticStatusWrapper:isInstallableOnTheTable() then
          installPosition = 2
        end
      end
    end
  else
    if (CppEnums.InstallationType).eType_Havest == objectStaticStatusWrapper:getInstallationType() then
      installPosition = 0
    else
      if (CppEnums.InstallationType).eType_LivestockHarvest == objectStaticStatusWrapper:getInstallationType() then
        installPosition = 0
      else
        if (CppEnums.InstallationType).eType_Scarecrow == objectStaticStatusWrapper:getInstallationType() then
          installPosition = 1
        else
          if (CppEnums.InstallationType).eType_Waterway == objectStaticStatusWrapper:getInstallationType() then
            installPosition = 1
          else
            isFilterPass = false
          end
        end
      end
    end
  end
  if self.filter_ItemType ~= -1 and installPosition ~= self.filter_ItemType then
    isFilterPass = false
  else
    if self.filter_SearchKeyword ~= "" and (string.find)(itemSS:getName(), self.filter_SearchKeyword) == nil then
      isFilterPass = false
    end
  end
  return isFilterPass
end

HouseInstallation.SetData = function(self)
  -- function num : 0_3 , upvalues : furnitureData, HouseInstallation, UI_CCC, UI_CIT
  furnitureData = (Array.new)()
  if HouseInstallation._isMyHouse == true or self.houseInstallationMode == false then
    local houseWrapper = housing_getHouseholdActor_CurrentPosition()
    if houseWrapper ~= nil then
      local installedItemCount = houseWrapper:getInstallationCount()
      do
        for installed_Idx = 0, installedItemCount do
          do
            local actorKeyRaw = houseWrapper:getInstallationActorKeyRaw(installed_Idx)
            do
              local installationActorWrapper = getInstallationActor(actorKeyRaw)
              do
                if installationActorWrapper ~= nil then
                  local cssWrapper = installationActorWrapper:getStaticStatusWrapper()
                  local itemSSW = cssWrapper:getItemEnchantStatcStaticWrapper()
                  local objectStaticStatus = cssWrapper:getObjectStaticStatus()
                  if self:CheckFilter(objectStaticStatus, itemSSW) == true then
                    do
                      furnitureData:push_back({name = itemSSW:getName(), iconPath = itemSSW:getIconPath(), installPos = installPosition, desc = nil, isCashProduct = false, isInstalled = true, productNoRaw = 0, invenType = 0, invenSlotNo = installed_Idx})
                      -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
              -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
        local inven_normalNo = 0
        local inven_cashNo = 17
        local selfPlayerWrapper = getSelfPlayer()
        local selfPlayer = selfPlayerWrapper:get()
        local get_inventoryInfo = function(invenType)
    -- function num : 0_3_0 , upvalues : selfPlayer
    local inventory = selfPlayer:getInventoryByType(invenType)
    local inventorySize = inventory:size()
    return inventory, inventorySize
  end

        local inven_Normal, invenSize_Normal = get_inventoryInfo(inven_normalNo)
        local inven_Cash, invenSize_Cash = get_inventoryInfo(inven_cashNo)
        for normal_Idx = 0, invenSize_Normal - 1 do
          local itemWrapper = getInventoryItemByType(inven_normalNo, normal_Idx)
          if itemWrapper ~= nil then
            local itemSSW = itemWrapper:getStaticStatus()
            local cssWrapper = itemSSW:getCharacterStaticStatus()
            if ((itemWrapper:getStaticStatus()):get()):isItemInstallation() then
              local objectStaticStatus = cssWrapper:getObjectStaticStatus()
              local isFixedHouseElement = (CppEnums.InstallationType).eType_Havest ~= objectStaticStatus:getInstallationType() and (CppEnums.InstallationType).eType_LivestockHarvest ~= objectStaticStatus:getInstallationType() and (CppEnums.InstallationType).eType_Scarecrow ~= objectStaticStatus:getInstallationType() and (CppEnums.InstallationType).eType_Waterway ~= objectStaticStatus:getInstallationType()
              if isFixedHouseElement == self.houseInstallationMode then
                local itemSS = itemWrapper:getStaticStatus()
                if self:CheckFilter(objectStaticStatus, itemSS) == true then
                  furnitureData:push_back({name = itemSS:getName(), iconPath = itemSS:getIconPath(), installPos = installPosition, desc = itemSS:getDescription(), isCashProduct = false, isInstalled = false, productNoRaw = 0, invenType = inven_normalNo, invenSlotNo = normal_Idx})
                end
              end
            end
          end
        end
        for cash_Idx = 0, invenSize_Cash - 1 do
          local itemWrapper = getInventoryItemByType(inven_cashNo, cash_Idx)
          if itemWrapper ~= nil and ((itemWrapper:getStaticStatus()):get()):isItemInstallation() and not (((itemWrapper:getStaticStatus()):getCharacterStaticStatus()):getObjectStaticStatus()):isHarvest() then
            local itemSS = itemWrapper:getStaticStatus()
            local objectStaticStatus = ((itemWrapper:getStaticStatus()):getCharacterStaticStatus()):getObjectStaticStatus()
            if self:CheckFilter(objectStaticStatus, itemSS) == true then
              furnitureData:push_back({name = itemSS:getName(), iconPath = itemSS:getIconPath(), installPos = installPosition, desc = itemSS:getDescription(), isCashProduct = false, isInstalled = false, productNoRaw = 0, invenType = inven_cashNo, invenSlotNo = cash_Idx})
            end
          end
        end
      end
    end
  end
  if FGlobal_IsCommercialService() then
    local count = (getIngameCashMall()):getCashProductStaticStatusListCount()
    for index = 0, count - 1 do
      local cashProductStaticStatus = (getIngameCashMall()):getCashProductStaticStatusByIndex(index)
      if UI_CCC.eCashProductCategory_Furniture == cashProductStaticStatus:getMainCategory() and cashProductStaticStatus:getItemListCount() < 2 then
        local itemSS = cashProductStaticStatus:getItemByIndex(0)
        if itemSS ~= nil and (itemSS:get()):isItemInstallation() then
          local objectStaticStatus = (itemSS:getCharacterStaticStatus()):getObjectStaticStatus()
          local installationType = objectStaticStatus:getInstallationType()
          local startSaleTime = cashProductStaticStatus:getStartSellTime()
          local startSaleTime_s32 = Int64toInt32(getLeftSecond_TTime64(startSaleTime))
          local endSaleTime = cashProductStaticStatus:getEndSellTime()
          local endSaleTime_s32 = Int64toInt32(getLeftSecond_TTime64(endSaleTime))
          local isSellTimePass = (not cashProductStaticStatus:isSellTimeBefore() and not cashProductStaticStatus:isSellTimeOver())
          local setDataDo = function()
    -- function num : 0_3_1 , upvalues : isSellTimePass, self, objectStaticStatus, itemSS, furnitureData, cashProductStaticStatus
    if isSellTimePass == true and self:CheckFilter(objectStaticStatus, itemSS) == true then
      furnitureData:push_back({name = itemSS:getName(), iconPath = itemSS:getIconPath(), installPos = installPosition, desc = itemSS:getDescription(), isCashProduct = true, isInstalled = false, productNoRaw = cashProductStaticStatus:getNoRaw(), invenType = 0, invenSlotNo = 0})
    end
  end

          -- DECOMPILER ERROR at PC316: Unhandled construct in 'MakeBoolean' P1

          -- DECOMPILER ERROR at PC316: Unhandled construct in 'MakeBoolean' P1

          if cashProductStaticStatus:isMallDisplayable() and (UI_CIT.eType_WallPaper == installationType or UI_CIT.eType_FloorMaterial == installationType) and HouseInstallation._isMyHouse == true then
            setDataDo()
          end
          setDataDo()
        end
      end
    end
  end
  self.dataCount = #furnitureData
  -- DECOMPILER ERROR: 12 unprocessed JMP targets
end

HouseInstallation.SetScroll = function(self)
  -- function num : 0_4
  local dataCount = self.dataCount
  local hideCount = dataCount - self.maxSlotCount
  local countByline = self.maxSlotCount / 2
  local totalLine = (math.ceil)(dataCount / countByline)
  local interval = totalLine
  if interval < 0 then
    interval = 0
  end
  self.maxInterval = interval
  self.nowInterval = 0
  ;
  (self.scroll):SetInterval(self.maxInterval)
  local viewLine = self.maxSlotCount / countByline
  local pagePercent = viewLine / totalLine * 100
  local scrollSizeY = (self.scroll):GetSizeY()
  local btn_scrollSizeY = scrollSizeY / 100 * pagePercent * 0.85
  if btn_scrollSizeY < 20 then
    btn_scrollSizeY = 20
  end
  if scrollSizeY - 5 < btn_scrollSizeY then
    btn_scrollSizeY = scrollSizeY - 5
  end
  ;
  (self.scrollCTRLBTN):SetSize((self.scrollCTRLBTN):GetSizeX(), btn_scrollSizeY)
end

HouseInstallation.Update = function(self, nowInterval)
  -- function num : 0_5 , upvalues : HouseInstallation, furnitureData
  for slot_Idx = 0, self.maxSlotCount - 1 do
    local Uislot = (self.slotUIPool)[slot_Idx]
    ;
    ((Uislot.slotItem).icon):addInputEvent("Mouse_On", "")
    ;
    ((Uislot.slotItem).icon):addInputEvent("Mouse_Out", "")
    ;
    ((Uislot.slotItem).icon):addInputEvent("Mouse_LUp", "")
    ;
    (Uislot.slotItem):clearItem()
    ;
    (Uislot.normalBG):SetShow(true)
    ;
    (Uislot.cashBG):SetShow(false)
    ;
    (Uislot.installedMark):SetShow(false)
  end
  ;
  (HouseInstallation._staticInteriorSensePoint):SetShow(false)
  if self.houseInstallationMode == true then
    local houseActorWrapper = housing_getHouseholdActor_CurrentPosition()
    if houseActorWrapper == nil then
      _PA_ASSERT(false, "housing_getHouseholdActor_CurrentPosition()�\128 nullptr 이면 안됩니다.")
      return 
    end
    do
      local css = (houseActorWrapper:getStaticStatusWrapper()):get()
      ;
      (self.installedObjectCount):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TEXT_INSTALLOBJECTCOUNT", "sum", houseActorWrapper:getInstallationCountSum(), "maxCount", css:getInstallationMaxCount()))
      for slot_Idx = 0, self.maxSlotCount - 1 do
        if self.maxSlotCount < self.dataCount then
          (self.scroll):SetShow(true)
        else
          ;
          (self.scroll):SetShow(false)
        end
        local dataIdx = nowInterval * (self.maxSlotCount / 2) + slot_Idx + 1
        local Uislot = (self.slotUIPool)[slot_Idx]
        local Data = furnitureData[dataIdx]
        local itemWrapper, itemStaticStatus = nil, nil
        if Data == nil then
          return 
        end
        if Data.isInstalled == true then
          local houseWrapper = housing_getHouseholdActor_CurrentPosition()
          local actorKeyRaw = houseWrapper:getInstallationActorKeyRaw(Data.invenSlotNo)
          local installationActorWrapper = getInstallationActor(actorKeyRaw)
          if installationActorWrapper ~= nil then
            local cssWrapper = installationActorWrapper:getStaticStatusWrapper()
            local itemSSW = cssWrapper:getItemEnchantStatcStaticWrapper()
            local installationCount = (cssWrapper:get()):getInstallationMaxCount()
            ;
            (Uislot.slotItem):setItemByStaticStatus(itemSSW, 0)
            ;
            ((Uislot.slotItem).icon):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_Delete_InstalledObject( " .. dataIdx .. " ," .. Data.invenSlotNo .. " )")
            ;
            ((Uislot.slotItem).icon):addInputEvent("Mouse_On", "_houseInstallation_ShowInstalledItemToolTip( " .. Data.invenSlotNo .. ", " .. slot_Idx .. " )")
            ;
            (Uislot.normalBG):SetShow(true)
            ;
            (Uislot.cashBG):SetShow(false)
            ;
            (Uislot.installedMark):SetShow(true)
          end
        else
          do
            if not Data.isCashProduct then
              itemWrapper = getInventoryItemByType(Data.invenType, Data.invenSlotNo)
              ;
              (Uislot.slotItem):setItem(itemWrapper)
              ;
              ((Uislot.slotItem).icon):addInputEvent("Mouse_On", "_houseInstallation_ShowToolTip( " .. Data.invenType .. ", " .. Data.invenSlotNo .. ", " .. slot_Idx .. " )")
              ;
              ((Uislot.slotItem).icon):addInputEvent("Mouse_LUp", "_houseInstallation_InstallFurniture( " .. Data.invenType .. ", " .. Data.invenSlotNo .. ", false, " .. 0 .. ")")
              ;
              (Uislot.normalBG):SetShow(true)
              ;
              (Uislot.cashBG):SetShow(false)
              ;
              (Uislot.installedMark):SetShow(false)
            else
              local cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(Data.productNoRaw)
              itemStaticStatus = cPSSW:getItemByIndex(0)
              if itemStaticStatus ~= nil then
                (Uislot.slotItem):setItemByStaticStatus(itemStaticStatus, 0)
                ;
                ((Uislot.slotItem).icon):addInputEvent("Mouse_On", "_houseInstallation_CashItemShowToolTip( " .. Data.productNoRaw .. ", " .. slot_Idx .. " )")
                ;
                ((Uislot.slotItem).icon):addInputEvent("Mouse_LUp", "_houseInstallation_InstallFurniture( " .. Data.invenType .. ", " .. Data.invenSlotNo .. ", true, " .. Data.productNoRaw .. ")")
                ;
                (Uislot.normalBG):SetShow(false)
                ;
                (Uislot.cashBG):SetShow(true)
                ;
                (Uislot.installedMark):SetShow(false)
              end
            end
            do
              do
                ;
                ((Uislot.slotItem).icon):SetAlpha(1)
                ;
                ((Uislot.slotItem).icon):SetShow(true)
                ;
                ((Uislot.slotItem).icon):addInputEvent("Mouse_Out", "_houseInstallation_HideToolTip()")
                ;
                ((Uislot.slotItem).icon):addInputEvent("Mouse_DownScroll", "_houseInstallation_UpdateScroll( true )")
                ;
                ((Uislot.slotItem).icon):addInputEvent("Mouse_UpScroll", "_houseInstallation_UpdateScroll( false )")
                if self.dataCount == dataIdx then
                  return 
                end
                -- DECOMPILER ERROR at PC302: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC302: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC302: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC302: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end

HouseInstallation.Open = function(self)
  -- function num : 0_6 , upvalues : HouseInstallation, renderMode
  ToClient_SaveUiInfo(false)
  if not IsSelfPlayerWaitAction() and not IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_ONLYWAITSTENCE"))
    return 
  end
  Panel_Tooltip_Item_hideTooltip()
  EventHousingPointUpdateClear()
  if housing_isBuildMode() then
    self.isInstallMode = false
  else
    local rv = housing_changeHousingMode(true, HouseInstallation._isMyHouse)
    if rv ~= 0 then
      return 
    end
    self.isInstallMode = true
  end
  do
    audioPostEvent_SystemUi(1, 32)
    SetUIMode((Defines.UIMode).eUIMode_Housing)
    renderMode:set()
    crossHair_SetShow(false)
    setShowLine(false)
    HouseInstallation:SetPosition()
    if self.isInstallMode == true then
      self:Open_ObjectInstallMode(isShow)
    else
      self:Open_ItemInstallMode(isShow)
    end
    Panel_House_InstallationMode:SetShow(true)
  end
end

HouseInstallation.Open_ObjectInstallMode = function(self, isShow)
  -- function num : 0_7 , upvalues : HouseInstallation
  if not IsSelfPlayerWaitAction() and not IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_ONLYWAITSTENCE"))
    return 
  end
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_GOTO_NEAR_HOUSEHOLD"))
    return 
  end
  if not ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isFixedHouse() then
    do
      self.houseInstallationMode = ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isInnRoom()
      ;
      (self.bg_Menu):SetShow(true)
      ;
      (self.bg_List):SetShow(true)
      ;
      (self.btn_ExitInstallMode):SetShow(false)
      self.filter_ItemType = -1
      if self.houseInstallationMode == true then
        (self.radio_AttAll):SetCheck(true)
        ;
        (self.radio_AttAllHarvest):SetCheck(false)
      else
        ;
        (self.radio_AttAllHarvest):SetCheck(true)
        ;
        (self.radio_AttAll):SetCheck(false)
      end
      ;
      (self.radio_AttFloor):SetCheck(false)
      ;
      (self.radio_AttWall):SetCheck(false)
      ;
      (self.radio_AttTabel):SetCheck(false)
      ;
      (self.radio_AttHarvest):SetCheck(false)
      ;
      (self.radio_AttOthers):SetCheck(false)
      HouseInstallation:SetData()
      HouseInstallation:SetScroll()
      HouseInstallation:Update(HouseInstallation.nowInterval)
      if self.houseInstallationMode == true then
        if HouseInstallation._isMyHouse then
          (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TEXT_PANELTITLE1"))
        else
          ;
          (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TEXT_PANELTITLE1") .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_HAPPYYOU"))
        end
        ;
        (self.installedObjectCount):SetShow(false)
        FGlobal_House_InstallationModeCart_Open()
        self:ShowFloorStatic(true)
        EventHousingPointUpdate()
      else
        ;
        (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TEXT_PANELTITLE2"))
        ;
        (self.installedObjectCount):SetShow(true)
        self:ShowFloorStatic(false)
      end
      ;
      (self.radio_AttAll):SetShow(self.houseInstallationMode == true)
      ;
      (self.radio_AttFloor):SetShow(self.houseInstallationMode == true)
      ;
      (self.radio_AttWall):SetShow(self.houseInstallationMode == true)
      ;
      (self.radio_AttTabel):SetShow(self.houseInstallationMode == true)
      ;
      (self.radio_AttAllHarvest):SetShow(self.houseInstallationMode == false)
      ;
      (self.radio_AttHarvest):SetShow(self.houseInstallationMode == false)
      ;
      (self.radio_AttOthers):SetShow(self.houseInstallationMode == false)
      -- DECOMPILER ERROR: 7 unprocessed JMP targets
    end
  end
end

HouseInstallation.Open_ItemInstallMode = function(self, isShow)
  -- function num : 0_8
  (self.panelTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_SETUP"))
  ;
  (self.btn_ExitInstallMode):SetShow(true)
  ;
  (self.installedObjectCount):SetShow(false)
  self:ShowFloorStatic(false)
  ;
  (self.bg_Menu):SetShow(false)
  ;
  (self.bg_List):SetShow(false)
  local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
  if characterStaticWrapper ~= nil then
    local objectStaticWrapper = characterStaticWrapper:getObjectStaticStatus()
    local isHealingTower = objectStaticWrapper:isHealingTower()
    local isObservatory = objectStaticWrapper:isObservatory()
    local isElephantBarn = objectStaticWrapper:isElephantBarn()
    local isCatapultFactory = objectStaticWrapper:isCatapultFactory()
    local isFlameFactory = objectStaticWrapper:isFlameFactory()
    local isBarricade = objectStaticWrapper:isBarricade()
    local isDistributor = objectStaticWrapper:isDistributor()
    local isBarricadeGate = objectStaticWrapper:isBarricadeGate()
    local isWoodenFence = objectStaticWrapper:isWoodenFenceBase()
    local isDefenceTower = objectStaticWrapper:isDefenceTower()
    local isSiegeTower = objectStaticWrapper:isSiegeTower()
    local isLargeSiegeTower = objectStaticWrapper:isLargeSiegeTower()
    local isAdvanceBaseTower = objectStaticWrapper:isAdvancedBaseTower()
    local isSavageDefenceObject = objectStaticWrapper:isSavageDefenceObject()
    local isMinorWarOpen = isHealingTower or isObservatory or isElephantBarn or isCatapultFactory or isFlameFactory or isBarricade or isDistributor or isBarricadeGate or isWoodenFence or isDefenceTower or isSiegeTower or isLargeSiegeTower or isAdvanceBaseTower or isSavageDefenceObject
    if isMinorWarOpen then
      FGlobal_HouseInstallation_MinorWar_Open()
    else
      FGlobal_HouseInstallation_MinorWar_Close()
    end
  end
end

HouseInstallation.ShowFloorStatic = function(self, isShow)
  -- function num : 0_9
  if isShow == false then
    (self._staticBackFloor):SetShow(false)
    return 
  end
  local numFloor = housing_getHouseFloorCount()
  if numFloor <= 1 then
    (self._staticBackFloor):SetShow(false)
    return 
  end
  ;
  (self._staticBackFloor):SetShow(true)
  local sizeY = 0
  if numFloor <= 2 then
    (self._radioBtnFirstFloor):SetShow(true)
    ;
    (self._radioBtnSecondFloor):SetShow(true)
    ;
    (self._radioBtnThirdFloor):SetShow(false)
    ;
    (self._radioBtnFourFloor):SetShow(false)
    sizeY = 125
  else
    if numFloor <= 3 then
      (self._radioBtnFirstFloor):SetShow(true)
      ;
      (self._radioBtnSecondFloor):SetShow(true)
      ;
      (self._radioBtnThirdFloor):SetShow(true)
      ;
      (self._radioBtnFourFloor):SetShow(false)
      sizeY = 160
    else
      if numFloor <= 4 then
        (self._radioBtnFirstFloor):SetShow(true)
        ;
        (self._radioBtnSecondFloor):SetShow(true)
        ;
        (self._radioBtnThirdFloor):SetShow(true)
        ;
        (self._radioBtnFourFloor):SetShow(true)
        sizeY = 195
      end
    end
  end
  ;
  (self._staticBackFloor):SetSize((self._staticBackFloor):GetSizeX(), sizeY)
  ;
  (self._staticTextFloor):ComputePos()
  ;
  (self._radioBtnFirstFloor):ComputePos()
  ;
  (self._radioBtnSecondFloor):ComputePos()
  ;
  (self._radioBtnThirdFloor):ComputePos()
  ;
  (self._radioBtnFourFloor):ComputePos()
  local curFloor = housing_getHouseFloorSelfPlayerBeing()
  if curFloor == 0 then
    (self._radioBtnFirstFloor):SetCheck(true)
    ;
    (self._radioBtnSecondFloor):SetCheck(false)
    ;
    (self._radioBtnThirdFloor):SetCheck(false)
    ;
    (self._radioBtnFourFloor):SetCheck(false)
  else
    if curFloor == 1 then
      (self._radioBtnFirstFloor):SetCheck(false)
      ;
      (self._radioBtnSecondFloor):SetCheck(true)
      ;
      (self._radioBtnThirdFloor):SetCheck(false)
      ;
      (self._radioBtnFourFloor):SetCheck(false)
    else
      if curFloor == 2 then
        (self._radioBtnFirstFloor):SetCheck(false)
        ;
        (self._radioBtnSecondFloor):SetCheck(false)
        ;
        (self._radioBtnThirdFloor):SetCheck(true)
        ;
        (self._radioBtnFourFloor):SetCheck(false)
      else
        if curFloor == 3 then
          (self._radioBtnFirstFloor):SetCheck(false)
          ;
          (self._radioBtnSecondFloor):SetCheck(false)
          ;
          (self._radioBtnThirdFloor):SetCheck(false)
          ;
          (self._radioBtnFourFloor):SetCheck(true)
        end
      end
    end
  end
end

HouseInstallation.Close = function(self)
  -- function num : 0_10
  HouseInstallation_Hide()
end

HouseInstallation_Hide = function()
  -- function num : 0_11 , upvalues : renderMode
  SetUIMode((Defines.UIMode).eUIMode_Default)
  renderMode:reset()
  crossHair_SetShow(true)
  setShowLine(true)
  Panel_House_InstallationMode:SetShow(false)
  housing_changeHousingMode(false, false)
  ClearFocusEdit()
  FGlobal_House_InstallationModeCart_Close()
  InventoryWindow_Close()
  FGlobal_FarmGuide_Close()
  InitializeModeClose_PetMaidInit()
end

_houseInstallation_UpdateScroll = function(isDown)
  -- function num : 0_12 , upvalues : HouseInstallation
  local self = HouseInstallation
  local max = self.maxInterval
  local now = self.nowInterval
  if isDown == true then
    if now < max - 2 then
      now = now + 1
      ;
      (self.scroll):ControlButtonDown()
      self:Update(now)
    else
      return 
    end
  else
    if now > 0 then
      now = now - 1
      ;
      (self.scroll):ControlButtonUp()
      self:Update(now)
    else
      return 
    end
  end
  self.nowInterval = now
end

_houseInstallation_SetPosition = function()
  -- function num : 0_13
  local houseActorWrapper = housing_getHouseholdActor_CurrentPosition()
  local css = (houseActorWrapper:getStaticStatusWrapper()):get()
  local max = css:getInstallationMaxCount()
  local now = (houseActorWrapper:get()):getInstallationCount()
  if now < max then
    housing_selectInstallationItem(0, slot._invenSlotNo)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_NOMOREHARVEST"))
  end
end

_houseInstallation_ShowToolTip = function(invenType, invenSlotNo, slot_Idx)
  -- function num : 0_14 , upvalues : HouseInstallation
  local self = HouseInstallation
  local itemWrapper = getInventoryItemByType(invenType, invenSlotNo)
  local Uislot = (self.slotUIPool)[slot_Idx]
  Panel_Tooltip_Item_Show(itemWrapper, (Uislot.slotItem).icon, false, false, nil)
end

_houseInstallation_ShowInstalledItemToolTip = function(invenSlotNo, slot_Idx)
  -- function num : 0_15 , upvalues : HouseInstallation
  local self = HouseInstallation
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  local actorKeyRaw = houseWrapper:getInstallationActorKeyRaw(invenSlotNo)
  local installationActorWrapper = getInstallationActor(actorKeyRaw)
  if installationActorWrapper == nil then
    return 
  end
  local cssWrapper = installationActorWrapper:getStaticStatusWrapper()
  local itemSSW = cssWrapper:getItemEnchantStatcStaticWrapper()
  local Uislot = (self.slotUIPool)[slot_Idx]
  Panel_Tooltip_Item_Show(itemSSW, (Uislot.slotItem).icon, true, false, nil)
end

_houseInstallation_CashItemShowToolTip = function(productNoRaw, uiIdx)
  -- function num : 0_16 , upvalues : HouseInstallation
  local self = HouseInstallation
  local cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(productNoRaw)
  local itemSSW = cPSSW:getItemByIndex(0)
  local Uislot = (self.slotUIPool)[uiIdx]
  if itemSSW == nil then
    return 
  end
  Panel_Tooltip_Item_Show(itemSSW, (Uislot.slotItem).icon, true, false)
end

_houseInstallation_HideToolTip = function()
  -- function num : 0_17
  Panel_Tooltip_Item_hideTooltip()
end

_houseInstallation_InstallFurniture = function(invenType, invenSlotNo, iscash, productNo)
  -- function num : 0_18
  PAHousing_FarmInfo_Close()
  FGlobal_HouseInstallationControl_CloseOuter()
  if Panel_Win_System:GetShow() then
    return 
  end
  if iscash == false then
    housing_selectInstallationItem(invenType, invenSlotNo)
  else
    housing_selectInstallationItemForCashShop(productNo)
  end
end

_houseInstallation_Delete_InstalledObjectDO = function()
  -- function num : 0_19 , upvalues : HouseInstallation
  PAHousing_FarmInfo_Close()
  FGlobal_HouseInstallationControl_CloseOuter()
  local self = HouseInstallation
  housing_deleteObject_InstalledObjectList(self.deleteItemIdx)
end

_houseInstallation_Default_Cancel_function = function()
  -- function num : 0_20
  if housing_isInstallMode() and housing_isTemporaryObject() then
    housing_moveObject()
  end
  housing_moveObject()
end

_houseInstallation_IconTooltip = function(isShow, iconType)
  -- function num : 0_21 , upvalues : HouseInstallation, buttonEum
  local self = HouseInstallation
  local control = nil
  local name = ""
  local desc = ""
  if isShow == true then
    if buttonEum.All == iconType then
      control = self.radio_AttAll
      name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ALL_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ALL_DESC")
    else
      if buttonEum.Floor == iconType then
        control = self.radio_AttFloor
        name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTFLOOR_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTFLOOR_DESC")
      else
        if buttonEum.Wall == iconType then
          control = self.radio_AttWall
          name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTWALL_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTWALL_DESC")
        else
          if buttonEum.Table == iconType then
            control = self.radio_AttTabel
            name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTTABLE_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTTABLE_DESC")
          else
            if buttonEum.AllHarvest == iconType then
              control = self.radio_AttAllHarvest
              name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTALLHARVEST_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTALLHARVEST_DESC")
            else
              if buttonEum.Harvest == iconType then
                control = self.radio_AttHarvest
                name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTHARVEST_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTHARVEST_DESC")
              else
                if buttonEum.Tool == iconType then
                  control = self.radio_AttOthers
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTOTHERS_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ATTOTHERS_DESC")
                else
                  if buttonEum.Rotate_Right == iconType then
                    control = self.btn_RotateRight
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ROTATERIGHT_NAME")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ROTATERIGHT_DESC")
                  else
                    if buttonEum.Rotate_Left == iconType then
                      control = self.btn_RotateLeft
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ROTATELEFT_NAME")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ROTATELEFT_DESC")
                    else
                      if buttonEum.RotateAngle_45 == iconType then
                        control = self.btn_RotateAngle
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ROTATEANGLE_NAME")
                        desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_ROTATEANGLE_DESC")
                      else
                        if buttonEum.Reset == iconType then
                          control = self.btn_ResetArrangement
                          name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_RESET_NAME")
                          desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_TOOLTIP_RESET_DESC")
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
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HandleClicked_HouseInstallation_ItemFilter = function(itemType)
  -- function num : 0_22 , upvalues : HouseInstallation
  local self = HouseInstallation
  self.filter_ItemType = itemType
  self.filter_SearchKeyword = ""
  ;
  (self.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  self:SetData()
  self:SetScroll()
  self:Update(self.nowInterval)
end

HandleClicked_HouseInstallation_EditItemNameClear = function()
  -- function num : 0_23 , upvalues : HouseInstallation, IM
  local self = HouseInstallation
  ;
  (self.edit_ItemName):SetEditText("", true)
  SetFocusEdit(self.edit_ItemName)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

HandleClicked_HouseInstallation_FindItemName = function()
  -- function num : 0_24 , upvalues : IM, HouseInstallation
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  local self = HouseInstallation
  local inputKeyword = (self.edit_ItemName):GetEditText()
  ClearFocusEdit()
  if inputKeyword ~= nil and inputKeyword ~= "" and PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME") ~= inputKeyword then
    self.filter_SearchKeyword = (self.edit_ItemName):GetEditText()
    self:SetData()
    self:SetScroll()
    self:Update(self.nowInterval)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_ACK_SEARCH"))
    return 
  end
end

HandleClicked_HouseInstallation_Rotate45 = function()
  -- function num : 0_25 , upvalues : HouseInstallation
  local isCheck = (HouseInstallation.btn_RotateAngle):IsCheck()
  housing_setRestrictedRatateObject(isCheck)
end

HandleClicked_HouseInstallation_RotateCamera = function(isLeft)
  -- function num : 0_26
  if isLeft == true then
    local xDegree = -0.5
    local yDegree = 0
    housing_rotateCamera(xDegree, yDegree)
  else
    do
      local xDegree = 0.5
      local yDegree = 0
      housing_rotateCamera(xDegree, yDegree)
    end
  end
end

HandleClicked_HouseInstallation_Reset = function()
  -- function num : 0_27
  if Panel_Win_System:GetShow() then
    return 
  end
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    return 
  end
  local installedCount = houseWrapper:getInstallationCount()
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local freeNormalInventorySlot = (selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)):getFreeCount()
  local freeCashInventorySlot = (selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eCashInventory)):getFreeCount()
  local installedItemCount = houseWrapper:getInstallationCount()
  local installedNoramlItemCount = 0
  local installedCashItemCount = 0
  for installed_Idx = 0, installedItemCount do
    local actorKeyRaw = houseWrapper:getInstallationActorKeyRaw(installed_Idx)
    local installationActorWrapper = getInstallationActor(actorKeyRaw)
    if installationActorWrapper ~= nil then
      local cssWrapper = installationActorWrapper:getStaticStatusWrapper()
      local itemSSW = cssWrapper:getItemEnchantStatcStaticWrapper()
      if (itemSSW:get()):isCash() then
        installedCashItemCount = installedCashItemCount + 1
      else
        installedNoramlItemCount = installedNoramlItemCount + 1
      end
    end
  end
  FGlobal_HouseInstallationControl_Close()
  local installed_Delete_All = function()
    -- function num : 0_27_0 , upvalues : installedItemCount
    for idx = 0, installedItemCount - 1 do
      housing_deleteObject_InstalledObjectList(idx)
    end
  end

  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_1")
  local msgContent = ""
  if installedCount == 0 then
    msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_2")
    local messageboxData = {title = titleString, content = msgContent, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    return 
  else
    do
      if freeNormalInventorySlot == 0 or freeCashInventorySlot == 0 then
        msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_3")
        local messageboxData = {title = titleString, content = msgContent, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
        return 
      else
        do
          if freeNormalInventorySlot < installedNoramlItemCount or freeCashInventorySlot < installedCashItemCount then
            msgContent = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_4", "InstalledCount", installedCount, "FreeInventorySlot", freeNormalInventorySlot)
          else
            msgContent = installedCount .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_5") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_6")
          end
          local messageboxData = {title = titleString, content = msgContent, functionYes = installed_Delete_All, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
        end
      end
    end
  end
end

HandleClicked_HouseInstallation_Exit = function()
  -- function num : 0_28
  FGlobal_AlertHouseLightingReset()
  FromClient_CancelInstallModeMessageBox()
end

HandleClicked_HouseInstallation_Exit_DO = function()
  -- function num : 0_29 , upvalues : HouseInstallation
  HouseInstallation:Close()
end

HandleClicked_HouseInstallation_Exit_ByAttacked = function()
  -- function num : 0_30 , upvalues : HouseInstallation
  if housing_isBuildMode() or housing_isInstallMode() then
    HouseInstallation:Close()
  end
end

HandleClicked_HouseInstallation_Delete_InstalledObject = function(dataIdx, idx)
  -- function num : 0_31 , upvalues : HouseInstallation, furnitureData, UI_CIT
  if Panel_Win_System:GetShow() then
    return 
  end
  if housing_isTemporaryObject() or Is_Show_HouseInstallationControl() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_DELETEOBJECT_ACK"))
    return 
  end
  local self = HouseInstallation
  local itemName = (furnitureData[dataIdx]).name
  self.deleteItemIdx = idx
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  local actorKeyRaw = houseWrapper:getInstallationActorKeyRaw(idx)
  local installationActorWrapper = getInstallationActor(actorKeyRaw)
  if installationActorWrapper == nil then
    return 
  end
  local cssWrapper = installationActorWrapper:getStaticStatusWrapper()
  local itemSSW = cssWrapper:getItemEnchantStatcStaticWrapper()
  local objectStaticStatus = (cssWrapper:getObjectStaticStatus())
  local installationType = nil
  if cssWrapper ~= nil then
    installationType = objectStaticStatus:getInstallationType()
  end
  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageContent = ""
  if UI_CIT.eType_WallPaper == installationType or UI_CIT.eType_FloorMaterial == installationType or UI_CIT.eType_Havest == installationType then
    messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_CONFIRM_ITEMDELETE", "itemName", itemName)
  else
    messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_MSGBOX_CONTENT", "itemName", itemName)
  end
  local messageBoxData = {title = messageTitle, content = messageContent, functionYes = _houseInstallation_Delete_InstalledObjectDO, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_HouseInstallation_ScrollBtn = function()
  -- function num : 0_32 , upvalues : HouseInstallation
  local posPer = (HouseInstallation.scroll):GetControlPos()
  local viewRow = 2
  local totalRow = (math.ceil)(HouseInstallation.dataCount / (HouseInstallation.maxSlotCount / 2))
  local targetRow = (math.floor)((totalRow - viewRow) * posPer)
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R4 in 'UnsetPending'

  HouseInstallation.nowInterval = targetRow
  HouseInstallation:Update(HouseInstallation.nowInterval)
end

HandleClicked_HouseInstallation_FirstFloor_MouseLUp = function()
  -- function num : 0_33 , upvalues : HouseInstallation
  housing_selectHouseFloor(0)
  ;
  (HouseInstallation._radioBtnFirstFloor):SetCheck(true)
  ;
  (HouseInstallation._radioBtnSecondFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnThirdFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnFourFloor):SetCheck(false)
end

HandleClicked_HouseInstallation_SecondFloor_MouseLUp = function()
  -- function num : 0_34 , upvalues : HouseInstallation
  housing_selectHouseFloor(1)
  ;
  (HouseInstallation._radioBtnFirstFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnSecondFloor):SetCheck(true)
  ;
  (HouseInstallation._radioBtnThirdFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnFourFloor):SetCheck(false)
end

HandleClicked_HouseInstallation_ThirdFloor_MouseLUp = function()
  -- function num : 0_35 , upvalues : HouseInstallation
  housing_selectHouseFloor(2)
  ;
  (HouseInstallation._radioBtnFirstFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnSecondFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnThirdFloor):SetCheck(true)
  ;
  (HouseInstallation._radioBtnFourFloor):SetCheck(false)
end

HandleClicked_HouseInstallation_FourFloor_MouseLUp = function()
  -- function num : 0_36 , upvalues : HouseInstallation
  housing_selectHouseFloor(3)
  ;
  (HouseInstallation._radioBtnFirstFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnSecondFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnThirdFloor):SetCheck(false)
  ;
  (HouseInstallation._radioBtnFourFloor):SetCheck(true)
end

FromClient_ShowInstallationMenu = function(installMode, isShow, isShowMove, isShowFix, isShowDelete, isShowCancel)
  -- function num : 0_37
  local posX = housing_getInstallationMenuPosX()
  local posY = housing_getInstallationMenuPosY()
  if isShow == true then
    FGlobal_HouseInstallationControl_Open(installMode, posX, posY, isShow, isShowMove, isShowFix, isShowDelete, isShowCancel)
  else
    FGlobal_HouseInstallationControl_Close()
  end
  FGlobal_House_InstallationModeCart_Update()
end

FromClient_CancelInstallObject = function()
  -- function num : 0_38
  FGlobal_HouseInstallationControl_Close()
end

FromClient_CancelInstallMode = function()
  -- function num : 0_39
  FGlobal_HouseInstallationControl_Close()
end

FromClient_UpdateInventory = function()
  -- function num : 0_40 , upvalues : HouseInstallation
  HouseInstallation:SetData()
  HouseInstallation:SetScroll()
  ;
  (HouseInstallation.scroll):SetControlTop()
  HouseInstallation:Update(HouseInstallation.nowInterval)
  FGlobal_House_InstallationModeCart_Update()
end

FromClient_UpdateInstallationActor = function(isAdd)
  -- function num : 0_41 , upvalues : HouseInstallation
  HouseInstallation:SetData()
  HouseInstallation:SetScroll()
  HouseInstallation:Update(HouseInstallation.nowInterval)
end

FromClient_ShowHousingModeUI = function(isShow)
  -- function num : 0_42 , upvalues : HouseInstallation
  HouseInstallation:Open(isShow)
end

FromClient_CancelInstallModeMessageBox = function()
  -- function num : 0_43 , upvalues : IM
  audioPostEvent_SystemUi(1, 33)
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_MODE_EXIT_MESSAGEBOX_MEMO")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_MODE_EXIT_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = HandleClicked_HouseInstallation_Exit_DO, functionCancel = _houseInstallation_Default_Cancel_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  local isExist = (MessageBox.doHaveMessageBoxData)(messageboxData.title)
  if isExist == false then
    (MessageBox.showMessageBox)(messageboxData)
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  end
end

FGlobal_House_InstallationMode_Update = function()
  -- function num : 0_44 , upvalues : HouseInstallation
  HouseInstallation:SetData()
  HouseInstallation:SetScroll()
  HouseInstallation:Update(HouseInstallation.nowInterval)
end

FGlobal_House_InstallationMode_Open = function()
  -- function num : 0_45 , upvalues : HouseInstallation, IM
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  HouseInstallation.filter_ItemType = -1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  HouseInstallation.filter_SearchKeyword = ""
  ;
  (HouseInstallation.edit_ItemName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSE_INSTALLATIONMODE_EDIT_ITEMNAME"), false)
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_GOTO_NEAR_HOUSEHOLD"))
    return 
  end
  if not ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isFixedHouse() then
    local isHouse = ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isInnRoom()
  end
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

  if isHouse then
    HouseInstallation._isMyHouse = ((getSelfPlayer()):get()):isMyHouseVisiting()
  else
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

    HouseInstallation._isMyHouse = false
  end
  HouseInstallation:Open()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

EventHousingPointUpdate = function()
  -- function num : 0_46 , upvalues : HouseInstallation
  local self = HouseInstallation
  local iptBaseValue = toClient_GetVisitingBaseInteriorPoint()
  local iptOptionValue = toClient_GetVisitingSetOptionInteriorPoint()
  local iptBonusValue = toClient_GetVisitingBonusInteriorPoint()
  local iptTotalValue = toClient_GetVisitingTotalInteriorPoint()
  if iptBaseValue < 0 then
    iptBaseValue = 0
  end
  ;
  (self.InteriorPointBaseValueText):SetText(iptBaseValue)
  if iptOptionValue < 0 then
    iptOptionValue = 0
  end
  ;
  (self.InteriorPointOptionValueText):SetText(iptOptionValue)
  if iptBonusValue < 0 then
    iptBonusValue = 0
  end
  ;
  (self.InteriorPointBonusValueText):SetText(iptBonusValue)
  if iptTotalValue < 0 then
    iptTotalValue = 0
  end
  ;
  (self.InteriorPointTotalValueText):SetText(iptTotalValue)
  if (self._staticBackFloor):GetShow() == true then
    iptBGPosY = (self._staticBackFloor):GetPosY() + (self._staticBackFloor):GetSizeY() + 10
  else
    iptBGPosY = 100
  end
  ;
  (self.InteriorPointBG):SetPosY(iptBGPosY)
  ;
  (self.InteriorPointBaseText):SetPosY(iptBGPosY + 27)
  ;
  (self.InteriorPointOptionText):SetPosY(iptBGPosY + 58)
  ;
  (self.InteriorPointBonusText):SetPosY(iptBGPosY + 90)
  ;
  (self.InteriorPointTotalText):SetPosY(iptBGPosY + 129)
  ;
  (self.InteriorPointBaseValueText):SetPosY(iptBGPosY + 27)
  ;
  (self.InteriorPointOptionValueText):SetPosY(iptBGPosY + 58)
  ;
  (self.InteriorPointBonusValueText):SetPosY(iptBGPosY + 90)
  ;
  (self.InteriorPointTotalValueText):SetPosY(iptBGPosY + 129)
  ;
  (self.InteriorPointBG):SetShow(true)
  ;
  (self.InteriorPointBaseText):SetShow(true)
  ;
  (self.InteriorPointOptionText):SetShow(true)
  ;
  (self.InteriorPointBonusText):SetShow(true)
  ;
  (self.InteriorPointTotalText):SetShow(true)
  ;
  (self.InteriorPointBaseValueText):SetShow(true)
  ;
  (self.InteriorPointOptionValueText):SetShow(true)
  ;
  (self.InteriorPointBonusValueText):SetShow(true)
  ;
  (self.InteriorPointTotalValueText):SetShow(true)
end

EventHousingPointUpdateClear = function()
  -- function num : 0_47 , upvalues : HouseInstallation
  (HouseInstallation.InteriorPointBaseValueText):SetShow(false)
  ;
  (HouseInstallation.InteriorPointOptionValueText):SetShow(false)
  ;
  (HouseInstallation.InteriorPointBonusValueText):SetShow(false)
  ;
  (HouseInstallation.InteriorPointTotalValueText):SetShow(false)
  ;
  (HouseInstallation.InteriorPointBG):SetShow(false)
  ;
  (HouseInstallation.InteriorPointBaseText):SetShow(false)
  ;
  (HouseInstallation.InteriorPointOptionText):SetShow(false)
  ;
  (HouseInstallation.InteriorPointBonusText):SetShow(false)
  ;
  (HouseInstallation.InteriorPointTotalText):SetShow(false)
end

FGlobal_House_InstallationMode_Close = function()
  -- function num : 0_48 , upvalues : HouseInstallation
  HouseInstallation:Close()
end

House_InstallationMode_UpdatePerFrame = function(deltaTime)
  -- function num : 0_49 , upvalues : HouseInstallation
  local self = HouseInstallation
  if self.isInstallMode == false or self.houseInstallationMode == false then
    return 
  end
  if housing_getCreatedCharacterStaticWrapper() == nil then
    (self._staticInteriorSensePoint):SetShow(false)
    return 
  end
  local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
  if characterStaticWrapper ~= nil then
    local interiorSensePoint = housing_getAdditionalInteriorSensePoint()
    if interiorSensePoint > 0 and Panel_House_InstallationMode_ObjectControl:GetShow() == false then
      (self._staticInteriorSensePoint):SetShow(true)
      ;
      (self._staticInteriorSensePoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERIORSENSEPOINT", "point", tostring(interiorSensePoint)))
      ;
      (self._staticInteriorSensePoint):SetPosX(getMousePosX() - (self._staticInteriorSensePoint):GetSizeX() / 2)
      ;
      (self._staticInteriorSensePoint):SetPosY(getMousePosY() - ((self._staticInteriorSensePoint):GetSizeY() + 15))
    else
      ;
      (self._staticInteriorSensePoint):SetShow(false)
    end
  else
    do
      ;
      (self._staticInteriorSensePoint):SetShow(false)
    end
  end
end

Panel_House_InstallationMode:RegisterUpdateFunc("House_InstallationMode_UpdatePerFrame")
HouseInstallation.registEventHandler = function(self)
  -- function num : 0_50 , upvalues : buttonEum
  (self.bg_List):addInputEvent("Mouse_DownScroll", "_houseInstallation_UpdateScroll( true )")
  ;
  (self.bg_List):addInputEvent("Mouse_UpScroll", "_houseInstallation_UpdateScroll( false )")
  ;
  (self.radio_AttAll):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ItemFilter( " .. -1 .. " )")
  ;
  (self.radio_AttAll):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.All .. " )")
  ;
  (self.radio_AttAll):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.radio_AttFloor):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ItemFilter( " .. 0 .. " )")
  ;
  (self.radio_AttFloor):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Floor .. " )")
  ;
  (self.radio_AttFloor):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.radio_AttWall):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ItemFilter( " .. 1 .. " )")
  ;
  (self.radio_AttWall):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Wall .. " )")
  ;
  (self.radio_AttWall):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.radio_AttTabel):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ItemFilter( " .. 2 .. " )")
  ;
  (self.radio_AttTabel):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Table .. " )")
  ;
  (self.radio_AttTabel):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.radio_AttAllHarvest):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ItemFilter( " .. -1 .. " )")
  ;
  (self.radio_AttAllHarvest):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.AllHarvest .. " )")
  ;
  (self.radio_AttAllHarvest):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.radio_AttHarvest):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ItemFilter( " .. 0 .. " )")
  ;
  (self.radio_AttHarvest):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Harvest .. " )")
  ;
  (self.radio_AttHarvest):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.radio_AttOthers):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ItemFilter( " .. 1 .. " )")
  ;
  (self.radio_AttOthers):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Tool .. " )")
  ;
  (self.radio_AttOthers):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.btn_RotateRight):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_RotateCamera( false )")
  ;
  (self.btn_RotateRight):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Rotate_Right .. " )")
  ;
  (self.btn_RotateRight):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.btn_RotateLeft):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_RotateCamera( true )")
  ;
  (self.btn_RotateLeft):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Rotate_Left .. " )")
  ;
  (self.btn_RotateLeft):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.btn_RotateAngle):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_Rotate45()")
  ;
  (self.btn_RotateAngle):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.RotateAngle_45 .. " )")
  ;
  (self.btn_RotateAngle):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self.btn_ResetArrangement):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_Reset()")
  ;
  (self.btn_ResetArrangement):addInputEvent("Mouse_On", "_houseInstallation_IconTooltip( true, " .. buttonEum.Reset .. " )")
  ;
  (self.btn_ResetArrangement):addInputEvent("Mouse_Out", "_houseInstallation_IconTooltip( false )")
  ;
  (self._radioBtnFirstFloor):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_FirstFloor_MouseLUp()")
  ;
  (self._radioBtnSecondFloor):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_SecondFloor_MouseLUp()")
  ;
  (self._radioBtnThirdFloor):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ThirdFloor_MouseLUp()")
  ;
  (self._radioBtnFourFloor):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_FourFloor_MouseLUp()")
  ;
  (self.scrollCTRLBTN):addInputEvent("Mouse_LPress", "HandleClicked_HouseInstallation_ScrollBtn()")
  ;
  (self.scroll):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_ScrollBtn()")
  ;
  (self.edit_ItemName):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_EditItemNameClear()")
  ;
  (self.edit_ItemName):RegistReturnKeyEvent("HandleClicked_HouseInstallation_FindItemName()")
  ;
  (self.btn_Search):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_FindItemName()")
  ;
  (self.btn_Exit):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_Exit()")
  ;
  (self.btn_ExitInstallMode):addInputEvent("Mouse_LUp", "HandleClicked_HouseInstallation_Exit()")
end

HouseInstallation.registMessageHandler = function(self)
  -- function num : 0_51
  registerEvent("EventHousingShowInstallationMenu", "FromClient_ShowInstallationMenu")
  registerEvent("EventHousingCancelInstallObjectMessageBox", "FromClient_CancelInstallObject")
  registerEvent("EventHousingCancelInstallModeMessageBox", "FromClient_CancelInstallMode")
  registerEvent("EventHousingUpdateInstallationInven", "FromClient_UpdateInventory")
  registerEvent("EventUpdateInstallationActor", "FromClient_UpdateInstallationActor")
  registerEvent("EventHousingCancelInstallModeMessageBox", "FromClient_CancelInstallModeMessageBox")
  registerEvent("EventHousingShowHousingModeUI", "FromClient_ShowHousingModeUI")
  registerEvent("EventHousingShowVisitHouse", "EventHousingPointUpdate")
end

HouseInstallation:Initialize()
HouseInstallation:registEventHandler()
HouseInstallation:registMessageHandler()
renderMode:setClosefunctor(renderMode, HouseInstallation_Hide)

