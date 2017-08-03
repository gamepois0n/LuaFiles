-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_personalicon_left.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_BUFFTYPE = CppEnums.UserChargeType
Panel_PersonalIcon_Left:SetShow(true, false)
Panel_PersonalIcon_Left:SetIgnore(true)
Panel_PersonalIcon_Left:ActiveMouseEventEffect(false)
local _defaultEventExp = 1000000
local _btn_NewSkill = (UI.getChildControl)(Panel_PersonalIcon_Left, "Button_NewSkill")
local _txt_NewSkill = (UI.getChildControl)(Panel_PersonalIcon_Left, "StaticText_Number")
local _txt_NewSkillDesc = (UI.getChildControl)(Panel_PersonalIcon_Left, "StaticText_NewSkillHelp")
local _pcRoomIcon = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_PCRoom")
local _fixedChargeIcon = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_FixedCharge")
local _starterPackage = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_StarterPackageIcon")
local _premiumPackage = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_PremiumPackageIcon")
local _premiumAlert = (UI.getChildControl)(Panel_PersonalIcon_Left, "StaticText_BubbleAlert")
local _premiumText = (UI.getChildControl)(Panel_PersonalIcon_Left, "StaticText_NoticePremium")
local _btnCashShop = (UI.getChildControl)(Panel_PersonalIcon_Left, "Button_IngameCashShop")
local _btnAlertClose = (UI.getChildControl)(Panel_PersonalIcon_Left, "Button_TextClose")
local _NodeLvBuffIcon = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_NodeLvBuffIcon")
local _pearlPackage = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_PearlPackageIcon")
local _expEvent = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_ExpEvent")
local _dropEvent = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_DropEvent")
local _customize = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_CustomizeBuff")
local _pearlPallete = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_PearlPallete")
local _goldenBell = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_GoldenBell")
local _skillReset = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_SkillReset")
local _awakenSkillReset = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_AwakenSkillReset")
local _blackSpiritTraining = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_BlackSpiritTraining")
local _expVehicleEvent = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_HorseExpUp")
local _pcRoomUserHomeBuff = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_PcRoomBuff")
local _russiaKamasilv = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_RussiaKamasilv")
local _russiaPack3 = (UI.getChildControl)(Panel_PersonalIcon_Left, "Static_RussiaPack3")
local registEventHandler = function()
  -- function num : 0_0 , upvalues : _btn_NewSkill, _pcRoomIcon, _fixedChargeIcon, _starterPackage, _premiumPackage, _NodeLvBuffIcon, _pearlPackage, _expEvent, _dropEvent, _customize, _pearlPallete, _goldenBell, _skillReset, _awakenSkillReset, _blackSpiritTraining, _expVehicleEvent, _pcRoomUserHomeBuff, _btnCashShop, _btnAlertClose, _russiaPack3, _russiaKamasilv
  _btn_NewSkill:addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_OpenForLearn()")
  _btn_NewSkill:addInputEvent("Mouse_RUp", "Panel_SelfPlayer_EnableSkillCheck_Close()")
  _btn_NewSkill:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 0 )")
  _btn_NewSkill:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _pcRoomIcon:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 1 )")
  _pcRoomIcon:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _fixedChargeIcon:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 11 )")
  _fixedChargeIcon:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _starterPackage:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 2)")
  _starterPackage:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _premiumPackage:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 3)")
  _premiumPackage:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _NodeLvBuffIcon:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 5)")
  _NodeLvBuffIcon:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _pearlPackage:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 4)")
  _pearlPackage:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _expEvent:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 6 )")
  _expEvent:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _dropEvent:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 7 )")
  _dropEvent:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _customize:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 8 )")
  _customize:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _pearlPallete:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 9 )")
  _pearlPallete:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _goldenBell:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 12 )")
  _goldenBell:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false, 12 )")
  _skillReset:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 13 )")
  _skillReset:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false, 13 )")
  _awakenSkillReset:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 14 )")
  _awakenSkillReset:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false, 14 )")
  _blackSpiritTraining:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 16 )")
  _blackSpiritTraining:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false, 16 )")
  _expVehicleEvent:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 17 )")
  _expVehicleEvent:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _pcRoomUserHomeBuff:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 18 )")
  _pcRoomUserHomeBuff:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false )")
  _btnCashShop:addInputEvent("Mouse_LUp", "PearlShop_Open()")
  _btnAlertClose:addInputEvent("Mouse_LUp", "PremiumNotice_Close()")
  _russiaPack3:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 15 )")
  _russiaPack3:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false, 15 )")
  _russiaKamasilv:addInputEvent("Mouse_On", "BuffIcon_ShowSimpleToolTip( true, 10 )")
  _russiaKamasilv:addInputEvent("Mouse_Out", "BuffIcon_ShowSimpleToolTip( false, 10 )")
