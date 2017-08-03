-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_dialog_main.luac 

-- params : ...
-- function num : 0
Panel_Npc_Dialog:SetShow(false)
Panel_Npc_Dialog:setGlassBackground(true)
Panel_Npc_Dialog:setFlushAble(false)
Panel_Npc_Dialog:RegisterShowEventFunc(true, "NpcDialogShowAni()")
Panel_Npc_Dialog:RegisterShowEventFunc(false, "NpcDialogHideAni()")
FGlobal_Dialog_renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_Dialog}, false)
FGlobal_Dialog_SetRenderMode = function(renderModeList)
  -- function num : 0_0
  FGlobal_Dialog_renderMode:setRenderMode(renderModeList)
end

FGlobal_Dialog_ResetRenderMode = function()
  -- function num : 0_1
  FGlobal_Dialog_renderMode:reset()
end

local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_DS = CppEnums.DialogState
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_BTN_TYPE = CppEnums.DialogButtonType
local UI_PD = CppEnums.Padding
local getScrX = getScreenSizeX()
local getScrY = getScreenSizeY()
local _mainDialog = {}
local _currentLine = 0
local _maxLine = 0
local _equipRewardCount = 0
local giftIcon = {}
local _ignoreShowDialog = false
local _doConfirmIndex = 0
local _isQuestComplete = false
local isFirstShowTooltip = true
local _math_AddVectorToVector = (Util.Math).AddVectorToVector
local _math_MulNumberToVector = (Util.Math).MulNumberToVector
local isAuctionDialog = false
local isReContactDialog = false
local isDialogFunctionQuest = false
local _questDialogButtonIndex = -1
local isExchangeButtonIndex = {}
local isPromiseToken = {}
local _exchangalbeButtonIndex = -1
local _skillTutorial = false
local handleClickedQuestComplete = false
local nextQuestFunctionBtnClick = {}
local isAllowTutorialPanelShow = false
local warehouseIndex = -1
local tradeIndex = -1
local uv = {
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 1, x2 = 122, y2 = 61}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 62, x2 = 122, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 1, y1 = 62, x2 = 61, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 62, x2 = 122, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_02.dds", x1 = 1, y1 = 1, x2 = 61, y2 = 61}
; 
[0] = {_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 1, y1 = 1, x2 = 61, y2 = 61}
}
local _shopType = {eShopType_None = 0, eShopType_Potion = 1, eShopType_Weapon = 2, eShopType_Jewel = 3, eShopType_Furniture = 4, eShopType_Collect = 5, eShopType_Fish = 6, eShopType_Worker = 7, eShopType_Alchemy = 8, eShopType_Cook = 9, eShopType_PC = 10, eShopType_Grocery = 11, eShopType_RandomShop = 12, eShopType_DayRandomShop = 13, eShopType_Count = 14}
local _dialogIndex = 0
FGlobal_Dialog_SetAllowTutorialPanelShow = function(bShow)
  -- function num : 0_2 , upvalues : isAllowTutorialPanelShow
  isAllowTutorialPanelShow = bShow
end

FGlobal_Dialog_IsAllowTutorialPanelShow = function()
  -- function num : 0_3 , upvalues : isAllowTutorialPanelShow
  return isAllowTutorialPanelShow
end

local _uiNpcTitle = (UI.getChildControl)(Panel_Npc_Dialog, "Static_NPC")
local _uiNpcName = (UI.getChildControl)(Panel_Npc_Dialog, "Static_NPC_Name")
local _uiNpcDialog = (UI.getChildControl)(Panel_Npc_Dialog, "Static_NPC_Content")
local _uiDialogButton = {}
local _uiDialogIcon = {}
local _uiFuncButton = {}
local _uiFuncBG = {}
local _uiNoticeNeedInfo = {}
local _uiNeedWpAni = {}
local _uiIntimacyIcon = {}
local _styleNormalTalkButton = (UI.getChildControl)(Panel_Npc_Dialog, "style_Button_Original")
local _styleExploreTalkButton = (UI.getChildControl)(Panel_Npc_Dialog, "style_Button_Explore")
local _styleDialogButtonIcon = (UI.getChildControl)(Panel_Npc_Dialog, "Static_DialogButtonIcon")
local _styleNoticeNeedInfo = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_Notice")
local _styleNeedWpAni = (UI.getChildControl)(Panel_Npc_Dialog, "Static_NeedWpAni")
local _SpacebarIcon = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_Spacebar")
local _uiNextButton = (UI.getChildControl)(Panel_Npc_Dialog, "Button_Next")
local _uiButtonExit = (UI.getChildControl)(Panel_Npc_Dialog, "Button_Exit")
local _uiButtonBack = (UI.getChildControl)(Panel_Npc_Dialog, "Button_Back")
local _txt_intimacy = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_Intimacy")
local _intimacyFruitageValue = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_Fruitage_Value")
local _intimacyCircularProgress = (UI.getChildControl)(Panel_Npc_Dialog, "CircularProgress_Current")
local _intimacyProgressBG = (UI.getChildControl)(Panel_Npc_Dialog, "Static_ProgressBG")
local _intimacyGiftIcon = (UI.getChildControl)(Panel_Npc_Dialog, "Static_GiftIcon")
local _intimacyButtonIcon = (UI.getChildControl)(Panel_Npc_Dialog, "Static_Intimacy")
local intimacyNotice = (UI.getChildControl)(Panel_Npc_Dialog, "Static_Notice")
local intimacyNoticeStyle = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_IntimacyNotice")
local _txt_EnchantHelp = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_EnchantMsg")
local _txt_EnchantHelp_Desc = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_EnchantMsg_Desc")
local _txt_SocketHelp = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_SocketMsg")
local _txt_SocketHelp_Desc = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_SocketMsg_Desc")
local giftNotice = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_GiftNotice")
local _wpHelp = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_BubbleBox")
local _uiHalfLine = (UI.getChildControl)(Panel_Npc_Dialog, "Static_HalfLine")
local _prevPageButton = (UI.getChildControl)(Panel_Npc_Dialog, "Button_PrevPage")
local _nextPageButton = (UI.getChildControl)(Panel_Npc_Dialog, "Button_NextPage")
local _pageValue = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_PageValue")
local _scrollControl = (UI.getChildControl)(Panel_Npc_Dialog, "Static_ContolForScroll")
local _staticTutorialMenuBG = (UI.getChildControl)(Panel_Npc_Dialog, "Static_Dialog_TutorialMenu_BG")
local _buttonTutorialMenu = (UI.getChildControl)(Panel_Npc_Dialog, "Button_Dialog_TutorialMenu")
local _staticTutorialTriDeco = (UI.getChildControl)(Panel_Npc_Dialog, "Static_Dialog_TriangleDecoration")
local _tutorialStartButtonList = {}
local _tutorialMenuButtonMarginSize = 5
local dialogShowCheck_Once = false
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_DialogMain")
FromClient_luaLoadComplete_DialogMain = function()
  -- function num : 0_4 , upvalues : _uiNpcDialog, _buttonTutorialMenu
  FGlobal_Dialog_TutorialStartButton_Init()
  _uiNpcDialog:SetIgnore(false)
  _buttonTutorialMenu:addInputEvent("Mouse_LUp", "FGlobal_Dialog_HandleClicked_TutorialMenuButton()")
end

FGlobal_Dialog_TutorialStartButton_Init = function()
  -- function num : 0_5 , upvalues : _tutorialStartButtonList
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  _tutorialStartButtonList[1] = (UI.getChildControl)(Panel_Npc_Dialog, "Button_TutorialStart_1")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  _tutorialStartButtonList[2] = (UI.getChildControl)(Panel_Npc_Dialog, "Button_TutorialStart_2")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  _tutorialStartButtonList[3] = (UI.getChildControl)(Panel_Npc_Dialog, "Button_TutorialStart_3")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  _tutorialStartButtonList[4] = (UI.getChildControl)(Panel_Npc_Dialog, "Button_TutorialStart_4")
  ;
  (_tutorialStartButtonList[1]):addInputEvent("Mouse_LUp", "FGlobal_Dialog_HandleClicked_TutorialStartButton(1)")
  ;
  (_tutorialStartButtonList[2]):addInputEvent("Mouse_LUp", "FGlobal_Dialog_HandleClicked_TutorialStartButton(2)")
  ;
  (_tutorialStartButtonList[3]):addInputEvent("Mouse_LUp", "FGlobal_Dialog_HandleClicked_TutorialStartButton(3)")
  ;
  (_tutorialStartButtonList[4]):addInputEvent("Mouse_LUp", "FGlobal_Dialog_HandleClicked_TutorialStartButton(4)")
end

FGlobal_Dialog_ShowTutorialMenuButton = function()
  -- function num : 0_6 , upvalues : _tutorialMenuButtonMarginSize, _buttonTutorialMenu, _staticTutorialMenuBG, _staticTutorialTriDeco
  FGlobal_Dialog_FoldTutorialMenu(_tutorialMenuButtonMarginSize)
  _buttonTutorialMenu:SetShow(true, true)
  _staticTutorialMenuBG:SetShow(true, true)
  _staticTutorialTriDeco:SetShow(true, true)
  local triDecoPosX = Panel_Npc_Dialog:GetSizeX() / 2 - _staticTutorialTriDeco:GetSizeX() / 2
  _staticTutorialTriDeco:SetPosX(triDecoPosX - 1)
  _staticTutorialTriDeco:SetPosY(-_tutorialMenuButtonMarginSize)
  _buttonTutorialMenu:AddEffect("UI_ItemInstall", false, 0, 0)
end

FGlobal_Dialog_HideTutorialMenuButton = function()
  -- function num : 0_7 , upvalues : _buttonTutorialMenu, _staticTutorialMenuBG, _staticTutorialTriDeco
  _buttonTutorialMenu:SetShow(false, true)
  _staticTutorialMenuBG:SetShow(false, false)
  _staticTutorialTriDeco:SetShow(false, false)
  FGlobal_Dialog_HideTutorialStartButtonList()
end

FGlobal_Dialog_HandleClicked_TutorialMenuButton = function()
  -- function num : 0_8 , upvalues : _buttonTutorialMenu, _tutorialStartButtonList
  _buttonTutorialMenu:AddEffect("fUI_Light", false, 0, 0)
  local isShown = false
  for key,value in pairs(_tutorialStartButtonList) do
    if value:GetShow() == true then
      isShown = true
      break
    end
  end
  do
    if isShown == true then
      FGlobal_Dialog_HideTutorialStartButtonList()
    else
      if isShown == false then
        FGlobal_Dialog_ShowTutorialStartButtonList()
      end
    end
  end
end

FGlobal_Dialog_CheckConditionTutorialMenuButton = function()
  -- function num : 0_9
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel >= 10 and playerLevel <= 40 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Shop) ~= -1 then
    local talker = dialog_getTalker()
    if talker == nil then
      return false
    end
    local actorProxyWrapper = getNpcActor(talker:getActorKey())
    if actorProxyWrapper == nil then
      return false
    end
    local characterSSW = actorProxyWrapper:getCharacterStaticStatusWrapper()
    if characterSSW == nil then
      return false
    end
    if characterSSW:isSellingNormalShop() == true then
      return true
    end
  end
  do
    if playerLevel >= 25 and playerLevel <= 53 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant) ~= -1 then
      return true
    end
    if playerLevel >= 40 and playerLevel <= 56 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Extract) ~= -1 then
      return true
    end
    if playerLevel >= 50 and playerLevel <= 56 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant) ~= -1 then
      return true
    end
    return false
  end
end

FGlobal_Dialog_ShowTutorialStartButtonList = function()
  -- function num : 0_10 , upvalues : _tutorialMenuButtonMarginSize, UI_ANI_ADV, _tutorialStartButtonList
  FGlobal_Dialog_HideTutorialStartButtonList()
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  local orderNum = 1
  local marginSize = _tutorialMenuButtonMarginSize
  local lastButtonPosY = 0
  local placePos = function(tutorialStartButton, orderNum)
    -- function num : 0_10_0 , upvalues : marginSize, UI_ANI_ADV, lastButtonPosY
    local endTime = 0.25
    local startPosX = Panel_Npc_Dialog:GetSizeX() / 2 - tutorialStartButton:GetSizeX() / 2
    local endPosX = Panel_Npc_Dialog:GetSizeX() / 2 - tutorialStartButton:GetSizeX() / 2
    local startPosY = tutorialStartButton:GetSizeY() * -1
    local endPosY = orderNum * (tutorialStartButton:GetSizeY() + marginSize) * -1
    tutorialStartButton:SetPosX(startPosX)
    tutorialStartButton:SetPosY(startPosY)
    tutorialStartButton:SetShow(true)
    local aniMove = tutorialStartButton:addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    aniMove:SetStartPosition(startPosX, startPosY)
    aniMove:SetEndPosition(endPosX, endPosY)
    aniMove:SetDisableWhileAni(true)
    lastButtonPosY = endPosY
  end

  if playerLevel >= 10 and playerLevel <= 40 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Shop) ~= -1 then
    local talker = dialog_getTalker()
    if talker == nil then
      return false
    end
    local actorProxyWrapper = getNpcActor(talker:getActorKey())
    if actorProxyWrapper == nil then
      return false
    end
    local characterSSW = actorProxyWrapper:getCharacterStaticStatusWrapper()
    if characterSSW == nil then
      return false
    end
    if characterSSW:isSellingNormalShop() == true then
      placePos(_tutorialStartButtonList[1], orderNum)
      orderNum = orderNum + 1
    end
  end
  do
    if playerLevel >= 25 and playerLevel <= 53 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant) ~= -1 then
      placePos(_tutorialStartButtonList[2], orderNum)
      orderNum = orderNum + 1
    end
    if playerLevel >= 40 and playerLevel <= 56 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Extract) ~= -1 then
      placePos(_tutorialStartButtonList[3], orderNum)
      orderNum = orderNum + 1
    end
    if playerLevel >= 50 and playerLevel <= 56 and FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Enchant) ~= -1 then
      placePos(_tutorialStartButtonList[4], orderNum)
      orderNum = orderNum + 1
    end
    FGlobal_Dialog_UnfoldTutorialMenu(lastButtonPosY, marginSize)
  end
end

FGlobal_Dialog_UnfoldTutorialMenu = function(lastButtonPosY, marginSize)
  -- function num : 0_11 , upvalues : _staticTutorialMenuBG, _buttonTutorialMenu, UI_ANI_ADV
  local endTime = 0.25
  local menuBG_StartPosX = Panel_Npc_Dialog:GetSizeX() / 2 - _staticTutorialMenuBG:GetSizeX() / 2
  local menuBG_StartPosY = -_buttonTutorialMenu:GetSizeY() / 2 - marginSize
  local menuBG_EndPosX = menuBG_StartPosX
  local menuBG_EndPosY = lastButtonPosY - marginSize - _buttonTutorialMenu:GetSizeY() / 2
  local aniMoveMenuBG = _staticTutorialMenuBG:addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniMoveMenuBG:SetStartPosition(menuBG_StartPosX, menuBG_StartPosY)
  aniMoveMenuBG:SetEndPosition(menuBG_EndPosX, menuBG_EndPosY)
  aniMoveMenuBG:SetDisableWhileAni(true)
  _staticTutorialMenuBG:SetSize(_staticTutorialMenuBG:GetSizeX(), (math.abs)(menuBG_EndPosY))
  local menuButton_StartPosX = Panel_Npc_Dialog:GetSizeX() / 2 - _buttonTutorialMenu:GetSizeX() / 2 - 1
  local menuButton_StartPosY = menuBG_StartPosY - _buttonTutorialMenu:GetSizeY() / 2 + 1
  local menuButton_EndPosX = menuButton_StartPosX
  local menuButton_EndPosY = menuBG_EndPosY - _buttonTutorialMenu:GetSizeY() / 2 + 1
  local aniMoveMenuButton = _buttonTutorialMenu:addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniMoveMenuButton:SetStartPosition(menuButton_StartPosX, menuButton_StartPosY)
  aniMoveMenuButton:SetEndPosition(menuButton_EndPosX, menuButton_EndPosY)
  aniMoveMenuButton:SetDisableWhileAni(true)
end

FGlobal_Dialog_FoldTutorialMenu = function(marginSize)
  -- function num : 0_12 , upvalues : _staticTutorialMenuBG, _buttonTutorialMenu, UI_ANI_ADV
  local endTime = 0.25
  local menuBG_StartPosX = Panel_Npc_Dialog:GetSizeX() / 2 - _staticTutorialMenuBG:GetSizeX() / 2
  local menuBG_StartPosY = _staticTutorialMenuBG:GetPosY()
  local menuBG_EndPosX = menuBG_StartPosX
  local menuBG_EndPosY = -_buttonTutorialMenu:GetSizeY() / 2 - marginSize
  local aniMoveMenuBG = _staticTutorialMenuBG:addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniMoveMenuBG:SetStartPosition(menuBG_StartPosX, menuBG_StartPosY)
  aniMoveMenuBG:SetEndPosition(menuBG_EndPosX, menuBG_EndPosY)
  aniMoveMenuBG:SetDisableWhileAni(true)
  _staticTutorialMenuBG:SetSize(_staticTutorialMenuBG:GetSizeX(), (math.abs)(menuBG_EndPosY))
  local menuButton_StartPosX = Panel_Npc_Dialog:GetSizeX() / 2 - _buttonTutorialMenu:GetSizeX() / 2 - 1
  local menuButton_StartPosY = _buttonTutorialMenu:GetPosY()
  local menuButton_EndPosX = menuButton_StartPosX
  local menuButton_EndPosY = menuBG_EndPosY - _buttonTutorialMenu:GetSizeY() / 2 + 1
  local aniMoveMenuButton = _buttonTutorialMenu:addMoveAnimation(0, endTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniMoveMenuButton:SetStartPosition(menuButton_StartPosX, menuButton_StartPosY)
  aniMoveMenuButton:SetEndPosition(menuButton_EndPosX, menuButton_EndPosY)
  aniMoveMenuButton:SetDisableWhileAni(true)
end

FGlobal_Dialog_HideTutorialStartButtonList = function()
  -- function num : 0_13 , upvalues : _tutorialStartButtonList, _tutorialMenuButtonMarginSize
  for key,value in pairs(_tutorialStartButtonList) do
    value:SetShow(false)
  end
  FGlobal_Dialog_FoldTutorialMenu(_tutorialMenuButtonMarginSize)
end

FGlobal_Dialog_HandleClicked_TutorialStartButton = function(listIndex)
  -- function num : 0_14
  FGlobal_Dialog_HideTutorialStartButtonList()
  local phaseNo = -1
  if listIndex == 1 then
    phaseNo = 21
  else
    if listIndex == 2 then
      phaseNo = 18
    else
      if listIndex == 3 then
        phaseNo = 19
      else
        if listIndex == 4 then
          phaseNo = 22
        else
          _PA_LOG("곽민�\176", "다이얼로�\184 튜토리얼 시작버튼�\152 번호�\128 잘못 되었습니�\164. listIndex : " .. tostring(listIndex))
          return 
        end
      end
    end
  end
  PaGlobal_TutorialManager:handleClickedDialogTutorialStartButton(phaseNo)
end

for index = 0, 3 do
  _uiDialogButton[index] = (UI.getChildControl)(Panel_Npc_Dialog, "Button_Dialog_" .. tostring(index))
  ;
  (_uiDialogButton[index]):addInputEvent("Mouse_LUp", "HandleClickedDialogButton(" .. index .. ")")
  ;
  (_uiDialogButton[index]):SetPosX(getScrX / 2 - 175)
  _uiDialogIcon[index] = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, _uiDialogButton[index], "StaticText_DialogIcon_" .. tostring(index))
  CopyBaseProperty(_styleDialogButtonIcon, _uiDialogIcon[index])
  ;
  (_uiDialogIcon[index]):SetPosX(5)
  ;
  (_uiDialogIcon[index]):SetPosY(1)
end
for index = 0, 5 do
  _uiFuncButton[index] = (UI.getChildControl)(Panel_Npc_Dialog, "Button_Menu_" .. tostring(index))
  ;
  (_uiFuncButton[index]):addInputEvent("Mouse_LUp", "HandleClickedFuncButton(" .. index .. ")")
  ;
  (_uiFuncButton[index]):SetPosX(index * 180 + 200)
  ;
  (_uiFuncButton[index]):SetPosY(38)
  ;
  (_uiFuncButton[index]):SetTextVerticalCenter()
  ;
  (_uiFuncButton[index]):SetTextHorizonCenter()
  if not isGameTypeKorea() then
    (_uiFuncButton[index]):SetTextMode(UI_TM.eTextMode_LimitText)
  end
end
for index = 0, 5 do
  _uiFuncBG[index] = (UI.getChildControl)(Panel_Npc_Dialog, "Static_MenuAni_" .. tostring(index))
