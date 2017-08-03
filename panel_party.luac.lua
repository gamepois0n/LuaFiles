-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\party\panel_party.luac 

-- params : ...
-- function num : 0
Panel_Party:ActiveMouseEventEffect(true)
Panel_Party:SetShow(false, false)
Panel_PartyOption:SetShow(false, false)
Panel_Party:RegisterShowEventFunc(true, "PartyShowAni()")
Panel_Party:RegisterShowEventFunc(false, "PartyHideAni()")
Panel_PartyOption:RegisterShowEventFunc(true, "PartyOptionShowAni()")
Panel_PartyOption:RegisterShowEventFunc(false, "PartyOptionHideAni()")
local isContentsEnable = ToClient_IsContentsGroupOpen("38")
local isLargePartyOpen = ToClient_IsContentsGroupOpen("286")
local CT2S = CppEnums.ClassType2String
local PLT = CppEnums.PartyLootType
local PLT2S = CppEnums.PartyLootType2String
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local PP = CppEnums.PAUIMB_PRIORITY
local UI_color = Defines.Color
local UI_Class = CppEnums.ClassType
local registMarket = true
local _last_Index = nil
local _partyData = {}
local withdrawMember = nil
local requestPlayerList = {}
local refuseName = ""
local isMainChannel, isDevServer = nil, nil
local partyType = 0
local controlTemplate = {_styleLeaderIcon = (UI.getChildControl)(Panel_Party, "Static_Icon_Leader"), _styleBackGround = (UI.getChildControl)(Panel_Party, "Static_ClassSlot"), _styleClassIcon = (UI.getChildControl)(Panel_Party, "Static_Icon_Class"), _styleUserName = (UI.getChildControl)(Panel_Party, "StaticText_UserName"), _styleHpBG = (UI.getChildControl)(Panel_Party, "Static_HpBG"), _styleHp = (UI.getChildControl)(Panel_Party, "Progress2_Hp"), _styleMp = (UI.getChildControl)(Panel_Party, "Progress2_Mp"), _styleUserLevel = (UI.getChildControl)(Panel_Party, "StaticText_UserLevel"), _styleConditionBG = (UI.getChildControl)(Panel_Party, "Static_DeadConditionBG"), _styleConditionTxt = (UI.getChildControl)(Panel_Party, "StaticText_NowCondition"), _stylePartyOptionBtn = (UI.getChildControl)(Panel_Party, "Button_Option"), _styleFollowBtn = (UI.getChildControl)(Panel_Party, "Button_Follow"), _distance = (UI.getChildControl)(Panel_Party, "Static_Distance")}
local partyMarketOption = (UI.getChildControl)(Panel_Party, "Static_MarketOption")
partyMarketOption:addInputEvent("Mouse_On", "Show_Tooltips_SpecialGoods( " .. 1 .. ", true )")
partyMarketOption:addInputEvent("Mouse_Out", "Show_Tooltips_SpecialGoods( " .. 1 .. ", false )")
partyMarketOption:SetShow(registMarket)
local btnSpecialGoods = (UI.getChildControl)(Panel_Party, "Static_RegistSpecialGoods")
btnSpecialGoods:addInputEvent("Mouse_On", "Show_Tooltips_SpecialGoods( " .. 2 .. ", true )")
btnSpecialGoods:addInputEvent("Mouse_Out", "Show_Tooltips_SpecialGoods( " .. 2 .. ", false )")
btnSpecialGoods:SetShow(registMarket)
local partyPenalty = (UI.getChildControl)(Panel_Party, "Static_Penalty")
partyPenalty:addInputEvent("Mouse_On", "PartyPop_SimpleTooltip_Show( true, 2)")
partyPenalty:addInputEvent("Mouse_Out", "PartyPop_SimpleTooltip_Show( false, 2 )")
partyPenalty:setTooltipEventRegistFunc("PartyPop_SimpleTooltip_Show( true, 2)")
partyPenalty:SetShow(false)
local _tooltipBg = (UI.getChildControl)(Panel_Party, "Static_TooltipBG")
local _tooltipText = (UI.getChildControl)(Panel_Party, "Tooltip_Name")
local registItem = {_bg = (UI.getChildControl)(Panel_Party, "Static_MarketOptionBg"), _checkMoney = (UI.getChildControl)(Panel_Party, "CheckButton_Money"), _checkGrade = (UI.getChildControl)(Panel_Party, "CheckButton_Grade"), _moneyValue = (UI.getChildControl)(Panel_Party, "StaticText_MoneyValue"), _comboBox = (UI.getChildControl)(Panel_Party, "Combobox_MarketGrade"), _option = (UI.getChildControl)(Panel_Party, "Static_Option"), _btnAdmin = (UI.getChildControl)(Panel_Party, "Button_Admin"), _btnCancel = (UI.getChildControl)(Panel_Party, "Button_Cancel")}
;
(registItem._option):addInputEvent("Mouse_LUp", "Party_RegistItem_ChangeMoney()")
;
(registItem._comboBox):addInputEvent("Mouse_LUp", "Party_RegistItem_ShowComboBox()")
;
((registItem._comboBox):GetListControl()):addInputEvent("Mouse_LUp", "Party_RegistItem_SetGrade()")
;
(registItem._btnAdmin):addInputEvent("Mouse_LUp", "Party_RegistItem_Set()")
;
(registItem._btnCancel):addInputEvent("Mouse_LUp", "Party_RegistItem_Show( false )")
;
(registItem._bg):AddChild(registItem._checkMoney)
;
(registItem._bg):AddChild(registItem._checkGrade)
;
(registItem._bg):AddChild(registItem._moneyValue)
;
(registItem._bg):AddChild(registItem._comboBox)
;
(registItem._bg):AddChild(registItem._option)
;
(registItem._bg):AddChild(registItem._btnAdmin)
;
(registItem._bg):AddChild(registItem._btnCancel)
Panel_Party:RemoveControl(registItem._checkMoney)
Panel_Party:RemoveControl(registItem._checkGrade)
Panel_Party:RemoveControl(registItem._moneyValue)
Panel_Party:RemoveControl(registItem._comboBox)
Panel_Party:RemoveControl(registItem._option)
Panel_Party:RemoveControl(registItem._btnAdmin)
Panel_Party:RemoveControl(registItem._btnCancel)
;
(registItem._bg):SetChildIndex(registItem._comboBox, 9999)
local bgSizeX = (registItem._bg):GetSizeX()
local optionPosX = (registItem._option):GetPosX()
local moneyValuePosX = (registItem._moneyValue):GetPosX()
local comboBoxPosX = (registItem._comboBox):GetPosX()
local btnAdminPosX = (registItem._btnAdmin):GetPosX()
local btnCancelPosX = (registItem._btnCancel):GetPosX()
local registItem_Resize = function()
  -- function num : 0_0 , upvalues : registItem, bgSizeX, optionPosX, moneyValuePosX, comboBoxPosX, btnAdminPosX, btnCancelPosX
  local plusSizeX = 0
  if isGameTypeRussia() then
    plusSizeX = 50
  else
    if isGameTypeEnglish() then
      plusSizeX = 50
    end
  end
  ;
  (registItem._bg):SetSize(bgSizeX + plusSizeX, (registItem._bg):GetSizeY())
  ;
  (registItem._option):SetPosX(optionPosX + plusSizeX)
  ;
  (registItem._moneyValue):SetPosX(moneyValuePosX + plusSizeX)
  ;
  (registItem._comboBox):SetPosX(comboBoxPosX + plusSizeX)
  ;
  (registItem._btnAdmin):SetPosX(btnAdminPosX + plusSizeX / 2)
  ;
  (registItem._btnCancel):SetPosX(btnCancelPosX + plusSizeX / 2)
