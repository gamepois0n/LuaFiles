-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\firstlogin\panel_firstlogin.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
Panel_FirstLogin:SetShow(false)
Panel_FirstLogin:setGlassBackground(true)
Panel_FirstLogin:RegisterShowEventFunc(true, "Panel_FirstLogin_ShowAni()")
Panel_FirstLogin:RegisterShowEventFunc(false, "Panel_FirstLogin_HideAni()")
Panel_FirstLogin_ShowAni = function()
  -- function num : 0_0
end

Panel_FirstLogin_HideAni = function()
  -- function num : 0_1
end

local FirstLogin = {blockBG = (UI.getChildControl)(Panel_FirstLogin, "Static_blockBG"), BTN_Next = (UI.getChildControl)(Panel_FirstLogin, "Button_Next"), RecommendBG_Low = (UI.getChildControl)(Panel_FirstLogin, "Static_RecommendBG_Low"), RecommendBG_Normal = (UI.getChildControl)(Panel_FirstLogin, "Static_RecommendBG_Normal"), RecommendBG_High = (UI.getChildControl)(Panel_FirstLogin, "Static_RecommendBG_High"), Slider_Control = (UI.getChildControl)(Panel_FirstLogin, "Slider_Control"), Slider_0 = (UI.getChildControl)(Panel_FirstLogin, "StaticText_Slider_0"), Slider_50 = (UI.getChildControl)(Panel_FirstLogin, "StaticText_Slider_50"), Slider_100 = (UI.getChildControl)(Panel_FirstLogin, "StaticText_Slider_100"), Slider_DescBG = (UI.getChildControl)(Panel_FirstLogin, "Static_ContentBG"), Slider_Desc = (UI.getChildControl)(Panel_FirstLogin, "StaticText_ContentDesc"), Text_Title = (UI.getChildControl)(Panel_FirstLogin, "StaticText_ContentTitle"), RadioBTN_AllRound = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_Taste_AllRound"), RadioBTN_Combat = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_Taste_Combat"), RadioBTN_Product = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_Taste_Product"), RadioBTN_Fishing = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_Taste_Fishing"), Text_RadioBTN_Title = (UI.getChildControl)(Panel_FirstLogin, "StaticText_Taste_All_Title"), Text_RadioBTN_Desc = (UI.getChildControl)(Panel_FirstLogin, "StaticText_Taste_All_Desc"), RadioBTN_None = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_NavGuideNone"), RadioBTN_Arrow = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_NavGuideArrow"), RadioBTN_Effect = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_NavGuideEffect"), RadioBTN_Fairy = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_NavGuideFairy"), img_None = (UI.getChildControl)(Panel_FirstLogin, "Static_None"), img_Arrow = (UI.getChildControl)(Panel_FirstLogin, "Static_Arrow"), img_Effect = (UI.getChildControl)(Panel_FirstLogin, "Static_Effect"), img_Fairy = (UI.getChildControl)(Panel_FirstLogin, "Static_Fairy"), title_TexQuality = (UI.getChildControl)(Panel_FirstLogin, "StaticText_TextureQuality"), Button_TextureLow = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_TextureLow"), Button_TextureNormal = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_TextureNormal"), Button_TextureHigh = (UI.getChildControl)(Panel_FirstLogin, "RadioButton_TextureHigh"), Step1 = false, Step2 = false, Step3 = false, Step4 = false, characterSelect = nil, TEXTURE_QUALITY_HIGH = 0, TEXTURE_QUALITY_NORMAL = 1, TEXTURE_QUALITY_LOW = 2, TEXTURE_QUALITY_COUNT = 3, GRAPHIC_OPTION_HIGH0 = 0, GRAPHIC_OPTION_HIGH1 = 1, GRAPHIC_OPTION_NORMAL0 = 2, GRAPHIC_OPTION_NORMAL1 = 3, GRAPHIC_OPTION_LOW0 = 4, GRAPHIC_OPTION_LOW1 = 5, GRAPHIC_OPTION_VERYLOW = 6, GRAPHIC_OPTION_COUNT = 7, currentTexGraphicOptionIdx = 0, currentGraphicOptionIdx = 0}
FirstLogin.Slider_ControlBTN = (UI.getChildControl)(FirstLogin.Slider_Control, "Slider_Button")
FirstLogin._buttonQuestion = (UI.getChildControl)(Panel_FirstLogin, "Button_Question")
;
(FirstLogin._buttonQuestion):SetShow(false)
FirstLogin.initialize = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  (self.BTN_Next):SetShow(false)
  ;
  (self.Text_Title):SetShow(false)
  ;
  (self.Slider_Desc):SetShow(false)
  ;
  (self.Slider_Control):SetShow(false)
  ;
  (self.Slider_0):SetShow(false)
  ;
  (self.Slider_50):SetShow(false)
  ;
  (self.Slider_100):SetShow(false)
  ;
  (self.Slider_DescBG):SetShow(false)
  ;
  (self.RecommendBG_Low):SetShow(false)
  ;
  (self.RecommendBG_Normal):SetShow(false)
  ;
  (self.RecommendBG_High):SetShow(false)
  ;
  (self.RadioBTN_AllRound):SetShow(false)
  ;
  (self.RadioBTN_Combat):SetShow(false)
  ;
  (self.RadioBTN_Product):SetShow(false)
  ;
  (self.RadioBTN_Fishing):SetShow(false)
  ;
  (self.Text_RadioBTN_Title):SetShow(false)
  ;
  (self.Text_RadioBTN_Desc):SetShow(false)
  ;
  (self.RadioBTN_None):SetShow(false)
  ;
  (self.RadioBTN_Arrow):SetShow(false)
  ;
  (self.RadioBTN_Effect):SetShow(false)
  ;
  (self.RadioBTN_Fairy):SetShow(false)
  ;
  (self.img_None):SetShow(false)
  ;
  (self.img_Arrow):SetShow(false)
  ;
  (self.img_Effect):SetShow(false)
  ;
  (self.img_Fairy):SetShow(false)
  ;
  (self.title_TexQuality):SetShow(false)
  ;
  (self.Button_TextureLow):SetShow(false)
  ;
  (self.Button_TextureNormal):SetShow(false)
  ;
  (self.Button_TextureHigh):SetShow(false)
  ;
  (self.Text_RadioBTN_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.Slider_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.Slider_DescBG):SetTextMode(UI_TM.eTextMode_AutoWrap)
