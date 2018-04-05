-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\savagedefence\savagedefencemember.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
Panel_SavageDefenceMember:SetShow(false)
Panel_SavageDefenceMember:SetDragEnable(true)
Panel_SavageDefenceMember:SetDragAll(true)
local savageDefenceMember = {_list2 = (UI.getChildControl)(Panel_SavageDefenceMember, "List2_JoinMember"), buttonBG = (UI.getChildControl)(Panel_SavageDefenceMember, "Static_ButtonBG"), listBG = (UI.getChildControl)(Panel_SavageDefenceMember, "Static_ListBG")}
savageDefenceMember.mycharacterName = (UI.getChildControl)(savageDefenceMember.buttonBG, "StaticText_MyCharacterName")
savageDefenceMember.myPoint = (UI.getChildControl)(savageDefenceMember.buttonBG, "StaticText_MyPoint")
savageDefenceMember.chk_List = (UI.getChildControl)(savageDefenceMember.buttonBG, "CheckButton_List")
savageDefenceMember.chk_Shop = (UI.getChildControl)(savageDefenceMember.buttonBG, "CheckButton_Shop")
savageDefenceMember.bottomArrow = (UI.getChildControl)(savageDefenceMember.listBG, "CheckButton_BottomArrow")
SavageDefenceMember_Init = function(listSize, BGSize)
  -- function num : 0_0 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  ;
  (self.chk_List):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SAVAGEDEFENCEMEMBER_JOINMEMBER"))
  ;
  (self.chk_Shop):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SAVAGEDEFENCEMEMBER_SHOP"))
  ;
  (self.chk_Shop):AddEffect("UI_Panel_Savage_Shop_01", true, 0, 0)
  local btnListSizeX = (self.chk_List):GetSizeX() + 23
  local btnListTextPosX = btnListSizeX - btnListSizeX / 2 - (self.chk_List):GetTextSizeX() / 2
  ;
  (self.chk_List):SetTextSpan(btnListTextPosX, 5)
  local btnShopSizeX = (self.chk_Shop):GetSizeX() + 23
  local btnShopTextPosX = btnShopSizeX - btnShopSizeX / 2 - (self.chk_Shop):GetTextSizeX() / 2
  ;
  (self.chk_Shop):SetTextSpan(btnShopTextPosX, 5)
  ;
  (self._list2):changeAnimationSpeed(10)
  ;
  (self._list2):SetSize((self._list2):GetSizeX(), listSize)
  ;
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobal_SavegeDefenceMember_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.chk_List):addInputEvent("Mouse_LUp", "PaGlobal_SavageDefenceMember_Toggle(0)")
  ;
  (self.chk_Shop):addInputEvent("Mouse_LUp", "PaGlobal_SavageDefenceMember_Toggle(1)")
  ;
  (self.chk_List):addInputEvent("Mouse_On", "SavageDefenceMember_TooltipButtonDesc(true, 0)")
  ;
  (self.chk_List):addInputEvent("Mouse_Out", "SavageDefenceMember_TooltipButtonDesc(false)")
  ;
  (self.chk_Shop):addInputEvent("Mouse_On", "SavageDefenceMember_TooltipButtonDesc(true, 1)")
  ;
  (self.chk_Shop):addInputEvent("Mouse_Out", "SavageDefenceMember_TooltipButtonDesc(false)")
  ;
  (self.bottomArrow):addInputEvent("Mouse_LUp", "PaGlobal_SavageDefenceMember_BottomArrow()")
  ;
  (self.listBG):SetSize(284, BGSize)
  ;
  (self.bottomArrow):ComputePos()
  ;
  (self.bottomArrow):SetShow(false)
end