end

registItem_Resize()
local itemGrade = {PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_ITEMGRADE_GREEN"), PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_ITEMGRADE_BLUE"), PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_ITEMGRADE_YELLOW"), PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_ITEMGRADE_ORANGE"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_NOT_SETTING")}
local _grade = 0
local _baseMoney, _money = toInt64(0, 1000000)
Party_RegistItem_ChangeMoney = function()
  -- function num : 0_1
  Panel_NumberPad_Show(true, toInt64(0, 100000000), param0, setMoney)
end

setMoney = function(inputNum)
  -- function num : 0_2 , upvalues : _baseMoney, _money, registItem
  local _inputNum = nil
  if Int64toInt32(inputNum) > 100000000 then
    _inputNum = toInt64(0, 100000000)
  else
    if Int64toInt32(inputNum) < 1000000 then
      _inputNum = _baseMoney
    else
      _inputNum = inputNum
    end
  end
  _money = _inputNum
  ;
  (registItem._moneyValue):SetText("<PAColor0xffe7d583>" .. makeDotMoney(_inputNum) .. "<PAOldColor>")
end

Party_RegistItem_ShowComboBox = function()
  -- function num : 0_3
  Party_RegistItem_PopOption()
end

Party_RegistItem_PopOption = function()
  -- function num : 0_4 , upvalues : registItem, itemGrade
  local self = registItem
  ;
  (self._comboBox):DeleteAllItem()
  for ii = 0, #itemGrade do
    (self._comboBox):AddItem(itemGrade[ii], ii)
  end
  ;
  (self._comboBox):ToggleListbox()
  ;
  (self._comboBox):SetShow(true)
end

Party_RegistItem_SetGrade = function()
  -- function num : 0_5 , upvalues : registItem
  local self = registItem
  ;
  (self._comboBox):SetSelectItemIndex((self._comboBox):GetSelectIndex())
  ;
  (self._comboBox):ToggleListbox()
end

Party_RegistItem_Show = function(isShow)
  -- function num : 0_6 , upvalues : registItem, _money, _baseMoney, itemGrade
  local self = registItem
  if isShow == nil then
    (self._bg):SetShow(not (self._bg):GetShow())
  else
    ;
    (self._bg):SetShow(isShow)
  end
  local isPartyLeader = RequestParty_isLeader()
  ;
  (self._checkGrade):SetEnable(isPartyLeader)
  ;
  (self._checkMoney):SetEnable(isPartyLeader)
  ;
  (self._option):SetEnable(isPartyLeader)
  ;
  (self._comboBox):SetEnable(isPartyLeader)
  if isPartyLeader then
    (self._btnAdmin):SetShow(true)
    ;
    (self._btnCancel):SetShow(true)
    ;
    (self._bg):SetSize((self._bg):GetSizeX(), 75)
  else
    ;
    (self._btnAdmin):SetShow(false)
    ;
    (self._btnCancel):SetShow(false)
    ;
    (self._bg):SetSize((self._bg):GetSizeX(), 45)
  end
  _money = RequestParty_getDistributionPrice()
  if toInt64(0, 0) ~= _money then
    (self._moneyValue):SetText("<PAColor0xffe7d583>" .. makeDotMoney(_money) .. "<PAOldColor>")
    ;
    (self._checkMoney):SetCheck(true)
  else
    ;
    (self._moneyValue):SetText("<PAColor0xffe7d583>" .. makeDotMoney(_baseMoney) .. "<PAOldColor>")
    ;
    (self._checkMoney):SetCheck(false)
  end
  ;
  (self._comboBox):DeleteAllItem()
  for ii = 0, #itemGrade do
    (self._comboBox):AddItem(itemGrade[ii], ii)
  end
  if RequestParty_getDistributionGrade() > 0 and RequestParty_getDistributionGrade() < 5 then
    (self._comboBox):SetSelectItemIndex(RequestParty_getDistributionGrade())
    ;
    (self._comboBox):SetText(itemGrade[RequestParty_getDistributionGrade()])
    ;
    (self._checkGrade):SetCheck(true)
  else
    ;
    (self._comboBox):SetSelectItemIndex(0)
    ;
    (self._checkGrade):SetCheck(false)
  end
end

Party_RegistItem_Show(false)
Party_RegistItem_Option_Init = function()
  -- function num : 0_7 , upvalues : registItem, _money
  local self = registItem
  ;
  (self._checkMoney):SetCheck(false)
  ;
  (self._checkGrade):SetCheck(false)
  ;
  (self._moneyValue):SetText("<PAColor0xffe7d583>" .. makeDotMoney(_money) .. "<PAOldColor>")
  ;
  (self._comboBox):SetSelectItemIndex(0)
end

Party_RegistItem_Set = function()
  -- function num : 0_8 , upvalues : registItem, _money, _baseMoney
  local self = registItem
  local price, grade = nil, nil
  if (self._checkMoney):IsCheck() then
    price = toInt64(0, (math.max)(Int64toInt32(_money), Int64toInt32(_baseMoney)))
  else
    price = toInt64(0, 0)
  end
  if (self._checkGrade):IsCheck() then
    grade = (self._comboBox):GetSelectIndex()
  else
    grade = 5
    ;
    (self._comboBox):SetSelectItemIndex(0)
  end
  if (self._comboBox):GetSelectIndex() > 0 and (self._comboBox):GetSelectIndex() < 5 then
    (self._comboBox):SetSelectItemIndex((self._comboBox):GetSelectIndex())
  else
    grade = 5
    ;
    (self._comboBox):SetSelectItemIndex(0)
  end
  RequestParty_changeDistributionOption(price, grade)
  Party_RegistItem_Show(false)
end

Party_RegistItem_Option_Init()
Show_Tooltips_SpecialGoods = function(btnType, isShow)
  -- function num : 0_9 , upvalues : registItem, itemGrade, _tooltipBg, _tooltipText
  local itemCount = ToClient_requestGetMySellInfoCount()
  local self = registItem
  local msg = nil
  if btnType == 1 then
    if Int64toInt32(RequestParty_getDistributionPrice()) > 0 then
      if RequestParty_getDistributionGrade() > 0 and RequestParty_getDistributionGrade() < 5 then
        msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_HIGHSILVER", "getDistributionPrice", makeDotMoney(RequestParty_getDistributionPrice())) .. ", " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_HIGHGRADE", "getDistributionGrade", itemGrade[RequestParty_getDistributionGrade()])
      else
        msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_HIGHSILVER", "getDistributionPrice", makeDotMoney(RequestParty_getDistributionPrice()))
      end
    else
      if RequestParty_getDistributionGrade() > 0 and RequestParty_getDistributionGrade() < 5 then
        msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_HIGHGRADE2", "getDistributionGrade", itemGrade[RequestParty_getDistributionGrade()])
      else
        msg = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_NOT_OPTION_SETTING")
      end
    end
  else
    if btnType == 2 then
      msg = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_REGISTITEM_VIEW")
    end
  end
  _tooltipBg:SetShow(isShow)
  _tooltipText:SetShow(isShow)
  _tooltipText:SetText(msg)
  _tooltipBg:SetSize(_tooltipText:GetTextSizeX() + 10, _tooltipBg:GetSizeY())
end

Party_ShowMessageAlert = function()
  -- function num : 0_10
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_ONLY_MASTER"))
end

