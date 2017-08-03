-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\quickslot\panel_quickslot.luac 

-- params : ...
-- function num : 0
Panel_QuickSlot:SetShow(false, false)
Panel_QuickSlot:SetPosX((getScreenSizeX() - Panel_QuickSlot:GetSizeX()) / 2)
Panel_QuickSlot:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY())
isUseNewQuickSlot = function()
  -- function num : 0_0
  if (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).NewQuickSlot) == true then
    if PaGlobal_TutorialManager:isDoingTutorial() == true and PaGlobal_TutorialManager:isAllowNewQuickSlot() == false then
      return false
    end
    return true
  end
  return false
end

local UI_TM = CppEnums.TextMode
Panel_QuickSlot:RegisterShowEventFunc(true, "QuickSlot_ShowAni()")
Panel_QuickSlot:RegisterShowEventFunc(false, "QuickSlot_HideAni()")
Panel_CoolTime_Effect_Item_Slot:RegisterShowEventFunc(true, "QuickSlot_ItemCoolTimeEffect_HideAni()")
Panel_CoolTime_Effect_Slot:RegisterShowEventFunc(true, "QuickSlot_SkillCoolTimeEffect_HideAni()")
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TISNU = CppEnums.TInventorySlotNoUndefined
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local quickSlotBg = (UI.getChildControl)(Panel_QuickSlot, "Static_Main_BG")
local quickSlotText = (UI.getChildControl)(Panel_QuickSlot, "StaticText_quickSlot")
local quickSlot = {
slotConfig_Item = {createIcon = true, createBorder = false, createCount = true, createCooltime = true, createCooltimeText = true, createCash = true, createEnchant = true, createQuickslotBagIcon = true}
, 
slotConfig_Skill = {createIcon = true, createEffect = true, createFG = false, createFGDisabled = false, createLevel = false, createLearnButton = false, createCooltime = true, createCooltimeText = true, 
template = {effect = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_Effect")}
}
, 
config = {slotCount = 10, slotInitStartX = -5, slotInitStartY = 13, slotInitGapX = 55, slotInitGapY = 0}
, 
template = {slotBackground = (UI.getChildControl)(Panel_QuickSlot, "StaticText_Slot_BG_Txt")}
, 
slots = {}
, 
numberNames = {"Static_No_1", "Static_No_2", "Static_No_3", "Static_No_4", "Static_No_5", "Static_No_6", "Static_No_7", "Static_No_8", "Static_No_9", "Static_No_10"}
, 
skillToggle = {"Static_SkillToggle_1", "Static_SkillToggle_2", "Static_SkillToggle_3", "Static_SkillToggle_4", "Static_SkillToggle_5", "Static_SkillToggle_6", "Static_SkillToggle_7", "Static_SkillToggle_8", "Static_SkillToggle_9", "Static_SkillToggle_10"}
, quickSlotInit = false, initPosX = Panel_QuickSlot:GetPosX(), initPosY = Panel_QuickSlot:GetPosY()}
PaGlobal_QuickSlot = {}
-- DECOMPILER ERROR at PC153: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_QuickSlot.addSlotEffectForTutorial = function(self, itemSlot, effectString, isLoop, posX, posY)
  -- function num : 0_1
  ((itemSlot.item).icon):AddEffect(effectString, isLoop, posX, posY)
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):showQuickSlotMasking(((itemSlot.item).icon):GetPosX(), ((itemSlot.item).icon):GetPosY())
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_QuickSlot.eraseSlotEffectForTutorial = function(self, itemSlot)
  -- function num : 0_2
  if itemSlot ~= nil and itemSlot.item ~= nil then
    ((itemSlot.item).icon):EraseAllEffect()
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  end
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_QuickSlot.getSlotByIndex = function(self, slotIndex)
  -- function num : 0_3 , upvalues : quickSlot
  if slotIndex <= #quickSlot.slots then
    _PA_LOG("곽민�\176", "getSlotByIndex : " .. tostring("슬롯 성공!"))
    return (quickSlot.slots)[slotIndex]
  end
  _PA_ASSERT(false, "기본퀵슬롯의 범위�\188 초과했습니다.")
end

quickSlot.init = function(self)
  -- function num : 0_4
end

