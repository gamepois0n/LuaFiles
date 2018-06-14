-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\knowledge\panel_window_knowledge_renew.luac 

-- params : ...
-- function num : 0
local Panel_Window_Knowledge_Renew_info = {_initialize = false, 
_ui = {static_TitleBg = nil, staticText_Title_Top = nil, static_TopBG = nil, staticText_KnowledgePointTitle = nil, staticText_PointValue = nil, staticText_EffectTitle = nil, staticText_EffectValue = nil, static_AdressMapBg = nil, staticText_Depth = nil, static_CategoryBg = nil, 
button_Category = {[0] = nil, [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil, [6] = nil, [7] = nil, [8] = nil}
, static_SubCategoryBg = nil, staticText_Title_1 = nil, list2_Category = nil, list2_1_Content = nil, button_CategoryName = nil, staticText_EnergyIcon = nil, static_Key_ConsoleUI = nil, list2_1_VerticalScroll = nil, list2_1_HorizontalScroll = nil, static_CategoryItemBg = nil, staticText_Title_2 = nil, list2_CategoryItem = nil, list2_2_Content = nil, button_CategoryItemName = nil, list2_2_VerticalScroll = nil, list2_2_HorizontalScroll = nil, static_KnowledgeImage = nil, staticText_Impression = nil, staticText_Interest = nil, staticText_KnowledgeName = nil, staticText_Interesting = nil, staticText_KnowledgeDesc = nil, static_BottomBg = nil, staticText_Back_ConsoleUI = nil, button_Back = nil, staticText_DetailShow_ConsoleUI = nil, staticText_TooltipBg = nil, 
toolTip_Point = {}
, 
toolTip_PointDesc = {}
}
, 
_value = {currentStep = 0, 
stepTextList = {[0] = "", [1] = "", [2] = ""}
, step0_currentIndex = 0, step0_selectMentalObjectKey = 0, step1_lastIndex = -1, step1_currentIndex = 0, step1_selectMentalObjectKey = 0, step2_useCard = false, step2_lastIndex = -1, step2_currentIndex = 0, step2_selectMentalObjectKey = 0, step3_lastIndex = -1, step3_currentIndex = 0}
, 
_text = {arrow = "â–\182"}
, 
_enum = {ePOINT_COUNT = 10, eKNOWLEDGE_MAX = 9, eSTEP_CATEGORY = 0, eSETP_SUBCATEGORY = 1, eSTEP_GROUP_1 = 2, eSTEP_GROUP_2 = 3}
, 
_icon = {texture = "Renewal/UI_Icon/Console_Icon_02.dds", 
[0] = {x1 = 115, y1 = 58, x2 = 171, y2 = 114}
, 
[1] = {x1 = 1, y1 = 1, x2 = 57, y2 = 57}
, 
[5001] = {x1 = 58, y1 = 1, x2 = 114, y2 = 57}
, 
[5020] = {x1 = 1, y1 = 58, x2 = 57, y2 = 114}
, 
[10001] = {x1 = 1, y1 = 115, x2 = 57, y2 = 171}
, 
[20001] = {x1 = 1, y1 = 172, x2 = 57, y2 = 228}
, 
[25001] = {x1 = 58, y1 = 58, x2 = 114, y2 = 114}
, 
[30001] = {x1 = 58, y1 = 115, x2 = 114, y2 = 171}
, 
[31310] = {x1 = 58, y1 = 172, x2 = 114, y2 = 228}
, 
[31300] = {x1 = 115, y1 = 1, x2 = 171, y2 = 57}
}
, 
_ani = {showAniElapsed = 0, showAniDuration = 0.3}
}
local themeKeyKey_ControlMapping = {[1] = 0, [5001] = 1, [5020] = 2, [10001] = 3, [20001] = 4, [25001] = 5, [30001] = 6, [31310] = 7, [31300] = 8}
Panel_Window_Knowledge_Renew_info.registerMessageHandler = function(self)
  -- function num : 0_0
  registerEvent("onScreenResize", "FromClient_Window_Knowledge_Renew_Resize")
  Panel_Window_Knowledge_Renew:RegisterShowEventFunc(true, "PaGlobalFunc_Window_Knowledge_Renew_ShowAni()")
  Panel_Window_Knowledge_Renew:RegisterShowEventFunc(false, "PaGlobalFunc_Window_Knowledge_Renew_HideAni()")
end

Panel_Window_Knowledge_Renew_info.initialize = function(self)
  -- function num : 0_1
  self._initialize = true
  self:initValue()
  self:childControl()
  self:resize()
  self:registerMessageHandler()
end

Panel_Window_Knowledge_Renew_info.initValue = function(self)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._value).currentStep = 0
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._value).stepTextList)[0] = ""
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._value).stepTextList)[0] = ""
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._value).stepTextList)[2] = ""
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step0_currentIndex = 0
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step0_selectMentalObjectKey = 0
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step1_lastIndex = -1
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step1_currentIndex = 0
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step1_selectMentalObjectKey = 0
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_useCard = false
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_lastIndex = -1
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_currentIndex = 0
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_selectMentalObjectKey = 0
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step3_lastIndex = -1
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step3_currentIndex = 0
end

