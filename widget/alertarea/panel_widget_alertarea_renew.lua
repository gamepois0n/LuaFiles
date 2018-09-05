function ResetPos_WidgetButton()
end
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
AlertType = {
  eALERT_Hunting = 0,
  eALERT_GuildBusterCall = 1,
  eALERT_SiegeWarCall = 2,
  eALERT_PartySummon = 3,
  eALERT_ReturnTown = 4,
  eALERT_Coupon = 5,
  eALERT_LearnSkill = 6,
  eALERT_NewStoryKnowledge = 7,
  eALERT_NewKnowledge = 8,
  eALERT_Mail = 9,
  eALERT_ChallengeReward = 10,
  eALERT_PcRoomReward = 11,
  eALERT_NewFriend = 12,
  eALERT_BlackSpiritQuest = 13,
  eALERT_WeightOver = 14,
  eALERT_EndurancePc = 15,
  eALERT_EnduranceHorse = 16,
  eALERT_EnduranceCarriage = 17,
  eALERT_EnduranceShip = 18,
  eALERT_BatterEquipment = 19,
  eALERT_Count = 20
}
local Panel_Widget_Alert_info = {
  _ui = {
    Static_Bg = nil,
    Button_Spread = nil,
    Button_Hunting = nil,
    StaticText_HuntingCount = nil,
    Button_GuildBusterCall = nil,
    Button_SiegeWarCall = nil,
    Button_PartySummon = nil,
    Button_ReturnTown = nil,
    Button_Coupon = nil,
    StaticText_CouponCount = nil,
    Button_LearnSkill = nil,
    StaticText_LearnSkillCount = nil,
    Button_NewStoryKnowledge = nil,
    StaticText_NewStoryKnowledgeCount = nil,
    Button_NewKnowledge = nil,
    StaticText_NewKnowledgeCount = nil,
    Button_Mail = nil,
    Button_ChallengeReward = nil,
    StaticText_ChallengeRewardCount = nil,
    Button_PcRoomReward = nil,
    Button_NewFriend = nil,
    Button_BlackSpiritQuest = nil,
    Button_WeightOver = nil,
    Button_EndurancePc = nil,
    Button_EnduranceHorse = nil,
    Button_EnduranceCarriage = nil,
    Button_EnduranceShip = nil,
    Button_BatterEquipment = nil
  },
  _value = {isSpread = false},
  _config = {},
  _pos = {
    baseSpcae = 4,
    buttonBasePosY = 0,
    buttonSizeY = 35
  },
  _alertShow = {
    [AlertType.eALERT_Hunting] = false,
    [AlertType.eALERT_GuildBusterCall] = false,
    [AlertType.eALERT_SiegeWarCall] = false,
    [AlertType.eALERT_PartySummon] = false,
    [AlertType.eALERT_ReturnTown] = false,
    [AlertType.eALERT_Coupon] = false,
    [AlertType.eALERT_LearnSkill] = false,
    [AlertType.eALERT_NewStoryKnowledge] = false,
    [AlertType.eALERT_NewKnowledge] = false,
    [AlertType.eALERT_Mail] = false,
    [AlertType.eALERT_ChallengeReward] = false,
    [AlertType.eALERT_PcRoomReward] = false,
    [AlertType.eALERT_NewFriend] = false,
    [AlertType.eALERT_BlackSpiritQuest] = false,
    [AlertType.eALERT_WeightOver] = false,
    [AlertType.eALERT_EndurancePc] = false,
    [AlertType.eALERT_EnduranceHorse] = false,
    [AlertType.eALERT_EnduranceCarriage] = false,
    [AlertType.eALERT_EnduranceShip] = false,
    [AlertType.eALERT_BatterEquipment] = false
  },
  _alertNeedUpdate = {
    [AlertType.eALERT_Hunting] = false,
    [AlertType.eALERT_GuildBusterCall] = false,
    [AlertType.eALERT_SiegeWarCall] = false,
    [AlertType.eALERT_PartySummon] = false,
    [AlertType.eALERT_ReturnTown] = false,
    [AlertType.eALERT_Coupon] = false,
    [AlertType.eALERT_LearnSkill] = false,
    [AlertType.eALERT_NewStoryKnowledge] = false,
    [AlertType.eALERT_NewKnowledge] = false,
    [AlertType.eALERT_Mail] = false,
    [AlertType.eALERT_ChallengeReward] = false,
    [AlertType.eALERT_PcRoomReward] = false,
    [AlertType.eALERT_NewFriend] = false,
    [AlertType.eALERT_BlackSpiritQuest] = false,
    [AlertType.eALERT_WeightOver] = false,
    [AlertType.eALERT_EndurancePc] = false,
    [AlertType.eALERT_EnduranceHorse] = false,
    [AlertType.eALERT_EnduranceCarriage] = false,
    [AlertType.eALERT_EnduranceShip] = false,
    [AlertType.eALERT_BatterEquipment] = false
  },
  _alertButton = {
    [AlertType.eALERT_Hunting] = nil,
    [AlertType.eALERT_GuildBusterCall] = nil,
    [AlertType.eALERT_SiegeWarCall] = nil,
    [AlertType.eALERT_PartySummon] = nil,
    [AlertType.eALERT_ReturnTown] = nil,
    [AlertType.eALERT_Coupon] = nil,
    [AlertType.eALERT_LearnSkill] = nil,
    [AlertType.eALERT_NewStoryKnowledge] = nil,
    [AlertType.eALERT_NewKnowledge] = nil,
    [AlertType.eALERT_Mail] = nil,
    [AlertType.eALERT_ChallengeReward] = nil,
    [AlertType.eALERT_PcRoomReward] = nil,
    [AlertType.eALERT_NewFriend] = nil,
    [AlertType.eALERT_BlackSpiritQuest] = nil,
    [AlertType.eALERT_WeightOver] = nil,
    [AlertType.eALERT_EndurancePc] = nil,
    [AlertType.eALERT_EnduranceHorse] = nil,
    [AlertType.eALERT_EnduranceCarriage] = nil,
    [AlertType.eALERT_EnduranceShip] = nil,
    [AlertType.eALERT_BatterEquipment] = nil
  },
  _alertClosedButton = {
    [AlertType.eALERT_Hunting] = nil,
    [AlertType.eALERT_GuildBusterCall] = nil,
    [AlertType.eALERT_SiegeWarCall] = nil,
    [AlertType.eALERT_PartySummon] = nil,
    [AlertType.eALERT_ReturnTown] = nil,
    [AlertType.eALERT_Coupon] = nil,
    [AlertType.eALERT_LearnSkill] = nil,
    [AlertType.eALERT_NewStoryKnowledge] = nil,
    [AlertType.eALERT_NewKnowledge] = nil,
    [AlertType.eALERT_Mail] = nil,
    [AlertType.eALERT_ChallengeReward] = nil,
    [AlertType.eALERT_PcRoomReward] = nil,
    [AlertType.eALERT_NewFriend] = nil,
    [AlertType.eALERT_BlackSpiritQuest] = nil,
    [AlertType.eALERT_WeightOver] = nil,
    [AlertType.eALERT_EndurancePc] = nil,
    [AlertType.eALERT_EnduranceHorse] = nil,
    [AlertType.eALERT_EnduranceCarriage] = nil,
    [AlertType.eALERT_EnduranceShip] = nil,
    [AlertType.eALERT_BatterEquipment] = nil
  },
  _alertData = {
    [AlertType.eALERT_Hunting] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_GuildBusterCall] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_SiegeWarCall] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_PartySummon] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_ReturnTown] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_Coupon] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_LearnSkill] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_NewStoryKnowledge] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_NewKnowledge] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_Mail] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_ChallengeReward] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_PcRoomReward] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_NewFriend] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_BlackSpiritQuest] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_WeightOver] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_EndurancePc] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_EnduranceHorse] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_EnduranceCarriage] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_EnduranceShip] = {
      name = "",
      desc = "",
      count = 0
    },
    [AlertType.eALERT_BatterEquipment] = {
      name = "",
      desc = "",
      count = 0
    }
  }
}
local cardListNormal = {}
local cardListImportant = {}
local equipItemData = {
  _buttonWeapon = false,
  _buttonSubWeapon = false,
  _buttonHelm = false,
  _buttonUpper = false,
  _buttonHand = false,
  _buttonFoot = false
}
local haveBatterEquip = false
function Panel_Widget_Alert_info:registEventHandler()
  self._ui.Button_Spread:addInputEvent("Mouse_LUp", "PaGlobalFunc_Widget_Alert_ClickSpread()")
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertButton[index] then
      self._alertButton[index]:addInputEvent("Mouse_On", "PaGlobalFunc_Widget_Alert_HandleOver(" .. index .. ")")
      self._alertButton[index]:addInputEvent("Mouse_LUp", "PaGlobalFunc_Widget_Alert_HandleLClick(" .. index .. ")")
      self._alertButton[index]:addInputEvent("Mouse_RUp", "PaGlobalFunc_Widget_Alert_HandleRClick(" .. index .. ")")
      self._alertButton[index]:addInputEvent("Mouse_Out", "PaGlobalFunc_Widget_Alert_HandleOut()")
      if nil ~= self._alertClosedButton[index] then
        self._alertClosedButton[index]:addInputEvent("Mouse_On", "PaGlobalFunc_Widget_Alert_HandleOver(" .. index .. ")")
        self._alertClosedButton[index]:addInputEvent("Mouse_LUp", "PaGlobalFunc_Widget_Alert_HandleLClick(" .. index .. ")")
        self._alertClosedButton[index]:addInputEvent("Mouse_RUp", "PaGlobalFunc_Widget_Alert_HandleRClick(" .. index .. ")")
        self._alertClosedButton[index]:addInputEvent("Mouse_Out", "PaGlobalFunc_Widget_Alert_HandleOut()")
      end
    end
  end
