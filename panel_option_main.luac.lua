-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\option\panel_option_main.luac 

-- params : ...
-- function num : 0
Panel_Window_cOption:SetShow(false)
FGlobal_Option_GetShow = function()
  -- function num : 0_0
  return Panel_Window_cOption:GetShow()
end

-- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.isOpen = function(self)
  -- function num : 0_1
  return Panel_Window_cOption:GetShow()
end

-- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.InitUi = function(self)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._staticMainTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainTopBg")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticMainBottomBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainBottomBg")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticMainBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainBg")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticSubTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_SubTopBg")
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticSubBottomBg = (UI.getChildControl)(Panel_Window_cOption, "Static_SubBottomBg")
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticSpecBG = (UI.getChildControl)((self._ui)._staticMainBg, "Static_SpecBg")
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticCategoryBG = (UI.getChildControl)((self._ui)._staticMainBg, "Static_CategoryBg")
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._list2 = (UI.getChildControl)(Panel_Window_cOption, "List2_LeftMenu")
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonTopHome = (UI.getChildControl)((self._ui)._staticSubTopBg, "Button_Home")
  -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticCategoryTitle = (UI.getChildControl)((self._ui)._staticSubTopBg, "StaticText_SubTitle")
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticCategoryDesc = (UI.getChildControl)((self._ui)._staticSubTopBg, "StaticText_SubDesc")
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonQuestion = (UI.getChildControl)(Panel_Window_cOption, "Button_Question")
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._buttonResetFrame = (UI.getChildControl)((self._ui)._staticSubTopBg, "Button_ResetFrame")
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._specDescTable = {}
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._curUIMode = (self.UIMODE).Main
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._gameGrade = (UI.getChildControl)((self._ui)._staticMainBottomBg, "Static_GameGradeIcon")
  ;
  ((self._ui)._gameGrade):SetShow(isGameTypeKorea() == true)
  ;
  ((self._ui)._staticCategoryDesc):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  ;
  ((UI.getChildControl)(Panel_Window_cOption, "Button_Win_Close")):addInputEvent("Mouse_LUp", "PaGlobal_Option:Close()")
  ;
  ((self._ui)._buttonTopHome):addInputEvent("Mouse_LUp", "PaGlobal_Option:MoveUi(1)")
  ;
  ((self._ui)._buttonTopHome):addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "Home" .. "\"" .. ")")
  ;
  ((self._ui)._buttonTopHome):addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "Home" .. "\"" .. ")")
  local topSaveSetting = (UI.getChildControl)((self._ui)._staticMainTopBg, "Button_SaveSetting")
  topSaveSetting:addInputEvent("Mouse_LUp", "PaGlobal_Panel_SaveSetting_Show(false)")
  topSaveSetting:addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "TopSaveSetting" .. "\"" .. ")")
  topSaveSetting:addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "TopSaveSetting" .. "\"" .. ")")
  local bottomSaveSetting = (UI.getChildControl)((self._ui)._staticSubTopBg, "Button_SaveSetting")
  bottomSaveSetting:addInputEvent("Mouse_LUp", "PaGlobal_Panel_SaveSetting_Show(false)")
  bottomSaveSetting:addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "BottomSaveSetting" .. "\"" .. ")")
  bottomSaveSetting:addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "BottomSaveSetting" .. "\"" .. ")")
  local topResetAll = (UI.getChildControl)((self._ui)._staticMainTopBg, "Button_ResetAll")
  topResetAll:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedResetAllOption()")
  topResetAll:addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "TopResetAll" .. "\"" .. ")")
  topResetAll:addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "TopResetAll" .. "\"" .. ")")
  local bottomResetAll = (UI.getChildControl)((self._ui)._staticSubTopBg, "Button_ResetAll")
  bottomResetAll:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedResetAllOption()")
  bottomResetAll:addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "BottomResetAll" .. "\"" .. ")")
  bottomResetAll:addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "BottomResetAll" .. "\"" .. ")")
  local topCacheDelete = (UI.getChildControl)((self._ui)._staticMainTopBg, "Button_CacheReset")
  topCacheDelete:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedCacheDeleteOption()")
  topCacheDelete:addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "CacheDelete" .. "\"" .. ")")
  topCacheDelete:addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "CacheDelete" .. "\"" .. ")")
  -- DECOMPILER ERROR at PC313: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui)._applyButton = (UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_Apply")
  ;
  ((self._ui)._applyButton):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedApplyOption()")
  ;
  ((self._ui)._applyButton):addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "Apply" .. "\"" .. ")")
  ;
  ((self._ui)._applyButton):addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "Apply" .. "\"" .. ")")
  local buttonCanel = (UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_Cancel")
  buttonCanel:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedCancelOption()")
  buttonCanel:addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "Cancel" .. "\"" .. ")")
  buttonCanel:addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "Cancel" .. "\"" .. ")")
  local buttonAdmin = (UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_Admin")
  buttonAdmin:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedConfirmOption()")
  buttonAdmin:addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "Confirm" .. "\"" .. ")")
  buttonAdmin:addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "Confirm" .. "\"" .. ")")
  ;
  ((UI.getChildControl)((self._ui)._staticMainBottomBg, "Button_License")):addInputEvent("Mouse_LUp", "PaGlobal_Copyright_ShowWindow()")
  if isGameServiceTypeDev() then
    ((UI.getChildControl)((self._ui)._staticMainBottomBg, "Button_License")):SetShow(true)
  else
    ((UI.getChildControl)((self._ui)._staticMainBottomBg, "Button_License")):SetShow(false)
  end
  ;
  ((self._ui)._buttonResetFrame):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedResetFrame()")
  ;
  ((self._ui)._buttonResetFrame):addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "ResetFrame" .. "\"" .. ")")
  ;
  ((self._ui)._buttonResetFrame):addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "ResetFrame" .. "\"" .. ")")
  local specCount = 8
  local categoryCount = 5
  for specindex = 1, specCount do
    local spec = (UI.getChildControl)((self._ui)._staticSpecBG, "Button_Spec" .. specindex)
    spec:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(" .. specindex .. ")")
    local specName = (UI.getChildControl)(spec, "StaticText_Name")
    specName:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    specName:SetText(specName:GetText())
    -- DECOMPILER ERROR at PC501: Confused about usage of register: R16 in 'UnsetPending'

    ;
    ((self._ui)._specDescTable)[specindex] = (UI.getChildControl)(spec, "StaticText_Desc")
    ;
    (((self._ui)._specDescTable)[specindex]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (((self._ui)._specDescTable)[specindex]):SetText((((self._ui)._specDescTable)[specindex]):GetText())
    ;
    (((self._ui)._specDescTable)[specindex]):SetPosY((((self._ui)._specDescTable)[specindex]):GetPosY() + specName:GetTextSizeY() - specName:GetSizeY())
    spec:addInputEvent("Mouse_On", "PaGlobal_Option:MouseOnSpec(" .. specindex .. ")")
    spec:addInputEvent("Mouse_Out", "PaGlobal_Option:MouseOutSpec(" .. specindex .. ")")
  end
  do
    local category = (UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Optimize")
    category:addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Performance" .. "\"" .. ")")
    category:addInputEvent("Mouse_On", "PaGlobal_Option:MouseOnCategory(" .. "\"" .. "Performance" .. "\"" .. ")")
    category:addInputEvent("Mouse_Out", "PaGlobal_Option:MouseOutCategory(" .. "\"" .. "Performance" .. "\"" .. ")")
    -- DECOMPILER ERROR at PC591: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryTitleTable).Performance = (UI.getChildControl)(category, "StaticText_Name")
    -- DECOMPILER ERROR at PC599: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryDescTable).Performance = (UI.getChildControl)(category, "StaticText_Desc")
    ;
    (((self._ui)._categoryTitleTable).Performance):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (((self._ui)._categoryTitleTable).Performance):SetText((((self._ui)._categoryTitleTable).Performance):GetText())
    ;
    (((self._ui)._categoryDescTable).Performance):SetPosY((((self._ui)._categoryDescTable).Performance):GetPosY() + (((self._ui)._categoryTitleTable).Performance):GetTextSizeY() - (((self._ui)._categoryTitleTable).Performance):GetSizeY())
    category = (UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Graphic")
    category:addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Graphic" .. "\"" .. ")")
    category:addInputEvent("Mouse_On", "PaGlobal_Option:MouseOnCategory(" .. "\"" .. "Graphic" .. "\"" .. ")")
    category:addInputEvent("Mouse_Out", "PaGlobal_Option:MouseOutCategory(" .. "\"" .. "Graphic" .. "\"" .. ")")
    -- DECOMPILER ERROR at PC681: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryTitleTable).Graphic = (UI.getChildControl)(category, "StaticText_Name")
    -- DECOMPILER ERROR at PC689: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryDescTable).Graphic = (UI.getChildControl)(category, "StaticText_Desc")
    ;
    (((self._ui)._categoryTitleTable).Graphic):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (((self._ui)._categoryTitleTable).Graphic):SetText((((self._ui)._categoryTitleTable).Graphic):GetText())
    ;
    (((self._ui)._categoryDescTable).Graphic):SetPosY((((self._ui)._categoryDescTable).Graphic):GetPosY() + (((self._ui)._categoryTitleTable).Graphic):GetTextSizeY() - (((self._ui)._categoryTitleTable).Graphic):GetSizeY())
    category = (UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Sound")
    category:addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Sound" .. "\"" .. ")")
    category:addInputEvent("Mouse_On", "PaGlobal_Option:MouseOnCategory(" .. "\"" .. "Sound" .. "\"" .. ")")
    category:addInputEvent("Mouse_Out", "PaGlobal_Option:MouseOutCategory(" .. "\"" .. "Sound" .. "\"" .. ")")
    -- DECOMPILER ERROR at PC771: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryTitleTable).Sound = (UI.getChildControl)(category, "StaticText_Name")
    -- DECOMPILER ERROR at PC779: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryDescTable).Sound = (UI.getChildControl)(category, "StaticText_Desc")
    ;
    (((self._ui)._categoryTitleTable).Sound):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (((self._ui)._categoryTitleTable).Sound):SetText((((self._ui)._categoryTitleTable).Sound):GetText())
    ;
    (((self._ui)._categoryDescTable).Sound):SetPosY((((self._ui)._categoryDescTable).Sound):GetPosY() + (((self._ui)._categoryTitleTable).Sound):GetTextSizeY() - (((self._ui)._categoryTitleTable).Sound):GetSizeY())
    category = (UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Function")
    category:addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Function" .. "\"" .. ")")
    category:addInputEvent("Mouse_On", "PaGlobal_Option:MouseOnCategory(" .. "\"" .. "Function" .. "\"" .. ")")
    category:addInputEvent("Mouse_Out", "PaGlobal_Option:MouseOutCategory(" .. "\"" .. "Function" .. "\"" .. ")")
    -- DECOMPILER ERROR at PC861: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryTitleTable).Function = (UI.getChildControl)(category, "StaticText_Name")
    -- DECOMPILER ERROR at PC869: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryDescTable).Function = (UI.getChildControl)(category, "StaticText_Desc")
    ;
    (((self._ui)._categoryTitleTable).Function):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (((self._ui)._categoryTitleTable).Function):SetText((((self._ui)._categoryTitleTable).Function):GetText())
    ;
    (((self._ui)._categoryDescTable).Function):SetPosY((((self._ui)._categoryDescTable).Function):GetPosY() + (((self._ui)._categoryTitleTable).Function):GetTextSizeY() - (((self._ui)._categoryTitleTable).Function):GetSizeY())
    category = (UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Interface")
    category:addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Interface" .. "\"" .. ")")
    category:addInputEvent("Mouse_On", "PaGlobal_Option:MouseOnCategory(" .. "\"" .. "Interface" .. "\"" .. ")")
    category:addInputEvent("Mouse_Out", "PaGlobal_Option:MouseOutCategory(" .. "\"" .. "Interface" .. "\"" .. ")")
    -- DECOMPILER ERROR at PC951: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryTitleTable).Interface = (UI.getChildControl)(category, "StaticText_Name")
    -- DECOMPILER ERROR at PC959: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self._ui)._categoryDescTable).Interface = (UI.getChildControl)(category, "StaticText_Desc")
    ;
    (((self._ui)._categoryTitleTable).Interface):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (((self._ui)._categoryTitleTable).Interface):SetText((((self._ui)._categoryTitleTable).Interface):GetText())
    ;
    (((self._ui)._categoryDescTable).Interface):SetPosY((((self._ui)._categoryDescTable).Interface):GetPosY() + (((self._ui)._categoryTitleTable).Interface):GetTextSizeY() - (((self._ui)._categoryTitleTable).Interface):GetSizeY())
    category = nil
    for index,control in pairs((self._ui)._categoryDescTable) do
      control:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      control:SetText(control:GetText())
    end
    -- DECOMPILER ERROR at PC1024: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._ui)._editSearch = (UI.getChildControl)((self._ui)._staticMainTopBg, "Edit_SearchOption")
    -- DECOMPILER ERROR at PC1032: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._ui)._editSearchSub = (UI.getChildControl)((self._ui)._staticSubTopBg, "Edit_SearchOption")
    -- DECOMPILER ERROR at PC1040: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._ui)._editSearchMain = (UI.getChildControl)((self._ui)._staticMainTopBg, "Edit_SearchOption")
    ;
    ((self._ui)._editSearchSub):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSeachEditControl()")
    ;
    ((self._ui)._editSearchMain):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSeachEditControl()")
    -- DECOMPILER ERROR at PC1059: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._ui)._staticSearchNoResult = (UI.getChildControl)(Panel_Window_cOption, "StaticText_SearchNoResult")
    ;
    ((self._ui)._staticSearchNoResult):SetShow(false)
    ;
    ((UI.getChildControl)((self._ui)._staticMainTopBg, "Button_SearchIcon")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSeachOption()")
    ;
    ((UI.getChildControl)((self._ui)._staticSubTopBg, "Button_SearchIcon")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSeachOption()")
    ;
    ((self._ui)._listSearchBg):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_Option_List2SearchElementCreate")
    ;
    ((self._ui)._listSearchBg):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
    -- DECOMPILER ERROR at PC1102: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._ui)._customDescTable = {}
    -- DECOMPILER ERROR at PC1105: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._ui)._customLoadConfirmIcon = {}
    for customIndex = 0, 1 do
      -- DECOMPILER ERROR at PC1124: Confused about usage of register: R15 in 'UnsetPending'

      (self._ui)["_buttonSaveCustom" .. customIndex] = (UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_CustomSave_" .. tostring(customIndex + 1))
      ;
      ((self._ui)["_buttonSaveCustom" .. customIndex]):addInputEvent("Mouse_LUp", "PaGlobal_Option:SaveCutsomOption(" .. customIndex .. ")")
      ;
      ((self._ui)["_buttonSaveCustom" .. customIndex]):addInputEvent("Mouse_On", "PaGlobal_Option:Simpletooltips( true , " .. "\"" .. "CustomSave" .. customIndex .. "\"" .. ")")
      ;
      ((self._ui)["_buttonSaveCustom" .. customIndex]):addInputEvent("Mouse_Out", "PaGlobal_Option:Simpletooltips( false , " .. "\"" .. "CustomSave" .. customIndex .. "\"" .. ")")
      -- DECOMPILER ERROR at PC1181: Confused about usage of register: R15 in 'UnsetPending'

      ;
      (self._ui)["_buttonLoadCustom" .. customIndex] = (UI.getChildControl)((self._ui)._staticSpecBG, "Button_Custom" .. tostring(customIndex + 1))
      ;
      ((self._ui)["_buttonLoadCustom" .. customIndex]):addInputEvent("Mouse_LUp", "PaGlobal_Option:LoadCutsomOption(" .. customIndex .. ")")
      ;
      ((self._ui)["_buttonLoadCustom" .. customIndex]):addInputEvent("Mouse_On", "PaGlobal_Option:MouseOnCustom(" .. customIndex .. ")")
      ;
      ((self._ui)["_buttonLoadCustom" .. customIndex]):addInputEvent("Mouse_Out", "PaGlobal_Option:MouseOutCustom(" .. customIndex .. ")")
      -- DECOMPILER ERROR at PC1229: Confused about usage of register: R15 in 'UnsetPending'

      ;
      ((self._ui)._customDescTable)[customIndex] = (UI.getChildControl)((self._ui)["_buttonLoadCustom" .. customIndex], "StaticText_Desc")
      ;
      (((self._ui)._customDescTable)[customIndex]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      ;
      (((self._ui)._customDescTable)[customIndex]):SetText((((self._ui)._customDescTable)[customIndex]):GetText())
      -- DECOMPILER ERROR at PC1259: Confused about usage of register: R15 in 'UnsetPending'

      ;
      ((self._ui)._customLoadConfirmIcon)[customIndex] = (UI.getChildControl)((self._ui)["_buttonLoadCustom" .. customIndex], "Static_AdjustIcon")
      local customName = (UI.getChildControl)((self._ui)["_buttonLoadCustom" .. customIndex], "StaticText_Name")
      customName:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      customName:SetText(customName:GetText())
      ;
      (((self._ui)._customDescTable)[customIndex]):SetPosY((((self._ui)._customDescTable)[customIndex]):GetPosY() + customName:GetTextSizeY() - customName:GetSizeY())
    end
    ;
    ((self._ui)._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"UIGameOption\" )")
    ;
    ((self._ui)._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"UIGameOption\", \"true\")")
    ;
    ((self._ui)._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"UIGameOption\", \"false\")")
    -- DECOMPILER ERROR at PC1322: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).TopResetAll = {control = topResetAll, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_RESETALL")}
    -- DECOMPILER ERROR at PC1332: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).BottomResetAll = {control = bottomResetAll, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_RESETALL")}
    -- DECOMPILER ERROR at PC1342: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).CacheDelete = {control = topCacheDelete, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_CACHEDELETE")}
    -- DECOMPILER ERROR at PC1352: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).TopSaveSetting = {control = topSaveSetting, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_SAVEFILE")}
    -- DECOMPILER ERROR at PC1362: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).BottomSaveSetting = {control = bottomSaveSetting, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_SAVEFILE")}
    -- DECOMPILER ERROR at PC1374: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).Apply = {control = (self._ui)._applyButton, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_ADJUST")}
    -- DECOMPILER ERROR at PC1384: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).Cancel = {control = buttonCanel, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_ADJUSTBACK")}
    -- DECOMPILER ERROR at PC1394: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).Confirm = {control = buttonAdmin, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_ADMIN")}
    -- DECOMPILER ERROR at PC1406: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).Home = {control = (self._ui)._buttonTopHome, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_HOME")}
    -- DECOMPILER ERROR at PC1418: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).CustomSave0 = {control = (self._ui)._buttonSaveCustom0, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_CUSTOMSAVE")}
    -- DECOMPILER ERROR at PC1430: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).CustomSave1 = {control = (self._ui)._buttonSaveCustom1, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_CUSTOMSAVE")}
    -- DECOMPILER ERROR at PC1442: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._tooltip).ResetFrame = {control = (self._ui)._buttonResetFrame, desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_TOOLTIPDESC_RESETBUTTON")}
    self:MoveUi((self.UIMODE).Main)
    self:SetContentsOption()
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.Simpletooltips = function(self, isShow, tooltipName)
  -- function num : 0_3
  if (self._tooltip)[tooltipName] == nil then
    return 
  end
  if isShow == true then
    registTooltipControl(((self._tooltip)[tooltipName]).control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(((self._tooltip)[tooltipName]).control, "", ((self._tooltip)[tooltipName]).desc)
  else
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MoveUi = function(self, value)
  -- function num : 0_4
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  (self._ui)._curUIMode = value
  if (self.UIMODE).Category == value then
    ((self._ui)._staticCategoryBG):SetShow(false)
    ;
    ((self._ui)._staticSpecBG):SetShow(false)
    ;
    ((self._ui)._list2):SetShow(true)
    ;
    ((self._ui)._staticSubBottomBg):SetShow(true)
    ;
    ((self._ui)._staticMainBottomBg):SetShow(false)
    ;
    ((self._ui)._listSearchBg):SetShow(false)
    ;
    ((self._ui)._staticMainTopBg):SetShow(false)
    ;
    ((self._ui)._buttonTopHome):SetShow(true)
    ;
    ((self._ui)._staticMainBg):SetShow(false)
    ;
    ((self._ui)._staticSubTopBg):SetShow(true)
    ;
    ((self._ui)._staticSearchNoResult):SetShow(false)
    ;
    ((self._ui)._buttonResetFrame):SetEnable(true)
    ;
    ((self._ui)._buttonResetFrame):SetMonoTone(false)
    if (self._list2)._curCategory ~= nil and (self._list2)._curDetail ~= nil then
      ((((self._frames)[(self._list2)._curCategory])[(self._list2)._curDetail])._uiFrame):SetShow(true)
    end
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._ui)._editSearch = (self._ui)._editSearchSub
  else
    if (self.UIMODE).Main == value then
      ((self._ui)._staticMainBg):SetShow(true)
      ;
      ((self._ui)._staticCategoryBG):SetShow(true)
      ;
      ((self._ui)._staticSpecBG):SetShow(true)
      ;
      ((self._ui)._list2):SetShow(false)
      ;
      ((self._ui)._staticSubBottomBg):SetShow(false)
      ;
      ((self._ui)._staticMainBottomBg):SetShow(true)
      ;
      ((self._ui)._listSearchBg):SetShow(false)
      ;
      ((self._ui)._buttonTopHome):SetShow(false)
      ;
      ((self._ui)._staticMainTopBg):SetShow(true)
      ;
      ((self._ui)._staticMainBg):SetShow(true)
      ;
      ((self._ui)._staticSubTopBg):SetShow(false)
      ;
      ((self._ui)._staticSearchNoResult):SetShow(false)
      ;
      ((self._ui)._buttonResetFrame):SetEnable(false)
      ;
      ((self._ui)._buttonResetFrame):SetMonoTone(true)
      for index,value in pairs((self._ui)._categoryTitleTable) do
        local categoryIcon = value:getParent()
        categoryIcon:setRenderTexture(categoryIcon:getBaseTexture())
      end
      if (self._list2)._curCategory ~= nil and (self._list2)._curDetail ~= nil then
        ((((self._frames)[(self._list2)._curCategory])[(self._list2)._curDetail])._uiFrame):SetShow(false)
      end
      -- DECOMPILER ERROR at PC204: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (self._ui)._editSearch = (self._ui)._editSearchMain
    else
      if (self.UIMODE).Search == value then
        ((self._ui)._staticCategoryBG):SetShow(false)
        ;
        ((self._ui)._staticSpecBG):SetShow(false)
        ;
        ((self._ui)._list2):SetShow(true)
        ;
        ((self._ui)._staticSubBottomBg):SetShow(true)
        ;
        ((self._ui)._staticMainBottomBg):SetShow(false)
        ;
        ((self._ui)._listSearchBg):SetShow(true)
        ;
        ((self._ui)._buttonTopHome):SetShow(true)
        ;
        ((self._ui)._staticMainTopBg):SetShow(false)
        ;
        ((self._ui)._staticMainBg):SetShow(false)
        ;
        ((self._ui)._staticSubTopBg):SetShow(true)
        ;
        ((self._ui)._staticSearchNoResult):SetShow(((self._ui)._staticSearchNoResult):GetShow())
        ;
        ((self._ui)._buttonResetFrame):SetEnable(false)
        ;
        ((self._ui)._buttonResetFrame):SetMonoTone(true)
        if (self._list2)._curCategory ~= nil and (self._list2)._curDetail ~= nil then
          ((((self._frames)[(self._list2)._curCategory])[(self._list2)._curDetail])._uiFrame):SetShow(false)
        end
        -- DECOMPILER ERROR at PC300: Confused about usage of register: R2 in 'UnsetPending'

        ;
        (self._ui)._editSearch = (self._ui)._editSearchSub
      end
    end
  end
  ;
  ((self._ui)._editSearch):SetEditText("")
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ApplyButtonEnable = function(self, enable)
  -- function num : 0_5
  ((self._ui)._applyButton):SetEnable(enable)
  ;
  ((self._ui)._applyButton):SetMonoTone(not enable)
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.Open = function(self)
  -- function num : 0_6
  ClearFocusEdit()
  if isNeedGameOptionFromServer() == true then
    keyCustom_StartEdit()
  end
  local tree2 = (self._ui)._list2
  for key,value in pairs((self._list2)._tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  tree2:moveTopIndex()
  self:CheckEnableSimpleUI()
  if isNeedGameOptionFromServer() == true then
    self:MoveUi((self.UIMODE).Main)
  else
    self:MoveUi((self.UIMODE).Category)
    ;
    ((self._ui)._staticSubTopBg):SetMonoTone(true)
    ;
    ((self._ui)._staticSubTopBg):SetEnable(false)
    self:SelectOptionFrame("Function", "Nation")
  end
  Panel_Window_cOption:SetShow(true, true)
  Panel_Window_cOption:SetIgnore(false)
  self:ApplyButtonEnable(false)
  audioPostEvent_SystemUi(1, 0)
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.Close = function(self)
  -- function num : 0_7
  self:MoveUi((self.UIMODE).Main)
  for elemeneName,option in pairs(self._elements) do
    if option._settingRightNow == true and option._applyValue == nil and option._curValue ~= nil then
      self:SetXXX(elemeneName, option._initValue)
    end
    option._curValue = nil
  end
  keyCustom_RollBack()
  setKeyCustomizing(false)
  SetUIMode((Defines.UIMode).eUIMode_Default)
  Panel_Window_cOption:SetShow(false, true)
  if Panel_Tooltip_SimpleText:GetShow() then
    TooltipSimple_Hide()
  end
  audioPostEvent_SystemUi(1, 0)
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedCancelOption = function(self)
  -- function num : 0_8
  for elementName,option in pairs(self._elements) do
    local check = false
    if option._curValue ~= nil then
      if option._settingRightNow == true then
        check = true
      else
        self:ResetControlSetting(elementName)
        self:SetControlSetting(elementName, option._initValue)
      end
    end
    if option._applyValue ~= nil then
      check = true
    end
    if check == true then
      self:ResetControlSetting(elementName)
      self:SetXXX(elementName, option._initValue)
    end
  end
  audioPostEvent_SystemUi(1, 0)
  setAudioOptionByConfig()
  keyCustom_RollBack()
  self:CompleteKeyCustomMode()
  self:ApplyButtonEnable(false)
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedApplyOption = function(self)
  -- function num : 0_9
  local displayChange = false
  for elementName,option in pairs(self._elements) do
    if option.uiInputType ~= nil or option.actionInputType ~= nil then
      option._curValue = nil
    else
      if option._curValue ~= nil then
        self:SetXXX(elementName, option._curValue)
        if option._isChangeDisplay == true then
          displayChange = true
        end
      end
    end
  end
  if displayChange == true then
    self:DisplayChanged()
    self:Close()
    return 
  end
  keyCustom_applyChange()
  keyCustom_StartEdit()
  saveGameOption(false)
  self:ApplyButtonEnable(false)
  ClearFocusEdit()
  for _,icon in pairs((self._ui)._customLoadConfirmIcon) do
    icon:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedConfirmOption = function(self)
  -- function num : 0_10
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
    Panel_UIControl_SetShow(false)
  end
  audioPostEvent_SystemUi(1, 0)
  self:ClickedApplyOption()
  self:Close()
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedResetAllOption = function(self)
  -- function num : 0_11
  ClearFocusEdit()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ALLRESETCONFIRMMESSAGE")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_Option_ResetAllOption, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_Option_ResetAllOption = function()
  -- function num : 0_12
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Option._resetCheck = true
  PaGlobal_Option:ResetAlert()
  PaGlobal_Option:SetXXX("UseNewQuickSlot", ((PaGlobal_Option._elements).UseNewQuickSlot)._defaultValue)
  resetAllOption()
  keyCustom_SetDefaultAction()
  keyCustom_SetDefaultUI()
  if ToClient_isXBox() == true then
    setConsoleKeyType(2)
    setConsoleKeySet(2)
  end
  PaGlobal_Option:ResetKeyCustomString()
  saveGameOption(false)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedCacheDeleteOption = function(self)
  -- function num : 0_13
  ClearFocusEdit()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_CACHEDELETECONFIRMMESSAGE")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_Option_CacheDeleteOption, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_Option_CacheDeleteOption = function()
  -- function num : 0_14
  ToClient_removeCacheFolder()
  if ToClient_removeCacheFolder() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_CACHEDELETE_ACK"))
  end
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedResetFrame = function(self)
  -- function num : 0_15
  if (self._list2)._curCategory == nil or (self._list2)._curDetail == nil then
    _PA_LOG("후진", "[GameOption][ClickedResetFrame] 현재 선택�\156 프레임이 없습니다. 어디�\156 함수�\188 불렀는지 확인해주세요.")
    return 
  end
  ClearFocusEdit()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_CAUTION_RESET")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_Option_ResetFrame, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_Option_ResetFrame = function()
  -- function num : 0_16
  local self = PaGlobal_Option
  local resetElements = (((self._frames)[(self._list2)._curCategory])[(self._list2)._curDetail])._containElement
  local isKeyCustomReset = false
  for index,elementName in ipairs(resetElements) do
    local option = (self._elements)[elementName]
    if option ~= nil then
      if option.actionInputType ~= nil or option.uiInputType ~= nil then
        self:KeyCustomResetFrame(option)
        isKeyCustomReset = true
      else
        if option._defaultValue ~= nil then
          self:ResetControlSetting(elementName)
          self:SetXXX(elementName, option._defaultValue)
          option._initValue = option._defaultValue
          option._applyValue = nil
          option._curValue = nil
        end
      end
    end
  end
  if isKeyCustomReset == true then
    PaGlobal_Option:ResetKeyCustomString()
  end
  self:ApplyButtonEnable(false)
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.KeyCustomResetFrame = function(self, option)
  -- function num : 0_17
  if option == nil then
    return 
  end
  if option.actionInputType ~= nil then
    if option.actionInputType == "PadFunction1" then
      keyCustom_SetDefaultPadFunc1()
    else
      if option.actionInputType == "PadFunction2" then
        keyCustom_SetDefaultPadFunc2()
      else
        keyCustom_SetDefaultActionData(option.actionInputType)
      end
    end
    return 
  else
    if option.uiInputType ~= nil then
      keyCustom_SetDefaultUIData(option.uiInputType)
      return 
    end
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ResetAlert = function(self)
  -- function num : 0_18
  for _,index in pairs(self.ALERT) do
    ToClient_SetMessageFilter(index, false)
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedSpecSetting = function(self, value)
  -- function num : 0_19
  local messageBoxMemo = (((self._ui)._specDescTable)[value]):GetText()
  local messageBoxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_SPECTITLE"), content = messageBoxMemo, functionYes = FGlobal_Option_SetSpec, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
  self._curSpecValue = value
  ClearFocusEdit()
end

FGlobal_Option_SetSpec = function()
  -- function num : 0_20
  PaGlobal_Option:SetSpecSetting(PaGlobal_Option._curSpecValue)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedSeachEditControl = function(self)
  -- function num : 0_21
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if (self._ui)._curUIMode == (self.UIMODE).Main then
    (self._ui)._editSearch = (self._ui)._editSearchMain
    ;
    ((self._ui)._editSearch):SetEditText(((self._ui)._editSearchMain):GetEditText())
  else
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui)._editSearch = (self._ui)._editSearchSub
    ;
    ((self._ui)._editSearch):SetEditText(((self._ui)._editSearchSub):GetEditText())
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedSeachOption = function(self)
  -- function num : 0_22
  local edit = GetFocusEdit()
  local list = (self._ui)._listSearchBg
  local findString = nil
  if edit == nil then
    findString = ((self._ui)._editSearch):GetEditText()
  else
    findString = edit:GetEditText()
    edit:SetText(findString)
  end
  ;
  ((self._ui)._editSearch):SetEditText("")
  ;
  ((self._ui)._editSearch):SetText("")
  ;
  ((self._ui)._staticCategoryTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_SEARCHTEXT"))
  ;
  ((self._ui)._staticCategoryDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_SEARCHTEXT_DESC") .. " [ <PAColor0xffddcd82>" .. findString .. "<PAOldColor> ]")
  self._findStrings = self:SearchOption(findString)
  local sortFindStringFunc = function(lhs, rhs)
    -- function num : 0_22_0
    local lhsMergeString = (lhs._category)._string .. " " .. (lhs._detail)._string .. " " .. lhs._elementString
    do
      local rhsMergeString = (rhs._category)._string .. " " .. (rhs._detail)._string .. " " .. rhs._elementString
      do return stringCompare(lhsMergeString, rhsMergeString) < 0 end
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end

  ;
  (table.sort)(self._findStrings, sortFindStringFunc)
  if self._findStrings == nil then
    (list:getElementManager()):clearKey()
    return 
  end
  do
    local count = #self._findStrings
    if count == 0 then
      (list:getElementManager()):clearKey()
    end
    self:MoveUi((self.UIMODE).Search)
    ;
    ((self._ui)._staticSearchNoResult):SetShow(count == 0)
    ;
    (list:getElementManager()):clearKey()
    for index = 1, count do
      (list:getElementManager()):pushKey(toInt64(0, index))
      list:requestUpdateByKey(toInt64(0, index))
    end
    self:ResetListToggleState()
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FGlobal_Option_List2SearchElementCreate = function(list_content, key)
  -- function num : 0_23
  local id = Int64toInt32(key)
  local content = (UI.getChildControl)(list_content, "StaticText_SearchElement")
  local findString = (PaGlobal_Option._findStrings)[id]
  content:SetShow(true)
  content:SetText((findString._category)._string .. " > " .. (findString._detail)._string .. " > " .. findString._elementString)
  content:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedFindElement(" .. "\"" .. (findString._category)._find .. "\"" .. ", " .. "\"" .. (findString._detail)._find .. "\"" .. " , " .. tostring(findString._isScrollEnd) .. ")")
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedFindElement = function(self, category, detail, isScrollEnd)
  -- function num : 0_24
  self:MoveUi((self.UIMODE).Category)
  if category == nil or detail == nil then
    _PA_LOG("후진", "[GameOption][ClickedFindElement] 옵션 세팅�\180 잘못되었습니�\164. CreateEventControl�\132 보세�\148.  category : " .. category .. " detail : " .. detail)
  end
  self:GoCategory(category, detail)
  if isScrollEnd == true then
    ((((self._frames)[category])[detail])._uiFrame):UpdateContentScroll()
    ;
    ((((self._frames)[category])[detail])._uiScroll):SetControlBottom()
    ;
    ((((self._frames)[category])[detail])._uiFrame):UpdateContentPos()
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.DisplayChanged = function(self)
  -- function num : 0_25
  local messageboxData = {title = "changeDisplay", content = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_COMMENT"), functionApply = FGlobal_Option_ChangeDisplayApply, functionCancel = FGlobal_Option_ChangeDisplayCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, isTimeCount = true, countTime = 10, timeString = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_TIMELEFT"), isStartTimer = true, afterFunction = FGlobal_Option_ChangeDisplayTimeOut}
  allClearMessageData()
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

FGlobal_Option_ChangeDisplayTimeOut = function()
  -- function num : 0_26
  if (MessageBox.isPopUp)() == true then
    messageBox_CancelButtonUp()
  end
end

FGlobal_Option_ChangeDisplayApply = function()
  -- function num : 0_27
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
  end
  keyCustom_applyChange()
  keyCustom_StartEdit()
  PaGlobal_Option:ApplyButtonEnable(false)
  saveGameOption(true)
  reloadGameUI()
end

FGlobal_Option_ChangeDisplayCancel = function()
  -- function num : 0_28
  PaGlobal_Option:SetXXX("ScreenResolution", ((PaGlobal_Option._elements).ScreenResolution)._initValue)
  PaGlobal_Option:SetXXX("UIScale", ((PaGlobal_Option._elements).UIScale)._initValue)
  PaGlobal_Option:SetXXX("ScreenMode", ((PaGlobal_Option._elements).ScreenMode)._initValue)
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ResetCategoryAndSpecTooltip = function(self)
  -- function num : 0_29
  for index,control in ipairs((self._ui)._specDescTable) do
    control:SetShow(false)
  end
  for index,control in pairs((self._ui)._categoryDescTable) do
    control:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MouseOnSpec = function(self, category)
  -- function num : 0_30
  (((self._ui)._specDescTable)[category]):SetShow(true)
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MouseOutSpec = function(self, category)
  -- function num : 0_31
  (((self._ui)._specDescTable)[category]):SetShow(false)
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MouseOnCategory = function(self, category)
  -- function num : 0_32
  (((self._ui)._categoryDescTable)[category]):SetShow(true)
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MouseOutCategory = function(self, category)
  -- function num : 0_33
  (((self._ui)._categoryDescTable)[category]):SetShow(false)
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MouseOnCustom = function(self, index)
  -- function num : 0_34
  (((self._ui)._customDescTable)[index]):SetShow(true)
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MouseOutCustom = function(self, index)
  -- function num : 0_35
  (((self._ui)._customDescTable)[index]):SetShow(false)
end

FGlobal_Option_CheckUiEdit = function(targetUI)
  -- function num : 0_36
  if (PaGlobal_Option._ui)._editSearch == nil then
    return false
  end
  if PaGlobal_Option:isOpen() == false then
    return false
  end
  if targetUI:GetKey() == ((PaGlobal_Option._ui)._editSearch):GetKey() and targetUI:GetID() == ((PaGlobal_Option._ui)._editSearch):GetID() then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.SelectOptionFrame = function(self, category, detail)
  -- function num : 0_37
  local data = ((self._frames)[category])[detail]
  do
    if (self._list2)._curCategory ~= nil and (self._list2)._curDetail ~= nil then
      local beforedata = ((self._frames)[(self._list2)._curCategory])[(self._list2)._curDetail]
      ;
      (beforedata._uiFrame):SetShow(false)
    end
    ;
    (data._uiFrame):SetShow(true)
    ;
    (data._uiFrame):UpdateContentScroll()
    ;
    (data._uiScroll):SetControlTop()
    ;
    (data._uiFrame):UpdateContentPos()
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._list2)._curCategory = category
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._list2)._curDetail = detail
    ;
    ((self._ui)._listSearchBg):SetShow(false)
    ;
    ((self._ui)._staticCategoryDesc):SetText((((self._ui)._categoryDescTable)[category]):GetText())
    ;
    ((self._ui)._staticCategoryTitle):SetText((((self._ui)._categoryTitleTable)[category]):GetText())
    ;
    ((self._ui)._staticSearchNoResult):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ListInit = function(self)
  -- function num : 0_38
  local tree2 = (self._ui)._list2
  tree2:changeAnimationSpeed(11)
  tree2:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_Option_CategoryUpdate")
  tree2:createChildContent((CppEnums.PAUIList2ElementManagerType).tree)
  ;
  (tree2:getElementManager()):clearKey()
  local mainElement = (tree2:getElementManager()):getMainElement()
  local keyIndex = 1
  local _frameOrder = {}
  local _detailOrder = {}
  if isNeedGameOptionFromServer() == true then
    _frameOrder = {"Performance", "Graphic", "Sound", "Function", "Interface"}
    _detailOrder = {
[1] = {"Optimize", "OptimizeBeta", "GraphicQuality", "Camera", "Npc"}
, 
[2] = {"Window", "Quality", "Effect", "Camera", "ScreenShot"}
, 
[3] = {"OnOff", "Volume"}
, 
[4] = {"Convenience", "View", "Alert", "Worldmap", "Nation", "Etc"}
, 
[5] = {"Action", "UI", "QuickSlot", "Function", "Mouse", "Pad"}
}
  else
    _frameOrder = {"Performance", "Graphic", "Sound", "Function"}
    _detailOrder = {
[1] = {"Optimize", "OptimizeBeta", "GraphicQuality", "Camera", "Npc"}
, 
[2] = {"Window", "Quality", "Effect", "Camera", "ScreenShot"}
, 
[3] = {"OnOff", "Volume"}
, 
[4] = {"Nation"}
}
  end
  for index,category in ipairs(_frameOrder) do
    local category = _frameOrder[index]
    -- DECOMPILER ERROR at PC133: Confused about usage of register: R12 in 'UnsetPending'

    ;
    ((self._list2)._tree2IndexMap)[keyIndex] = {_isMain = true, _category = category, _string = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_" .. category)}
    local treeElement = mainElement:createChild(toInt64(0, keyIndex))
    treeElement:setIsOpen(false)
    keyIndex = keyIndex + 1
    local count = 0
    for i,table in pairs((self._frames)[category]) do
      count = count + 1
    end
    if count > 1 then
      for index2,frame in pairs(_detailOrder[index]) do
        local table = ((self._frames)[category])[(_detailOrder[index])[index2]]
        -- DECOMPILER ERROR at PC181: Confused about usage of register: R20 in 'UnsetPending'

        ;
        ((self._list2)._tree2IndexMap)[keyIndex] = {_isMain = false, _category = category, _detail = table._detail, _string = PAGetString(Defines.StringSheet_GAME, "LUA_NEWGAMEOPTION_" .. category .. "_" .. table._detail)}
        local subTreeElement = treeElement:createChild(toInt64(0, keyIndex))
        keyIndex = keyIndex + 1
      end
    end
  end
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.GoCategory = function(self, clickCategory, clickDetail)
  -- function num : 0_39
  for key,table in pairs((self._list2)._tree2IndexMap) do
    if clickCategory == table._category then
      self:ClickedMainCategory(key, table._category)
      break
    end
  end
  do
    for key,table in pairs((self._list2)._tree2IndexMap) do
      -- DECOMPILER ERROR at PC32: Unhandled construct in 'MakeBoolean' P1

      if clickDetail == nil and clickCategory == table._category and table._detail ~= nil then
        self:ClickedSubCategory(key, table._category, table._detail)
        break
      end
      if clickCategory == table._category and clickDetail == table._detail then
        self:ClickedSubCategory(key, table._category, table._detail)
        break
      end
    end
    do
      self:ResetCategoryAndSpecTooltip()
      self:MoveUi((self.UIMODE).Category)
    end
  end
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedMainCategory = function(self, key, category)
  -- function num : 0_40
  local tree2 = (self._ui)._list2
  for k,value in pairs((self._list2)._tree2IndexMap) do
    if value._isMain == true then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, k), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):toggle(toInt64(0, key))
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._list2)._selectedKey = key
  if category == "Alert" then
    PaGlobal_Option:SelectOptionFrame("Alert", "Alarm")
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  local heightIndex = tree2:getIndexByKey(toInt64(0, key))
  tree2:moveIndex(heightIndex)
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ResetListToggleState = function(self)
  -- function num : 0_41
  local tree2 = (self._ui)._list2
  for k,value in pairs((self._list2)._tree2IndexMap) do
    if value._isMain == true then
      local keyint64 = toInt64(0, k)
      local keyElement = (tree2:getElementManager()):getByKey(keyint64, false)
      if keyElement:getIsOpen() == true then
        (tree2:getElementManager()):toggle(keyint64)
        -- DECOMPILER ERROR at PC30: Confused about usage of register: R9 in 'UnsetPending'

        ;
        (self._list2)._selectedKey = -1
        tree2:requestUpdateByKey(keyint64)
      end
      keyElement:setIsOpen(false)
    end
  end
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedSubCategory = function(self, key, category, detail)
  -- function num : 0_42
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  (self._list2)._selectedSubKey = key
  self:SelectOptionFrame(category, detail)
  ;
  (((self._ui)._list2):getElementManager()):refillKeyList()