Panel_Window_Knowledge_Renew_info.resize = function(self)
  -- function num : 0_3
  Panel_Window_Knowledge_Renew:SetSize(Panel_Window_Knowledge_Renew:GetSizeX(), getScreenSizeY())
end

Panel_Window_Knowledge_Renew_info.childControl = function(self)
  -- function num : 0_4
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).static_TitleBg = (UI.getChildControl)(Panel_Window_Knowledge_Renew, "Static_TitleBg")
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Title_Top = (UI.getChildControl)((self._ui).static_TitleBg, "StaticText_Title_Top")
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_TopBG = (UI.getChildControl)(Panel_Window_Knowledge_Renew, "Static_TopBG")
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_PointValue = (UI.getChildControl)((self._ui).static_TopBG, "StaticText_PointValue")
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_EffectValue = (UI.getChildControl)((self._ui).static_TopBG, "StaticText_EffectValue")
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_AdressMapBg = (UI.getChildControl)((self._ui).static_TopBG, "Static_AdressMapBg")
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Depth = (UI.getChildControl)((self._ui).static_AdressMapBg, "StaticText_Depth")
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_CategoryBg = (UI.getChildControl)(Panel_Window_Knowledge_Renew, "Static_CategoryBg")
  for index = 0, 8 do
    local slot = {}
    slot.button = (UI.getChildControl)((self._ui).static_CategoryBg, "Button_" .. index)
    slot.icon = (UI.getChildControl)(slot.button, "Static_Icon_" .. index)
    slot.percent = (UI.getChildControl)(slot.button, "StaticText_Percent_" .. index)
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).button_Category)[index] = slot
  end
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_SubCategoryBg = (UI.getChildControl)(Panel_Window_Knowledge_Renew, "Static_SubCategoryBg")
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Title_1 = (UI.getChildControl)((self._ui).static_SubCategoryBg, "StaticText_Title_1")
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_Category = (UI.getChildControl)((self._ui).static_SubCategoryBg, "List2_Category")
  ;
  ((self._ui).list2_Category):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_Window_Knowledge_Step_1And2List")
  ;
  ((self._ui).list2_Category):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  -- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_1_Content = (UI.getChildControl)((self._ui).list2_Category, "List2_1_Content")
  -- DECOMPILER ERROR at PC148: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).button_CategoryName = (UI.getChildControl)((self._ui).list2_1_Content, "Button_CategoryName")
  -- DECOMPILER ERROR at PC156: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_EnergyIcon = (UI.getChildControl)((self._ui).list2_1_Content, "StaticText_EnergyIcon")
  -- DECOMPILER ERROR at PC164: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Key_ConsoleUI = (UI.getChildControl)((self._ui).list2_1_Content, "Static_Key_ConsoleUI")
  -- DECOMPILER ERROR at PC172: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_1_VerticalScroll = (UI.getChildControl)((self._ui).list2_Category, "List2_1_VerticalScroll")
  -- DECOMPILER ERROR at PC180: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_1_HorizontalScroll = (UI.getChildControl)((self._ui).list2_Category, "List2_1_VerticalScroll")
  -- DECOMPILER ERROR at PC187: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_CategoryItemBg = (UI.getChildControl)(Panel_Window_Knowledge_Renew, "Static_CategoryItemBg")
  -- DECOMPILER ERROR at PC195: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Title_2 = (UI.getChildControl)((self._ui).static_CategoryItemBg, "StaticText_Title_2")
  -- DECOMPILER ERROR at PC203: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_CategoryItem = (UI.getChildControl)((self._ui).static_CategoryItemBg, "List2_CategoryItem")
  ;
  ((self._ui).list2_CategoryItem):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_Window_Knowledge_Step_3List")
  ;
  ((self._ui).list2_CategoryItem):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  -- DECOMPILER ERROR at PC226: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_2_Content = (UI.getChildControl)((self._ui).list2_CategoryItem, "List2_2_Content")
  -- DECOMPILER ERROR at PC234: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_2_VerticalScroll = (UI.getChildControl)((self._ui).list2_CategoryItem, "List2_2_VerticalScroll")
  -- DECOMPILER ERROR at PC242: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_2_HorizontalScroll = (UI.getChildControl)((self._ui).list2_CategoryItem, "List2_2_HorizontalScroll")
  -- DECOMPILER ERROR at PC250: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_KnowledgeImage = (UI.getChildControl)((self._ui).static_CategoryItemBg, "Static_KnowledgeImage")
  -- DECOMPILER ERROR at PC258: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Impression = (UI.getChildControl)((self._ui).static_CategoryItemBg, "StaticText_Impression")
  -- DECOMPILER ERROR at PC266: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Interest = (UI.getChildControl)((self._ui).static_CategoryItemBg, "StaticText_Interest")
  -- DECOMPILER ERROR at PC274: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_KnowledgeName = (UI.getChildControl)((self._ui).static_CategoryItemBg, "StaticText_KnowledgeName")
  -- DECOMPILER ERROR at PC282: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Interesting = (UI.getChildControl)((self._ui).static_CategoryItemBg, "StaticText_Interesting")
  -- DECOMPILER ERROR at PC290: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_KnowledgeDesc = (UI.getChildControl)((self._ui).static_CategoryItemBg, "StaticText_KnowledgeDesc")
  -- DECOMPILER ERROR at PC297: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_BottomBg = (UI.getChildControl)(Panel_Window_Knowledge_Renew, "Static_BottomBg")
  -- DECOMPILER ERROR at PC305: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Back_ConsoleUI = (UI.getChildControl)((self._ui).static_BottomBg, "StaticText_Back_ConsoleUI")
  -- DECOMPILER ERROR at PC313: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).button_Back = (UI.getChildControl)((self._ui).static_BottomBg, "Button_Back")
  -- DECOMPILER ERROR at PC321: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_DetailShow_ConsoleUI = (UI.getChildControl)((self._ui).static_BottomBg, "StaticText_DetailShow_ConsoleUI")
  -- DECOMPILER ERROR at PC328: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_TooltipBg = (UI.getChildControl)(Panel_Window_Knowledge_Renew, "StaticText_TooltipBg")
  for index = 0, (self._enum).ePOINT_COUNT - 1 do
    -- DECOMPILER ERROR at PC345: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).toolTip_Point)[index] = (UI.getChildControl)((self._ui).staticText_TooltipBg, "StaticText_" .. index)
    -- DECOMPILER ERROR at PC356: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui).toolTip_PointDesc)[index] = (UI.getChildControl)((self._ui).staticText_TooltipBg, "StaticText_GreDesc_" .. index)
  end