end
function Panel_Widget_Alert_info:registerMessageHandler()
  Panel_UIMain:RegisterUpdateFunc("FromClient_Widget_Alert_UpdatePerFrame")
  registerEvent("onScreenResize", "FromClient_Widget_Alert_Resize")
  registerEvent("FromClient_ResponseBustCall", "FromClient_Widget_Alert_ResponseBustCall")
  registerEvent("FromClient_ResponseTeleportToSiegeTent", "FromClient_Widget_Alert_ResponseTeleportToSiegeTent")
  registerEvent("FromClient_ResponseUseCompass", "FromClient_Widget_Alert_ResponseUseCompass")
  registerEvent("FromClient_ResponseUseReturnStone", "FromClient_Widget_Alert_ResponseUseReturnStone")
  registerEvent("FromClient_UpdateCouponInfo", "FromClient_Widget_Alert_UpdateCoupon")
  registerEvent("FromClient_RegisterCoupon", "FromClient_Widget_Alert_UpdateCoupon")
  registerEvent("EventSkillWindowUpdate", "FromClient_Widget_Alert_EventSkillWindowUpdate")
  registerEvent("FromClient_NewKnowledge", "FromClient_Widget_Alert_NewKnowledge")
  registerEvent("FromClient_NewMail", "FromClient_Widget_Alert_NewMail")
  registerEvent("ResponseMail_showList", "FromClient_Widget_Alert_NewMailRead")
  registerEvent("FromClient_CompleteBenefitReward", "FromClient_Widget_Alert_CompleteBenefitReward")
  registerEvent("FromClient_ChallengeReward_UpdateText", "FromClient_Widget_Alert_CompleteBenefitReward")
  registerEvent("FromClient_NewFriend", "FromClient_Widget_Alert_NewFriendAlert")
  registerEvent("ResponseFriendList_updateAddFriends", "FromClient_Widget_Alert_Update_NewFriend")
  registerEvent("FromClient_UpdateQuestList", "FromClient_Widget_Alert_BlackSpiritQuest")
  registerEvent("FromClient_WeightChanged", "FromClient_Widget_Alert_WeightOver")
  registerEvent("FromClient_InventoryUpdate", "FromClient_Widget_Alert_WeightOver")
  registerEvent("FromClient_EquipEnduranceChanged", "FromClient_Widget_Alert_EquipEnduranceChanged")
  registerEvent("EventEquipmentUpdate", "FromClient_Widget_Alert_PlayerEnduranceUpdate")
  registerEvent("EventServantEquipItem", "FromClient_Widget_Alert_ServantEnduranceUpdate")
  registerEvent("EventServantEquipmentUpdate", "FromClient_Widget_Alert_ServantEnduranceUpdate")
  registerEvent("EventSelfServantClose", "FromClient_Widget_Alert_ServantSeal")
  registerEvent("FromClient_InventoryUpdate", "FromClient_Widget_Alert_BatterEquipment")
end
function Panel_Widget_Alert_info:initialize()
  self:childControl()
  self:initValue()
  self:resize()
  self:setButton()
  self:setClosedButton()
  self:registerMessageHandler()
  self:registEventHandler()
end
function Panel_Widget_Alert_info:initValue()
  self._value.isSpread = false
end
function Panel_Widget_Alert_info:resize()
  Panel_UIMain:ComputePos()
end
function Panel_Widget_Alert_info:setButton()
  self._alertButton[AlertType.eALERT_Hunting] = self._ui.Button_Hunting
  self._alertButton[AlertType.eALERT_GuildBusterCall] = self._ui.Button_GuildBusterCall
  self._alertButton[AlertType.eALERT_SiegeWarCall] = self._ui.Button_SiegeWarCall
  self._alertButton[AlertType.eALERT_PartySummon] = self._ui.Button_PartySummon
  self._alertButton[AlertType.eALERT_ReturnTown] = self._ui.Button_ReturnTown
  self._alertButton[AlertType.eALERT_Coupon] = self._ui.Button_Coupon
  self._alertButton[AlertType.eALERT_LearnSkill] = self._ui.Button_LearnSkill
  self._alertButton[AlertType.eALERT_NewStoryKnowledge] = self._ui.Button_NewStoryKnowledge
  self._alertButton[AlertType.eALERT_NewKnowledge] = self._ui.Button_NewKnowledge
  self._alertButton[AlertType.eALERT_Mail] = self._ui.Button_Mail
  self._alertButton[AlertType.eALERT_ChallengeReward] = self._ui.Button_ChallengeReward
  self._alertButton[AlertType.eALERT_PcRoomReward] = self._ui.Button_PcRoomReward
  self._alertButton[AlertType.eALERT_NewFriend] = self._ui.Button_NewFriend
  self._alertButton[AlertType.eALERT_BlackSpiritQuest] = self._ui.Button_BlackSpiritQuest
  self._alertButton[AlertType.eALERT_WeightOver] = self._ui.Button_WeightOver
  self._alertButton[AlertType.eALERT_EndurancePc] = self._ui.Button_EndurancePc
  self._alertButton[AlertType.eALERT_EnduranceHorse] = self._ui.Button_EnduranceHorse
  self._alertButton[AlertType.eALERT_EnduranceCarriage] = self._ui.Button_EnduranceCarriage
  self._alertButton[AlertType.eALERT_EnduranceShip] = self._ui.Button_EnduranceShip
  self._alertButton[AlertType.eALERT_BatterEquipment] = self._ui.Button_BatterEquipment
end
function Panel_Widget_Alert_info:setClosedButton()
  self._alertClosedButton[AlertType.eALERT_Hunting] = nil
  self._alertClosedButton[AlertType.eALERT_GuildBusterCall] = nil
  self._alertClosedButton[AlertType.eALERT_SiegeWarCall] = nil
  self._alertClosedButton[AlertType.eALERT_PartySummon] = nil
  self._alertClosedButton[AlertType.eALERT_ReturnTown] = nil
  self._alertClosedButton[AlertType.eALERT_Coupon] = nil
  self._alertClosedButton[AlertType.eALERT_LearnSkill] = nil
  self._alertClosedButton[AlertType.eALERT_NewStoryKnowledge] = nil
  self._alertClosedButton[AlertType.eALERT_NewKnowledge] = nil
  self._alertClosedButton[AlertType.eALERT_Mail] = nil
  self._alertClosedButton[AlertType.eALERT_ChallengeReward] = nil
  self._alertClosedButton[AlertType.eALERT_PcRoomReward] = nil
  self._alertClosedButton[AlertType.eALERT_NewFriend] = nil
  self._alertClosedButton[AlertType.eALERT_BlackSpiritQuest] = nil
  self._alertClosedButton[AlertType.eALERT_WeightOver] = UI.cloneControl(self._ui.Button_WeightOver, self._ui.Static_Bg, "Button_WeightOver_Close")
  self._alertClosedButton[AlertType.eALERT_EndurancePc] = UI.cloneControl(self._ui.Button_EndurancePc, self._ui.Static_Bg, "Button_EndurancePc_Close")
  self._alertClosedButton[AlertType.eALERT_EnduranceHorse] = UI.cloneControl(self._ui.Button_EnduranceHorse, self._ui.Static_Bg, "Button_EnduranceHorse_Close")
  self._alertClosedButton[AlertType.eALERT_EnduranceCarriage] = UI.cloneControl(self._ui.Button_EnduranceCarriage, self._ui.Static_Bg, "Button_EnduranceCarriage_Close")
  self._alertClosedButton[AlertType.eALERT_EnduranceShip] = UI.cloneControl(self._ui.Button_EnduranceShip, self._ui.Static_Bg, "Button_EnduranceShip_Close")
  self._alertClosedButton[AlertType.eALERT_BatterEquipment] = nil
end
function Panel_Widget_Alert_info:childControl()
  self._ui.Static_Bg = UI.getChildControl(Panel_UIMain, "Static_Bg")
  self._ui.Button_Spread = UI.getChildControl(self._ui.Static_Bg, "Button_Spread")
  self._ui.Button_Hunting = UI.getChildControl(self._ui.Static_Bg, "Button_Hunting")
  self._ui.StaticText_HuntingCount = UI.getChildControl(self._ui.Button_Hunting, "StaticText_HuntingCount")
  self._ui.Button_GuildBusterCall = UI.getChildControl(self._ui.Static_Bg, "Button_GuildBusterCall")
  self._ui.Button_SiegeWarCall = UI.getChildControl(self._ui.Static_Bg, "Button_SiegeWarCall")
  self._ui.Button_PartySummon = UI.getChildControl(self._ui.Static_Bg, "Button_PartySummon")
  self._ui.Button_ReturnTown = UI.getChildControl(self._ui.Static_Bg, "Button_ReturnTown")
  self._ui.Button_Coupon = UI.getChildControl(self._ui.Static_Bg, "Button_Coupon")
  self._ui.StaticText_CouponCount = UI.getChildControl(self._ui.Button_Coupon, "StaticText_CouponCount")
  self._ui.Button_LearnSkill = UI.getChildControl(self._ui.Static_Bg, "Button_LearnSkill")
  self._ui.StaticText_LearnSkillCount = UI.getChildControl(self._ui.Button_LearnSkill, "StaticText_LearnSkillCount")
  self._ui.Button_NewStoryKnowledge = UI.getChildControl(self._ui.Static_Bg, "Button_NewStoryKnowledge")
  self._ui.StaticText_NewStoryKnowledgeCount = UI.getChildControl(self._ui.Button_NewStoryKnowledge, "StaticText_NewStoryKnowledgeCount")
  self._ui.Button_NewKnowledge = UI.getChildControl(self._ui.Static_Bg, "Button_NewKnowledge")
  self._ui.StaticText_NewKnowledgeCount = UI.getChildControl(self._ui.Button_NewKnowledge, "StaticText_NewKnowledgeCount")
  self._ui.Button_Mail = UI.getChildControl(self._ui.Static_Bg, "Button_Mail")
  self._ui.Button_ChallengeReward = UI.getChildControl(self._ui.Static_Bg, "Button_ChallengeReward")
  self._ui.StaticText_ChallengeRewardCount = UI.getChildControl(self._ui.Button_ChallengeReward, "StaticText_ChallengeRewardCount")
  self._ui.Button_PcRoomReward = UI.getChildControl(self._ui.Static_Bg, "Button_PcRoomReward")
  self._ui.Button_NewFriend = UI.getChildControl(self._ui.Static_Bg, "Button_NewFriend")
  self._ui.Button_BlackSpiritQuest = UI.getChildControl(self._ui.Static_Bg, "Button_BlackSpiritQuest")
  self._ui.Button_WeightOver = UI.getChildControl(self._ui.Static_Bg, "Button_WeightOver")
  self._ui.Button_EndurancePc = UI.getChildControl(self._ui.Static_Bg, "Button_EndurancePc")
  self._ui.Button_EnduranceHorse = UI.getChildControl(self._ui.Static_Bg, "Button_EnduranceHorse")
  self._ui.Button_EnduranceCarriage = UI.getChildControl(self._ui.Static_Bg, "Button_EnduranceCarriage")
  self._ui.Button_EnduranceShip = UI.getChildControl(self._ui.Static_Bg, "Button_EnduranceShip")
  self._ui.Button_BatterEquipment = UI.getChildControl(self._ui.Static_Bg, "Button_BatterEquipment")
