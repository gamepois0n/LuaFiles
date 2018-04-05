-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\messagehistory\panel_messagehistory.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_MessageHistory:SetShow(false)
Panel_MessageHistory:RegisterShowEventFunc(true, "MessageHistory_ShowAni()")
Panel_MessageHistory:RegisterShowEventFunc(false, "MessageHistory_HideAni()")
Panel_MessageHistory:ActiveMouseEventEffect(true)
Panel_MessageHistory_BTN:SetShow(false)
local thisWidgetComplete = false
local MessageHistory = {content = (UI.getChildControl)(Panel_MessageHistory, "StaticText_Content"), autoPop = (UI.getChildControl)(Panel_MessageHistory, "CheckButton_AutoPopUp"), BTN_Next = (UI.getChildControl)(Panel_MessageHistory, "Button_Next"), BTN_Confirm = (UI.getChildControl)(Panel_MessageHistory, "Button_Confirm"), contentCount = (UI.getChildControl)(Panel_MessageHistory, "StaticText_Page"), closeBTN = (UI.getChildControl)(Panel_MessageHistory, "Button_Close"), badges = (UI.getChildControl)(Panel_MessageHistory_BTN, "StaticText_badges"), badgesBTN = (UI.getChildControl)(Panel_MessageHistory_BTN, "Static_BTN"), thisPage = 1, msgCount = 0, elapsedTime = 0, hideAniPlay = false}
local screenX = getScreenSizeX()
local screenY = getScreenSizeY()
local panelSizeX = Panel_MessageHistory:GetSizeX()
local panelSizeY = Panel_MessageHistory:GetSizeY()
local Acquire_Enum = {LevelUp = 0, GainProductSkillPoint = 1, GainCombatSkillPoint = 2, GainGuildSkillPoint = 3, LearnSkill = 4, SkillLearnable = 5, SkillAwakened = 6, QuestAccept = 7, QuestFailed = 8, QuestComplete = 9, GetRareItem = 10, DiscoveryExplorationNode = 11, UpgradeExplorationNode = 12, LearnMentalCard = 13, ServantLevelUp = 14, GainExplorePoint = 15, Detected = 16, AddNpcWorker = 17, GetAlchemy = 18, GetManufacture = 19, LearnGuildSkill = 20, MentalThemeComplete = 21, ProductLevelUp = 22, GetFishEncyclopedia = 23, UpdateFishLength = 24, GetFish = 25, AcquiredTitle = 26, ServantLearnSkill = 27, ServantSkillMaster = 28, Normal = 0, Viliage = 1, City = 2, Gate = 3, Farm = 4, Filtration = 5, Collect = 6, Quarry = 7, Logging = 8, Deco_Tree = 9}
local objectMessage = {PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_OBJECTMESSAGE_LIFEPOINT"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_OBJECTMESSAGE_COMBATPOINT"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_OBJECTMESSAGE_GUILDPOINT"), "", "", "", "", "", "", "", "", PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_OBJECTMESSAGE_FINDTOWN"), "", "", "", PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_OBJECTMESSAGE_DETECT"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_OBJECTMESSAGE_CONTRACT"), "", "", PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_OBJECTMESSAGE_GUILDSKILL"), "", ""}
local productLevelUpObejctMessage = {PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_GATHERING"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_FISH"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_HUNT"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_COOK"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_ALCHEMY"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_MANUFACTURE"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_OBEDIENCE"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_TRADE"), PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_PRODUCTLEVELUP_SAIL")}
local massagePool = (Array.new)()
MessageHistory_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, screenX, panelSizeX, screenY, panelSizeY
  local MoveAni1 = Panel_MessageHistory:addMoveAnimation(0, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni1:SetStartPosition(screenX - panelSizeX - 10, screenY)
  MoveAni1:SetEndPosition(screenX - panelSizeX - 10, screenY - panelSizeY - 40)
  MoveAni1.IsChangeChild = true
  local MoveAni2 = Panel_MessageHistory:addMoveAnimation(0.3, 0.4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MoveAni2:SetStartPosition(screenX - panelSizeX - 10, screenY - panelSizeY - 40)
  MoveAni2:SetEndPosition(screenX - panelSizeX - 10, screenY - panelSizeY - 30)
  MoveAni2.IsChangeChild = true
end

MessageHistory_HideAni = function()
  -- function num : 0_1
end

MessageHistory.init = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  (self.content):SetAutoResize(true)
  ;
  (self.content):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.autoPop):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_AutoPop"))
  ;
  (self.autoPop):SetEnableArea(0, 0, (self.autoPop):GetSizeX() + (self.autoPop):GetTextSizeX(), (self.autoPop):GetSizeY())
  ;
  (self.autoPop):SetCheck(true)
  ;
  (self.badges):SetText(self.msgCount)
end

MessageHistory.setContent = function(self, type, msg, func)
  -- function num : 0_3
  (self.content):SetText(msg)
end

FGlobal_MessageHistory_InputMSG = function(type, msg, func)
  -- function num : 0_4 , upvalues : thisWidgetComplete, MessageHistory, massagePool
  if not thisWidgetComplete then
    return 
  end
  local self = MessageHistory
  massagePool:push_back({[0] = type, [1] = msg, [2] = func})
  self.msgCount = massagePool:length()
  self.thisPage = 1
  ;
  (MessageHistory.badges):SetText(self.msgCount)
  if not Panel_MessageHistory:GetShow() then
    self:PrintMsg()
  else
    self:Update()
  end
end

MessageHistory.PrintMsg = function(self)
  -- function num : 0_5 , upvalues : thisWidgetComplete, MessageHistory
  if not thisWidgetComplete then
    return 
  end
  self:Update()
  ;
  (self.contentCount):SetText(self.thisPage .. "/" .. self.msgCount)
  ;
  (self.contentCount):SetPosY(((self.content):GetSpanSize()).y + (self.content):GetSizeY() + 5)
  if (MessageHistory.autoPop):IsCheck() and (Defines.UIMode).eUIMode_Default == GetUIMode() then
    Panel_MessageHistory:SetShow(true, true)
    Panel_MessageHistory_BTN:SetShow(false)
  end
end

MessageHistory.Update = function(self, nextBTN)
  -- function num : 0_6 , upvalues : MessageHistory, massagePool
  local msg = nil
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  MessageHistory.elapsedTime = 0
  if nextBTN then
    self.thisPage = self.thisPage + 1
    msg = massagePool:pop_back()
    if self.thisPage == 2 then
      msg = massagePool:pop_back()
    end
  else
    self.thisPage = 1
    msg = massagePool[self.msgCount]
  end
  self:setContent(msg[0], msg[1], msg[2])
  if self.thisPage < self.msgCount then
    (self.BTN_Next):SetShow(true)
    ;
    (self.BTN_Next):SetSpanSize(35, 10)
    ;
    (self.BTN_Confirm):SetSpanSize(-35, 10)
  else
    ;
    (self.BTN_Next):SetShow(false)
    ;
    (self.BTN_Confirm):SetSpanSize(0, 10)
  end
  ;
  (self.contentCount):SetText(self.thisPage .. "/" .. self.msgCount)
  ;
  (self.contentCount):SetPosY(((self.content):GetSpanSize()).y + (self.content):GetSizeY() + 5)
end

MessageHistory.BadgesBTN_ToggleLogic = function(self, length)
  -- function num : 0_7 , upvalues : thisWidgetComplete
  if not thisWidgetComplete then
    return 
  end
  if length == 0 then
    Panel_MessageHistory_BTN:SetShow(false)
  else
    Panel_MessageHistory_BTN:SetShow(true)
  end
end

MessageHistory.Close = function(self)
  -- function num : 0_8 , upvalues : massagePool, MessageHistory
  self.msgCount = massagePool:length()
  Panel_MessageHistory:SetShow(false, false)
  ;
  (MessageHistory.badges):SetText(self.msgCount)
  self:BadgesBTN_ToggleLogic(self.msgCount)
end

HandleClicked_MessageHistory_Close = function()
  -- function num : 0_9 , upvalues : MessageHistory, massagePool
  local self = MessageHistory
  self:Close()
  massagePool:pop_back()
end

HandleClicked_MessageHistory_NextMSG = function()
  -- function num : 0_10 , upvalues : MessageHistory
  local self = MessageHistory
  self:Update(true)
end

HandleClicked_MessageHistory_DoFuncMSG = function()
  -- function num : 0_11 , upvalues : MessageHistory
  local self = MessageHistory
  if self.thisPage < self.msgCount then
    self:Update(true)
  else
    HandleClicked_MessageHistory_Close()
  end
end

HandleClicked_MessageHistory_Open = function()
  -- function num : 0_12 , upvalues : MessageHistory
  local self = MessageHistory
  if self.msgCount == 0 then
    return 
  end
  self:PrintMsg()
end

messageHistory_AfterUIRestore = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_13 , upvalues : MessageHistory
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  local self = MessageHistory
  if self.msgCount == 0 then
    return 
  end
  self:PrintMsg()
end

FGlobal_StealMSG = function(notifyMsg)
  -- function num : 0_14 , upvalues : thisWidgetComplete, Acquire_Enum, objectMessage, productLevelUpObejctMessage, MessageHistory
  if not thisWidgetComplete then
    return 
  end
  local arcType = notifyMsg._msgType
  local arcObjectMsg = nil
  if Acquire_Enum.GainProductSkillPoint == arcType or Acquire_Enum.GainCombatSkillPoint == arcType or Acquire_Enum.GainGuildSkillPoint == arcType or Acquire_Enum.LearnGuildSkill == arcType then
    arcObjectMsg = objectMessage[arcType]
    FGlobal_MessageHistory_InputMSG(0, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_GETSKILLPOINT", "arcObjectMsg", arcObjectMsg), 0)
  else
    if Acquire_Enum.LearnSkill == arcType or Acquire_Enum.SkillLearnable == arcType then
      local skillSSW = notifyMsg:getSkillStaticstatusWrapper()
      if skillSSW ~= nil then
        local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
        if skillTypeSSW ~= nil then
          arcObjectMsg = skillTypeSSW:getName()
          FGlobal_MessageHistory_InputMSG(0, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_LEARNSKILL", "arcObjectMsg", arcObjectMsg), 0)
        end
      end
    else
      do
        if Acquire_Enum.SkillAwakened == arcType then
          local skillTypeSSW = notifyMsg:getSkillTypeStaticStatusWrapper()
          if skillTypeSSW ~= nil then
            arcObjectMsg = skillTypeSSW:getName()
            FGlobal_MessageHistory_InputMSG(0, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_SKILLAWAKENED", "arcObjectMsg", arcObjectMsg), 0)
          end
        else
          do
            if Acquire_Enum.GetRareItem == arcType then
              local itemEnchantSSW = notifyMsg:getItemEnchantStaticStatusWrapper()
              if itemEnchantSSW ~= nil then
                arcObjectMsg = itemEnchantSSW:getName()
                local arcItemGrade = (itemEnchantSSW:getGradeType())
                local ItemNamecolor = nil
                if arcItemGrade == 0 then
                  ItemNamecolor = "FFC4BEBE"
                else
                  if arcItemGrade == 1 then
                    ItemNamecolor = "FF5DFF70"
                  else
                    if arcItemGrade == 2 then
                      ItemNamecolor = "FF4B97FF"
                    else
                      if arcItemGrade == 3 then
                        ItemNamecolor = "FFFFC832"
                      else
                        if arcItemGrade == 4 then
                          ItemNamecolor = "FFFF6C00"
                        else
                          ItemNamecolor = "FFC4BEBE"
                        end
                      end
                    end
                  end
                end
                FGlobal_MessageHistory_InputMSG(0, PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_GETRAREITEM", "ItemNamecolor", ItemNamecolor, "arcObjectMsg", arcObjectMsg), 0)
              end
            else
              do
                if Acquire_Enum.UpgradeExplorationNode == arcType then
                  local explorationSSW = notifyMsg:getExplorationStaticStatusWrapper()
                  if explorationSSW ~= nil then
                    if Acquire_Enum.Viliage == (explorationSSW:get())._nodeType or Acquire_Enum.City == (explorationSSW:get())._nodeType then
                      defaultMsg = objectMessage[arcType]
                      arcObjectMsg = explorationSSW:getName()
                    else
                      arcObjectMsg = explorationSSW:getName()
                    end
                  end
                  FGlobal_MessageHistory_InputMSG(0, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_UPGRADEEXPLORATIONNODE", "arcObjectMsg", arcObjectMsg), 0)
                else
                  do
                    if Acquire_Enum.LearnMentalCard == arcType then
                      local mentalCardSSW = notifyMsg:getMentalCardStaticStatusWrapper()
                      arcObjectMsg = mentalCardSSW:getName()
                      FGlobal_MessageHistory_InputMSG(0, PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_LEARNMENTALCARD", "arcObjectMsg", arcObjectMsg), 0)
                    else
                      do
                        if Acquire_Enum.ServantLevelUp == arcType then
                          local temporaryWrapper = getTemporaryInformationWrapper()
                          local servantWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
                          local servantName = servantWrapper:getName()
                          local servantLevel = servantWrapper:getLevel()
                          FGlobal_MessageHistory_InputMSG(0, PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_SERVANTLEVELUP", "servantName", servantName, "servantLevel", servantLevel), 0)
                        else
                          do
                            if Acquire_Enum.GainExplorePoint == arcType then
                              FGlobal_MessageHistory_InputMSG(0, PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_GAINEXPLOREPOINT"), 0)
                            else
                              if Acquire_Enum.MentalThemeComplete == arcType then
                                local mentalThemeSSW = notifyMsg:getMentalThemeStaticStatus()
                                if mentalThemeSSW ~= nil then
                                  arcObjectMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACQUIRE_MESSAGE_MENTALTHEMECOMPLETE_BODY", "wp", mentalThemeSSW:getIncreaseMaxWp())
                                  defaultMsg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACQUIRE_MESSAGE_MENTALTHEMECOMPLETE_HEAD", "theme", mentalThemeSSW:getName())
                                end
                                FGlobal_MessageHistory_InputMSG(0, defaultMsg .. " " .. arcObjectMsg, 0)
                              else
                                do
                                  if Acquire_Enum.ProductLevelUp == arcType then
                                    local arcParam = Int64toInt32(notifyMsg._Param) + 1
                                    arcObjectMsg = productLevelUpObejctMessage[arcParam]
                                    FGlobal_MessageHistory_InputMSG(0, arcObjectMsg, 0)
                                  else
                                    do
                                      if Acquire_Enum.ServantLearnSkill == arcType then
                                        local temporaryWrapper = getTemporaryInformationWrapper()
                                        local servantWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
                                        local servantName = servantWrapper:getName()
                                        local servantLevel = servantWrapper:getLevel()
                                        local skillKey = Int64toInt32(notifyMsg._Param)
                                        local skillWrapper = servantWrapper:getSkill(learnSkillKey)
                                        FGlobal_MessageHistory_InputMSG(0, PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_SERVANTLEARNSKILL", "servantName", servantName, "getName", skillWrapper:getName()), 0)
                                      else
                                        do
                                          if Acquire_Enum.ServantSkillMaster == arcType then
                                            local temporaryWrapper = getTemporaryInformationWrapper()
                                            local servantWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
                                            local servantName = servantWrapper:getName()
                                            local servantLevel = servantWrapper:getLevel()
                                            local skillKey = Int64toInt32(notifyMsg._Param)
                                            local skillWrapper = servantWrapper:getSkill(learnSkillKey)
                                            FGlobal_MessageHistory_InputMSG(0, PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MESSAGEHISTORY_STEALMSG_SERVANTSKILLMASTER", "servantName", servantName, "getName", skillWrapper:getName()), 0)
                                          end
                                          do
                                            -- DECOMPILER ERROR at PC370: Confused about usage of register: R3 in 'UnsetPending'

                                            MessageHistory.elapsedTime = 0
                                            -- DECOMPILER ERROR at PC372: Confused about usage of register: R3 in 'UnsetPending'

                                            MessageHistory.hideAniPlay = false
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

FromClient_MessageHistoryBTN_BounceLoop = function()
  -- function num : 0_15 , upvalues : UI_ANI_ADV, screenX, screenY
  if Panel_MessageHistory_BTN:GetShow() then
    local panelSizeX = Panel_MessageHistory_BTN:GetSizeX()
    local panelSizeY = Panel_MessageHistory_BTN:GetSizeY()
    local MoveAni1 = Panel_MessageHistory_BTN:addMoveAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    MoveAni1:SetStartPosition(screenX - panelSizeX - (Panel_MessageHistory_BTN:GetSpanSize()).x, screenY - panelSizeY)
    MoveAni1:SetEndPosition(screenX - panelSizeX - (Panel_MessageHistory_BTN:GetSpanSize()).x, screenY - panelSizeY - 15)
    MoveAni1.IsChangeChild = true
    local MoveAni2 = Panel_MessageHistory_BTN:addMoveAnimation(0.2, 0.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    MoveAni2:SetStartPosition(screenX - panelSizeX - (Panel_MessageHistory_BTN:GetSpanSize()).x, screenY - panelSizeY - 15)
    MoveAni2:SetEndPosition(screenX - panelSizeX - (Panel_MessageHistory_BTN:GetSpanSize()).x, screenY - panelSizeY)
    MoveAni2.IsChangeChild = true
  else
    do
      do return  end
    end
  end
end

MessageHistory.registEventHandler = function(self)
  -- function num : 0_16
  (self.closeBTN):addInputEvent("Mouse_LUp", "HandleClicked_MessageHistory_Close()")
  ;
  (self.BTN_Next):addInputEvent("Mouse_LUp", "HandleClicked_MessageHistory_NextMSG()")
  ;
  (self.BTN_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_MessageHistory_DoFuncMSG()")
  ;
  (self.badgesBTN):addInputEvent("Mouse_LUp", "HandleClicked_MessageHistory_Open()")
end

MessageHistory.registMessageHandler = function(self)
  -- function num : 0_17
  registerEvent("EventChattingMessageUpdate", "FromClient_MessageHistoryBTN_BounceLoop")
  Panel_MessageHistory:RegisterUpdateFunc("MessageHistory_AutoShowOff")
end

MessageHistory_AutoShowOff = function(deltaTime)
  -- function num : 0_18 , upvalues : MessageHistory, UI_ANI_ADV, screenX, panelSizeX, screenY, panelSizeY
  local self = MessageHistory
  self.elapsedTime = self.elapsedTime + deltaTime
  if self.elapsedTime > 5 and self.hideAniPlay == false then
    local MoveAni3 = Panel_MessageHistory:addMoveAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    MoveAni3:SetStartPosition(screenX - panelSizeX - 10, screenY - panelSizeY - 30)
    MoveAni3:SetEndPosition(screenX - panelSizeX - 10, screenY - panelSizeY - 40)
    MoveAni3.IsChangeChild = true
    local MoveAni4 = Panel_MessageHistory:addMoveAnimation(0.1, 0.4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    MoveAni4:SetStartPosition(screenX - panelSizeX - 10, screenY - panelSizeY - 40)
    MoveAni4:SetEndPosition(screenX - panelSizeX - 10, screenY)
    MoveAni4.IsChangeChild = true
    self.hideAniPlay = true
  else
    do
      if self.elapsedTime > 5.5 then
        self.elapsedTime = 0
        self:Close()
      end
    end
  end
end

MessageHistory:init()
MessageHistory:registEventHandler()
MessageHistory:registMessageHandler()
registerEvent("FromClient_RenderModeChangeState", "messageHistory_AfterUIRestore")