end

FGlobal_Option_CategoryUpdate = function(contents, key)
  -- function num : 0_43
  local idx = Int64toInt32(key)
  local indexMap = ((PaGlobal_Option._list2)._tree2IndexMap)[idx]
  local categoryBar = (UI.getChildControl)(contents, "RadioButton_MenuName")
  local categoryFocus = (UI.getChildControl)(contents, "Static_Focus")
  local categorySubBar = (UI.getChildControl)(contents, "RadioButton_SubMenuName")
  local categorySubFocus = (UI.getChildControl)(categorySubBar, "Static_SubFocus")
  categoryBar:SetShow(true)
  categoryBar:setNotImpactScrollEvent(true)
  categoryFocus:SetShow(false)
  categorySubFocus:SetShow(false)
  categorySubBar:SetShow(false)
  if indexMap._isMain then
    categoryBar:SetText(indexMap._string)
    categoryBar:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedMainCategory(" .. idx .. ", " .. " \"" .. indexMap._category .. "\"" .. ")")
    categoryBar:SetCheck((PaGlobal_Option._list2)._selectedKey == idx)
  else
    categoryBar:SetShow(false)
    categorySubBar:SetShow(true)
    categorySubBar:SetText(indexMap._string)
    categorySubBar:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSubCategory(" .. idx .. ", " .. "\"" .. indexMap._category .. "\"" .. ", " .. "\"" .. indexMap._detail .. "\"" .. ")")
    local focusControl = (UI.getChildControl)(categorySubBar, "Static_SubFocus")
    focusControl:SetShow((PaGlobal_Option._list2)._selectedSubKey == idx)
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

