-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\progressbar\panel_progressbar.luac 

-- params : ...
-- function num : 0
local _collect_100per = (UI.getChildControl)(Panel_Collect_Bar, "Static_100per")
local _product_100per = (UI.getChildControl)(Panel_Product_Bar, "Static_100per")
local _enchant_100per = (UI.getChildControl)(Panel_Enchant_Bar, "Static_100per")
local _casting_100per = (UI.getChildControl)(Panel_Casting_Bar, "Static_Effect_BG")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AV = CppEnums.PA_UI_ALIGNVERTICAL
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local _collectText = (UI.getChildControl)(Panel_Collect_Bar, "StaticText_CollectingNow")
local checkBtn_DrawWater = (UI.getChildControl)(Panel_Collect_Bar, "CheckButton_DrawWater")
checkBtn_DrawWater:addInputEvent("Mouse_LUp", "DrawWater_Check()")
DrawWater_Check = function()
  -- function num : 0_0 , upvalues : checkBtn_DrawWater
  local temporaryWrapper = getTemporaryInformationWrapper()
  local isCheck = checkBtn_DrawWater:IsCheck()
  temporaryWrapper:setRepeatCollect(isCheck)
  Global_UpdateDrawWaterRepeat()
end

Global_SetShowDrawWaterRepeat = function(isShow)
  -- function num : 0_1 , upvalues : checkBtn_DrawWater
  checkBtn_DrawWater:SetShow(isShow)
end

Global_UpdateDrawWaterRepeat = function()
  -- function num : 0_2 , upvalues : checkBtn_DrawWater
  local temporaryWrapper = getTemporaryInformationWrapper()
  local isCheck = temporaryWrapper:getRepeatCollect()
  checkBtn_DrawWater:SetCheck(isCheck)
end

