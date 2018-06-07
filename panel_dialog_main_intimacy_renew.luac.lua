-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_dialog_main_intimacy_renew.luac 

-- params : ...
-- function num : 0
local Panel_Dialog_Main_Intimacy_Info = {_initialize = false, 
_ui = {static_IntimacyBg = (UI.getChildControl)(Panel_Dialog_Main, "Static_IntimacyBg"), static_IntimacyProgressBg = nil, circularProgress_IntimacyProgress = nil, static_RewardIconTemplete = nil, staticText_RewardTemplete = nil, 
static_Reward_List = {nil, nil, nil, nil, nil, nil, nil, nil, nil}
, staticText_CurrentIntimacyPoint = nil, staticText_Intimacy_Title = nil}
, 
_config = {maxIntimacyRewardCount = 8}
, 
_text = {hasMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASMENTALCARD"), hasntMentalCardText = PAGetString(Defines.StringSheet_GAME, "LUA_INTIMACY_INFORMATION_HASNTMENTALCARD")}
, 
_pos = {
rewardTextPos = {X = nil, Y = nil}
}
, 
_space = {progressToReward = 64, rewardTextHBorder = 27}
, 
_intimacyIcon = {
[0] = {
[1] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 38, y1 = 200, x2 = 65, y2 = 227}
, 
[2] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 94, y1 = 200, x2 = 121, y2 = 227}
, 
[3] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 66, y1 = 200, x2 = 93, y2 = 227}
}
, 
[1] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 150, y1 = 200, x2 = 177, y2 = 227}
, 
[2] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 122, y1 = 200, x2 = 149, y2 = 227}
, 
[3] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 178, y1 = 200, x2 = 205, y2 = 227}
, 
[4] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 231, y1 = 1, x2 = 253, y2 = 23}
, 
[5] = {texture = "Renewal/UI_Icon/Console_Icon_00.dds", x1 = 231, y1 = 24, x2 = 205, y2 = 227}
}
, _math_AddVectorToVector = (Util.Math).AddVectorToVector, _math_MulNumberToVector = (Util.Math).MulNumberToVector}
Panel_Dialog_Main_Intimacy_Info.registerMessageHandler = function(self)
  -- function num : 0_0
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog_Intimacy")
  registerEvent("FromClient_VaryIntimacy", "FromClient_Update_MainDialog_Intimacy")
end

FromClient_Update_MainDialog_Intimacy = function()
  -- function num : 0_1
  PaGlobalFunc_MainDialog_Intimacy_Update()
end

Panel_Dialog_Main_Intimacy_Info.initialize = function(self)
  -- function num : 0_2
  self:close()
  self:initControl()
  self._initialize = true
  self:registerMessageHandler()
end

Panel_Dialog_Main_Intimacy_Info.initControl = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).static_IntimacyProgressBg = (UI.getChildControl)((self._ui).static_IntimacyBg, "Static_IntimacyProgressBg")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).circularProgress_IntimacyProgress = (UI.getChildControl)((self._ui).static_IntimacyBg, "CircularProgress_IntimacyProgress")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_RewardIconTemplete = (UI.getChildControl)((self._ui).static_IntimacyBg, "Static_RewardIconTemplete")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_RewardTemplete = (UI.getChildControl)((self._ui).static_IntimacyBg, "StaticText_RewardTemplete")
  for index = 0, (self._config).maxIntimacyRewardCount - 1 do
    local reward_slot = {}
    reward_slot.reward_Icon = (UI.createAndCopyBasePropertyControl)((self._ui).static_IntimacyBg, "Static_RewardIconTemplete", (self._ui).static_IntimacyBg, "Reward_Icon_" .. index)
    reward_slot.reward = (UI.createAndCopyBasePropertyControl)((self._ui).static_IntimacyBg, "StaticText_RewardTemplete", (self._ui).static_IntimacyBg, "Reward" .. index)
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).static_Reward_List)[index] = reward_slot
  end
  ;
  ((self._ui).static_RewardIconTemplete):SetShow(false)
  ;
  ((self._ui).staticText_RewardTemplete):SetShow(false)
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_CurrentIntimacyPoint = (UI.getChildControl)((self._ui).static_IntimacyBg, "StaticText_CurrentIntimacyPoint")
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Intimacy_Title = (UI.getChildControl)((self._ui).static_IntimacyBg, "StaticText_Title")
end