end

Panel_Window_Knowledge_Renew_info.open = function(self, showAni)
  -- function num : 0_5
  if showAni == nil then
    Panel_Window_Knowledge_Renew:SetShow(true, true)
    return 
  else
    Panel_Window_Knowledge_Renew:SetShow(true, showAni)
  end
  FGlobal_Panel_Radar_Show(false, true)
  Panel_TimeBar:SetShow(false, true)
  FGlobal_QuestWidget_Close()
end

Panel_Window_Knowledge_Renew_info.close = function(self, showAni)
  -- function num : 0_6
  if showAni == nil then
    Panel_Window_Knowledge_Renew:SetShow(false, true)
    return 
  else
    Panel_Window_Knowledge_Renew:SetShow(false, showAni)
  end
  FGlobal_Panel_Radar_Show(true, true)
  Panel_TimeBar:SetShow(true, true)
  FGlobal_QuestWidget_Open()
end

Panel_Window_Knowledge_Renew_info.preOpen = function(self)
  -- function num : 0_7
  self:preOpenTooltip()
  self:initValue()
  self:resize()
  self:setTopData()
end

Panel_Window_Knowledge_Renew_info.preOpenTooltip = function(self)
  -- function num : 0_8
  local titleTextSizeX = 0
  local descTextSizeX = 0
  for index = 0, (self._enum).ePOINT_COUNT - 1 do
    titleTextSizeX = (math.max)(titleTextSizeX, (((self._ui).toolTip_Point)[index]):GetTextSizeX())
    descTextSizeX = (math.max)(descTextSizeX, (((self._ui).toolTip_PointDesc)[index]):GetTextSizeX())
  end
  if titleTextSizeX > 70 then
    local dif = ((self._ui).staticText_TooltipBg):GetPosX()
    ;
    ((self._ui).staticText_TooltipBg):SetSize(20 + titleTextSizeX + 5 + descTextSizeX + 10, (self.staticText_TooltipBg):GetSizeY())
    ;
    ((self._ui).staticText_TooltipBg):SetPosX(-10 - ((self._ui).staticText_TooltipBg):GetSizeX())
    for index = 0, (self._enum).ePOINT_COUNT - 1 do
      (((self._ui).toolTip_PointDesc)[index]):SetPosX(20 + titleTextSizeX + 5)
    end
  else
    do
      ;
      ((self._ui).staticText_TooltipBg):SetSize((math.max)(300, 90 + descTextSizeX + 10), ((self._ui).staticText_TooltipBg):GetSizeY())
      ;
      ((self._ui).staticText_TooltipBg):SetPosX(-10 - ((self._ui).staticText_TooltipBg):GetSizeX())
      ;
      ((self._ui).staticText_TooltipBg):SetShow(false)
    end
  end
end

Panel_Window_Knowledge_Renew_info.openTooltip = function(self)
  -- function num : 0_9
  ((self._ui).staticText_TooltipBg):SetShow(true)
end

Panel_Window_Knowledge_Renew_info.closeTooltip = function(self)
  -- function num : 0_10
  ((self._ui).staticText_TooltipBg):SetShow(false)
end

Panel_Window_Knowledge_Renew_info.clearContentPage0 = function(self)
  -- function num : 0_11
  self:initValue()
  ;
  ((self._ui).static_CategoryBg):SetShow(true)
  ;
  ((self._ui).static_SubCategoryBg):SetShow(false)
  ;
  ((self._ui).static_CategoryItemBg):SetShow(false)
end