end
function Panel_Widget_Alert_info:checkSpreadForced(alertType)
  if nil == self._alertNeedUpdate[alertType] or nil == self._alertShow[alertType] then
    return false
  end
  if true == self._alertShow[alertType] and false == self._value.isSpread then
    PaGlobalFunc_Widget_Alert_ClickSpread()
    return true
  end
  return false
end
function Panel_Widget_Alert_info:checkNeedUpdate()
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertNeedUpdate[index] and true == self._alertNeedUpdate[index] then
      return true
    end
  end
  return false
end
function Panel_Widget_Alert_info:clearNeedUpdate()
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertNeedUpdate[index] then
      self._alertNeedUpdate[index] = false
    end
  end
end
function Panel_Widget_Alert_info:updateCloseIcons(ignoerSetDataType1, ignoerSetDataType2)
  if true == self._value.isSpread then
    return
  end
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertShow[index] and nil ~= self._alertClosedButton[index] then
      self:setData(index)
    end
  end
  self:updateCloseIconPos()
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertShow[index] and nil ~= self._alertClosedButton[index] then
      self._alertClosedButton[index]:SetShow(self._alertShow[index])
    end
  end
end
function Panel_Widget_Alert_info:updateIcons(forced, ignoerSetDataType1, ignoerSetDataType2)
  if false == self._value.isSpread then
    self:updateCloseIcons()
    return
  end
  if true ~= forced and false == self:checkNeedUpdate() then
    return
  end
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertShow[index] and (true == forced or true == self._alertNeedUpdate[index] and index ~= ignoerSetDataType1) then
      self:setData(index)
    end
  end
  self:updateIconPos()
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertShow[index] then
      self._alertButton[index]:SetShow(self._alertShow[index])
      self._alertButton[index]:ResetVertexAni()
      local MoveAni = self._alertButton[index]:addMoveAnimation(0, 0.2, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_COS_HALF_PI)
      MoveAni:SetStartPosition(0, 0)
      MoveAni:SetEndPosition(self._alertButton[index]:GetPosX(), 0)
    end
  end
  self:clearNeedUpdate()
end
function Panel_Widget_Alert_info:updateCloseIconPos()
  local basePosXRight = self._ui.Button_Spread:GetPosX() - self._ui.Button_Spread:GetSizeX() - self._pos.baseSpcae
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertShow[index] and true == self._alertShow[index] and nil ~= self._alertClosedButton[index] then
      self._alertClosedButton[index]:SetPosX(basePosXRight)
      basePosXRight = basePosXRight - 35 - self._pos.baseSpcae
    end
  end
end
function Panel_Widget_Alert_info:updateIconPos()
  local basePosXRight = self._ui.Button_Spread:GetPosX() - self._ui.Button_Spread:GetSizeX() - self._pos.baseSpcae
  for index = 0, AlertType.eALERT_Count - 1 do
    if nil ~= self._alertShow[index] and true == self._alertShow[index] then
      self._alertButton[index]:SetPosX(basePosXRight)
      basePosXRight = basePosXRight - 35 - self._pos.baseSpcae
    end
  end
end
function Panel_Widget_Alert_info:showAllButton()
  self._value.isSpread = true
  self:updateIcons(true)
  self._ui.Button_Spread:SetCheck(false)
  self:hideAllCloseButton()
end
function Panel_Widget_Alert_info:hideAllCloseButton()
  for index = AlertType.eALERT_Count - 1, 0, -1 do
    if nil ~= self._alertShow[index] and nil ~= self._alertClosedButton[index] then
      self._alertClosedButton[index]:SetShow(false)
    end
  end
end
function Panel_Widget_Alert_info:hideAllButton()
  self._value.isSpread = false
  for index = AlertType.eALERT_Count - 1, 0, -1 do
    if nil ~= self._alertShow[index] then
      self._alertButton[index]:ResetVertexAni()
      local MoveAni = self._alertButton[index]:addMoveAnimation(0, 0.2, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      MoveAni:SetStartPosition(self._alertButton[index]:GetPosX(), 0)
      MoveAni:SetEndPosition(0, 0)
      MoveAni:SetHideAtEnd(true)
      MoveAni:SetDisableWhileAni(true)
    end
  end
  self._ui.Button_Spread:SetCheck(true)
  self:updateCloseIcons()
end
function Panel_Widget_Alert_info:setButtonShow(alertType, value, needUpdate)
  if nil == alertType then
    return
  end
  if alertType < 0 or alertType >= AlertType.eALERT_Count then
    return
  end
  if nil == self._alertShow[alertType] then
    return
  end
  if self._alertShow[alertType] == value then
    if true == needUpdate then
      self:setNeedUpdate(alertType, true)
    end
  else
    self._alertShow[alertType] = value
    self:setNeedUpdate(alertType, true)
  end
end
function Panel_Widget_Alert_info:setNeedUpdate(alertType, value)
  if alertType < 0 or alertType >= AlertType.eALERT_Count then
    return
  end
  if nil == self._alertShow[alertType] then
    return
  end
  self._alertNeedUpdate[alertType] = value
end
function PaGlobalFunc_UiMain_SetShow(isShow)
  if true == isShow then
    if -1 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_UIMenu, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow) then
      Panel_UIMain:SetShow(ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_UIMenu, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow))
    else
      Panel_UIMain:SetShow(true, false)
    end
  else
    Panel_UIMain:SetShow(false)
  end
end
function Panel_Widget_Alert_info:open()
  PaGlobalFunc_UiMain_SetShow(true)
end
function Panel_Widget_Alert_info:close()
  PaGlobalFunc_UiMain_SetShow(false)
end
function Panel_Widget_Alert_info:setData(alertType)
  if alertType == AlertType.eALERT_Hunting then
    PaGlobalFunc_Widget_Alert_Check_Hunting()
  elseif alertType == AlertType.eALERT_GuildBusterCall then
    PaGlobalFunc_Widget_Alert_Check_GuildBusterCall()
  elseif alertType == AlertType.eALERT_SiegeWarCall then
    PaGlobalFunc_Widget_Alert_Check_SiegeWarCall()
  elseif alertType == AlertType.eALERT_PartySummon then
    PaGlobalFunc_Widget_Alert_Check_PartySummon()
  elseif alertType == AlertType.eALERT_ReturnTown then
    PaGlobalFunc_Widget_Alert_Check_ReturnTown()
  elseif alertType == AlertType.eALERT_Coupon then
    PaGlobalFunc_Widget_Alert_Check_Coupon()
  elseif alertType == AlertType.eALERT_LearnSkill then
    PaGlobalFunc_Widget_Alert_Check_LearnSkill()
  elseif alertType == AlertType.eALERT_NewStoryKnowledge then
    PaGlobalFunc_Widget_Alert_Check_NewStoryKnowledge()
  elseif alertType == AlertType.eALERT_NewKnowledge then
    PaGlobalFunc_Widget_Alert_Check_NewKnowledge()
  elseif alertType == AlertType.eALERT_Mail then
    PaGlobalFunc_Widget_Alert_Check_Mail()
  elseif alertType == AlertType.eALERT_ChallengeReward then
    PaGlobalFunc_Widget_Alert_Check_ChallengeReward()
  elseif alertType == AlertType.eALERT_PcRoomReward then
    PaGlobalFunc_Widget_Alert_Check_PcRoomReward()
  elseif alertType == AlertType.eALERT_NewFriend then
    PaGlobalFunc_Widget_Alert_Check_NewFriend()
  elseif alertType == AlertType.eALERT_BlackSpiritQuest then
    PaGlobalFunc_Widget_Alert_Check_BlackSpiritQuest()
  elseif alertType == AlertType.eALERT_WeightOver then
    PaGlobalFunc_Widget_Alert_Check_WeightOver()
  elseif alertType == AlertType.eALERT_EndurancePc then
    PaGlobalFunc_Widget_Alert_Check_EndurancePc()
  elseif alertType == AlertType.eALERT_EnduranceHorse then
    PaGlobalFunc_Widget_Alert_Check_EnduranceHorse()
  elseif alertType == AlertType.eALERT_EnduranceCarriage then
    PaGlobalFunc_Widget_Alert_Check_EnduranceCarriage()
  elseif alertType == AlertType.eALERT_EnduranceShip then
    PaGlobalFunc_Widget_Alert_Check_EnduranceShip()
  elseif alertType == AlertType.eALERT_BatterEquipment then
    PaGlobalFunc_Widget_Alert_Check_BatterEquipment()
  else
    _PA_LOG("mingu", "wrong alert type!")
  end