Panel_Dialog_Main_Intimacy_Info.open = function(self)
  -- function num : 0_4
  ((self._ui).static_IntimacyBg):SetShow(true)
end

Panel_Dialog_Main_Intimacy_Info.close = function(self)
  -- function num : 0_5
  ((self._ui).static_IntimacyBg):SetShow(false)
end

Panel_Dialog_Main_Intimacy_Info.update = function(self)
  -- function num : 0_6
  self:close()
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    ToClient_PopDialogueFlush()
    return 
  end
  local talker = dialog_getTalker()
  if talker ~= nil then
    local characterKey = talker:getCharacterKey()
    local npcData = getNpcInfoByCharacterKeyRaw(characterKey, (talker:get()):getDialogIndex())
    if npcData ~= nil and npcData:hasSpawnType((CppEnums.SpawnType).eSpawnType_intimacy) == true then
      self:open()
      local intimacy = getIntimacyByCharacterKey(characterKey)
      local valuePercent = intimacy / 1000 * 100
      if valuePercent > 100 then
        valuePercent = 100
      end
      ;
      ((self._ui).circularProgress_IntimacyProgress):SetProgressRate(valuePercent)
      ;
      ((self._ui).staticText_CurrentIntimacyPoint):SetText(intimacy)
      self:Update_Intimacy_reward(characterKey, intimacy)
    end
  end
end

Panel_Dialog_Main_Intimacy_Info.Resize = function(self)
  -- function num : 0_7
  ((self._ui).static_IntimacyBg):ComputePos()
  ;
  ((self._ui).circularProgress_IntimacyProgress):ComputePos()
  ;
  ((self._ui).staticText_CurrentIntimacyPoint):ComputePos()
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._pos).rewardTextPos).X = ((self._ui).static_IntimacyProgressBg):GetPosX()
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._pos).rewardTextPos).Y = ((self._ui).static_IntimacyProgressBg):GetSizeY() + (self._space).progressToReward
end

