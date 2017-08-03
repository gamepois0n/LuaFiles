-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skill\panel_window_reinforceskill.luac 

-- params : ...
-- function num : 0
Panel_Window_ReinforceSkill:SetShow(false, false)
Panel_Window_ReinforceSkill:setMaskingChild(true)
Panel_Window_ReinforceSkill:setGlassBackground(true)
Panel_Window_ReinforceSkill:SetDragAll(true)
Panel_Window_ReinforceSkill:RegisterShowEventFunc(true, "Panel_Window_ReinforceSkill_ShowAni()")
Panel_Window_ReinforceSkill:RegisterShowEventFunc(false, "Panel_Window_ReinforceSkill_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local isReinforceContentOpen = ToClient_IsContentsGroupOpen("203")
local normalReinforceSkillCount = 3
local awakenReinforceSkillCount = 3
local reinforceSkillViewCount = 6
local normalSkillreinforceableLv = {52, 54; [0] = 50}
local awakenSkillreinforceableLv = {58, 60; [0] = 56}
local reinforceSkillIndex = -1
local _count = 0
local reinforceSkillControl = {}
local fontColor_NormalSkill = 4293640023
local fontColor_AwakenSkill = 4280068804
local fontColor_NormalLevel = 4293640023
local fontColor_AwakenLevel = 4286636767
local fontColor_Disable = 4287993237
local btnClose = (UI.getChildControl)(Panel_Window_ReinforceSkill, "Button_Close")
local reinforceSkillBg = (UI.getChildControl)(Panel_Window_ReinforceSkill, "Static_AwakenSkill_BG")
local reinforceSkillSlot = (UI.getChildControl)(reinforceSkillBg, "Static_AwakenSkillSlot")
local reinforceSkillSlotBg = (UI.getChildControl)(reinforceSkillBg, "Static_AwakenSkillSlotBG")
local reinforceSkillName = (UI.getChildControl)(reinforceSkillBg, "StaticText_AwakenSkill_Name")
local reinforceSkillChangeButton = (UI.getChildControl)(reinforceSkillBg, "Button_AwakenSkill_Change")
local reinforceSkillDesc = (UI.getChildControl)(reinforceSkillBg, "StaticText_AwakenSkill_Desc")
local reinforceSkillAttrBg = (UI.getChildControl)(reinforceSkillBg, "Static_AttributeBg")
local reinforceSkillTitle = (UI.getChildControl)(reinforceSkillBg, "StaticText_AwakenSkill_AttributeTitle")
local reinforceSkillAttribute = (UI.getChildControl)(reinforceSkillBg, "Static_AwakenSkill_Attribute")
local reinforceSkillAttrDesc1 = (UI.getChildControl)(reinforceSkillBg, "StaticText_AwakenSkill_AttributeDesc_1")
local reinforceSkillAttrDesc2 = (UI.getChildControl)(reinforceSkillBg, "StaticText_AwakenSkill_AttributeDesc_2")
local reinforceSkillAttrChangeBtn = (UI.getChildControl)(reinforceSkillBg, "Button_AwakenSkill_AttributeChange")
local btnQuestion = (UI.getChildControl)(Panel_Window_ReinforceSkill, "Button_Question")
local reinforceSkillNoSetBg = (UI.getChildControl)(Panel_Window_ReinforceSkill, "Static_AwakenSkill_NoSetBg")
local reinforceSkillLimitLv = (UI.getChildControl)(reinforceSkillNoSetBg, "StaticText_LimitLv")
local reinforceNoSetTitle = (UI.getChildControl)(reinforceSkillNoSetBg, "StaticText_AwakenSkill_NoSetTitle")
local reinforceLockIcon = (UI.getChildControl)(reinforceSkillNoSetBg, "Static_LockIcon")
local reinforceUnlockIcon = (UI.getChildControl)(reinforceSkillNoSetBg, "Static_UnlockIcon")
btnClose:addInputEvent("Mouse_LUp", "Panel_Window_ReinforceSkill_Close()")
btnQuestion:SetShow(false)
btnQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelSkillAwaken\" )")
btnQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelSkillAwaken\", \"true\")")
btnQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelSkillAwaken\", \"false\")")
if isGameServiceTypeDev() or isGameTypeEnglish() or isGameTypeRussia() then
  reinforceSkillAttrDesc1:SetIgnore(false)
  reinforceSkillAttrDesc1:SetTextMode(UI_TM.eTextMode_LimitText)
  reinforceSkillAttrDesc2:SetIgnore(false)
  reinforceSkillAttrDesc2:SetTextMode(UI_TM.eTextMode_LimitText)