end

local _ExpFix = (UI.getChildControl)(Panel_SelfPlayerExpGage, "CheckButton_ExpFix")
_ExpFix:SetCheck(false)
_ExpFix:SetShow(false)
_btn_NewSkill:ActiveMouseEventEffect(true)
local _buffIconPosX = 0
PackageIconPosition = function()
  -- function num : 0_1 , upvalues : UI_BUFFTYPE, _pcRoomIcon, _fixedChargeIcon, _starterPackage, _premiumPackage, _premiumAlert, _premiumText, _btnCashShop, _btnAlertClose, _pearlPackage, _btn_NewSkill, _txt_NewSkill, _NodeLvBuffIcon, _expEvent, _dropEvent, _expVehicleEvent, _customize, _pearlPallete, _russiaKamasilv, _goldenBell, _skillReset, _awakenSkillReset, _russiaPack3, _blackSpiritTraining, _pcRoomUserHomeBuff, _buffIconPosX
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local iconPosX = 0
  local iconPosY = 9
  local iconGapX = 5
  local iconBackPosX = nil
  local player = selfPlayer:get()
  local goldenBellTime_s64 = player:getGoldenbellExpirationTime_s64()
  local tmpTime = convertStringFromDatetime(goldenBellTime_s64)
  local starter = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local premium = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local pearl = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local customize = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local dyeingPackage = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local russiaKamasilv = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local skillResetTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillChange)
  local awakenSkillResetTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local russiaPack3Time = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_RussiaPack3)
  local blackSpiritTrainingTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_BlackSpritTraining)
  local pcRoomUserHomeBuff = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PcRoomUserHomeBuff)
  local applyStarter = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local applyPremium = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local applyPearl = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local applyCustomize = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local applyDyeingPackage = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local applyRussiaKamasilv = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local applySkillReset = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillChange)
  local applyAwakenSkillReset = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local applyRussiaPack3 = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_RussiaPack3)
  local applyBlackSpiritTraining = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_BlackSpritTraining)
  local applyPcRoomUserHomeBuff = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PcRoomUserHomeBuff)
  if _pcRoomIcon:GetShow() then
    _pcRoomIcon:SetPosX(iconPosX)
    iconPosX = iconPosX + _pcRoomIcon:GetSizeX() + iconGapX
  end
  if _fixedChargeIcon:GetShow() then
    _fixedChargeIcon:SetPosX(iconPosX)
    iconPosX = iconPosX + _fixedChargeIcon:GetSizeX() + iconGapX
  end
  if applyStarter and starter > 0 then
    _starterPackage:SetPosX(iconPosX)
    _starterPackage:SetPosY(iconPosY)
    iconPosX = iconPosX + _starterPackage:GetSizeX() + iconGapX
  end
  if applyPremium and premium > 0 then
    _premiumPackage:SetPosX(iconPosX)
    _premiumPackage:SetPosY(iconPosY)
    iconPosX = iconPosX + _premiumPackage:GetSizeX() + iconGapX
    _premiumAlert:SetPosX(_premiumPackage:GetPosX())
    _premiumAlert:SetPosY(_premiumPackage:GetPosY() + _premiumPackage:GetSizeY() + 10)
    _premiumText:SetPosX(_premiumPackage:GetPosX())
    _premiumText:SetPosY(_premiumPackage:GetPosY() + _premiumPackage:GetSizeY())
    _btnCashShop:SetPosX(_premiumText:GetPosX() + _premiumText:GetTextSizeX() + 30)
    _btnCashShop:SetPosY(_premiumText:GetPosY() + 30)
    _btnAlertClose:SetPosX(_btnCashShop:GetPosX() + _btnCashShop:GetSizeX())
    _btnAlertClose:SetPosY(_btnCashShop:GetPosY())
  end
  if applyPearl and pearl > 0 then
    _pearlPackage:SetPosX(iconPosX)
    _pearlPackage:SetPosY(iconPosY)
    iconPosX = iconPosX + _pearlPackage:GetSizeX() + iconGapX
  end
  if _btn_NewSkill:GetShow() then
    _btn_NewSkill:SetPosX(iconPosX)
    _btn_NewSkill:SetPosY(iconPosY - 4)
    iconPosX = iconPosX + _btn_NewSkill:GetSizeX() + iconGapX
  end
  if _txt_NewSkill:GetShow() then
    _txt_NewSkill:SetPosX(_btn_NewSkill:GetPosX() + _btn_NewSkill:GetSizeX() - _txt_NewSkill:GetSizeX() + 2)
  end
  if Panel_NormalKnowledge:GetShow() then
    Panel_NormalKnowledge:SetPosX(iconPosX + Panel_SelfPlayerExpGage:GetPosX() + Panel_SelfPlayerExpGage:GetSizeX())
    iconPosX = iconPosX + Panel_NormalKnowledge:GetSizeX() + iconGapX
  end
  if Panel_ImportantKnowledge:GetShow() then
    Panel_ImportantKnowledge:SetPosX(iconPosX + Panel_SelfPlayerExpGage:GetPosX() + Panel_SelfPlayerExpGage:GetSizeX())
    iconPosX = iconPosX + Panel_ImportantKnowledge:GetSizeX() + iconGapX
  end
  if _NodeLvBuffIcon:GetShow() then
    _NodeLvBuffIcon:SetPosX(iconPosX)
    _NodeLvBuffIcon:SetPosY(iconPosY)
    iconPosX = iconPosX + _NodeLvBuffIcon:GetSizeX() + iconGapX
  end
  if _expEvent:GetShow() then
    _expEvent:SetPosX(iconPosX)
    _expEvent:SetPosY(iconPosY)
    iconPosX = iconPosX + _expEvent:GetSizeX() + iconGapX
  end
  if _dropEvent:GetShow() then
    _dropEvent:SetPosX(iconPosX)
    _dropEvent:SetPosY(iconPosY)
    iconPosX = iconPosX + _dropEvent:GetSizeX() + iconGapX
  end
  if _expVehicleEvent:GetShow() then
    _expVehicleEvent:SetPosX(iconPosX)
    _expVehicleEvent:SetPosY(iconPosY)
    iconPosX = iconPosX + _expVehicleEvent:GetSizeX() + iconGapX
  end
  if applyCustomize then
    _customize:SetPosX(iconPosX)
    _customize:SetPosY(iconPosY)
    iconPosX = iconPosX + _customize:GetSizeX() + iconGapX
  end
  if applyDyeingPackage and dyeingPackage > 0 then
    _pearlPallete:SetPosX(iconPosX)
    _pearlPallete:SetPosY(iconPosY)
    iconPosX = iconPosX + _pearlPallete:GetSizeX() + iconGapX
  end
  if applyRussiaKamasilv and russiaKamasilv > 0 then
    _russiaKamasilv:SetPosX(iconPosX)
    _russiaKamasilv:SetPosY(iconPosY)
    iconPosX = iconPosX + _russiaKamasilv:GetSizeX() + iconGapX
  end
  if toInt64(0, 0) < goldenBellTime_s64 then
    _goldenBell:SetShow(true)
    _goldenBell:SetPosX(iconPosX)
    _goldenBell:SetPosY(iconPosY)
    iconPosX = iconPosX + _goldenBell:GetSizeX() + iconGapX
  else
    _goldenBell:SetShow(false)
  end
  if applySkillReset and skillResetTime > 0 then
    _skillReset:SetPosX(iconPosX)
    _skillReset:SetPosY(iconPosY)
    iconPosX = iconPosX + _skillReset:GetSizeX() + iconGapX
  end
  if applyAwakenSkillReset and awakenSkillResetTime > 0 then
    _awakenSkillReset:SetPosX(iconPosX)
    _awakenSkillReset:SetPosY(iconPosY)
    iconPosX = iconPosX + _awakenSkillReset:GetSizeX() + iconGapX
  end
  if applyRussiaPack3 and russiaPack3Time > 0 then
    _russiaPack3:SetPosX(iconPosX)
    _russiaPack3:SetPosY(iconPosY)
    iconPosX = iconPosX + _russiaPack3:GetSizeX() + iconGapX
  end
  if applyBlackSpiritTraining and blackSpiritTrainingTime > 0 then
    _blackSpiritTraining:SetPosX(iconPosX)
    _blackSpiritTraining:SetPosY(iconPosY)
    iconPosX = iconPosX + _blackSpiritTraining:GetSizeX() + iconGapX
  end
  if applyPcRoomUserHomeBuff and pcRoomUserHomeBuff > 0 then
    _pcRoomUserHomeBuff:SetPosX(iconPosX)
    _pcRoomUserHomeBuff:SetPosY(iconPosY)
    iconPosX = iconPosX + _pcRoomUserHomeBuff:GetSizeX() + iconGapX
  end
  Panel_PersonalIcon_Left:SetPosX(Panel_SelfPlayerExpGage:GetPosX() + Panel_SelfPlayerExpGage:GetSizeX())
  Panel_PersonalIcon_Left:SetPosY(5)
  Panel_PersonalIcon_Left:SetSize(iconPosX, Panel_PersonalIcon_Left:GetSizeY())
  _buffIconPosX = iconPosX