end
function Panel_Widget_Alert_info:handleLClick(alertType)
  if alertType == AlertType.eALERT_Hunt then
  elseif alertType == AlertType.eALERT_GuildBusterCall then
    ToClient_RequestTeleportGuildBustCall()
    self:setButtonShow(AlertType.eALERT_GuildBusterCall, false)
  elseif alertType == AlertType.eALERT_SiegeWarCall then
    ToClient_RequestTeleportToSiegeTentCall()
    self:setButtonShow(AlertType.eALERT_SiegeWarCall, false)
  elseif alertType == AlertType.eALERT_PartySummon then
    local remainTime_s64 = ToClient_GetLeftUsableTeleportCompassTime()
    local remainTime = Int64toInt32(remainTime_s64)
    if remainTime > 0 then
      if IsSelfPlayerWaitAction() then
        ToClient_RequestTeleportPosUseCompass()
        self:setButtonShow(AlertType.eALERT_PartySummon, false)
      else
        Proc_ShowMessage_Ack(Defines.StringSheet_GAME, "LUA_ALERTAREA_NOTUSEALERT")
      end
    end
  elseif alertType == AlertType.eALERT_ReturnTown then
    local remainTime_s64 = ToClient_GetLeftReturnStoneTime()
    local remainTime = Int64toInt32(remainTime_s64)
    local returnPos3D = ToClient_GetPosUseReturnStone()
    local regionInfo = getRegionInfoByPosition(returnPos3D)
    if remainTime > 0 then
      if IsSelfPlayerWaitAction() then
        ToClient_RequestTeleportPosUseReturnStone()
        self:setButtonShow(AlertType.eALERT_ReturnTown, false)
      else
        Proc_ShowMessage_Ack(Defines.StringSheet_GAME, "LUA_ALERTAREA_NOTUSEALERT")
      end
    end
  elseif alertType == AlertType.eALERT_Coupon then
    IngameCashShopCoupon_Open()
  elseif alertType == AlertType.eALERT_LearnSkill then
    HandleMLUp_SkillWindow_OpenForLearn()
  elseif alertType == AlertType.eALERT_NewStoryKnowledge then
    PaGlobalFunc_Widget_Alert_NewKnowledge(0)
  elseif alertType == AlertType.eALERT_NewKnowledge then
    PaGlobalFunc_Widget_Alert_NewKnowledge(1)
  elseif alertType == AlertType.eALERT_Mail then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Mail)
    self:setButtonShow(AlertType.eALERT_Mail, true, true)
  elseif alertType == AlertType.eALERT_ChallengeReward then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Present)
  elseif alertType == AlertType.eALERT_PcRoomReward then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Present)
  elseif alertType == AlertType.eALERT_NewFriend then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_FriendList)
  elseif alertType == AlertType.eALERT_BlackSpiritQuest then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_BlackSpirit)
  elseif alertType == AlertType.eALERT_WeightOver then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Inventory)
  elseif alertType == AlertType.eALERT_EndurancePc then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Inventory)
  elseif alertType == AlertType.eALERT_EnduranceHorse then
  elseif alertType == AlertType.eALERT_EnduranceCarriage then
  elseif alertType == AlertType.eALERT_EnduranceShip then
  elseif alertType == AlertType.eALERT_BatterEquipment then
    GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Inventory)
  else
    _PA_LOG("mingu", "wrong alert type!")
  end
  audioPostEvent_SystemUi(0, 5)
  TooltipSimple_Hide()
end
function Panel_Widget_Alert_info:handleRClick(alertType)
  if alertType == AlertType.eALERT_Hunt then
  elseif alertType == AlertType.eALERT_GuildBusterCall then
  elseif alertType == AlertType.eALERT_SiegeWarCall then
  elseif alertType == AlertType.eALERT_PartySummon then
  elseif alertType == AlertType.eALERT_ReturnTown then
  elseif alertType == AlertType.eALERT_Coupon then
  elseif alertType == AlertType.eALERT_LearnSkill then
  elseif alertType == AlertType.eALERT_NewStoryKnowledge then
  elseif alertType == AlertType.eALERT_NewKnowledge then
  elseif alertType == AlertType.eALERT_Mail then
  elseif alertType == AlertType.eALERT_ChallengeReward then
  elseif alertType == AlertType.eALERT_PcRoomReward then
  elseif alertType == AlertType.eALERT_NewFriend then
  elseif alertType == AlertType.eALERT_BlackSpiritQuest then
  elseif alertType == AlertType.eALERT_WeightOver then
  elseif alertType == AlertType.eALERT_EndurancePc then
  elseif alertType == AlertType.eALERT_EnduranceHorse then
  elseif alertType == AlertType.eALERT_EnduranceCarriage then
  elseif alertType == AlertType.eALERT_EnduranceShip then
  elseif alertType == AlertType.eALERT_BatterEquipment then
  else
    _PA_LOG("mingu", "wrong alert type!")
  end
end
function Panel_Widget_Alert_info:handleOver(alertType)
  local name = self._alertData[alertType].name
  local desc = self._alertData[alertType].desc
  local uiControl = self._alertButton[alertType]
  local showToolTip = false
  if alertType == AlertType.eALERT_Hunting then
    showToolTip = true
    PaGlobalFunc_Widget_Alert_Check_Hunting()
  elseif alertType == AlertType.eALERT_GuildBusterCall then
    showToolTip = true
    PaGlobalFunc_Widget_Alert_Check_GuildBusterCall()
  elseif alertType == AlertType.eALERT_SiegeWarCall then
    showToolTip = true
    PaGlobalFunc_Widget_Alert_Check_SiegeWarCall()
  elseif alertType == AlertType.eALERT_PartySummon then
    showToolTip = true
    PaGlobalFunc_Widget_Alert_Check_PartySummon()
  elseif alertType == AlertType.eALERT_ReturnTown then
    showToolTip = true
    PaGlobalFunc_Widget_Alert_Check_ReturnTown()
  elseif alertType == AlertType.eALERT_Coupon then
    showToolTip = true
  elseif alertType == AlertType.eALERT_LearnSkill then
    showToolTip = true
  elseif alertType == AlertType.eALERT_NewStoryKnowledge then
    showToolTip = true
  elseif alertType == AlertType.eALERT_NewKnowledge then
    showToolTip = true
  elseif alertType == AlertType.eALERT_Mail then
    showToolTip = true
  elseif alertType == AlertType.eALERT_ChallengeReward then
    showToolTip = true
  elseif alertType == AlertType.eALERT_PcRoomReward then
    showToolTip = true
  elseif alertType == AlertType.eALERT_NewFriend then
    showToolTip = true
  elseif alertType == AlertType.eALERT_BlackSpiritQuest then
    showToolTip = true
  elseif alertType == AlertType.eALERT_WeightOver then
    showToolTip = true
  elseif alertType == AlertType.eALERT_EndurancePc then
    showToolTip = true
  elseif alertType == AlertType.eALERT_EnduranceHorse then
    showToolTip = true
  elseif alertType == AlertType.eALERT_EnduranceCarriage then
    showToolTip = true
  elseif alertType == AlertType.eALERT_EnduranceShip then
    showToolTip = true
  elseif alertType == AlertType.eALERT_BatterEquipment then
    showToolTip = true
  else
    _PA_LOG("mingu", "wrong alert type!")
  end
  if true == showToolTip then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  end
end
function PaGlobalFunc_Widget_Alert_GetShow()
  return Panel_Widget_Alert_info:GetShow()
end
function PaGlobalFunc_Widget_Alert_Open()
  local self = Panel_Widget_Alert_info
  self:open()
end
function PaGlobalFunc_Widget_Alert_Close()
  local self = Panel_Widget_Alert_info
  self:close()
end
function PaGlobalFunc_Widget_Alert_Show()
  local self = Panel_Widget_Alert_info
  self:open()
  self:showAllButton()
end
function PaGlobalFunc_Widget_Alert_Exit()
  local self = Panel_Widget_Alert_info
  self:close()
end
function PaGlobalFunc_Widget_Alert_HandleOver(alertType)
  local self = Panel_Widget_Alert_info
  self:handleOver(alertType)
end
function PaGlobalFunc_Widget_Alert_HandleLClick(alertType)
  local self = Panel_Widget_Alert_info
  self:handleLClick(alertType)
end
function PaGlobalFunc_Widget_Alert_HandleRClick(alertType)
  local self = Panel_Widget_Alert_info
  self:handleRClick(alertType)
end
function PaGlobalFunc_Widget_Alert_HandleOut()
  TooltipSimple_Hide()