end

FirstLogin.SetStep1 = function(self)
  -- function num : 0_3
  (self.blockBG):SetSize(getScreenSizeX(), getScreenSizeY())
  ;
  (self.blockBG):ComputePos()
  self.Step1 = true
  self.Step2 = false
  self.Step3 = false
  self.Step4 = false
  ;
  (self.Text_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEPTITLE1"))
  ;
  (self.Slider_DescBG):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEPDESC1"))
  ;
  (self.Slider_Control):SetControlPos(50)
  self:PanelResize_ByFontSize()
  ;
  (self.BTN_Next):SetShow(true)
  ;
  (self.Text_Title):SetShow(true)
  ;
  (self.Slider_Desc):SetShow(false)
  ;
  (self.Slider_Control):SetShow(true)
  ;
  (self.Slider_0):SetShow(true)
  ;
  (self.Slider_50):SetShow(true)
  ;
  (self.Slider_100):SetShow(true)
  ;
  (self.Slider_DescBG):SetShow(true)
  ;
  (self.RecommendBG_Low):SetShow(true)
  ;
  (self.RecommendBG_Normal):SetShow(true)
  ;
  (self.RecommendBG_High):SetShow(true)
  ;
  (self.RadioBTN_AllRound):SetShow(false)
  ;
  (self.RadioBTN_Combat):SetShow(false)
  ;
  (self.RadioBTN_Product):SetShow(false)
  ;
  (self.RadioBTN_Fishing):SetShow(false)
  ;
  (self.Text_RadioBTN_Title):SetShow(false)
  ;
  (self.Text_RadioBTN_Desc):SetShow(false)
  ;
  (self.RadioBTN_None):SetShow(false)
  ;
  (self.RadioBTN_Arrow):SetShow(false)
  ;
  (self.RadioBTN_Effect):SetShow(false)
  ;
  (self.RadioBTN_Fairy):SetShow(false)
  ;
  (self.img_None):SetShow(false)
  ;
  (self.img_Arrow):SetShow(false)
  ;
  (self.img_Effect):SetShow(false)
  ;
  (self.img_Fairy):SetShow(false)
  ;
  (self.title_TexQuality):SetShow(false)
  ;
  (self.Button_TextureLow):SetShow(false)
  ;
  (self.Button_TextureNormal):SetShow(false)
  ;
  (self.Button_TextureHigh):SetShow(false)
end

FirstLogin.SetStep2 = function(self)
  -- function num : 0_4
  self.Step1 = false
  self.Step2 = true
  self.Step3 = false
  self.Step4 = false
  ;
  (self.Text_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEPTITLE2"))
  ;
  (self.Slider_DescBG):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEPDESC2"))
  ;
  (self.Slider_Control):SetControlPos(50)
  self:PanelResize_ByFontSize()
  ;
  (self.BTN_Next):SetShow(true)
  ;
  (self.Text_Title):SetShow(true)
  ;
  (self.Slider_Desc):SetShow(false)
  ;
  (self.Slider_Control):SetShow(true)
  ;
  (self.Slider_0):SetShow(true)
  ;
  (self.Slider_50):SetShow(true)
  ;
  (self.Slider_100):SetShow(true)
  ;
  (self.Slider_DescBG):SetShow(true)
  ;
  (self.RecommendBG_Low):SetShow(true)
  ;
  (self.RecommendBG_Normal):SetShow(true)
  ;
  (self.RecommendBG_High):SetShow(true)
  ;
  (self.RadioBTN_AllRound):SetShow(false)
  ;
  (self.RadioBTN_Combat):SetShow(false)
  ;
  (self.RadioBTN_Product):SetShow(false)
  ;
  (self.RadioBTN_Fishing):SetShow(false)
  ;
  (self.Text_RadioBTN_Title):SetShow(false)
  ;
  (self.Text_RadioBTN_Desc):SetShow(false)
  ;
  (self.RadioBTN_None):SetShow(false)
  ;
  (self.RadioBTN_Arrow):SetShow(false)
  ;
  (self.RadioBTN_Effect):SetShow(false)
  ;
  (self.RadioBTN_Fairy):SetShow(false)
  ;
  (self.img_None):SetShow(false)
  ;
  (self.img_Arrow):SetShow(false)
  ;
  (self.img_Effect):SetShow(false)
  ;
  (self.img_Fairy):SetShow(false)
  ;
  (self.title_TexQuality):SetShow(false)
  ;
  (self.Button_TextureLow):SetShow(false)
  ;
  (self.Button_TextureNormal):SetShow(false)
  ;
  (self.Button_TextureHigh):SetShow(false)
end

FirstLogin.SetStepEnd = function(self)
  -- function num : 0_5 , upvalues : FirstLogin
  self.Step1 = false
  self.Step2 = false
  self.Step3 = false
  self.Step4 = false
  local QuestListInfo = ToClient_GetQuestList()
  QuestListInfo:setQuestSelectType(0, true)
  QuestListInfo:setQuestSelectType(1, true)
  Panel_FirstLogin:SetShow(false, false)
  selectCharacter(FirstLogin.characterSelect)
end

FirstLogin.SetStep3 = function(self)
  -- function num : 0_6
  self.Step1 = false
  self.Step2 = false
  self.Step3 = true
  self.Step4 = false
  ;
  (self.Text_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEPTITLE3"))
  ;
  (self.Slider_DescBG):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEP3_DESC"))
  ;
  (self.RadioBTN_Arrow):SetCheck(true)
  self:PanelResize_ByFontSize()
  ;
  (self.BTN_Next):SetShow(true)
  ;
  (self.Text_Title):SetShow(true)
  ;
  (self.Slider_Desc):SetShow(false)
  ;
  (self.Slider_Control):SetShow(false)
  ;
  (self.Slider_0):SetShow(false)
  ;
  (self.Slider_50):SetShow(false)
  ;
  (self.Slider_100):SetShow(false)
  ;
  (self.Slider_DescBG):SetShow(true)
  ;
  (self.RecommendBG_Low):SetShow(false)
  ;
  (self.RecommendBG_Normal):SetShow(false)
  ;
  (self.RecommendBG_High):SetShow(false)
  ;
  (self.RadioBTN_AllRound):SetShow(false)
  ;
  (self.RadioBTN_Combat):SetShow(false)
  ;
  (self.RadioBTN_Product):SetShow(false)
  ;
  (self.RadioBTN_Fishing):SetShow(false)
  ;
  (self.Text_RadioBTN_Title):SetShow(false)
  ;
  (self.Text_RadioBTN_Desc):SetShow(false)
  ;
  (self.RadioBTN_None):SetShow(true)
  ;
  (self.RadioBTN_None):SetCheck(false)
  ;
  (self.RadioBTN_Arrow):SetShow(true)
  ;
  (self.RadioBTN_Arrow):SetCheck(true)
  ;
  (self.RadioBTN_Effect):SetShow(true)
  ;
  (self.RadioBTN_Effect):SetCheck(false)
  ;
  (self.RadioBTN_Fairy):SetShow(true)
  ;
  (self.RadioBTN_Fairy):SetCheck(false)
  ;
  (self.img_None):SetShow(true)
  ;
  (self.img_Arrow):SetShow(true)
  ;
  (self.img_Effect):SetShow(true)
  ;
  (self.img_Fairy):SetShow(true)
  ;
  (self.title_TexQuality):SetShow(false)
  ;
  (self.Button_TextureLow):SetShow(false)
  ;
  (self.Button_TextureNormal):SetShow(false)
  ;
  (self.Button_TextureHigh):SetShow(false)
end

FirstLogin.SetStep4 = function(self)
  -- function num : 0_7
  self.Step1 = false
  self.Step2 = false
  self.Step3 = false
  self.Step4 = true
  ;
  (self.Text_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEPTITLE4"))
  ;
  (self.BTN_Next):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_CONFIRM"))
  ;
  (self.Slider_DescBG):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEP4_DESC"))
  self:PanelResize_ByFontSize()
  ;
  (self.BTN_Next):SetShow(true)
  ;
  (self.Text_Title):SetShow(true)
  ;
  (self.Slider_Desc):SetShow(false)
  ;
  (self.Slider_Control):SetShow(false)
  ;
  (self.Slider_0):SetShow(false)
  ;
  (self.Slider_50):SetShow(false)
  ;
  (self.Slider_100):SetShow(false)
  ;
  (self.Slider_DescBG):SetShow(true)
  ;
  (self.RecommendBG_Low):SetShow(false)
  ;
  (self.RecommendBG_Normal):SetShow(false)
  ;
  (self.RecommendBG_High):SetShow(false)
  ;
  (self.RadioBTN_AllRound):SetShow(false)
  ;
  (self.RadioBTN_Combat):SetShow(false)
  ;
  (self.RadioBTN_Product):SetShow(false)
  ;
  (self.RadioBTN_Fishing):SetShow(false)
  ;
  (self.Text_RadioBTN_Title):SetShow(false)
  ;
  (self.Text_RadioBTN_Desc):SetShow(false)
  ;
  (self.RadioBTN_None):SetShow(false)
  ;
  (self.RadioBTN_Arrow):SetShow(false)
  ;
  (self.RadioBTN_Effect):SetShow(false)
  ;
  (self.RadioBTN_Fairy):SetShow(false)
  ;
  (self.img_None):SetShow(false)
  ;
  (self.img_Arrow):SetShow(false)
  ;
  (self.img_Effect):SetShow(false)
  ;
  (self.img_Fairy):SetShow(false)
  ;
  (self.title_TexQuality):SetShow(true)
  ;
  (self.Button_TextureLow):SetShow(true)
  ;
  (self.Button_TextureLow):SetCheck(false)
  ;
  (self.Button_TextureNormal):SetShow(true)
  ;
  (self.Button_TextureNormal):SetCheck(true)
  ;
  (self.Button_TextureHigh):SetShow(true)
  ;
  (self.Button_TextureHigh):SetCheck(false)
end

FirstLogin.SetStep3End = function(self)
  -- function num : 0_8
  self.Step1 = false
  self.Step2 = false
  self.Step3 = false
  self.Step4 = false
  local selectType = -1
  if (self.RadioBTN_AllRound):IsCheck() then
    selectType = 0
  else
    if (self.RadioBTN_Combat):IsCheck() then
      selectType = 1
    else
      if (self.RadioBTN_Product):IsCheck() then
        selectType = 2
      else
        if (self.RadioBTN_Fishing):IsCheck() then
          selectType = 3
        else
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_STEPTITLE3"))
          self:SetStep3()
          return 
        end
      end
    end
  end
  QuestWidget_ShowSelectQuestFavorType(selectType)
  Panel_FirstLogin:SetShow(false, false)
end

FirstLogin_SetStepData = function()
  -- function num : 0_9 , upvalues : FirstLogin
  local self = FirstLogin
  local step = nil
  if self.Step4 == true then
    step = 4
  else
    if self.Step3 == true then
      step = 3
    else
      if self.Step2 == true then
        step = 2
      else
        if self.Step1 == true then
          step = 1
        end
      end
    end
  end
  local volume = (FirstLogin.Slider_Control):GetControlPos()
  if step == 1 then
    setLoginOptionCameraShake(volume)
    saveGameOption(false)
    FirstLogin:SetStep2()
  else
    if step == 2 then
      setLoginOptionMotionBlur(volume)
      saveGameOption(false)
      FirstLogin:SetStep3()
    else
      if step == 3 then
        local isCheck = 1
        local isNoneCheck = (self.RadioBTN_None):IsCheck()
        local isArrowCheck = (self.RadioBTN_Arrow):IsCheck()
        local isEffectCheck = (self.RadioBTN_Effect):IsCheck()
        local isFairyCheck = (self.RadioBTN_Fairy):IsCheck()
        if isNoneCheck then
          isCheck = (CppEnums.NavPathEffectType).eNavPathEffectType_None
        else
          if isArrowCheck then
            isCheck = (CppEnums.NavPathEffectType).eNavPathEffectType_Arrow
          else
            if isEffectCheck then
              isCheck = (CppEnums.NavPathEffectType).eNavPathEffectType_PathEffect
            else
              if isFairyCheck then
                isCheck = (CppEnums.NavPathEffectType).eNavPathEffectType_Fairy
              end
            end
          end
        end
        setLoginOptionNavPathEffectType(isCheck)
        saveGameOption(false)
        FirstLogin:SetStep4()
      else
        do
          if step == 4 then
            local isGraphicCheck = 3
            local isLowCheck = (self.Button_TextureLow):IsCheck()
            local isNormalCheck = (self.Button_TextureNormal):IsCheck()
            local isHighCheck = (self.Button_TextureHigh):IsCheck()
            if isLowCheck then
              isGraphicCheck = 5
            else
              if isNormalCheck then
                isGraphicCheck = 3
              else
                if isHighCheck then
                  isGraphicCheck = 0
                else
                  isGraphicCheck = 3
                end
              end
            end
            setLoginOptionGraphicOption(isGraphicCheck)
            FirstLogin:SetStepEnd()
          end
        end
      end
    end
  end
end

FirstLogin_FavorQuestType = function(questType)
  -- function num : 0_10 , upvalues : FirstLogin
  local self = FirstLogin
  local title, desc = nil, nil
  if questType == 0 then
    title = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPE1")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPETITLE1")
  else
    if questType == 1 then
      title = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPE2")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPETITLE2")
    else
      if questType == 2 then
        title = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPE3")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPETITLE3")
      else
        if questType == 3 then
          title = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPE4")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPETITLE4")
        else
          title = ""
          desc = ""
        end
      end
    end
  end
  desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FIRSTLOGIN_QUESTTYPE_MSG", "desc", desc)
  ;
  (self.Text_RadioBTN_Title):SetText(title)
  ;
  (self.Text_RadioBTN_Desc):SetText(desc)