end

local pcRoomNeedTime = ToClient_GetPcRoomUserHomeBuffLimitTime()
local needTime = Int64toInt32(pcRoomNeedTime)
local useTime = 0
BuffIcon_ShowSimpleToolTip = function(isShow, iconType)
  -- function num : 0_2 , upvalues : UI_BUFFTYPE, _defaultEventExp, _btn_NewSkill, _pcRoomIcon, _starterPackage, _premiumPackage, _pearlPackage, _NodeLvBuffIcon, _expEvent, _dropEvent, _customize, _pearlPallete, _russiaKamasilv, _fixedChargeIcon, _goldenBell, _skillReset, _awakenSkillReset, _russiaPack3, _blackSpiritTraining, _ExpFix, _expVehicleEvent, _pcRoomUserHomeBuff
  local name, desc, uiControl = nil, nil, nil
  local leftTime = 0
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local player = selfPlayer:get()
  local curChannelData = getCurrentChannelServerData()
  local goldenBellTime_s64 = player:getGoldenbellExpirationTime_s64()
  local goldenBellTime = convertStringFromDatetime(goldenBellTime_s64)
  local goldenBellPercent = player:getGoldenbellPercent()
  local goldenBellPercentString = tostring((math.floor)(goldenBellPercent / 10000))
  local goldenBellCharacterName = player:getGoldenbellItemOwnerCharacterName()
  local goldenBellGuildName = player:getGoldenbellItemOwnerGuildName()
  local starter = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local premium = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local pearl = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local customize = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local dyeingPackage = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local russiaKamasilv = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local skillResetTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillChange)
  local awakenSkillResetTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local russiaPack3Time = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_RussiaPack3)
  local trainingTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_BlackSpritTraining)
  local trainingTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_BlackSpritTraining)
  local expEventPercent = getEventExpPercentByWorldNo(curChannelData._worldNo, curChannelData._serverNo)
  local expEventPercentShow = 0
  if _defaultEventExp < expEventPercent then
    expEventPercentShow = (math.floor)(expEventPercent / 10000 - 100)
  end
  local expVehiclePercent = lobby_getEventVehicleExpPercentByWorldNo(curChannelData._worldNo, curChannelData._serverNo)
  local expEventVehiclePercentShow = 0
  if _defaultEventExp < expVehiclePercent then
    expEventVehiclePercentShow = (math.floor)(expVehiclePercent / 10000 - 100)
  end
  if iconType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NewSkillDesc")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NEWSKILLPOINTS_TOOLTIP_DESC")
    uiControl = _btn_NewSkill
  else
    if iconType == 1 then
      if isGameTypeEnglish() then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_TITLE_NA")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_DESC_NA")
      else
        name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_TITLE")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_DESC")
      end
      uiControl = _pcRoomIcon
    else
      if iconType == 2 then
        leftTime = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TIME", "getStarterPackageTime", convertStringFromDatetime(toInt64(0, starter)))
        if isGameTypeRussia() then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE_RUS")
          desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC_RUS")
        else
          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE")
          desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC")
        end
        uiControl = _starterPackage
      else
        if iconType == 3 then
          leftTime = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_AILINBUFF_TIME", "getPremiumPackageTime", convertStringFromDatetime(toInt64(0, premium)))
          if isGameTypeJapan() then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE")
            desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_JP")
          else
            if isGameTypeRussia() then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_RUS")
              desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_RUS")
            else
              if isGameTypeTaiwan() then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_TW")
                desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_TW")
              else
                if isGameTypeSA() then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_SA")
                  desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_SA")
                else
                  if isGameTypeKR2() then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_KR2")
                    desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_KR2")
                  else
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE")
                    desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC")
                  end
                end
              end
            end
          end
          uiControl = _premiumPackage
        else
          if iconType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PEARLBUFF_TITLE")
            leftTime = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_LIGHTPEARLBUFF_TIME", "getPearlPackageTime", convertStringFromDatetime(toInt64(0, pearl)))
            desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PEARLBUFF_DESC")
            uiControl = _pearlPackage
          else
            if iconType == 5 and localNodeInvestment == true then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NODELVBUFF_TITLE")
              desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NODELVBUFF_DESC", "nodeName", localNodeName)
              uiControl = _NodeLvBuffIcon
            else
              if iconType == 5 and localNodeInvestment == false then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NODELVBUFF_TITLE")
                desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NOTNODELVBUFF_DESC", "localNodeName", localNodeName)
                uiControl = _NodeLvBuffIcon
              else
                if iconType == 6 then
                  local expDesc = getBattleExpTooltipText(curChannelData)
                  name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EXPBUFF", "percent", expEventPercentShow)
                  if expDesc ~= "" then
                    desc = "<PAColor0xFF66CC33>" .. expDesc .. "<PAOldColor>"
                  else
                    desc = ""
                  end
                  uiControl = _expEvent
                else
                  do
                    if iconType == 7 then
                      local expDesc = getBattleExpTooltipText(curChannelData)
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_DROPBUFF")
                      if expDesc ~= "" then
                        desc = "<PAColor0xFF66CC33>" .. expDesc .. "<PAOldColor>"
                      else
                        desc = ""
                      end
                      uiControl = _dropEvent
                    else
                      do
                        if iconType == 8 then
                          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTER_BUFF_TOOLTIP_NAME")
                          desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CASH_CUSTOMIZATION_BUFFTOOLTIP_DESC", "customizationPackageTime", convertStringFromDatetime(toInt64(0, customize)))
                          uiControl = _customize
                        else
                          if iconType == 9 then
                            name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_DYEINGPACKEAGE_TITLE")
                            desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_DYEINGPACKEAGE_DESC") .. convertStringFromDatetime(toInt64(0, dyeingPackage))
                            uiControl = _pearlPallete
                          else
                            if iconType == 10 then
                              name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE")
                              desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC") .. "\n" .. convertStringFromDatetime(toInt64(0, russiaKamasilv))
                              uiControl = _russiaKamasilv
                            else
                              if iconType == 11 then
                                local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
                                local fixedChargeTime = temporaryPCRoomWrapper:getFixedChargeTime()
                                local leftTime = calculateDayFromDateDay(toInt64(0, fixedChargeTime))
                                if leftTime < toInt64(0, 365) then
                                  desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PRIMIUMSERVER_DESC", "leftTime", convertStringFromDatetime(toInt64(0, temporaryPCRoomWrapper:getFixedChargeTime())))
                                else
                                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PRIMIUMSERVER_DESC_RU_FOR_INFINITY")
                                end
                                name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PRIMIUMSERVER_TITLE")
                                uiControl = _fixedChargeIcon
                              else
                                do
                                  if iconType == 12 then
                                    local curChannelData = getCurrentChannelServerData()
                                    local channelName = getChannelName(curChannelData._worldNo, curChannelData._serverNo)
                                    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_TOOLTIP_NAME")
                                    if goldenBellGuildName == nil or goldenBellGuildName == "" or goldenBellGuildName == " " then
                                      desc = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_TOOLTIP_DESC_NOGUILD", "channelName", channelName, "name", goldenBellCharacterName, "percent", goldenBellPercentString) .. " <PAColor0xFFF26A6A>" .. goldenBellTime .. "<PAOldColor>"
                                    else
                                      desc = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_TOOLTIP_DESC_GUILD", "channelName", channelName, "guildName", goldenBellGuildName, "name", goldenBellCharacterName, "percent", goldenBellPercentString) .. " <PAColor0xFFF26A6A>" .. goldenBellTime .. "<PAOldColor>"
                                    end
                                    uiControl = _goldenBell
                                  else
                                    do
                                      if iconType == 13 then
                                        name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_SKILLRESET_TOOLTIP_NAME")
                                        desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_SKILLRESET_TOOLTIP_DESC", "skillResetTime", convertStringFromDatetime(toInt64(0, skillResetTime)))
                                        uiControl = _skillReset
                                      else
                                        if iconType == 14 then
                                          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_AWAKENSKILL_TOOLTIP_NAME")
                                          desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_AWAKENSKILL_TOOLTIP_DESC", "awakenSkillResetTime", convertStringFromDatetime(toInt64(0, awakenSkillResetTime)))
                                          uiControl = _awakenSkillReset
                                        else
                                          if iconType == 15 then
                                            name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_RUSSIAPACK3_TOOLTIP_NAME")
                                            desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_RUSSIAPACK3_TOOLTIP_DESC", "russiaPack3Time", convertStringFromDatetime(toInt64(0, russiaPack3Time)))
                                            uiControl = _russiaPack3
                                          else
                                            if iconType == 16 then
                                              name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BLACKSPIRITTRAINING_TOOLTIP_NAME")
                                              desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BLACKSPIRITTRAINING_TOOLTIP_DESC", "trainingTime", convertStringFromDatetime(toInt64(0, trainingTime)))
                                              uiControl = _blackSpiritTraining
                                            else
                                              if iconType == 90 then
                                                name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_TOOLTIP_FIXEXP_TITLE")
                                                desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_TOOLTIP_FIXEXP_DESC")
                                                uiControl = _ExpFix
                                              else
                                                if iconType == 17 then
                                                  name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_VEHICLEEXPBUFF")
                                                  desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_VEHICLEEXPBUFF_TOOLTIP_DESC", "percent", expEventVehiclePercentShow)
                                                  uiControl = _expVehicleEvent
                                                else
                                                  if iconType == 18 then
                                                    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOMUSERHOMEBUFF")
                                                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOMUSERHOMEBUFF_TOOLTIP_DESC")
                                                    uiControl = _pcRoomUserHomeBuff
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                      if isShow == true then
                                        TooltipSimple_Show(uiControl, name, desc)
                                      else
                                        TooltipSimple_Hide()
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