end
Panel_Window_ReinforceSkill_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Window_ReinforceSkill)
  local aniInfo1 = Panel_Window_ReinforceSkill:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Window_ReinforceSkill:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_ReinforceSkill:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_ReinforceSkill:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_ReinforceSkill:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_ReinforceSkill:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_Window_ReinforceSkill_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Window_ReinforceSkill:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_ReinforceSkill:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

Panel_Window_ReinforceSkill_Show = function()
  -- function num : 0_2
  Panel_Window_ReinforceSkill:SetShow(true, true)
  ReinforceSkill_SetData()
  TooltipSimple_Hide()
end

Panel_Window_ReinforceSkill_Close = function()
  -- function num : 0_3
  Panel_Window_ReinforceSkill:SetShow(false, true)
  TooltipSimple_Hide()
end

local basePosY = reinforceSkillBg:GetPosY()
local bgSizeY = reinforceSkillBg:GetSizeY()
local gapY = 5
ReinforceSkill_Init = function()
  -- function num : 0_4 , upvalues : reinforceSkillViewCount, reinforceSkillBg, basePosY, bgSizeY, gapY, reinforceSkillSlotBg, reinforceSkillSlot, reinforceSkillName, reinforceSkillChangeButton, reinforceSkillDesc, UI_TM, reinforceSkillAttrBg, reinforceSkillTitle, reinforceSkillAttribute, reinforceSkillAttrDesc1, reinforceSkillAttrDesc2, reinforceSkillAttrChangeBtn, reinforceSkillNoSetBg, reinforceSkillLimitLv, reinforceNoSetTitle, reinforceLockIcon, reinforceUnlockIcon, reinforceSkillControl
  for index = 0, reinforceSkillViewCount - 1 do
    local temp = {}
    temp._skillBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_ReinforceSkill, "ReinforceSkill_Bg_" .. index)
    CopyBaseProperty(reinforceSkillBg, temp._skillBg)
    ;
    (temp._skillBg):SetPosY(basePosY + (bgSizeY + gapY) * index + (math.floor)(index / 3) * 35)
    temp._skillSlotBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._skillBg, "ReinforceSkill_SlotBg_" .. index)
    CopyBaseProperty(reinforceSkillSlotBg, temp._skillSlotBg)
    temp._skillSlot = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._skillBg, "ReinforceSkill_Slot_" .. index)
    CopyBaseProperty(reinforceSkillSlot, temp._skillSlot)
    temp._skillName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._skillBg, "ReinforceSkill_Name_" .. index)
    CopyBaseProperty(reinforceSkillName, temp._skillName)
    temp._skillChangeButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, temp._skillBg, "ReinforceSkill_ChangeButton_" .. index)
    CopyBaseProperty(reinforceSkillChangeButton, temp._skillChangeButton)
    ;
    (temp._skillChangeButton):addInputEvent("Mouse_On", "ReinforceSkill_ButtonTooltip(" .. 0 .. ", " .. index .. ")")
    ;
    (temp._skillChangeButton):addInputEvent("Mouse_Out", "ReinforceSkill_ButtonTooltip()")
    temp._skillDesc = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._skillBg, "ReinforceSkill_Desc_" .. index)
    CopyBaseProperty(reinforceSkillDesc, temp._skillDesc)
    ;
    (temp._skillDesc):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    ;
    (temp._skillDesc):setLineCountByLimitAutoWrap(2)
    temp._skillAttrBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._skillBg, "ReinforceSkill_AttritubeBg_" .. index)
    CopyBaseProperty(reinforceSkillAttrBg, temp._skillAttrBg)
    temp._skillTitle = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._skillBg, "ReinforceSkill_Title_" .. index)
    CopyBaseProperty(reinforceSkillTitle, temp._skillTitle)
    temp._skillAttribute = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._skillBg, "ReinforceSkill_Attribute_" .. index)
    CopyBaseProperty(reinforceSkillAttribute, temp._skillAttribute)
    temp._skillAttrDesc1 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._skillBg, "ReinforceSkill_AttrDesc1_" .. index)
    CopyBaseProperty(reinforceSkillAttrDesc1, temp._skillAttrDesc1)
    temp._skillAttrDesc2 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._skillBg, "ReinforceSkill_AttrDesc2_" .. index)
    CopyBaseProperty(reinforceSkillAttrDesc2, temp._skillAttrDesc2)
    temp._skillAttrOptionChange = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, temp._skillBg, "ReinforceSkill_AttrCahngeButton_" .. index)
    CopyBaseProperty(reinforceSkillAttrChangeBtn, temp._skillAttrOptionChange)
    ;
    (temp._skillAttrOptionChange):addInputEvent("Mouse_On", "ReinforceSkill_ButtonTooltip(" .. 1 .. ", " .. index .. ")")
    ;
    (temp._skillAttrOptionChange):addInputEvent("Mouse_Out", "ReinforceSkill_ButtonTooltip()")
    temp._skillNoSetBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_ReinforceSkill, "ReinforceSkill_NoSetBg_" .. index)
    CopyBaseProperty(reinforceSkillNoSetBg, temp._skillNoSetBg)
    ;
    (temp._skillNoSetBg):SetPosY(basePosY + (bgSizeY + gapY) * index + (math.floor)(index / 3) * 35)
    temp._skillLimitLv = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._skillNoSetBg, "ReinforceSkill_LimitLv_" .. index)
    CopyBaseProperty(reinforceSkillLimitLv, temp._skillLimitLv)
    temp._skillNoSetTitle = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._skillNoSetBg, "ReinforceSkill_NoSetTitle_" .. index)
    CopyBaseProperty(reinforceNoSetTitle, temp._skillNoSetTitle)
    temp._skillLockIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._skillNoSetBg, "ReinforceSkill_LockIcon_" .. index)
    CopyBaseProperty(reinforceLockIcon, temp._skillLockIcon)
    temp._skillUnlockIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._skillNoSetBg, "ReinforceSkill_UnlockIcon_" .. index)
    CopyBaseProperty(reinforceUnlockIcon, temp._skillUnlockIcon)
    -- DECOMPILER ERROR at PC331: Confused about usage of register: R5 in 'UnsetPending'

    reinforceSkillControl[index] = temp
  end
  reinforceSkillBg:SetShow(false)
  reinforceSkillNoSetBg:SetShow(false)