end
for index = 0, 3 do
  _uiNoticeNeedInfo[index] = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, Panel_Npc_Dialog, "StaticText_Notice_" .. tostring(index))
  CopyBaseProperty(_styleNoticeNeedInfo, _uiNoticeNeedInfo[index])
  ;
  (_uiNoticeNeedInfo[index]):SetPosX(getScrX / 2 + 175)
  ;
  (_uiNoticeNeedInfo[index]):SetPosY((_uiDialogButton[index]):GetPosY())
end
for index = 0, 3 do
  _uiNeedWpAni[index] = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_Npc_Dialog, "Static_NeedWpAni_" .. tostring(index))
  CopyBaseProperty(_styleNeedWpAni, _uiNeedWpAni[index])
  ;
  (_uiNeedWpAni[index]):SetPosX(getScrX / 2 - 170)
  ;
  (_uiNeedWpAni[index]):SetPosY((_uiDialogButton[index]):GetPosY())
end
for index = 0, 3 do
  _uiIntimacyIcon[index] = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_Npc_Dialog, "Static_Intimacy_Button_" .. tostring(index))
  CopyBaseProperty(_intimacyButtonIcon, _uiIntimacyIcon[index])
end
local intimacyNoticeText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, intimacyNotice, "intimacyNoticeText")
CopyBaseProperty(intimacyNoticeStyle, intimacyNoticeText)
;
(UI.deleteControl)(intimacyNoticeStyle)
intimacyNoticeStyle = nil
intimacyNoticeText:SetSpanSize(10, 0)
_wpHelp:SetFontAlpha(0)
_wpHelp:SetAlpha(0)
_styleNoticeNeedInfo:SetAlpha(0)
_styleNoticeNeedInfo:SetFontAlpha(0)
_styleNormalTalkButton:SetShow(false)
_styleExploreTalkButton:SetShow(false)
_uiNextButton:addInputEvent("Mouse_LUp", "HandleClickedDialogNextButton()")
_uiNextButton:SetPosX(getScrX / 2 - 175)
_SpacebarIcon:SetPosX((_uiDialogButton[0]):GetPosX() + (_uiDialogButton[0]):GetSizeX() + 10)
local defaultDialogBtnSizeX = (_uiDialogButton[0]):GetSizeX()
local _rBtnPosX = (_uiDialogButton[0]):GetPosX() + (_uiDialogButton[0]):GetSizeX() - _SpacebarIcon:GetSizeX() - 5
local _rBtnPosY = (_uiDialogButton[0]):GetPosY()
_uiButtonExit:addInputEvent("Mouse_On", "Dialog_EtcButtonToolTips( true," .. 0 .. ")")
_uiButtonExit:addInputEvent("Mouse_Out", "Dialog_EtcButtonToolTips( false," .. 0 .. ")")
Button_Exit = function()
  -- function num : 0_15 , upvalues : _uiButtonExit, UI_PD
  _uiButtonExit:addInputEvent("Mouse_LUp", "FGlobal_HideDialog()")
  _uiButtonExit:SetVerticalBottom()
  _uiButtonExit:SetTextVerticalTop()
  _uiButtonExit:SetTextHorizonLeft()
  _uiButtonExit:SetSpanSize(10, 192)
  _uiButtonExit:SetTextHorizonCenter()
  _uiButtonExit:setPadding(UI_PD.ePadding_Left, 27)
  _uiButtonExit:setPadding(UI_PD.ePadding_Right, 4)
end

_uiButtonBack:addInputEvent("Mouse_On", "Dialog_EtcButtonToolTips( true," .. 1 .. ")")
_uiButtonBack:addInputEvent("Mouse_Out", "Dialog_EtcButtonToolTips( false," .. 1 .. ")")
Button_Back = function()
  -- function num : 0_16 , upvalues : _uiButtonBack, UI_PD
  _uiButtonBack:addInputEvent("Mouse_LUp", "HandleClickedBackButton()")
  _uiButtonBack:SetVerticalBottom()
  _uiButtonBack:SetTextVerticalTop()
  _uiButtonBack:SetTextHorizonLeft()
  _uiButtonBack:SetSpanSize(10, 192)
  _uiButtonBack:SetTextHorizonCenter()
  _uiButtonBack:setPadding(UI_PD.ePadding_Left, 27)
  _uiButtonBack:setPadding(UI_PD.ePadding_Right, 4)
end

NpcDialogShowAni = function()
  -- function num : 0_17 , upvalues : _uiNpcDialog
  audioPostEvent_SystemUi(1, 19)
  ;
  (UIAni.fadeInSCR_Up)(Panel_Npc_Dialog)
  Button_Exit()
  Button_Back()
  _uiNpcDialog:SetVerticalMiddle()
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
    _uiNpcDialog:SetPosY(80)
  end
  Inventory_PosSaveMemory()
end

NpcDialogHideAni = function()
  -- function num : 0_18 , upvalues : UI_ANI_ADV, UI_color
  audioPostEvent_SystemUi(1, 20)
  Panel_Npc_Dialog:ResetVertexAni()
  Panel_Npc_Dialog:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local Ani1 = Panel_Npc_Dialog:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  Ani1:SetStartColor(UI_color.C_FFFFFFFF)
  Ani1:SetEndColor(UI_color.C_00FFFFFF)
  Ani1:SetStartIntensity(3)
  Ani1:SetEndIntensity(1)
  Ani1.IsChangeChild = true
  Ani1:SetHideAtEnd(true)
  Ani1:SetDisableWhileAni(true)
end

Dialog_updateMainDialog = function()
  -- function num : 0_19 , upvalues : _dialogIndex, _uiNpcDialog, _mainDialog, _currentLine, _maxLine, _uiNextButton, _SpacebarIcon, _rBtnPosX, _rBtnPosY
  _dialogIndex = 0
  _uiNpcDialog:SetText(_mainDialog[_currentLine])
  if _currentLine < _maxLine then
    _uiNextButton:SetShow(true)
    _SpacebarIcon:SetShow(true)
    Dialog_updateButtons(false)
    _SpacebarIcon:SetPosX(_rBtnPosX + _SpacebarIcon:GetSizeX() + 10)
    _SpacebarIcon:SetPosY(_rBtnPosY)
  else
    _uiNextButton:SetShow(false)
    _SpacebarIcon:SetShow(false)
    Dialog_updateButtons(true)
    PaGlobal_TutorialManager:handleUpdateMainDialog()
  end
  _SpacebarIcon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_INTERACTION_FUNCTIONKEY"))
  Auto_NotifyChangeDialog()
end

local PreclosePanel_OpenDialog = function()
  -- function num : 0_20 , upvalues : dialogShowCheck_Once
  if Panel_QuestInfo:GetShow() then
    questInfo_TooltipShow(false)
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  if Panel_Window_Option:IsShow() then
    GameOption_Cancel()
    TooltipSimple_Hide()
  end
  if Panel_ColorBalance:GetShow() then
    Panel_ColorBalance_Close()
  end
  if Panel_WorkerManager:GetShow() then
    workerManager_Close()
    FGlobal_InitWorkerTooltip()
  end
  if Panel_Menu:GetShow() then
    Panel_Menu_Close()
  end
  DetectPlayer_Close()
  if Panel_Window_ItemMarket:GetShow() then
    if isNewItemmarket_chk() then
      FGolbal_ItemMarketNew_Close()
    else
      FGolbal_ItemMarket_Close()
    end
    if Panel_Win_System:GetShow() then
      messageBox_NoButtonUp()
    end
  end
  if dialogShowCheck_Once == false then
    InventoryWindow_Close()
  end
  if Panel_Dialog_Search:IsShow() then
    searchView_Close()
  end
end

FromClient_ShowDialog = function()
  -- function num : 0_21 , upvalues : PreclosePanel_OpenDialog, _wpHelp, intimacyNotice, intimacyNoticeText, _ignoreShowDialog, _uiNpcDialog, _uiFuncBG, _equipRewardCount, _currentLine, _uiNpcTitle, _uiNpcName, _mainDialog, _maxLine, isFirstShowTooltip
  PaGlobal_TutorialManager:handleBeforeShowDialog()
  FGlobal_RemoteControl_Hide()
  local charLevel = ((getSelfPlayer()):get()):getLevel()
  if CheckTutorialEnd() then
    ToClient_SaveUiInfo(false)
  end
  PreclosePanel_OpenDialog()
  local isShow = Panel_GameExit:IsShow()
  if isShow == true then
    Panel_GameExit:SetShow(false)
  end
  _wpHelp:SetShow(false)
  intimacyNotice:SetShow(false)
  intimacyNoticeText:SetShow(false)
  if _ignoreShowDialog == true then
    return 
  end
  if GetUIMode() ~= (Defines.UIMode).eUIMode_Default and GetUIMode() ~= (Defines.UIMode).eUIMode_NpcDialog and GetUIMode() ~= (Defines.UIMode).eUIMode_NpcDialog_Dummy and GetUIMode() ~= (Defines.UIMode).eUIMode_ItemMarket then
    ToClient_PopDialogueFlush()
    return 
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    ToClient_PopDialogueFlush()
    return 
  end
  local mainDialog = dialogData:getMainDialog()
  if mainDialog == "" then
    ToClient_PopDialogueFlush()
    return 
  end
  local mainDialogLocalizedKey = dialogData:getMainDialogLocalizedKey()
  if mainDialogLocalizedKey == nil then
    ToClient_PopDialogueFlush()
    return 
  end
  _uiNpcDialog:setLocalizedKey(mainDialogLocalizedKey)
  if not isFullSizeModeAble((FullSizeMode.fullSizeModeEnum).Dialog) then
    ToClient_PopDialogueFlush()
    return 
  else
    setFullSizeMode(true, (FullSizeMode.fullSizeModeEnum).Dialog)
  end
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  Panel_Tooltip_Item_hideTooltip()
  Panel_SkillTooltip_Hide()
  FGlobal_BuffTooltipOff()
  Interaction_Close()
  FGlobal_Dialog_renderMode:set()
  setShowLine(false)
  PaGlobalAppliedBuffList:hide()
  for index = 0, 5 do
    (_uiFuncBG[index]):SetShow(false)
  end
  _equipRewardCount = 0
  _currentLine = 0
  if Panel_Window_Exchange:GetShow() then
    ExchangePC_MessageBox_ResponseCancel()
  end
  setShowNpcDialog(true)
  local npcTitle = dialogData:getContactNpcTitle()
  local npcName = dialogData:getContactNpcName()
  _uiNpcTitle:SetText(npcTitle)
  _uiNpcName:SetText(npcName)
  if npcTitle == "" or npcTitle == nil then
    _uiNpcName:SetPosX(getScreenSizeX() / 2 - _uiNpcName:GetTextSizeX() / 2)
  else
    _uiNpcTitle:SetPosX(getScreenSizeX() / 2 - (_uiNpcTitle:GetTextSizeX() + _uiNpcName:GetTextSizeX() + 16) / 2)
    _uiNpcName:SetPosX(_uiNpcTitle:GetPosX() + _uiNpcTitle:GetTextSizeX() + 16)
  end
  _mainDialog = {}
  local stringList = (string.split)(mainDialog, "\n")
  local i = 0
  local strFirst, strSecond = nil, nil
  while 1 do
    strFirst = stringList[i * 2 + 1]
    strSecond = stringList[i * 2 + 2]
    -- DECOMPILER ERROR at PC243: Confused about usage of register: R11 in 'UnsetPending'

    if strFirst ~= nil and strSecond ~= nil then
      _mainDialog[i] = strFirst .. "\n" .. strSecond
    else
      if strFirst == nil then
        break
      else
        -- DECOMPILER ERROR at PC252: Confused about usage of register: R11 in 'UnsetPending'

        if strSecond == nil then
          _mainDialog[i] = strFirst
          break
        end
      end
    end
    i = i + 1
  end
  _maxLine = #_mainDialog
  local questData = questList_getQuestInfo(dialogData:getQuestRaw())
  local baseCount = dialogData:getBaseRewardCount()
  local _baseReward = {}
  for idx = 1, baseCount do
    local baseReward = dialogData:getBaseRewardAt(idx - 1)
    _baseReward[idx] = {}
    -- DECOMPILER ERROR at PC277: Confused about usage of register: R19 in 'UnsetPending'

    ;
    (_baseReward[idx])._type = baseReward._type
    -- DECOMPILER ERROR at PC286: Confused about usage of register: R19 in 'UnsetPending'

    if (CppEnums.RewardType).RewardType_Exp == baseReward._type then
      (_baseReward[idx])._exp = baseReward._experience
    else
      -- DECOMPILER ERROR at PC296: Confused about usage of register: R19 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_SkillExp == baseReward._type then
        (_baseReward[idx])._exp = baseReward._skillExperience
      else
        -- DECOMPILER ERROR at PC306: Confused about usage of register: R19 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_ProductExp == baseReward._type then
          (_baseReward[idx])._exp = baseReward._productExperience
        else
          -- DECOMPILER ERROR at PC317: Confused about usage of register: R19 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_Item == baseReward._type then
            (_baseReward[idx])._item = baseReward:getItemEnchantKey()
            -- DECOMPILER ERROR at PC320: Confused about usage of register: R19 in 'UnsetPending'

            ;
            (_baseReward[idx])._count = baseReward._itemCount
          else
            -- DECOMPILER ERROR at PC331: Confused about usage of register: R19 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Intimacy == baseReward._type then
              (_baseReward[idx])._character = baseReward:getIntimacyCharacter()
              -- DECOMPILER ERROR at PC334: Confused about usage of register: R19 in 'UnsetPending'

              ;
              (_baseReward[idx])._value = baseReward._intimacyValue
            else
              -- DECOMPILER ERROR at PC345: Confused about usage of register: R19 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_Knowledge == baseReward._type then
                (_baseReward[idx])._mentalCard = baseReward:getMentalCardKey()
              end
            end
          end
        end
      end
    end
  end
  local selectCount = dialogData:getSelectRewardCount()
  local _selectReward = {}
  for idx = 1, selectCount do
    local selectReward = dialogData:getSelectRewardAt(idx - 1)
    _selectReward[idx] = {}
    -- DECOMPILER ERROR at PC361: Confused about usage of register: R21 in 'UnsetPending'

    ;
    (_selectReward[idx])._type = selectReward._type
    -- DECOMPILER ERROR at PC370: Confused about usage of register: R21 in 'UnsetPending'

    if (CppEnums.RewardType).RewardType_Exp == selectReward._type then
      (_selectReward[idx])._exp = selectReward._experience
    else
      -- DECOMPILER ERROR at PC380: Confused about usage of register: R21 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_SkillExp == selectReward._type then
        (_selectReward[idx])._exp = selectReward._skillExperience
      else
        -- DECOMPILER ERROR at PC390: Confused about usage of register: R21 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_ProductExp == selectReward._type then
          (_selectReward[idx])._exp = selectReward._productExperience
        else
          -- DECOMPILER ERROR at PC401: Confused about usage of register: R21 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_Item == selectReward._type then
            (_selectReward[idx])._item = selectReward:getItemEnchantKey()
            -- DECOMPILER ERROR at PC404: Confused about usage of register: R21 in 'UnsetPending'

            ;
            (_selectReward[idx])._count = selectReward._itemCount
            local selfPlayer = getSelfPlayer()
            if selfPlayer ~= nil then
              local classType = selfPlayer:getClassType()
              -- DECOMPILER ERROR at PC415: Confused about usage of register: R23 in 'UnsetPending'

              ;
              (_selectReward[idx])._isEquipable = selectReward:isEquipable(classType)
            end
          else
            do
              do
                -- DECOMPILER ERROR at PC426: Confused about usage of register: R21 in 'UnsetPending'

                if (CppEnums.RewardType).RewardType_Intimacy == selectReward._type then
                  (_selectReward[idx])._character = selectReward:getIntimacyCharacter()
                  -- DECOMPILER ERROR at PC429: Confused about usage of register: R21 in 'UnsetPending'

                  ;
                  (_selectReward[idx])._value = selectReward._intimacyValue
                else
                  -- DECOMPILER ERROR at PC440: Confused about usage of register: R21 in 'UnsetPending'

                  if (CppEnums.RewardType).RewardType_Knowledge == selectReward._type then
                    (_selectReward[idx])._mentalCard = selectReward:getMentalCardKey()
                  end
                end
                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC441: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  FGlobal_SetRewardList(_baseReward, _selectReward, questData)
  isFirstShowTooltip = true
  Dialog_updateMainDialog()
  Dialog_intimacyValueUpdate()
  Dialog_PageButton_Init()
  Panel_Npc_Dialog:SetShow(true, true)
  Panel_MovieTheater_LowLevel_WindowClose()
  ExecuteAfterDialogLoad()
  FGlobal_Dialog_HideTutorialStartButtonList()
  if FGlobal_Dialog_CheckConditionTutorialMenuButton() == true then
    FGlobal_Dialog_ShowTutorialMenuButton()
  else
    FGlobal_Dialog_HideTutorialMenuButton()
  end
  PaGlobal_TutorialManager:handleShowDialog(dialogData)
end

HandleClickedDialogNextButton = function()
  -- function num : 0_22 , upvalues : _currentLine
  _currentLine = _currentLine + 1
  Dialog_updateMainDialog()
end

local hasMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASMENTALCARD")
local hasntMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASNTMENTALCARD")
local intimacyValueBuffer = {}
Dialog_intimacyValueUpdate = function()
  -- function num : 0_23 , upvalues : intimacyValueBuffer, _txt_intimacy, _intimacyFruitageValue, _intimacyCircularProgress, _intimacyProgressBG, _intimacyGiftIcon, giftIcon, hasMentalCardText, hasntMentalCardText, _math_AddVectorToVector, _math_MulNumberToVector, UCT, uv
  local dialogData = ToClient_GetCurrentDialogData()
  local groupIndex = 1
  do
    if dialogData ~= nil then
      local dialogButtonCount = dialogData:getDialogButtonCount()
      if dialogButtonCount > 0 then
        groupIndex = 2
      end
    end
    Panel_Npc_Dialog:deleteConsoleUIGroup(groupIndex)
    intimacyValueBuffer = {}
    local index = 0
    local talker = dialog_getTalker()
    if talker ~= nil then
      local characterKey = talker:getCharacterKey()
      local npcData = getNpcInfoByCharacterKeyRaw(characterKey, (talker:get()):getDialogIndex())
      if npcData ~= nil and npcData:hasSpawnType((CppEnums.SpawnType).eSpawnType_intimacy) == true then
        local intimacy = getIntimacyByCharacterKey(characterKey)
        _txt_intimacy:SetShow(true)
        _intimacyFruitageValue:SetShow(true)
        _intimacyFruitageValue:SetText(tostring(intimacy))
        local valuePercent = intimacy / 1000 * 100
        if valuePercent > 100 then
          valuePercent = 100
        end
        _intimacyCircularProgress:SetShow(true)
        _intimacyCircularProgress:SetProgressRate(valuePercent)
        _intimacyCircularProgress:addInputEvent("Mouse_On", "FruitageValue_ShowTooltip(true)")
        _intimacyCircularProgress:addInputEvent("Mouse_Out", "FruitageValue_ShowTooltip(false)")
        _intimacyProgressBG:SetShow(true)
        local count = getIntimacyInformationCount(characterKey)
        local colorKey = float4(1, 1, 1, 1)
        local startSize = 28
        local endSize = (_intimacyProgressBG:GetSizeX() + _intimacyGiftIcon:GetSizeX()) / 2
        local centerPosition = float3(_intimacyProgressBG:GetPosX() + _intimacyProgressBG:GetSizeX() / 2, _intimacyProgressBG:GetPosY() + _intimacyProgressBG:GetSizeY() / 2, 0)
        for index,value in pairs(giftIcon) do
          (UI.deleteControl)(value)
        end
        giftIcon = {}
        local group = nil
        if count > 0 then
          group = Panel_Npc_Dialog:addConsoleUIGroup(groupIndex, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
        end
        for index = 0, count - 1 do
          local intimacyInformationData = getIntimacyInformation(characterKey, index)
          if intimacyInformationData ~= nil then
            local percent = intimacyInformationData:getIntimacy() / 1000
            local imageType = intimacyInformationData:getTypeIndex()
            local giftName = intimacyInformationData:getTypeName()
            local giftDesc = intimacyInformationData:getTypeDescription()
            local giftMentalCardWrapper = ToClinet_getMentalCardStaticStatus(intimacyInformationData:getMentalCardKeyRaw())
            if giftMentalCardWrapper ~= nil then
              if giftMentalCardWrapper:isHasCard() then
                giftDesc = giftDesc .. hasMentalCardText
              else
                giftDesc = giftDesc .. hasntMentalCardText
              end
            end
            local giftOperator = intimacyInformationData:getOperatorType()
            local imageFileName = ""
            if percent >= 0 and percent <= 1 and ToClient_checkIntimacyInformationFixedState(intimacyInformationData) then
              local angle = math.pi * 2 * percent
              local lineStart = float3((math.sin)(angle), -(math.cos)(angle), 0)
              local lineEnd = float3((math.sin)(angle), -(math.cos)(angle), 0)
              lineStart = _math_AddVectorToVector(centerPosition, _math_MulNumberToVector(lineStart, startSize))
              lineEnd = _math_AddVectorToVector(centerPosition, _math_MulNumberToVector(lineEnd, endSize))
              local target = giftIcon[index]
              if target == nil then
                target = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_Npc_Dialog, "GiftIcon_" .. tostring(index))
                -- DECOMPILER ERROR at PC252: Confused about usage of register: R30 in 'UnsetPending'

                giftIcon[index] = target
                CopyBaseProperty(_intimacyGiftIcon, target)
              end
              target:SetShow(true)
              target:ChangeTextureInfoName((uv[imageType])._fileName)
              local x1, y1, x2, y2 = setTextureUV_Func(target, (uv[imageType]).x1, (uv[imageType]).y1, (uv[imageType]).x2, (uv[imageType]).y2)
              ;
              (target:getBaseTexture()):setUV(x1, y1, x2, y2)
              target:setRenderTexture(target:getBaseTexture())
              target:SetPosX(lineEnd.x - target:GetSizeX() / 2)
              target:SetPosY(lineEnd.y - target:GetSizeY() / 2)
              local targetPosX = target:GetPosX()
              local targetPosY = target:GetPosY()
              -- DECOMPILER ERROR at PC316: Confused about usage of register: R36 in 'UnsetPending'

              intimacyValueBuffer[index] = {giftName = giftName, giftDesc = giftDesc, giftPercent = percent, giftOperator = giftOperator}
              target:addInputEvent("Mouse_On", "FruitageItem_ShowTooltip(" .. percent .. ")")
              target:addInputEvent("Mouse_Out", "FruitageItem_HideTooltip()")
              group:addControl(0, index, 1, count, target)
            end
          end
        end
        return 
      end
    end
    do
      _txt_intimacy:SetShow(false)
      _intimacyFruitageValue:SetShow(false)
      _intimacyCircularProgress:SetShow(false)
      _intimacyProgressBG:SetShow(false)
      for index,value in pairs(giftIcon) do
        value:SetShow(false)
      end
    end
  end