;
(controlTemplate._styleBackGround):SetShow(false)
;
(controlTemplate._styleUserName):SetShow(false)
;
(controlTemplate._styleHpBG):SetShow(false)
;
(controlTemplate._styleHp):SetShow(false)
;
(controlTemplate._styleUserLevel):SetShow(false)
;
(controlTemplate._styleClassIcon):SetShow(false)
;
(controlTemplate._styleLeaderIcon):SetShow(false)
;
(controlTemplate._styleConditionBG):SetShow(false)
;
(controlTemplate._styleConditionTxt):SetShow(false)
;
(controlTemplate._stylePartyOptionBtn):SetShow(false)
;
(controlTemplate._styleFollowBtn):SetShow(false)
;
(controlTemplate._distance):SetShow(false)
local Match_Button_Info = (UI.getChildControl)(Panel_Party, "Match_Button_MatchInfo")
local _styleLootType = (UI.getChildControl)(Panel_Party, "StaticText_LootType")
local _uiComboLootingOption = (UI.getChildControl)(Panel_Party, "Combobox_Looting_Option")
local _comboBoxList = (UI.getChildControl)(_uiComboLootingOption, "Combobox_List")
_styleLootType:SetShow(false)
_uiComboLootingOption:SetShow(true)
Panel_Party:SetChildIndex(_uiComboLootingOption, 9999)
local _uiPartyMemberList = {}
_maxPartyMemberCount = 5
local _preLootType = nil
local _uiButtonChangeLeader = (UI.getChildControl)(Panel_PartyOption, "Button_Change_Leader")
local _uiButtonWithdrawMember = (UI.getChildControl)(Panel_PartyOption, "Button_Withdraw_Member")
if isContentsEnable then
  isMainChannel = (getCurrentChannelServerData())._isMain
  isDevServer = ToClient_IsDevelopment()
end
local closePartyOption = function()
  -- function num : 0_11
  Panel_PartyOption:SetShow(false)
end

PartyShowAni = function()
  -- function num : 0_12
end

PartyHideAni = function()
  -- function num : 0_13
end

PartyOptionShowAni = function()
  -- function num : 0_14
  (UIAni.fadeInSCR_Down)(Panel_PartyOption)
end

PartyOptionHideAni = function()
  -- function num : 0_15 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_PartyOption:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_PartyOption:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  local aniInfo2 = Panel_PartyOption:addScaleAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(0.97)
  aniInfo2.AxisX = 200
  aniInfo2.AxisY = 295
  aniInfo2.IsChangeChild = true
end

Looting_ComboBox = function()
  -- function num : 0_16 , upvalues : _uiComboLootingOption
  if RequestParty_isLeader() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_ONLYLEADERCHANGE"))
    return 
  end
  PartyPop_onLootingOptionUI()
  local lootingList = _uiComboLootingOption:GetListControl()
  lootingList:addInputEvent("Mouse_LUp", "changeLooting()")
  _uiComboLootingOption:ToggleListbox()
end

changeLooting = function()
  -- function num : 0_17 , upvalues : _uiComboLootingOption
  local selectKey = _uiComboLootingOption:GetSelectKey()
  _uiComboLootingOption:SetSelectItemIndex(selectKey)
  RequestParty_changeLooting(selectKey)
end

local createPartyControls = function()
  -- function num : 0_18 , upvalues : controlTemplate, _uiPartyMemberList, _styleLootType
  for index = 0, _maxPartyMemberCount - 1 do
    local partyMember = {}
    partyMember._base = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Party, "PartyMember_Back" .. index)
    partyMember._leader = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._base, "PartyMember_Leader" .. index)
    partyMember._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, partyMember._base, "PartyMember_UserName" .. index)
    partyMember._class = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._base, "PartyMember_Class" .. index)
    partyMember._hpBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._base, "PartyMember_HpBG" .. index)
    partyMember._hp = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, partyMember._base, "PartyMember_Hp" .. index)
    partyMember._mp = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, partyMember._base, "PartyMember_Mp" .. index)
    partyMember._level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, partyMember._base, "PartyMember_UserLevel" .. index)
    partyMember._conditionBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._base, "PartyMember_ConditionBG" .. index)
    partyMember._stylePartyOptionBtn = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, partyMember._base, "PartyMember_OptionBtn" .. index)
    partyMember._styleFollowBtn = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, partyMember._base, "PartyMember_FollowBtn" .. index)
    partyMember._distance = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._base, "PartyMember_Distance" .. index)
    partyMember._conditionTxt = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, partyMember._base, "PartyMember_ConditionTxt" .. index)
    CopyBaseProperty(controlTemplate._styleLeaderIcon, partyMember._leader)
    CopyBaseProperty(controlTemplate._styleUserName, partyMember._name)
    CopyBaseProperty(controlTemplate._styleBackGround, partyMember._base)
    CopyBaseProperty(controlTemplate._styleClassIcon, partyMember._class)
    CopyBaseProperty(controlTemplate._styleHpBG, partyMember._hpBG)
    CopyBaseProperty(controlTemplate._styleHp, partyMember._hp)
    CopyBaseProperty(controlTemplate._styleMp, partyMember._mp)
    CopyBaseProperty(controlTemplate._styleUserLevel, partyMember._level)
    CopyBaseProperty(controlTemplate._styleConditionBG, partyMember._conditionBG)
    CopyBaseProperty(controlTemplate._stylePartyOptionBtn, partyMember._stylePartyOptionBtn)
    CopyBaseProperty(controlTemplate._styleFollowBtn, partyMember._styleFollowBtn)
    CopyBaseProperty(controlTemplate._distance, partyMember._distance)
    CopyBaseProperty(controlTemplate._styleConditionTxt, partyMember._conditionTxt)
    ;
    (partyMember._leader):SetShow(false)
    ;
    (partyMember._name):SetShow(true)
    ;
    (partyMember._base):SetShow(true)
    ;
    (partyMember._class):SetShow(true)
    ;
    (partyMember._hpBG):SetShow(true)
    ;
    (partyMember._hp):SetShow(true)
    ;
    (partyMember._mp):SetShow(true)
    ;
    (partyMember._level):SetShow(true)
    ;
    (partyMember._conditionBG):SetShow(true)
    ;
    (partyMember._conditionTxt):SetShow(true)
    ;
    (partyMember._base):SetAlpha(0.7)
    ;
    (partyMember._base):SetShow(true)
    ;
    (partyMember._base):SetPosY(index * (partyMember._base):GetSizeY() * 1.08)
    ;
    (partyMember._name):SetIgnore(true)
    ;
    (partyMember._class):SetIgnore(true)
    ;
    (partyMember._hpBG):SetIgnore(true)
    ;
    (partyMember._hp):SetIgnore(true)
    ;
    (partyMember._mp):SetIgnore(true)
    ;
    (partyMember._level):SetIgnore(true)
    ;
    (partyMember._leader):SetIgnore(true)
    ;
    (partyMember._conditionBG):SetIgnore(true)
    ;
    (partyMember._conditionTxt):SetIgnore(true)
    ;
    (partyMember._stylePartyOptionBtn):addInputEvent("Mouse_LUp", "PartyPop_clickPartyOption(" .. index .. ")")
    ;
    (partyMember._styleFollowBtn):addInputEvent("Mouse_LUp", "PartyPop_clickPartyFollow(" .. index .. ")")
    ;
    (partyMember._styleFollowBtn):addInputEvent("Mouse_On", "PartyPop_SimpleTooltip_Show(true, 0, " .. index .. ")")
    ;
    (partyMember._styleFollowBtn):addInputEvent("Mouse_Out", "PartyPop_SimpleTooltip_Show(false, 0, " .. index .. ")")
    ;
    (partyMember._styleFollowBtn):setTooltipEventRegistFunc("PartyPop_SimpleTooltip_Show(true, 0, " .. index .. ")")
    -- DECOMPILER ERROR at PC346: Confused about usage of register: R5 in 'UnsetPending'

    _uiPartyMemberList[index] = partyMember
  end
  Panel_Party:SetChildIndex(_styleLootType, Panel_Party:GetChildSize())