end
function PaGlobalFunc_Widget_Alert_ClickSpread()
  local self = Panel_Widget_Alert_info
  local timeRate = 1
  local rotateAni = self._ui.Button_Spread:addRotateAnimation(0, 0.3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  rotateAni:SetStartRotate(0)
  rotateAni:SetEndRotate(0)
  rotateAni:SetRotateCount(1)
  if false == self._value.isSpread then
    self:showAllButton()
  else
    self:hideAllButton()
  end
end
function PaGlobalFunc_Widget_Alert_Check_Hunting()
  local self = Panel_Widget_Alert_info
  local msg = {name = "", desc = ""}
  local whaleCount = ToClient_worldmapActorManagerGetActorRegionList(2)
  if whaleCount > 0 then
    for index = 0, whaleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      if nil ~= areaName then
        if 0 == index then
          msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        else
          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
  end
  local gargoyleCount = ToClient_worldmapActorManagerGetActorRegionList(3)
  if gargoyleCount > 0 then
    for index = 0, gargoyleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      if nil ~= areaName then
        if 0 == index then
          if whaleCount > 0 then
            msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          else
            msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          end
        else
          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
  end
  local griffonCount = 0
  griffonCount = ToClient_worldmapActorManagerGetActorRegionList(4)
  if griffonCount > 0 then
    for index = 0, griffonCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      if nil ~= areaName then
        if 0 == index then
          if "" == msg.desc then
            msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GRIFFON_DESC", "areaName", tostring(areaName), "count", count)
          else
            msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_WILDGRIFFON_DESC", "areaName", tostring(areaName), "count", count)
          end
        else
          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_WILDGRIFFON_DESC", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
  end
  if 0 == gargoyleCount + whaleCount + griffonCount then
    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE")
    msg.desc = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_NOT_FIND")
  end
  local totalCount = gargoyleCount + whaleCount + griffonCount
  local isHuntingButtonShow = totalCount > 0
  self._alertData[AlertType.eALERT_Hunting].name = msg.name
  self._alertData[AlertType.eALERT_Hunting].desc = msg.desc
  self._alertData[AlertType.eALERT_Hunting].count = totalCount
  if false == ToClient_IsContentsGroupOpen("28") then
    isHuntingButtonShow = false
  end
  self:setButtonShow(AlertType.eALERT_Hunting, isHuntingButtonShow, true)
  self._ui.StaticText_HuntingCount:SetText(totalCount)
end
function PaGlobalFunc_Widget_Alert_Check_GuildBusterCall()
  local self = Panel_Widget_Alert_info
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetGuildBustCallPos())
  if nil == regionInfoWrapper then
    self:setButtonShow(AlertType.eALERT_GuildBusterCall, false)
    return
  end
  local leftTime = Int64toInt32(getLeftSecond_TTime64(ToClient_GetGuildBustCallTime()))
  if leftTime > 0 then
    self:setButtonShow(AlertType.eALERT_GuildBusterCall, true, true)
  else
    self:setButtonShow(AlertType.eALERT_GuildBusterCall, false)
    return
  end
  local areaName = regionInfoWrapper:getAreaName()
  local usableTime64 = ToClient_GetGuildBustCallTime()
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_NAME")
  local desc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
  self._alertData[AlertType.eALERT_GuildBusterCall].name = name
  self._alertData[AlertType.eALERT_GuildBusterCall].desc = desc
end
function PaGlobalFunc_Widget_Alert_Check_SiegeWarCall()
  local self = Panel_Widget_Alert_info
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetTeleportToSiegeTentPos())
  if nil == regionInfoWrapper then
    self:setButtonShow(AlertType.eALERT_SiegeWarCall, false)
    return
  end
  local areaName = regionInfoWrapper:getAreaName()
  local usableTime64 = ToClient_GetTeleportToSiegeTentTime()
  local leftTime = Int64toInt32(usableTime64)
  if leftTime > 0 then
    self:setButtonShow(AlertType.eALERT_SiegeWarCall, true, true)
  else
    self:setButtonShow(AlertType.eALERT_SiegeWarCall, false)
    return
  end
  local selfProxy = getSelfPlayer()
  if nil ~= selfProxy then
    if selfProxy:get():isVolunteer() then
      descStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC2", "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
    else
      descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
    end
  end
  local name, desc = PAGetString(Defines.StringSheet_GAME, "LUA_WARCALL_TOOLTIP_NAME"), descStr
  self._alertData[AlertType.eALERT_SiegeWarCall].name = name
  self._alertData[AlertType.eALERT_SiegeWarCall].desc = desc
end
function PaGlobalFunc_Widget_Alert_Check_PartySummon()
  local self = Panel_Widget_Alert_info
  local partyName = ToClient_GetCharacterNameUseCompass()
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = getSelfPlayer():getActorKey()
  local descStr = ""
  local usableTime64 = ToClient_GetLeftUsableTeleportCompassTime()
  local remainTime = Int64toInt32(usableTime64)
  if remainTime > 0 then
    self:setButtonShow(AlertType.eALERT_PartySummon, true)
  else
    self:setButtonShow(AlertType.eALERT_PartySummon, false)
    return
  end
  if partyActorKey == playerActorKey then
    descStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_1", "remainTime", convertStringFromDatetime(usableTime64))
  else
    descStr = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_2", "partyName", partyName, "partyName1", partyName, "remainTime", convertStringFromDatetime(usableTime64))
  end
  local name, desc = PAGetString(Defines.StringSheet_GAME, "LUA_COMPASS_NAME"), descStr
  self._alertData[AlertType.eALERT_PartySummon].name = name
  self._alertData[AlertType.eALERT_PartySummon].desc = desc
end
function PaGlobalFunc_Widget_Alert_Check_ReturnTown()
  local self = Panel_Widget_Alert_info
  local returnPos3D = ToClient_GetPosUseReturnStone()
  local regionInfo = getRegionInfoByPosition(returnPos3D)
  local regionName = ""
  if nil ~= regionInfo then
    regionName = regionInfo:getAreaName()
  end
  local returnTownRegionKey = ToClient_GetReturnStoneTownRegionKey()
  local usableTime64 = ToClient_GetLeftReturnStoneTime()
  local remainTime = Int64toInt32(usableTime64)
  if remainTime > 0 then
    self:setButtonShow(AlertType.eALERT_ReturnTown, true)
  else
    self:setButtonShow(AlertType.eALERT_ReturnTown, false)
    return
  end
  local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_RETURNSTONE_DESC", "regionName", regionName, "remainTime", convertStringFromDatetime(usableTime64))
  local name, desc = PAGetString(Defines.StringSheet_GAME, "LUA_RETURNSTONE_NAME"), descStr
  self._alertData[AlertType.eALERT_ReturnTown].name = name
  self._alertData[AlertType.eALERT_ReturnTown].desc = desc
end
function PaGlobalFunc_Widget_Alert_Check_Coupon()
  local self = Panel_Widget_Alert_info
  local count = ToClient_GetCouponInfoUsableCount()
  if count <= 0 then
    self:setButtonShow(AlertType.eALERT_Coupon, false)
    return
  else
    self:setButtonShow(AlertType.eALERT_Coupon, true)
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_COUPONTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_COUPONDESC")
  self._alertData[AlertType.eALERT_Coupon].name = name
  self._alertData[AlertType.eALERT_Coupon].desc = desc
  self._ui.StaticText_CouponCount:SetText(count)
end
function PaGlobalFunc_Widget_Alert_Check_LearnSkill()
  local self = Panel_Widget_Alert_info
  local skillCount = FGlobal_EnableSkillReturn()
  if skillCount <= 0 then
    self:setButtonShow(AlertType.eALERT_LearnSkill, false)
    return
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_SKILLTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_SKILLDESC")
  self._alertData[AlertType.eALERT_LearnSkill].name = name
  self._alertData[AlertType.eALERT_LearnSkill].desc = desc
  self._ui.StaticText_LearnSkillCount:SetText(skillCount)
  self:setButtonShow(AlertType.eALERT_LearnSkill, true)
end
function PaGlobalFunc_Widget_Alert_Check_NewStoryKnowledge()
  local self = Panel_Widget_Alert_info
  local count = #cardListImportant
  if count == 0 then
    self:setButtonShow(AlertType.eALERT_NewStoryKnowledge, false)
    return
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_IMPORTANTKNOWLEDGETITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_IMPORTANTKNOWLEDGEDESC")
  self._alertData[AlertType.eALERT_NewStoryKnowledge].name = name
  self._alertData[AlertType.eALERT_NewStoryKnowledge].desc = desc
  self._alertData[AlertType.eALERT_NewStoryKnowledge].count = count
  self._ui.StaticText_NewStoryKnowledgeCount:SetText(count)
  self:setButtonShow(AlertType.eALERT_NewStoryKnowledge, true)
end
function PaGlobalFunc_Widget_Alert_Check_NewKnowledge()
  local self = Panel_Widget_Alert_info
  local count = #cardListNormal
  if count == 0 then
    self:setButtonShow(AlertType.eALERT_NewKnowledge, false)
    return
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_NORMALKNOWLEDGETITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_IMPORTANTKNOWLEDGEDESC")
  self._alertData[AlertType.eALERT_NewKnowledge].name = name
  self._alertData[AlertType.eALERT_NewKnowledge].desc = desc
  self._alertData[AlertType.eALERT_NewKnowledge].count = count
  self._ui.StaticText_NewKnowledgeCount:SetText(count)
  self:setButtonShow(AlertType.eALERT_NewKnowledge, true)
end
function PaGlobalFunc_Widget_Alert_Check_Mail()
  local self = Panel_Widget_Alert_info
  local mailCount = RequestMail_mailCount()
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_MAILTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_MAILDESC")
  if mailCount > 0 then
    self:setButtonShow(AlertType.eALERT_Mail, true)
  else
    self._alertButton[AlertType.eALERT_Mail]:EraseAllEffect()
    self:setButtonShow(AlertType.eALERT_Mail, true)
  end
  self._alertData[AlertType.eALERT_Mail].name = name
  self._alertData[AlertType.eALERT_Mail].desc = desc
end
function PaGlobalFunc_Widget_Alert_Check_ChallengeReward()
  local self = Panel_Widget_Alert_info
  local challengeRWCount = ToClient_GetChallengeRewardInfoCount()
  if challengeRWCount <= 0 then
    self:setButtonShow(AlertType.eALERT_ChallengeReward, false)
    return
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_CHALLENGETITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_CHALLENGEDESC")
  self._alertData[AlertType.eALERT_ChallengeReward].name = name
  self._alertData[AlertType.eALERT_ChallengeReward].desc = desc
  self._alertData[AlertType.eALERT_ChallengeReward].count = challengeRWCount
  self._ui.StaticText_ChallengeRewardCount:SetText(challengeRWCount)
  self:setButtonShow(AlertType.eALERT_ChallengeReward, true)