end

FGlobal_FirstLogin_Open = function(characterSelect)
  -- function num : 0_11 , upvalues : FirstLogin
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  FirstLogin.characterSelect = characterSelect
  FirstLogin:SetStep1()
  Panel_FirstLogin:SetShow(true, true)
end

FGlobal_FirstLogin_InGameOpen = function()
  -- function num : 0_12 , upvalues : FirstLogin
  FirstLogin:SetStep3()
  Panel_FirstLogin:SetShow(true, true)
end

FGlobal_FirstLogin_InGameClose = function()
  -- function num : 0_13
  QuestWidget_ShowSelectQuestFavorType(1)
  Panel_FirstLogin:SetShow(false, false)
end

FirstLogin_SetCurrentGraphicOption = function(graphicOptionIdx)
  -- function num : 0_14 , upvalues : FirstLogin
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if graphicOptionIdx >= 0 and graphicOptionIdx < FirstLogin.GRAPHIC_OPTION_COUNT then
    FirstLogin.currentGraphicOptionIdx = graphicOptionIdx
    FirstLogin_SetGraphicOptionText(graphicOptionIdx)
  end
end

FirstLogin_SetCurrentTexGraphicOption = function(graphicOptionIdx)
  -- function num : 0_15 , upvalues : FirstLogin
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if graphicOptionIdx >= 0 and graphicOptionIdx < FirstLogin.GRAPHIC_OPTION_COUNT then
    FirstLogin.currentTexGraphicOptionIdx = graphicOptionIdx
    FirstLogin_SetTexGraphicOptionText(graphicOptionIdx)
  end