end

createPartyControls()
local _partyMemberCount = RequestParty_getPartyMemberCount()
ResponseParty_createPartyList = function()
  -- function num : 0_19 , upvalues : partyType, requestPlayerList, _partyMemberCount
  local partyMemberCount = RequestParty_getPartyMemberCount()
  if partyMemberCount > 0 then
    partyType = ToClient_GetPartyType()
    if (CppEnums.PartyType).ePartyType_Normal == partyType then
      if not isFlushedUI() then
        Panel_Party:SetShow(true, false)
      end
      ;
      (table.remove)(requestPlayerList)
      ResponseParty_updatePartyList()
      _partyMemberCount = partyMemberCount
      Party_RegistItem_Show(false)
      ToClient_requestListMySellInfo()
      Panel_LargeParty:SetShow(false)
    else
      if (CppEnums.PartyType).ePartyType_Large == partyType then
        Panel_LargeParty:SetShow(true)
        PaGlobal_LargeParty:Update()
        Panel_Party:SetShow(false)
      end
    end
  end
end

local savedPrice = toInt64(0, 0)
local savedGrade = 0
local firstCheck = 0
local isSelfMaster = false
FGlobal_ResponseParty_PartyMemberSet = function(partyMemberCount)
  -- function num : 0_20 , upvalues : isSelfMaster
  local _idx = 0
  local partyData = {}
  for index = 0, partyMemberCount - 1 do
    local idx = 0
    local memberData = RequestParty_getPartyMemberAt(index)
    if RequestParty_isSelfPlayer(index) == true then
      idx = 0
    else
      idx = _idx + 1
      _idx = idx
    end
    partyData[idx] = {_index = index, _isMaster = memberData._isMaster, _isSelf = RequestParty_isSelfPlayer(index), _name = memberData:name(), _class = memberData:classType(), _level = memberData._level, _nowHp = memberData._hp * 100, _maxHp = memberData._maxHp, _nowMp = memberData._mp * 100, _maxMp = memberData._maxMp, _distance = memberData:getExperienceGrade()}
    if (partyData[idx])._isSelf == true and (partyData[idx])._isMaster == true then
      isSelfMaster = true
    end
  end
  return partyData
end