end
local nextPcRoomGiftRewardTime = toInt64(0, 0)
function PaGlobalFunc_Widget_Alert_Check_PcRoomReward()
  local self = Panel_Widget_Alert_info
  local needUpdate = false
  local pcRoomRewardCount = 0
  local rewardCount = ToClient_GetChallengeRewardInfoCount()
  for index = 0, rewardCount - 1 do
    local rewardWrapper = ToClient_GetChallengeRewardInfoWrapper(index)
    if nil ~= rewardWrapper then
      local rewardType = rewardWrapper:getType()
      if rewardType == CppEnums.ChallengeType.eChallengeType_Benefit or rewardType == CppEnums.ChallengeType.eChallengeType_PcRoom or rewardType == CppEnums.ChallengeType.eChallengeType_EnchantPcRoomCount then
        pcRoomRewardCount = pcRoomRewardCount + 1
      end
    end
  end
  if pcRoomRewardCount == 0 then
    self._alertShow[AlertType.eALERT_PcRoomReward] = false
    return needUpdate
  else
    needUpdate = true
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_SPECIAL_REWARD_ALARMICON_TOOLTIP_NAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SPECIAL_REWARD_ALARMICON_TOOLTIP_DESC")
  self._alertData[AlertType.eALERT_PcRoomReward].name = name
  self._alertData[AlertType.eALERT_PcRoomReward].desc = desc
  self._alertData[AlertType.eALERT_PcRoomReward].count = pcRoomRewardCount
  self._alertShow[AlertType.eALERT_PcRoomReward] = true
  return needUpdate
end
function PaGlobalFunc_Widget_Alert_Check_NewFriend()
  local self = Panel_Widget_Alert_info
  local addFrientCount = RequestFriends_getAddFriendCount()
  if addFrientCount > 0 then
    self:setButtonShow(AlertType.eALERT_NewFriend, true)
  else
    self:setButtonShow(AlertType.eALERT_NewFriend, false)
    return
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_MENUBUTTONTEXTID_FRIENDLIST")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_FRIEND_ALERT")
  self._alertData[AlertType.eALERT_NewFriend].name = name
  self._alertData[AlertType.eALERT_NewFriend].desc = desc
  self._alertData[AlertType.eALERT_NewFriend].count = addFrientCount
end
function PaGlobalFunc_Widget_Alert_Check_BlackSpiritQuest()
  local self = Panel_Widget_Alert_info
  local newQuest = questList_doHaveNewQuest()
  local blackSpiritQuest = true
  if true == newQuest then
    self:setButtonShow(AlertType.eALERT_BlackSpiritQuest, true)
  else
    self:setButtonShow(AlertType.eALERT_BlackSpiritQuest, false)
  end
  local isColorBlindMode = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.ColorBlindMode)
  local name = PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_BLACKSOUL")
  local desc = PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_CALLINGYOUT")
  self._alertData[AlertType.eALERT_BlackSpiritQuest].name = name
  self._alertData[AlertType.eALERT_BlackSpiritQuest].desc = desc
end
local lastTotalWeight = 0
function PaGlobalFunc_Widget_Alert_Check_WeightOver()
  local self = Panel_Widget_Alert_info
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return false
  end
  local selfPlayer = selfPlayerWrapper:get()
  local s64_moneyWeight = selfPlayer:getInventory():getMoneyWeight_s64()
  local s64_equipmentWeight = selfPlayer:getEquipment():getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local moneyWeight = Int64toInt32(s64_moneyWeight) / 10000
  local equipmentWeight = Int64toInt32(s64_equipmentWeight) / 10000
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local invenWeight = allWeight - equipmentWeight - moneyWeight
  local sumtotalWeight = allWeight / maxWeight * 100
  local totalWeightInt = sumtotalWeight / 1
  if lastTotalWeight == totalWeightInt then
    return false
  else
    lastTotalWeight = totalWeightInt
  end
  local totalWeight = string.format("%.0f", sumtotalWeight)
  local decreaseFairyWeight = Int64toInt32(ToClient_getDecreaseWeightByFairy()) / 10000
  local weightText = 100 + decreaseFairyWeight
  if sumtotalWeight - decreaseFairyWeight >= 90 then
    self:setButtonShow(AlertType.eALERT_WeightOver, true)
  else
    self:setButtonShow(AlertType.eALERT_WeightOver, false)
  end
  if sumtotalWeight >= 100 then
    self._alertButton[AlertType.eALERT_WeightOver]:EraseAllEffect()
    self._alertButton[AlertType.eALERT_WeightOver]:AddEffect("fUI_Weight_01A", true, -0.5, -1.3)
    if nil ~= self._alertClosedButton[AlertType.eALERT_WeightOver] then
      self._alertClosedButton[AlertType.eALERT_WeightOver]:EraseAllEffect()
      self._alertClosedButton[AlertType.eALERT_WeightOver]:AddEffect("fUI_Weight_01A", true, -0.5, -1.3)
    end
  elseif sumtotalWeight < 100 then
    self._alertButton[AlertType.eALERT_WeightOver]:EraseAllEffect()
    if nil ~= self._alertClosedButton[AlertType.eALERT_WeightOver] then
      self._alertClosedButton[AlertType.eALERT_WeightOver]:EraseAllEffect()
    end
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_WIGHTOVERTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_TOOLTIP_WIGHTOVERDESC")
  if decreaseFairyWeight > 0 then
    desc = desc .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WEIGHT_MAIN_DEFAULT_VISUAL_WITH_FAIRY", "weight", tostring(weightText))
  end
  self._alertData[AlertType.eALERT_WeightOver].name = name
  self._alertData[AlertType.eALERT_WeightOver].desc = desc
  self._alertButton[AlertType.eALERT_WeightOver]:SetText(totalWeight .. "%")
  if nil ~= self._alertClosedButton[AlertType.eALERT_WeightOver] then
    self._alertClosedButton[AlertType.eALERT_WeightOver]:SetText(totalWeight .. "%")
  end
end
function PaGlobalFunc_Widget_Alert_Check_EndurancePc()
  local self = Panel_Widget_Alert_info
  local equipCount = 0
  local name = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_ITEM_TXT_ENDURANCE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENDURANCE_NOTICEENDURACNE3")
  equipCount = 13
  local minimumEnduranceLevel = 10
  for index = 0, equipCount - 1 do
    local enduranceLevel = -1
    enduranceLevel = ToClient_GetPlayerEquipmentEnduranceLevel(index)
    if enduranceLevel < 0 then
    end
    if enduranceLevel >= 0 then
      minimumEnduranceLevel = math.min(minimumEnduranceLevel, enduranceLevel)
    end
  end
  self._alertData[AlertType.eALERT_EndurancePc].name = name
  self._alertData[AlertType.eALERT_EndurancePc].desc = desc
  if minimumEnduranceLevel == 0 then
    self:setButtonShow(AlertType.eALERT_EndurancePc, true)
  elseif minimumEnduranceLevel == 1 then
    self:setButtonShow(AlertType.eALERT_EndurancePc, true)
  else
    self:setButtonShow(AlertType.eALERT_EndurancePc, false)
  end
end
function PaGlobalFunc_Widget_Alert_Check_EnduranceHorse()
  local self = Panel_Widget_Alert_info
  local equipCount = 0
  local name = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_ITEM_TXT_ENDURANCE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENDURANCE_NOTICEENDURACNE3")
  equipCount = 5
  local minimumEnduranceLevel = 10
  for index = 0, equipCount - 1 do
    local enduranceLevel = -1
    enduranceLevel = ToClient_GetHorseEquipmentEnduranceLevel(index)
    if enduranceLevel < 0 then
    end
    if enduranceLevel >= 0 then
      minimumEnduranceLevel = math.min(minimumEnduranceLevel, enduranceLevel)
    end
  end
  self._alertData[AlertType.eALERT_EnduranceHorse].name = name
  self._alertData[AlertType.eALERT_EnduranceHorse].desc = desc
  if minimumEnduranceLevel == 0 then
    self:setButtonShow(AlertType.eALERT_EnduranceHorse, true)
  elseif minimumEnduranceLevel == 1 then
    self:setButtonShow(AlertType.eALERT_EnduranceHorse, true)
  else
    self:setButtonShow(AlertType.eALERT_EnduranceHorse, false)
  end
end
function PaGlobalFunc_Widget_Alert_Check_EnduranceCarriage()
  local self = Panel_Widget_Alert_info
  local equipCount = 0
  local name = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_ITEM_TXT_ENDURANCE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENDURANCE_NOTICEENDURACNE3")
  equipCount = 5
  local minimumEnduranceLevel = 10
  for index = 0, equipCount - 1 do
    local enduranceLevel = -1
    enduranceLevel = ToClient_GetCarriageEquipmentEnduranceLevel(index)
    if enduranceLevel < 0 then
    end
    if enduranceLevel >= 0 then
      minimumEnduranceLevel = math.min(minimumEnduranceLevel, enduranceLevel)
    end
  end
  self._alertData[AlertType.eALERT_EnduranceCarriage].name = name
  self._alertData[AlertType.eALERT_EnduranceCarriage].desc = desc
  if minimumEnduranceLevel == 0 then
    self:setButtonShow(AlertType.eALERT_EnduranceCarriage, true)
  elseif minimumEnduranceLevel == 1 then
    self:setButtonShow(AlertType.eALERT_EnduranceCarriage, true)
  else
    self:setButtonShow(AlertType.eALERT_EnduranceCarriage, false)
  end