Panel_SelfPlayer_EnableSkillCheck_Func = function()
  -- function num : 0_3 , upvalues : _btn_NewSkill, _txt_NewSkill
  local isLearnable = PaGlobal_Skill:SkillWindow_PlayerLearnableSkill()
  local skillCount = FGlobal_EnableSkillReturn()
  local isSkillIconShowCheck = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).SkillIconCheck)
  if isLearnable and isSkillIconShowCheck then
    _btn_NewSkill:SetShow(true)
    _txt_NewSkill:SetShow(true)
    _txt_NewSkill:SetText(skillCount)
    _txt_NewSkill:SetPosX(_btn_NewSkill:GetPosX() + _btn_NewSkill:GetSizeX() - _txt_NewSkill:GetSizeX() + 2)
    _txt_NewSkill:SetPosY(_btn_NewSkill:GetPosY() + _btn_NewSkill:GetSizeY() - _txt_NewSkill:GetSizeY() + 2)
  else
    _btn_NewSkill:SetShow(false)
    _txt_NewSkill:SetShow(false)
  end
  FromClient_PackageIconUpdate()
  FromClient_ResponseChangeExpAndDropPercent()
  PaGlobal_SkillCombination:update()
end

Panel_SelfPlayer_EnableSkillCheck_Close = function()
  -- function num : 0_4 , upvalues : _btn_NewSkill, _txt_NewSkill
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).SkillIconCheck, false)
  _btn_NewSkill:SetShow(false)
  _txt_NewSkill:SetShow(false)
  FromClient_PackageIconUpdate()