QuickSlot_ShowAni = function()
  -- function num : 0_5 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_QuickSlot:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local QuickSlotOpen_Alpha = Panel_QuickSlot:addColorAnimation(0, 0.35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  QuickSlotOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  QuickSlotOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  QuickSlotOpen_Alpha.IsChangeChild = true
end

QuickSlot_HideAni = function()
  -- function num : 0_6 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_QuickSlot:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local QuickSlotClose_Alpha = Panel_QuickSlot:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  QuickSlotClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
  QuickSlotClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
  QuickSlotClose_Alpha.IsChangeChild = true
  QuickSlotClose_Alpha:SetHideAtEnd(true)
  QuickSlotClose_Alpha:SetDisableWhileAni(true)
end

QuickSlot_ItemCoolTimeEffect_HideAni = function()
  -- function num : 0_7 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  audioPostEvent_SystemUi(2, 4)
  Panel_CoolTime_Effect_Item_Slot:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local coolTime_Item_Slot = Panel_CoolTime_Effect_Item_Slot:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  coolTime_Item_Slot:SetStartColor(UI_color.C_FFFFFFFF)
  coolTime_Item_Slot:SetEndColor(UI_color.C_00FFFFFF)
  coolTime_Item_Slot:SetStartIntensity(3)
  coolTime_Item_Slot:SetEndIntensity(1)
  coolTime_Item_Slot.IsChangeChild = true
  coolTime_Item_Slot:SetHideAtEnd(true)
  coolTime_Item_Slot:SetDisableWhileAni(true)
end

QuickSlot_SkillCoolTimeEffect_HideAni = function()
  -- function num : 0_8 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  audioPostEvent_SystemUi(2, 0)
  Panel_CoolTime_Effect_Slot:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local coolTime_Slot = Panel_CoolTime_Effect_Slot:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  coolTime_Slot:SetStartColor(UI_color.C_FFFFFFFF)
  coolTime_Slot:SetEndColor(UI_color.C_00FFFFFF)
  coolTime_Slot:SetStartIntensity(3)
  coolTime_Slot:SetEndIntensity(1)
  coolTime_Slot.IsChangeChild = true
  coolTime_Slot:SetHideAtEnd(true)
  coolTime_Slot:SetDisableWhileAni(true)
end

quickSlot.createSlot = function(self)
  -- function num : 0_9 , upvalues : UI_PUCT, quickSlot, UI_TISNU, UI_TM
  for ii = 1, (self.config).slotCount do
    local slot = {index = ii, slotType = (CppEnums.QuickSlotType).eEmpty, keyValue = nil, posX = (self.config).slotInitStartX + (ii - 0.73) * (self.config).slotInitGapX, posY = (self.config).slotInitStartY + (ii - 1) * (self.config).slotInitGapY, item = nil, skill = nil, background = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_QuickSlot, "Static_Slot_BG_" .. ii), number = (UI.getChildControl)(Panel_QuickSlot, (self.numberNames)[ii]), toggle = (UI.getChildControl)(Panel_QuickSlot, (self.skillToggle)[ii])}
    do
      CopyBaseProperty((self.template).slotBackground, slot.background)
      ;
      (slot.background):SetShow(true)
      ;
      (slot.background):SetAlpha(0)
      slot.rearrangeControl = function(self)
    -- function num : 0_9_0 , upvalues : slot
    local list = (Array.new)()
    if (CppEnums.QuickSlotType).eItem == self.slotType or (CppEnums.QuickSlotType).eCashItem == self.slotType then
      (UI.ASSERT)(slot.item, "Item is Null!!!")
      list:push_back(self.background)
      list:push_back((self.item).icon)
      list:push_back(self.number)
    else
      if slot.skill == nil then
        (UI.ASSERT)((CppEnums.QuickSlotType).eSkill ~= self.slotType)
        list:push_back(self.background)
        list:push_back((self.skill).icon)
        list:push_back((self.skill).effect)
        list:push_back(self.number)
        list:push_back(self.toggle)
        list:push_back(self.background)
        list:push_back(self.number)
        for ii = 1, list:length() - 1 do
          for jj = ii + 1, list:length() do
            local first = list[ii]
            local second = list[jj]
            ;
            (UI.ASSERT)(first ~= nil and second ~= nil and first ~= second)
            Panel_QuickSlot:SetChildOrder((list[ii]):GetKey(), (list[jj]):GetKey())
          end
        end
        -- DECOMPILER ERROR: 5 unprocessed JMP targets
      end
    end
  end

      slot.setPos = function(self, posX, posY)
    -- function num : 0_9_1
    local tmp = nil
    tmp = self.background
    tmp:SetSize(50, 50)
    tmp:SetPosX(posX)
    tmp:SetPosY(posY)
    local bgSizeX = tmp:GetSizeX()
    local bgSizeY = tmp:GetSizeY()
    if (CppEnums.QuickSlotType).eItem == self.slotType or (CppEnums.QuickSlotType).eCashItem == self.slotType then
      tmp = (self.item).icon
      tmp:SetSize(42, 42)
      local iconPosX = posX + (bgSizeX - tmp:GetSizeX()) / 2
      local iconPosY = posY + (bgSizeY - tmp:GetSizeY()) / 2
      tmp:SetPosX(iconPosX)
      tmp:SetPosY(iconPosY)
    else
      do
        if (CppEnums.QuickSlotType).eSkill == self.slotType then
          tmp = (self.skill).icon
          tmp:SetSize(42, 42)
          local iconPosX = posX + (bgSizeX - tmp:GetSizeX()) / 2
          local iconPosY = posY + (bgSizeY - tmp:GetSizeY()) / 2
          tmp:SetPosX(iconPosX)
          tmp:SetPosY(iconPosY)
          tmp = (self.skill).cooltime
          tmp:SetPosX(iconPosX)
          tmp:SetPosY(iconPosY)
          tmp = (self.skill).cooltimeText
          tmp:SetPosX(iconPosX)
          tmp:SetPosY(iconPosY)
          tmp = (self.skill).effect
          tmp:SetPosX(posX + (bgSizeX - tmp:GetSizeX()) / 2)
          tmp:SetPosY(posY + (bgSizeY - tmp:GetSizeY()) / 2)
          tmp = self.toggle
          tmp:SetPosX(posX + (bgSizeX - tmp:GetSizeX()) / 2)
          tmp:SetPosY(posY + (bgSizeY - tmp:GetSizeY()) / 2)
        end
        do
          tmp = self.number
          tmp:SetPosX(posX + (bgSizeX - tmp:GetSizeX()) / 2)
          tmp:SetPosY(posY - tmp:GetSizeY() / 2)
        end
      end
    end
  end

      slot.setItem = function(self, slotNo, quickSlotInfo)
    -- function num : 0_9_2 , upvalues : quickSlot, UI_TISNU, slot, UI_TM
    if (CppEnums.QuickSlotType).eItem ~= self.slotType and (CppEnums.QuickSlotType).eCashItem ~= self.slotType then
      if (CppEnums.QuickSlotType).eSkill == self.slotType then
        (self.skill):destroyChild()
        Panel_SkillTooltip_Hide()
        self.skill = nil
      end
      self.slotType = quickSlotInfo._type
      local itemSlot = {}
      ;
      (SlotItem.new)(itemSlot, "QuickSlot_" .. slotNo, slotNo, Panel_QuickSlot, quickSlot.slotConfig_Item)
      itemSlot:createChild()
      ;
      (itemSlot.icon):addInputEvent("Mouse_LUp", "QuickSlot_Click(" .. self.index - 1 .. ")")
      ;
      (itemSlot.icon):addInputEvent("Mouse_PressMove", "QuickSlot_DragStart(" .. self.index - 1 .. ")")
      ;
      (itemSlot.icon):SetEnableDragAndDrop(true)
      ;
      (self.background):SetIgnore(true)
      ;
      (self.number):AddEffect("UI_SkillButton01", false, 0, 0)
      ;
      (self.number):AddEffect("fUI_Repair01", false, 0, 0)
      ;
      (self.background):AddEffect("fUI_Light", false, 0, 0)
      if slotNo == 0 then
        (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(self.number, 1, 17, 16, 32)
        ;
        ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self.number):setRenderTexture((self.number):getBaseTexture())
      else
        do
          if slotNo == 1 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 17, 17, 32, 32)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          else
            do
              if slotNo == 2 then
                (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(self.number, 33, 17, 48, 32)
                ;
                ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (self.number):setRenderTexture((self.number):getBaseTexture())
              else
                do
                  if slotNo == 3 then
                    (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(self.number, 49, 17, 64, 32)
                    ;
                    ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (self.number):setRenderTexture((self.number):getBaseTexture())
                  else
                    do
                      if slotNo == 4 then
                        (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(self.number, 65, 17, 80, 32)
                        ;
                        ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (self.number):setRenderTexture((self.number):getBaseTexture())
                      else
                        do
                          if slotNo == 5 then
                            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 81, 17, 96, 32)
                            ;
                            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                            ;
                            (self.number):setRenderTexture((self.number):getBaseTexture())
                          else
                            do
                              if slotNo == 6 then
                                (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(self.number, 97, 17, 112, 32)
                                ;
                                ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                                ;
                                (self.number):setRenderTexture((self.number):getBaseTexture())
                              else
                                do
                                  if slotNo == 7 then
                                    (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(self.number, 113, 17, 128, 32)
                                    ;
                                    ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                                    ;
                                    (self.number):setRenderTexture((self.number):getBaseTexture())
                                  else
                                    do
                                      if slotNo == 8 then
                                        (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(self.number, 129, 17, 144, 32)
                                        ;
                                        ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                                        ;
                                        (self.number):setRenderTexture((self.number):getBaseTexture())
                                      else
                                        do
                                          if slotNo == 9 then
                                            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 145, 17, 160, 32)
                                            ;
                                            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                                            ;
                                            (self.number):setRenderTexture((self.number):getBaseTexture())
                                          end
                                          do
                                            do
                                              self.item = itemSlot
                                              self:rearrangeControl()
                                              self:setPos((self.background):GetPosX(), (self.background):GetPosY())
                                              self.slotType = quickSlotInfo._type
                                              local selfPlayer = (getSelfPlayer()):get()
                                              local inventoryType = QuickSlot_GetInventoryTypeFrom(self.slotType)
                                              local inventory = selfPlayer:getInventoryByType(inventoryType)
                                              local invenSlotNo = inventory:getSlot(quickSlotInfo._itemKey)
                                              local itemStaticWrapper = getItemEnchantStaticStatus(quickSlotInfo._itemKey)
                                              local _const = Defines.s64_const
                                              local s64_stackCount = _const.s64_0
                                              if UI_TISNU ~= invenSlotNo then
                                                s64_stackCount = ((getInventoryItemByType(inventoryType, invenSlotNo)):get()):getCount_s64()
                                              end
                                              ;
                                              (slot.background):SetTextMode(UI_TM.eTextMode_AutoWrap)
                                              if (CppEnums.ContentsEventType).ContentsType_InventoryBag == (itemStaticWrapper:get()):getContentsEventType() then
                                                invenSlotNo = ToClient_GetItemNoByInventory(inventoryType, quickSlotInfo._itemNo_s64)
                                                local itemWrapper = getInventoryItemByType(inventoryType, invenSlotNo)
                                                if itemWrapper ~= nil then
                                                  itemStaticWrapper = itemWrapper:getStaticStatus()
                                                  ;
                                                  (self.item):setItem(itemWrapper, invenSlotNo)
                                                end
                                              else
                                                do
                                                  ;
                                                  (self.item):setItemByStaticStatus(itemStaticWrapper, s64_stackCount)
                                                  self.keyValue = invenSlotNo
                                                  ;
                                                  ((self.item).icon):SetMonoTone(_const.s64_0 == s64_stackCount)
                                                  do
                                                    local itemSlot = self.item
                                                    ;
                                                    ((self.item).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"QuickSlot\", true)")
                                                    ;
                                                    ((self.item).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"QuickSlot\", false)")
                                                    Panel_Tooltip_Item_SetPosition(slotNo, self.item, "QuickSlot")
                                                    ;
                                                    (self.toggle):SetShow(false)
                                                    -- DECOMPILER ERROR: 1 unprocessed JMP targets
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

      slot.setSkill = function(self, slotNo, quickSlotInfo)
    -- function num : 0_9_3 , upvalues : quickSlot, slot, UI_TM
    if (CppEnums.QuickSlotType).eItem == self.slotType or (CppEnums.QuickSlotType).eCashItem == self.slotType then
      if self.item == nil then
        (UI.ASSERT)((CppEnums.QuickSlotType).eSkill == self.slotType)
        ;
        (UI.deleteControl)((self.item).icon)
        Panel_Tooltip_Item_hideTooltip()
        self.item = nil
        self.slotType = (CppEnums.QuickSlotType).eSkill
        do
          local skillSlot = {}
          ;
          (SlotSkill.new)(skillSlot, slotNo, Panel_QuickSlot, quickSlot.slotConfig_Skill)
          ;
          (skillSlot.icon):addInputEvent("Mouse_LUp", "QuickSlot_Click(" .. self.index - 1 .. ")")
          ;
          (skillSlot.icon):addInputEvent("Mouse_PressMove", "QuickSlot_DragStart(" .. self.index - 1 .. ")")
          ;
          (skillSlot.icon):SetEnableDragAndDrop(true)
          ;
          (self.number):AddEffect("UI_SkillButton01", false, 0, 0)
          ;
          (self.number):AddEffect("fUI_Repair01", false, 0, 0)
          ;
          (self.background):AddEffect("fUI_Light", false, 0, 0)
          if slotNo == 0 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 1, 33, 16, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 1 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 17, 33, 32, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 2 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 33, 33, 48, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 3 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 49, 33, 64, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 4 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 65, 33, 80, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 5 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 81, 33, 96, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 6 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 97, 33, 112, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 7 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 113, 33, 128, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 8 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 129, 33, 144, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif slotNo == 9 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 145, 33, 160, 48)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          end
          self.skill = skillSlot
          self:rearrangeControl()
          ;
          (self.background):SetIgnore(true)
          self:setPos((self.background):GetPosX(), (self.background):GetPosY())
          local skillNo = (quickSlotInfo._skillKey):getSkillNo()
          do
            local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
            -- DECOMPILER ERROR at PC401: Confused about usage of register: R5 in 'UnsetPending'

            ;
            (self.skill).skillNo = skillNo
            ;
            (slot.background):SetTextMode(UI_TM.eTextMode_AutoWrap)
            ;
            (UI.ASSERT)(skillTypeStaticWrapper, "get Fail - Skill Type Static Status ")
            self.keyValue = quickSlotInfo._skillKey
            ;
            (self.skill):setSkillTypeStatic(skillTypeStaticWrapper)
            ;
            ((self.skill).icon):addInputEvent("Mouse_LUp", "QuickSlot_Click(" .. self.index - 1 .. ")")
            ;
            ((self.skill).icon):addInputEvent("Mouse_PressMove", "QuickSlot_DragStart(" .. self.index - 1 .. ")")
            ;
            ((self.skill).icon):addInputEvent("Mouse_On", "Panel_SkillTooltip_Show(" .. slotNo .. ", false, \"QuickSlot\")")
            ;
            ((self.skill).icon):addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
            Panel_SkillTooltip_SetPosition(slotNo, (self.skill).icon, "QuickSlot")
            -- DECOMPILER ERROR: 13 unprocessed JMP targets
          end
        end
      end
    end
  end

      slot.setEmpty = function(self)
    -- function num : 0_9_4 , upvalues : slot
    if self.item == nil then
      (UI.ASSERT)((CppEnums.QuickSlotType).eItem ~= self.slotType and (CppEnums.QuickSlotType).eCashItem ~= self.slotType)
      ;
      (UI.deleteControl)((self.item).icon)
      Panel_Tooltip_Item_hideTooltip()
      self.item = nil
      audioPostEvent_SystemUi(0, 2)
      if self.skill == nil then
        (UI.ASSERT)((CppEnums.QuickSlotType).eSkill ~= self.slotType)
        ;
        (self.skill):destroyChild()
        Panel_SkillTooltip_Hide()
        Panel_Tooltip_Item_hideTooltip()
        self.skill = nil
        audioPostEvent_SystemUi(0, 9)
        do
          local index = self.index - 1
          if index == 0 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 1, 1, 16, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 1 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 17, 1, 32, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 2 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 33, 1, 48, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 3 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 49, 1, 64, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 4 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 65, 1, 80, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 5 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 81, 1, 96, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 6 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 97, 1, 112, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 7 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 113, 1, 128, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 8 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 129, 1, 144, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          elseif index == 9 then
            (self.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.number, 145, 1, 160, 16)
            ;
            ((self.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.number):setRenderTexture((self.number):getBaseTexture())
          end
          ;
          (self.toggle):SetShow(false)
          ;
          (slot.background):SetText("")
          ;
          (self.background):SetIgnore(false)
          ;
          (self.background):addInputEvent("Mouse_LUp", "QuickSlot_DropHandler(" .. self.index - 1 .. ")")
          self.slotType = (CppEnums.QuickSlotType).eEmpty
          self.keyValue = nil
          -- DECOMPILER ERROR: 14 unprocessed JMP targets
        end
      end
    end
  end

      slot:setPos(slot.posX, slot.posY)
      slot:rearrangeControl()
      -- DECOMPILER ERROR at PC93: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (self.slots)[ii] = slot
    end
  end
end

QuickSlot_DropHandler = function(slotIndex)
  -- function num : 0_10
  if DragManager.dragStartPanel == nil then
    return false
  end
  if DragManager.dragStartPanel == Panel_Window_Inventory then
    local itemWrapper = getInventoryItemByType(DragManager.dragWhereTypeInfo, DragManager.dragSlotInfo)
    if itemWrapper ~= nil and (((itemWrapper:getStaticStatus()):get()):isContentsEvent() or ((itemWrapper:getStaticStatus()):get()):isItemSkill() or ((itemWrapper:getStaticStatus()):get()):isItemInterAction() or ((itemWrapper:getStaticStatus()):get()):isUseToVehicle() or ((itemWrapper:getStaticStatus()):get()):isEquipable() or ((itemWrapper:getStaticStatus()):get()):isItemTent()) then
      quickSlot_RegistItem(slotIndex, DragManager.dragWhereTypeInfo, DragManager.dragSlotInfo)
      PaGlobal_TutorialManager:handleQuickSlotRegistItem(slotIndex, DragManager.dragWhereTypeInfo, DragManager.dragSlotInfo)
    end
  else
    do
      if DragManager.dragStartPanel == Panel_Window_Skill then
        quickSlot_RegistSkill(slotIndex, DragManager.dragSlotInfo)
      else
        if DragManager.dragStartPanel == Panel_QuickSlot and slotIndex ~= DragManager.dragSlotInfo then
          quickSlot_Swap(slotIndex, DragManager.dragSlotInfo)
        end
      end
      audioPostEvent_SystemUi(0, 8)
      DragManager:clearInfo()
      return true
    end
  end
end

QuickSlot_GroundClick = function(whereType, slotIndex)
  -- function num : 0_11 , upvalues : quickSlot
  local itemSlot = (quickSlot.slots)[slotIndex + 1]
  quickSlot_Clear(slotIndex)
  if slotIndex == 0 then
    (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 1, 1, 14, 14)
    ;
    ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
  else
    do
      if slotIndex == 1 then
        (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 15, 1, 28, 14)
        ;
        ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
      else
        do
          if slotIndex == 2 then
            (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 29, 1, 42, 14)
            ;
            ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
          else
            do
              if slotIndex == 3 then
                (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 43, 1, 56, 14)
                ;
                ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
              else
                do
                  if slotIndex == 4 then
                    (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 1, 15, 14, 28)
                    ;
                    ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
                  else
                    do
                      if slotIndex == 5 then
                        (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 15, 15, 28, 28)
                        ;
                        ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
                      else
                        do
                          if slotIndex == 6 then
                            (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 29, 15, 42, 28)
                            ;
                            ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                            ;
                            (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
                          else
                            do
                              if slotIndex == 7 then
                                (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 43, 15, 56, 28)
                                ;
                                ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                                ;
                                (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
                              else
                                do
                                  if slotIndex == 8 then
                                    (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 1, 29, 14, 42)
                                    ;
                                    ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                                    ;
                                    (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
                                  else
                                    do
                                      if slotIndex == 9 then
                                        (itemSlot.number):ChangeTextureInfoName("New_UI_Common_forLua/Widget/QuickSlot/QuickSlot_00.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(itemSlot.number, 15, 29, 28, 42)
                                        ;
                                        ((itemSlot.number):getBaseTexture()):setUV(x1, y1, x2, y2)
                                        ;
                                        (itemSlot.number):setRenderTexture((itemSlot.number):getBaseTexture())
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

QuickSlot_Click = function(slotIndex)
  -- function num : 0_12 , upvalues : quickSlot
  if slotIndex == nil then
    return 
  end
  local quickSlotInfo = getQuickSlotItem(slotIndex)
  if quickSlotInfo == nil then
    return 
  end
  local itemKey = (quickSlotInfo._itemKey):getItemKey()
  local itemSlot = (quickSlot.slots)[slotIndex + 1]
  PaGlobal_TutorialManager:handleQuickSlotClick(itemKey)
  if itemSlot ~= nil then
    if itemSlot.item ~= nil and not ((itemSlot.item).cooltime):GetShow() then
      audioPostEvent_SystemUi(8, 2)
      ;
      ((itemSlot.item).icon):AddEffect("fUI_SkillButton01", false, 0, 0)
      ;
      ((itemSlot.item).icon):AddEffect("UI_SkillButton01", false, 0, 0)
    end
    if itemSlot.skill ~= nil and not ((itemSlot.skill).cooltime):GetShow() then
      audioPostEvent_SystemUi(8, 2)
      ;
      ((itemSlot.skill).icon):AddEffect("fUI_SkillButton01", false, 0, 0)
      ;
      ((itemSlot.skill).icon):AddEffect("UI_SkillButton01", false, 0, 0)
      local skillStaticWrapper = getSkillTypeStaticStatus((itemSlot.skill).skillNo)
      if skillStaticWrapper:getUiDisplayType() then
        SpiritGuide_Show()
      end
    end
  end
  do
    if not QuickSlot_DropHandler(slotIndex) then
      if itemSlot.item ~= nil then
        local quickSlotInfo = getQuickSlotItem(slotIndex)
        local whereType = QuickSlot_GetInventoryTypeFrom(quickSlotInfo._type)
        if isNearFusionCore() and isFusionItem(whereType, itemSlot.keyValue) then
          burnItemToActor(whereType, itemSlot.keyValue, 1)
          return 
        end
        local whereType = QuickSlot_GetInventoryTypeFrom(quickSlotInfo._type)
        local inventory = ((getSelfPlayer()):get()):getInventoryByType(whereType)
        local invenSlotNo = inventory:getSlot(quickSlotInfo._itemKey)
        if inventory:sizeXXX() <= invenSlotNo then
          return 
        end
        local itemWrapper = getInventoryItemByType(whereType, invenSlotNo)
        local itemEnchantWrapper = itemWrapper:getStaticStatus()
        if ((itemEnchantWrapper:get())._vestedType):getItemKey() == 2 and (itemWrapper:get()):isVested() == false then
          local bindingItemUse = function()
    -- function num : 0_12_0 , upvalues : slotIndex
    quickSlot_UseSlot(slotIndex)
  end

          local messageContent = nil
          if itemEnchantWrapper:isUserVested() then
            messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT_USERVESTED")
          else
            messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT")
          end
          local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_TITLE"), content = messageContent, functionYes = bindingItemUse, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
        else
          do
            do
              if itemEnchantWrapper:isPopupItem() then
                Panel_UserItem_PopupItem(itemEnchantWrapper, whereType, invenSlotNo)
              else
                quickSlot_UseSlot(slotIndex)
              end
              quickSlot_UseSlot(slotIndex)
            end
          end
        end
      end
    end
  end
end

SpiritGuide_Show = function()
  -- function num : 0_13
  local isShow = FGlobal_SpiritGuide_IsShow()
  if isShow == false then
    return 
  end
  Panel_MovieTheater320_ShowToggle()
end

QuickSlot_DragStart = function(slotIndex)
  -- function num : 0_14 , upvalues : quickSlot
  local self = quickSlot
  local quickSlotInfo = getQuickSlotItem(slotIndex)
  if PaGlobal_TutorialManager:isDoingTutorial() == true and (quickSlotInfo._itemKey):get() == 502 and slotIndex == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return 
  end
  if (CppEnums.QuickSlotType).eItem == quickSlotInfo._type or (CppEnums.QuickSlotType).eCashItem == quickSlotInfo._type then
    local itemStaticWrapper = getItemEnchantStaticStatus(quickSlotInfo._itemKey)
    DragManager:setDragInfo(Panel_QuickSlot, nil, slotIndex, "Icon/" .. itemStaticWrapper:getIconPath(), QuickSlot_GroundClick, nil)
  else
    do
      if (CppEnums.QuickSlotType).eSkill == quickSlotInfo._type then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus((quickSlotInfo._skillKey):getSkillNo())
        DragManager:setDragInfo(Panel_QuickSlot, nil, slotIndex, "Icon/" .. skillTypeStaticWrapper:getIconPath(), QuickSlot_GroundClick, nil)
      end
    end
  end
end

local onEffectTime = 0
QuickSlot_UpdatePerFrame = function(fDeltaTime)
  -- function num : 0_15 , upvalues : onEffectTime, quickSlot, UI_TISNU
  if fDeltaTime <= 0 then
    return 
  end
  if FGlobal_QuickSlot_CheckDefaultQuickSlotShowAble() == false then
    Panel_QuickSlot:SetShow(false, false)
    return 
  end
  onEffectTime = onEffectTime + fDeltaTime
  local self = quickSlot
  if not self.quickSlotInit then
    return 
  end
  for idx,slot in ipairs(self.slots) do
    local quickSlotKey = idx - 1
    local quickSlotInfo = getQuickSlotItem(quickSlotKey)
    if PaGlobal_TutorialManager:isDoingTutorial() == true and idx == 1 and (quickSlotInfo._itemKey):getItemKey() ~= 502 then
      Inventory_SetCheckRadioButtonNormalInventory(true)
      Inventory_updateSlotData()
    end
    if quickSlotInfo == nil then
      return 
    end
    if (CppEnums.QuickSlotType).eItem == quickSlotInfo._type or (CppEnums.QuickSlotType).eCashItem == quickSlotInfo._type then
      if slot.item == nil then
        break
      end
      local remainTime = 0
      local itemReuseTime = 0
      local realRemainTime = 0
      local intRemainTime = 0
      local whereType = QuickSlot_GetInventoryTypeFrom(quickSlotInfo._type)
      if UI_TISNU ~= slot.keyValue then
        remainTime = getItemCooltime(whereType, slot.keyValue)
        itemReuseTime = getItemReuseCycle(whereType, slot.keyValue) / 1000
        realRemainTime = remainTime * (itemReuseTime)
        intRemainTime = realRemainTime - realRemainTime % 1 + 1
      end
      if isNearFusionCore() and isFusionItem(whereType, slot.keyValue) and onEffectTime > 3 then
        ((slot.item).icon):EraseAllEffect()
        ;
        ((slot.item).icon):AddEffect("UI_ItemInstall_Gold", false, 0, 0)
      end
      if remainTime > 0 then
        ((slot.item).cooltime):UpdateCoolTime(remainTime)
        ;
        ((slot.item).cooltime):SetShow(true)
        ;
        ((slot.item).cooltimeText):SetText(Time_Formatting_ShowTop(intRemainTime))
        if intRemainTime <= itemReuseTime then
          ((slot.item).cooltimeText):SetShow(true)
        else
          ;
          ((slot.item).cooltimeText):SetShow(false)
        end
      else
        if ((slot.item).cooltime):GetShow() then
          ((slot.item).cooltime):SetShow(false)
          ;
          ((slot.item).cooltimeText):SetShow(false)
          local skillSlotItemPosX = ((slot.item).cooltime):GetParentPosX()
          local skillSlotItemPosY = ((slot.item).cooltime):GetParentPosY()
          Panel_CoolTime_Effect_Item_Slot:SetShow(true, true)
          Panel_CoolTime_Effect_Item_Slot:SetIgnore(true)
          Panel_CoolTime_Effect_Item_Slot:AddEffect("fUI_Skill_Cooltime01", false, 2.5, 7)
          Panel_CoolTime_Effect_Item_Slot:SetPosX(skillSlotItemPosX - 7)
          Panel_CoolTime_Effect_Item_Slot:SetPosY(skillSlotItemPosY - 10)
        end
      end
      do
        do
          PaGlobal_TutorialManager:handleUpdateQuickSlotPerFrame(slot, (quickSlotInfo._itemKey):getItemKey())
          if (CppEnums.QuickSlotType).eSkill == quickSlotInfo._type then
            if slot.skill == nil then
              break
            end
            local skillStaticWrapper = getSkillStaticStatus((quickSlotInfo._skillKey):getSkillNo(), (quickSlotInfo._skillKey):getLevel())
            if skillStaticWrapper ~= nil then
              if skillStaticWrapper:isUsableSkill() then
                ((slot.skill).icon):SetMonoTone(false)
              else
                ;
                ((slot.skill).icon):SetMonoTone(true)
              end
              ;
              (slot.toggle):SetShow(false)
              if isToggleSkillbySkillKey((quickSlotInfo._skillKey):get()) then
                if checkToggleSkillState((quickSlotInfo._skillKey):get()) then
                  (slot.toggle):SetShow(true)
                else
                  ;
                  (slot.toggle):SetShow(false)
                end
              end
            end
            local remainTime = getSkillCooltime((slot.keyValue):get())
            local skillReuseTime = (skillStaticWrapper:get())._reuseCycle / 1000
            local realRemainTime = remainTime * skillReuseTime
            local intRemainTime = realRemainTime - realRemainTime % 1 + 1
            if remainTime > 0 then
              ((slot.skill).cooltime):UpdateCoolTime(remainTime)
              ;
              ((slot.skill).cooltime):SetShow(true)
              ;
              ((slot.skill).cooltimeText):SetText(Time_Formatting_ShowTop(intRemainTime))
              if intRemainTime <= skillReuseTime then
                ((slot.skill).cooltimeText):SetShow(true)
              else
                ;
                ((slot.skill).cooltimeText):SetShow(false)
              end
            else
              if ((slot.skill).cooltime):GetShow() then
                ((slot.skill).cooltime):SetShow(false)
                ;
                ((slot.skill).cooltimeText):SetShow(false)
                local skillSlotPosX = ((slot.skill).cooltime):GetParentPosX()
                local skillSlotPosY = ((slot.skill).cooltime):GetParentPosY()
                Panel_CoolTime_Effect_Slot:SetShow(true, true)
                Panel_CoolTime_Effect_Slot:SetIgnore(true)
                Panel_CoolTime_Effect_Slot:AddEffect("fUI_Skill_Cooltime01", false, 2.5, 7)
                Panel_CoolTime_Effect_Slot:SetPosX(skillSlotPosX - 7)
                Panel_CoolTime_Effect_Slot:SetPosY(skillSlotPosY - 8)
              end
            end
          end
          do
            -- DECOMPILER ERROR at PC360: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC360: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC360: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC360: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  if onEffectTime > 3 then
    onEffectTime = 0
  end
end

quickSlot.registEventHandler = function(self)
  -- function num : 0_16
  Panel_QuickSlot:RegisterUpdateFunc("QuickSlot_UpdatePerFrame")
end

FGlobal_Potion_InvenToQuickSlot = function(inventoryType, slotNo, itemType)
  -- function num : 0_17 , upvalues : quickSlot
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper ~= nil and (((itemWrapper:getStaticStatus()):get()):isItemSkill() or ((itemWrapper:getStaticStatus()):get()):isUseToVehicle()) then
    if itemType == 0 then
      if isUseNewQuickSlot() then
        local hasPotion = FGlobal_NewQuickSlot_CheckAndSetPotion(slotNo, itemType)
        if hasPotion then
          return 
        end
      else
        do
          for index = (quickSlot.config).slotCount - 1, 0, -1 do
            local quickSlotInfo = getQuickSlotItem(index)
            local quickType = quickSlotInfo._type
            if (CppEnums.QuickSlotType).eItem == quickType or (CppEnums.QuickSlotType).eCashItem == quickType then
              local itemKey = (quickSlotInfo._itemKey):get()
              if itemKey == 517 or itemKey == 518 or itemKey == 519 or itemKey == 524 or itemKey == 525 or itemKey == 513 or itemKey == 514 or itemKey == 528 or itemKey == 529 or itemKey == 530 or itemKey == 502 then
                return 
              end
            end
          end
          if PaGlobal_TutorialManager:isDoingTutorial() then
            HP_Push_NextSlot(0)
            quickSlot_RegistItem(0, 0, slotNo)
          else
            local emptySlotIndex = EmptySlot_Check()
            if emptySlotIndex ~= nil then
              quickSlot_RegistItem(emptySlotIndex, 0, slotNo)
            end
          end
          do
            if itemType == 1 then
              if isUseNewQuickSlot() then
                local hasPotion = FGlobal_NewQuickSlot_CheckAndSetPotion(slotNo, itemType)
                if not hasPotion then
                  return 
                end
              else
                do
                  for index = (quickSlot.config).slotCount - 1, 0, -1 do
                    local quickSlotInfo = getQuickSlotItem(index)
                    local quickType = quickSlotInfo._type
                    if (CppEnums.QuickSlotType).eItem == quickType or (CppEnums.QuickSlotType).eCashItem == quickType then
                      local itemKey = (quickSlotInfo._itemKey):get()
                      if itemKey == 503 or itemKey == 520 or itemKey == 521 or itemKey == 522 or itemKey == 526 or itemKey == 527 or itemKey == 515 or itemKey == 516 or itemKey == 531 or itemKey == 532 or itemKey == 533 then
                        return 
                      end
                    end
                  end
                  do
                    local emptySlotIndex = EmptySlot_Check()
                    if emptySlotIndex ~= nil then
                      quickSlot_RegistItem(emptySlotIndex, 0, slotNo)
                    end
                    if isUseNewQuickSlot() then
                      FGlobal_NewQuickSlot_Update()
                    else
                      QuickSlot_UpdateData()
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

EmptySlot_Check = function()
  -- function num : 0_18 , upvalues : quickSlot
  local emptySlot = nil
  for index = (quickSlot.config).slotCount - 1, 0, -1 do
    local quickSlotInfo = getQuickSlotItem(index)
    if (CppEnums.QuickSlotType).eEmpty == quickSlotInfo._type then
      emptySlot = index
    end
  end
  return emptySlot
end

HP_Push_NextSlot = function(slotNo)
  -- function num : 0_19 , upvalues : quickSlot
  local quickSlotInfo = getQuickSlotItem(slotNo)
  if (CppEnums.QuickSlotType).eEmpty == quickSlotInfo._type then
    return 
  end
  if (quickSlot.config).slotCount - 1 == slotNo then
    return 
  end
  local quickSlotInfo2 = getQuickSlotItem(slotNo + 1)
  if (CppEnums.QuickSlotType).eEmpty == quickSlotInfo2._type then
    quickSlot_Swap(slotNo, slotNo + 1)
    if slotNo == 0 then
      return 
    end
    HP_Push_NextSlot(slotNo - 1)
  else
    HP_Push_NextSlot(slotNo + 1)
  end
end

MP_Push_NextSlot = function(slotNo)
  -- function num : 0_20 , upvalues : quickSlot
  local quickSlotInfo = getQuickSlotItem(slotNo)
  if (CppEnums.QuickSlotType).eEmpty == quickSlotInfo._type then
    return 
  end
  if (quickSlot.config).slotCount - 1 == slotNo then
    return 
  end
  local quickSlotInfo2 = getQuickSlotItem(slotNo + 1)
  if (CppEnums.QuickSlotType).eEmpty == quickSlotInfo2._type then
    quickSlot_Swap(slotNo, slotNo + 1)
    if slotNo == 1 then
      return 
    end
    MP_Push_NextSlot(slotNo - 1)
  else
    MP_Push_NextSlot(slotNo + 1)
  end
end

FGlobal_QuickSlot_CheckDefaultQuickSlotShowAble = function()
  -- function num : 0_21
  if isUseNewQuickSlot() == true then
    return false
  else
    if PaGlobal_TutorialManager:isAllowShowQuickSlot() == false then
      return false
    end
  end
  return true
end

QuickSlot_UpdateData = function()
  -- function num : 0_22 , upvalues : quickSlot
  if FGlobal_QuickSlot_CheckDefaultQuickSlotShowAble() == false then
    Panel_QuickSlot:SetShow(false, false)
    return 
  end
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_QuickSlot:GetRelativePosX() == -1 and Panel_QuickSlot:GetRelativePosY() == -1 then
      local initPosX = (getScreenSizeX() - Panel_QuickSlot:GetSizeX()) / 2
      local initPosY = getScreenSizeY() - Panel_QuickSlot:GetSizeY()
      changePositionBySever(Panel_QuickSlot, (CppEnums.PAGameUIType).PAGameUIPanel_QuickSlot, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_QuickSlot, initPosX, initPosY)
    else
      do
        if Panel_QuickSlot:GetRelativePosX() == 0 and Panel_QuickSlot:GetRelativePosY() == 0 then
          Panel_QuickSlot:SetPosX((getScreenSizeX() - Panel_QuickSlot:GetSizeX()) / 2)
          Panel_QuickSlot:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY())
        else
          Panel_QuickSlot:SetPosX(getScreenSizeX() * Panel_QuickSlot:GetRelativePosX() - Panel_QuickSlot:GetSizeX() / 2)
          Panel_QuickSlot:SetPosY(getScreenSizeY() * Panel_QuickSlot:GetRelativePosY() - Panel_QuickSlot:GetSizeY() / 2)
        end
        changePositionBySever(Panel_QuickSlot, (CppEnums.PAGameUIType).PAGameUIPanel_QuickSlot, false, true, false)
        if not Panel_QuickSlot:GetShow() then
          Panel_QuickSlot:SetShow(true, true)
        end
        local self = quickSlot
        for idx,slot in ipairs(self.slots) do
          local quickSlotKey = idx - 1
          local quickSlotInfo = getQuickSlotItem(quickSlotKey)
          if (CppEnums.QuickSlotType).eItem == quickSlotInfo._type or (CppEnums.QuickSlotType).eCashItem == quickSlotInfo._type then
            slot:setItem(quickSlotKey, quickSlotInfo)
            if slot.icon ~= nil then
              (slot.icon):SetEnable(true)
            end
          else
            if (CppEnums.QuickSlotType).eSkill == quickSlotInfo._type then
              slot:setSkill(quickSlotKey, quickSlotInfo)
              if slot.icon ~= nil then
                (slot.icon):SetEnable(true)
              end
            else
              slot:setEmpty()
              if slot.icon ~= nil then
                (slot.icon):SetEnable(false)
              end
            end
          end
        end
        if Panel_Tooltip_Item_GetCurrentSlotType() == "QuickSlot" then
          Panel_Tooltip_Item_Refresh()
        end
        if Panel_SkillTooltip_GetCurrentSlotType() == "QuickSlot" then
          Panel_SkillTooltip_Refresh()
        end
        self.quickSlotInit = true
        if ((getSelfPlayer()):get()):getLevel() > 2 and ((getSelfPlayer()):get()):getLevel() < 40 then
          NoPotion_Alert()
        end
      end
    end
  end
end

quickSlot.registMessageHandler = function(self)
  -- function num : 0_23
  registerEvent("refreshQuickSlot_ack", "QuickSlot_UpdateData")
  registerEvent("FromClient_InventoryUpdate", "QuickSlot_UpdateData")
  registerEvent("QuickSlotUpdateAfterToCleanupDialog", "QuickSlot_UpdateAfter_cleanupDialog")
end

local closeNpcTalkDialog = function()
  -- function num : 0_24
  if Panel_Npc_Trade_Market:IsShow() then
    closeNpcTrade_Basket()
    return true
  end
  if Panel_Window_StableFunction:IsShow() then
    StableFunction_Close()
    return true
  end
  if Panel_Window_Repair:IsShow() then
    FGlobal_Equipment_SetHide(false)
    return true
  end
  if Panel_Window_GuildStableFunction:IsShow() then
    GuildStableFunction_Close()
    return true
  end
  if Panel_Window_ItemMarket_Function:GetShow() then
    FGolbal_ItemMarket_Function_Close()
    return true
  end
  if Panel_Window_WharfFunction:GetShow() then
    WharfFunction_Close()
    return true
  end
  if Panel_Window_GuildWharfFunction:GetShow() then
    GuildWharfFunction_Close()
    return true
  end
  return false
end

QuickSlot_UpdateAfter_cleanupDialog = function()
  -- function num : 0_25
  if Panel_QuickSlot:IsUse() then
    local hideNpcTradeMarketDialog = FGlobal_CloseNpcDialogForDetail()
    if hideNpcTradeMarketDialog and Panel_Npc_Dialog:IsShow() then
      FGlobal_HideDialog(true)
    end
  end
end

Panel_QuickSlot:addInputEvent("Mouse_On", "QuickSlot_ChangeTexture_On()")
Panel_QuickSlot:addInputEvent("Mouse_Out", "QuickSlot_ChangeTexture_Off()")
Panel_QuickSlot:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
QuickSlot_ChangeTexture_On = function()
  -- function num : 0_26 , upvalues : quickSlotText
  if Panel_UIControl:IsShow() then
    Panel_QuickSlot:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
    quickSlotText:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_QUICKSLOT_QUICKSLOT") .. "-" .. PAGetString(Defines.StringSheet_GAME, "PANEL_QUICKSLOT_MOVE_DRAG"))
  end
end

QuickSlot_ChangeTexture_Off = function()
  -- function num : 0_27 , upvalues : quickSlotText
  if Panel_UIControl:IsShow() then
    Panel_QuickSlot:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    quickSlotText:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_QUICKSLOT_QUICKSLOT"))
  else
    Panel_QuickSlot:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

Panel_QuickSlot_ShowToggle = function()
  -- function num : 0_28
  if ((getSelfPlayer()):get()):getLevel() < 4 then
    return 
  end
  if isUseNewQuickSlot() then
    return 
  end
  local isShow = Panel_QuickSlot:IsShow()
  if isShow then
    Panel_QuickSlot:SetShow(false, false)
  else
    Panel_QuickSlot:SetShow(true, true)
  end
end

FGlobal_QuickSlot_Show = function()
  -- function num : 0_29 , upvalues : quickSlot
  if FGlobal_QuickSlot_CheckDefaultQuickSlotShowAble() == false then
    return 
  end
  Panel_QuickSlot:SetShow(true, true)
  local itemSlot = (quickSlot.slots)[1]
  if itemSlot ~= nil then
    if itemSlot.item ~= nil then
      ((itemSlot.item).icon):AddEffect("fUI_Tuto_Skill_01A", false, 250, 0)
    end
    if itemSlot.skill ~= nil then
      ((itemSlot.skill).icon):AddEffect("fUI_Tuto_Skill_01A", false, 250, 0)
    end
  end
end

QuickSlot_ShowBackGround = function()
  -- function num : 0_30 , upvalues : quickSlot
  local self = quickSlot
  for idx,slot in ipairs(self.slots) do
    (slot.background):ChangeTextureInfoName("new_ui_common_forlua/default/blackpenel_series.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(slot.background, 5, 5, 50, 50)
    ;
    ((slot.background):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (slot.background):setRenderTexture((slot.background):getOnTexture())
    ;
    (slot.background):SetAlpha(0.8)
  end
end

QuickSlot_HideBackGround = function()
  -- function num : 0_31 , upvalues : quickSlot
  local self = quickSlot
  for idx,slot in ipairs(self.slots) do
    (slot.background):ChangeTextureInfoName("")
    ;
    (slot.background):SetAlpha(0)
  end
end

QuickSlot_Empty = function()
  -- function num : 0_32 , upvalues : quickSlot
  local self = quickSlot
  for idx,slot in ipairs(self.slots) do
    if (CppEnums.QuickSlotType).eEmpty == slot.slotType then
      (slot.background):ChangeOnTextureInfoName("new_ui_common_forlua/default/blackpenel_series.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.background, 5, 5, 50, 50)
      ;
      ((slot.background):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.background):setRenderTexture((slot.background):getBaseTexture())
      ;
      (slot.background):SetAlpha(1)
    end
  end
end

local halfScreenSize = getScreenSizeX() / 2 - Panel_QuickSlot:GetPosX()
local potionAlert = true
local potionPosInit = false
local potionRefill = false
local potion_bubble = (UI.getChildControl)(Panel_QuickSlot, "StaticText_Bubble")
local potion_bubble2 = (UI.getChildControl)(Panel_QuickSlot, "StaticText_Bubble2")
potion_bubble:SetShow(false)
potion_bubble2:SetShow(false)
potion_bubble2:SetPosX(-85)
potion_bubble2:SetPosY(-50)
potion_bubble:SetPosY(-50)
NoPotion_Alert = function()
  -- function num : 0_33 , upvalues : potionAlert, potionPosInit, potion_bubble2, potionRefill, potion_bubble
  local invenSize = (((getSelfPlayer()):get()):getInventory()):size() - 1
  Potion_Pos_Init()
  for index = 1, invenSize do
    local itemWrapper = getInventoryItem(index)
    if itemWrapper ~= nil then
      local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
      if itemKey == 517 or itemKey == 518 or itemKey == 519 or itemKey == 524 or itemKey == 525 or itemKey == 513 or itemKey == 514 or itemKey == 528 or itemKey == 529 or itemKey == 530 or itemKey == 502 then
        potionAlert = true
        if potionPosInit == false then
          potion_bubble2:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUICKSLOT_ADD_POTION"))
          Potion_Bubble_Show(false)
        else
          if potionRefill == true then
            return 
          else
            potion_bubble:SetShow(false)
            potion_bubble2:SetShow(false)
          end
        end
        return 
      end
    end
  end
  potion_bubble:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUICKSLOT_HAVENT_POTION"))
  potion_bubble2:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUICKSLOT_HAVENT_POTION"))
  potionAlert = false
end

local bubbleChange = false
local bubble2Change = false
Potion_Pos_Init = function()
  -- function num : 0_34 , upvalues : potionPosInit, potionRefill, quickSlot, potion_bubble, potion_bubble2, bubble2Change, bubbleChange
  potionPosInit = false
  potionRefill = false
  for index = (quickSlot.config).slotCount - 1, 0, -1 do
    local quickType = (getQuickSlotItem(index))._type
    if (CppEnums.QuickSlotType).eItem == quickType or (CppEnums.QuickSlotType).eCashItem == quickType then
      local quickSlotInfo = getQuickSlotItem(index)
      local invenSlotNo = (((getSelfPlayer()):get()):getInventory()):getSlot(quickSlotInfo._itemKey)
      local itemStaticWrapper = getItemEnchantStaticStatus(quickSlotInfo._itemKey)
      local itemKey = (quickSlotInfo._itemKey):getItemKey()
      if itemKey == 502 or itemKey == 513 or itemKey == 514 or itemKey == 517 or itemKey == 518 or itemKey == 519 or itemKey == 524 or itemKey == 525 or itemKey == 528 or itemKey == 529 or itemKey == 530 or itemKey == 538 or itemKey == 551 or itemKey == 552 or itemKey == 553 or itemKey == 554 or itemKey == 555 or itemKey == 17568 or itemKey == 17569 or itemKey == 19932 or itemKey == 19933 or itemKey == 19934 or itemKey == 19935 then
        potionPosInit = true
        if invenSlotNo == 255 then
          Potion_Alert(index)
          potionRefill = true
        end
      end
    end
  end
  if potionRefill == false then
    potion_bubble:SetShow(false)
    potion_bubble2:SetShow(false)
  end
  if potionPosInit == false then
    potion_bubble2:SetPosX(-85)
    Potion_Bubble_Show(false)
  end
  if potion_bubble2:GetTextSizeY() > 30 then
    potion_bubble2:SetSize(potion_bubble2:GetTextSizeX() + 10, potion_bubble2:GetTextSizeY() + 28)
    potion_bubble2:SetPosX(potion_bubble2:GetPosX() - (potion_bubble2:GetTextSizeX() - 160))
    if not bubble2Change then
      potion_bubble2:SetPosY(potion_bubble2:GetPosY() - (potion_bubble2:GetTextSizeY() - 26))
    end
    bubble2Change = true
  else
    potion_bubble2:SetSize(potion_bubble2:GetTextSizeX() + 10, 55)
  end
  if potion_bubble:GetTextSizeY() > 30 then
    potion_bubble:SetSize(potion_bubble:GetTextSizeX() + 10, potion_bubble:GetTextSizeY() + 28)
    potion_bubble:SetPosX(potion_bubble:GetPosX() - (potion_bubble:GetTextSizeX() - 160))
    if not bubbleChange then
      potion_bubble:SetPosY(potion_bubble:GetPosY() - (potion_bubble:GetTextSizeY() - 26))
    end
    bubbleChange = true
  else
    potion_bubble:SetSize(potion_bubble:GetTextSizeX() + 10, 55)
  end
end

Potion_Alert = function(slotNo)
  -- function num : 0_35 , upvalues : potion_bubble, potion_bubble2, potionAlert
  local quickSlotInfo = getQuickSlotItem(slotNo)
  local invenSlotNo = (((getSelfPlayer()):get()):getInventory()):getSlot(quickSlotInfo._itemKey)
  local itemStaticWrapper = getItemEnchantStaticStatus(quickSlotInfo._itemKey)
  local itemName = itemStaticWrapper:getName()
  local hp_potion = (string.sub)(itemName, 1, 2)
  potion_bubble:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUICKSLOT_HAVENT_POTION_2", "itemName", itemName))
  potion_bubble2:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUICKSLOT_HAVENT_POTION_2", "itemName", itemName))
  Potion_Bubble_Locate(slotNo)
  if potionAlert == false then
    return 
  end
end

Potion_Bubble_Locate = function(slotNo)
  -- function num : 0_36 , upvalues : halfScreenSize, potion_bubble2, potion_bubble
  local posX = slotNo * 55 + 10
  if posX < halfScreenSize then
    potion_bubble2:SetPosX(posX - 95)
    Potion_Bubble_Show(false)
  else
    potion_bubble:SetPosX(posX)
    Potion_Bubble_Show(true)
  end
end

Potion_Bubble_Show = function(bool)
  -- function num : 0_37 , upvalues : potion_bubble, potion_bubble2
  if bool == true then
    potion_bubble:SetShow(true)
    potion_bubble2:SetShow(false)
  else
    potion_bubble:SetShow(false)
    potion_bubble2:SetShow(true)
  end
end

Time_Formatting_ShowTop = function(second)
  -- function num : 0_38
  if second > 3600 then
    local recalc_time = second / 3600
    local strHour = (string.format)("%d", Int64toInt32(recalc_time))
    return PAGetStringParam1(Defines.StringSheet_GAME, "BUFF_HOUR", "time_hour", strHour)
  else
    do
      if second > 60 then
        local recalc_time = second / 60
        local strMinute = (string.format)("%d", Int64toInt32(recalc_time))
        return PAGetStringParam1(Defines.StringSheet_GAME, "BUFF_MINUTE", "time_minute", strMinute)
      else
        do
          local recalc_time = second
          local strSecond = (string.format)("%d", Int64toInt32(recalc_time))
          do return PAGetStringParam1(Defines.StringSheet_GAME, "BUFF_SECOND", "time_second", strSecond) end
        end
      end
    end
  end
end

QuickSlot_GetInventoryTypeFrom = function(quickType)
  -- function num : 0_39
  if (CppEnums.QuickSlotType).eItem == quickType then
    return (CppEnums.ItemWhereType).eInventory
  end
  return (CppEnums.ItemWhereType).eCashInventory
end

QuickSlot_OnscreenResize = function()
  -- function num : 0_40
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_QuickSlot:GetRelativePosX() == -1 and Panel_QuickSlot:GetRelativePosY() == -1 then
      local initPosX = (getScreenSizeX() - Panel_QuickSlot:GetSizeX()) / 2
      local initPosY = getScreenSizeY() - Panel_QuickSlot:GetSizeY()
      Panel_QuickSlot:SetPosX((getScreenSizeX() - Panel_QuickSlot:GetSizeX()) / 2)
      Panel_QuickSlot:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY())
      changePositionBySever(Panel_QuickSlot, (CppEnums.PAGameUIType).PAGameUIPanel_QuickSlot, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_QuickSlot, initPosX, initPosY)
    else
      do
        if Panel_QuickSlot:GetRelativePosX() == 0 and Panel_QuickSlot:GetRelativePosY() == 0 then
          Panel_QuickSlot:SetPosX((getScreenSizeX() - Panel_QuickSlot:GetSizeX()) / 2)
          Panel_QuickSlot:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY())
        else
          Panel_QuickSlot:SetPosX(getScreenSizeX() * Panel_QuickSlot:GetRelativePosX() - Panel_QuickSlot:GetSizeX() / 2)
          Panel_QuickSlot:SetPosY(getScreenSizeY() * Panel_QuickSlot:GetRelativePosY() - Panel_QuickSlot:GetSizeY() / 2)
        end
        Panel_QuickSlot:SetPosX((getScreenSizeX() - Panel_QuickSlot:GetSizeX()) / 2)
        Panel_QuickSlot:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY())
        changePositionBySever(Panel_QuickSlot, (CppEnums.PAGameUIType).PAGameUIPanel_QuickSlot, false, true, false)
        FGlobal_PanelRepostionbyScreenOut(Panel_QuickSlot)
      end
    end
  end
end

registerEvent("onScreenResize", "QuickSlot_OnscreenResize")
renderModeChange_QuickSlot_OnscreenResize = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_41
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  QuickSlot_OnscreenResize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_QuickSlot")
FromClient_luaLoadComplete_QuickSlot = function()
  -- function num : 0_42 , upvalues : quickSlot
  quickSlot:init()
  quickSlot:createSlot()
  quickSlot:registEventHandler()
  quickSlot:registMessageHandler()
  if not isUseNewQuickSlot() then
    changePositionBySever(Panel_QuickSlot, (CppEnums.PAGameUIType).PAGameUIPanel_QuickSlot, false, true, false)
  end
  registerEvent("FromClient_RenderModeChangeState", "renderModeChange_QuickSlot_OnscreenResize")
end