Panel_Window_Knowledge_Renew_info.clearContentPage1 = function(self)
  -- function num : 0_12
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ((self._value).stepTextList)[1] = ""
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._value).stepTextList)[2] = ""
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step1_lastIndex = -1
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step1_currentIndex = 0
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step1_selectMentalObjectKey = 0
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_useCard = false
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_lastIndex = -1
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_currentIndex = 0
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_selectMentalObjectKey = 0
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step3_lastIndex = -1
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step3_currentIndex = 0
  ;
  ((self._ui).static_CategoryBg):SetShow(false)
  ;
  ((self._ui).static_SubCategoryBg):SetShow(true)
  ;
  ((self._ui).static_CategoryItemBg):SetShow(false)
end

Panel_Window_Knowledge_Renew_info.clearContentPage2 = function(self)
  -- function num : 0_13
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ((self._value).stepTextList)[2] = ""
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_useCard = false
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_lastIndex = -1
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_currentIndex = 0
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step2_selectMentalObjectKey = 0
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step3_lastIndex = -1
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step3_currentIndex = 0
  ;
  ((self._ui).static_CategoryBg):SetShow(false)
  ;
  ((self._ui).static_SubCategoryBg):SetShow(true)
  ;
  ((self._ui).static_CategoryItemBg):SetShow(false)
end

Panel_Window_Knowledge_Renew_info.clearContentPage3 = function(self)
  -- function num : 0_14
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._value).step3_lastIndex = -1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).step3_currentIndex = 0
  ;
  ((self._ui).static_CategoryBg):SetShow(false)
  ;
  ((self._ui).static_SubCategoryBg):SetShow(false)
  ;
  ((self._ui).static_CategoryItemBg):SetShow(true)
end