Panel_Collect_Bar:SetShow(false, false)
Panel_Product_Bar:SetShow(false, false)
Panel_Enchant_Bar:SetShow(false, false)
Panel_Casting_Bar:SetShow(false, false)
Panel_Collect_Bar:RegisterShowEventFunc(true, "CollectBarShowAni()")
Panel_Collect_Bar:RegisterShowEventFunc(false, "CollectBarHideAni()")
CollectBarShowAni = function()
  -- function num : 0_3 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Collect_Bar:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local CollectBar_Alpha = Panel_Collect_Bar:addColorAnimation(0, 0.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  CollectBar_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  CollectBar_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  CollectBar_Alpha.IsChangeChild = true
end

CollectBarHideAni = function()
  -- function num : 0_4
  Panel_Collect_Bar:SetShow(false, false)
end

Panel_Product_Bar:RegisterShowEventFunc(true, "ProductBarShowAni()")
Panel_Product_Bar:RegisterShowEventFunc(false, "ProductBarHideAni()")
ProductBarShowAni = function()
  -- function num : 0_5 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Product_Bar:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local CollectBar_Alpha = Panel_Product_Bar:addColorAnimation(0, 0.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  CollectBar_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  CollectBar_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  CollectBar_Alpha.IsChangeChild = true
end

ProductBarHideAni = function()
  -- function num : 0_6
  Panel_Product_Bar:SetShow(false, false)
end

Panel_Enchant_Bar:RegisterShowEventFunc(true, "EnchantBarShowAni()")
Panel_Enchant_Bar:RegisterShowEventFunc(false, "EnchantBarHideAni()")
EnchantBarShowAni = function()
  -- function num : 0_7 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Enchant_Bar:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local CollectBar_Alpha = Panel_Enchant_Bar:addColorAnimation(0, 0.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  CollectBar_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  CollectBar_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  CollectBar_Alpha.IsChangeChild = true
end

EnchantBarHideAni = function()
  -- function num : 0_8
  Panel_Enchant_Bar:SetShow(false, false)
end

Panel_Casting_Bar:RegisterShowEventFunc(true, "CastingBarShowAni()")
Panel_Casting_Bar:RegisterShowEventFunc(false, "CastingBarHideAni()")
CastingBarShowAni = function()
  -- function num : 0_9 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Casting_Bar:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local casting_Alpha = Panel_Casting_Bar:addColorAnimation(0, 0.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  casting_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  casting_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  casting_Alpha.IsChangeChild = true
end

CastingBarHideAni = function()
  -- function num : 0_10
  Panel_Casting_Bar:SetShow(false, false)
end

local collectBar = {_progressText, _progressControl; _progressTime = 0, _currentTime = 0, _endEventFunction = nil, _checkActionFunction = nil, _useType = 0}
local productBar = {_progressText, _progressControl, _progressTime, _currentTime; _endEventFunction = nil}
local enchantBar = {_progressText, _progressControl; _progressTime = 0, _currentTime = 0, _endEventFunction = nil}
local castingBar = {_progressControl = nil, _progressTime = 0, _currentTime = 0, _endEventFunction = nil}
collectBar.Init = function(self)
  -- function num : 0_11 , upvalues : collectBar
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  collectBar._titleText = (UI.getChildControl)(Panel_Collect_Bar, "StaticText_CollectingNow")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  collectBar._progressText = (UI.getChildControl)(Panel_Collect_Bar, "StaticText_Bar")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  collectBar._progressControl = (UI.getChildControl)(Panel_Collect_Bar, "Progress2_1")
end

local currentTime_Collect = nil
collectBar.Show = function(self, isShow, progressTime, endFunction, checkFunction)
  -- function num : 0_12 , upvalues : currentTime_Collect, collectBar
  if isShow == true then
    Panel_Collect_Bar:SetShow(true, true)
    currentTime_Collect = FGlobal_getFrameCount() + 1
    ;
    (collectBar._progressControl):SetShow(true)
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

    collectBar._progressTime = progressTime
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R5 in 'UnsetPending'

    collectBar._currentTime = 0
    local strTemp = (string.format)("%.1f", progressTime)
    ;
    (collectBar._progressText):SetText(strTemp)
    ;
    (collectBar._progressControl):SetProgressRate(0)
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R6 in 'UnsetPending'

    collectBar._endEventFunction = endFunction
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R6 in 'UnsetPending'

    collectBar._checkActionFunction = checkFunction
  else
    do
      collectBar:Stop()
    end
  end
end

collectBar.Update = function(self, fDeltaTime)
  -- function num : 0_13 , upvalues : collectBar
  if collectBar._progressTime == 0 then
    return 
  end
  if collectBar._checkActionFunction ~= nil and (collectBar._checkActionFunction)() == false then
    collectBar:Stop()
  end
  local nextTime = collectBar._currentTime + fDeltaTime
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

  collectBar._currentTime = nextTime
  local percent = nextTime / collectBar._progressTime * 100
  if percent > 100 then
    if collectBar._endEventFunction ~= nil then
      (collectBar._endEventFunction)()
    end
    collectBar:Stop()
  else
    local remainTime = collectBar._progressTime - collectBar._currentTime
    local strTemp = (string.format)("%.1f", remainTime)
    ;
    (collectBar._progressText):SetText(strTemp)
    ;
    (collectBar._progressControl):SetProgressRate(percent)
    if collectBar._useType == 1 then
      local curEndurance = repair_getSelfRepairItemEndurance()
      local strEndurance = (string.format)("%d", curEndurance)
      ;
      (collectBar._titleText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_REPAIRING_P1", "endurance", strEndurance))
      Manufacture_UpdateRepairTime()
    end
  end
end

collectBar.Stop = function(self)
  -- function num : 0_14 , upvalues : collectBar, _collect_100per, currentTime_Collect
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  collectBar._progressTime = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  collectBar._endEventFunction = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  collectBar._checkActionFunction = nil
  ;
  (collectBar._progressControl):SetShow(false)
  if Panel_Collect_Bar:IsShow() == true then
    _collect_100per:SetVertexAniRun("Ani_Color_100per_0", true)
    Panel_Collect_Bar:SetShow(false, true)
    currentTime_Collect = nil
  end
end

productBar.Init = function(self)
  -- function num : 0_15 , upvalues : productBar
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  productBar._titleText = (UI.getChildControl)(Panel_Product_Bar, "StaticText_ProductNow")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  productBar._progressText = (UI.getChildControl)(Panel_Product_Bar, "StaticText_Bar")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  productBar._progressControl = (UI.getChildControl)(Panel_Product_Bar, "Progress2_1")
end

productBar.Show = function(self, isShow, progressTime, endFunction)
  -- function num : 0_16 , upvalues : productBar
  if isShow == true then
    Panel_Product_Bar:SetShow(true, true)
    ;
    (productBar._progressControl):SetShow(true)
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

    productBar._progressTime = progressTime
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    productBar._currentTime = 0
    local strTemp = (string.format)("%.1f", progressTime)
    ;
    (productBar._progressText):SetText(strTemp)
    ;
    (productBar._progressControl):SetProgressRate(0)
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

    productBar._endEventFunction = endFunction
  else
    do
      productBar:Stop()
    end
  end
end

productBar.Update = function(self, fDeltaTime)
  -- function num : 0_17 , upvalues : productBar, _product_100per
  if productBar._progressTime == 0 then
    return 
  end
  local nextTime = productBar._currentTime + fDeltaTime
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R3 in 'UnsetPending'

  productBar._currentTime = nextTime
  local percent = nextTime / productBar._progressTime * 100
  if percent > 100 then
    if productBar._endEventFunction ~= nil then
      (productBar._endEventFunction)()
    end
    _product_100per:SetVertexAniRun("Ani_Color_100per_0", true)
    Panel_Product_Bar:SetShow(false, true)
    productBar:Stop()
  else
    local remainTime = productBar._progressTime - productBar._currentTime
    local strTemp = (string.format)("%.1f", remainTime)
    ;
    (productBar._progressText):SetText(strTemp)
    ;
    (productBar._progressControl):SetProgressRate(percent)
  end
end

productBar.Stop = function(self)
  -- function num : 0_18 , upvalues : productBar, _product_100per
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  productBar._progressTime = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  productBar._endEventFunction = nil
  ;
  (productBar._progressControl):SetShow(false)
  if Panel_Product_Bar:IsShow() == true then
    _product_100per:SetVertexAniRun("Ani_Color_100per_0", true)
    Panel_Product_Bar:SetShow(false, true)
  end
end

enchantBar.Init = function(self)
  -- function num : 0_19 , upvalues : enchantBar
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  enchantBar._titleText = (UI.getChildControl)(Panel_Enchant_Bar, "StaticText_ProductNow")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  enchantBar._progressText = (UI.getChildControl)(Panel_Enchant_Bar, "StaticText_Bar")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  enchantBar._progressControl = (UI.getChildControl)(Panel_Enchant_Bar, "Progress2_1")
  progress_Enchant = (UI.getChildControl)(Panel_Enchant_Bar, "Progress2_1")
  progress_Enchant_Head = (UI.getChildControl)(progress_Enchant, "Progress2_1_Bar_Head")
end

enchantBar.Show = function(self, isShow, progressTime, endFunction, enchantType)
  -- function num : 0_20 , upvalues : enchantBar
  progress_Enchant:EraseAllEffect()
  progress_Enchant_Head:EraseAllEffect()
  if isShow == true then
    if enchantType == 0 then
      progress_Enchant:SetVertexAniRun("Ani_Color_Weapon", true)
    else
      if enchantType == 1 then
        progress_Enchant:SetVertexAniRun("Ani_Color_Armor", true)
      end
    end
    Panel_Enchant_Bar:SetShow(true, true)
    ;
    (enchantBar._progressControl):SetShow(true)
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R5 in 'UnsetPending'

    enchantBar._progressTime = progressTime
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R5 in 'UnsetPending'

    enchantBar._currentTime = 0
    local strTemp = (string.format)("%.1f", progressTime)
    ;
    (enchantBar._progressText):SetText(strTemp)
    ;
    (enchantBar._progressControl):SetProgressRate(0)
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R6 in 'UnsetPending'

    enchantBar._endEventFunction = endFunction
    progress_Enchant:SetNotAbleMasking(true)
    progress_Enchant_Head:SetNotAbleMasking(true)
    progress_Enchant:AddEffect("UI_ButtonLineRight_Blue", true, 0, 0)
  else
    do
      progress_Enchant:EraseAllEffect()
      progress_Enchant_Head:EraseAllEffect()
      enchantBar:Stop()
    end
  end
end

enchantBar.Update = function(self, fDeltaTime)
  -- function num : 0_21 , upvalues : enchantBar, _enchant_100per
  if enchantBar._progressTime == 0 then
    return 
  end
  if isEnchantingAction() == false then
    enchantBar:Stop()
    Enchant_CloseButton()
  end
  local nextTime = enchantBar._currentTime + fDeltaTime
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  enchantBar._currentTime = nextTime
  progress_Enchant_Head:AddEffect("fUI_Repair01B", true, 0, 0)
  local percent = nextTime / enchantBar._progressTime * 100
  if percent > 100 then
    if enchantBar._endEventFunction ~= nil then
      (enchantBar._endEventFunction)()
    end
    _enchant_100per:SetVertexAniRun("Ani_Color_100per_0", true)
    enchantBar:Stop()
  else
    local remainTime = enchantBar._progressTime - enchantBar._currentTime
    local strTemp = (string.format)("%.1f", remainTime)
    ;
    (enchantBar._progressText):SetText(strTemp)
    ;
    (enchantBar._progressControl):SetProgressRate(percent)
  end
end

enchantBar.Stop = function(self)
  -- function num : 0_22 , upvalues : enchantBar, _enchant_100per
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  enchantBar._progressTime = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  enchantBar._endEventFunction = nil
  ;
  (enchantBar._progressControl):SetShow(false)
  if Panel_Enchant_Bar:IsShow() == true then
    _enchant_100per:SetVertexAniRun("Ani_Color_100per_0", true)
    Panel_Enchant_Bar:SetShow(false, true)
  end
end

castingBar.Init = function(self)
  -- function num : 0_23 , upvalues : castingBar
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  castingBar._progressControl = (UI.getChildControl)(Panel_Casting_Bar, "Progress2_SP")
end

castingBar.Show = function(self, isShow, progressTime, endFunction)
  -- function num : 0_24 , upvalues : castingBar
  if isShow then
    Panel_Casting_Bar:SetShow(true, true)
    ;
    (castingBar._progressControl):SetShow(true)
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

    castingBar._progressTime = progressTime
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    castingBar._currentTime = 0
    ;
    (castingBar._progressControl):SetProgressRate(0)
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R4 in 'UnsetPending'

    castingBar._endEventFunction = endFunction
  else
    castingBar:Stop()
  end
end

castingBar.Update = function(self, fDeltaTime)
  -- function num : 0_25 , upvalues : castingBar, _casting_100per
  if castingBar._progressTime == 0 then
    return 
  end
  local nextTime = castingBar._currentTime + fDeltaTime
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R3 in 'UnsetPending'

  castingBar._currentTime = nextTime
  local percent = nextTime / castingBar._progressTime * 100
  if percent > 100 then
    if castingBar._endEventFunction ~= nil then
      (castingBar._endEventFunction)()
    end
    _casting_100per:SetVertexAniRun("Ani_Color_Start_1", true)
    Panel_Casting_Bar:SetShow(false, true)
    castingBar:Stop()
  else
    ;
    (castingBar._progressControl):SetProgressRate(percent)
  end
end

castingBar.Stop = function(self)
  -- function num : 0_26 , upvalues : castingBar, _enchant_100per
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  castingBar._progressTime = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  castingBar._endEventFunction = nil
  ;
  (castingBar._progressControl):SetShow(false)
  if Panel_Casting_Bar:IsShow() == true then
    _enchant_100per:SetVertexAniRun("Ani_Color_Start_1", true)
    Panel_Casting_Bar:SetShow(false, true)
  end
end

ProgressBar_Collect_Show = function(isShow, progressTime, endfuction)
  -- function num : 0_27 , upvalues : collectBar
  collectBar:Show(isShow, progressTime, endfuction, nil)
end

ProgressBar_Product_Show = function(isShow, progressTime, endfuction)
  -- function num : 0_28 , upvalues : productBar
  productBar:Show(isShow, progressTime, endfuction)
end

ProgressBar_Enchant_Show = function(isShow, progressTime, endfuction, enchantType)
  -- function num : 0_29 , upvalues : enchantBar
  enchantBar:Show(isShow, progressTime, endfuction, enchantType)
end

OnlyPerFrame_ProgressBar_Collect_Update = function(fDeltaTime)
  -- function num : 0_30 , upvalues : currentTime_Collect, collectBar
  if currentTime_Collect == nil or FGlobal_getFrameCount() <= currentTime_Collect then
    return 
  end
  collectBar:Update(fDeltaTime)
end

ProgressBar_Product_Update = function(fDeltaTime)
  -- function num : 0_31 , upvalues : productBar
  productBar:Update(fDeltaTime)
end

ProgressBar_Enchant_Update = function(fDeltaTime)
  -- function num : 0_32 , upvalues : enchantBar
  enchantBar:Update(fDeltaTime)
end

ProgressBar_Casting_Update = function(fDeltaTime)
  -- function num : 0_33 , upvalues : castingBar
  castingBar:Update(fDeltaTime)
end

checkCollectAction = function()
  -- function num : 0_34
  return isCollectingAction()
end

checkBuildTentAction = function()
  -- function num : 0_35
  return isDoingAction("BUILD_TENT")
end

checkTakeDownTentAction = function()
  -- function num : 0_36
  return isDoingAction("TAKEDOWN_TENT")
end

checkTakeDownCannonAction = function()
  -- function num : 0_37
  return isDoingAction("TAKEDOWN_CANNON")
end

checkRepairKingOrLordTentAction = function()
  -- function num : 0_38
  return isDoingAction("COMMAND_REPAIR")
end

checkBuidingUpgradeAction = function()
  -- function num : 0_39
  return isDoingAction("BUILDING_UPGRADE")
end

checkRepairAction = function()
  -- function num : 0_40
  return repair_IsRepairingAction()
end

checkCampfireAction = function()
  -- function num : 0_41
  return isDoingAction("CAMPFIRE")
end

checkCookAction = function()
  -- function num : 0_42
  return isDoingAction("ALCHEMYSYSTEM_COOK")
end

checkReadBookAction = function()
  -- function num : 0_43
  return isDoingAction("READ_BOOK")
end

checkManufactureAction = function()
  -- function num : 0_44
  return isManufactureAction()
end

checkAlchemyAction = function()
  -- function num : 0_45
  if not isDoingAction("ALCHEMYSYSTEM_COOK") then
    local isDoing = isDoingAction("ALCHEMYSYSTEM_ALCHEMY")
  end
  return isDoing
end

EventProgressBarShow = function(isShow, progressTime, barType, param)
  -- function num : 0_46 , upvalues : castingBar, collectBar
  local endFunction, checkActionFunction = nil
  if isShow then
    if barType == 0 then
      castingBar:Show(isShow, progressTime, nil)
    else
      if barType == 1 then
        ProgressBar_Product_Show(isShow, progressTime, nil)
      else
        if barType == 2 then
          Global_SetShowDrawWaterRepeat(false)
          if param == 0 then
            (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_COLLECTING") .. "..")
          else
            if param == 1 then
              (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_HARVEST"))
            else
              if param == 2 then
                (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_SEEDS"))
              else
                if param == 3 then
                  (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_PRUNING"))
                else
                  if param == 4 then
                    (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_WORM"))
                  else
                    if param == 5 then
                      (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_COLLECTING"))
                      Global_SetShowDrawWaterRepeat(true)
                      Global_UpdateDrawWaterRepeat()
                    else
                      ;
                      (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_COLLECTING") .. "..")
                    end
                  end
                end
              end
            end
          end
          -- DECOMPILER ERROR at PC115: Confused about usage of register: R6 in 'UnsetPending'

          collectBar._useType = 0
          endFunction = nil
          checkActionFunction = checkCollectAction
          collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
        else
          if barType == 3 then
            (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_INSTALL_TENT") .. "..")
            -- DECOMPILER ERROR at PC140: Confused about usage of register: R6 in 'UnsetPending'

            collectBar._useType = 0
            endFunction = nil
            checkActionFunction = checkBuildTentAction
            collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
          else
            if barType == 4 then
              (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_REMOVE_TENT") .. "..")
              -- DECOMPILER ERROR at PC165: Confused about usage of register: R6 in 'UnsetPending'

              collectBar._useType = 0
              endFunction = nil
              checkActionFunction = checkTakeDownTentAction
              collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
            else
              if barType == 5 then
                (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_INSTALL_TENT") .. "..")
                -- DECOMPILER ERROR at PC190: Confused about usage of register: R6 in 'UnsetPending'

                collectBar._useType = 0
                endFunction = nil
                checkActionFunction = checkCampfireAction
                collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
              else
                -- DECOMPILER ERROR at PC204: Confused about usage of register: R6 in 'UnsetPending'

                if barType == 6 then
                  collectBar._useType = 1
                  endFunction = nil
                  checkActionFunction = checkRepairAction
                  collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
                else
                  if barType == 7 then
                    (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_COOK") .. "..")
                    -- DECOMPILER ERROR at PC229: Confused about usage of register: R6 in 'UnsetPending'

                    collectBar._useType = 0
                    endFunction = Alchemy_Do
                    checkActionFunction = checkCookAction
                    collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
                  else
                    if barType == 8 then
                      (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_READING") .. "..")
                      -- DECOMPILER ERROR at PC254: Confused about usage of register: R6 in 'UnsetPending'

                      collectBar._useType = 0
                      endFunction = nil
                      checkActionFunction = checkReadBookAction
                      collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
                    else
                      if barType == 9 then
                        (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_COLLECTBAR_TITLE"))
                        -- DECOMPILER ERROR at PC277: Confused about usage of register: R6 in 'UnsetPending'

                        collectBar._useType = 0
                        endFunction = Alchemy_Do
                        checkActionFunction = checkAlchemyAction
                        collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
                      else
                        if barType == 10 then
                          (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PROGRESSBAR_REMOVE_CANNON") .. "..")
                          -- DECOMPILER ERROR at PC302: Confused about usage of register: R6 in 'UnsetPending'

                          collectBar._useType = 0
                          endFunction = nil
                          checkActionFunction = checkTakeDownCannonAction
                          collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
                        else
                          if barType == 11 then
                            (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_REPAIR"))
                            -- DECOMPILER ERROR at PC325: Confused about usage of register: R6 in 'UnsetPending'

                            collectBar._useType = 0
                            endFunction = nil
                            checkActionFunction = checkRepairKingOrLordTentAction
                            collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
                          else
                            if barType == 12 then
                              (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_UPGRADING"))
                              -- DECOMPILER ERROR at PC348: Confused about usage of register: R6 in 'UnsetPending'

                              collectBar._useType = 0
                              endFunction = nil
                              checkActionFunction = checkBuidingUpgradeAction
                              collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
                            else
                              if barType == 13 then
                                (collectBar._titleText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PROGRESSBAR_REPAIRSHIP"))
                                -- DECOMPILER ERROR at PC371: Confused about usage of register: R6 in 'UnsetPending'

                                collectBar._useType = 0
                                endFunction = nil
                                checkActionFunction = checkRepairKingOrLordTentAction
                                collectBar:Show(isShow, progressTime, endFunction, checkActionFunction)
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
  else
    if barType == 0 then
      castingBar:Show(false, 0, nil)
    else
      if barType == 1 then
        ProgressBar_Product_Show(false, 0, nil)
      else
        collectBar:Show(false, 0, nil, nil)
      end
    end
  end
end

registerEvent("EventProgressBarShow", "EventProgressBarShow")
Panel_Product_Bar:RegisterUpdateFunc("ProgressBar_Product_Update")
Panel_Enchant_Bar:RegisterUpdateFunc("ProgressBar_Enchant_Update")
Panel_Casting_Bar:RegisterUpdateFunc("ProgressBar_Casting_Update")
collectBar:Init()
productBar:Init()
enchantBar:Init()
castingBar:Init()