end

local valuePackCheck = false
FromClient_PackageIconUpdate = function()
  -- function num : 0_5 , upvalues : UI_BUFFTYPE, _pcRoomIcon, _fixedChargeIcon, _starterPackage, _premiumPackage, _pearlPackage, _customize, _pearlPallete, _russiaKamasilv, _skillReset, _awakenSkillReset, _russiaPack3, valuePackCheck, _premiumText, _btnCashShop, _btnAlertClose, _premiumAlert, _blackSpiritTraining, _pcRoomUserHomeBuff
  local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local player = selfPlayer:get()
  local starter = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local premium = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local pearl = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local customize = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local dyeingPackage = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local russiaKamasilv = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local applyStarter = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local applyPremium = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local applyPearl = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local applyCustomize = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local applyDyeingPackage = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local applyRussiaKamasilv = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local applySkillReset = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillChange)
  local applyAwakenSkillReset = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local applyRussiaPack3 = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_RussiaPack3)
  local blackSpiritTraining = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_BlackSpritTraining)
  local pcRoomUserHomeBuff = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PcRoomUserHomeBuff)
  _pcRoomIcon:SetShow(false)
  _fixedChargeIcon:SetShow(false)
  _starterPackage:SetShow(false)
  _premiumPackage:SetShow(false)
  _pearlPackage:SetShow(false)
  _customize:SetShow(false)
  _pearlPallete:SetShow(false)
  _russiaKamasilv:SetShow(false)
  _skillReset:SetShow(false)
  _awakenSkillReset:SetShow(false)
  _russiaPack3:SetShow(false)
  if valuePackCheck then
    valuePackCheck = false
    PremiumPackageBuyNotice()
    _premiumText:SetShow(false)
    _btnCashShop:SetShow(false)
    _btnAlertClose:SetShow(false)
  end
  if isPremiumPcRoom == true and not isGameTypeRussia() and not isGameTypeEnglish() and not isGameTypeSA() and not isGameTypeKR2() then
    _pcRoomIcon:SetShow(true)
  end
  if isServerFixedCharge() then
    _fixedChargeIcon:SetShow(true)
  end
  if applyStarter then
    if starter > 0 then
      _starterPackage:SetShow(true)
    else
      _starterPackage:SetShow(false)
    end
  end
  if applyPremium then
    if premium > 0 then
      _premiumPackage:SetShow(true)
      _premiumAlert:SetShow(false)
      local leftTime = (math.ceil)(premium / 60 / 60)
      do
        do
          if leftTime <= 24 then
            local msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BUFFTIME_MSG", "leftTime", leftTime)
            _premiumAlert:SetText(msg)
            _premiumAlert:SetSize(_premiumAlert:GetTextSizeX() + 10, _premiumAlert:GetSizeY())
            _premiumAlert_ShowAni(_premiumAlert, 10)
          end
          valuePackCheck = true
          _premiumPackage:SetShow(false)
          valuePackCheck = false
          if applyPearl then
            _pearlPackage:SetShow(true)
          end
          if applyCustomize then
            _customize:SetShow(true)
          end
          if applyDyeingPackage then
            _pearlPallete:SetShow(true)
          else
            _pearlPallete:SetShow(false)
          end
          if applyRussiaKamasilv then
            _russiaKamasilv:SetShow(true)
          end
          if applySkillReset then
            _skillReset:SetShow(true)
          else
            _skillReset:SetShow(false)
          end
          if applyAwakenSkillReset then
            _awakenSkillReset:SetShow(true)
          else
            _awakenSkillReset:SetShow(false)
          end
          if applyRussiaPack3 then
            _russiaPack3:SetShow(true)
          else
            _russiaPack3:SetShow(false)
          end
          if blackSpiritTraining then
            _blackSpiritTraining:SetShow(true)
          else
            _blackSpiritTraining:SetShow(false)
          end
          if pcRoomUserHomeBuff then
            _pcRoomUserHomeBuff:SetShow(false)
            FGlobal_PersonalIcon_ButtonPosUpdate()
            PackageIconPosition()
          end
        end
      end
    end
  end
