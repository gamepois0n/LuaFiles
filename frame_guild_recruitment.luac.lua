-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\frame_guild_recruitment.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_classType = CppEnums.ClassType
local UI_TM = CppEnums.TextMode
Panel_Guild_Recruitment:SetShow(false)
local defaultFrameBG_Recruitment = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_RecruitmentBG")
local GuildRecruitment = {scroll = (UI.getChildControl)(Panel_Guild_Recruitment, "Scroll_Recruitment"), selectedPlayer = -1, maxSlotCount = 8, maxPlayerList = 22, SlotCols = 1, _startIndex = 0, 
slotPool = {}
}
;
(GuildRecruitment.scroll):addInputEvent("Mouse_UpScroll", "GuildRecuit_ScrollEvent( true )")
;
(GuildRecruitment.scroll):addInputEvent("Mouse_DownScroll", "GuildRecuit_ScrollEvent( false )")
;
(UIScroll.InputEvent)(GuildRecruitment.scroll, "GuildRecuit_ScrollEvent")
local unjoinPlayerList = {}
local classPicture = {
[UI_classType.ClassType_Warrior] = {1, 1, 96, 145}
, 
[UI_classType.ClassType_Ranger] = {97, 1, 192, 145}
, 
[UI_classType.ClassType_Sorcerer] = {193, 1, 288, 145}
, 
[UI_classType.ClassType_Giant] = {289, 1, 384, 145}
, 
[UI_classType.ClassType_Tamer] = {385, 1, 480, 145}
, 
[UI_classType.ClassType_BladeMaster] = {1, 146, 96, 290}
, 
[UI_classType.ClassType_BladeMasterWomen] = {193, 146, 288, 290}
, 
[UI_classType.ClassType_Valkyrie] = {97, 146, 192, 290}
, 
[UI_classType.ClassType_Wizard] = {289, 146, 384, 290}
, 
[UI_classType.ClassType_WizardWomen] = {385, 146, 480, 290}
, 
[UI_classType.ClassType_NinjaWomen] = {1, 291, 96, 435}
, 
[UI_classType.ClassType_NinjaMan] = {97, 291, 192, 435}
, 
[UI_classType.ClassType_DarkElf] = {193, 291, 288, 435}
, 
[UI_classType.ClassType_Combattant] = {289, 291, 384, 435}
, 
[UI_classType.ClassType_CombattantWomen] = {385, 291, 480, 435}
}
Guild_Recruitment_Initialize = function()
  -- function num : 0_0 , upvalues : GuildRecruitment, UI_TM, defaultFrameBG_Recruitment
  local self = GuildRecruitment
  local slotStartY = 47
  local slotGapY = 145
  for slotIdx = 0, self.maxSlotCount - 1 do
    local posX = 10 + 350 * (slotIdx % 2)
    local posY = slotStartY + slotGapY * (math.floor)(slotIdx / 2)
    local slot = {}
    slot.bg = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Recruitment, "Static_SampleBg", Panel_Guild_Recruitment, "GuildRecruitment_BG_" .. slotIdx)
    ;
    (slot.bg):SetPosX(posX)
    ;
    (slot.bg):SetPosY(posY)
    ;
    (slot.bg):addInputEvent("Mouse_UpScroll", "GuildRecuit_ScrollEvent( true )")
    ;
    (slot.bg):addInputEvent("Mouse_DownScroll", "GuildRecuit_ScrollEvent( false )")
    slot.charPic = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Recruitment, "Static_CharacterPic", slot.bg, "GuildRecruitment_CharPic_" .. slotIdx)
    ;
    (slot.charPic):SetPosX(7)
    ;
    (slot.charPic):SetPosY(12)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Recruitment, "StaticText_FamilyName", slot.bg, "GuildRecruitment_Name_" .. slotIdx)
    ;
    (slot.name):SetPosX(86)
    ;
    (slot.name):SetPosY(5)
    slot.class = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Recruitment, "StaticText_CharacterLv", slot.bg, "GuildRecruitment_Lv_" .. slotIdx)
    ;
    (slot.class):SetPosX(276)
    ;
    (slot.class):SetPosY(25)
    slot.intro = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Recruitment, "StaticText_SelfIntro", slot.bg, "GuildRecruitment_Intro_" .. slotIdx)
    ;
    (slot.intro):SetPosX(90)
    ;
    (slot.intro):SetPosY(50)
    ;
    (slot.intro):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    ;
    (slot.intro):setLineCountByLimitAutoWrap(3)
    slot.btnRecruit = (UI.createAndCopyBasePropertyControl)(Panel_Guild_Recruitment, "Button_Recruit", slot.bg, "GuildRecruitment_Recruit_" .. slotIdx)
    ;
    (slot.btnRecruit):SetPosX(150)
    ;
    (slot.btnRecruit):SetPosY(105)
    ;
    (slot.btnRecruit):addInputEvent("Mouse_UpScroll", "GuildRecuit_ScrollEvent( true )")
    ;
    (slot.btnRecruit):addInputEvent("Mouse_DownScroll", "GuildRecuit_ScrollEvent( false )")
    -- DECOMPILER ERROR at PC156: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self.slotPool)[slotIdx] = slot
  end
  defaultFrameBG_Recruitment:addInputEvent("Mouse_UpScroll", "GuildRecuit_ScrollEvent( true )")
  defaultFrameBG_Recruitment:addInputEvent("Mouse_DownScroll", "GuildRecuit_ScrollEvent( false )")
  defaultFrameBG_Recruitment:MoveChilds(defaultFrameBG_Recruitment:GetID(), Panel_Guild_Recruitment)
  ;
  (UI.deletePanel)(Panel_Guild_Recruitment:GetID())