Panel_Window_Knowledge_Renew_info.setTopData = function(self)
  -- function num : 0_15
  ((self._ui).static_TopBG):SetShow(true)
  local knowledgePoint = ToClient_getKnowledgePoint()
  ;
  ((self._ui).staticText_PointValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WINDOW_KNOWLEDGE_POINT", "knowledgePoint", tostring(knowledgePoint)))
  local battleBuffPercent = ToClient_getBattleExperienceByKnowledgePoint()
  local dropItemBuffPercent = ToClient_getEfficiencyOfDropItemByKnowledgePoint()
  battleBuffPercent = battleBuffPercent / 10000
  dropItemBuffPercent = dropItemBuffPercent / 10000
  local isBattleBuff = ""
  if battleBuffPercent > 0 then
    isBattleBuff = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_MAIN_BATTLEEXPBUFF", "battleBuff", tostring(battleBuffPercent))
  end
  local isDropItemBuff = ""
  if dropItemBuffPercent > 0 then
    isDropItemBuff = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_MAIN_ITEMDROPBUFF", "dropItemBuff", tostring(dropItemBuffPercent))
  end
  local txt_Comma = "\n"
  if battleBuffPercent == 0 then
    txt_Comma = ""
  end
  local isText = isBattleBuff .. txt_Comma .. isDropItemBuff
  if knowledgePoint < 500 then
    isText = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_MAIN_NONEBUFF")
  end
  ;
  ((self._ui).staticText_PointValue):SetText(knowledgePoint)
  ;
  ((self._ui).staticText_EffectValue):SetTextHorizonRight()
  ;
  ((self._ui).staticText_EffectValue):SetText(isText)
end

Panel_Window_Knowledge_Renew_info.updateTopText = function(self)
  -- function num : 0_16
  if (self._value).currentStep == 0 then
    ((self._ui).static_AdressMapBg):SetShow(false)
  else
    local textAll = ""
    local count = (self._value).currentStep - 1
    for index = 0, count do
      if ((self._value).stepTextList)[index] ~= "" then
        textAll = textAll .. ((self._value).stepTextList)[index]
        if count ~= index then
          textAll = textAll .. (self._text).arrow
        end
      else
        index = index + 1
      end
    end
    ;
    ((self._ui).static_AdressMapBg):SetShow(true)
    ;
    ((self._ui).staticText_Depth):SetText(textAll)
  end
end

Panel_Window_Knowledge_Renew_info.setContent = function(self)
  -- function num : 0_17
  if (self._value).currentStep == 0 then
    self:clearContentPage0()
    self:updateTopText()
    self:setContentPage0()
  else
    if (self._value).currentStep == 1 then
      self:clearContentPage1()
      self:updateTopText()
      self:setContentPage1()
    else
      if (self._value).currentStep == 2 then
        self:clearContentPage2()
        self:updateTopText()
        self:setContentPage2()
      else
        if (self._value).currentStep == 3 then
          self:clearContentPage3()
          self:updateTopText()
          self:setContentPage3()
        end
      end
    end
  end
end

Panel_Window_Knowledge_Renew_info.setContentPage0 = function(self)
  -- function num : 0_18 , upvalues : themeKeyKey_ControlMapping
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childKnowledgeCount = knowledge:getMainKnowledgeCount()
  for index = 0, (self._enum).eKNOWLEDGE_MAX - 1 do
    ((((self._ui).button_Category)[index]).button):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_KNOWLEDGE_NOTHING"))
    ;
    ((((self._ui).button_Category)[index]).button):SetEnable(false)
    ;
    ((((self._ui).button_Category)[index]).percent):SetText("")
    ;
    ((((self._ui).button_Category)[index]).button):SetFontColor((Defines.Color).C_FFFFFFFF)
    local iconData = (self._icon)[0]
    ;
    ((((self._ui).button_Category)[index]).icon):ChangeTextureInfoName((self._icon).texture)
    local x1, y1, x2, y2 = setTextureUV_Func((((self._ui).button_Category)[index]).icon, iconData.x1, iconData.y1, iconData.x2, iconData.y2)
    ;
    (((((self._ui).button_Category)[index]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    ((((self._ui).button_Category)[index]).icon):setRenderTexture(((((self._ui).button_Category)[index]).icon):getBaseTexture())
  end
  for index = 0, childKnowledgeCount do
    local mentalCardKeyRaw = knowledge:getMainKnowledgeKeyByIndex(index)
    local mentalObject = knowledge:getThemeByKeyRaw(mentalCardKeyRaw)
    local controlIndex = themeKeyKey_ControlMapping[mentalCardKeyRaw]
    if controlIndex ~= nil then
      ((((self._ui).button_Category)[index]).button):SetEnable(true)
      if (self._icon)[mentalCardKeyRaw] ~= nil then
        local iconData = (self._icon)[mentalCardKeyRaw]
        ;
        ((((self._ui).button_Category)[controlIndex]).icon):ChangeTextureInfoName((self._icon).texture)
        local x1, y1, x2, y2 = setTextureUV_Func((((self._ui).button_Category)[controlIndex]).icon, iconData.x1, iconData.y1, iconData.x2, iconData.y2)
        ;
        (((((self._ui).button_Category)[controlIndex]).icon):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        ((((self._ui).button_Category)[controlIndex]).icon):setRenderTexture(((((self._ui).button_Category)[controlIndex]).icon):getBaseTexture())
      end
      do
        ;
        ((((self._ui).button_Category)[controlIndex]).button):SetEnable(true)
        local mentalObject = knowledge:getThemeByKeyRaw(mentalCardKeyRaw)
        local categoryName = mentalObject:getName()
        if mentalObject:getCardCollectedCount() == mentalObject:getCardCollectMaxCount() then
          collected_complete = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_LIST_COMPLETE")
          ;
          ((((self._ui).button_Category)[controlIndex]).button):SetFontColor((Defines.Color).C_FF6DC6FF)
        else
          collected_complete = ""
        end
        do
          local percent = mentalObject:getCardCollectPercents()
          -- DECOMPILER ERROR at PC203: Confused about usage of register: R13 in 'UnsetPending'

          ;
          (((self._ui).button_Category)[controlIndex]).mentalCardKeyRaw = mentalCardKeyRaw
          ;
          ((((self._ui).button_Category)[controlIndex]).button):SetText(categoryName .. collected_complete)
          ;
          ((((self._ui).button_Category)[controlIndex]).percent):SetText(percent .. "%")
          ;
          ((((self._ui).button_Category)[index]).button):addInputEvent("Mouse_On", "PaGlobalFunc_Window_Knowledge_Page0_SelectButton(" .. controlIndex .. ")")
          ;
          ((((self._ui).button_Category)[controlIndex]).button):addInputEvent("Mouse_LUp", "PaGlobalFunc_Window_Knowledge_Page0_ClickButton(" .. controlIndex .. ",\"" .. categoryName .. "\"" .. ")")
          -- DECOMPILER ERROR at PC247: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC247: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC247: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

Panel_Window_Knowledge_Renew_info.setContentPage1 = function(self)
  -- function num : 0_19
  local title = ((self._value).stepTextList)[(self._enum).eSTEP_CATEGORY]
  ;
  ((self._ui).staticText_Title_1):SetText(title)
  ;
  (((self._ui).list2_Category):getElementManager()):clearKey()
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childCount = knowledge:getCurrentThemeChildThemeCount()
  if childCount == 0 then
    return 
  end
  for index = 0, childCount - 1 do
    (((self._ui).list2_Category):getElementManager()):pushKey(toInt64(0, index))
    ;
    ((self._ui).list2_Category):requestUpdateByKey(toInt64(0, index))
  end
end

Panel_Window_Knowledge_Renew_info.setContentPage2 = function(self)
  -- function num : 0_20
  local title = ((self._value).stepTextList)[(self._enum).eSETP_SUBCATEGORY]
  ;
  ((self._ui).staticText_Title_1):SetText(title)
  ;
  (((self._ui).list2_Category):getElementManager()):clearKey()
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childCount = knowledge:getCurrentThemeChildThemeCount()
  if childCount == 0 then
    childCount = knowledge:getCurrentThemeChildCardCount()
    if childCount == 0 then
      return 
    else
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (self._value).step2_useCard = true
      PaGlobalFunc_Window_Knowledge_Page2_Pass()
    end
  end
  for index = 0, childCount - 1 do
    (((self._ui).list2_Category):getElementManager()):pushKey(toInt64(0, index))
    ;
    ((self._ui).list2_Category):requestUpdateByKey(toInt64(0, index))
  end
end

Panel_Window_Knowledge_Renew_info.setContentPage3 = function(self)
  -- function num : 0_21
  local title = nil
  if (self._value).step2_useCard == false then
    title = ((self._value).stepTextList)[(self._enum).eSTEP_GROUP_1]
  else
    title = ((self._value).stepTextList)[(self._enum).eSETP_SUBCATEGORY]
  end
  ;
  ((self._ui).staticText_Title_2):SetText(title)
  ;
  (((self._ui).list2_CategoryItem):getElementManager()):clearKey()
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childCount = knowledge:getCurrentThemeChildCardCount()
  if childCount == 0 then
    return 
  end
  for index = 0, childCount - 1 do
    (((self._ui).list2_CategoryItem):getElementManager()):pushKey(toInt64(0, index))
    ;
    ((self._ui).list2_CategoryItem):requestUpdateByKey(toInt64(0, index))
  end
  self:setContentPage3_bottom()
end

Panel_Window_Knowledge_Renew_info.setContentPage3_bottom = function(self)
  -- function num : 0_22
  local currentIndex = (self._value).step3_currentIndex
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childkey = knowledge:getCurrentThemeChildCardKeyByIndex(currentIndex)
  local card = knowledge:getCardByKeyRaw(childkey)
  ;
  ((self._ui).static_KnowledgeImage):ChangeTextureInfoName(card:getPicture())
  ;
  ((self._ui).staticText_KnowledgeName):SetText(card:getName())
  ;
  ((self._ui).staticText_KnowledgeDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).staticText_KnowledgeDesc):SetText(card:getDescription())
  local favoritedList = ""
  local isFirst = true
  local npcpersonalityStaticWrapper = card:getNpcPersonalityStaticStatus()
  if npcpersonalityStaticWrapper == nil then
    ((self._ui).staticText_Interesting):SetShow(false)
  else
    local count = npcpersonalityStaticWrapper:getFavoritedThemeCount()
    for index = 0, count - 1 do
      local favoritedName = npcpersonalityStaticWrapper:getFavoritedThemeNameByIndex(index)
      if isFirst then
        favoritedList = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Knowledge_FavoritedList", "favoritedName", favoritedName)
        isFirst = false
      else
        favoritedList = favoritedList .. "," .. favoritedName
      end
    end
    ;
    ((self._ui).staticText_Interesting):SetShow(true)
    ;
    ((self._ui).staticText_Interesting):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
    ;
    ((self._ui).staticText_Interesting):SetText(favoritedList)
  end
  do
    ;
    ((self._ui).staticText_Impression):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_FAVOR") .. " : " .. card:getMinDd() .. "~" .. card:getMaxDd())
    ;
    ((self._ui).staticText_Interest):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_INTERESTING") .. " : " .. card:getHit())
  end
end

PaGlobalFunc_Window_Knowledge_Renew_ShowAni = function()
  -- function num : 0_23 , upvalues : Panel_Window_Knowledge_Renew_info
  audioPostEvent_SystemUi(1, 1)
  local self = Panel_Window_Knowledge_Renew_info
  Panel_Window_Knowledge_Renew:ResetVertexAni()
  local aniInfo1 = Panel_Window_Knowledge_Renew:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartPosition(getScreenSizeX(), 0)
  aniInfo1:SetEndPosition(getScreenSizeX() - Panel_Window_Knowledge_Renew:GetSizeX(), 0)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(false)
  aniInfo1:SetDisableWhileAni(true)
  aniInfo1:SetIgnoreUpdateSnapping(true)
end

PaGlobalFunc_Window_Knowledge_Renew_HideAni = function()
  -- function num : 0_24
  audioPostEvent_SystemUi(1, 1)
  Panel_Window_Knowledge_Renew:ResetVertexAni()
  local aniInfo1 = Panel_Window_Knowledge_Renew:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartPosition(Panel_Window_Knowledge_Renew:GetPosX(), 0)
  aniInfo1:SetEndPosition(Panel_Window_Knowledge_Renew:GetPosX() + Panel_Window_Knowledge_Renew:GetSizeX(), 0)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  aniInfo1:SetIgnoreUpdateSnapping(true)
end

PaGlobalFunc_Window_Knowledge_GetShow = function()
  -- function num : 0_25
  return Panel_Window_Knowledge_Renew:GetShow()
end

PaGlobalFunc_Window_Knowledge_Show = function()
  -- function num : 0_26 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  self:preOpen()
  self:open(true)
  self:setContent()
end

PaGlobalFunc_Window_Knowledge_Exit = function()
  -- function num : 0_27 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  self:close(true)
end

PaGlobalFunc_Window_Knowledge_GOBackStep = function()
  -- function num : 0_28 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currentStep = (self._value).currentStep - 1
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  if (self._value).currentStep == (self._enum).eSTEP_GROUP_1 then
    if (self._value).step2_useCard == true then
      (self._value).currentStep = (self._value).currentStep - 1
    else
      local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
      local theme = knowledge:getThemeByKeyRaw((self._value).step1_selectMentalObjectKey)
      knowledge:setCurrentTheme(theme)
      self:setContent()
      return 
    end
  end
  do
    if (self._value).currentStep == (self._enum).eSETP_SUBCATEGORY then
      local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
      local theme = knowledge:getThemeByKeyRaw((self._value).step0_selectMentalObjectKey)
      knowledge:setCurrentTheme(theme)
      self:setContent()
      return 
    end
    do
      if (self._enum).eSTEP_CATEGORY == (self._value).currentStep then
        self:setContent()
        return 
      end
      -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

      if (self._value).currentStep < 0 then
        (self._value).currentStep = (self._enum).eSTEP_CATEGORY
        PaGlobalFunc_Window_Knowledge_Exit()
      end
    end
  end
end

PaGlobalFunc_Window_Knowledge_Page2_Pass = function()
  -- function num : 0_29 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currentStep = (self._enum).eSTEP_GROUP_2
  self:updateTopText()
  self:setContent()
end

PaGlobalFunc_Window_Knowledge_Page3_SelectButton = function(index)
  -- function num : 0_30 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).step3_lastIndex = (self._value).step3_currentIndex
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).step3_currentIndex = index
  ;
  ((self._ui).list2_CategoryItem):requestUpdateByKey(toInt64(0, (self._value).step3_lastIndex))
  ;
  ((self._ui).list2_CategoryItem):requestUpdateByKey(toInt64(0, (self._value).step3_currentIndex))
end

PaGlobalFunc_Window_Knowledge_Page3_ClickButton = function(index)
  -- function num : 0_31 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  PaGlobalFunc_Window_Knowledge_Page3_SelectButton(index)
  self:setContentPage3_bottom()
end

PaGlobalFunc_Window_Knowledge_Page2_SelectButton = function(index)
  -- function num : 0_32 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).step2_lastIndex = (self._value).step2_currentIndex
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).step2_currentIndex = index
  ;
  ((self._ui).list2_Category):requestUpdateByKey(toInt64(0, (self._value).step2_lastIndex))
  ;
  ((self._ui).list2_Category):requestUpdateByKey(toInt64(0, (self._value).step2_currentIndex))