end
function PaGlobalFunc_Widget_Alert_Check_EnduranceShip()
  local self = Panel_Widget_Alert_info
  local equipCount = 0
  local name = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_ITEM_TXT_ENDURANCE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_ENDURANCE_NOTICEENDURACNE3")
  equipCount = 4
  local minimumEnduranceLevel = 10
  for index = 0, equipCount - 1 do
    local enduranceLevel = -1
    enduranceLevel = ToClient_GetShipEquipmentEnduranceLevel(index)
    if enduranceLevel < 0 then
    end
    if enduranceLevel >= 0 then
      minimumEnduranceLevel = math.min(minimumEnduranceLevel, enduranceLevel)
    end
  end
  self._alertData[AlertType.eALERT_EnduranceShip].name = name
  self._alertData[AlertType.eALERT_EnduranceShip].desc = desc
  if minimumEnduranceLevel == 0 then
    self:setButtonShow(AlertType.eALERT_EnduranceShip, true)
  elseif minimumEnduranceLevel == 1 then
    self:setButtonShow(AlertType.eALERT_EnduranceShip, true)
  else
    self:setButtonShow(AlertType.eALERT_EnduranceShip, false)
  end
end
function PaGlobalFunc_Widget_Alert_Check_BatterEquipment()
  local self = Panel_Widget_Alert_info
  if true == haveBatterEquip then
    self:setButtonShow(AlertType.eALERT_BatterEquipment, true)
  else
    self:setButtonShow(AlertType.eALERT_BatterEquipment, false)
  end
  local name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NEWEQUIP_TITLE")
  local desc = ""
  self._alertData[AlertType.eALERT_BatterEquipment].name = name
  self._alertData[AlertType.eALERT_BatterEquipment].desc = desc
end
function PaGlobalFunc_Widget_Alert_CheckReal_BatterEquipment()
  local self = Panel_Widget_Alert_info
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return
  end
  local existBatterEquip = false
  local selfPlayer = selfPlayerWrapper:get()
  local inventory = selfPlayer:getInventoryByType(CppEnums.ItemWhereType.eInventory)
  local invenUseSize = selfPlayer:getInventorySlotCount(not isNormalInventory)
  local invenMaxSize = inventory:sizeXXX()
  local whereType = CppEnums.ItemWhereType.eInventory
  for index = 0, invenUseSize - 1 do
    local slotNo = index + 1
    local itemWrapper = getInventoryItemByType(whereType, slotNo)
    if nil ~= itemWrapper then
      local itemSSW = itemWrapper:getStaticStatus()
      if nil ~= itemSSW then
        local isServantEquip = itemSSW:isUsableServant()
        local isEquip = itemSSW:isEquipable()
        if not isServantEquip and true == isEquip then
          local currentEndurance = itemWrapper:get():getEndurance()
          local offencePoint = 0
          local defencePoint = 0
          local equipOffencePoint = 0
          local equipDefencePoint = 0
          local matchEquip = false
          local isAccessory = false
          offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, isAccessory = _inventory_updateSlot_compareSpec(whereType, slotNo, isAccessory)
          if nil ~= defencePoint and nil ~= offencePoint and currentEndurance > 0 and true == matchEquip and defencePoint + offencePoint > equipDefencePoint + equipOffencePoint then
            existBatterEquip = true
            break
          end
        end
      end
    end
  end
  if true == existBatterEquip then
    haveBatterEquip = true
    self._alertButton[AlertType.eALERT_BatterEquipment]:EraseAllEffect()
    self._alertButton[AlertType.eALERT_BatterEquipment]:AddEffect("fUI_ItemBatter01", true, 0, 0)
    self:setButtonShow(AlertType.eALERT_BatterEquipment, true)
  else
    haveBatterEquip = false
    self:setButtonShow(AlertType.eALERT_BatterEquipment, false)
  end
end
local updateTime = 30
local currentTime = 0
function FromClient_Widget_Alert_UpdatePerFrame(deltaTime)
  local self = Panel_Widget_Alert_info
  currentTime = currentTime + deltaTime
  if updateTime < currentTime then
    if true == self._value.isSpread then
      self:updateIcons()
    end
    currentTime = 0
  end
end
function FromClient_Widget_Alert_Init()
  local self = Panel_Widget_Alert_info
  self:initialize()
  PaGlobalFunc_Widget_Alert_Show()
end
function FromClient_Widget_Alert_Resize()
  local self = Panel_Widget_Alert_info
  self:resize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_Widget_Alert_Init")
function FromClient_Widget_Alert_ResponseBustCall(sendType)
  local self = Panel_Widget_Alert_info
  if 0 == sendType then
    self:setButtonShow(AlertType.eALERT_GuildBusterCall, true)
    luaTimer_AddEvent(PaGlobalFunc_Widget_Alert_Close_GuildBusterCall, 600000, false, 0)
  else
    self:setButtonShow(AlertType.eALERT_GuildBusterCall, false)
  end
  self:updateIcons()
end
function PaGlobalFunc_Widget_Alert_Close_GuildBusterCall()
  local self = Panel_Widget_Alert_info
  self:setButtonShow(AlertType.eALERT_GuildBusterCall, false)
  self:updateIcons()
end
function FromClient_Widget_Alert_ResponseTeleportToSiegeTent(sendType, isVolunteer)
  local self = Panel_Widget_Alert_info
  if 0 == sendType then
    self:setButtonShow(AlertType.eALERT_SiegeWarCall, true)
    luaTimer_AddEvent(PaGlobalFunc_Widget_Alert_Close_SiegeWarCall, 600000, false, 0)
  else
    self:setButtonShow(AlertType.eALERT_SiegeWarCall, false)
    PaGlobalFunc_Widget_Alert_Close_SiegeWarCall()
  end
  self:updateIcons()
end
function PaGlobalFunc_Widget_Alert_Close_SiegeWarCall()
  local self = Panel_Widget_Alert_info
  self:setButtonShow(AlertType.eALERT_SiegeWarCall, false)
  self:updateIcons()
end
function FromClient_Widget_Alert_ResponseUseCompass()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_Check_PartySummon()
  self:updateIcons(false, AlertType.eALERT_PartySummon)
  local partyName = ""
  partyName = ToClient_GetCharacterNameUseCompass()
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = getSelfPlayer():getActorKey()
  local msg = ""
  if partyActorKey == playerActorKey then
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_COMPASS_MESSAGE_1")
  else
    msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPASS_MESSAGE_2", "partyName", partyName)
  end
  Proc_ShowMessage_Ack(msg)
end
function FromClient_Widget_Alert_ResponseUseReturnStone()
  local self = Panel_Widget_Alert_info
  local pos3D = ToClient_GetPosUseReturnStone()
  ToClient_DeleteNaviGuideByGroup(0)
  worldmapNavigatorStart(pos3D, NavigationGuideParam(), false, false)
  PaGlobalFunc_Widget_Alert_Check_ReturnTown()
  self:updateIcons(false, AlertType.eALERT_ReturnTown)
end
function FromClient_Widget_Alert_EventSkillWindowUpdate()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_Check_LearnSkill()
  self:updateIcons(AlertType.eALERT_LearnSkill, true)
end
function FromClient_Widget_Alert_UpdateCoupon()
  local self = Panel_Widget_Alert_info
  local count = ToClient_GetCouponInfoUsableCount()
  self._alertButton[AlertType.eALERT_Coupon]:EraseAllEffect()
  if count > 0 then
    self._alertButton[AlertType.eALERT_Coupon]:AddEffect("fUI_Coupon_01A", true, 2, 2)
    self:setButtonShow(AlertType.eALERT_Coupon, true, true)
  else
    self:setButtonShow(AlertType.eALERT_Coupon, false)
  end
  self:updateIcons()
end
local cardKeyRaw
function FromClient_Widget_Alert_NewKnowledge(mentalCardStaticStatusWrapper)
  local self = Panel_Widget_Alert_info
  if nil == mentalCardStaticStatusWrapper then
    return
  end
  local mentalCardType = mentalCardStaticStatusWrapper:getMentalCardType()
  local cardData = {
    cardKeyRaw = mentalCardStaticStatusWrapper:getKey(),
    name = mentalCardStaticStatusWrapper:getName(),
    desc = mentalCardStaticStatusWrapper:getDesc(),
    imagePath = mentalCardStaticStatusWrapper:getImagePath()
  }
  cardKeyRaw = mentalCardStaticStatusWrapper:getKey()
  if 0 == mentalCardType then
    table.insert(cardListNormal, cardData)
  end
  if 1 == mentalCardType then
    table.insert(cardListImportant, cardData)
  end
  if #cardListNormal > 0 then
    self:setButtonShow(AlertType.eALERT_NewKnowledge, true, true)
    self:updateIcons()
  end
  if #cardListImportant > 0 then
    self:setButtonShow(AlertType.eALERT_NewStoryKnowledge, true, true)
    self:updateIcons()
  end
end
function PaGlobalFunc_Widget_Alert_NewKnowledge_CardKeyReturn()
  return cardKeyRaw