ResponseParty_PartyMemberTextureSet = function(partyData, partyMemberCount, index)
  -- function num : 0_21 , upvalues : _uiPartyMemberList, isSelfMaster, isContentsEnable, CT2S, UI_Class
  local _partyData = partyData
  local classTypeTexture = nil
  local classMP = ""
  ;
  ((_uiPartyMemberList[index])._hpBG):SetShow(true)
  if index <= partyMemberCount - 1 and _partyData[index] ~= nil then
    ((_uiPartyMemberList[index])._name):SetText((_partyData[index])._name)
    ;
    ((_uiPartyMemberList[index])._level):SetText((_partyData[index])._level)
    ;
    ((_uiPartyMemberList[index])._hp):SetProgressRate((_partyData[index])._nowHp / (_partyData[index])._maxHp)
    ;
    ((_uiPartyMemberList[index])._mp):SetProgressRate((_partyData[index])._nowMp / (_partyData[index])._maxMp)
    if isSelfMaster == true or (_partyData[index])._isSelf == true then
      local spanSizeX = ((_uiPartyMemberList[index])._name):GetTextSizeX() + ((_uiPartyMemberList[index])._name):GetPosX()
      ;
      ((_uiPartyMemberList[index])._stylePartyOptionBtn):SetSpanSize(-185, (((_uiPartyMemberList[index])._stylePartyOptionBtn):GetSpanSize()).y)
      if isContentsEnable then
        ((_uiPartyMemberList[index])._stylePartyOptionBtn):SetShow(true)
      else
        ;
        ((_uiPartyMemberList[index])._stylePartyOptionBtn):SetShow(true)
      end
    else
      do
        ;
        ((_uiPartyMemberList[index])._stylePartyOptionBtn):SetShow(false)
        classTypeTexture = "new_ui_common_forlua/widget/party/portrait_" .. CT2S[(_partyData[index])._class] .. ".dds"
        if (_partyData[index])._class == 4 then
          classMP = "new_ui_common_forlua/default/Default_Gauges.dds"
          ;
          ((_uiPartyMemberList[index])._mp):ChangeTextureInfoName(classMP)
          local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._mp, 1, 70, 233, 76)
          ;
          (((_uiPartyMemberList[index])._mp):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          ((_uiPartyMemberList[index])._mp):setRenderTexture(((_uiPartyMemberList[index])._mp):getBaseTexture())
        else
          do
            if (_partyData[index])._class == 8 or (_partyData[index])._class == 16 or (_partyData[index])._class == 28 or (_partyData[index])._class == 31 then
              classMP = "new_ui_common_forlua/default/Default_Gauges.dds"
              ;
              ((_uiPartyMemberList[index])._mp):ChangeTextureInfoName(classMP)
              local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._mp, 1, 63, 233, 69)
              ;
              (((_uiPartyMemberList[index])._mp):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              ((_uiPartyMemberList[index])._mp):setRenderTexture(((_uiPartyMemberList[index])._mp):getBaseTexture())
            else
              do
                if (_partyData[index])._class == 24 then
                  classMP = "new_ui_common_forlua/default/Default_Gauges.dds"
                  ;
                  ((_uiPartyMemberList[index])._mp):ChangeTextureInfoName(classMP)
                  local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._mp, 2, 250, 232, 255)
                  ;
                  (((_uiPartyMemberList[index])._mp):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  ((_uiPartyMemberList[index])._mp):setRenderTexture(((_uiPartyMemberList[index])._mp):getBaseTexture())
                else
                  do
                    if (_partyData[index])._class == 0 or (_partyData[index])._class == 12 or (_partyData[index])._class == 20 or (_partyData[index])._class == 21 or (_partyData[index])._class == 25 or (_partyData[index])._class == 26 or (_partyData[index])._class == 19 or (_partyData[index])._class == 23 then
                      classMP = "new_ui_common_forlua/default/Default_Gauges.dds"
                      ;
                      ((_uiPartyMemberList[index])._mp):ChangeTextureInfoName(classMP)
                      local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._mp, 1, 56, 233, 62)
                      ;
                      (((_uiPartyMemberList[index])._mp):getBaseTexture()):setUV(x1, y1, x2, y2)
                      ;
                      ((_uiPartyMemberList[index])._mp):setRenderTexture(((_uiPartyMemberList[index])._mp):getBaseTexture())
                    else
                      do
                        if (_partyData[index])._class == 27 then
                          classMP = "new_ui_common_forlua/default/Default_Gauges.dds"
                          ;
                          ((_uiPartyMemberList[index])._mp):ChangeTextureInfoName(classMP)
                          local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._mp, 206, 214, 255, 217)
                          ;
                          (((_uiPartyMemberList[index])._mp):getBaseTexture()):setUV(x1, y1, x2, y2)
                          ;
                          ((_uiPartyMemberList[index])._mp):setRenderTexture(((_uiPartyMemberList[index])._mp):getBaseTexture())
                        end
                        do
                          if (_partyData[index])._class == UI_Class.ClassType_Warrior then
                            classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                            ;
                            ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                            local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 77, 25, 107, 55)
                            ;
                            (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                            ;
                            ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                          else
                            do
                              if (_partyData[index])._class == UI_Class.ClassType_Ranger then
                                classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                ;
                                ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 108, 25, 138, 55)
                                ;
                                (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                ;
                                ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                              else
                                do
                                  if (_partyData[index])._class == UI_Class.ClassType_Sorcerer then
                                    classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                    ;
                                    ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                    local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 139, 25, 169, 55)
                                    ;
                                    (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                    ;
                                    ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                  else
                                    do
                                      if (_partyData[index])._class == UI_Class.ClassType_Giant then
                                        classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                        ;
                                        ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                        local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 170, 25, 200, 55)
                                        ;
                                        (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                        ;
                                        ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                      else
                                        do
                                          if (_partyData[index])._class == UI_Class.ClassType_Tamer then
                                            classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                            ;
                                            ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                            local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 167, 56, 197, 86)
                                            ;
                                            (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                            ;
                                            ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                          else
                                            do
                                              if (_partyData[index])._class == UI_Class.ClassType_BladeMaster then
                                                classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                                ;
                                                ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 198, 56, 228, 86)
                                                ;
                                                (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                ;
                                                ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                              else
                                                do
                                                  if (_partyData[index])._class == UI_Class.ClassType_BladeMasterWomen then
                                                    classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                                    ;
                                                    ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                    local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 198, 87, 228, 117)
                                                    ;
                                                    (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    ;
                                                    ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                  else
                                                    do
                                                      if (_partyData[index])._class == UI_Class.ClassType_Valkyrie then
                                                        classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                                        ;
                                                        ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                        local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 167, 87, 197, 117)
                                                        ;
                                                        (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                        ;
                                                        ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                      else
                                                        do
                                                          if (_partyData[index])._class == UI_Class.ClassType_Wizard then
                                                            classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                                            ;
                                                            ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                            local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 198, 118, 228, 148)
                                                            ;
                                                            (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                            ;
                                                            ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                          else
                                                            do
                                                              if (_partyData[index])._class == UI_Class.ClassType_WizardWomen then
                                                                classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                                                ;
                                                                ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                                local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 198, 149, 228, 179)
                                                                ;
                                                                (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                ;
                                                                ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                              else
                                                                do
                                                                  if (_partyData[index])._class == UI_Class.ClassType_NinjaWomen then
                                                                    classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                                                    ;
                                                                    ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                                    local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 201, 25, 231, 55)
                                                                    ;
                                                                    (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                    ;
                                                                    ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                                  else
                                                                    do
                                                                      if (_partyData[index])._class == UI_Class.ClassType_NinjaMan then
                                                                        classTypeTexture = "new_ui_common_forlua/widget/party/Party_00.dds"
                                                                        ;
                                                                        ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                                        local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 198, 180, 228, 210)
                                                                        ;
                                                                        (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                        ;
                                                                        ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                                      else
                                                                        do
                                                                          if (_partyData[index])._class == UI_Class.ClassType_DarkElf then
                                                                            classTypeTexture = "new_ui_common_forlua/widget/party/Party_01.dds"
                                                                            ;
                                                                            ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                                            local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 1, 1, 31, 31)
                                                                            ;
                                                                            (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                            ;
                                                                            ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                                          else
                                                                            do
                                                                              if (_partyData[index])._class == UI_Class.ClassType_Combattant then
                                                                                classTypeTexture = "new_ui_common_forlua/widget/party/Party_01.dds"
                                                                                ;
                                                                                ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                                                local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 1, 222, 31, 252)
                                                                                ;
                                                                                (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                ;
                                                                                ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                                              else
                                                                                do
                                                                                  if (_partyData[index])._class == UI_Class.ClassType_CombattantWomen then
                                                                                    classTypeTexture = "new_ui_common_forlua/widget/party/Party_01.dds"
                                                                                    ;
                                                                                    ((_uiPartyMemberList[index])._class):ChangeTextureInfoName(classTypeTexture)
                                                                                    local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._class, 21, 191, 51, 221)
                                                                                    ;
                                                                                    (((_uiPartyMemberList[index])._class):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                    ;
                                                                                    ((_uiPartyMemberList[index])._class):setRenderTexture(((_uiPartyMemberList[index])._class):getBaseTexture())
                                                                                  end
                                                                                  do
                                                                                    ;
                                                                                    ((_uiPartyMemberList[index])._distance):SetShow(true)
                                                                                    ;
                                                                                    ((_uiPartyMemberList[index])._distance):ChangeTextureInfoName("new_ui_common_forlua/widget/party/party_00.dds")
                                                                                    if (_partyData[index])._distance == 0 then
                                                                                      local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._distance, 152, 1, 174, 23)
                                                                                      ;
                                                                                      (((_uiPartyMemberList[index])._distance):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                    else
                                                                                      do
                                                                                        if (_partyData[index])._distance == 1 then
                                                                                          local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._distance, 176, 1, 198, 23)
                                                                                          ;
                                                                                          (((_uiPartyMemberList[index])._distance):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                        else
                                                                                          do
                                                                                            if (_partyData[index])._distance == 2 then
                                                                                              local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._distance, 200, 1, 222, 23)
                                                                                              ;
                                                                                              (((_uiPartyMemberList[index])._distance):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                            else
                                                                                              do
                                                                                                do
                                                                                                  if (_partyData[index])._distance == 3 then
                                                                                                    local x1, y1, x2, y2 = setTextureUV_Func((_uiPartyMemberList[index])._distance, 224, 1, 246, 23)
                                                                                                    ;
                                                                                                    (((_uiPartyMemberList[index])._distance):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                  end
                                                                                                  ;
                                                                                                  ((_uiPartyMemberList[index])._distance):setRenderTexture(((_uiPartyMemberList[index])._distance):getBaseTexture())
                                                                                                  ;
                                                                                                  ((_uiPartyMemberList[index])._distance):addInputEvent("Mouse_On", "PartyPop_SimpleTooltip_Show( true, 1," .. index .. "," .. (_partyData[index])._distance .. " )")
                                                                                                  ;
                                                                                                  ((_uiPartyMemberList[index])._distance):addInputEvent("Mouse_Out", "PartyPop_SimpleTooltip_Show( false, 1," .. index .. "," .. (_partyData[index])._distance .. " )")
                                                                                                  ;
                                                                                                  ((_uiPartyMemberList[index])._distance):setTooltipEventRegistFunc("PartyPop_SimpleTooltip_Show( true, 1," .. index .. "," .. (_partyData[index])._distance .. " )")
                                                                                                  if (_partyData[index])._nowHp <= 0 then
                                                                                                    ((_uiPartyMemberList[index])._conditionBG):SetShow(true)
                                                                                                    ;
                                                                                                    ((_uiPartyMemberList[index])._conditionTxt):SetShow(true)
                                                                                                    ;
                                                                                                    ((_uiPartyMemberList[index])._conditionTxt):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_DEATH"))
                                                                                                  else
                                                                                                    if (_partyData[index])._nowHp >= 1 then
                                                                                                      ((_uiPartyMemberList[index])._conditionBG):SetShow(false)
                                                                                                      ;
                                                                                                      ((_uiPartyMemberList[index])._conditionTxt):SetShow(false)
                                                                                                      ;
                                                                                                      ((_uiPartyMemberList[index])._conditionTxt):SetText("")
                                                                                                    end
                                                                                                  end
                                                                                                  if (_partyData[index])._isMaster == true then
                                                                                                    ((_uiPartyMemberList[index])._leader):SetShow(true)
                                                                                                  else
                                                                                                    ;
                                                                                                    ((_uiPartyMemberList[index])._leader):SetShow(false)
                                                                                                  end
                                                                                                  if (_partyData[index])._isSelf then
                                                                                                    ((_uiPartyMemberList[index])._styleFollowBtn):SetShow(false)
                                                                                                    ;
                                                                                                    ((_uiPartyMemberList[index])._distance):SetShow(false)
                                                                                                    ;
                                                                                                    ((_uiPartyMemberList[index])._distance):SetSpanSize(-125, (((_uiPartyMemberList[index])._distance):GetSpanSize()).y)
                                                                                                  else
                                                                                                    ;
                                                                                                    ((_uiPartyMemberList[index])._styleFollowBtn):SetShow(true)
                                                                                                    if ((_uiPartyMemberList[index])._stylePartyOptionBtn):GetShow() then
                                                                                                      ((_uiPartyMemberList[index])._styleFollowBtn):SetSpanSize(-165, (((_uiPartyMemberList[index])._styleFollowBtn):GetSpanSize()).y)
                                                                                                    else
                                                                                                      ;
                                                                                                      ((_uiPartyMemberList[index])._styleFollowBtn):SetSpanSize(-185, (((_uiPartyMemberList[index])._styleFollowBtn):GetSpanSize()).y)
                                                                                                    end
                                                                                                    ;
                                                                                                    ((_uiPartyMemberList[index])._distance):SetSpanSize((((_uiPartyMemberList[index])._styleFollowBtn):GetSpanSize()).x + 23, (((_uiPartyMemberList[index])._distance):GetSpanSize()).y)
                                                                                                  end
                                                                                                  ;
                                                                                                  ((_uiPartyMemberList[index])._base):SetShow(true)
                                                                                                  ;
                                                                                                  ((_uiPartyMemberList[index])._base):SetShow(false)
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

ResponseParty_updatePartyList = function()
  -- function num : 0_22 , upvalues : partyType, _partyData, _preLootType, PLT2S, _uiComboLootingOption, _styleLootType, requestPlayerList, _partyMemberCount, isContentsEnable, Match_Button_Info, isMainChannel, isDevServer, partyPenalty, partyMarketOption, btnSpecialGoods, firstCheck, savedPrice, savedGrade, registMarket, registItem
  if Panel_Party:IsShow() and partyType == 0 then
    local partyMemberCount = RequestParty_getPartyMemberCount()
    local lootType = RequestParty_getPartyLootType()
    _partyData = {}
    _partyData = FGlobal_ResponseParty_PartyMemberSet(partyMemberCount)
    for index = 0, _maxPartyMemberCount - 1 do
      ResponseParty_PartyMemberTextureSet(_partyData, partyMemberCount, index)
    end
    if _preLootType ~= nil and _preLootType ~= PLT2S[lootType] then
      local rottingMsg = PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_CHANGE_LOOTING_RULE1") .. " " .. PLT2S[lootType] .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_CHANGE_LOOTING_RULE2")
      _uiComboLootingOption:SetText(PLT2S[lootType])
      Proc_ShowMessage_Ack(rottingMsg)
    else
      do
        if _preLootType == nil then
          _uiComboLootingOption:SetText(PLT2S[lootType])
        end
        _preLootType = PLT2S[lootType]
        if lootType ~= 4 then
          FGlobal_PartyInventoryClose()
        else
          FGlobal_PartyInventoryOpen()
          for i = 1, partyMemberCount do
            Panel_Window_PartyInventory:SetPosY(i * Panel_Party:GetSizeY() + Panel_Party:GetPosY() + 40)
          end
        end
        do
          if partyMemberCount == 0 then
            _styleLootType:SetShow(false)
            Panel_Party:SetShow(false, false)
            requestPlayerList = {}
            Panel_PartyOption:SetShow(false, false)
          else
            _uiComboLootingOption:SetSpanSize(3, partyMemberCount * Panel_Party:GetSizeY() + 10)
          end
          _partyMemberCount = partyMemberCount
          if isContentsEnable then
            if _partyMemberCount > 0 then
              Match_Button_Info:SetShow(false)
              Match_Button_Info:SetSpanSize((_uiComboLootingOption:GetSpanSize()).x + 115, (_uiComboLootingOption:GetSpanSize()).y - 1)
              Match_Button_Info:ComputePos()
              if isMainChannel or isDevServer then
                FGlobal_UpdatePartyState(_partyMemberCount, RequestParty_isLeader())
              end
            end
            partyPenalty:SetPosX((Match_Button_Info:GetSpanSize()).x + 60)
            partyPenalty:SetPosY((Match_Button_Info:GetSpanSize()).y - 1)
          else
            partyPenalty:SetPosX(_uiComboLootingOption:GetSizeX() + (_uiComboLootingOption:GetSpanSize()).x + 10)
            partyPenalty:SetPosY((_uiComboLootingOption:GetSpanSize()).y - 1)
            Match_Button_Info:SetShow(false)
          end
          if RequestParty_isLeader() then
            partyMarketOption:addInputEvent("Mouse_LUp", "Party_RegistItem_Show()")
          else
            partyMarketOption:addInputEvent("Mouse_LUp", "Party_ShowMessageAlert()")
          end
          btnSpecialGoods:addInputEvent("Mouse_LUp", "Panel_Party_ItemList_Open()")
          if firstCheck < partyMemberCount then
            firstCheck = firstCheck + 1
          else
            local currentPrice = RequestParty_getDistributionPrice()
            local currentGrade = RequestParty_getDistributionGrade()
            if (currentPrice ~= savedPrice or currentGrade ~= savedGrade) and registMarket then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_CHANGE_OPTION"))
              savedPrice = currentPrice
              savedGrade = currentGrade
            end
            local sizeY = isShow_PartyMatchBg()
            ;
            (registItem._bg):SetPosY(partyMemberCount * Panel_Party:GetSizeY() + 40 + sizeY)
          end
          do
            if Panel_LargeParty:GetShow() and partyType == 1 then
              Panel_Party:SetShow(false)
              PaGlobal_LargeParty:Update()
            end
          end
        end
      end
    end
  end
end

FGlobal_PartyMemberCount = function()
  -- function num : 0_23 , upvalues : _partyMemberCount
  return _partyMemberCount
end

local messageBox_party_accept = function()
  -- function num : 0_24 , upvalues : requestPlayerList, partyType
  requestPlayerList = {}
  RequestParty_acceptInvite(partyType)
end

local messageBox_party_refuse = function()
  -- function num : 0_25 , upvalues : requestPlayerList, refuseName
  RequestParty_refuseInvite()
  for ii = 0, #requestPlayerList do
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

    if requestPlayerList[ii] == refuseName then
      requestPlayerList[ii] = ""
      return 
    end
  end
end

ResponseParty_withdraw = function(withdrawType, actorKey, isMe)
  -- function num : 0_26 , upvalues : partyPenalty, Match_Button_Info
  if ToClient_IsRequestedPvP() or ToClient_IsMyselfInEntryUser() then
    return 
  end
  local message = ""
  if withdrawType == 0 then
    if isMe then
      message = PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_LEAVE_PARTY_SELF")
    else
      local actorProxyWrapper = getActor(actorKey)
      if actorProxyWrapper ~= nil then
        local textName = actorProxyWrapper:getOriginalName()
        message = tostring(textName) .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_LEAVE_PARTY_MEMBER")
      end
    end
  else
    do
      if withdrawType == 1 then
        if isMe then
          message = PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT_SELF")
        else
          local actorProxyWrapper = getActor(actorKey)
          if actorProxyWrapper ~= nil then
            local textName = actorProxyWrapper:getOriginalName()
            message = tostring(textName) .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT_MEMBER")
          end
        end
      else
        do
          if withdrawType == 2 then
            message = PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_DISPERSE")
          end
          NakMessagePanel_Reset()
          if message ~= "" and message ~= nil then
            Proc_ShowMessage_Ack(message)
          end
          partyPenalty:SetPosX((Match_Button_Info:GetSpanSize()).x + 60)
          partyPenalty:SetPosY((Match_Button_Info:GetSpanSize()).y - 1)
        end
      end
    end
  end
end

ResponseParty_changeLeader = function(actorKey)
  -- function num : 0_27
  local actorProxyWrapper = getActor(actorKey)
  if actorProxyWrapper == nil then
    return 
  end
  local textName = actorProxyWrapper:getName()
  Proc_ShowMessage_Ack(tostring(textName) .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_CHANGE_PARTY_LEADER"))
  ResponseParty_updatePartyList()
  Party_RegistItem_Show(false)
end

ResponseParty_refuse = function(reason)
  -- function num : 0_28
  local contentString = reason
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "PARTY_INVITE_MESSAGEBOX_TITLE"), content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

ResponseParty_invite = function(hostName, invitePartyType)
  -- function num : 0_29 , upvalues : requestPlayerList, partyType, refuseName, messageBox_party_accept, messageBox_party_refuse, PP
  for ii = 0, #requestPlayerList do
    if requestPlayerList[ii] == hostName then
      return 
    end
  end
  partyType = invitePartyType
  refuseName = hostName
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  requestPlayerList[#requestPlayerList] = hostName
  local messageboxMemo = hostName .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_INVITE_ACCEPT")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "PARTY_INVITE_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = messageBox_party_accept, functionNo = messageBox_party_refuse, priority = PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

PartyPop_clickChangeLeader = function(index)
  -- function num : 0_30 , upvalues : closePartyOption
  RequestParty_changeLeader(index)
  local memberData = RequestParty_getPartyMemberAt(index)
  closePartyOption()
end

PartyPop_clickWithdrawMember = function(index)
  -- function num : 0_31 , upvalues : closePartyOption
  local isPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
  if isPlayingPvPMatch == true then
    RequestParty_withdrawMember(index)
    return 
  end
  local partyOut = function()
    -- function num : 0_31_0 , upvalues : index, closePartyOption
    RequestParty_withdrawMember(index)
    FGlobal_PartyInventoryClose()
    closePartyOption()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_GETOUTPARTY")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = partyOut, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

messageBox_party_withdrawMember = function()
  -- function num : 0_32 , upvalues : withdrawMember
  local memberData = RequestParty_getPartyMemberAt(withdrawMember)
  RequestParty_withdrawMember(withdrawMember)
  if (getSelfPlayer()):isDefinedPvPMatch() == true then
    return 
  end
end

PartyPop_clickBanishMember = function(index)
  -- function num : 0_33 , upvalues : withdrawMember, PP, closePartyOption
  withdrawMember = index
  local withdrawMemberData = RequestParty_getPartyMemberAt(withdrawMember)
  local withdrawMemberActorKey = withdrawMemberData:getActorKey()
  local withdrawMemberPlayerActor = getPlayerActor(withdrawMemberActorKey)
  local contentString = withdrawMemberData:name() .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT_QUESTION")
  local titleForceOut = PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT")
  local messageboxData = {title = titleForceOut, content = contentString, functionYes = messageBox_party_withdrawMember, functionNo = MessageBox_Empty_function, priority = PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
  closePartyOption()
end

local ResponseParty_showList = function(idx)
  -- function num : 0_34 , upvalues : _partyData, _last_Index, closePartyOption, _uiPartyMemberList, isContentsEnable, _uiButtonWithdrawMember, _uiButtonChangeLeader
  local index = (_partyData[idx])._index
  local isShow = Panel_PartyOption:IsShow()
  if isShow == true and _last_Index == idx then
    closePartyOption()
  else
    local posY = ((_uiPartyMemberList[idx])._stylePartyOptionBtn):GetParentPosY() - 2
    local posX = ((_uiPartyMemberList[idx])._stylePartyOptionBtn):GetParentPosX() + ((_uiPartyMemberList[idx])._stylePartyOptionBtn):GetSizeX()
    if isContentsEnable then
      if (_partyData[idx])._isSelf == true then
        _uiButtonWithdrawMember:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_SELF_OUT"))
        _uiButtonWithdrawMember:addInputEvent("Mouse_LUp", "PartyPop_clickWithdrawMember(" .. index .. ")")
        _uiButtonWithdrawMember:SetShow(true)
        _uiButtonChangeLeader:SetShow(false)
        Panel_PartyOption:SetPosX(posX)
        Panel_PartyOption:SetPosY(posY)
        Panel_PartyOption:SetShow(true, true)
      else
        if (_partyData[0])._isMaster == true then
          _uiButtonWithdrawMember:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_MEMBER_FORCEOUT"))
          _uiButtonWithdrawMember:addInputEvent("Mouse_LUp", "PartyPop_clickBanishMember(" .. index .. ")")
          _uiButtonChangeLeader:addInputEvent("Mouse_LUp", "PartyPop_clickChangeLeader(" .. index .. ")")
          _uiButtonChangeLeader:SetShow(true)
          Panel_PartyOption:SetPosX(posX)
          Panel_PartyOption:SetPosY(posY)
          Panel_PartyOption:SetShow(true, true)
        else
          _uiButtonWithdrawMember:SetShow(false)
          _uiButtonChangeLeader:SetShow(false)
        end
      end
    else
      if (_partyData[idx])._isSelf == true then
        _uiButtonWithdrawMember:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_SELF_OUT"))
        _uiButtonWithdrawMember:addInputEvent("Mouse_LUp", "PartyPop_clickWithdrawMember(" .. index .. ")")
        _uiButtonWithdrawMember:SetShow(true)
        _uiButtonChangeLeader:SetShow(false)
        Panel_PartyOption:SetPosX(posX)
        Panel_PartyOption:SetPosY(posY)
        Panel_PartyOption:SetShow(true, true)
      else
        if (_partyData[0])._isMaster == true then
          _uiButtonWithdrawMember:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_MEMBER_FORCEOUT"))
          _uiButtonWithdrawMember:addInputEvent("Mouse_LUp", "PartyPop_clickBanishMember(" .. index .. ")")
          _uiButtonChangeLeader:addInputEvent("Mouse_LUp", "PartyPop_clickChangeLeader(" .. index .. ")")
          _uiButtonChangeLeader:SetShow(true)
          Panel_PartyOption:SetPosX(posX)
          Panel_PartyOption:SetPosY(posY)
          Panel_PartyOption:SetShow(true, true)
        else
          _uiButtonWithdrawMember:SetShow(false)
          _uiButtonChangeLeader:SetShow(false)
        end
      end
    end
  end
  do
    _last_Index = idx
  end
end

PartyPop_clickPartyOption = function(index)
  -- function num : 0_35 , upvalues : ResponseParty_showList
  ResponseParty_showList(index)
end

PartyPop_clickPartyFollow = function(index)
  -- function num : 0_36
  local selfPlayer = getSelfPlayer()
  local memberData = RequestParty_getPartyMemberAt(index)
  if memberData ~= nil then
    local actorKey = memberData:getActorKey()
    selfPlayer:setFollowActor(actorKey)
  end
end

PartyPop_SimpleTooltip_Show = function(isShow, tipType, index, isDistance)
  -- function num : 0_37 , upvalues : _uiPartyMemberList, partyPenalty
  local name, desc, control = nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "INTERACTION_BTN_FOLLOW_ACTOR")
    control = (_uiPartyMemberList[index])._styleFollowBtn
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_SIMPLETOOLTIP_DISTANCE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_SIMPLETOOLTIP_DISTANCE_DESC")
      control = (_uiPartyMemberList[index])._distance
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_SIMPLETOOLTIP_PENALTY_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_SIMPLETOOLTIP_PENALTY_DESC")
        control = partyPenalty
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

PartyOption_Hide = function()
  -- function num : 0_38
  Panel_PartyOption:SetShow(false)
  return false
end

PartyPop_onLootingOptionUI = function()
  -- function num : 0_39 , upvalues : _uiComboLootingOption, PLT, PLT2S
  if RequestParty_isLeader() == true then
    local lootType = RequestParty_getPartyLootType()
    _uiComboLootingOption:DeleteAllItem()
    for ii = 0, PLT.LootType_Bound - 2 do
      _uiComboLootingOption:AddItem(PLT2S[ii], ii)
    end
    _uiComboLootingOption:SetSelectItemIndex(lootType)
    _uiComboLootingOption:SetShow(true, false)
  end
end

PartyPop_offLootingOptionUI = function()
  -- function num : 0_40 , upvalues : _uiComboLootingOption
  local list = _uiComboLootingOption:GetListControl()
  if list:GetShow() then
    return 
  end
end

Panel_Party_ShowToggle = function()
  -- function num : 0_41 , upvalues : requestPlayerList
  local isShow = Panel_Party:GetShow()
  if RequestParty_getPartyMemberCount() == 0 then
    return 
  end
  if isShow == true then
    Panel_Party:SetShow(false)
    requestPlayerList = {}
  else
    Panel_Party:SetShow(true)
  end
end

partWidget_OnscreenEvent = function()
  -- function num : 0_42 , upvalues : requestPlayerList, _uiComboLootingOption
  if RequestParty_getPartyMemberCount() == 0 then
    Panel_Party:SetShow(false)
    requestPlayerList = {}
  else
    if not isFlushedUI() then
      Panel_Party:SetShow(true)
    end
    ResponseParty_updatePartyList()
  end
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_Party:GetRelativePosX() == -1 or Panel_Party:GetRelativePosY() == -1 then
      local initPosX = 10
      local initPosY = 200
      changePositionBySever(Panel_Party, (CppEnums.PAGameUIType).PAGameUIPanel_Party, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_Party, initPosX, initPosY)
    else
      do
        if Panel_Party:GetRelativePosX() == 0 or Panel_Party:GetRelativePosY() == 0 then
          Panel_Party:SetPosX(10)
          Panel_Party:SetPosY(200)
        else
          Panel_Party:SetPosX(getScreenSizeX() * Panel_Party:GetRelativePosX() - Panel_Party:GetSizeX() / 2)
          Panel_Party:SetPosY(getScreenSizeY() * Panel_Party:GetRelativePosY() - Panel_Party:GetSizeY() / 2)
        end
        changePositionBySever(Panel_Party, (CppEnums.PAGameUIType).PAGameUIPanel_Party, false, true, false)
        _uiComboLootingOption:ComputePos()
        FGlobal_PanelRepostionbyScreenOut(Panel_Party)
      end
    end
  end
end

FromClient_NotifyPartyMemberPickupItem = function(userName, itemName)
  -- function num : 0_43
  local message = ""
  message = PAGetStringParam2(Defines.StringSheet_GAME, "GAME_MESSAGE_NOTIFY_PARTYMEMBER_PICKUP_ITEM", "userName", userName, "itemName", itemName)
  Proc_ShowMessage_Ack_With_ChatType(message, nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).PartyItem)
end

FromClient_NotifyPartyMemberPickupItemFromPartyInventory = function(userName, itemName, itemCount)
  -- function num : 0_44
  local message = ""
  message = PAGetStringParam3(Defines.StringSheet_GAME, "GAME_MESSAGE_NOTIFY_PARTYMEMBER_PICKUP_ITEM_FOR_PARTYINVENTORY", "userName", userName, "itemName", itemName, "itemCount", tostring(itemCount))
  Proc_ShowMessage_Ack_With_ChatType(message, nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).PartyItem)