end

PaGlobalFunc_Window_Knowledge_Page2_ClickButton = function(index, subCategory)
  -- function num : 0_33 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  PaGlobalFunc_Window_Knowledge_Page2_SelectButton(index)
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._value).stepTextList)[(self._enum).eSTEP_GROUP_1] = subCategory
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).currentStep = (self._enum).eSTEP_GROUP_2
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childkey = knowledge:getCurrentThemeChildThemeKeyByIndex(index)
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._value).step2_selectMentalObjectKey = childkey
  local mentalObjectKey = (self._value).step2_selectMentalObjectKey
  if mentalObjectKey > 0 then
    local theme = knowledge:getThemeByKeyRaw(mentalObjectKey)
    if theme == nil then
      return 
    end
    knowledge:setCurrentTheme(theme)
    self:updateTopText()
    self:setContent()
  end
end

PaGlobalFunc_Window_Knowledge_Page1_SelectButton = function(index)
  -- function num : 0_34 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).step1_lastIndex = (self._value).step1_currentIndex
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).step1_currentIndex = index
  ;
  ((self._ui).list2_Category):requestUpdateByKey(toInt64(0, (self._value).step1_lastIndex))
  ;
  ((self._ui).list2_Category):requestUpdateByKey(toInt64(0, (self._value).step1_currentIndex))