end
function PaGlobalFunc_Widget_Alert_NewKnowledge(usingType)
  if nil == usingType or 0 ~= usingType and 1 ~= usingType then
    return
  end
  local self = Panel_Widget_Alert_info
  local control
  if 0 == usingType then
    control = Panel_UIMain
  elseif 1 == usingType then
    control = Panel_UIMain
  else
    return
  end
  local PosX = control:GetPosX()
  local PosY = control:GetPosY() - Panel_NewKnowledge:GetSizeY()
  if getScreenSizeX() < PosX + Panel_NewKnowledge:GetSizeX() then
    PosX = getScreenSizeX() - Panel_NewKnowledge:GetSizeX()
  end
  Panel_NewKnowledge:SetHorizonRight()
  Panel_NewKnowledge:SetVerticalBottom()
  Panel_NewKnowledge:SetPosY(Panel_NewKnowledge:GetPosY() - Panel_UIMain:GetSizeY())
  local dataTable
  if 0 == usingType then
    dataTable = cardListImportant
  elseif 1 == usingType then
    dataTable = cardListNormal
  else
    return
  end
  local buttonCloseAll = UI.getChildControl(Panel_NewKnowledge, "Button_AllClose")
  local buttonClose = UI.getChildControl(Panel_NewKnowledge, "Button_Close")
  local buttonWinClose = UI.getChildControl(Panel_NewKnowledge, "Button_WinClose")
  local staticTitle = UI.getChildControl(Panel_NewKnowledge, "StaticText_Knowledge_Title")
  local staticImage = UI.getChildControl(Panel_NewKnowledge, "Static_Knowledge_Img")
  local buttonNext = UI.getChildControl(Panel_NewKnowledge, "Button_Next")
  local frameKnowledge = UI.getChildControl(Panel_NewKnowledge, "Frame_Knowledge_Desc")
  local frameContent = UI.getChildControl(frameKnowledge, "Frame_1_Content")
  local staticDesc = UI.getChildControl(frameContent, "StaticText_Knowledge_Desc")
  staticDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  staticTitle:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  local frameScrollV = UI.getChildControl(frameKnowledge, "Frame_1_VerticalScroll")
  local frameScrollVBTN = UI.getChildControl(frameScrollV, "Frame_1_VerticalScroll_CtrlButton")
  buttonCloseAll:addInputEvent("Mouse_LUp", "PaGlobalFunc_Widget_Alert_NewKnowledgePopup_CloseAll( " .. usingType .. ")")
  buttonClose:addInputEvent("Mouse_LUp", "PaGlobalFunc_Widget_Alert_NewKnowledgePopup_Close()")
  buttonWinClose:addInputEvent("Mouse_LUp", "PaGlobalFunc_Widget_Alert_NewKnowledgePopup_Close()")
  buttonNext:addInputEvent("Mouse_LUp", "PaGlobalFunc_Widget_Alert_NewKnowledge(" .. usingType .. ")")
  local newCount = #dataTable
  if newCount > 0 then
    local cardData = dataTable[newCount]
    staticTitle:SetText(cardData.name)
    staticDesc:SetText(cardData.desc)
    staticDesc:SetSize(staticDesc:GetSizeX(), staticDesc:GetTextSizeY())
    staticImage:ChangeTextureInfoName(cardData.imagePath)
    frameKnowledge:UpdateContentScroll()
    frameScrollV:SetControlTop()
    frameScrollV:SetInterval(2)
    frameKnowledge:UpdateContentPos()
    frameScrollV:SetShow(true)
    if frameKnowledge:GetSizeY() < staticDesc:GetSizeY() then
      frameScrollVBTN:SetShow(true)
    else
      frameScrollVBTN:SetShow(false)
    end
    table.remove(dataTable)
    if newCount > 2 then
      buttonNext:SetShow(true)
    elseif newCount == 1 then
      buttonNext:SetShow(false)
    end
    PaGlobalFunc_Widget_Alert_NewKnowledgePopup_Open()
  else
    PaGlobalFunc_Widget_Alert_NewKnowledgePopup_Close()
  end
  if 0 == #dataTable then
    if 0 == usingType then
      self:setButtonShow(AlertType.eALERT_NewStoryKnowledge, false)
    elseif 1 == usingType then
      self:setButtonShow(AlertType.eALERT_NewKnowledge, false)
    end
  elseif 0 == usingType then
    self:setButtonShow(AlertType.eALERT_NewStoryKnowledge, true, true)
  elseif 1 == usingType then
    self:setButtonShow(AlertType.eALERT_NewKnowledge, true, true)
  end
  self:updateIcons()
end
function PaGlobalFunc_Widget_Alert_NewKnowledgePopup_Open()
  Panel_NewKnowledge:SetShow(true)
end
function PaGlobalFunc_Widget_Alert_NewKnowledgePopup_Close()
  Panel_NewKnowledge:SetShow(false)
end
function PaGlobalFunc_Widget_Alert_NewKnowledgePopup_CloseAll(usingType)
  local self = Panel_Widget_Alert_info
  local dataTable
  if 0 == usingType then
    dataTable = cardListImportant
    self:setButtonShow(AlertType.eALERT_NewStoryKnowledge, false)
  elseif 1 == usingType then
    dataTable = cardListNormal
    self:setButtonShow(AlertType.eALERT_NewKnowledge, false)
  end
  for index = #dataTable, 1, -1 do
    table.remove(dataTable, index)
  end
  PaGlobalFunc_Widget_Alert_NewKnowledgePopup_Close()
  self:updateIcons()
end
function FromClient_Widget_Alert_NewMail()
  local self = Panel_Widget_Alert_info
  local newMailEffectIcon = self._alertButton[AlertType.eALERT_Mail]
  local isColorBlindMode = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.ColorBlindMode)
  if 0 == isColorBlindMode then
    newMailEffectIcon:EraseAllEffect()
    newMailEffectIcon:AddEffect("fUI_Letter_01A", true, 0, 2.1)
  elseif 1 == isColorBlindMode then
    newMailEffectIcon:EraseAllEffect()
    newMailEffectIcon:AddEffect("fUI_Letter_01B", true, 0, 2.1)
  elseif 2 == isColorBlindMode then
    newMailEffectIcon:EraseAllEffect()
    newMailEffectIcon:AddEffect("fUI_Letter_01B", true, 0, 2.1)
  end
  self:setButtonShow(AlertType.eALERT_Mail, true)
  self:updateIcons()
end
function FromClient_Widget_Alert_NewMailRead(isCheck)
  local self = Panel_Widget_Alert_info
  local newMailEffectIcon = self._alertButton[AlertType.eALERT_Mail]
  newMailEffectIcon:EraseAllEffect()
end
function FromClient_Widget_Alert_CompleteBenefitReward()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_Check_ChallengeReward()
  PaGlobalFunc_Widget_Alert_Check_PcRoomReward()
  self:updateIcons(false, AlertType.eALERT_ChallengeReward)
end
function FromClient_Widget_Alert_NewFriendAlert(param)
  local self = Panel_Widget_Alert_info
  local isColorBlindMode = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.ColorBlindMode)
  self._alertButton[AlertType.eALERT_NewFriend]:EraseAllEffect()
  if 1 == param then
    if 0 == isColorBlindMode then
      self._alertButton[AlertType.eALERT_NewFriend]:AddEffect("fUI_Friend_01A", true, 0, 0)
    elseif 1 == isColorBlindMode then
      self._alertButton[AlertType.eALERT_NewFriend]:AddEffect("fUI_Friend_01B", true, 0, 0)
    elseif 2 == isColorBlindMode then
      self._alertButton[AlertType.eALERT_NewFriend]:AddEffect("fUI_Friend_01B", true, 0, 0)
    end
    local sendMsg = {
      main = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_FRIEND_ALERT"),
      sub = "",
      addMsg = ""
    }
    Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 3, 3)
  else
    local sendMsg = {
      main = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_FRIEND_COMPLETE"),
      sub = "",
      addMsg = ""
    }
    Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 3, 3)
  end
  self:setButtonShow(AlertType.eALERT_NewFriend, true)
  self:updateIcons(false, AlertType.eALERT_NewFriend)
end
function FromClient_Widget_Alert_Update_NewFriend()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_Check_NewFriend()
  self:updateIcons(false, AlertType.eALERT_NewFriend)
end
function FromClient_Widget_Alert_BlackSpiritQuest()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_Check_BlackSpiritQuest()
  self:updateIcons(false, AlertType.eALERT_BlackSpiritQuest)
end
function FromClient_Widget_Alert_WeightOver()
  local self = Panel_Widget_Alert_info
  if false == PaGlobalFunc_Widget_Alert_Check_WeightOver() then
    return
  end
  self:updateIcons(false, AlertType.eALERT_WeightOver)
end
function FromClient_Widget_Alert_EquipEnduranceChanged()
  FromClient_Widget_Alert_PlayerEnduranceUpdate()
  FromClient_Widget_Alert_ServantEnduranceUpdate()
end
function FromClient_Widget_Alert_PlayerEnduranceUpdate()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_Check_EndurancePc()
  self:updateIcons(false, AlertType.eALERT_EndurancePc)
end
function FromClient_Widget_Alert_ServantEnduranceUpdate()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_Check_EnduranceHorse()
  PaGlobalFunc_Widget_Alert_Check_EnduranceCarriage()
  PaGlobalFunc_Widget_Alert_Check_EnduranceShip()
  self:updateIcons()
end
function FromClient_Widget_Alert_ServantSeal()
  local temporaryWrapper = getTemporaryInformationWrapper()
  if nil == temporaryWrapper then
    return
  end
  local self = Panel_Widget_Alert_info
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
  if nil == landVehicleWrapper then
    self:setButtonShow(AlertType.eALERT_EnduranceHorse, false)
    self:setButtonShow(AlertType.eALERT_EnduranceCarriage, false)
    self:updateIcons(false, AlertType.eALERT_EnduranceHorse)
    self:updateIcons(false, AlertType.eALERT_EnduranceCarriage)
  end
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Ship)
  if nil == seaVehicleWrapper then
    self:setButtonShow(AlertType.eALERT_EnduranceShip, false)
    self:updateIcons(false, AlertType.eALERT_EnduranceShip)
  end
end
function FromClient_Widget_Alert_BatterEquipment()
  local self = Panel_Widget_Alert_info
  PaGlobalFunc_Widget_Alert_CheckReal_BatterEquipment()
  self:updateIcons(false, AlertType.eALERT_BatterEquipment)
end
changePositionBySever(Panel_UIMain, CppEnums.PAGameUIType.PAGameUIPanel_UIMenu, true, false, false)
PaGlobalFunc_UiMain_SetShow(true)