end

GuildRecruitment.Update = function(self)
  -- function num : 0_1 , upvalues : UI_classType, classPicture, UI_color
  for slotIdx = 0, self.maxSlotCount - 1 do
    local slot = (self.slotPool)[slotIdx]
    ;
    (slot.bg):SetShow(false)
  end
  local replaceClassType = function(classNo)
    -- function num : 0_1_0 , upvalues : UI_classType
    local returnValue = ""
    if UI_classType.ClassType_Warrior == classNo then
      returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WARRIOR")
    else
      if UI_classType.ClassType_Ranger == classNo then
        returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_RANGER")
      else
        if UI_classType.ClassType_Sorcerer == classNo then
          returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_SORCERER")
        else
          if UI_classType.ClassType_Giant == classNo then
            returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_GIANT")
          else
            if UI_classType.ClassType_Tamer == classNo then
              returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_TAMER")
            else
              if UI_classType.ClassType_BladeMaster == classNo then
                returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_BLADEMASTER")
              else
                if UI_classType.ClassType_BladeMasterWomen == classNo then
                  returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_BLADEMASTERWOMAN")
                else
                  if UI_classType.ClassType_Valkyrie == classNo then
                    returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_VALKYRIE")
                  else
                    if UI_classType.ClassType_Wizard == classNo then
                      returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WIZARD")
                    else
                      if UI_classType.ClassType_WizardWomen == classNo then
                        returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WIZARDWOMAN")
                      else
                        if UI_classType.ClassType_Kunoichi == classNo then
                          returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_KUNOICHI")
                        else
                          if UI_classType.ClassType_NinjaWomen == classNo then
                            returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_NINJAWOMEN")
                          else
                            if UI_classType.ClassType_NinjaMan == classNo then
                              returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_NINJAMAN")
                            else
                              if UI_classType.ClassType_DarkElf == classNo then
                                returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_DARKELF")
                              else
                                if UI_classType.ClassType_Combattant == classNo then
                                  returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_STRIKER")
                                else
                                  if UI_classType.ClassType_CombattantWomen == classNo then
                                    returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_COMBATTANTWOMEN")
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
    return returnValue
  end

  local guildUnjoinedCount = ToClient_GetGuildUnjoinedPlayerCount()
  local playerCount = (math.min)(guildUnjoinedCount, self.maxPlayerList)
  local viewCount = (math.min)(playerCount, self.maxSlotCount)
  if self.maxSlotCount < playerCount then
    (self.scroll):SetShow(true)
  else
    ;
    (self.scroll):SetShow(false)
  end
  local realIndex = 0
  slotIdx = self._startIndex
  for index = 0, playerCount - 1 do
    local unjoinPlayerWrapper = ToClient_GetGuildUnjoinedPlayerAt(slotIdx)
    if unjoinPlayerWrapper ~= nil and unjoinPlayerWrapper:getLevel() > 5 and realIndex < self.maxSlotCount then
      local playerLevel = unjoinPlayerWrapper:getLevel()
      local playerClass = unjoinPlayerWrapper:getClassType()
      local playerNickName = unjoinPlayerWrapper:getUserNickName()
      local playerName = unjoinPlayerWrapper:getCharacterName()
      local isWant = unjoinPlayerWrapper:doWant()
      local playerIntro = unjoinPlayerWrapper:getUserIntroduction()
      if playerIntro == nil or playerIntro == "" then
        playerIntro = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO_NODATA")
      end
      local slot = (self.slotPool)[realIndex]
      ;
      (slot.bg):SetShow(true)
      ;
      (slot.charPic):ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/Lobby_ClassSelect_00.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.charPic, (classPicture[playerClass])[1], (classPicture[playerClass])[2], (classPicture[playerClass])[3], (classPicture[playerClass])[4])
      ;
      ((slot.charPic):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.charPic):setRenderTexture((slot.charPic):getBaseTexture())
      ;
      (slot.name):SetText(playerNickName .. "(" .. playerName .. ")")
      ;
      (slot.class):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INTRODUCTIONMYSELF_SUBINFO", "class", replaceClassType(playerClass), "level", playerLevel))
      ;
      (slot.intro):SetText(playerIntro)
      ;
      (slot.intro):SetShow(true)
      local fontColor = nil
      if isWant == true then
        fontColor = UI_color.C_FFEE7001
      else
        fontColor = UI_color.C_FFEFEFEF
      end
      ;
      (slot.btnRecruit):addInputEvent("Mouse_LUp", "GuildRecruitment_SelectPlayer( " .. slotIdx .. ", " .. realIndex .. " )")
      ;
      (slot.bg):addInputEvent("Mouse_On", "GuildRecruit_Tooltip(" .. slotIdx .. ", " .. realIndex .. ")")
      ;
      (slot.bg):addInputEvent("Mouse_Out", "GuildRecruit_Tooltip()")
      slotIdx = slotIdx + 1
      realIndex = realIndex + 1
    end
  end
  ;
  (UIScroll.SetButtonSize)(self.scroll, self.maxSlotCount, (math.ceil)(playerCount / 2))