end

FromClient_VaryIntimacy_Dialog = function(actorKeyRaw, tendencyValue)
  -- function num : 0_24
  if (Defines.UIMode).eUIMode_NpcDialog == GetUIMode() and Panel_Window_NpcShop:GetShow() == true then
    Dialog_intimacyValueUpdate()
    NpcShop_UpdateContent()
    Dialog_updateButtons(true)
  end
end

Dialog_PageButton_Init = function()
  -- function num : 0_25 , upvalues : _prevPageButton, _nextPageButton, _dialogIndex, _pageValue
  _prevPageButton:SetIgnore(true)
  _nextPageButton:SetIgnore(false)
  _dialogIndex = 0
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local dialogButtonCount = dialogData:getDialogButtonCount()
  local pageCount = (dialogButtonCount - 1) / 4 - (dialogButtonCount - 1) / 4 % 1
  _pageValue:SetText("1/" .. pageCount + 1)
end

Dialog_PageButton_Init()
HandleClicked_Next_Dialog = function(_startIndex)
  -- function num : 0_26 , upvalues : _dialogIndex, _prevPageButton, _nextPageButton, _pageValue
  local dialogData = ToClient_GetCurrentDialogData()
  local dialogButtonCount = dialogData:getDialogButtonCount()
  local pageCount = (dialogButtonCount - 1) / 4 - (dialogButtonCount - 1) / 4 % 1
  if _startIndex < 0 or dialogButtonCount <= _startIndex then
    return 
  end
  _dialogIndex = _startIndex
  if _startIndex == 0 then
    _prevPageButton:SetIgnore(true)
    _nextPageButton:SetIgnore(false)
    _pageValue:SetText(_startIndex / 4 + 1 .. "/" .. pageCount + 1)
  else
    if _startIndex / 4 == pageCount then
      _prevPageButton:SetIgnore(false)
      _nextPageButton:SetIgnore(true)
      _pageValue:SetText(_startIndex / 4 + 1 .. "/" .. pageCount + 1)
    else
      _prevPageButton:SetIgnore(false)
      _nextPageButton:SetIgnore(false)
      _pageValue:SetText(_startIndex / 4 + 1 .. "/" .. pageCount + 1)
    end
  end
  Dialog_updateButtons(true)
  Auto_NotifyChangeDialog()
end

