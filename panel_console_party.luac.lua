-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\console\panel_console_party.luac 

-- params : ...
-- function num : 0
Panel_Console_Party:SetShow(true)
MpType = {EP = 0, MP = 1, BP = 2, FP = 3, DN = 4}
PaGlobal_ConsoleParty = {
_memberList = {}
, _maxPartyMemberCount = 5, _classMPtexture = "new_ui_common_forlua/default/Default_Gauges.dds", _classtexture0 = "new_ui_common_forlua/widget/party/Party_00.dds", _classtexture1 = "new_ui_common_forlua/widget/party/Party_01.dds", 
_mpTextureUV = {}
, 
_classTextureUV = {}
, 
_menuBase = {}
, 
_partyBuffDistance = {}
, 
_partyBuffList = {}
, _isMaster = false, _selectMember = 0, _lootingOptionText = nil}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.SetTextureUV = function(self, control, pixX, pixY, pixEndX, pixEndY)
  -- function num : 0_0
  local sizeX = control:getTextureWidth()
  local sizeY = control:getTextureHeight()
  local textureUV = {}
  textureUV.x1 = 0
  textureUV.y1 = 0
  textureUV.x2 = 0
  textureUV.y2 = 0
  if sizeX == 0 and sizeY == 0 then
    return textureUV
  end
  textureUV.x1 = pixX / sizeX
  textureUV.y1 = pixY / sizeY
  textureUV.x2 = pixEndX / sizeX
  textureUV.y2 = pixEndY / sizeY
  return textureUV
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.initTexture = function(self)
  -- function num : 0_1
  local memberBase = (UI.getChildControl)(Panel_Console_Party, "Button_PartyMemberBg")
  local memberClass = (UI.getChildControl)(memberBase, "Static_ClassIcon")
  local memberMP = (UI.getChildControl)(memberBase, "Progress2_Mp")
  local UI_Class = CppEnums.ClassType
  memberMP:ChangeTextureInfoName(self._classMPtexture)
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._mpTextureUV)[MpType.EP] = self:SetTextureUV(memberMP, 1, 70, 233, 76)
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._mpTextureUV)[MpType.MP] = self:SetTextureUV(memberMP, 1, 63, 233, 69)
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._mpTextureUV)[MpType.BP] = self:SetTextureUV(memberMP, 2, 250, 232, 255)
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._mpTextureUV)[MpType.FP] = self:SetTextureUV(memberMP, 1, 56, 233, 62)
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._mpTextureUV)[MpType.DN] = self:SetTextureUV(memberMP, 206, 214, 255, 217)
  memberClass:ChangeTextureInfoName(self._classtexture0)
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Warrior] = self:SetTextureUV(memberClass, 77, 25, 107, 55)
  -- DECOMPILER ERROR at PC97: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Ranger] = self:SetTextureUV(memberClass, 108, 25, 138, 55)
  -- DECOMPILER ERROR at PC107: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Sorcerer] = self:SetTextureUV(memberClass, 139, 25, 169, 55)
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Giant] = self:SetTextureUV(memberClass, 170, 25, 200, 55)
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Tamer] = self:SetTextureUV(memberClass, 167, 56, 197, 86)
  -- DECOMPILER ERROR at PC137: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_BladeMaster] = self:SetTextureUV(memberClass, 198, 56, 228, 86)
  -- DECOMPILER ERROR at PC147: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_BladeMasterWomen] = self:SetTextureUV(memberClass, 198, 87, 228, 117)
  -- DECOMPILER ERROR at PC157: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Valkyrie] = self:SetTextureUV(memberClass, 167, 87, 197, 117)
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Wizard] = self:SetTextureUV(memberClass, 198, 118, 228, 148)
  -- DECOMPILER ERROR at PC177: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_WizardWomen] = self:SetTextureUV(memberClass, 198, 149, 228, 179)
  -- DECOMPILER ERROR at PC187: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_NinjaWomen] = self:SetTextureUV(memberClass, 201, 25, 231, 55)
  -- DECOMPILER ERROR at PC197: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_NinjaMan] = self:SetTextureUV(memberClass, 198, 180, 228, 210)
  memberClass:ChangeTextureInfoName(self._classtexture1)
  -- DECOMPILER ERROR at PC210: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_DarkElf] = self:SetTextureUV(memberClass, 1, 1, 31, 31)
  -- DECOMPILER ERROR at PC220: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._classTextureUV)[UI_Class.ClassType_Combattant] = self:SetTextureUV(memberClass, 1, 222, 31, 252)
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.createPartyControls = function(self)
  -- function num : 0_2
  local mainMenuBG = (UI.getChildControl)(Panel_Console_Party, "Static_TopBg")
  local partyShop = (UI.getChildControl)(mainMenuBG, "CheckButton_BuffIcon")
  local partyOption = (UI.getChildControl)(mainMenuBG, "Static_Option")
  self._lootingOptionText = (UI.getChildControl)(mainMenuBG, "Static_Option")
  partyShop:addInputEvent("Mouse_LUp", "HandleMouseClickedPartyShop()")
  partyOption:addInputEvent("Mouse_LUp", "HandleMouseClickedPartyOption()")
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._partyBuffList)[0] = (UI.getChildControl)(mainMenuBG, "Static_BuffBar_0")
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._partyBuffList)[1] = (UI.getChildControl)(mainMenuBG, "Static_BuffBar_1")
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._partyBuffList)[2] = (UI.getChildControl)(mainMenuBG, "Static_BuffBar_2")
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._partyBuffList)[3] = (UI.getChildControl)(mainMenuBG, "Static_BuffBar_3")
  local memberBase = (UI.getChildControl)(Panel_Console_Party, "Button_PartyMemberBg")
  local memberName = (UI.getChildControl)(memberBase, "StaticText_Name")
  local memberClass = (UI.getChildControl)(memberBase, "Static_ClassIcon")
  local memberHPbg = (UI.getChildControl)(memberBase, "Static_ProgressHpBg")
  local memberMPbg = (UI.getChildControl)(memberBase, "Static_ProgressMpBg")
  local memberHP = (UI.getChildControl)(memberBase, "Progress2_Hp")
  local memberMP = (UI.getChildControl)(memberBase, "Progress2_Mp")
  local memberLeader = (UI.getChildControl)(memberBase, "Static_LeaderIcon")
  memberBase:SetShow(false)
  self:initTexture()
  for index = 0, self._maxPartyMemberCount - 1 do
    local partyMember = {}
    partyMember._memberBase = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Console_Party, "member_" .. index)
    partyMember._memberName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, partyMember._memberBase, "memberName_" .. index)
    partyMember._memberClass = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._memberBase, "memberClass_" .. index)
    partyMember._memberHPbg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._memberBase, "memberHPbg_" .. index)
    partyMember._memberMPbg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._memberBase, "memberMPbg_" .. index)
    partyMember._memberHP = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, partyMember._memberBase, "memberHP_" .. index)
    partyMember._memberMP = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, partyMember._memberBase, "memberMP_" .. index)
    partyMember._memberLeader = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, partyMember._memberBase, "memberLeader_" .. index)
    CopyBaseProperty(memberBase, partyMember._memberBase)
    CopyBaseProperty(memberName, partyMember._memberName)
    CopyBaseProperty(memberClass, partyMember._memberClass)
    CopyBaseProperty(memberHPbg, partyMember._memberHPbg)
    CopyBaseProperty(memberMPbg, partyMember._memberMPbg)
    CopyBaseProperty(memberHP, partyMember._memberHP)
    CopyBaseProperty(memberMP, partyMember._memberMP)
    CopyBaseProperty(memberLeader, partyMember._memberLeader)
    ;
    (partyMember._memberBase):SetPosY(memberBase:GetPosY() + index * memberBase:GetSizeY() * 1.08)
    ;
    (partyMember._memberBase):addInputEvent("Mouse_LUp", "HandleMouseClickedPartyMember(" .. index .. ")")
    -- DECOMPILER ERROR at PC247: Confused about usage of register: R17 in 'UnsetPending'

    ;
    (self._memberList)[index] = partyMember
  end
  -- DECOMPILER ERROR at PC255: Confused about usage of register: R12 in 'UnsetPending'

  ;
  (self._menuBase)._Base = (UI.getChildControl)(Panel_Console_Party, "Static_SelectedBg")
  -- DECOMPILER ERROR at PC263: Confused about usage of register: R12 in 'UnsetPending'

  ;
  (self._menuBase)._buttonLeave = (UI.getChildControl)((self._menuBase)._Base, "Button_Leave")
  -- DECOMPILER ERROR at PC271: Confused about usage of register: R12 in 'UnsetPending'

  ;
  (self._menuBase)._buttonFollow = (UI.getChildControl)((self._menuBase)._Base, "Button_Follow")
  -- DECOMPILER ERROR at PC279: Confused about usage of register: R12 in 'UnsetPending'

  ;
  (self._menuBase)._buttonKick = (UI.getChildControl)((self._menuBase)._Base, "Button_Kick")
  -- DECOMPILER ERROR at PC287: Confused about usage of register: R12 in 'UnsetPending'

  ;
  (self._menuBase)._buttonMandate = (UI.getChildControl)((self._menuBase)._Base, "Button_Mandate")
  ;
  ((self._menuBase)._Base):SetShow(false)
  ;
  ((self._menuBase)._buttonFollow):addInputEvent("Mouse_LUp", "HandleMouseClickedPartyFollow()")
  ;
  ((self._menuBase)._buttonLeave):addInputEvent("Mouse_LUp", "HandleMouseClickedPartyLeave()")
  ;
  ((self._menuBase)._buttonKick):addInputEvent("Mouse_LUp", "HandleMouseClickedPartyKick()")
  ;
  ((self._menuBase)._buttonMandate):addInputEvent("Mouse_LUp", "HandleMouseClickedPartyMandate()")
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ChangeButton = function(self, index)
  -- function num : 0_3
  local partyMemberCount = RequestParty_getPartyMemberCount()
  local partyData = {}
  partyData = FGlobal_ResponseParty_PartyMemberSet(partyMemberCount)
  local currentPartyData = partyData[index]
  if currentPartyData == nil then
    return 
  end
  ;
  ((self._menuBase)._buttonLeave):SetShow(true)
  ;
  ((self._menuBase)._buttonFollow):SetShow(true)
  ;
  ((self._menuBase)._buttonKick):SetShow(true)
  ;
  ((self._menuBase)._buttonMandate):SetShow(true)
  if not self._isMaster then
    ((self._menuBase)._buttonKick):SetShow(false)
    ;
    ((self._menuBase)._buttonMandate):SetShow(false)
  end
  if currentPartyData._isSelf then
    ((self._menuBase)._buttonFollow):SetShow(false)
    ;
    ((self._menuBase)._buttonKick):SetShow(false)
    ;
    ((self._menuBase)._buttonMandate):SetShow(false)
  else
    ;
    ((self._menuBase)._buttonLeave):SetShow(false)
  end
  self._selectMember = index
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ClickPartyMember = function(self, index)
  -- function num : 0_4
  ((self._menuBase)._Base):SetPosY((((self._memberList)[index])._memberBase):GetPosY())
  self:ChangeButton(index)
  ;
  ((self._menuBase)._Base):SetShow(true)
  self:UpdateParty()
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ClickedPartyFollow = function(self)
  -- function num : 0_5
  local selfPlayer = getSelfPlayer()
  local memberData = RequestParty_getPartyMemberAt(self._selectMember)
  do
    if memberData ~= nil then
      local actorKey = memberData:getActorKey()
      selfPlayer:setFollowActor(actorKey)
    end
    self:UpdateParty()
    ;
    ((self._menuBase)._Base):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ClickedPartyLeave = function(self)
  -- function num : 0_6
  local isPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
  if isPlayingPvPMatch == true then
    RequestParty_withdrawMember(self._selectMember)
    return 
  end
  local partyOut = function()
    -- function num : 0_6_0 , upvalues : self
    RequestParty_withdrawMember(self._selectMember)
    FGlobal_PartyInventoryClose()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PARTY_DISTRIBUTION_GETOUTPARTY")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = partyOut, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
  self:UpdateParty()
  ;
  ((self._menuBase)._Base):SetShow(false)
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.PartyWitrawMember = function(self)
  -- function num : 0_7
  local withdrawMember = self._selectMember
  local memberData = RequestParty_getPartyMemberAt(withdrawMember)
  RequestParty_withdrawMember(withdrawMember)
  if (getSelfPlayer()):isDefinedPvPMatch() == true then
    return 
  end
  self:UpdateParty()
  ;
  ((self._menuBase)._Base):SetShow(false)
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ClickedPartyKickMember = function(self)
  -- function num : 0_8
  local withdrawMember = self._selectMember
  local withdrawMemberData = RequestParty_getPartyMemberAt(withdrawMember)
  local withdrawMemberActorKey = withdrawMemberData:getActorKey()
  local withdrawMemberPlayerActor = getPlayerActor(withdrawMemberActorKey)
  local contentString = withdrawMemberData:name() .. PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT_QUESTION")
  local titleForceOut = PAGetString(Defines.StringSheet_GAME, "PANEL_PARTY_FORCEOUT")
  local messageboxData = {title = titleForceOut, content = contentString, functionYes = self:PartyWitrawMember(), functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
  self:UpdateParty()
  ;
  ((self._menuBase)._Base):SetShow(false)
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ClickedPartyChangeLeader = function(self)
  -- function num : 0_9
  RequestParty_changeLeader(self._selectMember)
  self:UpdateParty()
  ;
  ((self._menuBase)._Base):SetShow(false)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ClickedPartyShop = function(self)
  -- function num : 0_10
  Panel_Party_ItemList_Open()
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ClickedPartyOption = function(self)
  -- function num : 0_11
end

HandleMouseClickedPartyMember = function(index)
  -- function num : 0_12
  PaGlobal_ConsoleParty:ClickPartyMember(index)
end

HandleMouseClickedPartyFollow = function()
  -- function num : 0_13
  PaGlobal_ConsoleParty:ClickedPartyFollow()
end

HandleMouseClickedPartyLeave = function()
  -- function num : 0_14
  PaGlobal_ConsoleParty:ClickedPartyLeave()
end

HandleMouseClickedPartyKick = function()
  -- function num : 0_15
  PaGlobal_ConsoleParty:ClickedPartyKickMember()
end

HandleMouseClickedPartyMandate = function()
  -- function num : 0_16
  PaGlobal_ConsoleParty:ClickedPartyChangeLeader()
end

FromClient_ConsolePartyUpdate = function()
  -- function num : 0_17
  PaGlobal_ConsoleParty:UpdateParty()
end

HandleMouseClickedPartyShop = function()
  -- function num : 0_18
  PaGlobal_ConsoleParty:ClickedPartyShop()
end

HandleMouseClickedPartyOption = function()
  -- function num : 0_19
  PaGlobal_ConsoleParty:ClickedPartyOption()
end

registerEvent("ResponseParty_updatePartyList", "FromClient_ConsolePartyUpdate")
-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.SetMpTexture = function(self, texture, clastype)
  -- function num : 0_20
  if clastype == 4 then
    local mp = (self._mpTextureUV)[MpType.EP]
    ;
    (texture:getBaseTexture()):setUV(mp.x1, mp.y1, mp.x2, mp.y2)
  else
    do
      if clastype == 8 or clastype == 16 or clastype == 28 or clastype == 31 then
        local mp = (self._mpTextureUV)[MpType.MP]
        ;
        (texture:getBaseTexture()):setUV(mp.x1, mp.y1, mp.x2, mp.y2)
      else
        do
          if clastype == 24 then
            local mp = (self._mpTextureUV)[MpType.BP]
            ;
            (texture:getBaseTexture()):setUV(mp.x1, mp.y1, mp.x2, mp.y2)
          else
            do
              if clastype == 0 or clastype == 12 or clastype == 20 or clastype == 21 or clastype == 25 or clastype == 26 then
                local mp = (self._mpTextureUV)[MpType.FP]
                ;
                (texture:getBaseTexture()):setUV(mp.x1, mp.y1, mp.x2, mp.y2)
              else
                do
                  do
                    if clastype == 27 then
                      local mp = (self._mpTextureUV)[MpType.DN]
                      ;
                      (texture:getBaseTexture()):setUV(mp.x1, mp.y1, mp.x2, mp.y2)
                    end
                    texture:setRenderTexture(texture:getBaseTexture())
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

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.SetClassTexture = function(self, texture, classtype)
  -- function num : 0_21
  local UI_Class = CppEnums.ClassType
  if classtype == UI_Class.ClassType_DarkElf or classtype == UI_Class.ClassType_Combattant then
    texture:ChangeTextureInfoName(self._classtexture1)
  else
    texture:ChangeTextureInfoName(self._classtexture0)
  end
  local classUV = (self._classTextureUV)[classtype]
  ;
  (texture:getBaseTexture()):setUV(classUV.x1, classUV.y1, classUV.x2, classUV.y2)
  texture:setRenderTexture(texture:getBaseTexture())
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.ResponseParty_PartyMemberSet = function(self, partyData, partyMemberCount, index)
  -- function num : 0_22
  local classTypeTexture = nil
  local member = (self._memberList)[index]
  if index <= partyMemberCount - 1 and partyData[index] ~= nil then
    (member._memberName):SetText((partyData[index])._name)
    ;
    (member._memberHP):SetProgressRate((partyData[index])._nowHp / (partyData[index])._maxHp)
    ;
    (member._memberMP):SetProgressRate((partyData[index])._nowMp / (partyData[index])._maxMp)
    self:SetMpTexture(member._memberMP, (partyData[index])._class)
    self:SetClassTexture(member._memberClass, (partyData[index])._class)
    if (partyData[index])._isMaster == true then
      (member._memberLeader):SetShow(true)
    else
      ;
      (member._memberLeader):SetShow(false)
    end
    if (partyData[index])._isMaster and (partyData[index])._isSelf then
      self._isMaster = true
    else
      if (partyData[index])._isMaster and not (partyData[index])._isSelf then
        self._isMaster = false
      end
    end
    ;
    (member._memberBase):SetShow(true)
  else
    ;
    (member._memberBase):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.UpdateParty = function(self)
  -- function num : 0_23
  if Panel_Console_Party:IsShow() then
    local partyMemberCount = RequestParty_getPartyMemberCount()
    local lootType = RequestParty_getPartyLootType()
    local partyData = {}
    partyData = FGlobal_ResponseParty_PartyMemberSet(partyMemberCount)
    for index = 0, self._maxPartyMemberCount - 1 do
      self:ResponseParty_PartyMemberSet(partyData, partyMemberCount, index)
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (self._partyBuffDistance)[index] = partyData._distance
    end
    self:BuffOnOff()
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleParty.BuffOnOff = function(self)
  -- function num : 0_24
  local partyMemberCount = RequestParty_getPartyMemberCount()
  local distanceCount = 0
  for index = 0, self._maxPartyMemberCount - 1 do
    if (self._partyBuffDistance)[index] ~= nil and (self._partyBuffDistance)[index] > 2 then
      distanceCount = distanceCount + 1
    end
  end
  for index = 0, self._maxPartyMemberCount - 2 do
    ((self._partyBuffList)[index]):SetShow(false)
  end
  for index = 0, distanceCount do
    ((self._partyBuffList)[index]):SetShow(true)
  end
end

FGlobal_initParty = function()
  -- function num : 0_25
  local self = PaGlobal_ConsoleParty
  self:createPartyControls()
  self:UpdateParty()
end

FGlobal_initParty()