end

FirstLogin_ClickedImage = function(imgType)
  -- function num : 0_16 , upvalues : FirstLogin
  local self = FirstLogin
  if imgType == 0 then
    (self.RadioBTN_None):SetCheck(true)
    ;
    (self.RadioBTN_Arrow):SetCheck(false)
    ;
    (self.RadioBTN_Effect):SetCheck(false)
    ;
    (self.RadioBTN_Fairy):SetCheck(false)
  else
    if imgType == 1 then
      (self.RadioBTN_None):SetCheck(false)
      ;
      (self.RadioBTN_Arrow):SetCheck(true)
      ;
      (self.RadioBTN_Effect):SetCheck(false)
      ;
      (self.RadioBTN_Fairy):SetCheck(false)
    else
      if imgType == 2 then
        (self.RadioBTN_None):SetCheck(false)
        ;
        (self.RadioBTN_Arrow):SetCheck(false)
        ;
        (self.RadioBTN_Effect):SetCheck(true)
        ;
        (self.RadioBTN_Fairy):SetCheck(false)
      else
        if imgType == 3 then
          (self.RadioBTN_None):SetCheck(false)
          ;
          (self.RadioBTN_Arrow):SetCheck(false)
          ;
          (self.RadioBTN_Effect):SetCheck(false)
          ;
          (self.RadioBTN_Fairy):SetCheck(true)
        end
      end
    end
  end