end

PaGlobalFunc_Window_Knowledge_Page1_ClickButton = function(index, subCategory)
  -- function num : 0_35 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  PaGlobalFunc_Window_Knowledge_Page1_SelectButton(index)
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._value).stepTextList)[(self._enum).eSETP_SUBCATEGORY] = subCategory
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).currentStep = (self._enum).eSTEP_GROUP_1
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childkey = knowledge:getCurrentThemeChildThemeKeyByIndex(index)
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._value).step1_selectMentalObjectKey = childkey
  local mentalObjectKey = (self._value).step1_selectMentalObjectKey
  if mentalObjectKey > 0 then
    local theme = knowledge:getThemeByKeyRaw(mentalObjectKey)
    if theme == nil then
      return 
    end
    knowledge:setCurrentTheme(theme)
    self:updateTopText()
    self:setContent()
  end
end

PaGlobalFunc_Window_Knowledge_Page0_SelectButton = function(index)
  -- function num : 0_36 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).step0_currentIndex = index
end

PaGlobalFunc_Window_Knowledge_Page0_ClickButton = function(index, category)
  -- function num : 0_37 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  PaGlobalFunc_Window_Knowledge_Page0_SelectButton(index)
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._value).stepTextList)[(self._enum).eSTEP_CATEGORY] = category
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).currentStep = (self._enum).eSETP_SUBCATEGORY
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).step0_selectMentalObjectKey = (((self._ui).button_Category)[index]).mentalCardKeyRaw
  if (self._value).step0_selectMentalObjectKey == 0 then
    return 
  end
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local mentalObjectKey = (self._value).step0_selectMentalObjectKey
  if mentalObjectKey > 0 then
    local theme = knowledge:getThemeByKeyRaw(mentalObjectKey)
    if theme == nil then
      return 
    end
    knowledge:setCurrentTheme(theme)
    self:updateTopText()
    self:setContent()
  end
end