end

ReinforceSkill_Init()
ReinforceSkill_SetData = function()
  -- function num : 0_5 , upvalues : reinforceSkillViewCount, reinforceSkillControl, normalReinforceSkillCount, normalSkillreinforceableLv, fontColor_NormalLevel, fontColor_NormalSkill, fontColor_Disable, awakenSkillreinforceableLv, fontColor_AwakenLevel, fontColor_AwakenSkill
  local selfPlayLevel = ((getSelfPlayer()):get()):getLevel()
  local reinforcableSkillCount = 0
  if selfPlayLevel < 50 then
    reinforcableSkillCount = 0
  else
    if selfPlayLevel < 52 then
      reinforcableSkillCount = 1
    else
      if selfPlayLevel < 54 then
        reinforcableSkillCount = 2
      else
        if selfPlayLevel < 56 then
          reinforcableSkillCount = 3
        else
          if selfPlayLevel < 58 then
            reinforcableSkillCount = 4
          else
            if selfPlayLevel < 60 then
              reinforcableSkillCount = 5
            else
              reinforcableSkillCount = 6
            end
          end
        end
      end
    end
  end
  local normalSkill_ReinforceCount = ToClient_GetSkillAwakeningCount()
  local awakenSkill_ReinforceCount = ToClient_GetWeaponSkillAwakeningCount()
  local normalSkill_ReinforceIndex, awakenSkill_ReinforceIndex = 0, 0
  local reinforceSkillIndex = -1
  for index = 0, reinforceSkillViewCount - 1 do
    local skillSlot = reinforceSkillControl[index]
    if index < normalReinforceSkillCount then
      if index < normalSkill_ReinforceCount then
        (skillSlot._skillBg):SetShow(true)
        ;
        (skillSlot._skillNoSetBg):SetShow(false)
        local reinforceSkillcount = (ToClient_GetReAwakeningListCount())
        local skillSSW = nil
        for sIndex = 0, reinforceSkillcount - 1 do
          skillSSW = ToClient_GetReAwakeningListAt(sIndex)
          if skillSSW:getSkillAwakeningType() == 0 and reinforceSkillIndex < sIndex then
            reinforceSkillIndex = sIndex
            break
          end
        end
        do
          if skillSSW ~= nil then
            local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
            ;
            (skillSlot._skillName):SetText(skillSSW:getName())
            ;
            (skillSlot._skillDesc):SetText(skillTypeSSW:getDescription())
            ;
            (skillSlot._skillSlot):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
            ;
            (skillSlot._skillSlotBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillSlotBg, 856, 420, 905, 468)
            ;
            ((skillSlot._skillSlotBg):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (skillSlot._skillSlotBg):setRenderTexture((skillSlot._skillSlotBg):getBaseTexture())
            local skillNo = skillSSW:getSkillNo()
            local optionCount = ToClient_GetAwakeningAbilityCount(skillNo)
            ;
            (skillSlot._skillAttrOptionChange):SetShow(true)
            if optionCount == 1 then
              local optionIndex = ToClient_GetAwakeningAbilityIndex(skillNo, 0)
              ;
              (skillSlot._skillAttrDesc1):SetText(skillSSW:getSkillAwakenDescription(optionIndex))
              ;
              (skillSlot._skillAttrDesc1):addInputEvent("Mouse_On", "Panel_ReinforceSkill_DescTooltip(" .. reinforceSkillIndex .. ", " .. skillNo .. ", " .. 0 .. ", " .. index .. ")")
              ;
              (skillSlot._skillAttrDesc1):addInputEvent("Mouse_Out", "Panel_ReinforceSkill_DescTooltip()")
              ;
              (skillSlot._skillAttrDesc2):SetText("")
              ;
              (skillSlot._skillAttrDesc2):addInputEvent("Mouse_On", "")
              ;
              (skillSlot._skillAttrDesc2):addInputEvent("Mouse_Out", "")
              ;
              (skillSlot._skillAttrOptionChange):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Show(" .. 0 .. ", " .. skillNo .. ", " .. reinforceSkillIndex .. ")")
            else
              do
                if optionCount == 2 then
                  local optionIndex1 = ToClient_GetAwakeningAbilityIndex(skillNo, 0)
                  local optionIndex2 = ToClient_GetAwakeningAbilityIndex(skillNo, 1)
                  ;
                  (skillSlot._skillAttrDesc1):SetText(skillSSW:getSkillAwakenDescription(optionIndex1))
                  ;
                  (skillSlot._skillAttrDesc1):addInputEvent("Mouse_On", "Panel_ReinforceSkill_DescTooltip(" .. reinforceSkillIndex .. ", " .. skillNo .. ", " .. 0 .. ", " .. index .. ")")
                  ;
                  (skillSlot._skillAttrDesc1):addInputEvent("Mouse_Out", "Panel_ReinforceSkill_DescTooltip()")
                  ;
                  (skillSlot._skillAttrDesc2):SetText(skillSSW:getSkillAwakenDescription(optionIndex2))
                  ;
                  (skillSlot._skillAttrDesc2):addInputEvent("Mouse_On", "Panel_ReinforceSkill_DescTooltip(" .. reinforceSkillIndex .. ", " .. skillNo .. ", " .. 1 .. ", " .. index .. ")")
                  ;
                  (skillSlot._skillAttrDesc2):addInputEvent("Mouse_Out", "Panel_ReinforceSkill_DescTooltip()")
                  ;
                  (skillSlot._skillAttrOptionChange):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Show(" .. 0 .. ", " .. skillNo .. ", " .. reinforceSkillIndex .. ")")
                else
                  do
                    ;
                    (skillSlot._skillAttrOptionChange):SetShow(false)
                    ;
                    (skillSlot._skillSlot):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Change(" .. 0 .. "," .. skillNo .. "," .. reinforceSkillIndex .. ")")
                    ;
                    (skillSlot._skillSlotBg):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Change(" .. 0 .. "," .. skillNo .. "," .. reinforceSkillIndex .. ")")
                    ;
                    (skillSlot._skillChangeButton):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Change(" .. 0 .. "," .. skillNo .. "," .. reinforceSkillIndex .. ")")
                    ;
                    (skillSlot._skillBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
                    do
                      local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillBg, 300, 605, 1020, 690)
                      ;
                      ((skillSlot._skillBg):getBaseTexture()):setUV(x1, y1, x2, y2)
                      ;
                      (skillSlot._skillBg):setRenderTexture((skillSlot._skillBg):getBaseTexture())
                      ;
                      (skillSlot._skillBg):SetShow(false)
                      ;
                      (skillSlot._skillNoSetBg):SetShow(true)
                      ;
                      (skillSlot._skillLimitLv):SetText(normalSkillreinforceableLv[index] .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV"))
                      ;
                      (skillSlot._skillNoSetTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NORMAL_1"))
                      if index < reinforcableSkillCount then
                        (skillSlot._skillNoSetBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillNoSetBg, 300, 605, 1020, 690)
                        ;
                        ((skillSlot._skillNoSetBg):getBaseTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (skillSlot._skillNoSetBg):setRenderTexture((skillSlot._skillNoSetBg):getBaseTexture())
                        ;
                        (skillSlot._skillNoSetBg):SetIgnore(true)
                        ;
                        (skillSlot._skillNoSetBg):SetIgnore(false)
                        ;
                        (skillSlot._skillLockIcon):SetShow(false)
                        ;
                        (skillSlot._skillUnlockIcon):SetShow(true)
                        ;
                        (skillSlot._skillLimitLv):SetFontColor(fontColor_NormalLevel)
                        ;
                        (skillSlot._skillNoSetTitle):SetFontColor(fontColor_NormalSkill)
                      else
                        do
                          ;
                          (skillSlot._skillNoSetBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
                          do
                            local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillNoSetBg, 300, 795, 1020, 880)
                            ;
                            ((skillSlot._skillNoSetBg):getBaseTexture()):setUV(x1, y1, x2, y2)
                            ;
                            (skillSlot._skillNoSetBg):setRenderTexture((skillSlot._skillNoSetBg):getBaseTexture())
                            ;
                            (skillSlot._skillNoSetBg):SetIgnore(true)
                            ;
                            (skillSlot._skillLockIcon):SetShow(true)
                            ;
                            (skillSlot._skillUnlockIcon):SetShow(false)
                            ;
                            (skillSlot._skillNoSetTitle):SetFontColor(fontColor_Disable)
                            ;
                            (skillSlot._skillLimitLv):SetFontColor(fontColor_Disable)
                            ;
                            (skillSlot._skillNoSetBg):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Show(" .. 0 .. ")")
                            if index == normalReinforceSkillCount - 1 then
                              reinforceSkillIndex = -1
                            end
                            if index < awakenSkill_ReinforceCount + 3 then
                              (skillSlot._skillBg):SetShow(true)
                              ;
                              (skillSlot._skillNoSetBg):SetShow(false)
                              local reinforceSkillcount = (ToClient_GetReAwakeningListCount())
                              local skillSSW = nil
                              for sIndex = 0, reinforceSkillcount - 1 do
                                skillSSW = ToClient_GetReAwakeningListAt(sIndex)
                                if skillSSW:getSkillAwakeningType() == 1 and reinforceSkillIndex < sIndex then
                                  reinforceSkillIndex = sIndex
                                  break
                                end
                              end
                              do
                                if skillSSW ~= nil then
                                  local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
                                  ;
                                  (skillSlot._skillName):SetText(skillSSW:getName())
                                  ;
                                  (skillSlot._skillDesc):SetText(skillTypeSSW:getDescription())
                                  ;
                                  (skillSlot._skillSlot):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
                                  ;
                                  (skillSlot._skillSlotBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillSlotBg, 856, 473, 905, 521)
                                  ;
                                  ((skillSlot._skillSlotBg):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (skillSlot._skillSlotBg):setRenderTexture((skillSlot._skillSlotBg):getBaseTexture())
                                  local skillNo = skillSSW:getSkillNo()
                                  local optionCount = ToClient_GetAwakeningAbilityCount(skillNo)
                                  ;
                                  (skillSlot._skillAttrOptionChange):SetShow(true)
                                  if optionCount == 1 then
                                    local optionIndex = ToClient_GetAwakeningAbilityIndex(skillNo, 0)
                                    ;
                                    (skillSlot._skillAttrDesc1):SetText(skillSSW:getSkillAwakenDescription(optionIndex))
                                    ;
                                    (skillSlot._skillAttrDesc1):addInputEvent("Mouse_On", "Panel_ReinforceSkill_DescTooltip(" .. reinforceSkillIndex .. ", " .. skillNo .. ", " .. 0 .. ", " .. index .. ")")
                                    ;
                                    (skillSlot._skillAttrDesc1):addInputEvent("Mouse_Out", "Panel_ReinforceSkill_DescTooltip()")
                                    ;
                                    (skillSlot._skillAttrDesc2):SetText("")
                                    ;
                                    (skillSlot._skillAttrDesc2):addInputEvent("Mouse_On", "")
                                    ;
                                    (skillSlot._skillAttrDesc2):addInputEvent("Mouse_Out", "")
                                    ;
                                    (skillSlot._skillAttrOptionChange):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Show(" .. 1 .. ", " .. skillNo .. ", " .. reinforceSkillIndex .. ")")
                                  else
                                    do
                                      if optionCount == 2 then
                                        local optionIndex1 = ToClient_GetAwakeningAbilityIndex(skillNo, 0)
                                        local optionIndex2 = ToClient_GetAwakeningAbilityIndex(skillNo, 1)
                                        ;
                                        (skillSlot._skillAttrDesc1):SetText(skillSSW:getSkillAwakenDescription(optionIndex1))
                                        ;
                                        (skillSlot._skillAttrDesc1):addInputEvent("Mouse_On", "Panel_ReinforceSkill_DescTooltip(" .. reinforceSkillIndex .. ", " .. skillNo .. ", " .. 0 .. ", " .. index .. ")")
                                        ;
                                        (skillSlot._skillAttrDesc1):addInputEvent("Mouse_Out", "Panel_ReinforceSkill_DescTooltip()")
                                        ;
                                        (skillSlot._skillAttrDesc2):SetText(skillSSW:getSkillAwakenDescription(optionIndex2))
                                        ;
                                        (skillSlot._skillAttrDesc2):addInputEvent("Mouse_On", "Panel_ReinforceSkill_DescTooltip(" .. reinforceSkillIndex .. ", " .. skillNo .. ", " .. 1 .. ", " .. index .. ")")
                                        ;
                                        (skillSlot._skillAttrDesc2):addInputEvent("Mouse_Out", "Panel_ReinforceSkill_DescTooltip()")
                                        ;
                                        (skillSlot._skillAttrOptionChange):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Show(" .. 1 .. ", " .. skillNo .. ", " .. reinforceSkillIndex .. ")")
                                      else
                                        do
                                          ;
                                          (skillSlot._skillAttrOptionChange):SetShow(false)
                                          ;
                                          (skillSlot._skillSlot):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Change(" .. 1 .. "," .. skillNo .. "," .. reinforceSkillIndex .. ")")
                                          ;
                                          (skillSlot._skillSlotBg):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Change(" .. 1 .. "," .. skillNo .. "," .. reinforceSkillIndex .. ")")
                                          ;
                                          (skillSlot._skillChangeButton):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Change(" .. 1 .. "," .. skillNo .. "," .. reinforceSkillIndex .. ")")
                                          ;
                                          (skillSlot._skillBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
                                          do
                                            local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillBg, 300, 700, 1020, 785)
                                            ;
                                            ((skillSlot._skillBg):getBaseTexture()):setUV(x1, y1, x2, y2)
                                            ;
                                            (skillSlot._skillBg):setRenderTexture((skillSlot._skillBg):getBaseTexture())
                                            ;
                                            (skillSlot._skillBg):SetShow(false)
                                            ;
                                            (skillSlot._skillNoSetBg):SetShow(true)
                                            ;
                                            (skillSlot._skillLimitLv):SetText(awakenSkillreinforceableLv[index - 3] .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV"))
                                            ;
                                            (skillSlot._skillNoSetTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_AWAKEN_1"))
                                            if index < reinforcableSkillCount then
                                              (skillSlot._skillNoSetBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
                                              local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillNoSetBg, 300, 700, 1020, 785)
                                              ;
                                              ((skillSlot._skillNoSetBg):getBaseTexture()):setUV(x1, y1, x2, y2)
                                              ;
                                              (skillSlot._skillNoSetBg):setRenderTexture((skillSlot._skillNoSetBg):getBaseTexture())
                                              ;
                                              (skillSlot._skillNoSetBg):SetIgnore(true)
                                              ;
                                              (skillSlot._skillNoSetBg):SetIgnore(false)
                                              ;
                                              (skillSlot._skillLockIcon):SetShow(false)
                                              ;
                                              (skillSlot._skillUnlockIcon):SetShow(true)
                                              ;
                                              (skillSlot._skillLimitLv):SetFontColor(fontColor_AwakenLevel)
                                              ;
                                              (skillSlot._skillNoSetTitle):SetFontColor(fontColor_AwakenSkill)
                                            else
                                              do
                                                ;
                                                (skillSlot._skillNoSetBg):ChangeTextureInfoName("New_UI_Common_forLua/Window/AlchemyStone/Alchemy_00.dds")
                                                do
                                                  do
                                                    local x1, y1, x2, y2 = setTextureUV_Func(skillSlot._skillNoSetBg, 300, 795, 1020, 880)
                                                    ;
                                                    ((skillSlot._skillNoSetBg):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    ;
                                                    (skillSlot._skillNoSetBg):setRenderTexture((skillSlot._skillNoSetBg):getBaseTexture())
                                                    ;
                                                    (skillSlot._skillNoSetBg):SetIgnore(true)
                                                    ;
                                                    (skillSlot._skillLockIcon):SetShow(true)
                                                    ;
                                                    (skillSlot._skillUnlockIcon):SetShow(false)
                                                    ;
                                                    (skillSlot._skillLimitLv):SetFontColor(fontColor_Disable)
                                                    ;
                                                    (skillSlot._skillNoSetTitle):SetFontColor(fontColor_Disable)
                                                    ;
                                                    (skillSlot._skillNoSetBg):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Show(" .. 1 .. ")")
                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC895: LeaveBlock: unexpected jumping out IF_STMT

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

Panel_ReinforceSkill_Show = function()
  -- function num : 0_6
  if not ToClient_IsContentsGroupOpen("203") then
    return 
  end
  Panel_Window_ReinforceSkill:SetShow(true, true)
  ReinforceSkill_SetData()
end

Panel_ReinforceSkill_DescTooltip = function(reinforceIndex, skillNo, uiIndex, index)
  -- function num : 0_7 , upvalues : reinforceSkillIndex, reinforceSkillControl
  if index == nil then
    TooltipSimple_Hide()
    return 
  end
  local control, name = nil, nil
  if reinforceIndex < 3 then
    local optionIndex = ToClient_GetAwakeningAbilityIndex(skillNo, uiIndex)
    local skillSSW = ToClient_GetReAwakeningListAt(reinforceIndex)
    name = skillSSW:getSkillAwakenDescription(optionIndex)
  else
    do
      local reinforceSkillcount = (ToClient_GetReAwakeningListCount())
      local skillSSW = nil
      for sIndex = 0, reinforceSkillcount - 1 do
        skillSSW = ToClient_GetReAwakeningListAt(sIndex)
        if skillSSW:getSkillAwakeningType() == 1 and reinforceSkillIndex < sIndex then
          reinforceSkillIndex = sIndex
          break
        end
      end
      do
        do
          local optionIndex = ToClient_GetAwakeningAbilityIndex(skillNo, uiIndex)
          if skillSSW ~= nil then
            name = skillSSW:getSkillAwakenDescription(optionIndex)
          end
          if uiIndex == 0 then
            control = (reinforceSkillControl[index])._skillAttrDesc1
          else
            control = (reinforceSkillControl[index])._skillAttrDesc2
          end
          TooltipSimple_Show(control, name)
        end
      end
    end
  end
end

ReinforceSkill_ButtonTooltip = function(btnType, index)
  -- function num : 0_8 , upvalues : reinforceSkillControl
  if btnType == nil then
    TooltipSimple_Hide()
    return 
  end
  local control, name = nil, nil
  if btnType == 0 then
    control = (reinforceSkillControl[index])._skillChangeButton
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILLREINFORCE_CHANGESKILL")
  else
    if btnType == 1 then
      control = (reinforceSkillControl[index])._skillAttrOptionChange
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILLREINFORCE_CHANGEOPTION")
    end
  end
  TooltipSimple_Show(control, name)
end

registerEvent("EventShowAwakenSkill", "Panel_ReinforceSkill_Show")