end

GuildRecruitment_SelectPlayer = function(idx, uiIdx)
  -- function num : 0_2 , upvalues : GuildRecruitment, IM
  local self = GuildRecruitment
  local parentSlot = ((self.slotPool)[uiIdx]).bg
  self.selectedPlayer = idx
  local unjoinPlayerWrapper = ToClient_GetGuildUnjoinedPlayerAt(idx)
  local playerNickName = unjoinPlayerWrapper:getUserNickName()
  local playerName = unjoinPlayerWrapper:getCharacterName()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  FGlobal_ChattingInput_ShowWhisper(playerName)
end

GuildRecruit_Tooltip = function(index, count)
  -- function num : 0_3 , upvalues : GuildRecruitment
  if index == nil then
    TooltipSimple_Hide()
    return 
  end
  local unjoinPlayerList = ToClient_GetGuildUnjoinedPlayerAt(index)
  local name = unjoinPlayerList:getCharacterName() .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO")
  local desc = unjoinPlayerList:getUserIntroduction()
  local uiControl = ((GuildRecruitment.slotPool)[count]).bg
  if desc == nil or desc == "" then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO_NODATA")
  end
  TooltipSimple_Show(uiControl, name, desc)
end

Guild_Recruitment_Open = function()
  -- function num : 0_4 , upvalues : GuildRecruitment, defaultFrameBG_Recruitment
  local self = GuildRecruitment
  defaultFrameBG_Recruitment:SetShow(true)
  ToClient_RequestGuildUnjoinedPlayerList()
  self._startIndex = 0
  ;
  (self.scroll):SetControlTop()
  GuildRecruitment:Update()
end

GuildRecuit_ScrollEvent = function(isUp)
  -- function num : 0_5 , upvalues : GuildRecruitment
  local self = GuildRecruitment
  if isUp then
    if self._startIndex < 2 then
      return 
    end
    self._startIndex = self._startIndex - 2
  else
    local guildUnjoinedCount = ToClient_GetGuildUnjoinedPlayerCount()
    local playerCount = (math.min)(guildUnjoinedCount, self.maxPlayerList)
    if self.maxPlayerList < self._startIndex + self.maxSlotCount + 2 then
      return 
    else
      if playerCount <= self._startIndex + self.maxSlotCount then
        return 
      end
    end
    self._startIndex = self._startIndex + 2
  end
  do
    self:Update()
  end
end

FGolbal_Guild_Recruitment_SelectPlayerClose = function()
  -- function num : 0_6
  GuildRecruitment_InvitePlayer_Close()
end

FGolbal_Guild_Recruitment_SelectPlayerCheck = function()
  -- function num : 0_7
  return false
end

Guild_Recruitment_Close = function()
  -- function num : 0_8 , upvalues : defaultFrameBG_Recruitment
  defaultFrameBG_Recruitment:SetShow(false)
end