Panel_Dialog_Main_Intimacy_Info.Update_Intimacy_reward = function(self, characterKey, indimacy)
  -- function num : 0_8
  local count = getIntimacyInformationCount(characterKey)
  local QuestCount = 1
  for index = 0, (self._config).maxIntimacyRewardCount - 1 do
    if index < count then
      local intimacyInformationData = getIntimacyInformation(characterKey, index)
      if intimacyInformationData ~= nil then
        local percent = intimacyInformationData:getIntimacy() / 1000
        local imageType = intimacyInformationData:getTypeIndex()
        local giftName = intimacyInformationData:getTypeName()
        local giftDesc = intimacyInformationData:getTypeDescription()
        local giftMentalCardWrapper = ToClinet_getMentalCardStaticStatus(intimacyInformationData:getMentalCardKeyRaw())
        if giftMentalCardWrapper ~= nil then
          if giftMentalCardWrapper:isHasCard() then
            giftDesc = giftDesc .. (self._text).hasMentalCardText
          else
            giftDesc = giftDesc .. (self._text).hasntMentalCardText
          end
        end
        local RewardIcon = (((self._ui).static_Reward_List)[index]).reward_Icon
        local Rewardtext = (((self._ui).static_Reward_List)[index]).reward
        local IconType = nil
        if imageType == 0 then
          IconType = ((self._intimacyIcon)[imageType])[QuestCount]
          QuestCount = QuestCount + 1
          if QuestCount > 3 then
            QuestCount = 3
          end
        else
          IconType = (self._intimacyIcon)[imageType]
        end
        RewardIcon:ChangeTextureInfoName(IconType.texture)
        local x1, y1, x2, y2 = setTextureUV_Func(RewardIcon, IconType.x1, IconType.y1, IconType.x2, IconType.y2)
        ;
        (RewardIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
        RewardIcon:setRenderTexture(RewardIcon:getBaseTexture())
        RewardIcon:SetShow(true)
        Rewardtext:ChangeTextureInfoName(IconType.texture)
        local x1, y1, x2, y2 = setTextureUV_Func(Rewardtext, IconType.x1, IconType.y1, IconType.x2, IconType.y2)
        ;
        (Rewardtext:getBaseTexture()):setUV(x1, y1, x2, y2)
        Rewardtext:setRenderTexture(Rewardtext:getBaseTexture())
        Rewardtext:SetShow(true)
        if percent >= 0 and percent <= 1 and ToClient_checkIntimacyInformationFixedState(intimacyInformationData) then
          local angle = math.pi * 2 * percent
          local lineStart = float3((math.sin)(angle), -(math.cos)(angle), 0)
          local lineEnd = float3((math.sin)(angle), -(math.cos)(angle), 0)
          local startSize = 28
          local ProgressBG = (self._ui).static_IntimacyProgressBg
          local endSize = (ProgressBG:GetSizeX() + ((self._ui).static_RewardIconTemplete):GetSizeX()) / 2
          local centerPosition = float3(ProgressBG:GetPosX() + ProgressBG:GetSizeX() / 2, ProgressBG:GetPosY() + ProgressBG:GetSizeY() / 2, 0)
          lineStart = (self._math_AddVectorToVector)(centerPosition, (self._math_MulNumberToVector)(lineStart, startSize))
          lineEnd = (self._math_AddVectorToVector)(centerPosition, (self._math_MulNumberToVector)(lineEnd, endSize))
          RewardIcon:SetPosX(lineEnd.x - RewardIcon:GetSizeX() / 2)
          RewardIcon:SetPosY(lineEnd.y - RewardIcon:GetSizeY() / 2)
        end
        do
          do
            do
              local PosY = ((self._pos).rewardTextPos).Y + index * (self._space).rewardTextHBorder
              Rewardtext:SetPosY(PosY)
              Rewardtext:SetText(giftName .. ":" .. giftDesc)
              if indimacy < percent * 1000 then
                RewardIcon:SetColor((Defines.Color).C_FF888888)
                Rewardtext:SetColor((Defines.Color).C_FF888888)
                Rewardtext:SetFontColor((Defines.Color).C_FF888888)
              else
                RewardIcon:SetColor((Defines.Color).C_FFEFEFEF)
                Rewardtext:SetColor((Defines.Color).C_FFEFEFEF)
                Rewardtext:SetFontColor((Defines.Color).C_FFEFEFEF)
              end
              ;
              ((((self._ui).static_Reward_List)[index]).reward_Icon):SetShow(false)
              ;
              ((((self._ui).static_Reward_List)[index]).reward):SetShow(false)
              -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

PaGlobalFunc_MainDialog_Intimacy_Open = function()
  -- function num : 0_9 , upvalues : Panel_Dialog_Main_Intimacy_Info
  local self = Panel_Dialog_Main_Intimacy_Info
  self:open()
end

PaGlobalFunc_MainDialog_Intimacy_Close = function()
  -- function num : 0_10 , upvalues : Panel_Dialog_Main_Intimacy_Info
  local self = Panel_Dialog_Main_Intimacy_Info
  self:close()
end

PaGlobalFunc_MainDialog_Intimacy_Update = function()
  -- function num : 0_11 , upvalues : Panel_Dialog_Main_Intimacy_Info
  local self = Panel_Dialog_Main_Intimacy_Info
  self:update()
end

FromClient_InitMainDialog_Intimacy = function()
  -- function num : 0_12 , upvalues : Panel_Dialog_Main_Intimacy_Info
  local self = Panel_Dialog_Main_Intimacy_Info
  self:initialize()
  self:Resize()
end

FromClient_onScreenResize_MainDialog_Intimacy = function()
  -- function num : 0_13 , upvalues : Panel_Dialog_Main_Intimacy_Info
  local self = Panel_Dialog_Main_Intimacy_Info
  self:Resize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog_Intimacy")