end

PartyPanel_Repos = function()
  -- function num : 0_45
  if not Panel_Window_PetControl:GetShow() then
    Panel_Party:SetSpanSize(10, 200)
  else
    Panel_Party:SetSpanSize(10, 310)
  end
end

FGlobal_PartyListUpdate = function()
  -- function num : 0_46
  ResponseParty_updatePartyList()
end

FromClient_UpdatePartyExperiencePenalty = function(isPenalty)
  -- function num : 0_47 , upvalues : partyPenalty, Match_Button_Info
  if isPenalty == nil then
    return 
  end
  if isPenalty then
    partyPenalty:SetShow(true)
    partyPenalty:SetPosX((Match_Button_Info:GetSpanSize()).x + 60)
    partyPenalty:SetPosY((Match_Button_Info:GetSpanSize()).y - 1)
  else
    partyPenalty:SetShow(false)
  end
end

PartyInit = function()
  -- function num : 0_48 , upvalues : partyType
  partyType = ToClient_GetPartyType()
end

_uiComboLootingOption:addInputEvent("Mouse_LUp", "Looting_ComboBox()")
Panel_Party:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
registerEvent("ResponseParty_createPartyList", "ResponseParty_createPartyList")
registerEvent("ResponseParty_updatePartyList", "ResponseParty_updatePartyList")
registerEvent("ResponseParty_invite", "ResponseParty_invite")
registerEvent("ResponseParty_refuse", "ResponseParty_refuse")
registerEvent("ResponseParty_changeLeader", "ResponseParty_changeLeader")
registerEvent("ResponseParty_withdraw", "ResponseParty_withdraw")
registerEvent("FromClient_GroundMouseClick", "PartyOption_Hide")
registerEvent("onScreenResize", "partWidget_OnscreenEvent")
registerEvent("FromClient_UpdatePartyExperiencePenalty", "FromClient_UpdatePartyExperiencePenalty")
registerEvent("FromClient_NotifyPartyMemberPickupItem", "FromClient_NotifyPartyMemberPickupItem")
registerEvent("FromClient_NotifyPartyMemberPickupItemFromPartyInventory", "FromClient_NotifyPartyMemberPickupItemFromPartyInventory")
PartyInit()
ResponseParty_createPartyList()
ResponseParty_updatePartyList()
renderModeChange_Panel_Party = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_49 , upvalues : requestPlayerList
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  if RequestParty_getPartyMemberCount() == 0 then
    Panel_Party:SetShow(false)
    requestPlayerList = {}
  else
    Panel_Party:SetShow(true)
    ResponseParty_updatePartyList()
  end
  partWidget_OnscreenEvent()
end

FGlobal_Party_ConditionalShow = function()
  -- function num : 0_50 , upvalues : requestPlayerList
  if RequestParty_getPartyMemberCount() == 0 then
    Panel_Party:SetShow(false)
    requestPlayerList = {}
  else
    Panel_Party:SetShow(true)
    ResponseParty_updatePartyList()
  end
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_Party")
changePositionBySever(Panel_Party, (CppEnums.PAGameUIType).PAGameUIPanel_Party, false, true, false)