SavageDefenceMember_Update = function(isListShow)
  -- function num : 0_1 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  local selfPlayer = getSelfPlayer()
  local memberCount = ToClient_getSavageDefenceJoinUserCount()
  local inMyCoin = ToClient_getSavageDefenceMyCoinCount()
  ;
  (savageDefenceMember.mycharacterName):SetText(tostring(selfPlayer:getOriginalName()))
  ;
  (savageDefenceMember.myPoint):SetText(makeDotMoney(inMyCoin))
  if isListShow == true then
    ((self._list2):getElementManager()):clearKey()
    for idx = 0, memberCount - 1 do
      ((self._list2):getElementManager()):pushKey(toInt64(0, R13_PC40))
    end
  else
    do
      for idx = 0, memberCount - 1 do
        FGlobal_SavageDefenceMember_ElementUpdate(R10_PC50)
      end
      do
        ;
        (self.bottomArrow):ComputePos()
      end
    end
  end
end

FGlobal_SavageDefenceMember_ElementUpdate = function(key)
  -- function num : 0_2 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  local KeyElement = (self._list2):GetContentByKey(toInt64(0, key))
  if KeyElement ~= nil then
    local btn_MemberName = (UI.getChildControl)(KeyElement, "Button_Member")
    local btn_GivePoint = (UI.getChildControl)(KeyElement, "Button_GiveCoin")
    local txt_PointCount = (UI.getChildControl)(KeyElement, "StaticText_CoinCount")
    local txt_DeadInfo = (UI.getChildControl)(KeyElement, "StaticText_DeadInfo")
    local memberName = ToClient_getSavageDefencePlayerName(key)
    local memberCoin = ToClient_getSavageDefencePlayerCoin(key)
    txt_PointCount:SetText(makeDotMoney(memberCoin))
    if ToClient_getSavageDefencePlayerDead(key) then
      txt_DeadInfo:SetShow(true)
      btn_MemberName:SetFontColor((Defines.Color).C_FF888888)
      txt_PointCount:SetFontColor((Defines.Color).C_FF888888)
      btn_GivePoint:SetMonoTone(true)
    else
      txt_DeadInfo:SetShow(false)
      btn_MemberName:SetFontColor((Defines.Color).C_FFFFFFFF)
      txt_PointCount:SetFontColor((Defines.Color).C_FFFFFFFF)
      btn_GivePoint:SetMonoTone(false)
    end
    if inMyCoin == 0 then
      btn_GivePoint:addInputEvent("Mouse_LUp", "")
    else
      btn_GivePoint:addInputEvent("Mouse_LUp", "SavageDefenceMember_Give( " .. key .. " )")
    end
  end
end

PaGlobal_SavegeDefenceMember_ListUpdate = function(contents, key)
  -- function num : 0_3 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  local idx = Int64toInt32(key)
  local inMyCoin = ToClient_getSavageDefenceMyCoinCount()
  local btn_MemberName = (UI.getChildControl)(contents, "Button_Member")
  btn_MemberName:SetShow(true)
  btn_MemberName:SetAlpha(0.8)
  local btn_GivePoint = (UI.getChildControl)(contents, "Button_GiveCoin")
  btn_GivePoint:SetShow(true)
  local txt_PointCount = (UI.getChildControl)(contents, "StaticText_CoinCount")
  txt_PointCount:SetShow(true)
  local txt_DeadInfo = (UI.getChildControl)(contents, "StaticText_DeadInfo")
  txt_DeadInfo:SetShow(true)
  local memberName = ToClient_getSavageDefencePlayerName(idx)
  local memberCoin = ToClient_getSavageDefencePlayerCoin(idx)
  btn_MemberName:SetText(tostring(memberName))
  btn_MemberName:SetShow(true)
  btn_MemberName:SetPosX(0)
  txt_PointCount:SetText(makeDotMoney(memberCoin))
  txt_PointCount:SetShow(true)
  txt_PointCount:SetPosX(150)
  txt_PointCount:SetPosY(5)
  txt_DeadInfo:SetPosX(100)
  txt_DeadInfo:SetPosY(5)
  txt_DeadInfo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEGAME_DEAD"))
  txt_DeadInfo:SetFontColor((Defines.Color).C_FFFF0000)
  if ToClient_getSavageDefencePlayerDead(idx) then
    txt_DeadInfo:SetShow(true)
    btn_MemberName:SetFontColor((Defines.Color).C_FF888888)
    txt_PointCount:SetFontColor((Defines.Color).C_FF888888)
    btn_GivePoint:SetMonoTone(true)
  else
    txt_DeadInfo:SetShow(false)
    btn_MemberName:SetFontColor((Defines.Color).C_FFFFFFFF)
    txt_PointCount:SetFontColor((Defines.Color).C_FFFFFFFF)
    btn_GivePoint:SetMonoTone(false)
  end
  btn_GivePoint:addInputEvent("Mouse_On", "SavageDefenceMember_Tooltip(true, " .. idx .. ")")
  btn_GivePoint:addInputEvent("Mouse_Out", "SavageDefenceMember_Tooltip(false, " .. idx .. ")")
  btn_GivePoint:SetShow(true)
  if inMyCoin == 0 then
    btn_GivePoint:addInputEvent("Mouse_LUp", "")
  else
    btn_GivePoint:addInputEvent("Mouse_LUp", "SavageDefenceMember_Give( " .. idx .. " )")
  end