FGlobal_Option_TogglePanel = function()
  -- function num : 0_44
  if (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode == (UI.Get_ProcessorInputMode)() then
    return 
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Gacha_Roulette then
    return 
  end
  if PaGlobal_Option:isOpen() == false then
    PaGlobal_Option:Open()
  else
    PaGlobal_Option:Close()
  end
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.SetMonoTone = function(self, elementName, monoTone)
  -- function num : 0_45
  if (self._elements)[elementName] == nil or ((self._elements)[elementName])._eventControl == nil then
    return 
  end
  if monoTone == nil then
    return 
  end
  for index,eventcontrol in pairs(((self._elements)[elementName])._eventControl) do
    eventcontrol:SetMonoTone(monoTone)
  end
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.SetEnable = function(self, elementName, enable)
  -- function num : 0_46
  if (self._elements)[elementName] == nil or ((self._elements)[elementName])._eventControl == nil then
    return 
  end
  if enable == nil then
    return 
  end
  for index,eventcontrol in pairs(((self._elements)[elementName])._eventControl) do
    eventcontrol:SetEnable(enable)
  end
end

FGlobal_Option_OnScreenResize = function()
  -- function num : 0_47
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Window_cOption:SetPosX((screenSizeX - Panel_Window_cOption:GetSizeX()) / 2)
  Panel_Window_cOption:SetPosY((screenSizeY - Panel_Window_cOption:GetSizeY()) / 2)
  local uiScale = PaGlobal_Option:Get("UIScale")
  if uiScale == nil then
    return 
  end
  uiScale = uiScale + 0.002
  PaGlobal_Option:SetControlSetting("UIScale", uiScale)
end

FGlobal_PerFrameFPSTextUpdate = function()
  -- function num : 0_48
  local value = (math.floor)(ToClient_getFPS())
  for index,control in ipairs(PaGlobal_Option._fpsTextControl) do
    if value < 20 then
      control:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FPS") .. ": " .. "<PAColor0xfff25221>" .. tostring(value) .. "<PAOldColor>")
    else
      control:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FPS") .. ": " .. "<PAColor0xff00f281>" .. tostring(value) .. "<PAOldColor>")
    end
  end
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.SaveCutsomOption = function(self, index)
  -- function num : 0_49
  self._curCustomOption = index
  local messageBoxMemo = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_SAVE_DESC" .. tostring(index))
  local messageBoxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_TITLE"), content = messageBoxMemo, functionYes = FGlobal_Option_SaveCustomOption, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
  ClearFocusEdit()
end

FGlobal_Option_SaveCustomOption = function()
  -- function num : 0_50
  local result = ToClient_saveCustimizeOption(PaGlobal_Option._curCustomOption)
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.LoadCutsomOption = function(self, index)
  -- function num : 0_51
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_NOTCURRENTACTION_ACK"))
    return 
  end
  self._curCustomOption = index
  local messageBoxMemo = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_LOAD_DESC" .. tostring(index))
  local messageBoxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_TITLE"), content = messageBoxMemo, functionYes = FGlobal_Option_LoadCustomOption, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
  ClearFocusEdit()
end

FGlobal_Option_LoadCustomOption = function()
  -- function num : 0_52
  local fontsize = PaGlobal_Option:Get("UIFontSizeType")
  local index = PaGlobal_Option._curCustomOption
  local result = ToClient_loadCustimizeOption(index)
  if result == true then
    for _,icon in pairs((PaGlobal_Option._ui)._customLoadConfirmIcon) do
      icon:SetShow(false)
    end
    ;
    (((PaGlobal_Option._ui)._customLoadConfirmIcon)[index]):SetShow(true)
    if (PaGlobal_Option._elements).UIFontSizeType ~= nil and fontsize ~= ((PaGlobal_Option._elements).UIFontSizeType)._initValue then
      PaGlobal_Option:SetXXX("UIFontSizeType", ((PaGlobal_Option._elements).UIFontSizeType)._initValue)
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWGAMEOPTION_MESSAGEBOX_CUSTOM_NOLOAD"))
  end
end

FromClient_ChangeScreenMode = function()
  -- function num : 0_53
  reloadGameUI()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_CHANGESCREENMODE_FULL")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionYes = ToClient_ChangePreScreenMode, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

Panel_Window_cOption:RegisterUpdateFunc("FGlobal_PerFrameFPSTextUpdate")
registerEvent("EventGameOptionToggle", "FGlobal_Option_TogglePanel")
registerEvent("onScreenResize", "FGlobal_Option_OnScreenResize")
registerEvent("FromClient_ChangeScreenMode", "FromClient_ChangeScreenMode")
-- DECOMPILER ERROR at PC167: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.SetContentsOption = function(self)
  -- function num : 0_54
  if ToClient_isAvailableChangeServiceType() == true then
    if ((self._frames).Function).Nation ~= nil then
      ((UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder2_Import")):SetShow(true)
      ;
      ((UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder3_Import")):SetShow(true)
    end
    local bg = (UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder2_Import")
    local checkbuttonUseChattingFilter = (UI.getChildControl)(bg, "CheckButton_UseChattingFilter")
    local staticUseChattingFilter = (UI.getChildControl)(bg, "StaticText_UseChattingFilterDesc")
    if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_NA) or isGameTypeSA() == true or isGameTypeTH() == true or isGameTypeID() == true or (CppEnums.GameServiceType).eGameServiceType_DEV == getGameServiceType() then
      checkbuttonUseChattingFilter:SetShow(true)
      staticUseChattingFilter:SetShow(true)
    else
      checkbuttonUseChattingFilter:SetShow(false)
      staticUseChattingFilter:SetShow(false)
      setUseChattingFilter(true)
      -- DECOMPILER ERROR at PC92: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (self._elements).UseChattingFilter = nil
    end
  else
    do
      if ((self._frames).Function).Nation ~= nil then
        local nationBgOrder2 = (UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder2_Import")
        local nationBgOrder3 = (UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder3_Import")
        nationBgOrder2:SetShow(false)
        nationBgOrder3:SetShow(false)
        if isGameTypeTH() == true then
          nationBgOrder2:SetShow(true)
          nationBgOrder2:SetSize(nationBgOrder2:GetSizeX(), nationBgOrder2:GetSizeY() - 40)
          ;
          ((UI.getChildControl)(nationBgOrder2, "RadioButton_ServiceResourceType")):SetShow(false)
          ;
          ((UI.getChildControl)(nationBgOrder2, "RadioButton_ServiceResourceType1")):SetShow(false)
          ;
          ((UI.getChildControl)(nationBgOrder2, "RadioButton_ServiceResourceType2")):SetShow(false)
        end
      end
      do
        if _ContentsGroup_isFairy == false then
          local fairyVoiceBG = (UI.getChildControl)((((self._frames).Sound).OnOff)._uiFrameContent, "StaticText_BgOrder3_Import")
          fairyVoiceBG:SetShow(false)
          -- DECOMPILER ERROR at PC174: Confused about usage of register: R2 in 'UnsetPending'

          ;
          (self._elements).EnableAudioFairy = nil
          local fairyVolumeBG = (UI.getChildControl)((((self._frames).Sound).Volume)._uiFrameContent, "StaticText_BgOrder8_Import")
          fairyVolumeBG:SetShow(false)
          -- DECOMPILER ERROR at PC187: Confused about usage of register: R3 in 'UnsetPending'

          ;
          (self._elements).VolumeFairy = nil
        end
        do
          if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_NA) == true or isGameTypeSA() == true or isGameTypeRussia() == true then
            local npcvoicebg = (UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder0_Import")
            local npcvoicebgSize = npcvoicebg:GetSizeY()
            local _bg = (UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder1_Import")
            _bg:SetPosY(_bg:GetPosY() - npcvoicebg:GetSizeY() - 10)
            local _bg1 = (UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder2_Import")
            _bg1:SetPosY(_bg1:GetPosY() - npcvoicebg:GetSizeY() - 10)
            local _bg2 = (UI.getChildControl)((((self._frames).Function).Nation)._uiFrameContent, "StaticText_BgOrder3_Import")
            _bg2:SetPosY(_bg2:GetPosY() - npcvoicebg:GetSizeY() - 10)
            npcvoicebg:SetShow(false)
            npcvoicebg = (UI.getChildControl)((((self._frames).Sound).OnOff)._uiFrameContent, "StaticText_BgOrder2_Import")
            npcvoicebg:SetShow(false)
            local fairyVoiceBG = (UI.getChildControl)((((self._frames).Sound).OnOff)._uiFrameContent, "StaticText_BgOrder3_Import")
            fairyVoiceBG:SetPosY(npcvoicebg:GetPosY())
            -- DECOMPILER ERROR at PC289: Confused about usage of register: R7 in 'UnsetPending'

            ;
            (self._elements).AudioResourceType = nil
          end
          do
            if isNeedGameOptionFromServer() == false then
              return 
            end
            if ToClient_IsContentsGroupOpen("346") == false and ((self._frames).Function).View ~= nil then
              local bg = (UI.getChildControl)((((self._frames).Function).View)._uiFrameContent, "StaticText_BgOrder0_Import")
              local checkbuttonHpbar = (UI.getChildControl)(bg, "CheckButton_ShowHpRular")
              local staticHpbar = (UI.getChildControl)(bg, "StaticText_ShowHpRular_Desc")
              checkbuttonHpbar:SetShow(false)
              staticHpbar:SetShow(false)
              bg:SetSize(((((self._frames).Function).View)._uiFrame):GetSizeX(), bg:GetSizeY() - checkbuttonHpbar:GetSizeY())
              -- DECOMPILER ERROR at PC343: Confused about usage of register: R4 in 'UnsetPending'

              ;
              (self._elements).ShowHpRular = nil
            end
            do
              local availableExchangeRefuse = isDev == true or isUsePcExchangeInLocalizingValue() == true
              if availableExchangeRefuse == false and ((self._frames).Function).Etc ~= nil then
                local bg = (UI.getChildControl)((((self._frames).Function).Etc)._uiFrameContent, "StaticText_BgOrder1_Import")
                local checkbuttonExchangeRefuse = (UI.getChildControl)(bg, "CheckButton_IsExchangeRefuse")
                local staticExchangeRefuse = (UI.getChildControl)(bg, "StaticText_IsExchangeRefuse_Desc")
                checkbuttonExchangeRefuse:SetShow(false)
                staticExchangeRefuse:SetShow(false)
                bg:SetSize(((((self._frames).Function).Etc)._uiFrame):GetSizeX(), bg:GetSizeY() - checkbuttonExchangeRefuse:GetSizeY())
                -- DECOMPILER ERROR at PC398: Confused about usage of register: R5 in 'UnsetPending'

                ;
                (self._elements).IsExchangeRefuse = nil
              end
              if not isGameServiceTypeDev() and not isGameTypeTaiwan() and not isGameTypeKorea() then
                local availablefontSize = isGameTypeJapan()
              end
              do
                if availablefontSize == false and ((self._frames).Function).Convenience then
                  local bg = (UI.getChildControl)((((self._frames).Function).Convenience)._uiFrameContent, "StaticText_BgOrder1_Import")
                  bg:SetShow(false)
                  -- DECOMPILER ERROR at PC432: Confused about usage of register: R4 in 'UnsetPending'

                  ;
                  (self._elements).UIFontSizeType = nil
                end
                if _ContentsGroup_isConsoleTest == false then
                  bg = (UI.getChildControl)((((self._frames).Interface).Pad)._uiFrameContent, "StaticText_BgOrder0_Import")
                  local bg1 = (UI.getChildControl)((((self._frames).Interface).Pad)._uiFrameContent, "StaticText_BgOrder1_Import")
                  local bg2 = (UI.getChildControl)((((self._frames).Interface).Pad)._uiFrameContent, "StaticText_BgOrder2_Import")
                  local bg3 = (UI.getChildControl)((((self._frames).Interface).Pad)._uiFrameContent, "StaticText_BgOrder3_Import")
                  local bg4 = (UI.getChildControl)((((self._frames).Interface).Pad)._uiFrameContent, "StaticText_BgOrder4_Import")
                  bg3:SetPosY(bg4:GetPosY())
                  bg1:SetShow(false)
                  bg2:SetShow(false)
                  bg4:SetShow(false)
                else
                  local bg2 = (UI.getChildControl)((((self._frames).Interface).Pad)._uiFrameContent, "StaticText_BgOrder2_Import")
                  local bg4 = (UI.getChildControl)((((self._frames).Interface).Pad)._uiFrameContent, "StaticText_BgOrder4_Import")
                  local button1 = (UI.getChildControl)(bg2, "RadioButton_ConsolePadHotKeyType")
                  local button2 = (UI.getChildControl)(bg2, "RadioButton_ConsolePadHotKeyType1")
                  local button3 = (UI.getChildControl)(bg2, "RadioButton_ConsolePadHotKeyType2")
                  button1:addInputEvent("Mouse_LUp", "setConsoleKeySet(0)")
                  button2:addInputEvent("Mouse_LUp", "setConsoleKeySet(1)")
                  button3:addInputEvent("Mouse_LUp", "setConsoleKeySet(2)")
                  local topviewMode = (UI.getChildControl)(bg4, "CheckButton_GamePadTopView")
                  topviewMode:addInputEvent("Mouse_LUp", "FGlobal_ToggleTopViewMode()")
                end
                do
                  if _ContentsGroup_isFairy == false then
                    local fairyRenderBG = (UI.getChildControl)((((self._frames).Function).View)._uiFrameContent, "StaticText_BgOrder4_Import")
                    fairyRenderBG:SetShow(false)
                    -- DECOMPILER ERROR at PC558: Confused about usage of register: R4 in 'UnsetPending'

                    ;
                    (self._elements).FairyRender = nil
                  end
                  if _ContentsGroup_DamageMeter == false then
                    local damageMeterRenderBG = (UI.getChildControl)((((self._frames).Function).View)._uiFrameContent, "StaticText_BgOrder3_Import")
                    local damageMeterButton = (UI.getChildControl)(damageMeterRenderBG, "CheckButton_DamageMeter")
                    local damageMeterDesc = (UI.getChildControl)(damageMeterRenderBG, "StaticText_DamageMeter_Desc")
                    damageMeterButton:SetShow(false)
                    damageMeterDesc:SetShow(false)
                    -- DECOMPILER ERROR at PC587: Confused about usage of register: R6 in 'UnsetPending'

                    ;
                    (self._elements).DamageMeter = nil
                  end
                  -- DECOMPILER ERROR: 8 unprocessed JMP targets
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_Temp_ActionKeySetting = function(actionInputType)
  -- function num : 0_55
  if ToClient_IsDevelopment() == false then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Option._keyCustomInputType = {nil, actionInputType}
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPad)
  setKeyCustomizing(true)
end

PaGlobal_Console_TopviewMode = false
FGlobal_ToggleTopViewMode = function()
  -- function num : 0_56
  if _ContentsGroup_isConsoleTest == true then
    PaGlobal_Console_TopviewMode = not PaGlobal_Console_TopviewMode
    setTopViewMode(PaGlobal_Console_TopviewMode)
  end
end

-- DECOMPILER ERROR at PC176: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.CheckEnableSimpleUI = function(self)
  -- function num : 0_57
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil then
    if (selfPlayer:get()):getLevel() > 5 then
      PaGlobal_Option:SetMonoTone("EnableSimpleUI", false)
      PaGlobal_Option:SetEnable("EnableSimpleUI", true)
    else
      PaGlobal_Option:SetMonoTone("EnableSimpleUI", true)
      PaGlobal_Option:SetEnable("EnableSimpleUI", false)
    end
  else
    PaGlobal_Option:SetMonoTone("EnableSimpleUI", true)
    PaGlobal_Option:SetEnable("EnableSimpleUI", false)
  end
end

FGlobal_GameOption_OpenByMenu = function(index)
  -- function num : 0_58
  showGameOption()
  if index == 0 then
    PaGlobal_Option:MoveUi((PaGlobal_Option.UIMODE).Category)
    PaGlobal_Option:GoCategory("Graphic", "Quality")
  else
    if index == 1 then
      PaGlobal_Option:MoveUi((PaGlobal_Option.UIMODE).Category)
      PaGlobal_Option:GoCategory("Sound", "OnOff")
    else
      if index == 2 then
        PaGlobal_Option:MoveUi((PaGlobal_Option.UIMODE).Category)
        PaGlobal_Option:GoCategory("Function", "Convenience")
      else
        if index == 3 then
          PaGlobal_Option:MoveUi((PaGlobal_Option.UIMODE).Category)
          PaGlobal_Option:GoCategory("Interface", "Action")
        else
          if index == 4 then
            PaGlobal_Option:MoveUi((PaGlobal_Option.UIMODE).Category)
            PaGlobal_Option:GoCategory("Interface", "UI")
          else
            if index == 5 then
              PaGlobal_Option:MoveUi((PaGlobal_Option.UIMODE).Category)
              PaGlobal_Option:GoCategory("Performance", "Optimize")
            end
          end
        end
      end
    end
  end
end

FGlobal_GameOptionOpen = function()
  -- function num : 0_59
  if PaGlobal_Option:isOpen() == false then
    showGameOption()
  end
  PaGlobal_Option:MoveUi((PaGlobal_Option.UIMODE).Category)
  PaGlobal_Option:GoCategory("Function", "Nation")
end

FGlobal_GetCurrentLUT = function()
  -- function num : 0_60
  return PaGlobal_Option:Get("LUT")
end

FGlobal_IsChecked_SkillCommand = function()
  -- function num : 0_61
  return isChecked_SkillCommand
end

GameOption_GetHideWindow = function()
  -- function num : 0_62
  return PaGlobal_Option:Get("HideWindowByAttacked")
end

GameOption_ShowGuildLoginMessage = function()
  -- function num : 0_63
  return PaGlobal_Option:Get("ShowGuildLoginMessage")
end

GameOption_GetShowHpRular = function()
  -- function num : 0_64
  return PaGlobal_Option:Get("ShowHpRular")
end

GameOption_UpdateOptionChanged = function()
  -- function num : 0_65
end

GameOption_Cancel = function()
  -- function num : 0_66
  PaGlobal_Option:Close()
end

FGlobal_SpiritGuide_IsShow = function()
  -- function num : 0_67
  return PaGlobal_Option:Get("ShowComboGuide")
end

FGlobal_getUIScale = function()
  -- function num : 0_68
  local uiScale = {}
  uiScale.min = 50
  uiScale.max = 200
  return uiScale
end

FGlobal_returnUIScale = function()
  -- function num : 0_69
  local interval = ((PaGlobal_Option._elements).UIScale)._sliderValueMax - ((PaGlobal_Option._elements).UIScale)._sliderValueMin
  local convertedValue = (((PaGlobal_Option._elements).UIScale)._sliderValueMin + interval * PaGlobal_Option:Get("UIScale")) * 0.01
  convertedValue = (math.floor)((convertedValue + 0.002) * 100) / 100
  return convertedValue
end

FGlobal_saveUIScale = function(scale)
  -- function num : 0_70
  local sliderValue = PaGlobal_Option:FromRealValueToSliderValue(scale, 0.5, 2)
  if sliderValue >= 1 then
    return 
  end
  PaGlobal_Option:SetControlSetting("UIScale", PaGlobal_Option:FromRealValueToSliderValue(scale, 0.5, 2))
end

getUiFontSize = function()
  -- function num : 0_71
  return PaGlobal_Option:Get("UIFontSizeType")
end

SimpleUI_Check = function(simpleUI_Check)
  -- function num : 0_72
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):getLevel() == 6 then
    PaGlobal_Option:SetXXX("EnableSimpleUI", simpleUI_Check)
  end
end

GameOption_SetUIMode = function(uiScale)
  -- function num : 0_73
  local uiScaleOption = (PaGlobal_Option._elements).UIScale
  uiScaleOption._initValue = PaGlobal_Option:FromRealValueToSliderValue(uiScale, 0.5, 2)
end

ResetKeyCustombyAttacked = function()
  -- function num : 0_74
  if Panel_Window_cOption:GetShow() then
    setKeyCustomizing(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

GameOption_ComboGuideValueChange = function(isShow)
  -- function num : 0_75
end