end

FirstLogin.registEventHandler = function(self)
  -- function num : 0_17
  (self.BTN_Next):addInputEvent("Mouse_LUp", "FirstLogin_SetStepData()")
  ;
  (self.RadioBTN_AllRound):addInputEvent("Mouse_LUp", "FirstLogin_FavorQuestType( " .. 0 .. " )")
  ;
  (self.RadioBTN_Combat):addInputEvent("Mouse_LUp", "FirstLogin_FavorQuestType( " .. 1 .. " )")
  ;
  (self.RadioBTN_Product):addInputEvent("Mouse_LUp", "FirstLogin_FavorQuestType( " .. 2 .. " )")
  ;
  (self.RadioBTN_Fishing):addInputEvent("Mouse_LUp", "FirstLogin_FavorQuestType( " .. 3 .. " )")
  ;
  (self.img_None):addInputEvent("Mouse_LUp", "FirstLogin_ClickedImage(" .. 0 .. ")")
  ;
  (self.img_Arrow):addInputEvent("Mouse_LUp", "FirstLogin_ClickedImage(" .. 1 .. ")")
  ;
  (self.img_Effect):addInputEvent("Mouse_LUp", "FirstLogin_ClickedImage(" .. 2 .. ")")
  ;
  (self.img_Fairy):addInputEvent("Mouse_LUp", "FirstLogin_ClickedImage(" .. 3 .. ")")
end

FirstLogin.registMessageHandler = function(self)
  -- function num : 0_18
end

local basePanelSizeY = Panel_FirstLogin:GetSizeY()
local baseBgSizeY = (FirstLogin.Slider_DescBG):GetSizeY()
FirstLogin.PanelResize_ByFontSize = function(self)
  -- function num : 0_19 , upvalues : baseBgSizeY, basePanelSizeY
  if baseBgSizeY < (self.Slider_DescBG):GetTextSizeY() then
    (self.Slider_DescBG):SetSize((self.Slider_DescBG):GetSizeX(), (self.Slider_DescBG):GetTextSizeY() + 20)
  else
    ;
    (self.Slider_DescBG):SetSize((self.Slider_DescBG):GetSizeX(), baseBgSizeY)
  end
  local plusSizeY = (self.Slider_DescBG):GetSizeY() - baseBgSizeY
  Panel_FirstLogin:SetSize(Panel_FirstLogin:GetSizeX(), basePanelSizeY + plusSizeY)
  ;
  (self.Slider_DescBG):ComputePos()
  ;
  (self.BTN_Next):ComputePos()
end

FirstLogin:initialize()
FirstLogin:registEventHandler()
FirstLogin:registMessageHandler()