PaGlobalFunc_Window_Knowledge_Step_1And2List = function(list_content, key)
  -- function num : 0_38 , upvalues : Panel_Window_Knowledge_Renew_info
  local id = Int64toInt32(key)
  local button = (UI.getChildControl)(list_content, "Button_CategoryName")
  local energyIcon = (UI.getChildControl)(list_content, "StaticText_EnergyIcon")
  local key_A = (UI.getChildControl)(list_content, "Static_Key_ConsoleUI")
  local self = Panel_Window_Knowledge_Renew_info
  key_A:SetShow(false)
  button:SetFontColor((Defines.Color).C_FFFFFFFF)
  if (self._enum).eSETP_SUBCATEGORY == (self._value).currentStep then
    if (self._value).step1_currentIndex == (self._value).step1_lastIndex then
      key_A:SetShow(true)
    else
      if (self._value).step1_currentIndex == id then
        key_A:SetShow(true)
      end
      if (self._value).step1_lastIndex == id then
        key_A:SetShow(false)
      end
    end
    energyIcon:SetShow(false)
    local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
    local childkey = knowledge:getCurrentThemeChildThemeKeyByIndex(id)
    local theme = knowledge:getThemeByKeyRaw(childkey)
    local subCategoryName = theme:getName()
    local addText = ""
    if theme:getMaxIncreaseWp() > 0 then
      addText = addText .. PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Knowledge_TalkingPowerUp", "increaseWp", theme:getIncreaseWp() .. "/" .. theme:getMaxIncreaseWp() .. " ")
    end
    local collected_complete = nil
    if theme:getCardCollectedCount() == theme:getCardCollectMaxCount() then
      addText = addText .. PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_LIST_COMPLETE")
      button:SetFontColor((Defines.Color).C_FF6DC6FF)
    else
      addText = addText .. ""
    end
    button:SetText(subCategoryName .. addText)
    button:addInputEvent("Mouse_On", "PaGlobalFunc_Window_Knowledge_Page1_SelectButton(" .. id .. ",\"" .. subCategoryName .. "\"" .. ")")
    button:addInputEvent("Mouse_LUp", "PaGlobalFunc_Window_Knowledge_Page1_ClickButton(" .. id .. ",\"" .. subCategoryName .. "\"" .. ")")
  end
  do
    if (self._enum).eSTEP_GROUP_1 == (self._value).currentStep then
      if (self._value).step2_currentIndex == (self._value).step2_lastIndex then
        key_A:SetShow(true)
      else
        if (self._value).step2_currentIndex == id then
          key_A:SetShow(true)
        end
        if (self._value).step2_lastIndex == id then
          key_A:SetShow(false)
        end
      end
      energyIcon:SetShow(false)
      local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
      if (self._value).step2_useCard == false then
        local childkey = knowledge:getCurrentThemeChildThemeKeyByIndex(id)
        local theme = knowledge:getThemeByKeyRaw(childkey)
        local subCategoryName = theme:getName()
        local addText = ""
        if theme:getMaxIncreaseWp() > 0 then
          addText = addText .. PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Knowledge_TalkingPowerUp", "increaseWp", theme:getIncreaseWp() .. "/" .. theme:getMaxIncreaseWp() .. " ")
        end
        if theme:getCardCollectedCount() == theme:getCardCollectMaxCount() then
          addText = addText .. PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_LIST_COMPLETE")
          button:SetFontColor((Defines.Color).C_FF6DC6FF)
        else
          addText = addText .. ""
        end
        button:SetText(subCategoryName .. addText)
        button:addInputEvent("Mouse_On", "PaGlobalFunc_Window_Knowledge_Page2_SelectButton(" .. id .. ",\"" .. subCategoryName .. "\"" .. ")")
        button:addInputEvent("Mouse_LUp", "PaGlobalFunc_Window_Knowledge_Page2_ClickButton(" .. id .. ",\"" .. subCategoryName .. "\"" .. ")")
      end
    end
  end
end

PaGlobalFunc_Window_Knowledge_Step_3List = function(list_content, key)
  -- function num : 0_39 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  local id = Int64toInt32(key)
  local button = (UI.getChildControl)(list_content, "Button_CategoryItemName")
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childkey = knowledge:getCurrentThemeChildCardKeyByIndex(id)
  local card = knowledge:getCardByKeyRaw(childkey)
  local cardName = card:getName()
  button:SetText(cardName)
  button:addInputEvent("Mouse_On", "PaGlobalFunc_Window_Knowledge_Page3_ClickButton(" .. id .. ")")
end

PaGlobalFunc_Window_Knowledge_ToggleTooltip = function()
  -- function num : 0_40 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  if ((self._ui).staticText_TooltipBg):GetShow() == true then
    self:closeTooltip()
  else
    self:openTooltip()
  end
end

FromClient_Window_Knowledge_Renew_Init = function()
  -- function num : 0_41 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  self:initialize()
  Panel_Window_Knowledge_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobalFunc_Window_Knowledge_ToggleTooltip()")
end

FromClient_Window_Knowledge_Renew_Resize = function()
  -- function num : 0_42 , upvalues : Panel_Window_Knowledge_Renew_info
  local self = Panel_Window_Knowledge_Renew_info
  self:resize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_Window_Knowledge_Renew_Init")