end

SavageDefenceMember_Give = function(idx)
  -- function num : 0_4
  local inMyCoin = ToClient_getSavageDefenceMyCoinCount()
  local s64_maxNumber = toInt64(0, inMyCoin)
  Panel_NumberPad_Show(true, s64_maxNumber, idx, SavageDefenceMember_GiveXXX)
end

SavageDefenceMember_GiveXXX = function(inputNumber, param)
  -- function num : 0_5
  ToClient_SavageDefenceCoinToss(param, Int64toInt32(inputNumber))
end

PaGlobal_SavageDefenceMember_Toggle = function(toggleType)
  -- function num : 0_6 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  local isListCheck = (self.chk_List):IsCheck()
  local isShopCheck = (self.chk_Shop):IsCheck()
  if isListCheck then
    (self.listBG):SetShow(true)
    ;
    (self._list2):SetShow(true)
  else
    ;
    (self.listBG):SetShow(false)
    ;
    (self._list2):SetShow(false)
  end
  if isShopCheck then
    FGlobal_SavageDefenceShop_Open()
  else
    FGlobal_SavageDefenceShop_Close()
  end
end

PaGlobal_SavageDefenceMember_BottomArrow = function()
  -- function num : 0_7 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  local isArrowCheck = (self.bottomArrow):IsCheck()
  if isArrowCheck then
    SavageDefenceMember_Init(760, 780)
    local texturePath = "New_UI_Common_forLua/Widget/Party/Cave_00.dds"
    ;
    (self.bottomArrow):ChangeTextureInfoName(texturePath)
    local x1, y1, x2, y2 = setTextureUV_Func(self.bottomArrow, 98, 90, 121, 105)
    ;
    ((self.bottomArrow):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self.bottomArrow):setRenderTexture((self.bottomArrow):getBaseTexture())
    ;
    (self.bottomArrow):ChangeOnTextureInfoName(texturePath)
    local x1, y1, x2, y2 = setTextureUV_Func(self.bottomArrow, 124, 90, 147, 105)
    ;
    ((self.bottomArrow):getOnTexture()):setUV(x1, y1, x2, y2)
    ;
    (self.bottomArrow):setRenderTexture((self.bottomArrow):getOnTexture())
    ;
    (self.bottomArrow):ChangeClickTextureInfoName(texturePath)
    local x1, y1, x2, y2 = setTextureUV_Func(self.bottomArrow, 151, 90, 174, 105)
    ;
    ((self.bottomArrow):getClickTexture()):setUV(x1, y1, x2, y2)
    ;
    (self.bottomArrow):setRenderTexture((self.bottomArrow):getClickTexture())
  else
    do
      SavageDefenceMember_Init(350, 350)
      local texturePath = "New_UI_Common_forLua/Widget/Party/Cave_00.dds"
      ;
      (self.bottomArrow):ChangeTextureInfoName(texturePath)
      local x1, y1, x2, y2 = setTextureUV_Func(self.bottomArrow, 98, 73, 121, 88)
      ;
      ((self.bottomArrow):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (self.bottomArrow):setRenderTexture((self.bottomArrow):getBaseTexture())
      ;
      (self.bottomArrow):ChangeOnTextureInfoName(texturePath)
      local x1, y1, x2, y2 = setTextureUV_Func(self.bottomArrow, 124, 73, 147, 88)
      ;
      ((self.bottomArrow):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (self.bottomArrow):setRenderTexture((self.bottomArrow):getOnTexture())
      ;
      (self.bottomArrow):ChangeClickTextureInfoName(texturePath)
      do
        local x1, y1, x2, y2 = setTextureUV_Func(self.bottomArrow, 151, 73, 174, 88)
        ;
        ((self.bottomArrow):getClickTexture()):setUV(x1, y1, x2, y2)
        ;
        (self.bottomArrow):setRenderTexture((self.bottomArrow):getClickTexture())
        SavageDefenceMember_Update(true)
        ;
        (self._list2):moveTopIndex()
        ;
        (self.bottomArrow):ComputePos()
      end
    end
  end
end

SavageDefenceMember_Open = function(isListUpdate)
  -- function num : 0_8 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  if not ToClient_getPlayNowSavageDefence() then
    return 
  end
  ;
  (self.bottomArrow):SetCheck(false)
  Panel_SavageDefenceMember:SetShow(true)
  if (self.listBG):GetShow() then
    local isListShow = (self._list2):GetShow()
  end
  ;
  (self.chk_List):SetCheck(isListShow)
  ;
  (self.chk_Shop):SetCheck(Panel_SavageDefenceShop:GetShow())
  SavageDefenceMember_Update(isListUpdate)
end

SavageDefenceMember_Close = function()
  -- function num : 0_9
  Panel_SavageDefenceMember:SetShow(false)
end

PaGlobal_SavageDefenceMember_Position = function()
  -- function num : 0_10
  Panel_SavageDefenceMember:SetPosY(Panel_SelfPlayerExpGage:GetPosX() + Panel_SelfPlayerExpGage:GetSizeY() + 170)
end

SavageDefenceMember_Tooltip = function(isShow, idx)
  -- function num : 0_11 , upvalues : savageDefenceMember
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local self = savageDefenceMember
  local control = self._list2
  local contents = (control:GetContentByKey(toInt64(0, idx)))
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEMEMBER_TOOLTIP_POINT_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEMEMBER_TOOLTIP_POINT_DESC")
  TooltipSimple_Show(contents, name, desc)
end

SavageDefenceMember_TooltipButtonDesc = function(isShow, tipType)
  -- function num : 0_12 , upvalues : savageDefenceMember
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local self = savageDefenceMember
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEMEMBER_TOOLTIP_BUTTON_LIST_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEMEMBER_TOOLTIP_BUTTON_LIST_DESC")
    control = self.chk_List
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEMEMBER_TOOLTIP_BUTTON_SHOP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEMEMBER_TOOLTIP_BUTTON_SHOP_DESC")
      control = self.chk_Shop
    end
  end
  TooltipSimple_Show(control, name, desc)
end

SavageDefenceShop_CloseByKey = function()
  -- function num : 0_13 , upvalues : savageDefenceMember
  local self = savageDefenceMember
  ;
  (self.chk_Shop):SetCheck(false)
  FGlobal_SavageDefenceShop_Close()
end

FromClient_refreshSavageDefencePlayer = function(isListUpdate)
  -- function num : 0_14
  SavageDefenceMember_Open(isListUpdate)
  FGlobal_SavageDefenceShop_coinUpdate()
end

SavageDefenceMember_Init(350, 350)
PaGlobal_SavageDefenceMember_Position()
registerEvent("FromClient_refreshSavageDefencePlayer", "FromClient_refreshSavageDefencePlayer")
registerEvent("onScreenResize", "PaGlobal_SavageDefenceMember_Position")

