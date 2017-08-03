-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\quickslot\panel_skillcooltime.luac 

-- params : ...
-- function num : 0
Panel_CoolTime_Effect:SetShow(false, false)
Panel_SkillCooltime:SetShow(true)
Panel_SkillCooltime:SetFakeUIRenderList()
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
Panel_CoolTime_Effect:RegisterShowEventFunc(true, "SkillCoolTime_Effect_HideAni()")
SkillCoolTime_Effect_HideAni = function()
  -- function num : 0_0 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_CoolTime_Effect:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local coolTime = Panel_CoolTime_Effect:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  coolTime:SetStartColor(UI_color.C_FFFFFFFF)
  coolTime:SetEndColor(UI_color.C_00FFFFFF)
  coolTime:SetStartIntensity(3)
  coolTime:SetEndIntensity(1)
  coolTime.IsChangeChild = true
  coolTime:SetHideAtEnd(true)
  coolTime:SetDisableWhileAni(true)
end

local skillCooltime = {
config = {slotGapX = 50, slotGapY = 50, screenPosX = 0.33, screenPosY = 0.42}
, 
slotConfig = {createIcon = true, createEffect = false, createFG = false, createFGDisabled = false, createLevel = false, createLearnButton = false, createCooltime = true, createCooltimeText = true}
, 
slots = {}
, 
slots_description = {}
, slotPool = (Array.new)(), slotPool_desc = (Array.new)(), slotCount = 0, slotCount_desc = 0, textRemainTime = 1.5, textTemplate = (UI.getChildControl)(Panel_SkillCooltime, "StaticText_CoolTimeTitle")}
local showToggle = true
skillCooltime.createNewSlot = function(self)
  -- function num : 0_1
  self.slotCount = self.slotCount + 1
  local slot = {}
  ;
  (SlotSkill.new)(slot, self.slotCount, Panel_SkillCooltime, self.slotConfig)
  ;
  (slot.icon):SetIgnore(true)
  slot.iconBg = (UI.createAndCopyBasePropertyControl)(Panel_SkillCooltime, "Static_Icon_GuildSkillBG", slot.icon, "GuildSkillCoolTimeBG_" .. self.slotCount)
  ;
  (slot.iconBg):SetPosX((slot.icon):GetPosX() - 6)
  ;
  (slot.iconBg):SetPosY((slot.icon):GetPosY() - 6)
  return slot
end

skillCooltime.createNewSlot_Desc = function(self)
  -- function num : 0_2
  self.slotCount_desc = self.slotCount_desc + 1
  local slot = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_SkillCooltime, "StaticText_description_" .. tostring(self.slotCount_desc))
  CopyBaseProperty(self.textTemplate, slot)
  slot:SetIgnore(true)
  return slot
end

skillCooltime.getSlot = function(self)
  -- function num : 0_3
  if (self.slotPool):length() > 0 then
    return (self.slotPool):pop_back()
  else
    return self:createNewSlot()
  end
end

skillCooltime.getSlotDesc = function(self)
  -- function num : 0_4
  if (self.slotPool_desc):length() > 0 then
    return (self.slotPool_desc):pop_back()
  else
    return self:createNewSlot_Desc()
  end
end

local skillReuseTime = nil
SkillCooltime_Add = function(TSkillKey, TSkillNo)
  -- function num : 0_5 , upvalues : skillCooltime, skillReuseTime
  local self = skillCooltime
  local slot = (self.slots)[TSkillKey]
  if slot == nil then
    slot = self:getSlot()
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self.slots)[TSkillKey] = slot
  end
  local slotDesc = (self.slots_description)[TSkillKey]
  if slotDesc == nil then
    slotDesc = {control = self:getSlotDesc(), remainTime = self.textRemainTime, skillNo = TSkillNo}
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.slots_description)[TSkillKey] = slotDesc
    ;
    (slotDesc.control):SetShow(false)
  end
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(TSkillNo)
  local isGuildSkill = skillTypeStaticWrapper:isGuildSkill()
  if isGuildSkill == true then
    (slot.iconBg):SetShow(true)
  else
    ;
    (slot.iconBg):SetShow(false)
  end
  local level = getLearnedSkillLevel(skillTypeStaticWrapper)
  local skillSS = getSkillStaticStatus(TSkillNo, level)
  skillReuseTime = (skillSS:get())._reuseCycle / 1000
  slot:clearSkill()
  slot:setSkillTypeStatic(skillTypeStaticWrapper)
  slotDesc.remainTime = self.textRemainTime
  ;
  (slotDesc.control):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SKILLCOOLTIME_SlotDesc", "skillName", skillTypeStaticWrapper:getName()))
  ;
  (slotDesc.control):SetShow(false)
  ;
  (slotDesc.control):SetAlpha(1)
