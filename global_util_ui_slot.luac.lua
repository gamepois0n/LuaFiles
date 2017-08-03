-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_util_ui_slot.luac 

-- params : ...
-- function num : 0
if UI == nil then
  UI = {}
end
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
-- DECOMPILER ERROR at PC102: Confused about usage of register: R2 in 'UnsetPending'

UI.itemSlotConfig = {
borderTexture = {[0] = nil, 
[1] = {texture = "new_ui_common_forlua/window/skill/skill_ui_00.dds", x1 = 172, y1 = 44, x2 = 214, y2 = 86}
, 
[2] = {texture = "new_ui_common_forlua/window/skill/skill_ui_00.dds", x1 = 172, y1 = 1, x2 = 214, y2 = 43}
, 
[3] = {texture = "new_ui_common_forlua/window/skill/skill_ui_00.dds", x1 = 129, y1 = 1, x2 = 171, y2 = 43}
, 
[4] = {texture = "new_ui_common_forlua/window/skill/skill_ui_00.dds", x1 = 129, y1 = 44, x2 = 171, y2 = 86}
}
, 
expirationTexture = {
[0] = {texture = "new_ui_common_forlua/Window/inventory/inventory_01.dds", x1 = 45, y1 = 1, x2 = 58, y2 = 14}
, 
[1] = {texture = "new_ui_common_forlua/Window/inventory/inventory_01.dds", x1 = 45, y1 = 15, x2 = 58, y2 = 28}
, 
[2] = {texture = "new_ui_common_forlua/Window/inventory/inventory_01.dds", x1 = 45, y1 = 29, x2 = 58, y2 = 42}
}
, 
checkBtnTexture = {
{texture = "new_ui_common_forlua/default/default_buttons_02.dds", x1 = 133, y1 = 162, x2 = 160, y2 = 189}
, 
{texture = "new_ui_common_forlua/default/default_buttons_02.dds", x1 = 163, y1 = 162, x2 = 190, y2 = 189}
; 
[0] = {texture = "new_ui_common_forlua/default/default_buttons_02.dds", x1 = 103, y1 = 162, x2 = 130, y2 = 189}
}
, iconSize = 42, borderSize = 42, borderPos = -1, countSpanSizeX = 10, countSpanSizeY = 4, expirationSize = 15, expirationPosX = 1, expirationPosY = 30, expirationBGSize = 43, expiration2hSize = 43, isCashSize = 28, isCashPosX = 0, isCashPosY = 0, disableClass = 12, checkBtnSize = 19}
SlotItem = {}
-- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.__index = SlotItem
-- DECOMPILER ERROR at PC111: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.new = function(itemSlot, id, slotNo, parent, param)
  -- function num : 0_0 , upvalues : UCT
  if itemSlot == nil then
    itemSlot = {}
  end
  setmetatable(itemSlot, SlotItem)
  itemSlot.slotNo = slotNo
  itemSlot.param = param
  itemSlot.id = id
  local _config = UI.itemSlotConfig
  if itemSlot.icon == nil then
    itemSlot.icon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "Static_" .. id)
  end
  ;
  (itemSlot.icon):SetSize((UI.itemSlotConfig).iconSize, (UI.itemSlotConfig).iconSize)
  ;
  (itemSlot.icon):ActiveMouseEventEffect(true)
  ;
  (itemSlot.icon):SetIgnore(false)
  return itemSlot
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.createChild = function(self)
  -- function num : 0_1 , upvalues : UCT
  local _config = UI.itemSlotConfig
  if (self.param).createBorder == true and self.border == nil then
    self.border = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_Border")
    ;
    (self.border):SetSize(45, 45)
    ;
    (self.border):SetPosX(_config.borderPos)
    ;
    (self.border):SetPosY(_config.borderPos)
    ;
    (self.border):SetIgnore(true)
  end
  do
    if (self.param).createExpiration2h == true and self.Expiration2h == nil then
      local expire2h = (UI.getChildControl)(Panel_Window_Inventory, "Static_Expire_2h")
      self.expiration2h = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "Expiration2h")
      CopyBaseProperty(expire2h, self.expiration2h)
      ;
      (self.expiration2h):SetSize(_config.expiration2hSize, _config.expiration2hSize)
      ;
      (self.expiration2h):SetPosX(_config.borderPos)
      ;
      (self.expiration2h):SetPosY(_config.borderPos)
      ;
      (self.expiration2h):SetIgnore(true)
    end
    if (self.param).createExpirationBG == true and self.ExpirationBG == nil then
      self.expirationBG = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "ExpirationBG")
      ;
      (self.expirationBG):SetSize(_config.expirationBGSize, _config.expirationBGSize)
      ;
      (self.expirationBG):SetPosX(_config.borderPos)
      ;
      (self.expirationBG):SetPosY(_config.borderPos)
      ;
      (self.expirationBG):SetIgnore(true)
    end
    if (self.param).createEnchant == true and self.enchantText == nil then
      self.enchantText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self.icon, "StaticText_" .. self.id .. "_Enchant")
      local enchantNumber = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Slot_Enchant_value")
      CopyBaseProperty(enchantNumber, self.enchantText)
      ;
      (self.enchantText):SetSize((self.icon):GetSizeX(), (self.icon):GetSizeY())
      ;
      (self.enchantText):SetPosX(0)
      ;
      (self.enchantText):SetPosY(0)
      ;
      (self.enchantText):SetTextHorizonCenter()
      ;
      (self.enchantText):SetTextVerticalCenter()
      ;
      (self.enchantText):SetIgnore(true)
    end
    do
      if (self.param).createRemoteEnchant == true and self.remoteEnchantText == nil then
        self.remoteEnchantText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self.icon, "StaticText_" .. self.id .. "_RemoteEnchant")
        local remoteEnchantNumber = (UI.getChildControl)(Panel_RemoteInventory, "StaticText_RemoteSlot_Enchantvalue")
        CopyBaseProperty(remoteEnchantNumber, self.remoteEnchantText)
        ;
        (self.remoteEnchantText):SetPosX(0)
        ;
        (self.remoteEnchantText):SetPosY(0)
        ;
        (self.remoteEnchantText):SetTextHorizonCenter()
        ;
        (self.remoteEnchantText):SetTextVerticalCenter()
        ;
        (self.remoteEnchantText):SetIgnore(true)
      end
      do
        if (self.param).createCooltime == true and self.cooltime == nil then
          self.cooltime = (UI.createCustomControl)("StaticCooltime", self.icon, "StaticCooltime_" .. self.id)
          ;
          (self.cooltime):SetSize((self.icon):GetSizeX(), (self.icon):GetSizeY())
          ;
          (self.cooltime):SetIgnore(true)
          ;
          (self.cooltime):SetShow(false)
        end
        if (self.param).createCount == true and self.count == nil then
          self.count = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self.icon, "StaticText_" .. self.id .. "_Count")
          local stackCount = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Slot_StackCount_value")
          CopyBaseProperty(stackCount, self.count)
          ;
          (self.count):SetSize((self.icon):GetSizeX() - 3, (self.icon):GetSizeY() / 2)
          ;
          (self.count):SetTextHorizonRight()
          ;
          (self.count):SetTextVerticalBottom()
          ;
          (self.count):SetIgnore(true)
        end
        do
          if (self.param).createMailCount == true and self.mailCount == nil then
            self.mailCount = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self.icon, "StaticText_" .. self.id .. "_MailCount")
            local mailStackCount = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Slot_MailStackCount_value")
            CopyBaseProperty(mailStackCount, self.mailCount)
            ;
            (self.mailCount):SetSize((self.icon):GetSizeX() - 3, (self.icon):GetSizeY() / 2)
            ;
            (self.mailCount):SetTextHorizonRight()
            ;
            (self.mailCount):SetTextVerticalBottom()
            ;
            (self.mailCount):SetIgnore(true)
          end
          do
            if (self.param).createExpiration == true and self.expiration == nil then
              self.expiration = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_expiration")
              ;
              (self.expiration):SetSize(_config.expirationSize, _config.expirationSize)
              ;
              (self.expiration):SetPosX(_config.expirationPosX)
              ;
              (self.expiration):SetPosY(_config.expirationPosY)
              ;
              (self.expiration):SetIgnore(true)
            end
            if (self.param).createCash == true and self.isCash == nil then
              self.isCash = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_isCash")
              ;
              (self.isCash):SetSize(_config.isCashSize, _config.isCashSize)
              ;
              (self.isCash):SetPosX(_config.isCashPosX)
              ;
              (self.isCash):SetPosY(_config.isCashPosY)
              ;
              (self.isCash):SetIgnore(true)
            end
            if (self.param).createClassEquipBG == true and self.classEquipBG == nil then
              self.classEquipBG = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_classEquipBG_" .. self.id)
              ;
              (self.classEquipBG):SetSize(_config.disableClass, _config.disableClass)
              ;
              (self.classEquipBG):SetPosX(_config.iconSize - _config.disableClass)
              ;
              (self.classEquipBG):SetPosY(_config.iconSize - _config.disableClass)
              ;
              (self.classEquipBG):SetIgnore(true)
            end
            if (self.param).createEnduranceIcon == true and self.enduranceIcon == nil then
              self.enduranceIcon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_enduranceIcon")
              ;
              (self.enduranceIcon):SetSize(_config.iconSize + 1, _config.iconSize + 1)
              ;
              (self.enduranceIcon):SetPosX(0)
              ;
              (self.enduranceIcon):SetPosY(0)
              ;
              (self.enduranceIcon):SetIgnore(true)
            end
            if (self.param).createCooltimeText == true and self.cooltimeText == nil then
              self.cooltimeText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self.icon, "StaticText_" .. self.id .. "_Cooltime")
              ;
              (self.cooltimeText):SetSize(_config.iconSize, _config.iconSize)
              ;
              (self.cooltimeText):SetIgnore(true)
              ;
              (self.cooltimeText):SetShow(false)
              ;
              (self.cooltimeText):SetPosX(0)
              ;
              (self.cooltimeText):SetPosY(0)
              ;
              (self.cooltimeText):SetTextHorizonCenter()
              ;
              (self.cooltimeText):SetTextVerticalCenter()
            end
            if (self.param).createCheckBox == true and self.checkBox == nil then
              self.checkBox = (UI.createControl)(UCT.PA_UI_CONTROL_CHECKBUTTON, self.icon, "CheckButton_" .. self.id)
              ;
              (self.checkBox):SetSize(_config.checkBtnSize, _config.checkBtnSize)
              ;
              (self.checkBox):SetPosX(23)
              ;
              (self.checkBox):SetPosY(1)
              ;
              (self.checkBox):SetIgnore(false)
              ;
              (self.checkBox):SetShow(false)
            end
            if (self.param).createItemLock == true and self.itemLock == nil then
              self.itemLock = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_ItemLock")
              ;
              (self.itemLock):SetSize(_config.iconSize, _config.iconSize)
              ;
              (self.itemLock):SetIgnore(true)
              ;
              (self.itemLock):SetShow(false)
              ;
              (self.itemLock):SetPosX(0)
              ;
              (self.itemLock):SetPosY(0)
            end
            if (self.param).createBagIcon == true and self.bagIcon == nil then
              self.bagIcon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_BagIcon")
              ;
              (self.bagIcon):SetSize(25, 25)
              ;
              (self.bagIcon):SetIgnore(true)
              ;
              (self.bagIcon):SetShow(false)
              ;
              (self.bagIcon):SetPosX(1)
              ;
              (self.bagIcon):SetPosY(1)
            end
            if (self.param).createQuickslotBagIcon == true and self.quickslotBagIcon == nil then
              self.quickslotBagIcon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_QuickSlotBagIcon")
              ;
              (self.quickslotBagIcon):SetSize(25, 25)
              ;
              (self.quickslotBagIcon):SetIgnore(true)
              ;
              (self.quickslotBagIcon):SetShow(false)
              ;
              (self.quickslotBagIcon):SetPosX(1)
              ;
              (self.quickslotBagIcon):SetPosY(1)
            end
            if (self.param).createSoulComplete == true and self.soulComplete == nil then
              self.soulComplete = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self.icon, "Static_" .. self.id .. "_soulComplete")
              ;
              (self.soulComplete):SetSize(15, 15)
              ;
              (self.soulComplete):SetIgnore(true)
              ;
              (self.soulComplete):SetShow(false)
              ;
              (self.soulComplete):SetPosX(27)
              ;
              (self.soulComplete):SetPosY(1)
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.reInclude = function(itemSlot, id, slotNo, parent, param)
  -- function num : 0_2
  if itemSlot == nil then
    itemSlot = {}
  end
  setmetatable(itemSlot, SlotItem)
  itemSlot.slotNo = slotNo
  itemSlot.param = param
  itemSlot.id = id
  local _config = UI.itemSlotConfig
  if itemSlot.icon == nil then
    itemSlot.icon = (UI.getChildControl)(parent, "Static_" .. id)
  end
  if (itemSlot.param).createBorder == true and itemSlot.border == nil then
    itemSlot.border = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "_Border")
  end
  do
    if (itemSlot.param).createExpiration2h == true and itemSlot.Expiration2h == nil then
      local expire2h = (UI.getChildControl)(Panel_Window_Inventory, "Static_Expire_2h")
      itemSlot.expiration2h = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "Expiration2h")
    end
    if (itemSlot.param).createExpirationBG == true and itemSlot.ExpirationBG == nil then
      itemSlot.expirationBG = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "ExpirationBG")
    end
    if (itemSlot.param).createCount == true and itemSlot.count == nil then
      itemSlot.count = (UI.getChildControl)(itemSlot.icon, "StaticText_" .. itemSlot.id .. "_Count")
    end
    if (itemSlot.param).createMailCount == true and itemSlot.mailCount == nil then
      itemSlot.mailCount = (UI.getChildControl)(itemSlot.icon, "StaticText_" .. itemSlot.id .. "_MailCount")
    end
    if (itemSlot.param).createEnchant == true and itemSlot.enchantText == nil then
      itemSlot.enchantText = (UI.getChildControl)(itemSlot.icon, "StaticText_" .. itemSlot.id .. "_Enchant")
    end
    if (itemSlot.param).createRemoteEnchant == true and itemSlot.remoteEnchantText == nil then
      itemSlot.remoteEnchantText = (UI.getChildControl)(itemSlot.icon, "StaticText_" .. itemSlot.id .. "_RemoteEnchant")
    end
    if (itemSlot.param).createCooltime == true and itemSlot.cooltime == nil then
      itemSlot.cooltime = (UI.getChildControl)("StaticCooltime", itemSlot.icon, "StaticCooltime_" .. itemSlot.id)
    end
    if (itemSlot.param).createExpiration == true and itemSlot.expiration == nil then
      itemSlot.expiration = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "_expiration")
    end
    if (itemSlot.param).createCash == true and itemSlot.isCash == nil then
      itemSlot.isCash = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "_isCash")
    end
    if (itemSlot.param).createClassEquipBG == true and itemSlot.classEquipBG == nil then
      itemSlot.classEquipBG = (UI.getChildControl)(itemSlot.icon, "Static_classEquipBG_" .. itemSlot.id)
    end
    if (itemSlot.param).createEnduranceIcon == true and itemSlot.enduranceIcon == nil then
      itemSlot.enduranceIcon = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "_enduranceIcon")
    end
    if (itemSlot.param).createCooltimeText == true and itemSlot.cooltimeText == nil then
      itemSlot.cooltimeText = (UI.getChildControl)(itemSlot.icon, "StaticText_" .. itemSlot.id .. "_Cooltime")
    end
    if (itemSlot.param).createCheckBox == true and itemSlot.checkBox == nil then
      itemSlot.checkBox = (UI.getChildControl)(itemSlot.icon, "CheckButton_" .. itemSlot.id)
    end
    if (itemSlot.param).createItemLock == true and itemSlot.itemLock == nil then
      itemSlot.itemLock = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "_ItemLock")
    end
    if (itemSlot.param).createSoulComplete == true and itemSlot.soulComplete == nil then
      itemSlot.soulComplete = (UI.getChildControl)(itemSlot.icon, "Static_" .. itemSlot.id .. "_soulComplete")
    end
    return itemSlot
  end
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.destroyChild = function(self)
  -- function num : 0_3
  (self.icon):ReleaseTexture()
  if self.border ~= nil then
    (UI.deleteControl)(self.border)
    self.border = nil
  end
  if self.count ~= nil then
    (UI.deleteControl)(self.count)
    self.count = nil
  end
  if self.mailCount ~= nil then
    (UI.deleteControl)(self.mailCount)
    self.mailCount = nil
  end
  if self.enchantText ~= nil then
    (UI.deleteControl)(self.enchantText)
    self.enchantText = nil
  end
  if self.remoteEnchantText ~= nil then
    (UI.deleteControl)(self.remoteEnchantText)
    self.remoteEnchantText = nil
  end
  if self.cooltime ~= nil then
    (UI.deleteControl)(self.cooltime)
    self.cooltime = nil
  end
  if self.expiration ~= nil then
    (UI.deleteControl)(self.expiration)
    self.expiration = nil
  end
  if self.isCash ~= nil then
    (UI.deleteControl)(self.isCash)
    self.isCash = nil
  end
  if self.expiration2h ~= nil then
    (UI.deleteControl)(self.expiration2h)
    self.expiration2h = nil
  end
  if self.expirationBG ~= nil then
    (UI.deleteControl)(self.expirationBG)
    self.expirationBG = nil
  end
  if self.classEquipBG ~= nil then
    (UI.deleteControl)(self.classEquipBG)
    self.classEquipBG = nil
  end
  if self.enduranceIcon ~= nil then
    (UI.deleteControl)(self.enduranceIcon)
    self.enduranceIcon = nil
  end
  if self.cooltimeText ~= nil then
    (UI.deleteControl)(self.cooltimeText)
    self.cooltimeText = nil
  end
  if self.checkBox ~= nil then
    (UI.deleteControl)(self.checkBox)
    self.checkBox = nil
  end
  if self.itemLock ~= nil then
    (UI.deleteControl)(self.itemLock)
    self.itemLock = nil
  end
  if self.bagIcon ~= nil then
    (UI.deleteControl)(self.bagIcon)
    self.bagIcon = nil
  end
  if self.quickslotBagIcon ~= nil then
    (UI.deleteControl)(self.quickslotBagIcon)
    self.quickslotBagIcon = nil
  end
  if self.soulComplete ~= nil then
    (UI.deleteControl)(self.soulComplete)
    self.soulComplete = nil
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.setItem = function(self, itemWrapper, slotNo, equipment)
  -- function num : 0_4
  local itemExpiration = itemWrapper:getExpirationDate()
  local expirationIndex = -1
  if itemExpiration ~= nil and itemExpiration:isIndefinite() == false then
    local s64_Time = itemExpiration:get_s64()
    local s64_remainTime = getLeftSecond_s64(itemExpiration)
    local remainTimePercent = Int64toInt32(s64_remainTime) / (((itemWrapper:getStaticStatus()):get())._expirationPeriod * 60) * 100
    if (Defines.s64_const).s64_0 == s64_remainTime then
      expirationIndex = 2
    else
      if remainTimePercent <= 30 then
        expirationIndex = 1
      else
        expirationIndex = 0
      end
    end
  end
  do
    local currentEndurance = (itemWrapper:get()):getEndurance()
    local isBroken = false
    if currentEndurance == 0 then
      isBroken = true
    end
    local isCash = itemWrapper:isCash()
    local isSoulCollecTor = (itemWrapper:isSoulCollector())
    local soulCount, soulMax = nil, nil
    if isSoulCollecTor == true and self.soulComplete ~= nil then
      soulCount = itemWrapper:getSoulCollectorCount()
      soulMax = itemWrapper:getSoulCollectorMaxCount()
      if soulMax <= soulCount then
        (self.soulComplete):ChangeTextureInfoName("new_ui_common_forlua/Widget/Dialogue/Dialogue_Etc_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(self.soulComplete, 330, 61, 346, 76)
        ;
        ((self.soulComplete):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self.soulComplete):setRenderTexture((self.soulComplete):getBaseTexture())
        ;
        (self.soulComplete):SetShow(true)
      end
    end
    do
      self:setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64(), expirationIndex, isBroken, isCash, isSoulCollecTor, soulCount, soulMax)
      local isAble = requestIsRegisterItemForItemMarket((itemWrapper:get()):getKey())
      if self.isCash ~= nil and isCash and itemWrapper:isSealed() and not (itemWrapper:get()):isVested() and isAble and not (itemWrapper:getStaticStatus()):isStackable() then
        (self.isCash):ChangeTextureInfoName("new_ui_common_forlua/window/ingamecashshop/tax.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(self.isCash, 1, 1, 28, 28)
        ;
        ((self.isCash):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self.isCash):setRenderTexture((self.isCash):getBaseTexture())
      end
      do
        local whereType = Inventory_GetCurrentInventoryType()
        if slotNo ~= nil and not isCash and self.itemLock ~= nil then
          if equipment ~= true then
            if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
              (self.itemLock):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Item_Lock.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(self.itemLock, 1, 1, 42, 42)
              ;
              ((self.itemLock):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (self.itemLock):setRenderTexture((self.itemLock):getBaseTexture())
              ;
              (self.itemLock):SetShow(true)
            else
              do
                ;
                (self.itemLock):SetShow(false)
                if ToClient_EquipSlot_CheckItemLock(slotNo, 1) then
                  (self.itemLock):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Item_Lock.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(self.itemLock, 1, 1, 42, 42)
                  ;
                  ((self.itemLock):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (self.itemLock):setRenderTexture((self.itemLock):getBaseTexture())
                  ;
                  (self.itemLock):SetShow(true)
                else
                  do
                    ;
                    (self.itemLock):SetShow(false)
                    if self.bagIcon ~= nil then
                      (self.bagIcon):SetShow(false)
                      local itemSSW = itemWrapper:getStaticStatus()
                      if (CppEnums.ContentsEventType).ContentsType_InventoryBag == (itemSSW:get()):getContentsEventType() then
                        local bagSize = itemSSW:getContentsEventParam2()
                        local whereType = (CppEnums.ItemWhereType).eInventory
                        if (itemSSW:get()):isCash() then
                          whereType = (CppEnums.ItemWhereType).eCashInventory
                        end
                        for index = 0, bagSize - 1 do
                          local bagItemWrapper = getInventoryBagItemByType(whereType, slotNo, index)
                          if bagItemWrapper ~= nil then
                            local iconPath = (bagItemWrapper:getStaticStatus()):getIconPath()
                            ;
                            (self.bagIcon):ChangeTextureInfoName("icon/" .. iconPath)
                            ;
                            (self.bagIcon):SetShow(true)
                            break
                          end
                        end
                      end
                    end
                    do
                      if self.quickslotBagIcon ~= nil then
                        (self.quickslotBagIcon):SetShow(false)
                        local itemSSW = itemWrapper:getStaticStatus()
                        if (CppEnums.ContentsEventType).ContentsType_InventoryBag == (itemSSW:get()):getContentsEventType() then
                          local bagSize = itemSSW:getContentsEventParam2()
                          local whereType = (CppEnums.ItemWhereType).eInventory
                          if (itemSSW:get()):isCash() then
                            whereType = (CppEnums.ItemWhereType).eCashInventory
                          end
                          for index = 0, bagSize - 1 do
                            local bagItemWrapper = getInventoryBagItemByType(whereType, slotNo, index)
                            if bagItemWrapper ~= nil then
                              local iconPath = (bagItemWrapper:getStaticStatus()):getIconPath()
                              ;
                              (self.quickslotBagIcon):ChangeTextureInfoName("icon/" .. iconPath)
                              ;
                              (self.quickslotBagIcon):SetShow(true)
                              break
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

-- DECOMPILER ERROR at PC127: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.setItemByStaticStatus = function(self, itemStaticWrapper, s64_stackCount, expirationIndex, isBroken, isCash, isSoulCollecTor, soulCount, soulMax)
  -- function num : 0_5
  if not s64_stackCount then
    s64_stackCount = toInt64(0, 0)
  end
  if self.icon ~= nil then
    (self.icon):ChangeTextureInfoName("Icon/" .. itemStaticWrapper:getIconPath())
    ;
    (self.icon):SetAlpha(1)
  end
  if self.border ~= nil then
    local gradeType = itemStaticWrapper:getGradeType()
    if gradeType > 0 and gradeType <= #(UI.itemSlotConfig).borderTexture then
      (self.border):ChangeTextureInfoName((((UI.itemSlotConfig).borderTexture)[gradeType]).texture)
      local x1, y1, x2, y2 = setTextureUV_Func(self.border, (((UI.itemSlotConfig).borderTexture)[gradeType]).x1, (((UI.itemSlotConfig).borderTexture)[gradeType]).y1, (((UI.itemSlotConfig).borderTexture)[gradeType]).x2, (((UI.itemSlotConfig).borderTexture)[gradeType]).y2)
      ;
      ((self.border):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (self.border):setRenderTexture((self.border):getBaseTexture())
      ;
      (self.border):SetShow(true)
    else
      do
        do
          ;
          (self.border):ReleaseTexture()
          ;
          (self.border):ChangeTextureInfoName("")
          if self.count ~= nil then
            local itemStatic = itemStaticWrapper:get()
            if itemStatic then
              if itemStatic._isStack then
                (self.count):SetText(tostring(s64_stackCount))
                ;
                (self.count):SetShow(true)
              else
              end
              if isSoulCollecTor == true then
                do
                  (self.count):SetText("")
                  ;
                  (self.count):SetText("")
                  do
                    if self.mailCount ~= nil then
                      local itemStatic = itemStaticWrapper:get()
                      if itemStatic and itemStatic._isStack then
                        (self.mailCount):SetText(makeDotMoney(s64_stackCount))
                        ;
                        (self.mailCount):SetShow(true)
                      else
                        ;
                        (self.mailCount):SetText("")
                      end
                    end
                    do
                      if self.enchantText ~= nil then
                        local itemStatic = itemStaticWrapper:get()
                        if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() > 0 and (itemStatic._key):getEnchantLevel() < 16 then
                          (self.enchantText):SetText("+" .. tostring((itemStatic._key):getEnchantLevel()))
                          ;
                          (self.enchantText):SetShow(true)
                        else
                          if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 16 then
                            (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
                            ;
                            (self.enchantText):SetShow(true)
                          else
                            if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 17 then
                              (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
                              ;
                              (self.enchantText):SetShow(true)
                            else
                              if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 18 then
                                (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
                                ;
                                (self.enchantText):SetShow(true)
                              else
                                if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 19 then
                                  (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
                                  ;
                                  (self.enchantText):SetShow(true)
                                else
                                  if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 20 then
                                    (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
                                    ;
                                    (self.enchantText):SetShow(true)
                                  else
                                    ;
                                    (self.enchantText):SetText("")
                                  end
                                end
                              end
                            end
                          end
                        end
                        if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemStaticWrapper:getItemClassify() then
                          if (itemStatic._key):getEnchantLevel() == 1 then
                            (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
                            ;
                            (self.enchantText):SetShow(true)
                          else
                            if (itemStatic._key):getEnchantLevel() == 2 then
                              (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
                              ;
                              (self.enchantText):SetShow(true)
                            else
                              if (itemStatic._key):getEnchantLevel() == 3 then
                                (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
                                ;
                                (self.enchantText):SetShow(true)
                              else
                                if (itemStatic._key):getEnchantLevel() == 4 then
                                  (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
                                  ;
                                  (self.enchantText):SetShow(true)
                                else
                                  if (itemStatic._key):getEnchantLevel() == 5 then
                                    (self.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
                                    ;
                                    (self.enchantText):SetShow(true)
                                  end
                                end
                              end
                            end
                          end
                        end
                        if itemStatic:isCash() then
                          (self.enchantText):SetShow(false)
                        end
                      end
                      do
                        if self.remoteEnchantText ~= nil then
                          local itemStatic = itemStaticWrapper:get()
                          if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() > 0 and (itemStatic._key):getEnchantLevel() < 16 then
                            (self.remoteEnchantText):SetText("+" .. tostring((itemStatic._key):getEnchantLevel()))
                            ;
                            (self.remoteEnchantText):SetShow(true)
                          else
                            if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 16 then
                              (self.remoteEnchantText):SetText("I")
                              ;
                              (self.remoteEnchantText):SetShow(true)
                            else
                              if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 17 then
                                (self.remoteEnchantText):SetText("II")
                                ;
                                (self.remoteEnchantText):SetShow(true)
                              else
                                if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 18 then
                                  (self.remoteEnchantText):SetText("III")
                                  ;
                                  (self.remoteEnchantText):SetShow(true)
                                else
                                  if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 19 then
                                    (self.remoteEnchantText):SetText("IV")
                                    ;
                                    (self.remoteEnchantText):SetShow(true)
                                  else
                                    if itemStatic:isEquipable() and (itemStatic._key):getEnchantLevel() == 20 then
                                      (self.remoteEnchantText):SetText("V")
                                      ;
                                      (self.remoteEnchantText):SetShow(true)
                                    else
                                      ;
                                      (self.remoteEnchantText):SetText("")
                                    end
                                  end
                                end
                              end
                            end
                          end
                          if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemStaticWrapper:getItemClassify() then
                            if (itemStatic._key):getEnchantLevel() == 1 then
                              (self.remoteEnchantText):SetText("I")
                              ;
                              (self.remoteEnchantText):SetShow(true)
                            else
                              if (itemStatic._key):getEnchantLevel() == 2 then
                                (self.remoteEnchantText):SetText("II")
                                ;
                                (self.remoteEnchantText):SetShow(true)
                              else
                                if (itemStatic._key):getEnchantLevel() == 3 then
                                  (self.remoteEnchantText):SetText("III")
                                  ;
                                  (self.remoteEnchantText):SetShow(true)
                                else
                                  if (itemStatic._key):getEnchantLevel() == 4 then
                                    (self.remoteEnchantText):SetText("IV")
                                    ;
                                    (self.remoteEnchantText):SetShow(true)
                                  else
                                    if (itemStatic._key):getEnchantLevel() == 5 then
                                      (self.remoteEnchantText):SetText("V")
                                      ;
                                      (self.remoteEnchantText):SetShow(true)
                                    end
                                  end
                                end
                              end
                            end
                          end
                          if itemStatic:isCash() then
                            (self.remoteEnchantText):SetShow(false)
                          end
                        end
                        if self.expiration ~= nil then
                          if expirationIndex ~= -1 then
                            (self.expiration):ChangeTextureInfoName((((UI.itemSlotConfig).expirationTexture)[expirationIndex]).texture)
                            local x1, y1, x2, y2 = setTextureUV_Func(self.expiration, (((UI.itemSlotConfig).expirationTexture)[expirationIndex]).x1, (((UI.itemSlotConfig).expirationTexture)[expirationIndex]).y1, (((UI.itemSlotConfig).expirationTexture)[expirationIndex]).x2, (((UI.itemSlotConfig).expirationTexture)[expirationIndex]).y2)
                            ;
                            ((self.expiration):getBaseTexture()):setUV(x1, y1, x2, y2)
                            ;
                            (self.expiration):setRenderTexture((self.expiration):getBaseTexture())
                            ;
                            (self.expiration):SetShow(true)
                          else
                            do
                              ;
                              (self.expiration):SetShow(false)
                              if self.expiration2h ~= nil then
                                if expirationIndex == 1 then
                                  local x1, y1, x2, y2 = setTextureUV_Func(self.expiration2h, 1, 91, 44, 134)
                                  ;
                                  ((self.expiration2h):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (self.expiration2h):setRenderTexture((self.expiration2h):getBaseTexture())
                                  ;
                                  (self.expiration2h):SetShow(true)
                                else
                                  do
                                    ;
                                    (self.expiration2h):SetShow(false)
                                    if self.isCash ~= nil then
                                      if (itemStaticWrapper:get()):isCash() then
                                        (self.isCash):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/CashIcon.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(self.isCash, 1, 1, 28, 28)
                                        ;
                                        ((self.isCash):getBaseTexture()):setUV(x1, y1, x2, y2)
                                        ;
                                        (self.isCash):setRenderTexture((self.isCash):getBaseTexture())
                                        ;
                                        (self.isCash):SetShow(true)
                                      else
                                        do
                                          ;
                                          (self.isCash):SetShow(false)
                                          if self.expirationBG ~= nil then
                                            if expirationIndex == 2 then
                                              (self.expirationBG):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/inventory_01.dds")
                                              local x1, y1, x2, y2 = setTextureUV_Func(self.expirationBG, 1, 1, 44, 44)
                                              ;
                                              ((self.expirationBG):getBaseTexture()):setUV(x1, y1, x2, y2)
                                              ;
                                              (self.expirationBG):setRenderTexture((self.expirationBG):getBaseTexture())
                                              ;
                                              (self.expirationBG):SetShow(true)
                                            else
                                              do
                                                ;
                                                (self.expirationBG):SetShow(false)
                                                if self.classEquipBG ~= nil then
                                                  (self.classEquipBG):SetShow(false)
                                                  local isUsableClass = nil
                                                  local itemSSW = itemStaticWrapper
                                                  local classType = (getSelfPlayer()):getClassType()
                                                  if itemSSW ~= nil then
                                                    if (itemSSW:get()):isWeapon() or (itemSSW:get()):isSubWeapon() or (itemSSW:get()):isAwakenWeapon() then
                                                      isUsableClass = ((itemSSW:get())._usableClassType):isOn(classType)
                                                    else
                                                      isUsableClass = true
                                                    end
                                                  else
                                                    isUsableClass = false
                                                  end
                                                  if (itemSSW:get()):isEquipable() == true and isUsableClass == false then
                                                    (self.classEquipBG):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Disable_Class.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(self.classEquipBG, 1, 1, 12, 12)
                                                    ;
                                                    ((self.classEquipBG):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    ;
                                                    (self.classEquipBG):setRenderTexture((self.classEquipBG):getBaseTexture())
                                                    ;
                                                    (self.classEquipBG):SetShow(true)
                                                  end
                                                end
                                                do
                                                  local equipSlotNo = itemStaticWrapper:getEquipSlotNo()
                                                  if self.enduranceIcon ~= nil then
                                                    (self.enduranceIcon):SetShow(false)
                                                    if isBroken == true then
                                                      if equipSlotNo == 2 then
                                                        (self.enduranceIcon):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Disable_Repair.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(self.enduranceIcon, 1, 1, 41, 41)
                                                        ;
                                                        ((self.enduranceIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                        ;
                                                        (self.enduranceIcon):setRenderTexture((self.enduranceIcon):getBaseTexture())
                                                        ;
                                                        (self.enduranceIcon):SetShow(true)
                                                      else
                                                        do
                                                          ;
                                                          (self.enduranceIcon):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Need_Repair.dds")
                                                          do
                                                            local x1, y1, x2, y2 = setTextureUV_Func(self.enduranceIcon, 1, 1, 41, 41)
                                                            ;
                                                            ((self.enduranceIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                            ;
                                                            (self.enduranceIcon):setRenderTexture((self.enduranceIcon):getBaseTexture())
                                                            ;
                                                            (self.enduranceIcon):SetShow(true)
                                                            if self.checkBox ~= nil then
                                                              (self.checkBox):ChangeTextureInfoName((((UI.itemSlotConfig).checkBtnTexture)[0]).texture)
                                                              local x1, y1, x2, y2 = setTextureUV_Func(self.checkBox, (((UI.itemSlotConfig).checkBtnTexture)[0]).x1, (((UI.itemSlotConfig).checkBtnTexture)[0]).y1, (((UI.itemSlotConfig).checkBtnTexture)[0]).x2, (((UI.itemSlotConfig).checkBtnTexture)[0]).y2)
                                                              ;
                                                              ((self.checkBox):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                              ;
                                                              (self.checkBox):setRenderTexture((self.checkBox):getBaseTexture())
                                                              ;
                                                              (self.checkBox):ChangeOnTextureInfoName((((UI.itemSlotConfig).checkBtnTexture)[1]).texture)
                                                              local x1, y1, x2, y2 = setTextureUV_Func(self.checkBox, (((UI.itemSlotConfig).checkBtnTexture)[1]).x1, (((UI.itemSlotConfig).checkBtnTexture)[1]).y1, (((UI.itemSlotConfig).checkBtnTexture)[1]).x2, (((UI.itemSlotConfig).checkBtnTexture)[1]).y2)
                                                              ;
                                                              ((self.checkBox):getOnTexture()):setUV(x1, y1, x2, y2)
                                                              ;
                                                              (self.checkBox):ChangeClickTextureInfoName((((UI.itemSlotConfig).checkBtnTexture)[2]).texture)
                                                              local x1, y1, x2, y2 = setTextureUV_Func(self.checkBox, (((UI.itemSlotConfig).checkBtnTexture)[2]).x1, (((UI.itemSlotConfig).checkBtnTexture)[2]).y1, (((UI.itemSlotConfig).checkBtnTexture)[2]).x2, (((UI.itemSlotConfig).checkBtnTexture)[2]).y2)
                                                              ;
                                                              ((self.checkBox):getClickTexture()):setUV(x1, y1, x2, y2)
                                                              ;
                                                              (self.checkBox):SetShow(false)
                                                              ;
                                                              (self.checkBox):SetCheck(true)
                                                            end
                                                            do
                                                              if self.quickslotBagIcon ~= nil then
                                                                (self.quickslotBagIcon):SetShow(false)
                                                                local itemSSW = itemStaticWrapper
                                                                if (CppEnums.ContentsEventType).ContentsType_InventoryBag == (itemSSW:get()):getContentsEventType() then
                                                                  local bagSize = itemSSW:getContentsEventParam2()
                                                                  local whereType = (CppEnums.ItemWhereType).eInventory
                                                                  if (itemSSW:get()):isCash() then
                                                                    whereType = (CppEnums.ItemWhereType).eCashInventory
                                                                  end
                                                                  local inventory = ((getSelfPlayer()):get()):getInventoryByType(whereType)
                                                                  local invenSlotNo = inventory:getSlot((itemSSW:get())._key)
                                                                  for index = 0, bagSize - 1 do
                                                                    local quickSlotBagItemWrapper = getInventoryBagItemByType(whereType, invenSlotNo, index)
                                                                    if quickSlotBagItemWrapper ~= nil then
                                                                      local iconPath = (quickSlotBagItemWrapper:getStaticStatus()):getIconPath()
                                                                      ;
                                                                      (self.quickslotBagIcon):ChangeTextureInfoName("icon/" .. iconPath)
                                                                      ;
                                                                      (self.quickslotBagIcon):SetShow(true)
                                                                      break
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
      end
    end
  end
end

-- DECOMPILER ERROR at PC130: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.setItemByCashProductStaticStatus = function(self, cashProductStaticWrapper, s64_stackCount)
  -- function num : 0_6
  if not s64_stackCount then
    s64_stackCount = toInt64(0, 0)
  end
  if self.icon ~= nil then
    (self.icon):ChangeTextureInfoName("Icon/" .. cashProductStaticWrapper:getIconPath())
    ;
    (self.icon):SetAlpha(1)
  end
  if self.count ~= nil then
    if toInt64(0, 0) < s64_stackCount then
      (self.count):SetText(tostring(s64_stackCount))
      ;
      (self.count):SetShow(true)
    else
      ;
      (self.count):SetText("")
    end
  end
  if self.mailCount ~= nil then
    if toInt64(0, 0) < s64_stackCount then
      (self.mailCount):SetText(makeDotMoney(s64_stackCount))
      ;
      (self.mailCount):SetShow(true)
    else
      ;
      (self.mailCount):SetText("")
    end
  end
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R2 in 'UnsetPending'

SlotItem.clearItem = function(self)
  -- function num : 0_7
  if self.icon ~= nil then
    (self.icon):ReleaseTexture()
    ;
    (self.icon):ChangeTextureInfoName("")
    ;
    (self.icon):SetAlpha(0)
  end
  if self.border ~= nil then
    (self.border):ReleaseTexture()
    ;
    (self.border):SetShow(false)
  end
  if self.count ~= nil then
    (self.count):SetShow(false)
  end
  if self.mailCount ~= nil then
    (self.mailCount):SetShow(false)
  end
  if self.enchantText ~= nil then
    (self.enchantText):SetShow(false)
  end
  if self.remoteEnchantText ~= nil then
    (self.remoteEnchantText):SetShow(false)
  end
  if self.cooltime ~= nil then
    (self.cooltime):SetShow(false)
  end
  if self.expiration ~= nil then
    (self.expiration):SetShow(false)
  end
  if self.isCash ~= nil then
    (self.isCash):SetShow(false)
  end
  if self.expiration2h ~= nil then
    (self.expiration2h):SetShow(false)
  end
  if self.expirationBG ~= nil then
    (self.expirationBG):SetShow(false)
  end
  if self.classEquipBG ~= nil then
    (self.classEquipBG):SetShow(false)
  end
  if self.enduranceIcon ~= nil then
    (self.enduranceIcon):SetShow(false)
  end
  if self.cooltimeText ~= nil then
    (self.cooltimeText):SetShow(false)
  end
  if self.checkBox ~= nil then
    (self.checkBox):SetShow(false)
  end
  if self.itemLock ~= nil then
    (self.itemLock):SetShow(false)
  end
  if self.soulComplete ~= nil then
    (self.soulComplete):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R2 in 'UnsetPending'

UI.skillSlotConfig = {iconSize = 42, levelPosX = -15, levelPosY = -11, learnBtnSpanSize = -2}
SlotSkill = {}
-- DECOMPILER ERROR at PC145: Confused about usage of register: R2 in 'UnsetPending'

SlotSkill.__index = SlotSkill
-- DECOMPILER ERROR at PC149: Confused about usage of register: R2 in 'UnsetPending'

SlotSkill.new = function(skillSlot, skillNo, parent, param)
  -- function num : 0_8 , upvalues : UCT
  if skillSlot == nil then
    skillSlot = {}
  end
  setmetatable(skillSlot, SlotSkill)
  if type(skillNo) == "number" then
    skillSlot.skillNo = skillNo
  end
  skillSlot.param = param
  local _config = UI.skillSlotConfig
  if param.createIcon == true and skillSlot.icon == nil then
    skillSlot.icon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_" .. skillNo)
    ;
    (skillSlot.icon):SetSize(_config.iconSize, _config.iconSize)
    ;
    (skillSlot.icon):ActiveMouseEventEffect(true)
    ;
    (skillSlot.icon):SetIgnore(false)
  end
  if param.createEffect == true and skillSlot.effect == nil then
    skillSlot.effect = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_Effect_" .. skillNo)
    CopyBaseProperty((param.template).effect, skillSlot.effect)
    ;
    (skillSlot.effect):SetIgnore(true)
  end
  if param.createFG == true and skillSlot.iconFG == nil then
    skillSlot.iconFG = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_Foreground_" .. skillNo)
    CopyBaseProperty((param.template).iconFG, skillSlot.iconFG)
    ;
    (skillSlot.iconFG):SetIgnore(true)
  end
  if param.createFGDisabled == true and skillSlot.iconFGDisabled == nil then
    skillSlot.iconFGDisabled = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_Foreground_Disable" .. skillNo)
    CopyBaseProperty((param.template).iconFGDisabled, skillSlot.iconFGDisabled)
    ;
    (skillSlot.iconFGDisabled):SetIgnore(true)
  end
  if param.createFG_Passive == true and skillSlot.iconFG_Passive == nil then
    skillSlot.iconFG_Passive = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_Foreground_Passive" .. skillNo)
    CopyBaseProperty((param.template).iconFG_Passive, skillSlot.iconFG_Passive)
    ;
    (skillSlot.iconFG_Passive):SetIgnore(true)
  end
  if param.createMinus == true and skillSlot.iconMinus == nil then
    skillSlot.iconMinus = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_Minus" .. skillNo)
    CopyBaseProperty((param.template).iconMinus, skillSlot.iconMinus)
    ;
    (skillSlot.iconMinus):SetIgnore(true)
    ;
    (skillSlot.iconMinus):SetShow(false)
  end
  if param.createLearnButton == true and skillSlot.learnButton == nil then
    skillSlot.learnButton = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, parent, "StaticSkill_Learn_" .. skillNo)
    CopyBaseProperty((param.template).learnButton, skillSlot.learnButton)
    ;
    (skillSlot.learnButton):SetIgnore(false)
    ;
    (skillSlot.learnButton):SetShow(false)
  end
  if param.createMouseOver == true and skillSlot.mouseOverButton == nil then
    skillSlot.mouseOverButton = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_OverMouse_" .. skillNo)
    CopyBaseProperty((param.template).mouseOverButton, skillSlot.mouseOverButton)
    ;
    (skillSlot.mouseOverButton):SetIgnore(false)
    ;
    (skillSlot.mouseOverButton):SetShow(false)
  end
  if param.createReservationButton == true and skillSlot.reservationButton == nil then
    skillSlot.reservationButton = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, parent, "StaticSkill_Reservation_" .. skillNo)
    CopyBaseProperty((param.template).reservationButton, skillSlot.reservationButton)
    ;
    (skillSlot.reservationButton):SetIgnore(false)
    ;
    (skillSlot.reservationButton):SetShow(false)
  end
  if param.createCooltime == true and skillSlot.cooltime == nil then
    skillSlot.cooltime = (UI.createCustomControl)("StaticCooltime", parent, "StaticCooltime_" .. skillNo)
    ;
    (skillSlot.cooltime):SetMonoTone(true)
    ;
    (skillSlot.cooltime):SetSize(_config.iconSize, _config.iconSize)
    ;
    (skillSlot.cooltime):SetIgnore(true)
    ;
    (skillSlot.cooltime):SetShow(false)
  end
  if param.createTestimonial == true and skillSlot.testimonial == nil then
    skillSlot.testimonial = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_testimonial_" .. skillNo)
    CopyBaseProperty((param.template).testimonial, skillSlot.testimonial)
    ;
    (skillSlot.testimonial):SetIgnore(true)
    ;
    (skillSlot.testimonial):SetShow(false)
  end
  if param.createCooltimeText == true and skillSlot.cooltimeText == nil then
    skillSlot.cooltimeText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, parent, "StaticText_" .. skillNo .. "_Cooltime")
    ;
    (skillSlot.cooltimeText):SetSize(_config.iconSize, _config.iconSize)
    ;
    (skillSlot.cooltimeText):SetIgnore(true)
    ;
    (skillSlot.cooltimeText):SetShow(false)
    ;
    (skillSlot.cooltimeText):SetTextHorizonCenter()
    ;
    (skillSlot.cooltimeText):SetTextVerticalCenter()
  end
  if param.createLockIcon == true and skillSlot.lockIcon == nil then
    skillSlot.lockIcon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, parent, "StaticSkill_LockIcon_" .. skillNo)
    CopyBaseProperty((param.template).lockIcon, skillSlot.lockIcon)
    ;
    (skillSlot.lockIcon):SetShow(false)
  end
  return skillSlot
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R2 in 'UnsetPending'

SlotSkill.setPos = function(self, posX, posY)
  -- function num : 0_9
  local _config = UI.skillSlotConfig
  local iconSizeX, iconSizeY = nil, nil
  iconSizeX = _config.iconSize
  iconSizeY = _config.iconSize
  if self.icon ~= nil then
    (self.icon):SetPosX(posX)
    ;
    (self.icon):SetPosY(posY)
    iconSizeX = (self.icon):GetSizeX()
    iconSizeY = (self.icon):GetSizeY()
  end
  if self.effect ~= nil then
    (self.effect):SetPosX(posX + (iconSizeX - (self.effect):GetSizeX()) / 2)
    ;
    (self.effect):SetPosY(posY + (iconSizeY - (self.effect):GetSizeY()) / 2)
  end
  if self.iconFG ~= nil then
    (self.iconFG):SetPosX(posX + (iconSizeX - (self.iconFG):GetSizeX()) / 2)
    ;
    (self.iconFG):SetPosY(posY + (iconSizeY - (self.iconFG):GetSizeY()) / 2)
  end
  if self.iconFGDisabled ~= nil then
    (self.iconFGDisabled):SetPosX(posX + (iconSizeX - (self.iconFGDisabled):GetSizeX()) / 2)
    ;
    (self.iconFGDisabled):SetPosY(posY + (iconSizeY - (self.iconFGDisabled):GetSizeY()) / 2)
  end
  if self.iconFG_Passive ~= nil then
    (self.iconFG_Passive):SetPosX(posX + (iconSizeX - (self.iconFG_Passive):GetSizeX()) / 2)
    ;
    (self.iconFG_Passive):SetPosY(posY + (iconSizeY - (self.iconFG_Passive):GetSizeY()) / 2)
  end
  if self.iconMinus ~= nil then
    (self.iconMinus):SetPosX(posX + (iconSizeX - (self.iconMinus):GetSizeX()) / 2)
    ;
    (self.iconMinus):SetPosY(posY + (iconSizeY - (self.iconMinus):GetSizeY()) / 2)
  end
  if self.learnButton ~= nil then
    (self.learnButton):SetPosX(posX + iconSizeX - ((self.learnButton):GetSizeX() - 9))
    ;
    (self.learnButton):SetPosY(posY + iconSizeY - ((self.learnButton):GetSizeY() - 9))
  end
  if self.mouseOverButton ~= nil then
    (self.mouseOverButton):SetPosX(posX + iconSizeX - ((self.mouseOverButton):GetSizeX() - 10))
    ;
    (self.mouseOverButton):SetPosY(posY + iconSizeY - ((self.mouseOverButton):GetSizeY() - 10))
  end
  if self.reservationButton ~= nil then
    (self.reservationButton):SetPosX(posX + iconSizeX - ((self.reservationButton):GetSizeX() + _config.learnBtnSpanSize))
    ;
    (self.reservationButton):SetPosY(posY + iconSizeY - ((self.reservationButton):GetSizeY() + _config.learnBtnSpanSize))
  end
  if self.cooltime ~= nil then
    (self.cooltime):SetPosX(posX)
    ;
    (self.cooltime):SetPosY(posY)
  end
  if self.testimonial ~= nil then
    (self.testimonial):SetPosX(posX + (iconSizeX - (self.testimonial):GetSizeX()) / 2)
    ;
    (self.testimonial):SetPosY(posY + (iconSizeY - (self.testimonial):GetSizeY()) / 2)
  end
  if self.cooltimeText ~= nil then
    (self.cooltimeText):SetPosX(posX)
    ;
    (self.cooltimeText):SetPosY(posY)
  end
  if self.lockIcon ~= nil then
    (self.lockIcon):SetPosX(posX + (self.lockIcon):GetSizeX() - 4)
    ;
    (self.lockIcon):SetPosY(posY - 4)
  end
end

-- DECOMPILER ERROR at PC155: Confused about usage of register: R2 in 'UnsetPending'

SlotSkill.destroyChild = function(self)
  -- function num : 0_10
  if self.icon ~= nil then
    (UI.deleteControl)(self.icon)
    self.icon = nil
  end
  if self.effect ~= nil then
    (UI.deleteControl)(self.effect)
    self.effect = nil
  end
  if self.iconFG ~= nil then
    (UI.deleteControl)(self.iconFG)
    self.iconFG = nil
  end
  if self.iconFGDisabled ~= nil then
    (UI.deleteControl)(self.iconFGDisabled)
    self.iconFGDisabled = nil
  end
  if self.iconFG_Passive ~= nil then
    (UI.deleteControl)(self.iconFG_Passive)
    self.iconFG_Passive = nil
  end
  if self.iconMinus ~= nil then
    (UI.deleteControl)(self.iconMinus)
    self.iconMinus = nil
  end
  if self.learnButton ~= nil then
    (UI.deleteControl)(self.learnButton)
    self.learnButton = nil
  end
  if self.mouseOverButton ~= nil then
    (UI.deleteControl)(self.mouseOverButton)
    self.mouseOverButton = nil
  end
  if self.reservationButton ~= nil then
    (UI.deleteControl)(self.reservationButton)
    self.reservationButton = nil
  end
  if self.cooltime ~= nil then
    (UI.deleteControl)(self.cooltime)
    self.cooltime = nil
  end
  if self.testimonial ~= nil then
    (UI.deleteControl)(self.testimonial)
    self.testimonial = nil
  end
  if self.cooltimeText ~= nil then
    (UI.deleteControl)(self.cooltimeText)
    self.cooltimeText = nil
  end
  if self.lockIcon ~= nil then
    (UI.deleteControl)(self.lockIcon)
    self.lockIcon = nil
  end
end

-- DECOMPILER ERROR at PC158: Confused about usage of register: R2 in 'UnsetPending'

SlotSkill.setSkillTypeStatic = function(self, skillTypeStaticWrapper, skillNo)
  -- function num : 0_11
  if self.icon ~= nil then
    (self.icon):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
    ;
    (self.icon):SetAlpha(1)
  end
  if skillNo ~= nil then
    self.skillNo = skillNo
  end
end

-- DECOMPILER ERROR at PC161: Confused about usage of register: R2 in 'UnsetPending'

SlotSkill.setSkill = function(self, skillLevelInfo, isLearnMode)
  -- function num : 0_12
  do
    if self.skillNo ~= (skillLevelInfo._skillKey):getSkillNo() then
      local skillTypeStaticWrapper = getSkillTypeStaticStatus((skillLevelInfo._skillKey):getSkillNo())
      self:setSkillTypeStatic(skillTypeStaticWrapper, (skillLevelInfo._skillKey):getSkillNo())
    end
    if self.icon == nil or not isLearnMode or self.iconFG ~= nil then
      (self.iconFG):SetShow(skillLevelInfo._usable)
    end
    if self.iconFGDisabled ~= nil then
      (self.iconFGDisabled):SetShow(not skillLevelInfo._usable)
    end
    if self.iconFG_Passive ~= nil then
      (self.iconFG_Passive):SetShow(not skillLevelInfo._usable)
    end
    if self.reservationButton ~= nil then
      if isLearnMode then
        (self.reservationButton):SetShow(skillLevelInfo._isReservedLearning)
        if self.testimonial ~= nil then
          (self.testimonial):SetShow(skillLevelInfo._isTestimonial)
        end
        local resultAble = false
        if self.learnButton ~= nil then
          local skillStatic = getSkillStaticStatus((skillLevelInfo._skillKey):getSkillNo(), 1)
          local enableLearn = true
          do
            do
              if skillStatic ~= nil then
                local needLvLearning = (skillStatic:get())._needCharacterLevelForLearning
                if needLvLearning == 0 then
                  enableLearn = false
                end
              end
              resultAble = not isLearnMode or not skillLevelInfo._learnable or enableLearn
              ;
              (self.learnButton):SetShow(resultAble)
              return resultAble
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC164: Confused about usage of register: R2 in 'UnsetPending'

SlotSkill.clearSkill = function(self)
  -- function num : 0_13
  self.skillNo = nil
  if self.icon ~= nil then
    (self.icon):ReleaseTexture()
    ;
    (self.icon):SetAlpha(0)
  end
  if self.effect ~= nil then
    (self.effect):SetShow(false)
  end
  if self.iconFG ~= nil then
    (self.iconFG):SetShow(false)
  end
  if self.iconFGDisabled ~= nil then
    (self.iconFGDisabled):SetShow(false)
  end
  if self.iconFG_Passive ~= nil then
    (self.iconFG_Passive):SetShow(false)
  end
  if self.iconMinus ~= nil then
    (self.iconMinus):SetShow(false)
  end
  if self.learnButton ~= nil then
    (self.learnButton):SetShow(false)
  end
  if self.mouseOverButton ~= nil then
    (self.learnButton):SetShow(false)
  end
  if self.reservationButton ~= nil then
    (self.reservationButton):SetShow(false)
  end
  if self.cooltime ~= nil then
    (self.cooltime):SetShow(false)
  end
  if self.testimonial ~= nil then
    (self.testimonial):SetShow(false)
  end
  if self.cooltimeText ~= nil then
    (self.cooltimeText):SetShow(false)
  end
  if self.lockIcon ~= nil then
    (self.lockIcon):SetShow(false)
  end
end

HighEnchantLevel_ReplaceString = function(enchantLevel)
  -- function num : 0_14
  if enchantLevel == 16 then
    return PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_16")
  else
    if enchantLevel == 17 then
      return PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_17")
    else
      if enchantLevel == 18 then
        return PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_18")
      else
        if enchantLevel == 19 then
          return PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_19")
        else
          if enchantLevel == 20 then
            return PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_20")
          else
            return PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_UI_SLOT_ENCHANTLEVEL_20")
          end
        end
      end
    end
  end
end