end

FromClient_ResponseChangeExpAndDropPercent = function()
  -- function num : 0_6 , upvalues : _expEvent, _dropEvent, _defaultEventExp, _expVehicleEvent
  local curChannelData = getCurrentChannelServerData()
  local expEventShow = IsWorldServerEventTypeByWorldNo(curChannelData._worldNo, curChannelData._serverNo, 0)
  local dropEventShow = IsWorldServerEventTypeByWorldNo(curChannelData._worldNo, curChannelData._serverNo, 1)
  local expEventPercent = getEventExpPercentByWorldNo(curChannelData._worldNo, curChannelData._serverNo)
  local expEventVehicle = lobby_getEventVehicleExpPercentByWorldNo(curChannelData._worldNo, curChannelData._serverNo)
  if expEventShow then
    _expEvent:SetShow(true)
  else
    _expEvent:SetShow(false)
  end
  if dropEventShow then
    _dropEvent:SetShow(true)
  else
    _dropEvent:SetShow(false)
  end
  if _defaultEventExp < expEventVehicle then
    _expVehicleEvent:SetShow(true)
  else
    _expVehicleEvent:SetShow(false)
  end
  PackageIconPosition()
end

_premiumAlert_ShowAni = function(control, showTime)
  -- function num : 0_7 , upvalues : UI_ANI_ADV, UI_color
  control:SetShow(true)
  local closeAni = control:addColorAnimation(showTime, showTime + 0.55, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  closeAni:SetStartColor(UI_color.C_FFFFFFFF)
  closeAni:SetEndColor(UI_color.C_00FFFFFF)
  closeAni:SetStartIntensity(3)
  closeAni:SetEndIntensity(1)
  closeAni.IsChangeChild = true
  closeAni:SetHideAtEnd(true)
  closeAni:SetDisableWhileAni(true)
end

PremiumPackageBuyNotice = function()
  -- function num : 0_8 , upvalues : _premiumText, _btnCashShop, _btnAlertClose
  if _premiumText:GetShow() then
    return 
  end
  local msg = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BUFFTIME_BUYINCASH_MSG")
  _premiumText:SetText(msg)
  _premiumText:SetShow(true)
  _btnCashShop:SetShow(true)
  _btnAlertClose:SetShow(true)
end

PearlShop_Open = function()
  -- function num : 0_9
  PremiumNotice_Close()
  InGameShop_Open()
end

PremiumNotice_Close = function()
  -- function num : 0_10 , upvalues : _premiumText, _btnCashShop, _btnAlertClose
  _premiumText:SetShow(false)
  _btnCashShop:SetShow(false)
  _btnAlertClose:SetShow(false)
end

CharacterExpFix = function()
  -- function num : 0_11 , upvalues : _ExpFix
  if ((getSelfPlayer()):get()):getLevel() < 11 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NOTYETUSE"))
    _ExpFix:SetCheck(false)
    return 
  end
  ToClient_SetAddedExperience(not _ExpFix:IsCheck())
end

local saveWayPoint = nil
eventChangedExplorationNode = function(wayPointKey)
  -- function num : 0_12 , upvalues : saveWayPoint, _NodeLvBuffIcon
  local nodeLv = ToClient_GetNodeLevel(wayPointKey)
  local nodeName = ToClient_GetNodeNameByWaypointKey(wayPointKey)
  local nodeExp = ToClient_GetNodeExperience_s64(wayPointKey)
  localNodeName = nodeName
  saveWayPoint = wayPointKey
  if nodeLv > 0 and toInt64(0, 0) <= nodeExp then
    _NodeLvBuffIcon:SetShow(true)
    _NodeLvBuffIcon:ChangeTextureInfoName("Icon/New_Icon/04_PC_Skill/03_Buff/Node_ItemDropRateUP.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(_NodeLvBuffIcon, 1, 1, 32, 32)
    ;
    (_NodeLvBuffIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    _NodeLvBuffIcon:setRenderTexture(_NodeLvBuffIcon:getBaseTexture())
    PackageIconPosition()
    localNodeInvestment = true
  else
    do
      _NodeLvBuffIcon:SetShow(true)
      _NodeLvBuffIcon:ChangeTextureInfoName("Icon/New_Icon/04_PC_Skill/03_Buff/Non_ItemDropRateUP.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(_NodeLvBuffIcon, 1, 1, 32, 32)
      ;
      (_NodeLvBuffIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      _NodeLvBuffIcon:setRenderTexture(_NodeLvBuffIcon:getBaseTexture())
      PackageIconPosition()
      localNodeInvestment = false
    end
  end
end

FGlobal_NodeLvBuffIcon_SetShow = function(isShow)
  -- function num : 0_13 , upvalues : _NodeLvBuffIcon
  _NodeLvBuffIcon:SetShow(isShow)
end

eventChangedExplorationNodeCheck = function(wayPointKey)
  -- function num : 0_14
  eventChangedExplorationNode(wayPointKey)
end

eventChangeExplorationNode = function(wayPointKey)
  -- function num : 0_15 , upvalues : saveWayPoint
  if saveWayPoint == wayPointKey then
    eventChangedExplorationNode(wayPointKey)
  end
end

FromClient_ResponseGoldenbellItemInfo = function(goldenbellPercent, goldenbellExpirationTime_s64, goldenbellOwnerCharacterName, goldenbellOwnerGuildName)
  -- function num : 0_16 , upvalues : _goldenBell
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  _goldenBell:SetShow(false)
  if goldenbellExpirationTime_s64 <= toInt64(0, 0) then
    _goldenBell:SetShow(false)
    PackageIconPosition()
    return 
  else
    _goldenBell:SetShow(true)
  end
  local curChannelData = getCurrentChannelServerData()
  local channelName = getChannelName(curChannelData._worldNo, curChannelData._serverNo)
  local goldenBellPercentString = tostring((math.floor)(goldenbellPercent / 10000))
  local msg = {main = "", sub = "", addMsg = ""}
  if goldenbellOwnerGuildName == "" then
    msg = 
  else
    msg = 
  end
  ;
  ({main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_MAIN_NOGUILD", "name", goldenbellOwnerCharacterName), sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_SUB_NOGUILD", "channelName", channelName, "percent", goldenBellPercentString), addMsg = "", main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_MAIN_GUILD", "guildName", goldenbellOwnerGuildName, "name", goldenbellOwnerCharacterName), sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_MAIN_SUB", "channelName", channelName, "percent", goldenBellPercentString), addMsg = ""})(msg, 10, 54)
  PackageIconPosition()
end

FGlobal_PackageIconUpdate = function()
  -- function num : 0_17
  FromClient_PackageIconUpdate()
  FromClient_ResponseChangeExpAndDropPercent()
end

PCRomm_UpdateTime = function()
  -- function num : 0_18 , upvalues : needTime, useTime
  if needTime < useTime then
    return 
  end
  local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
  if not isPremiumPcRoom then
    return 
  end
  local pcRoomUseTime = ToClient_GetPcRoomPlayTime()
  useTime = Int64toInt32(pcRoomUseTime)
end

local registMessageHandler = function()
  -- function num : 0_19
  registerEvent("FromClient_SelfPlayerCombatSkillPointChanged", "UserSkillPoint_Update")
  registerEvent("FromClient_SelfPlayerCombatSkillPointChanged", "Panel_SelfPlayer_EnableSkillCheck_Func")
  registerEvent("FromClient_EnableSkillCheck", "Panel_SelfPlayer_EnableSkillCheck_Func")
  registerEvent("FromClient_UpdateCharge", "FromClient_PackageIconUpdate")
  registerEvent("FromClient_LoadCompleteMsg", "FromClient_PackageIconUpdate")
  registerEvent("FromClient_ResponseGoldenbellItemInfo", "FromClient_ResponseGoldenbellItemInfo")
  registerEvent("FromClient_ResponseChangeExpAndDropPercent", "FromClient_ResponseChangeExpAndDropPercent")
  registerEvent("FromClint_EventChangedExplorationNode", "eventChangedExplorationNodeCheck")
  registerEvent("FromClint_EventUpdateExplorationNode", "eventChangeExplorationNode")
end

registEventHandler()
registMessageHandler()