end

SkillCooltime_OnResize = function()
  -- function num : 0_6 , upvalues : skillCooltime
  local self = skillCooltime
  local sizeX = nil
  if CppDefine.ChangeUIAndResolution == true then
    sizeX = getScreenSizeX()
  else
    sizeX = getScreenSizeX() - 20
  end
  local sizeY = getScreenSizeY()
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_SkillCooltime:GetRelativePosX() == -1 and Panel_SkillCooltime:GetRelativePosY() == -1 then
      local initPosX = (sizeX) * (self.config).screenPosX
      local initPosY = sizeY * (self.config).screenPosY
      Panel_SkillCooltime:SetPosX(initPosX)
      Panel_SkillCooltime:SetPosY(initPosY)
      changePositionBySever(Panel_SkillCooltime, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCoolTime, true, true, false)
      FGlobal_InitPanelRelativePos(Panel_SkillCooltime, initPosX, initPosY)
    else
      do
        if Panel_SkillCooltime:GetRelativePosX() == 0 and Panel_SkillCooltime:GetRelativePosY() == 0 then
          Panel_SkillCooltime:SetPosX((sizeX) * (self.config).screenPosX)
          Panel_SkillCooltime:SetPosY(sizeY * (self.config).screenPosY)
        else
          Panel_SkillCooltime:SetPosX((sizeX) * Panel_SkillCooltime:GetRelativePosX() - Panel_SkillCooltime:GetSizeX() / 2)
          Panel_SkillCooltime:SetPosY(sizeY * Panel_SkillCooltime:GetRelativePosY() - Panel_SkillCooltime:GetSizeY() / 2)
        end
        if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_SkillCoolTime, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
          Panel_SkillCooltime:SetShow(ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_SkillCoolTime, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
        end
        Panel_SkillCooltime:SetPosX((sizeX) * (self.config).screenPosX)
        Panel_SkillCooltime:SetPosY(sizeY * (self.config).screenPosY)
        changePositionBySever(Panel_SkillCooltime, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCoolTime, true, true, false)
        FGlobal_PanelRepostionbyScreenOut(Panel_SkillCooltime)
      end
    end
  end
end

SkillCooltime_UpdatePerFrame = function(deltaTime)
  -- function num : 0_7 , upvalues : showToggle, skillCooltime
  if showToggle == false then
    return 
  end
  local self = skillCooltime
  local remainTime = 0
  local row = 0
  local col = 0
  local count = 0
  do
    local readyCount = 0
    for tSkillKey,slot_desc in pairs(self.slots_description) do
      local slot = (self.slots)[tSkillKey]
      remainTime = getSkillCooltime(tSkillKey)
      local realRemainTime = 0
      local intRemainTime = 0
      local skillReuseTime = 0
      local skillStaticWrapper = getSkillStaticStatus(slot_desc.skillNo, 1)
      if skillStaticWrapper ~= nil then
        skillReuseTime = (skillStaticWrapper:get())._reuseCycle / 1000
      end
      if slot_desc.remainTime > 0 then
        row = count % 2
        col = (math.floor)(count / 2)
      end
      if remainTime > 0 and slot ~= nil then
        (slot.icon):SetShow(true)
        ;
        (slot.cooltime):UpdateCoolTime(remainTime)
        ;
        (slot.cooltime):SetShow(true)
        realRemainTime = remainTime * (skillReuseTime)
        intRemainTime = realRemainTime - realRemainTime % 1 + 1
        ;
        (slot.cooltimeText):SetText(Time_Formatting_ShowTop(intRemainTime))
        if intRemainTime <= skillReuseTime then
          (slot.cooltimeText):SetShow(true)
        else
          ;
          (slot.cooltimeText):SetShow(false)
        end
        slot:setPos(col * (self.config).slotGapX, row * (self.config).slotGapY)
      else
        if slot ~= nil then
          (slot.icon):SetShow(false)
          local slotPosX = (slot.icon):GetParentPosX()
          local slotPosY = (slot.icon):GetParentPosY()
          audioPostEvent_SystemUi(2, 1)
          Panel_CoolTime_Effect:SetShow(true, true)
          Panel_CoolTime_Effect:SetIgnore(true)
          Panel_CoolTime_Effect:AddEffect("fUI_Light", false, 0, 0)
          Panel_CoolTime_Effect:SetPosX(slotPosX - 5)
          Panel_CoolTime_Effect:SetPosY(slotPosY - 5)
          slot:clearSkill()
          ;
          (self.slotPool):push_back(slot)
          -- DECOMPILER ERROR at PC135: Confused about usage of register: R19 in 'UnsetPending'

          ;
          (self.slots)[tSkillKey] = nil
          ;
          (slot_desc.control):SetShow(true)
        end
      end
      do
        if (self.slots)[tSkillKey] == nil then
          slot_desc.remainTime = slot_desc.remainTime - deltaTime
          local rate = slot_desc.remainTime / self.textRemainTime
          if rate <= 0.5 then
            (slot_desc.control):SetFontAlpha(slot_desc.remainTime / (self.textRemainTime / 2))
            ;
            (slot_desc.control):SetAlpha(slot_desc.remainTime / (self.textRemainTime / 2))
          else
            ;
            (slot_desc.control):SetFontAlpha(1)
            ;
            (slot_desc.control):SetAlpha(1)
          end
        else
          do
            do
              ;
              (slot_desc.control):SetPosX((slot.icon):GetPosX() + (slot.icon):GetSizeX() / 2 - (slot_desc.control):GetSizeX() / 2)
              ;
              (slot_desc.control):SetPosY((slot.icon):GetPosY() + (slot.icon):GetSizeY() / 2 - (slot_desc.control):GetSizeY() / 2)
              if slot_desc.remainTime > 0 then
                count = count + 1
              else
                ;
                (slot_desc.control):SetShow(false)
              end
              -- DECOMPILER ERROR at PC217: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC217: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC217: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC217: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
      end
    end
    if count == 0 then
    end
  end
end

SkillCooltime_Reload = function()
  -- function num : 0_8
  local coolTimeSkillList = getCoolTimeSkillList()
  if coolTimeSkillList ~= nil then
    for index = 0, coolTimeSkillList:size() - 1 do
      local skillInfo = coolTimeSkillList:atPointer(index)
      local skillKey = (skillInfo._skillKey):get()
      local skillNo = (skillInfo._skillKey):getSkillNo()
      SkillCooltime_Add(skillKey, skillNo)
    end
  end
end

skillCooltime.registEventHandler = function(self)
  -- function num : 0_9
  Panel_SkillCooltime:RegisterUpdateFunc("SkillCooltime_UpdatePerFrame")
end

skillCooltime.registMessageHandler = function(self)
  -- function num : 0_10
  registerEvent("EventSkillCooltime", "SkillCooltime_Add")
  registerEvent("onScreenResize", "SkillCooltime_OnResize")
end

SkillCooltime_Reload()
skillCooltime:registEventHandler()
skillCooltime:registMessageHandler()
Panel_SkillCooltime_ShowToggle = function()
  -- function num : 0_11 , upvalues : showToggle
  local isShow = Panel_SkillCooltime:IsShow()
  if isShow then
    showToggle = false
    Panel_SkillCooltime:SetShow(false, false)
  else
    showToggle = true
    Panel_SkillCooltime:SetShow(true, true)
  end
end

registerEvent("FromClient_RenderModeChangeState", "SkillCooltime_OnResize")