local promiseTokenKey = 44192
Dialog_updateButtons = function(isVisible)
  -- function num : 0_27 , upvalues : isReContactDialog, isDialogFunctionQuest, _questDialogButtonIndex, _exchangalbeButtonIndex, _uiDialogButton, _uiNoticeNeedInfo, _uiNeedWpAni, _uiIntimacyIcon, _prevPageButton, _nextPageButton, _scrollControl, _pageValue, _dialogIndex, defaultDialogBtnSizeX, isExchangeButtonIndex, isPromiseToken, _styleExploreTalkButton, _styleNormalTalkButton, UI_color, UI_DS, _isQuestComplete, promiseTokenKey, UI_BTN_TYPE, _uiDialogIcon, hasMentalCardText, hasntMentalCardText, _rBtnPosY, _uiNextButton, _SpacebarIcon, _rBtnPosX, _uiFuncButton, _uiButtonBack, _uiButtonExit, tradeIndex, warehouseIndex, _uiFuncBG, nextQuestFunctionBtnClick, UI_PD, handleClickedQuestComplete, isAuctionDialog
  local sizeX = getScreenSizeX()
  local sizeY = (getScreenSizeY())
  local pos, displayData = nil, nil
  local linkType = 0
  local Wp = 0
  local playerLevel = 0
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil then
    Wp = selfPlayer:getWp()
    playerLevel = (selfPlayer:get()):getLevel()
  end
  local isBlackStone_16001 = Panel_Inventory_isBlackStone_16001
  local isBlackStone_16002 = Panel_Inventory_isBlackStone_16002
  local value_IsSocket = Panel_Inventory_isSocketItem
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local dialogButtonCount = dialogData:getDialogButtonCount()
  isReContactDialog = false
  isDialogFunctionQuest = false
  local isExchangalbeButtonCheck = false
  _questDialogButtonIndex = -1
  _exchangalbeButtonIndex = -1
  for i = 0, 3 do
    (_uiDialogButton[i]):SetShow(false)
    ;
    (_uiNoticeNeedInfo[i]):SetShow(false)
    ;
    (_uiNeedWpAni[i]):SetShow(false)
    ;
    (_uiIntimacyIcon[i]):SetShow(false)
  end
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
    for i = 0, 3 do
      (_uiDialogButton[i]):SetSize((_uiDialogButton[i]):GetSizeX(), 28)
    end
  end
  do
    if dialogButtonCount > 4 then
      _prevPageButton:SetShow(true)
      _nextPageButton:SetShow(true)
      _scrollControl:SetShow(true)
      _scrollControl:SetIgnore(false)
      _pageValue:SetShow(true)
      _prevPageButton:SetAutoDisableTime(0.2)
      _nextPageButton:SetAutoDisableTime(0.2)
      _prevPageButton:addInputEvent("Mouse_LUp", "HandleClicked_Next_Dialog(" .. _dialogIndex - 4 .. ")")
      _nextPageButton:addInputEvent("Mouse_LUp", "HandleClicked_Next_Dialog(" .. _dialogIndex + 4 .. ")")
      for dialogBTScrollIndex = 0, 3 do
        (_uiDialogButton[dialogBTScrollIndex]):addInputEvent("Mouse_UpScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex - 4 .. ")")
        ;
        (_uiDialogButton[dialogBTScrollIndex]):addInputEvent("Mouse_DownScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex + 4 .. ")")
      end
      _scrollControl:addInputEvent("Mouse_UpScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex - 4 .. ")")
      _scrollControl:addInputEvent("Mouse_DownScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex + 4 .. ")")
      _prevPageButton:addInputEvent("Mouse_UpScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex - 4 .. ")")
      _prevPageButton:addInputEvent("Mouse_DownScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex + 4 .. ")")
      _nextPageButton:addInputEvent("Mouse_UpScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex - 4 .. ")")
      _nextPageButton:addInputEvent("Mouse_DownScroll", "HandleClicked_Next_Dialog(" .. _dialogIndex + 4 .. ")")
    else
      _prevPageButton:SetShow(false)
      _nextPageButton:SetShow(false)
      _scrollControl:SetShow(false)
      _scrollControl:SetIgnore(true)
      _pageValue:SetShow(false)
    end
    Panel_Npc_Dialog:deleteConsoleUIGroup(1)
    if dialogButtonCount > 0 then
      local group_1 = Panel_Npc_Dialog:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
      local _btnCount = (math.min)(3, dialogButtonCount - 1)
      if _prevPageButton:GetShow() then
        for cIndex = 0, _btnCount do
          group_1:addControl(0, cIndex, 1, _btnCount + 2, _uiDialogButton[cIndex])
        end
        group_1:addControl(0, 4, 1, _btnCount + 2, _prevPageButton)
        group_1:addControl(0, 5, 1, _btnCount + 2, _nextPageButton)
      else
        for cIndex = 0, _btnCount do
          group_1:addControl(0, cIndex, 1, _btnCount, _uiDialogButton[cIndex])
        end
      end
    end
    do
      local _dialogCount = 0
      local _firstDisplayQuest = false
      local _btnPositionType = 0
      local _questDialogButtonPosY = 0
      local _exchangalbeButtonPosY = 0
      local _rBtnPlusPosX = 0
      local _dialogBtnSizeX = defaultDialogBtnSizeX
      for i = _dialogIndex, dialogButtonCount - 1 do
        local dialogButton = nil
        local needThings = ""
        local isNeedThings = false
        local itemStaticWrapper = nil
        -- DECOMPILER ERROR at PC312: Confused about usage of register: R30 in 'UnsetPending'

        isExchangeButtonIndex[i] = false
        -- DECOMPILER ERROR at PC314: Confused about usage of register: R30 in 'UnsetPending'

        isPromiseToken[i] = false
        if isVisible then
          if _dialogCount > 3 then
            break
          end
          pos = (_uiDialogButton[_dialogCount]):GetSpanSize()
          displayData = Dialog_getButtonDisplayData(i)
          if displayData:empty() == false then
            CopyBaseProperty(_styleExploreTalkButton, _uiDialogButton[_dialogCount])
          else
            CopyBaseProperty(_styleNormalTalkButton, _uiDialogButton[_dialogCount])
          end
          dialogButton = dialogData:getDialogButtonAt(i)
          ;
          (_uiDialogButton[_dialogCount]):SetText(dialogButton:getText())
          if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
            (_uiDialogButton[_dialogCount]):SetPosY(140 + _dialogCount * 29)
          else
            ;
            (_uiDialogButton[_dialogCount]):SetSpanSize(pos.x, pos.y)
          end
          if _dialogBtnSizeX < (_uiDialogButton[_dialogCount]):GetTextSizeX() + 80 then
            _dialogBtnSizeX = (_uiDialogButton[_dialogCount]):GetTextSizeX() + 80
          end
          if displayData:empty() then
            (_uiDialogButton[_dialogCount]):SetEnable(dialogButton._enable)
            if dialogButton._enable then
              if dialogButton._invenPushable == false then
                (_uiDialogButton[_dialogCount]):SetEnable(dialogButton._invenPushable)
                ;
                (_uiDialogButton[_dialogCount]):SetMonoTone(true)
                ;
                (_uiDialogButton[_dialogCount]):SetFontColor(UI_color.C_FF515151)
                ;
                (_uiNoticeNeedInfo[_dialogCount]):SetFontColor(UI_color.C_FFF26A6A)
              else
                ;
                (_uiDialogButton[_dialogCount]):SetMonoTone(false)
                ;
                (_uiDialogButton[_dialogCount]):SetFontColor(UI_color.C_FFDFDFDF)
                ;
                (_uiNoticeNeedInfo[_dialogCount]):SetFontColor(UI_color.C_FFDFDFDF)
              end
            else
              ;
              (_uiDialogButton[_dialogCount]):SetMonoTone(true)
              ;
              (_uiDialogButton[_dialogCount]):SetFontColor(UI_color.C_FF515151)
              ;
              (_uiNoticeNeedInfo[_dialogCount]):SetFontColor(UI_color.C_FFF26A6A)
            end
            linkType = dialogButton._linkType
            ;
            (_uiNoticeNeedInfo[_dialogCount]):SetShow(false)
            ;
            (_uiNeedWpAni[_dialogCount]):SetShow(false)
            if UI_DS.eDialogState_ReContact == tostring(linkType) then
              isReContactDialog = true
              _btnPositionType = 2
            else
              if UI_DS.eDialogState_QuestComplete == tostring(linkType) or UI_DS.eDialogState_AcceptQuest == tostring(linkType) then
                isReContactDialog = true
                _btnPositionType = 2
              end
            end
            if UI_DS.eDialogState_QuestComplete == tostring(linkType) then
              _isQuestComplete = true
            else
              _isQuestComplete = false
            end
            if UI_DS.eDialogState_DisplayQuest == tostring(linkType) and _firstDisplayQuest == false then
              _firstDisplayQuest = true
              _btnPositionType = 4
              _questDialogButtonIndex = _dialogCount
              _questDialogButtonPosY = (_uiDialogButton[_questDialogButtonIndex]):GetPosY()
            end
            local needWp = dialogButton:getNeedWp()
            if UI_DS.eDialogState_Talk == tostring(linkType) and needWp > 0 then
              needThings = needThings .. PAGetStringParam1(Defines.StringSheet_GAME, "DIALOG_NEED_WP", "wp", needWp) .. " (" .. PAGetString(Defines.StringSheet_GAME, "DIALOG_WP_GOT") .. "" .. Wp .. ") "
              isNeedThings = true
              if dialogButton:getNeedItemCount() > 0 then
                itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
                if itemStaticWrapper ~= nil then
                  needThings = needThings .. " / " .. itemStaticWrapper:getName() .. " " .. tostring(dialogButton:getNeedItemCount()) .. PAGetString(Defines.StringSheet_GAME, "DIALOG_NEEDCOUNT")
                end
                ;
                (_uiNeedWpAni[_dialogCount]):SetShow(false)
              else
                ;
                (_uiNeedWpAni[_dialogCount]):SetShow(true)
              end
            else
              if dialogButton:getNeedItemCount() > 0 then
                itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
                if itemStaticWrapper ~= nil then
                  needThings = needThings .. itemStaticWrapper:getName() .. " " .. tostring(dialogButton:getNeedItemCount()) .. PAGetString(Defines.StringSheet_GAME, "DIALOG_NEEDCOUNT")
                  isNeedThings = true
                  -- DECOMPILER ERROR at PC628: Confused about usage of register: R31 in 'UnsetPending'

                  isExchangeButtonIndex[_dialogCount + _dialogIndex] = true
                  -- DECOMPILER ERROR at PC637: Confused about usage of register: R31 in 'UnsetPending'

                  if dialogButton:getNeedItemKey() == promiseTokenKey then
                    isPromiseToken[_dialogCount + _dialogIndex] = true
                  end
                end
                ;
                (_uiNeedWpAni[_dialogCount]):SetShow(false)
              else
                ;
                (_uiNeedWpAni[_dialogCount]):SetShow(false)
              end
            end
            if isNeedThings then
              if dialogButton._invenPushable then
                (_uiNoticeNeedInfo[_dialogCount]):SetText(needThings)
              else
                ;
                (_uiNoticeNeedInfo[_dialogCount]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PLAYER_INVENTORY_FULL"))
              end
              ;
              (_uiNoticeNeedInfo[_dialogCount]):SetSize((_uiNoticeNeedInfo[_dialogCount]):GetTextSizeX() + 10, 23)
              ;
              (_uiNoticeNeedInfo[_dialogCount]):SetAutoResize(true)
              ;
              (_uiNoticeNeedInfo[_dialogCount]):SetShow(true)
              if dialogButton._enable and isExchangalbeButtonCheck == false and UI_BTN_TYPE.eDialogButton_CutScene ~= dialogButton._dialogButtonType and UI_BTN_TYPE.eDialogButton_ExceptExchange ~= dialogButton._dialogButtonType then
                _exchangalbeButtonPosY = (_uiDialogButton[_dialogCount]):GetPosY()
                _rBtnPlusPosX = (_uiNoticeNeedInfo[_dialogCount]):GetSizeX()
                isExchangalbeButtonCheck = true
                _btnPositionType = 5
                _exchangalbeButtonIndex = _dialogCount
              end
            else
              if UI_BTN_TYPE.eDialogButton_Knowledge == dialogButton._dialogButtonType and UI_DS.eDialogState_ProgressQuest ~= tostring(linkType) and not isExchangalbeButtonCheck then
                _exchangalbeButtonPosY = (_uiDialogButton[_dialogCount]):GetPosY()
                _rBtnPlusPosX = 0
                isExchangalbeButtonCheck = true
                _btnPositionType = 5
                _exchangalbeButtonIndex = _dialogCount
              end
            end
          else
            do
              ;
              (_uiDialogButton[_dialogCount]):SetMonoTone(false)
              ;
              (_uiDialogButton[_dialogCount]):SetFontColor(UI_color.C_FFDFDFDF)
              ;
              (_uiNoticeNeedInfo[_dialogCount]):SetShow(false)
              ;
              (_uiNeedWpAni[_dialogCount]):SetShow(false)
              ;
              (_uiDialogButton[_dialogCount]):SetShow(true)
              if UI_DS.eDialogState_Talk == tostring(linkType) then
                if dialogButton._dialogButtonType > 0 and dialogButton._dialogButtonType < (CppEnums.DialogButtonType).eDialogButton_Count then
                  FGlobal_ChangeOnTextureForDialogIcon(_uiDialogIcon[_dialogCount], dialogButton._dialogButtonType)
                  ;
                  (_uiDialogIcon[_dialogCount]):SetShow(true)
                else
                  ;
                  (_uiDialogIcon[_dialogCount]):SetShow(false)
                end
              else
                if dialogButton._dialogButtonType > 0 and dialogButton._dialogButtonType < (CppEnums.DialogQuestButtonType).eDialogButton_QuestCount then
                  FGlobal_ChangeOnTextureForDialogQuestIcon(_uiDialogIcon[_dialogCount], dialogButton._dialogButtonType)
                  ;
                  (_uiDialogIcon[_dialogCount]):SetShow(true)
                else
                  ;
                  (_uiDialogIcon[_dialogCount]):SetShow(false)
                end
              end
              ;
              (_uiIntimacyIcon[_dialogCount]):SetShow(false)
              local talker = dialog_getTalker()
              if talker ~= nil then
                local characterKey = talker:getCharacterKey()
                local count = getIntimacyInformationCount(characterKey)
                local intimacyValue = talker:getIntimacy()
                for indexIntimacy = 0, count - 1 do
                  local intimacyInformationData = getIntimacyInformation(characterKey, indexIntimacy)
                  local giftDesc = intimacyInformationData:getTypeDescription()
                  local intimacyType = intimacyInformationData:getTypeName()
                  local giftMentalCardWrapper = ToClinet_getMentalCardStaticStatus(intimacyInformationData:getMentalCardKeyRaw())
                  if giftMentalCardWrapper ~= nil then
                    if giftMentalCardWrapper:isHasCard() then
                      giftDesc = giftDesc .. hasMentalCardText
                    else
                      giftDesc = giftDesc .. hasntMentalCardText
                    end
                  end
                  if giftDesc == dialogButton:getText() and intimacyValue > 1 then
                    if intimacyType == PAGetString(Defines.StringSheet_GAME, "INTIMACYINFORMATION_TYPE_QUEST") then
                      (_uiIntimacyIcon[_dialogCount]):SetPosX((_uiDialogButton[_dialogCount]):GetPosX() + (_uiIntimacyIcon[_dialogCount]):GetSizeX() - 8)
                      ;
                      (_uiIntimacyIcon[_dialogCount]):SetPosY((_uiDialogButton[_dialogCount]):GetPosY() + 1)
                    else
                      ;
                      (_uiIntimacyIcon[_dialogCount]):SetPosX((_uiDialogButton[_dialogCount]):GetPosX() + 3)
                      ;
                      (_uiIntimacyIcon[_dialogCount]):SetPosY((_uiDialogButton[_dialogCount]):GetPosY() + 1)
                    end
                    if dialogButton._dialogButtonType > 0 then
                      (_uiIntimacyIcon[_dialogCount]):SetShow(false)
                    else
                      ;
                      (_uiIntimacyIcon[_dialogCount]):SetShow(true)
                    end
                  end
                end
              end
              do
                do
                  _dialogCount = _dialogCount + 1
                  -- DECOMPILER ERROR at PC942: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC942: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC942: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC942: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC942: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC942: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      for i = 0, 3 do
        if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
          (_uiDialogButton[i]):SetSize(_dialogBtnSizeX, 28)
          ;
          (_uiDialogButton[i]):SetPosY(140 + i * 29)
          ;
          (_uiNoticeNeedInfo[i]):SetPosX(getScreenSizeX() / 2 + (_uiDialogButton[i]):GetSizeX() / 2)
          ;
          (_uiNoticeNeedInfo[i]):SetPosY((_uiDialogButton[i]):GetPosY())
          ;
          (_uiNeedWpAni[i]):SetPosX(getScreenSizeX() / 2 + (_uiDialogButton[i]):GetSizeX() / 2 - (_uiNeedWpAni[i]):GetSizeX() - 5)
          ;
          (_uiNeedWpAni[i]):SetPosY((_uiDialogButton[i]):GetPosY())
        else
          ;
          (_uiDialogButton[i]):SetSize(_dialogBtnSizeX, (_uiDialogButton[i]):GetSizeY())
          ;
          (_uiNoticeNeedInfo[i]):SetPosY((_uiDialogButton[i]):GetPosY())
          ;
          (_uiNeedWpAni[i]):SetPosY((_uiDialogButton[i]):GetPosY())
        end
        ;
        (_uiDialogButton[i]):SetPosX(getScreenSizeX() / 2 - (_dialogBtnSizeX) / 2)
      end
      _rBtnPosY = (_uiDialogButton[0]):GetPosY()
      _uiNextButton:SetSize(_dialogBtnSizeX, 28)
      _uiNextButton:SetPosY(_rBtnPosY)
      _SpacebarIcon:SetPosX((_uiDialogButton[0]):GetPosX() + (_uiDialogButton[0]):GetSizeX() + 10)
      _SpacebarIcon:SetPosY(_rBtnPosY)
      _prevPageButton:SetPosX((_uiDialogButton[0]):GetPosX() - _prevPageButton:GetSizeX() * 2)
      _nextPageButton:SetPosX(_prevPageButton:GetPosX())
      _pageValue:SetPosX(_prevPageButton:GetPosX())
      _rBtnPosX = (_uiDialogButton[0]):GetPosX() + (_uiDialogButton[0]):GetSizeX() - _SpacebarIcon:GetSizeX() - 5
      local totalQuestCount = 0
      local progressQuestCount = (questList_getCheckedProgressQuestCount())
      local groupNo, questNo, progressQuest = nil, nil, nil
      local groupCount = 0
      for questIndex = 1, progressQuestCount do
        progressQuest = questList_getCheckedProgressQuestAt(questIndex - 1)
        if progressQuest == nil then
          return 
        end
        totalQuestCount = totalQuestCount + 1
        groupCount = progressQuest:getQuestGroupQuestCount()
        if groupCount > 0 and progressQuest:getQuestGroupQuestNo() <= groupCount then
          groupNo = progressQuest:getQuestGroup()
          questNo = progressQuest:getQuestGroupQuestNo()
        end
      end
      local funcButtonCount = dialogData:getFuncButtonCount()
      local buttonSize = (_uiFuncButton[0]):GetSizeX()
      local buttonGap = 10
      local startPosX = (sizeX - (buttonSize * funcButtonCount + buttonGap * (funcButtonCount - 1))) / 2
      local funcButton = nil
      local intimacyGame_Alert = (UI.getChildControl)(Panel_Npc_Dialog, "Static_BubbleBox")
      local intimacyGame_Alert_Txt = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_BubbleBox")
      intimacyGame_Alert:SetShow(false)
      intimacyGame_Alert_Txt:SetShow(false)
      local investNode_Alert = (UI.getChildControl)(Panel_Npc_Dialog, "Static_BubbleBox2")
      local investNode_Alert_Txt = (UI.getChildControl)(Panel_Npc_Dialog, "StaticText_BubbleBox2")
      investNode_Alert:SetShow(false)
      investNode_Alert_Txt:SetShow(false)
      Panel_Npc_Dialog:deleteConsoleUIGroup(0)
      local group_0 = Panel_Npc_Dialog:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
      group_0:addControl(0, 0, 1, funcButtonCount + 2, _uiButtonBack)
      group_0:addControl(0, funcButtonCount + 1, 1, funcButtonCount + 2, _uiButtonExit)
      tradeIndex = -1
      warehouseIndex = -1
      for index = 0, 5 do
        local posX = startPosX + (buttonSize + buttonGap) * index
        ;
        (_uiFuncButton[index]):EraseAllEffect()
        ;
        (_uiFuncButton[index]):addInputEvent("Mouse_On", "")
        ;
        (_uiFuncButton[index]):addInputEvent("Mouse_Out", "")
        ;
        (_uiFuncBG[index]):ResetVertexAni()
        ;
        (_uiFuncBG[index]):SetShow(false)
        -- DECOMPILER ERROR at PC1260: Confused about usage of register: R43 in 'UnsetPending'

        nextQuestFunctionBtnClick[index] = false
        if index < funcButtonCount then
          group_0:addControl(0, index + 1, 1, funcButtonCount + 2, _uiFuncButton[index])
          funcButton = dialogData:getFuncButtonAt(index)
          ;
          (_uiFuncButton[index]):SetIgnore(false)
          ;
          (_uiFuncButton[index]):SetFontColor(4291083966)
          ;
          (_uiFuncButton[index]):ResetVertexAni()
          ;
          (_uiFuncButton[index]):SetAlpha(1)
          ;
          (_uiFuncButton[index]):SetPosX(posX)
          ;
          (_uiFuncButton[index]):SetMonoTone(false)
          local funcButtonType = tonumber(funcButton._param)
          Dialog_InterestKnowledgeUpdate()
          local displayExchangeWrapper = dialogData:getCurrentDisplayExchangeWrapper()
          if displayExchangeWrapper ~= nil then
            FGlobal_Exchange_Item()
          end
          ;
          (_uiFuncButton[index]):addInputEvent("Mouse_On", "Dialog_MouseToolTips(true, " .. funcButtonType .. "," .. index .. ")")
          ;
          (_uiFuncButton[index]):addInputEvent("Mouse_Out", "Dialog_MouseToolTips(false, " .. funcButtonType .. "," .. index .. ")")
          local tempIconSizeX = 23
          if funcButtonType == (CppEnums.ContentsType).Contents_IntimacyGame then
            (_uiFuncButton[index]):setPadding(UI_PD.ePadding_Left, 27)
            ;
            (_uiFuncButton[index]):setPadding(UI_PD.ePadding_Right, 4)
            ;
            (_uiFuncButton[index]):SetText(funcButton:getText() .. " (" .. funcButton:getNeedWp() .. "/" .. Wp .. ")")
            ;
            (_uiFuncButton[index]):SetEnable(funcButton._enable)
          else
            if funcButtonType == (CppEnums.ContentsType).Contents_NewQuest then
              (_uiFuncButton[index]):setPadding(UI_PD.ePadding_Left, 0)
              ;
              (_uiFuncButton[index]):setPadding(UI_PD.ePadding_Right, 15)
              ;
              (_uiFuncButton[index]):SetText(funcButton:getText())
              ;
              (_uiFuncButton[index]):SetEnable(true)
            else
              ;
              (_uiFuncButton[index]):SetEnable(true)
              ;
              (_uiFuncButton[index]):setPadding(UI_PD.ePadding_Left, 27)
              ;
              (_uiFuncButton[index]):setPadding(UI_PD.ePadding_Right, 4)
              ;
              (_uiFuncButton[index]):SetText(funcButton:getText())
              local btnTextSizeX = (_uiFuncButton[index]):GetSizeX() + tempIconSizeX
              local btnTextPosX = btnTextSizeX - btnTextSizeX / 2 - (_uiFuncButton[index]):GetTextSizeX() / 2
            end
          end
          do
            ;
            (_uiFuncButton[index]):SetShow(true)
            if funcButtonType == (CppEnums.ContentsType).Contents_Quest then
              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 430, 155, 462)
              ;
              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
              ;
              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 430, 310, 462)
              ;
              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
              ;
              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 430, 465, 462)
              ;
              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
              ;
              (_uiFuncButton[index]):SetMonoTone(false)
            else
              do
                if funcButtonType == (CppEnums.ContentsType).Contents_NewQuest then
                  (_uiFuncBG[index]):SetPosX((_uiFuncButton[index]):GetPosX() - 6)
                  ;
                  (_uiFuncBG[index]):SetPosY((_uiFuncButton[index]):GetPosY() - 5)
                  audioPostEvent_SystemUi(4, 4)
                  ;
                  (_uiFuncBG[index]):SetShow(true)
                  ;
                  (_uiFuncBG[index]):SetVertexAniRun("Ani_Color_1", true)
                  ;
                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 430, 155, 462)
                  ;
                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                  ;
                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 430, 310, 462)
                  ;
                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 430, 465, 462)
                  ;
                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (_uiFuncButton[index]):SetFontColor(4289626129)
                  ;
                  (_uiFuncButton[index]):SetVertexAniRun("Ani_Color_Bright", true)
                  ;
                  (_uiFuncButton[index]):SetMonoTone(false)
                  isDialogFunctionQuest = true
                  _btnPositionType = 3
                  -- DECOMPILER ERROR at PC1676: Confused about usage of register: R58 in 'UnsetPending'

                  if handleClickedQuestComplete == true then
                    nextQuestFunctionBtnClick[index] = true
                  end
                else
                  do
                    if funcButtonType == (CppEnums.ContentsType).Contents_Shop then
                      if funcButton:getText() == PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_EXCHANGEMONEY") then
                        (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 298, 155, 330)
                        ;
                        ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                        ;
                        (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 298, 310, 330)
                        ;
                        ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 299, 465, 331)
                        ;
                        ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                      else
                        do
                          ;
                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 34, 155, 66)
                          ;
                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                          ;
                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                          ;
                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 34, 310, 66)
                          ;
                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                          ;
                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                          do
                            local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 34, 465, 66)
                            ;
                            ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                            ;
                            (_uiFuncButton[index]):SetMonoTone(false)
                            if isNormalTradeMerchant() then
                              FGlobal_RemoteControl_Show(5)
                              tradeIndex = index
                            end
                            if funcButtonType == (CppEnums.ContentsType).Contents_Skill then
                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 67, 155, 99)
                              ;
                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                              ;
                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                              ;
                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 67, 310, 99)
                              ;
                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                              ;
                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 67, 465, 99)
                              ;
                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                              ;
                              (_uiFuncButton[index]):SetFontColor(4289626129)
                              ;
                              (_uiFuncButton[index]):SetIgnore(false)
                              ;
                              (_uiFuncButton[index]):SetVertexAniRun("Ani_Color_Bright", true)
                              ;
                              (_uiFuncButton[index]):SetText(PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_SKILL"))
                              ;
                              (_uiFuncButton[index]):SetMonoTone(false)
                              if groupNo == 1067 and questNo == 4 then
                                (_uiFuncButton[index]):EraseAllEffect()
                                ;
                                (_uiFuncButton[index]):AddEffect("UI_ArrowMark02", true, 0, -(_uiFuncButton[index]):GetSizeY() * 1.7)
                              else
                                if groupNo == 1600 and questNo == 4 then
                                  (_uiFuncButton[index]):EraseAllEffect()
                                  ;
                                  (_uiFuncButton[index]):AddEffect("UI_ArrowMark02", true, 0, -(_uiFuncButton[index]):GetSizeY() * 1.7)
                                else
                                  if groupNo == 1070 and questNo == 4 then
                                    (_uiFuncButton[index]):EraseAllEffect()
                                    ;
                                    (_uiFuncButton[index]):AddEffect("UI_ArrowMark02", true, 0, -(_uiFuncButton[index]):GetSizeY() * 1.7)
                                  else
                                    if groupNo == 1071 and questNo == 4 then
                                      (_uiFuncButton[index]):EraseAllEffect()
                                      ;
                                      (_uiFuncButton[index]):AddEffect("UI_ArrowMark02", true, 0, -(_uiFuncButton[index]):GetSizeY() * 1.7)
                                    else
                                      ;
                                      (_uiFuncButton[index]):EraseAllEffect()
                                    end
                                  end
                                end
                              end
                            else
                              do
                                if funcButtonType == (CppEnums.ContentsType).Contents_Repair then
                                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 1, 155, 33)
                                  ;
                                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                  ;
                                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 1, 310, 33)
                                  ;
                                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 1, 465, 33)
                                  ;
                                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (_uiFuncButton[index]):SetMonoTone(false)
                                else
                                  do
                                    if funcButtonType == (CppEnums.ContentsType).Contents_Auction then
                                      (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 100, 155, 132)
                                      ;
                                      ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                      ;
                                      (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                      ;
                                      (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 100, 310, 132)
                                      ;
                                      ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                      ;
                                      (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 100, 465, 132)
                                      ;
                                      ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                      ;
                                      (_uiFuncButton[index]):SetMonoTone(false)
                                      isAuctionDialog = true
                                    else
                                      do
                                        if funcButtonType == (CppEnums.ContentsType).Contents_Inn then
                                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 364, 155, 396)
                                          ;
                                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                          ;
                                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                          ;
                                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 364, 310, 396)
                                          ;
                                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                          ;
                                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 364, 465, 396)
                                          ;
                                          ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                          ;
                                          (_uiFuncButton[index]):SetMonoTone(false)
                                        else
                                          do
                                            if funcButtonType == (CppEnums.ContentsType).Contents_Warehouse then
                                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 133, 155, 165)
                                              ;
                                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                              ;
                                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                              ;
                                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 133, 310, 165)
                                              ;
                                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                              ;
                                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 133, 465, 165)
                                              ;
                                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                              ;
                                              (_uiFuncButton[index]):SetMonoTone(false)
                                              if not Panel_Window_Warehouse:GetShow() then
                                                FGlobal_RemoteControl_Show(6)
                                                warehouseIndex = index
                                              end
                                            else
                                              do
                                                if funcButtonType == (CppEnums.ContentsType).Contents_IntimacyGame then
                                                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 232, 155, 264)
                                                  ;
                                                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                  ;
                                                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                  ;
                                                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 232, 310, 264)
                                                  ;
                                                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                  ;
                                                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 232, 465, 264)
                                                  ;
                                                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                  if funcButton._enable == true then
                                                    (_uiFuncButton[index]):SetMonoTone(false)
                                                    intimacyGame_Alert:SetShow(false)
                                                    intimacyGame_Alert_Txt:SetShow(false)
                                                  else
                                                    ;
                                                    (_uiFuncButton[index]):SetMonoTone(true)
                                                    local talker = dialog_getTalker()
                                                    local ActorKeyRaw = talker:getActorKey()
                                                    local npcActorProxyWrapper = getNpcActor(ActorKeyRaw)
                                                    local needCount = npcActorProxyWrapper:getNeedCount()
                                                    local currCount = getKnowledgeCountMatchTheme(npcActorProxyWrapper:getNpcThemeKey())
                                                    local text = PAGetStringParam3(Defines.StringSheet_GAME, "HUMANRELATION_TEXT", "getNpcTheme", npcActorProxyWrapper:getNpcTheme(), "currCount", tostring(currCount), "needCount", tostring(needCount))
                                                    intimacyGame_Alert:SetShow(true)
                                                    intimacyGame_Alert_Txt:SetShow(true)
                                                    intimacyGame_Alert:SetPosX((_uiFuncButton[index]):GetPosX() - 35)
                                                    intimacyGame_Alert:SetPosY((_uiFuncButton[index]):GetPosY() - 60)
                                                    intimacyGame_Alert_Txt:SetPosX(intimacyGame_Alert:GetPosX() - 5)
                                                    intimacyGame_Alert_Txt:SetPosY(intimacyGame_Alert:GetPosY())
                                                    intimacyGame_Alert_Txt:SetAutoResize(true)
                                                    intimacyGame_Alert_Txt:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HUMANRELATION_ALERT_TEXT", "txt", text))
                                                    intimacyGame_Alert_Txt:SetSize(intimacyGame_Alert_Txt:GetTextSizeX(), intimacyGame_Alert_Txt:GetTextSizeY())
                                                    intimacyGame_Alert:SetSize(intimacyGame_Alert_Txt:GetSizeX() + 70, intimacyGame_Alert_Txt:GetSizeY() + 34)
                                                  end
                                                else
                                                  do
                                                    if funcButtonType == (CppEnums.ContentsType).Contents_Stable then
                                                      if stable_doHaveRegisterItem() then
                                                        (_uiFuncBG[index]):SetPosX((_uiFuncButton[index]):GetPosX() - 6)
                                                        ;
                                                        (_uiFuncBG[index]):SetPosY((_uiFuncButton[index]):GetPosY() - 5)
                                                        ;
                                                        (_uiFuncBG[index]):SetShow(true)
                                                        ;
                                                        (_uiFuncBG[index]):SetVertexAniRun("Ani_Color_1", true)
                                                      else
                                                        ;
                                                        (_uiFuncBG[index]):SetShow(false)
                                                      end
                                                      ;
                                                      (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                      ;
                                                      ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                      ;
                                                      (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                      ;
                                                      (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                      ;
                                                      ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                      ;
                                                      (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                      ;
                                                      ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                      ;
                                                      (_uiFuncButton[index]):SetMonoTone(false)
                                                    else
                                                      do
                                                        if funcButtonType == (CppEnums.ContentsType).Contents_Transfer then
                                                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 100, 155, 132)
                                                          ;
                                                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                          ;
                                                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                          ;
                                                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 100, 310, 132)
                                                          ;
                                                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                          ;
                                                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 100, 465, 132)
                                                          ;
                                                          ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                          ;
                                                          (_uiFuncButton[index]):SetMonoTone(false)
                                                        else
                                                          do
                                                            if funcButtonType == (CppEnums.ContentsType).Contents_Guild then
                                                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                              ;
                                                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                              ;
                                                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                              ;
                                                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                              ;
                                                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                              ;
                                                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                              ;
                                                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                              ;
                                                              (_uiFuncButton[index]):SetMonoTone(false)
                                                            else
                                                              do
                                                                if funcButtonType == (CppEnums.ContentsType).Contents_Explore then
                                                                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 166, 155, 198)
                                                                  ;
                                                                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                  ;
                                                                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                  ;
                                                                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 166, 310, 198)
                                                                  ;
                                                                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                  ;
                                                                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 166, 465, 198)
                                                                  ;
                                                                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                  if dialog_getIsExplorationUseableCurrentTalker() == false then
                                                                    investNode_Alert:SetShow(true)
                                                                    investNode_Alert_Txt:SetShow(true)
                                                                    investNode_Alert_Txt:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_INVESTNODE_ALERT_TXT"))
                                                                    if intimacyGame_Alert:GetShow() == true then
                                                                      investNode_Alert:SetPosX((_uiFuncButton[index]):GetPosX() + (_uiFuncButton[index]):GetSizeX() - 30)
                                                                    else
                                                                      investNode_Alert:SetPosX((_uiFuncButton[index]):GetPosX() - 35)
                                                                    end
                                                                    investNode_Alert:SetPosY((_uiFuncButton[index]):GetPosY() - 60)
                                                                    investNode_Alert_Txt:SetPosX(investNode_Alert:GetPosX() - 5)
                                                                    investNode_Alert_Txt:SetPosY(investNode_Alert:GetPosY())
                                                                    investNode_Alert_Txt:SetAutoResize(true)
                                                                    investNode_Alert_Txt:SetSize(investNode_Alert_Txt:GetTextSizeX(), investNode_Alert_Txt:GetTextSizeY())
                                                                    investNode_Alert:SetSize(investNode_Alert_Txt:GetSizeX() + 70, investNode_Alert_Txt:GetSizeY() + 34)
                                                                  else
                                                                    investNode_Alert:SetShow(false)
                                                                    investNode_Alert_Txt:SetShow(false)
                                                                  end
                                                                else
                                                                  do
                                                                    if funcButtonType == (CppEnums.ContentsType).Contents_DeliveryPerson then
                                                                      (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 199, 155, 231)
                                                                      ;
                                                                      ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                      ;
                                                                      (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                      ;
                                                                      (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 199, 310, 231)
                                                                      ;
                                                                      ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                      ;
                                                                      (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 199, 465, 231)
                                                                      ;
                                                                      ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                    else
                                                                      do
                                                                        if funcButtonType == (CppEnums.ContentsType).Contents_Enchant then
                                                                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 232, 155, 264)
                                                                          ;
                                                                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                          ;
                                                                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                          ;
                                                                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 232, 310, 264)
                                                                          ;
                                                                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                          ;
                                                                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 232, 465, 264)
                                                                          ;
                                                                          ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                          local posX = (_uiFuncButton[index]):GetPosX()
                                                                          local posY = (_uiFuncButton[index]):GetPosY()
                                                                          if isBlackStone_16001 or isBlackStone_16002 then
                                                                            (_uiFuncButton[index]):EraseAllEffect()
                                                                            ;
                                                                            (_uiFuncButton[index]):AddEffect("fUI_EnchantButton_Dark", false, 0, 0)
                                                                          end
                                                                        else
                                                                          do
                                                                            if funcButtonType == (CppEnums.ContentsType).Contents_Socket then
                                                                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 265, 155, 297)
                                                                              ;
                                                                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                              ;
                                                                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                              ;
                                                                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 265, 310, 297)
                                                                              ;
                                                                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                              ;
                                                                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 265, 465, 297)
                                                                              ;
                                                                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                              local posX = (_uiFuncButton[index]):GetPosX()
                                                                              local posY = (_uiFuncButton[index]):GetPosY()
                                                                              if value_IsSocket == true then
                                                                                (_uiFuncButton[index]):EraseAllEffect()
                                                                                ;
                                                                                (_uiFuncButton[index]):AddEffect("fUI_EnchantButton_Jewel", false, 0, 0)
                                                                              end
                                                                            else
                                                                              do
                                                                                if funcButtonType == (CppEnums.ContentsType).Contents_Awaken then
                                                                                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_10.dds")
                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 232, 155, 264)
                                                                                  ;
                                                                                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                  ;
                                                                                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                  ;
                                                                                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_10.dds")
                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 232, 310, 264)
                                                                                  ;
                                                                                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                  ;
                                                                                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_10.dds")
                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 232, 465, 264)
                                                                                  ;
                                                                                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                  ;
                                                                                  (_uiFuncButton[index]):AddEffect("fUI_Skill_Up_01A", true, 0, 0)
                                                                                  ;
                                                                                  (_uiFuncButton[index]):AddEffect("UI_Skill_Up_1", true, 0, 0)
                                                                                else
                                                                                  do
                                                                                    if funcButtonType == (CppEnums.ContentsType).Contents_ReAwaken then
                                                                                      (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                      ;
                                                                                      ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                      ;
                                                                                      (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                      ;
                                                                                      (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                      ;
                                                                                      ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                      ;
                                                                                      (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                      ;
                                                                                      ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                      ;
                                                                                      (_uiFuncButton[index]):SetMonoTone(false)
                                                                                      ;
                                                                                      (_uiFuncButton[index]):AddEffect("fUI_Skill_ReUp_01A", true, 0, 0)
                                                                                      ;
                                                                                      (_uiFuncButton[index]):AddEffect("UI_Skill_ReUp_1", true, 0, 0)
                                                                                    else
                                                                                      do
                                                                                        if funcButtonType == (CppEnums.ContentsType).Contents_LordMenu then
                                                                                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                          ;
                                                                                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                          ;
                                                                                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                          ;
                                                                                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                          ;
                                                                                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                          ;
                                                                                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                          ;
                                                                                          ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                          ;
                                                                                          (_uiFuncButton[index]):SetMonoTone(false)
                                                                                        else
                                                                                          do
                                                                                            if funcButtonType == (CppEnums.ContentsType).Contents_Extract then
                                                                                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                              ;
                                                                                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                              ;
                                                                                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                              ;
                                                                                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                              ;
                                                                                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                              ;
                                                                                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                              ;
                                                                                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                              ;
                                                                                              (_uiFuncButton[index]):SetMonoTone(false)
                                                                                            else
                                                                                              do
                                                                                                if funcButtonType == (CppEnums.ContentsType).Contents_TerritoryTrade then
                                                                                                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                                  ;
                                                                                                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                  ;
                                                                                                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                  ;
                                                                                                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                                  ;
                                                                                                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                  ;
                                                                                                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                                  ;
                                                                                                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                  ;
                                                                                                  (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                else
                                                                                                  do
                                                                                                    if funcButtonType == (CppEnums.ContentsType).Contents_TerritorySupply then
                                                                                                      (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                                      ;
                                                                                                      ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                      ;
                                                                                                      (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                      ;
                                                                                                      (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                                      ;
                                                                                                      ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                      ;
                                                                                                      (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                                      ;
                                                                                                      ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                      ;
                                                                                                      (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                    else
                                                                                                      do
                                                                                                        if funcButtonType == (CppEnums.ContentsType).Contents_GuildShop then
                                                                                                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 34, 155, 66)
                                                                                                          ;
                                                                                                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                          ;
                                                                                                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                          ;
                                                                                                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 34, 310, 66)
                                                                                                          ;
                                                                                                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                          ;
                                                                                                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 34, 465, 66)
                                                                                                          ;
                                                                                                          ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                          ;
                                                                                                          (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                        else
                                                                                                          do
                                                                                                            if funcButtonType == (CppEnums.ContentsType).Contents_ItemMarket then
                                                                                                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_03.dds")
                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 166, 155, 198)
                                                                                                              ;
                                                                                                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                              ;
                                                                                                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                              ;
                                                                                                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_03.dds")
                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 166, 310, 198)
                                                                                                              ;
                                                                                                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                              ;
                                                                                                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_03.dds")
                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 166, 465, 198)
                                                                                                              ;
                                                                                                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                              ;
                                                                                                              (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                            else
                                                                                                              do
                                                                                                                if funcButtonType == (CppEnums.ContentsType).Contents_Knowledge then
                                                                                                                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                                                  ;
                                                                                                                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                  ;
                                                                                                                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                  ;
                                                                                                                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                                                  ;
                                                                                                                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                  ;
                                                                                                                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                                                  ;
                                                                                                                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                  ;
                                                                                                                  (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                else
                                                                                                                  do
                                                                                                                    if funcButtonType == (CppEnums.ContentsType).Contents_HelpDesk then
                                                                                                                      (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                                                      ;
                                                                                                                      ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                      ;
                                                                                                                      (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                      ;
                                                                                                                      (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                                                      ;
                                                                                                                      ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                      ;
                                                                                                                      (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                                                      ;
                                                                                                                      ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                      ;
                                                                                                                      (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                    else
                                                                                                                      do
                                                                                                                        if funcButtonType == (CppEnums.ContentsType).Contents_SupplyShop then
                                                                                                                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                                                          ;
                                                                                                                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                          ;
                                                                                                                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                          ;
                                                                                                                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                                                          ;
                                                                                                                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                          ;
                                                                                                                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                                                          ;
                                                                                                                          ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                          ;
                                                                                                                          (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                        else
                                                                                                                          do
                                                                                                                            if funcButtonType == (CppEnums.ContentsType).Contents_MinorLordMenu then
                                                                                                                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_06.dds")
                                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 100, 155, 132)
                                                                                                                              ;
                                                                                                                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                              ;
                                                                                                                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                              ;
                                                                                                                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_06.dds")
                                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 100, 310, 132)
                                                                                                                              ;
                                                                                                                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                              ;
                                                                                                                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_06.dds")
                                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 100, 465, 132)
                                                                                                                              ;
                                                                                                                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                              ;
                                                                                                                              (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                            else
                                                                                                                              do
                                                                                                                                if funcButtonType == (CppEnums.ContentsType).Contents_FishSupplyShop then
                                                                                                                                  (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                                                                  ;
                                                                                                                                  ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                  ;
                                                                                                                                  (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                                  ;
                                                                                                                                  (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                                                                  ;
                                                                                                                                  ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                  ;
                                                                                                                                  (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                                  local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                                                                  ;
                                                                                                                                  ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                  ;
                                                                                                                                  (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                                else
                                                                                                                                  do
                                                                                                                                    if funcButtonType == (CppEnums.ContentsType).Contents_GuildSupplyShop then
                                                                                                                                      (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 331, 155, 363)
                                                                                                                                      ;
                                                                                                                                      ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                      ;
                                                                                                                                      (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                                      ;
                                                                                                                                      (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 331, 310, 363)
                                                                                                                                      ;
                                                                                                                                      ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                      ;
                                                                                                                                      (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
                                                                                                                                      local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 331, 465, 363)
                                                                                                                                      ;
                                                                                                                                      ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                      ;
                                                                                                                                      (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                                    else
                                                                                                                                      do
                                                                                                                                        if funcButtonType == (CppEnums.ContentsType).Contents_Join then
                                                                                                                                          (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_08.dds")
                                                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 34, 155, 66)
                                                                                                                                          ;
                                                                                                                                          ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                          ;
                                                                                                                                          (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                                          ;
                                                                                                                                          (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_08.dds")
                                                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 34, 310, 66)
                                                                                                                                          ;
                                                                                                                                          ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                          ;
                                                                                                                                          (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_08.dds")
                                                                                                                                          local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 34, 465, 66)
                                                                                                                                          ;
                                                                                                                                          ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                          ;
                                                                                                                                          (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                                        else
                                                                                                                                          do
                                                                                                                                            if funcButtonType == (CppEnums.ContentsType).Contents_Improve then
                                                                                                                                              (_uiFuncButton[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_10.dds")
                                                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 1, 1, 155, 33)
                                                                                                                                              ;
                                                                                                                                              ((_uiFuncButton[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                              ;
                                                                                                                                              (_uiFuncButton[index]):setRenderTexture((_uiFuncButton[index]):getBaseTexture())
                                                                                                                                              ;
                                                                                                                                              (_uiFuncButton[index]):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_10.dds")
                                                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 156, 1, 310, 33)
                                                                                                                                              ;
                                                                                                                                              ((_uiFuncButton[index]):getOnTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                              ;
                                                                                                                                              (_uiFuncButton[index]):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_10.dds")
                                                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(_uiFuncButton[index], 311, 1, 465, 33)
                                                                                                                                              ;
                                                                                                                                              ((_uiFuncButton[index]):getClickTexture()):setUV(x1, y1, x2, y2)
                                                                                                                                              ;
                                                                                                                                              (_uiFuncButton[index]):SetMonoTone(false)
                                                                                                                                            end
                                                                                                                                            do
                                                                                                                                              do
                                                                                                                                                ;
                                                                                                                                                (_uiFuncButton[index]):SetShow(false)
                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out DO_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                                                                                                                -- DECOMPILER ERROR at PC4835: LeaveBlock: unexpected jumping out IF_STMT

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
      if 6 < funcButtonCount then
        funcButtonCount = 6
      end
      if 0 == funcButtonCount then
        _uiButtonBack:SetSize(160, 32)
        _uiButtonExit:SetSize(160, 32)
        _uiButtonBack:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 1, 364, 155, 396)
        ;
        (_uiButtonBack:getBaseTexture()):setUV(x1, y1, x2, y2)
        _uiButtonBack:setRenderTexture(_uiButtonBack:getBaseTexture())
        _uiButtonBack:ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 156, 364, 310, 396)
        ;
        (_uiButtonBack:getOnTexture()):setUV(x1, y1, x2, y2)
        _uiButtonBack:ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 311, 364, 465, 396)
        ;
        (_uiButtonBack:getClickTexture()):setUV(x1, y1, x2, y2)
        _uiButtonExit:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 1, 199, 155, 231)
        ;
        (_uiButtonExit:getBaseTexture()):setUV(x1, y1, x2, y2)
        _uiButtonExit:setRenderTexture(_uiButtonExit:getBaseTexture())
        _uiButtonExit:ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 156, 199, 310, 231)
        ;
        (_uiButtonExit:getOnTexture()):setUV(x1, y1, x2, y2)
        _uiButtonExit:ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 311, 199, 465, 231)
        ;
        (_uiButtonExit:getClickTexture()):setUV(x1, y1, x2, y2)
        _uiButtonBack:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NPC_DIALOG_BACK"))
        _uiButtonExit:SetText(PAGetString(Defines.StringSheet_RESOURCE, "DIALOGUE_BTN_EXIT"))
        _uiButtonBack:SetPosX((sizeX - (buttonSize * 2 + buttonGap * 1)) / 2)
        _uiButtonExit:SetPosX((sizeX - (buttonSize * 2 + buttonGap * 1)) / 2 + buttonSize + buttonGap)
      else
        do
          if 0 < (_uiFuncButton[0]):GetPosX() - buttonSize - buttonGap then
            _uiButtonBack:SetSize(160, 32)
            _uiButtonExit:SetSize(160, 32)
            _uiButtonBack:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 1, 364, 155, 396)
            ;
            (_uiButtonBack:getBaseTexture()):setUV(x1, y1, x2, y2)
            _uiButtonBack:setRenderTexture(_uiButtonBack:getBaseTexture())
            _uiButtonBack:ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 156, 364, 310, 396)
            ;
            (_uiButtonBack:getOnTexture()):setUV(x1, y1, x2, y2)
            _uiButtonBack:ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 311, 364, 465, 396)
            ;
            (_uiButtonBack:getClickTexture()):setUV(x1, y1, x2, y2)
            _uiButtonExit:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 1, 199, 155, 231)
            ;
            (_uiButtonExit:getBaseTexture()):setUV(x1, y1, x2, y2)
            _uiButtonExit:setRenderTexture(_uiButtonExit:getBaseTexture())
            _uiButtonExit:ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 156, 199, 310, 231)
            ;
            (_uiButtonExit:getOnTexture()):setUV(x1, y1, x2, y2)
            _uiButtonExit:ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 311, 199, 465, 231)
            ;
            (_uiButtonExit:getClickTexture()):setUV(x1, y1, x2, y2)
            _uiButtonBack:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NPC_DIALOG_BACK"))
            _uiButtonExit:SetText(PAGetString(Defines.StringSheet_RESOURCE, "DIALOGUE_BTN_EXIT"))
            _uiButtonBack:SetPosX((_uiFuncButton[0]):GetPosX() - buttonSize - buttonGap)
            _uiButtonExit:SetPosX((_uiFuncButton[funcButtonCount - 1]):GetPosX() + buttonSize + buttonGap)
          else
            do
              _uiButtonBack:SetSize(32, 32)
              _uiButtonExit:SetSize(32, 32)
              _uiButtonBack:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_09.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 1, 100, 33, 132)
              ;
              (_uiButtonBack:getBaseTexture()):setUV(x1, y1, x2, y2)
              _uiButtonBack:setRenderTexture(_uiButtonBack:getBaseTexture())
              _uiButtonBack:ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_09.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 156, 100, 188, 132)
              ;
              (_uiButtonBack:getOnTexture()):setUV(x1, y1, x2, y2)
              _uiButtonBack:ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_09.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonBack, 311, 100, 343, 132)
              ;
              (_uiButtonBack:getClickTexture()):setUV(x1, y1, x2, y2)
              _uiButtonExit:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_09.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 1, 133, 33, 165)
              ;
              (_uiButtonExit:getBaseTexture()):setUV(x1, y1, x2, y2)
              _uiButtonExit:setRenderTexture(_uiButtonExit:getBaseTexture())
              _uiButtonExit:ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_09.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 156, 133, 188, 165)
              ;
              (_uiButtonExit:getOnTexture()):setUV(x1, y1, x2, y2)
              _uiButtonExit:ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_09.dds")
              do
                local x1, y1, x2, y2 = setTextureUV_Func(_uiButtonExit, 311, 133, 343, 165)
                ;
                (_uiButtonExit:getClickTexture()):setUV(x1, y1, x2, y2)
                _uiButtonBack:SetText("")
                _uiButtonExit:SetText("")
                _uiButtonBack:SetPosX((_uiFuncButton[0]):GetPosX() - buttonGap * 4)
                _uiButtonExit:SetPosX((_uiFuncButton[funcButtonCount - 1]):GetPosX() + buttonSize + buttonGap)
                Panel_Npc_Quest_Reward:SetPosX(sizeX - Panel_Npc_Quest_Reward:GetSizeX())
                Panel_Npc_Quest_Reward:SetPosY(sizeY - Panel_Npc_Quest_Reward:GetSizeY() - Panel_Npc_Dialog:GetSizeY())
                FGlobal_ShowRewardList(isVisible)
                _SpacebarIcon:SetPosX(_rBtnPosX + _SpacebarIcon:GetSizeX() + 10)
                _SpacebarIcon:SetPosY(_rBtnPosY)
                if isShowReContactDialog() or _uiNextButton:GetShow() or isShowDialogFunctionQuest() or -1 < questDialogIndex() or -1 < exchangalbeButtonIndex() then
                  _SpacebarIcon:SetShow(true)
                  if 1 == _btnPositionType then
                    _SpacebarIcon:SetPosX(_rBtnPosX + _SpacebarIcon:GetSizeX() + 10)
                    _SpacebarIcon:SetPosY(_rBtnPosY)
                  else
                    if 2 == _btnPositionType then
                      _SpacebarIcon:SetPosX(_rBtnPosX + _SpacebarIcon:GetSizeX() + 10)
                      _SpacebarIcon:SetPosY(_rBtnPosY)
                    else
                      if 3 == _btnPositionType then
                        _SpacebarIcon:SetPosX(startPosX + buttonSize - _SpacebarIcon:GetSizeX() - 5)
                        _SpacebarIcon:SetPosY((_uiFuncButton[0]):GetPosY() + 5)
                      else
                        if 4 == _btnPositionType then
                          _SpacebarIcon:SetPosX(_rBtnPosX + _SpacebarIcon:GetSizeX() + 10)
                          _SpacebarIcon:SetPosY(_questDialogButtonPosY)
                        else
                          if 5 == _btnPositionType then
                            _SpacebarIcon:SetPosX(_rBtnPosX + _SpacebarIcon:GetSizeX() + 10 + _rBtnPlusPosX)
                            _SpacebarIcon:SetPosY(_exchangalbeButtonPosY + 2)
                          end
                        end
                      end
                    end
                  end
                else
                  _SpacebarIcon:SetShow(false)
                end
                for i = 0, 5 do
                  if true == handleClickedQuestComplete and true == nextQuestFunctionBtnClick[i] then
                    handleClickedQuestComplete = false
                    -- DECOMPILER ERROR at PC5573: Confused about usage of register: R42 in 'UnsetPending'

                    nextQuestFunctionBtnClick[i] = false
                    Dialog_clickFuncButtonReq(i)
                    Panel_Interest_Knowledge_Hide()
                    if -1 < questDialogIndex() then
                      HandleClickedDialogButton(questDialogIndex())
                      handleClickedQuestComplete = false
                    end
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

FromClient_hideDialog = function(isSetWait)
  -- function num : 0_28 , upvalues : isAuctionDialog
  if Panel_Npc_Dialog:IsShow() == false then
    return 
  end
  SetUIMode((Defines.UIMode).eUIMode_Default)
  hide_DialogSceneUIPanel()
  InventoryWindow_Close()
  if Panel_Window_Warehouse:GetShow() then
    Warehouse_Close()
  end
  if Panel_CreateClan:GetShow() or Panel_CreateGuild:GetShow() then
    CreateClan_Close()
  end
  Panel_WorkerResist_Auction:SetShow(false)
  Panel_WorkerList_Auction:SetShow(false)
  FGolbal_ItemMarketNew_Close()
  Panel_Window_ItemMarket_RegistItem:SetShow(false)
  Panel_Window_Delivery_Information:SetShow(false)
  Panel_Window_Delivery_Request:SetShow(false)
  Panel_Dialogue_Itemtake:SetShow(false)
  Panel_SkillReinforce:SetShow(false)
  Panel_Window_ReinforceSkill:SetShow(false)
  Panel_Worker_Auction:SetShow(false)
  Panel_Window_WorkerRandomSelect:SetShow(false)
  randomSelectHide()
  DetectPlayer_Close()
  dialog_CloseNpcTalk(isSetWait)
  Panel_Npc_Dialog:ResetVertexAni()
  searchView_Close()
  setIgnoreShowDialog(false)
  FGlobal_ShowRewardList(false)
  setShowLine(true)
  _blackStone_CallingTime = 0
  setFullSizeMode(false, (FullSizeMode.fullSizeModeEnum).Dialog)
  HandleMLUp_SkillWindow_Close()
  click_DeliveryForPerson_Close()
  NpcShop_WindowClose()
  FGlobal_NodeWarMenuClose()
  if isMonsterBarShow then
    Panel_Monster_Bar:SetShow(true, false)
    isMonsterBarShow = false
  end
  if isNpcNaviShow then
    isNpcNaviShow = false
  end
  FGlobal_NpcNavi_ShowRequestOuter()
  AcquireDirecteReShowUpdate()
  isAuctionDialog = false
  if not isQuest160524_chk() then
    updateQuestWindowList(FGlobal_QuestWindowGetStartPosition())
  end
  FGlobal_QuestWidget_UpdateList()
  PaGlobalAppliedBuffList:show()
  setShowNpcDialog(false)
  ChatInput_Close()
  if Panel_Window_Exchange:IsShow() then
    ExchangePc_MessageBox_CloseConfirm()
  end
  Panel_Exchange_Item_Hide()
  Panel_Interest_Knowledge_Hide()
  FGlobal_Inventory_WeightCheck()
  Inventory_PosLoadMemory()
  UIMain_QuestUpdate()
  if ToClient_IsSavedUi() then
    ToClient_SaveUiInfo(false)
    ToClient_SetSavedUi(false)
  end
end

local _indexWhenWorkerShopClicked = nil
RandomWorkerSelectUseMyWpConfirm = function(index)
  -- function num : 0_29 , upvalues : _indexWhenWorkerShopClicked
  if index == nil then
    index = _indexWhenWorkerShopClicked
  end
  npcShop_requestList((CppEnums.ContentsType).Contents_Shop)
  Dialog_clickFuncButtonReq(index)
  Panel_Interest_Knowledge_Hide()
end

ClickFunctionButtonByType = function(type)
  -- function num : 0_30 , upvalues : _shopType, _indexWhenWorkerShopClicked
  if Panel_Win_System:GetShow() then
    return 
  end
  NpcShop_WindowClose()
  HandleMLUp_SkillWindow_Close()
  Warehouse_Close()
  FGlobal_ItemMarketRegistItem_Close()
  TerritoryAuth_Auction_Close()
  InventoryWindow_Close()
  Panel_Dialogue_Itemtake:SetShow(false)
  LordMenu_Hide()
  CreateClan_Close()
  Manufacture_Close()
  WorkerAuction_Close()
  Panel_Exchange_Item_Hide()
  Panel_Window_ReinforceSkill_Close()
  Panel_SkillReinforce_Close()
  local count = 0
  local targetWindowList = {}
  audioPostEvent_SystemUi(0, 0)
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local dlgFuncCnt = dialogData:getFuncButtonCount()
  if dlgFuncCnt <= 0 then
    return 
  end
  local funcButton = nil
  local funcButtonType = -1
  for index = 0, dlgFuncCnt - 1 do
    local afuncButton = dialogData:getFuncButtonAt(index)
    if afuncButton == nil then
      return 
    end
    afuncButtonType = tonumber(afuncButton._param)
    if afuncButtonType == type then
      funcButton = afuncButton
      funcButtonType = afuncButtonType
      break
    end
  end
  do
    if funcButton == nil then
      return 
    end
    local MyWp = (getSelfPlayer()):getWp()
    local inventory = ((getSelfPlayer()):get()):getInventory()
    local invenSize = inventory:getFreeCount()
    if (CppEnums.ContentsType).Contents_Shop == funcButtonType then
      local shopType = dialogData:getShopType()
      if _shopType.eShopType_Worker == shopType then
        _indexWhenWorkerShopClicked = index
        local pcPosition = ((getSelfPlayer()):get()):getPosition()
        local regionInfo = getRegionInfoByPosition(pcPosition)
        local region = regionInfo:get()
        local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
        local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
        local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
        local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
        local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
        do
          if s64_maxWeight <= s64_allWeight then
            local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTDESC"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageboxData)
            return 
          end
          do
            if ((getSelfPlayer()):get()):checkWorkerWorkingServerNo() ~= 0 then
              local messageboxData3 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ_NotSameServerNo"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageboxData3)
              return 
            end
            do
              if waitWorkerCount == maxWorkerCount then
                local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                ;
                (MessageBox.showMessageBox)(messageboxData)
                return 
              end
              do
                if MyWp >= 5 then
                  local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_WORKER", "MyWp", MyWp), functionYes = RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                  ;
                  (MessageBox.showMessageBox)(messageboxData2)
                  return 
                end
                if _shopType.eShopType_RandomShop == shopType then
                  local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
                  local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
                  do
                    if s64_maxWeight <= s64_allWeight then
                      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                      ;
                      (MessageBox.showMessageBox)(messageboxData)
                      return 
                    end
                    local IsRamdomShopkeepItem = ToClient_IsRandomShopKeepItem()
                    if IsRamdomShopkeepItem == false then
                      local randomShopConsumeWp = FromClient_getRandomShopConsumWp()
                      do
                        if invenSize <= 0 then
                          local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                          ;
                          (MessageBox.showMessageBox)(messageboxData)
                          return 
                        end
                        if MyWp < randomShopConsumeWp then
                          local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                          ;
                          (MessageBox.showMessageBox)(messageboxData2)
                          return 
                        else
                          do
                            do
                              if randomShopConsumeWp <= MyWp then
                                local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionYes = RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                ;
                                (MessageBox.showMessageBox)(messageboxData2)
                                return 
                              end
                              if _shopType.eShopType_DayRandomShop == shopType then
                                local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
                                local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
                                do
                                  if s64_maxWeight <= s64_allWeight then
                                    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                    ;
                                    (MessageBox.showMessageBox)(messageboxData)
                                    return 
                                  end
                                  local randomShopConsumeWp = 10
                                  do
                                    if invenSize <= 0 then
                                      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                      ;
                                      (MessageBox.showMessageBox)(messageboxData)
                                      return 
                                    end
                                    if MyWp < randomShopConsumeWp then
                                      local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                      ;
                                      (MessageBox.showMessageBox)(messageboxData2)
                                      return 
                                    else
                                      do
                                        do
                                          do
                                            if randomShopConsumeWp <= MyWp then
                                              local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionYes = RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                              ;
                                              (MessageBox.showMessageBox)(messageboxData2)
                                              return 
                                            end
                                            count = 2
                                            targetWindowList = {Panel_Window_NpcShop, Panel_Window_Inventory}
                                            show_DialogPanel()
                                            if (CppEnums.ContentsType).Contents_Skill == funcButtonType then
                                              count = 1
                                              targetWindowList = {Panel_Window_Skill}
                                            else
                                            end
                                            if (((CppEnums.ContentsType).Contents_Auction ~= funcButtonType or (CppEnums.ContentsType).Contents_Inn == funcButtonType) and (CppEnums.ContentsType).Contents_IntimacyGame ~= funcButtonType) or (CppEnums.ContentsType).Contents_DeliveryPerson == funcButtonType then
                                              count = 1
                                              targetWindowList = {Panel_Window_DeliveryForPerson}
                                            else
                                              if (CppEnums.ContentsType).Contents_Guild == funcButtonType then
                                                FGlobal_GuildCreateManagerPopup()
                                              else
                                              end
                                            end
                                            if (CppEnums.ContentsType).Contents_Explore ~= funcButtonType or (CppEnums.ContentsType).Contents_Enchant == funcButtonType then
                                              PaGlobal_Enchant:enchant_Show()
                                            else
                                              if (CppEnums.ContentsType).Contents_Socket == funcButtonType then
                                                Socket_Window_Show()
                                              else
                                                if (CppEnums.ContentsType).Contents_LordMenu == funcButtonType then
                                                  LordMenu_Show()
                                                else
                                                  if (CppEnums.ContentsType).Contents_Extract == funcButtonType then
                                                    extraction_Open()
                                                  else
                                                    if (CppEnums.ContentsType).Contents_TerritoryTrade == funcButtonType then
                                                      npcShop_requestList(funcButtonType)
                                                    else
                                                      if (CppEnums.ContentsType).Contents_TerritorySupply == funcButtonType then
                                                        npcShop_requestList(funcButtonType)
                                                      else
                                                        if (CppEnums.ContentsType).Contents_GuildShop == funcButtonType then
                                                          count = 2
                                                          targetWindowList = {Panel_Window_NpcShop, Panel_Window_Inventory}
                                                        else
                                                          if (CppEnums.ContentsType).Contents_SupplyShop == funcButtonType then
                                                            npcShop_requestList(funcButtonType)
                                                          else
                                                            if (CppEnums.ContentsType).Contents_FishSupplyShop == funcButtonType then
                                                              npcShop_requestList(funcButtonType)
                                                            else
                                                              if (CppEnums.ContentsType).Contents_GuildSupplyShop == funcButtonType then
                                                                npcShop_requestList(funcButtonType)
                                                              else
                                                                if (CppEnums.ContentsType).Contents_MinorLordMenu == funcButtonType then
                                                                  FGlobal_NodeWarMenuOpen()
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
                                            Dialog_innerPanelShow(count, targetWindowList)
                                            if (CppEnums.ContentsType).Contents_Shop == funcButtonType then
                                              npcShop_requestList(funcButtonType)
                                              FGlobal_NodeWarMenuClose()
                                            else
                                              if (CppEnums.ContentsType).Contents_Skill == funcButtonType then
                                                HandleMLUp_SkillWindow_OpenForLearn()
                                              else
                                                if (CppEnums.ContentsType).Contents_Repair == funcButtonType then
                                                  PaGlobal_Repair:repair_OpenPanel(true)
                                                else
                                                  if (CppEnums.ContentsType).Contents_Warehouse == funcButtonType then
                                                    Warehouse_OpenPanelFromDialog()
                                                  else
                                                    if (CppEnums.ContentsType).Contents_Stable == funcButtonType then
                                                      if isGuildStable() then
                                                        if (CppEnums.ServantType).Type_Vehicle == stable_getServantType() then
                                                          GuildStableFunction_Open()
                                                        else
                                                          if (CppEnums.ServantType).Type_Ship == stable_getServantType() then
                                                            GuildWharfFunction_Open()
                                                          end
                                                        end
                                                      else
                                                        warehouse_requestInfoFromNpc()
                                                        if (CppEnums.ServantType).Type_Vehicle == stable_getServantType() then
                                                          StableFunction_Open()
                                                        else
                                                          if (CppEnums.ServantType).Type_Ship == stable_getServantType() then
                                                            WharfFunction_Open()
                                                          else
                                                            PetFunction_Open()
                                                            PetList_Open()
                                                          end
                                                        end
                                                      end
                                                      show_DialogPanel()
                                                    else
                                                      if (CppEnums.ContentsType).Contents_Transfer == funcButtonType then
                                                        DeliveryInformation_OpenPanelFromDialog()
                                                      else
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                            if (CppEnums.ContentsType).Contents_Explore ~= funcButtonType or (CppEnums.ContentsType).Contents_DeliveryPerson == funcButtonType then
                                              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_ReMake"))
                                            else
                                              if (CppEnums.ContentsType).Contents_GuildShop == funcButtonType then
                                                npcShop_requestList(funcButtonType)
                                              else
                                                if (CppEnums.ContentsType).Contents_ItemMarket == funcButtonType then
                                                  if Panel_Window_ItemMarket:IsUISubApp() then
                                                    Panel_Window_ItemMarket:CloseUISubApp()
                                                    Panel_Window_ItemMarket:SetShow(false)
                                                  end
                                                  if not Panel_Window_ItemMarket:GetShow() then
                                                    FGolbal_ItemMarket_Function_Open()
                                                  else
                                                    FGolbal_ItemMarket_Function_Close()
                                                  end
                                                else
                                                  if (CppEnums.ContentsType).Contents_Knowledge == funcButtonType then
                                                    FGlobal_KnowledgeManagementShow()
                                                  else
                                                    if (CppEnums.ContentsType).Contents_Join == funcButtonType then
                                                      Panel_Join_Show()
                                                    else
                                                      if (CppEnums.ContentsType).Contents_Improve == funcButtonType then
                                                        Panel_Improvement_Show()
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                            Dialog_clickFuncButtonReq(index)
                                            Panel_Interest_Knowledge_Hide()
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

HandleClickedFuncButton = function(index)
  -- function num : 0_31 , upvalues : _shopType, _indexWhenWorkerShopClicked
  if Panel_Win_System:GetShow() then
    return 
  end
  NpcShop_WindowClose()
  HandleMLUp_SkillWindow_Close()
  Warehouse_Close()
  FGlobal_ItemMarketRegistItem_Close()
  TerritoryAuth_Auction_Close()
  InventoryWindow_Close()
  Panel_Dialogue_Itemtake:SetShow(false)
  LordMenu_Hide()
  CreateClan_Close()
  Manufacture_Close()
  WorkerAuction_Close()
  Panel_Exchange_Item_Hide()
  Panel_Window_ReinforceSkill_Close()
  Panel_SkillReinforce_Close()
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:enchantClose()
  end
  if Panel_Window_Socket:GetShow() then
    Socket_WindowClose()
  end
  if Panel_Improvement:GetShow() then
    Panel_Improvement_Hide()
  end
  if Panel_SkillAwaken:GetShow() then
    SkillAwaken_Close()
  end
  if Panel_Window_MasterpieceAuction:GetShow() then
    PaGlobal_MasterpieceAuction:close()
  end
  local count = 0
  local targetWindowList = {}
  audioPostEvent_SystemUi(0, 0)
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local dlgFuncCnt = dialogData:getFuncButtonCount()
  if dlgFuncCnt <= 0 then
    return 
  end
  local funcButton = dialogData:getFuncButtonAt(index)
  if funcButton == nil then
    return 
  end
  local funcButtonType = tonumber(funcButton._param)
  local MyWp = (getSelfPlayer()):getWp()
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local invenSize = inventory:getFreeCount()
  if (CppEnums.ContentsType).Contents_Shop == funcButtonType then
    local shopType = dialogData:getShopType()
    if _shopType.eShopType_Worker == shopType then
      _indexWhenWorkerShopClicked = index
      local pcPosition = ((getSelfPlayer()):get()):getPosition()
      local regionInfo = getRegionInfoByPosition(pcPosition)
      local region = regionInfo:get()
      local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
      local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
      local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
      local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
      local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
      do
        if s64_maxWeight <= s64_allWeight then
          local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTDESC"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
          return 
        end
        do
          if ((getSelfPlayer()):get()):checkWorkerWorkingServerNo() ~= 0 then
            local messageboxData3 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ_NotSameServerNo"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageboxData3)
            return 
          end
          do
            if waitWorkerCount == maxWorkerCount then
              local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"), content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageboxData)
              return 
            end
            do
              if MyWp >= 5 then
                local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_WORKER", "MyWp", MyWp), functionYes = RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                ;
                (MessageBox.showMessageBox)(messageboxData2)
                return 
              end
              if _shopType.eShopType_RandomShop == shopType then
                do
                  if invenSize <= 0 then
                    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                    ;
                    (MessageBox.showMessageBox)(messageboxData)
                    return 
                  end
                  local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
                  local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
                  do
                    if s64_maxWeight <= s64_allWeight then
                      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                      ;
                      (MessageBox.showMessageBox)(messageboxData)
                      return 
                    end
                    local IsRamdomShopkeepItem = ToClient_IsRandomShopKeepItem()
                    if IsRamdomShopkeepItem == false then
                      local randomShopConsumeWp = FromClient_getRandomShopConsumWp()
                      if MyWp < randomShopConsumeWp then
                        local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                        ;
                        (MessageBox.showMessageBox)(messageboxData2)
                        return 
                      else
                        do
                          do
                            if randomShopConsumeWp <= MyWp then
                              local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionYes = RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                              ;
                              (MessageBox.showMessageBox)(messageboxData2)
                              return 
                            end
                            if _shopType.eShopType_DayRandomShop == shopType then
                              do
                                if invenSize <= 0 then
                                  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_FREESLOT"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                  ;
                                  (MessageBox.showMessageBox)(messageboxData)
                                  return 
                                end
                                local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
                                local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
                                do
                                  if s64_maxWeight <= s64_allWeight then
                                    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHTOVER_ALERTTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_SECRETSHOP_WEIGHTOVER"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                    ;
                                    (MessageBox.showMessageBox)(messageboxData)
                                    return 
                                  end
                                  local randomShopConsumeWp = 10
                                  if MyWp < randomShopConsumeWp then
                                    local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_LACK_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                    ;
                                    (MessageBox.showMessageBox)(messageboxData2)
                                    return 
                                  else
                                    do
                                      do
                                        do
                                          if randomShopConsumeWp <= MyWp then
                                            local messageboxData2 = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_MAIN_CONFIRM_RANDOMITEM_WP", "randomShopConsumeWp", randomShopConsumeWp, "MyWp", MyWp), functionYes = RandomWorkerSelectUseMyWpConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                            ;
                                            (MessageBox.showMessageBox)(messageboxData2)
                                            return 
                                          end
                                          count = 2
                                          targetWindowList = {Panel_Window_NpcShop, Panel_Window_Inventory}
                                          show_DialogPanel()
                                          if (CppEnums.ContentsType).Contents_Skill == funcButtonType then
                                            count = 1
                                            targetWindowList = {Panel_Window_Skill}
                                          else
                                          end
                                          if (((CppEnums.ContentsType).Contents_Auction ~= funcButtonType or (CppEnums.ContentsType).Contents_Inn == funcButtonType) and (CppEnums.ContentsType).Contents_IntimacyGame ~= funcButtonType) or (CppEnums.ContentsType).Contents_DeliveryPerson == funcButtonType then
                                            count = 1
                                            targetWindowList = {Panel_Window_DeliveryForPerson}
                                          else
                                            if (CppEnums.ContentsType).Contents_Guild == funcButtonType then
                                              FGlobal_GuildCreateManagerPopup()
                                            else
                                            end
                                          end
                                          if (CppEnums.ContentsType).Contents_Explore ~= funcButtonType or (CppEnums.ContentsType).Contents_Enchant == funcButtonType then
                                            PaGlobal_Enchant:enchant_Show()
                                          else
                                            if (CppEnums.ContentsType).Contents_Socket == funcButtonType then
                                              Socket_Window_Show()
                                            else
                                              if (CppEnums.ContentsType).Contents_LordMenu == funcButtonType then
                                                LordMenu_Show()
                                              else
                                                if (CppEnums.ContentsType).Contents_Extract == funcButtonType then
                                                  extraction_Open()
                                                else
                                                  if (CppEnums.ContentsType).Contents_TerritoryTrade == funcButtonType then
                                                    npcShop_requestList(funcButtonType)
                                                  else
                                                    if (CppEnums.ContentsType).Contents_TerritorySupply == funcButtonType then
                                                      npcShop_requestList(funcButtonType)
                                                    else
                                                      if (CppEnums.ContentsType).Contents_GuildShop == funcButtonType then
                                                        count = 2
                                                        targetWindowList = {Panel_Window_NpcShop, Panel_Window_Inventory}
                                                      else
                                                        if (CppEnums.ContentsType).Contents_SupplyShop == funcButtonType then
                                                          npcShop_requestList(funcButtonType)
                                                        else
                                                          if (CppEnums.ContentsType).Contents_FishSupplyShop == funcButtonType then
                                                            npcShop_requestList(funcButtonType)
                                                          else
                                                            if (CppEnums.ContentsType).Contents_GuildSupplyShop == funcButtonType then
                                                              npcShop_requestList(funcButtonType)
                                                            else
                                                              if (CppEnums.ContentsType).Contents_MinorLordMenu == funcButtonType then
                                                                FGlobal_NodeWarMenuOpen()
                                                              else
                                                                if (CppEnums.ContentsType).Contents_Improve == funcButtonType then
                                                                  Panel_Improvement_Show()
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
                                          Dialog_innerPanelShow(count, targetWindowList)
                                          if (CppEnums.ContentsType).Contents_Shop == funcButtonType then
                                            npcShop_requestList(funcButtonType)
                                            FGlobal_NodeWarMenuClose()
                                          else
                                            if (CppEnums.ContentsType).Contents_Skill == funcButtonType then
                                              HandleMLUp_SkillWindow_OpenForLearn()
                                            else
                                              if (CppEnums.ContentsType).Contents_Repair == funcButtonType then
                                                PaGlobal_Repair:repair_OpenPanel(true)
                                              else
                                                if (CppEnums.ContentsType).Contents_Warehouse == funcButtonType then
                                                  Warehouse_OpenPanelFromDialog()
                                                else
                                                  if (CppEnums.ContentsType).Contents_Stable == funcButtonType then
                                                    if isGuildStable() then
                                                      if (CppEnums.ServantType).Type_Vehicle == stable_getServantType() then
                                                        GuildStableFunction_Open()
                                                      else
                                                        if (CppEnums.ServantType).Type_Ship == stable_getServantType() then
                                                          GuildWharfFunction_Open()
                                                        end
                                                      end
                                                    else
                                                      warehouse_requestInfoFromNpc()
                                                      if (CppEnums.ServantType).Type_Vehicle == stable_getServantType() then
                                                        StableFunction_Open()
                                                      else
                                                        if (CppEnums.ServantType).Type_Ship == stable_getServantType() then
                                                          WharfFunction_Open()
                                                        else
                                                          PetFunction_Open()
                                                          PetList_Open()
                                                        end
                                                      end
                                                    end
                                                    show_DialogPanel()
                                                  else
                                                    if (CppEnums.ContentsType).Contents_Transfer == funcButtonType then
                                                      DeliveryInformation_OpenPanelFromDialog()
                                                    else
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                          if (CppEnums.ContentsType).Contents_Explore ~= funcButtonType or (CppEnums.ContentsType).Contents_DeliveryPerson == funcButtonType then
                                            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_ReMake"))
                                          else
                                            if (CppEnums.ContentsType).Contents_GuildShop == funcButtonType then
                                              npcShop_requestList(funcButtonType)
                                            else
                                              if (CppEnums.ContentsType).Contents_ItemMarket == funcButtonType then
                                                if Panel_Window_ItemMarket:IsUISubApp() then
                                                  Panel_Window_ItemMarket:CloseUISubApp()
                                                  Panel_Window_ItemMarket:SetShow(false)
                                                end
                                                if not Panel_Window_ItemMarket:GetShow() then
                                                  FGolbal_ItemMarket_Function_Open()
                                                else
                                                  FGolbal_ItemMarket_Function_Close()
                                                end
                                              else
                                                if (CppEnums.ContentsType).Contents_Knowledge == funcButtonType then
                                                  FGlobal_KnowledgeManagementShow()
                                                else
                                                  if (CppEnums.ContentsType).Contents_Join == funcButtonType then
                                                    Panel_Join_Show()
                                                  end
                                                end
                                              end
                                            end
                                          end
                                          PaGlobal_TutorialManager:handleClickedDialogFuncButton(funcButtonType)
                                          Dialog_clickFuncButtonReq(index)
                                          Panel_Interest_Knowledge_Hide()
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

FGlobal_FirstLearnSkill_WindowShow = function()
  -- function num : 0_32 , upvalues : _skillTutorial
  _skillTutorial = true
  HandleClickedFuncButton((CppEnums.ContentsType).Contents_Skill)
  _skillTutorial = false
end

isSkillLearnTutorial = function()
  -- function num : 0_33 , upvalues : _skillTutorial
  return _skillTutorial
end

FGlobal_Dialog_TradeOpen = function()
  -- function num : 0_34 , upvalues : tradeIndex
  if tradeIndex >= 0 then
    HandleClickedFuncButton(tradeIndex)
  end
end

Dialog_innerPanelShow = function(count, targetWindowList)
  -- function num : 0_35
  if count <= 0 then
    return 
  end
  dialog_setPositionSelectList(count)
  local index = 0
  for _,v in pairs(targetWindowList) do
    dialog_setPositionSelectSizeSet(index, v:GetSizeX(), v:GetSizeY())
    index = index + 1
  end
  dialog_calcPositionSelectList()
  index = 0
  for _,v in pairs(targetWindowList) do
    if v:GetShow() == false then
      local pos = dialog_PositionSelect(index)
      if (pos.x ~= 0 or pos.y ~= 0) and (v == Panel_Window_Inventory) then
        v:ComputePos()
        v:SetPosX(pos.x)
        v:SetPosY(pos.y)
        index = index + 1
      else
        break
      end
    end
  end
end

HandleClickedDialogButton = function(index)
  -- function num : 0_36 , upvalues : _doConfirmIndex, _isQuestComplete
  if Panel_Win_System:GetShow() then
    return 
  end
  local _selectRewardItemName = FGlobal_SelectedRewardConfirm()
  _doConfirmIndex = index
  if _selectRewardItemName ~= false and _isQuestComplete == true then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NOTIFICATIONS_SELECTREWARD", "_selectRewardItemName", _selectRewardItemName)
    local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = _doConfirmYes, functionNo = _doConfirmNo, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "middle")
    return 
  else
    do
      HandleClickedDialogButtonReal(_doConfirmIndex)
    end
  end
end

_doConfirmYes = function()
  -- function num : 0_37 , upvalues : _doConfirmIndex
  FGlobal_SelectRewardItemNameClear()
  HandleClickedDialogButtonReal(_doConfirmIndex)
end

_doConfirmNo = function()
  -- function num : 0_38
end

HandleClickedDialogButtonReal = function(index)
  -- function num : 0_39 , upvalues : _dialogIndex, handleClickedQuestComplete, UI_BTN_TYPE, UI_DS
  local dialogData = ToClient_GetCurrentDialogData()
  local dlgBtnCnt = dialogData:getDialogButtonCount()
  if dlgBtnCnt <= 0 then
    _PA_LOG("�\128창욱", "from. 최대�\184. 다이얼로�\184 lua 2011라인. 이런일이 생기�\180 안됩니다. 확인해주세요")
    return 
  end
  index = index + _dialogIndex
  local clickDialogButtonReq = function()
    -- function num : 0_39_0 , upvalues : index, handleClickedQuestComplete
    local displayData = Dialog_getButtonDisplayData(index)
    local questInfo = questList_isClearQuest(1038, 2)
    if displayData:empty() then
      Dialog_clickDialogButtonReq(index)
      if questInfo then
        handleClickedQuestComplete = false
      else
        if ((getSelfPlayer()):get()):getLevel() > 10 then
          handleClickedQuestComplete = false
        else
          handleClickedQuestComplete = true
        end
      end
    else
      TalkPopup_SelectedIndex(index)
      TalkPopup_Show(displayData)
    end
  end

  if isCheckExchangeItemButton(index) == true then
    audioPostEvent_SystemUi(0, 17)
    local dialogButton = dialogData:getDialogButtonAt(index)
    do
      if ExpirationItemCheck(dialogButton:getNeedItemKey()) then
        local CancelExchange = function()
    -- function num : 0_39_1
    return 
  end

        do
          local GoExchange = function()
    -- function num : 0_39_2 , upvalues : index
    HandleClickedDialogButton_ShowData(index)
  end

          local stringExchange = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_ITEMEXCHANGE_EXPIRATIONCHECK")
          local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_ITEMEXCHANGE_TITLE"), content = stringExchange, functionYes = GoExchange, functionNo = CancelExchange, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
        end
      else
        do
          do
            local needItemCount = dialogButton:getNeedItemCount()
            if UI_BTN_TYPE.eDialogButton_Exchange == dialogButton._dialogButtonType and needItemCount > 0 then
              local itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
              if itemStaticWrapper ~= nil then
                local itemCount = ExchangeItem_HaveCount(dialogButton:getNeedItemKey())
                if itemCount > 0 then
                  local exchangeCount = (math.floor)(itemCount / needItemCount)
                  if exchangeCount > 1 and dialogButton._isValidMultipleExchange then
                    local dialogExchangeCountSet = function(inputNum)
    -- function num : 0_39_3 , upvalues : dialogButton, dialogData, clickDialogButtonReq, needItemCount
    local itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
    local _exchangeCount = Int64toInt32(inputNum)
    local doExchange = function()
      -- function num : 0_39_3_0 , upvalues : dialogData, _exchangeCount, clickDialogButtonReq
      dialogData:setExchangeCount(_exchangeCount)
      clickDialogButtonReq()
    end

    local exchangeOne = function()
      -- function num : 0_39_3_1 , upvalues : dialogData, clickDialogButtonReq
      dialogData:setExchangeCount(1)
      clickDialogButtonReq()
    end

    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_EXCHANGEITEM", "itemName", itemStaticWrapper:getName(), "count", _exchangeCount * needItemCount)
    local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doExchange, functionNo = exchangeOne, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "middle")
  end

                    Panel_NumberPad_Show(true, toInt64(0, exchangeCount), 0, dialogExchangeCountSet)
                    return 
                  end
                end
              end
            end
            do
              clickDialogButtonReq()
            end
            local dialogButton = dialogData:getDialogButtonAt(index)
            local linkType = dialogButton._linkType
            if UI_BTN_TYPE.eDialogButton_CutScene == dialogButton._dialogButtonType and UI_DS.eDialogState_Talk == tostring(linkType) then
              FGlobal_SetIsCutScenePlay(true)
            end
            HandleClickedDialogButton_ShowData(index)
          end
        end
      end
    end
  end
end

ExchangeItem_HaveCount = function(itemKey)
  -- function num : 0_40
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local itemCount = 0
  local inventory = selfProxy:getInventory()
  local invenUseSize = ((getSelfPlayer()):get()):getInventorySlotCount(true)
  local useStartSlot = inventorySlotNoUserStart()
  local invenSize = invenUseSize - useStartSlot
  for i = 1, invenSize - 1 do
    if not inventory:empty(i) then
      local itemWrapper = getInventoryItem(i)
      if itemWrapper ~= nil and itemKey == ((itemWrapper:get()):getKey()):getItemKey() then
        itemCount = Int64toInt32((itemWrapper:get()):getCount_s64())
        return itemCount
      end
    end
  end
  return itemCount
end

HandleClickedDialogButton_ShowData = function(index)
  -- function num : 0_41 , upvalues : handleClickedQuestComplete
  local displayData = Dialog_getButtonDisplayData(index)
  local questInfo = questList_isClearQuest(1038, 2)
  if displayData:empty() then
    Dialog_clickDialogButtonReq(index)
    if questInfo then
      handleClickedQuestComplete = false
    else
      if ((getSelfPlayer()):get()):getLevel() > 10 then
        handleClickedQuestComplete = false
      else
        handleClickedQuestComplete = true
      end
    end
  else
    TalkPopup_SelectedIndex(index)
    TalkPopup_Show(displayData)
  end
end

ExpirationItemCheck = function(itemKey)
  -- function num : 0_42
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local inventory = selfProxy:getInventory()
  local invenSize = ((getSelfPlayer()):get()):getInventorySlotCount(true)
  for i = 1, invenSize - 1 do
    if not inventory:empty(i) then
      local itemWrapper = getInventoryItem(i)
      if itemWrapper ~= nil and itemKey == ((itemWrapper:get()):getKey()):getItemKey() then
        local itemExpiration = itemWrapper:getExpirationDate()
        if itemExpiration ~= nil and itemExpiration:isIndefinite() == false then
          local remainTime = Int64toInt32(getLeftSecond_s64(itemExpiration))
          if remainTime <= 0 then
            return true
          end
        end
      end
    end
  end
  return false
end

FGlobal_HideDialog = function()
  -- function num : 0_43 , upvalues : dialogShowCheck_Once, handleClickedQuestComplete
  if Panel_Win_System:GetShow() then
    return 
  end
  dialogShowCheck_Once = false
  ToClient_PopDialogueFlush()
  FromClient_WarehouseUpdate()
  Dialog_PageButton_Init()
  inventory_FlushRestoreFunc()
  handleClickedQuestComplete = false
  PaGlobal_ExtractionResult:setHide()
  if ((getSelfPlayer()):get()):getLevel() < 5 then
    Panel_Chat0:SetShow(false)
  end
  FGlobal_NewLocalWar_Show()
  PaGlobal_TutorialManager:handleAfterAndPopFlush()
  FGlobal_RemoteControl_Hide()
  FGlobal_RemoteControl_Show(1)
  RemoteControl_Interaction_ShowToggloe(true)
end

setIgnoreShowDialog = function(ignoreShowDialog)
  -- function num : 0_44 , upvalues : _ignoreShowDialog
  _ignoreShowDialog = ignoreShowDialog
end

dialog_CloseNpcTalk = function(isSetWait)
  -- function num : 0_45 , upvalues : handleClickedQuestComplete
  if FGlobal_IsChecked_SkillCommand() == true then
    Panel_SkillCommand:SetShow(true)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  else
    Panel_SkillCommand:SetShow(false)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  end
  FruitageItem_HideTooltip()
  FruitageValue_ShowTooltip(false)
  Panel_Dialog_RestoreUI()
  Dialog_clickExitReq(isSetWait)
  checkHpAlertPostEvent()
  handleClickedQuestComplete = false
end

Panel_Dialog_RestoreUI = function()
  -- function num : 0_46 , upvalues : handleClickedQuestComplete
  SetUIMode((Defines.UIMode).eUIMode_Default)
  if Panel_Npc_Dialog:IsShow() then
    FGlobal_Dialog_renderMode:reset()
    Panel_Npc_Dialog:SetShow(false, false)
  end
  if Panel_GuildHouse_Auction:GetShow() then
    Panel_GuildHouse_Auction:SetShow(false)
  end
  local questNo = getTutorialQuestNo()
  if questNo == -1 then
    setTutorialQuestNo(-1)
  else
    if questNo ~= 0 then
      Tutorial_Quest(questNo)
      setTutorialQuestNo(0)
    else
      setTutorialQuestNo(-1)
    end
  end
  Inven_FindPuzzle()
  Panel_NewEquip_EffectLastUpdate()
  if ExitStable_VehicleInfo_Off() == true then
    Panel_ServantInfo:SetShow(false)
    Panel_CarriageInfo:SetShow(false)
    ServantInventory_Close()
  end
  ExitStable_VehicleInfo_Off(false)
  handleClickedQuestComplete = false
  if FGlobal_IsChecked_SkillCommand() == true then
    Panel_SkillCommand:SetShow(true)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  else
    Panel_SkillCommand:SetShow(false)
    changePositionBySever(Panel_SkillCommand, (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, true, true, false)
  end
  FGlobal_RemoteControl_Hide()
  FGlobal_RemoteControl_Show(1)
  RemoteControl_Interaction_ShowToggloe(true)
end

HandleClickedExitButton = function(isSetWait)
  -- function num : 0_47
  FGlobal_Dialog_HideTutorialStartButtonList()
  QuickSlot_UpdateData()
  FGlobal_QuestWidget_CalcScrollButtonSize()
  FGlobal_QuestWidget_UpdateList()
  PaGlobal_TutorialManager:handleClickedExitButton(dialog_getTalker())
  FromClient_hideDialog(isSetWait)
  ServantInfo_Close()
  CarriageInfo_Close()
  ServantInventory_Close()
  FGlobal_RaceInfo_Hide()
  GuildServantList_Close()
  LordMenu_Hide()
  PaGlobal_MasterpieceAuction:close()
end

HandleClickedBackButton = function()
  -- function num : 0_48 , upvalues : _dialogIndex
  if Panel_Win_System:GetShow() then
    return 
  end
  if check_ShowWindow() then
    close_WindowPanelList()
  end
  if Panel_Window_Skill:IsShow() then
    HandleMLUp_SkillWindow_Close()
  end
  if Panel_Window_Warehouse:IsShow() then
    Warehouse_Close()
  end
  if Panel_Window_NpcShop:IsShow() then
    NpcShop_WindowClose()
  end
  if Panel_AskKnowledge:IsShow() then
    Panel_AskKnowledge:SetShow(false)
  end
  if Panel_TerritoryAuth_Auction:IsShow() then
    TerritoryAuth_Auction_Close()
  end
  if Panel_Dialog_Search:IsShow() then
    searchView_Close()
  end
  if Panel_Window_ReinforceSkill:GetShow() then
    Panel_Window_ReinforceSkill_Close()
  end
  if Panel_SkillReinforce:GetShow() then
    Panel_SkillReinforce_Close()
  end
  if Panel_Window_MasterpieceAuction:GetShow() then
    PaGlobal_MasterpieceAuction:close()
  end
  _dialogIndex = 0
  Dialog_PageButton_Init()
  ReqeustDialog_retryTalk()
end

local DCCOT = CppEnums.DlgCommonConditionOperatorType
local operatorString = {[(CppEnums.DlgCommonConditionOperatorType).Equal] = "", [(CppEnums.DlgCommonConditionOperatorType).Large] = "<PAColor0xFFFF0000>�\178<PAOldColor>", [(CppEnums.DlgCommonConditionOperatorType).Small] = "<PAColor0xFF0000FF>�\188<PAOldColor>"}
local giftshowgap = 0.025
FruitageItem_ShowTooltip = function(percent)
  -- function num : 0_49 , upvalues : intimacyValueBuffer, giftshowgap, operatorString, giftNotice
  local textSum = ""
  for key,value in pairs(intimacyValueBuffer) do
    if (math.abs)(value.giftPercent - percent) < giftshowgap or (math.abs)(value.giftPercent - (percent - 1)) < giftshowgap or (math.abs)(value.giftPercent - (percent + 1)) < giftshowgap then
      if textSum ~= "" then
        textSum = textSum .. "\n"
      end
      textSum = textSum .. value.giftName .. " : " .. value.giftDesc .. "(" .. operatorString[value.giftOperator] .. " " .. value.giftPercent * 1000 .. ")"
    end
  end
  Panel_Npc_Dialog:SetChildIndex(giftNotice, 9999)
  giftNotice:SetText(textSum)
  giftNotice:SetSize(giftNotice:GetTextSizeX() + 15, giftNotice:GetTextSizeY() + 10)
  giftNotice:SetPosX(getMousePosX() + 10)
  giftNotice:SetPosY(getMousePosY() - Panel_Npc_Dialog:GetPosY() - 35)
  giftNotice:SetShow(true)
end

FruitageItem_HideTooltip = function()
  -- function num : 0_50 , upvalues : giftNotice
  giftNotice:SetShow(false)
end

FruitageValue_ShowTooltip = function(isShow)
  -- function num : 0_51 , upvalues : intimacyNoticeText, UI_TM, intimacyNotice, _intimacyCircularProgress
  intimacyNoticeText:SetAutoResize(true)
  intimacyNoticeText:SetTextMode(UI_TM.eTextMode_AutoWrap)
  intimacyNoticeText:SetSize(200, 250)
  intimacyNoticeText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_DIALOG_INTIMACYNOTICETEXT"))
  intimacyNotice:SetPosX(_intimacyCircularProgress:GetPosX())
  intimacyNotice:SetPosY(_intimacyCircularProgress:GetPosY() - 150)
  if isShow == true then
    intimacyNotice:SetSize(intimacyNoticeText:GetSizeX() + 20, intimacyNoticeText:GetSizeY() + 20)
    intimacyNotice:SetShow(true)
    intimacyNoticeText:SetShow(true)
  else
    intimacyNotice:SetShow(false)
    intimacyNoticeText:SetShow(false)
  end
end

local VehicleInfo_Window = nil
ExitStable_VehicleInfo_Off = function(value)
  -- function num : 0_52 , upvalues : VehicleInfo_Window
  if value == true then
    VehicleInfo_Window = value
  else
    if value == false then
      VehicleInfo_Window = value
    end
  end
  return VehicleInfo_Window
end

FGlobal_Dialog_FindFuncButtonIndexByType = function(targetFuncButtonType)
  -- function num : 0_53
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return -1
  end
  local dialogButtonCount = dialogData:getFuncButtonCount()
  for index = 0, dialogButtonCount - 1 do
    local funcButton = dialogData:getFuncButtonAt(index)
    local funcButtonType = tonumber(funcButton._param)
    if targetFuncButtonType == funcButtonType then
      return index
    end
  end
  return -1
end

FGlobal_Dialog_GetPositionByIndex = function(ii)
  -- function num : 0_54 , upvalues : _uiDialogButton
  local Position = {_Return = false, _PosX = -1, _PosY = -1}
  if ii < 0 then
    return Position
  end
  Position._Return = true
  Position._PosX = (_uiDialogButton[ii]):GetPosX()
  Position._PosY = (_uiDialogButton[ii]):GetPosY()
  return Position
end

FGlobal_Dialog_GetFuncPositionNewQuestButton = function()
  -- function num : 0_55 , upvalues : _uiFuncButton
  local Position = {_Return = false, _PosX = -1, _PosY = -1}
  local Index = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_NewQuest)
  if Index == -1 then
    return Position
  end
  Position._Return = true
  Position._PosX = (_uiFuncButton[Index]):GetPosX()
  Position._PosY = (_uiFuncButton[Index]):GetPosY()
  return Position
end

FGlobal_Dialog_FindDialogButtonIndexByType = function(targetFuncButtonType)
  -- function num : 0_56
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return -1
  end
  local dialogButtonCount = dialogData:getDialogButtonCount()
  for index = 0, dialogButtonCount - 1 do
    local dialogButton = dialogData:getDialogButtonAt(index)
    local dialogButtonType = tonumber(funcButton._param)
    if targetFuncButtonType == funcButtonType then
      return index
    end
  end
  return -1
end

FGlobal_Dialog_GetDialogButtonPositionByIndex = function(ii)
  -- function num : 0_57 , upvalues : _uiFuncButton
  if ii < 0 then
    return nil
  end
  local Position = {_PosX = -1, _PosY = -1}
  Position._posX = (_uiFuncButton[ii]):GetPosX()
  Position._posY = (_uiFuncButton[ii]):GetPosY()
  return Position
end

FGlobal_AddEffect_ExitButton = function(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
  -- function num : 0_58 , upvalues : _uiButtonExit
  _uiButtonExit:AddEffect(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
end

FGlobal_EraseAllEffect_ExitButton = function()
  -- function num : 0_59 , upvalues : _uiButtonExit
  _uiButtonExit:EraseAllEffect()
end

FGlobal_AddEffect_DialogButton = function(buttonNo, effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
  -- function num : 0_60 , upvalues : _uiFuncButton
  if buttonNo == -1 or buttonNo == nil then
    return 
  end
  ;
  (_uiFuncButton[buttonNo]):AddEffect(effectName, isLoop, offsetEffectPosX, offsetEffectPosY)
end

FGlobal_EraseAllEffect_DialogButton = function(buttonNo)
  -- function num : 0_61 , upvalues : _uiFuncButton
  if buttonNo == -1 or buttonNo == nil then
    return 
  end
  ;
  (_uiFuncButton[buttonNo]):EraseAllEffect()
end

FromClient_Dialog_onScreenResize = function()
  -- function num : 0_62 , upvalues : _uiNpcDialog, _scrollControl, _uiHalfLine, _uiDialogButton, _uiNoticeNeedInfo, _uiNeedWpAni, _SpacebarIcon, _uiNextButton, _uiButtonExit, _uiButtonBack, _prevPageButton, _nextPageButton, _pageValue, _rBtnPosX, _rBtnPosY
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  Panel_Npc_Dialog:SetSize(sizeX, Panel_Npc_Dialog:GetSizeY())
  if getScreenSizeX() > 1200 then
    _uiNpcDialog:SetSize(getScreenSizeX() - 300, _uiNpcDialog:GetSizeY())
  else
    _uiNpcDialog:SetSize(900, _uiNpcDialog:GetSizeY())
  end
  _scrollControl:SetSize(sizeX, sizeY)
  _uiHalfLine:SetSize(sizeX, 6)
  _uiHalfLine:SetVerticalMiddle()
  _uiHalfLine:SetPosY(70)
  Panel_Npc_Quest_Reward:SetPosY(sizeY - Panel_Npc_Quest_Reward:GetSizeY() - Panel_Npc_Dialog:GetSizeY())
  for index = 0, 3 do
    (_uiDialogButton[index]):SetPosX(sizeX / 2 - (_uiDialogButton[index]):GetSizeX() / 2)
    ;
    (_uiNoticeNeedInfo[index]):SetPosX(sizeX / 2 + (_uiDialogButton[index]):GetSizeX() / 2)
    ;
    (_uiNoticeNeedInfo[index]):SetPosY((_uiDialogButton[index]):GetPosY())
    ;
    (_uiNeedWpAni[index]):SetPosX(sizeX / 2 + (_uiDialogButton[index]):GetSizeX() / 2 - (_uiNeedWpAni[index]):GetSizeX() - 5)
    ;
    (_uiNeedWpAni[index]):SetPosY((_uiDialogButton[index]):GetPosY())
  end
  _SpacebarIcon:SetPosX((_uiDialogButton[0]):GetPosX() + (_uiDialogButton[0]):GetSizeX() + 10)
  _uiNextButton:SetPosX(sizeX / 2 - 175)
  _uiButtonExit:SetPosX(sizeX - (string.format)("%.0f", sizeX / 13 + 100))
  _uiButtonBack:SetPosX(sizeX - (string.format)("%.0f", sizeX / 13 + 260))
  _prevPageButton:SetPosX(_uiNextButton:GetPosX() - _prevPageButton:GetSizeX() * 2)
  _nextPageButton:SetPosX(_prevPageButton:GetPosX())
  _pageValue:SetPosX(_prevPageButton:GetPosX())
  InterestKnowledge_onScreenResize()
  _rBtnPosX = (_uiDialogButton[0]):GetPosX() + (_uiDialogButton[0]):GetSizeX() - _SpacebarIcon:GetSizeX() - 5
  _rBtnPosY = (_uiDialogButton[0]):GetPosY()
end

Panel_Dialog_EnchantHelp_Func = function(isOn)
  -- function num : 0_63 , upvalues : _txt_EnchantHelp, _txt_EnchantHelp_Desc, UI_TM
  local mouse_posX = getMousePosX()
  local mouse_posY = getMousePosY()
  local panel_posX = Panel_Npc_Dialog:GetPosX()
  local panel_posY = Panel_Npc_Dialog:GetPosY()
  if isOn == true then
    _txt_EnchantHelp:SetShow(true)
    _txt_EnchantHelp_Desc:SetShow(true)
    _txt_EnchantHelp:SetAutoResize(true)
    _txt_EnchantHelp_Desc:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _txt_EnchantHelp_Desc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_TXT_ENCHANTHELP"))
    _txt_EnchantHelp:SetSize(_txt_EnchantHelp_Desc:GetSizeX() + 25, _txt_EnchantHelp_Desc:GetSizeY() + 22)
    _txt_EnchantHelp:SetPosX(mouse_posX - panel_posX - 200)
    _txt_EnchantHelp:SetPosY(mouse_posY - panel_posY - 80)
    _txt_EnchantHelp_Desc:SetPosX(mouse_posX - panel_posX - 190)
    _txt_EnchantHelp_Desc:SetPosY(mouse_posY - panel_posY - 80)
  else
    _txt_EnchantHelp:SetShow(false)
    _txt_EnchantHelp_Desc:SetShow(false)
    _txt_EnchantHelp:SetSize(250, 60)
    _txt_EnchantHelp_Desc:SetSize(230, 40)
  end
end

Panel_Dialog_SocketHelp_Func = function(isOn)
  -- function num : 0_64 , upvalues : _txt_SocketHelp, _txt_SocketHelp_Desc, UI_TM
  local mouse_posX = getMousePosX()
  local mouse_posY = getMousePosY()
  local panel_posX = Panel_Npc_Dialog:GetPosX()
  local panel_posY = Panel_Npc_Dialog:GetPosY()
  if isOn == true then
    _txt_SocketHelp:SetShow(true)
    _txt_SocketHelp_Desc:SetShow(true)
    _txt_SocketHelp:SetAutoResize(true)
    _txt_SocketHelp_Desc:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _txt_SocketHelp_Desc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_TXT_SOCKETHELP"))
    _txt_SocketHelp:SetSize(_txt_SocketHelp_Desc:GetSizeX() + 25, _txt_SocketHelp_Desc:GetSizeY() + 22)
    _txt_SocketHelp:SetPosX(mouse_posX - panel_posX - 200)
    _txt_SocketHelp:SetPosY(mouse_posY - panel_posY - 80)
    _txt_SocketHelp_Desc:SetPosX(mouse_posX - panel_posX - 190)
    _txt_SocketHelp_Desc:SetPosY(mouse_posY - panel_posY - 80)
  else
    _txt_SocketHelp:SetShow(false)
    _txt_SocketHelp_Desc:SetShow(false)
    _txt_SocketHelp:SetSize(250, 60)
    _txt_SocketHelp_Desc:SetSize(230, 40)
  end
end

wpHelp_Func = function(isOn)
  -- function num : 0_65 , upvalues : _wpHelp, UI_TM, isFirstShowTooltip
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local Wp = selfPlayer:getWp()
  local mouse_posX = getMousePosX()
  local mouse_posY = getMousePosY()
  local panel_posX = Panel_Npc_Dialog:GetPosX()
  local panel_posY = Panel_Npc_Dialog:GetPosY()
  if Wp < 10 and isOn == true then
    _wpHelp:SetAutoResize(true)
    _wpHelp:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _wpHelp:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_TXT_WPHELP"))
    _wpHelp:SetSize(_wpHelp:GetSizeX(), _wpHelp:GetSizeY() + 5 + _wpHelp:GetTextSizeY() * 2)
    _wpHelp:SetPosX(mouse_posX - panel_posX - 25)
    _wpHelp:SetPosY(mouse_posY - panel_posY - 60)
    if isFirstShowTooltip then
      _wpHelp:SetAlpha(0)
      _wpHelp:SetFontAlpha(0)
      isFirstShowTooltip = false
    end
    local AniInfo = (UIAni.AlphaAnimation)(1, _wpHelp, 0, 0.2)
    _wpHelp:SetShow(true)
  else
    do
      local aniInfo = (UIAni.AlphaAnimation)(0, _wpHelp, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
  end
end

getAuctionState = function()
  -- function num : 0_66 , upvalues : isAuctionDialog
  return isAuctionDialog
end

FromClient_CloseAllPanelWhenNpcGoHome = function()
  -- function num : 0_67
  if GetUIMode() == (Defines.UIMode).eUIMode_Stable then
    StableFunction_Close()
  end
  if Panel_Window_WharfFunction:GetShow() then
    WharfFunction_Close()
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Trade then
    closeNpcTrade_Basket()
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Repair then
    PaGlobal_Repair:repair_OpenPanel(false)
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Extraction then
    PaGlobal_Extraction:openPanel(false)
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_MentalGame then
    MentalGame_Hide()
  end
end

Dialog_MouseToolTips = function(isShow, tipType, index)
  -- function num : 0_68 , upvalues : _uiFuncButton
  local name, desc, control = nil, nil, nil
  local Wp = 0
  local playerLevel = 0
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil then
    Wp = selfPlayer:getWp()
    playerLevel = (selfPlayer:get()):getLevel()
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local funcButton = dialogData:getFuncButtonAt(index)
  if funcButton == nil then
    return 
  end
  local funcButtonType = tonumber(funcButton._param)
  if tipType == (CppEnums.ContentsType).Contents_Quest then
    name = funcButton:getText()
    control = _uiFuncButton[index]
  else
    if tipType == (CppEnums.ContentsType).Contents_NewQuest then
      name = funcButton:getText()
      control = _uiFuncButton[index]
    else
      if tipType == (CppEnums.ContentsType).Contents_Shop then
        name = funcButton:getText()
        control = _uiFuncButton[index]
      else
        if tipType == (CppEnums.ContentsType).Contents_Skill then
          name = funcButton:getText()
          control = _uiFuncButton[index]
        else
          if tipType == (CppEnums.ContentsType).Contents_Repair then
            name = funcButton:getText()
            control = _uiFuncButton[index]
          else
            if tipType == (CppEnums.ContentsType).Contents_Auction then
              name = funcButton:getText()
              control = _uiFuncButton[index]
            else
              if tipType == (CppEnums.ContentsType).Contents_Inn then
                name = funcButton:getText()
                control = _uiFuncButton[index]
              else
                if tipType == (CppEnums.ContentsType).Contents_Warehouse then
                  name = funcButton:getText()
                  control = _uiFuncButton[index]
                else
                  if tipType == (CppEnums.ContentsType).Contents_IntimacyGame then
                    name = funcButton:getText() .. " (" .. funcButton:getNeedWp() .. "/" .. Wp .. ")"
                    control = _uiFuncButton[index]
                  else
                    if tipType == (CppEnums.ContentsType).Contents_Stable then
                      name = funcButton:getText()
                      control = _uiFuncButton[index]
                    else
                      if tipType == (CppEnums.ContentsType).Contents_Transfer then
                        name = funcButton:getText()
                        control = _uiFuncButton[index]
                      else
                        if tipType == (CppEnums.ContentsType).Contents_Guild then
                          name = funcButton:getText()
                          control = _uiFuncButton[index]
                        else
                          if tipType == (CppEnums.ContentsType).Contents_Explore then
                            name = funcButton:getText()
                            control = _uiFuncButton[index]
                          else
                            if tipType == (CppEnums.ContentsType).Contents_DeliveryPerson then
                              name = funcButton:getText()
                              control = _uiFuncButton[index]
                            else
                              if tipType == (CppEnums.ContentsType).Contents_Enchant then
                                name = funcButton:getText()
                                control = _uiFuncButton[index]
                              else
                                if tipType == (CppEnums.ContentsType).Contents_Socket then
                                  name = funcButton:getText()
                                  control = _uiFuncButton[index]
                                else
                                  if tipType == (CppEnums.ContentsType).Contents_Awaken then
                                    name = funcButton:getText()
                                    control = _uiFuncButton[index]
                                  else
                                    if tipType == (CppEnums.ContentsType).Contents_ReAwaken then
                                      name = funcButton:getText()
                                      control = _uiFuncButton[index]
                                    else
                                      if tipType == (CppEnums.ContentsType).Contents_LordMenu then
                                        name = funcButton:getText()
                                        control = _uiFuncButton[index]
                                      else
                                        if tipType == (CppEnums.ContentsType).Contents_Extract then
                                          name = funcButton:getText()
                                          control = _uiFuncButton[index]
                                        else
                                          if tipType == (CppEnums.ContentsType).Contents_TerritoryTrade then
                                            name = funcButton:getText()
                                            control = _uiFuncButton[index]
                                          else
                                            if tipType == (CppEnums.ContentsType).Contents_TerritorySupply then
                                              name = funcButton:getText()
                                              control = _uiFuncButton[index]
                                            else
                                              if tipType == (CppEnums.ContentsType).Contents_GuildShop then
                                                name = funcButton:getText()
                                                control = _uiFuncButton[index]
                                              else
                                                if tipType == (CppEnums.ContentsType).Contents_ItemMarket then
                                                  name = funcButton:getText()
                                                  control = _uiFuncButton[index]
                                                else
                                                  if tipType == (CppEnums.ContentsType).Contents_Knowledge then
                                                    name = funcButton:getText()
                                                    control = _uiFuncButton[index]
                                                  else
                                                    if tipType == (CppEnums.ContentsType).Contents_HelpDesk then
                                                      name = funcButton:getText()
                                                      control = _uiFuncButton[index]
                                                    else
                                                      if tipType == (CppEnums.ContentsType).Contents_SupplyShop then
                                                        name = funcButton:getText()
                                                        control = _uiFuncButton[index]
                                                      else
                                                        if tipType == (CppEnums.ContentsType).Contents_MinorLordMenu then
                                                          name = funcButton:getText()
                                                          control = _uiFuncButton[index]
                                                        else
                                                          if tipType == (CppEnums.ContentsType).Contents_FishSupplyShop then
                                                            name = funcButton:getText()
                                                            control = _uiFuncButton[index]
                                                          else
                                                            if tipType == (CppEnums.ContentsType).Contents_GuildSupplyShop then
                                                              name = funcButton:getText()
                                                              control = _uiFuncButton[index]
                                                            else
                                                              if tipType == (CppEnums.ContentsType).Contents_Join then
                                                                name = funcButton:getText()
                                                                control = _uiFuncButton[index]
                                                              else
                                                                if tipType == (CppEnums.ContentsType).Contents_Improve then
                                                                  name = funcButton:getText()
                                                                  control = _uiFuncButton[index]
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
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

Dialog_EtcButtonToolTips = function(isShow, tipType)
  -- function num : 0_69 , upvalues : _uiButtonExit, _uiButtonBack
  local name, desc, control = nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "DIALOGUE_BTN_EXIT")
    control = _uiButtonExit
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NPC_DIALOG_BACK")
      control = _uiButtonBack
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

extraction_Open = function()
  -- function num : 0_70
  if Panel_Window_Extraction:GetShow() == false then
    PaGlobal_Extraction:openPanel(true)
  else
    PaGlobal_Extraction:openPanel(false)
  end
end

isShowReContactDialog = function()
  -- function num : 0_71 , upvalues : isReContactDialog
  return isReContactDialog
end

isShowDialogFunctionQuest = function()
  -- function num : 0_72 , upvalues : isDialogFunctionQuest
  return isDialogFunctionQuest
end

questDialogIndex = function()
  -- function num : 0_73 , upvalues : _questDialogButtonIndex
  return _questDialogButtonIndex
end

isCheckExchangeItemButton = function(index)
  -- function num : 0_74 , upvalues : isExchangeButtonIndex
  return isExchangeButtonIndex[index]
end

exchangalbeButtonIndex = function()
  -- function num : 0_75 , upvalues : _exchangalbeButtonIndex
  return _exchangalbeButtonIndex
end

local _blackSpiritButtonPos = {eBlackSpiritButtonType_Quest = 0, eBlackSpiritButtonType_Enchant = 1, eBlackSpiritButtonType_Socket = 2, eBlackSpiritButtonType_Improve = 3, eBlackSpiritButtonType_Count = 4}
ExecuteAfterDialogLoad = function()
  -- function num : 0_76 , upvalues : _blackSpiritButtonPos
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  if dialogData:isHaveQuest() == false then
    _blackSpiritButtonPos.eBlackSpiritButtonType_Enchant = 0
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    _blackSpiritButtonPos.eBlackSpiritButtonType_Socket = 1
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

    _blackSpiritButtonPos.eBlackSpiritButtonType_Improve = 2
  else
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

    _blackSpiritButtonPos.eBlackSpiritButtonType_Enchant = 1
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

    _blackSpiritButtonPos.eBlackSpiritButtonType_Socket = 2
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

    _blackSpiritButtonPos.eBlackSpiritButtonType_Improve = 3
  end
  local blackSpiritUiType = getBlackSpiritUiType()
  if (CppEnums.EFlush_BlackSpirit_Ui_Type).eFlush_BlackSpirit_Ui_None ~= blackSpiritUiType and getBlackSpiritGrowthStep() > 0 then
    if (CppEnums.EFlush_BlackSpirit_Ui_Type).eFlush_BlackSpirit_Ui_ItemEnchant == blackSpiritUiType then
      HandleClickedFuncButton(_blackSpiritButtonPos.eBlackSpiritButtonType_Enchant)
    else
      if (CppEnums.EFlush_BlackSpirit_Ui_Type).eFlush_BlackSpirit_Ui_Socket == blackSpiritUiType then
        HandleClickedFuncButton(_blackSpiritButtonPos.eBlackSpiritButtonType_Socket)
      else
        if (CppEnums.EFlush_BlackSpirit_Ui_Type).eFlush_BlackSpirit_Ui_Improve == blackSpiritUiType then
          HandleClickedFuncButton(_blackSpiritButtonPos.eBlackSpiritButtonType_Improve)
        end
      end
    end
  end
end

isNormalTradeMerchant = function()
  -- function num : 0_77
  local talker = dialog_getTalker()
  if talker ~= nil then
    local characterKey = talker:getCharacterKey()
    local npcData = getNpcInfoByCharacterKeyRaw(characterKey, (talker:get()):getDialogIndex())
    if npcData ~= nil then
      return npcData:hasSpawnType((CppEnums.SpawnType).eSpawnType_TradeMerchant)
    end
  end
  do
    return false
  end
end

isQuestComplete = function()
  -- function num : 0_78 , upvalues : _isQuestComplete
  return _isQuestComplete
end

FGlobal_CloseNpcDialogForDetail = function()
  -- function num : 0_79
  if (getCustomizingManager()):isShow() then
    HandleClicked_CloseIngameCustomization()
    return true
  end
  if Panel_Npc_Trade_Market:IsShow() then
    closeNpcTrade_Basket()
    return true
  end
  if Panel_Window_StableFunction:IsShow() then
    StableFunction_Close()
    return true
  end
  if Panel_Window_Repair:IsShow() and PaGlobal_Camp:getIsCamping() == false then
    Panel_FixEquip:SetShow(false)
    PaGlobal_Repair:repair_OpenPanel(false)
    return true
  end
  if Panel_Window_GuildStableFunction:IsShow() then
    GuildStableFunction_Close()
    return true
  end
  if Panel_Window_ItemMarket_Function:GetShow() then
    FGolbal_ItemMarket_Function_Close()
    if Panel_Window_ItemMarket_RegistItem:GetShow() then
      FGlobal_ItemMarketRegistItem_Close()
    end
    if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
      FGlobal_ItemMarket_BuyConfirm_Close()
      return true
    end
    if Panel_Window_ItemMarket_ItemSet:GetShow() then
      FGlobal_ItemMarketItemSet_Close()
    end
    if Panel_Window_ItemMarket:GetShow() then
      if isNewItemmarket_chk() then
        FGolbal_ItemMarketNew_Close()
      else
        FGolbal_ItemMarket_Close()
      end
    end
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
  if Panel_FixEquip:GetShow() then
    FixEquip_Close()
    return true
  end
  if Panel_Knowledge_Main:GetShow() then
    Panel_Knowledge_Hide()
    return true
  end
  if Panel_DyeNew_CharacterController:GetShow() then
    FGlobal_Panel_DyeReNew_Hide()
    return true
  end
  if Panel_CustomizationMain:GetShow() then
    IngameCustomize_Hide()
    return true
  end
  return false
end

registerEvent("FromClient_ShowDialog", "FromClient_ShowDialog")
registerEvent("FromClient_HideDialog", "HandleClickedExitButton")
registerEvent("FromClient_CloseNpcTalkForDead", "FGlobal_HideDialog")
registerEvent("FromClient_CloseNpcTradeMarketTalkForDead", "FGlobal_CloseNpcDialogForDetail")
registerEvent("FromClient_CloseAllPanelWhenNpcGoHome", "FromClient_CloseAllPanelWhenNpcGoHome")
registerEvent("onScreenResize", "FromClient_Dialog_onScreenResize")
RenderMode_DialogListClose = function()
  -- function num : 0_80
  FGlobal_CloseNpcDialogForDetail()
  Panel_Npc_Dialog:SetShow(true)
  FGlobal_HideDialog(true)
end

proRenderModeSet = function()
  -- function num : 0_81 , upvalues : dialogShowCheck_Once
  dialogShowCheck_Once = true
end

FromClient_CloseDialogByAttacked = function()
  -- function num : 0_82
  FGlobal_Dialog_renderMode:reset()
end

FGlobal_Dialog_renderMode:setPrefunctor(renderMode, proRenderModeSet)
FGlobal_Dialog_renderMode:setClosefunctor(renderMode, RenderMode_DialogListClose)
registerEvent("progressEventCancelByAttacked", "FromClient_CloseDialogByAttacked")
isVisibleButton = function(buttonValue)
  -- function num : 0_83 , upvalues : _dialogIndex
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData ~= nil then
    local dialogButtonCount = dialogData:getDialogButtonCount()
    for i = _dialogIndex, dialogButtonCount - 1 do
      local dialogButton = dialogData:getDialogButtonAt(i)
      if dialogButton ~= nil and buttonValue == tostring(dialogButton._linkType) then
        return true
      end
    end
  end
  do
    return false
  end
end

isVisibleAcceptButton = function()
  -- function num : 0_84 , upvalues : UI_DS
  return isVisibleButton(UI_DS.eDialogState_AcceptQuest)
end

isVisibleRecontactButton = function()
  -- function num : 0_85 , upvalues : UI_DS
  return isVisibleButton(UI_DS.eDialogState_ReContact)
end

isVisibleTalkButton = function()
  -- function num : 0_86 , upvalues : UI_DS
  return isVisibleButton(UI_DS.eDialogState_Talk)
end

isVisibleDisplayQuestButton = function()
  -- function num : 0_87 , upvalues : UI_DS
  return isVisibleButton(UI_DS.eDialogState_DisplayQuest)
end

isVisibleProgressButton = function()
  -- function num : 0_88 , upvalues : UI_DS
  return isVisibleButton(UI_DS.eDialogState_ProgressQuest)
end

isNextButtonShow = function()
  -- function num : 0_89 , upvalues : _uiNextButton
  if _uiNextButton ~= nil then
    return _uiNextButton:GetShow()
  end
  return false
end


