-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\charactertag\panel_window_charactertag.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_Class = CppEnums.ClassType
local UI_DefaultFaceTexture = CppEnums.ClassType_DefaultFaceTexture
local PP = CppEnums.PAUIMB_PRIORITY
local ePcWorkingType = CppEnums.PcWorkType
local const_64 = Defines.s64_const
local isDev = ToClient_IsDevelopment()
local isOpenCharacterTag = ToClient_IsContentsGroupOpen("330")
local localDefine = {CHARSLOTCOLMAX = 6, CHARSLOTROWMAX = 2, CHARSLOTLISTMAX = 12, SCROLLVERTICAL = 270, NODUEL = -1}
local CharacterTag = {_doTag = false, 
_UI = {_StaticText_TagAreaValue, _Static_MainImage_1, _Static_MainImage_2, _CheckButton_TagState, _Button_Question, _Button_Close, _CheckButton_PopUp, _StaticText_Name_1, _StaticText_Name_2, _Scroll_Tag, _Scroll_CtrlButton, _StaticText_Desc; 
_Static_CharacterList = {}
}
, _requestCharacterKey = -1, _currentTagState = false, _selfCharTag = false, _maxCharacterCount = 0, _pageIndex = 0}
CharacterTag.Initialize = function(self)
  -- function num : 0_0
  local selfUI = self._UI
  selfUI._StaticText_TagAreaValue = (UI.getChildControl)(Panel_CharacterTag, "StaticText_TagAreaValue")
  local aaa = (UI.getChildControl)(Panel_CharacterTag, "Static_MainImageBorder_1")
  selfUI._Static_MainImage_1 = (UI.getChildControl)(Panel_CharacterTag, "Static_MainImage_1")
  selfUI._Static_MainImage_2 = (UI.getChildControl)(Panel_CharacterTag, "Static_MainImage_2")
  selfUI._Static_QuestionIcon_2 = (UI.getChildControl)(selfUI._Static_MainImage_2, "Static_QuestionIcon")
  selfUI._CheckButton_TagState = (UI.getChildControl)(Panel_CharacterTag, "CheckButton_TagState")
  selfUI._Button_Close = (UI.getChildControl)(Panel_CharacterTag, "Button_Close")
  ;
  (selfUI._Button_Close):addInputEvent("Mouse_LUp", "PaGlobal_CharacterTag_Close()")
  selfUI._CheckButton_PopUp = (UI.getChildControl)(Panel_CharacterTag, "CheckButton_PopUp")
  ;
  (selfUI._CheckButton_PopUp):addInputEvent("Mouse_LUp", "CharacterTag_PopUp_UI()")
  ;
  (selfUI._CheckButton_PopUp):addInputEvent("Mouse_On", "CharacterTag_PopUp_ShowIconToolTip(true)")
  ;
  (selfUI._CheckButton_PopUp):addInputEvent("Mouse_Out", "CharacterTag_PopUp_ShowIconToolTip(false)")
  selfUI._StaticText_Name_1 = (UI.getChildControl)(Panel_CharacterTag, "StaticText_Name_1")
  selfUI._StaticText_Name_2 = (UI.getChildControl)(Panel_CharacterTag, "StaticText_Name_2")
  local descBg = (UI.getChildControl)(Panel_CharacterTag, "Static_DescBg")
  selfUI._StaticText_Desc = (UI.getChildControl)(descBg, "StaticText_Desc")
  ;
  (selfUI._StaticText_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERTAG_DESC"))
  ;
  (selfUI._StaticText_Desc):SetShow(true)
  local templateCharacterList = (UI.getChildControl)(Panel_CharacterTag, "Static_TemPleate_CharacterImageBorder")
  local templateImage = (UI.getChildControl)(templateCharacterList, "Static_Image")
  local templateLevel = (UI.getChildControl)(templateCharacterList, "StaticText_Level")
  local templateState = (UI.getChildControl)(templateCharacterList, "StaticText_State")
  local mainBg = (UI.getChildControl)(Panel_CharacterTag, "Static_MainBg")
  mainBg:addInputEvent("Mouse_UpScroll", "PaGlobal_CharacterTag_ScrollEvent(true)")
  mainBg:addInputEvent("Mouse_DownScroll", "PaGlobal_CharacterTag_ScrollEvent(false)")
  self._maxCharacterCount = getCharacterDataCount()
  for index = 0, 11 do
    -- DECOMPILER ERROR at PC154: Confused about usage of register: R13 in 'UnsetPending'

    (selfUI._Static_CharacterList)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CharacterTag, "Static_CharacterList_" .. index)
    CopyBaseProperty(templateCharacterList, (selfUI._Static_CharacterList)[index])
    local Static_Image = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (selfUI._Static_CharacterList)[index], "Static_Image")
    CopyBaseProperty(templateImage, Static_Image)
    local StaticText_State = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (selfUI._Static_CharacterList)[index], "StaticText_State")
    CopyBaseProperty(templateState, StaticText_State)
    local StaticText_Level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (selfUI._Static_CharacterList)[index], "StaticText_Level")
    CopyBaseProperty(templateLevel, StaticText_Level)
    ;
    ((selfUI._Static_CharacterList)[index]):SetShow(false)
    ;
    ((selfUI._Static_CharacterList)[index]):addInputEvent("Mouse_UpScroll", "PaGlobal_CharacterTag_ScrollEvent(true)")
    ;
    ((selfUI._Static_CharacterList)[index]):addInputEvent("Mouse_DownScroll", "PaGlobal_CharacterTag_ScrollEvent(false)")
  end
  templateCharacterList:SetShow(false)
  templateCharacterList:SetIgnore(true)
  ;
  (selfUI._CheckButton_TagState):addInputEvent("Mouse_LUp", "HandleEvent_ClickRequestTag()")
  ;
  (selfUI._CheckButton_TagState):SetIgnore(false)
  selfUI._Scroll_Tag = (UI.getChildControl)(Panel_CharacterTag, "Scroll_Tag")
  selfUI._Scroll_CtrlButton = (UI.getChildControl)(selfUI._Scroll_Tag, "Scroll_CtrlButton")
  ;
  (UIScroll.InputEvent)(selfUI._Scroll_Tag, "PaGlobal_CharacterTag_ScrollEvent")
end

PaGlobal_Request_TagCharacter = function(characterKey)
  -- function num : 0_1
  ToClient_RequestDuelCharacter(characterKey)
end

PaGlobal_Delete_TagCharacter = function(characterKey)
  -- function num : 0_2
  ToClient_RequestDeleteDuelCharacter(characterKey)
end

HandleEvent_ClickRequestTag = function()
  -- function num : 0_3 , upvalues : CharacterTag, localDefine
  local self = CharacterTag
  ;
  ((self._UI)._CheckButton_TagState):SetCheck(self._currentTagState)
  if self._selfCharTag == false then
    _PA_LOG("์ง\128๋ฏผํ", "๋ด๊ฐ ์\128ํ์บ๋ฆญํฐ๊ฐ\128 ์๋๋ฐ์")
  end
  if localDefine.NODUEL == self._requestCharacterKey then
    _PA_LOG("์ง\128๋ฏผํ", "ํ๊ทธ์์ฒญ! : " .. tostring(self._currentTagState) .. " / ํ๊ทธ์บ๋ฆญํ\176 Key = " .. tostring(self._requestCharacterKey))
    if self._currentTagState then
      PaGlobal_Delete_TagCharacter(self._requestCharacterKey)
    else
      PaGlobal_Request_TagCharacter(self._requestCharacterKey)
    end
  end
end

PaGlobal_IsTagChange = function()
  -- function num : 0_4 , upvalues : CharacterTag
  local retBool = CharacterTag._doTag
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if CharacterTag._doTag == true then
    CharacterTag._doTag = false
  end
  return retBool
end

PaGlobal_TagCharacter_Change = function()
  -- function num : 0_5 , upvalues : localDefine, CharacterTag
  local index = ToClient_GetMyDuelCharacterIndex()
  if localDefine.NODUEL == index then
    return 
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  CharacterTag._doTag = true
  Panel_GameExit_ChangeCharacter(index)
end

CharacterTag.SetLeftFace = function(self, idx, isRegionKey)
  -- function num : 0_6
  local characterData = getCharacterDataByIndex(idx)
  local char_Type = getCharacterClassType(characterData)
  local char_Level = (string.format)("%d", characterData._level)
  local char_Name = getCharacterName(characterData)
  local char_TextureName = getCharacterFaceTextureByIndex(idx)
  local duelChar_No_s64 = characterData._duelCharacterNo
  local duelRegion_Key = characterData._duelRegionKey
  local isCaptureExist = ((self._UI)._Static_MainImage_1):ChangeTextureInfoNameNotDDS(char_TextureName, char_Type, PaGlobal_getIsExitPhoto())
  if isCaptureExist == true then
    (((self._UI)._Static_MainImage_1):getBaseTexture()):setUV(0, 0, 1, 1)
  else
    self:FaceSetting((self._UI)._Static_MainImage_1, char_Type)
  end
  ;
  ((self._UI)._Static_MainImage_1):setRenderTexture(((self._UI)._Static_MainImage_1):getBaseTexture())
  ;
  ((self._UI)._Static_MainImage_1):SetShow(true)
  ;
  ((self._UI)._StaticText_Name_1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. char_Level .. " " .. char_Name)
  if isRegionKey == true then
    ((self._UI)._StaticText_TagAreaValue):SetText((getRegionInfoByRegionKey(duelRegion_Key)):getAreaName())
  end
end

CharacterTag.SetRightFace = function(self, idx)
  -- function num : 0_7
  local characterData = getCharacterDataByIndex(idx)
  local char_Type = getCharacterClassType(characterData)
  local char_Level = (string.format)("%d", characterData._level)
  local char_Name = getCharacterName(characterData)
  local char_TextureName = getCharacterFaceTextureByIndex(idx)
  local duelChar_No_s64 = characterData._duelCharacterNo
  local duelRegion_Key = characterData._duelRegionKey
  local isCaptureExist = ((self._UI)._Static_MainImage_2):ChangeTextureInfoNameNotDDS(char_TextureName, char_Type, PaGlobal_getIsExitPhoto())
  if isCaptureExist == true then
    (((self._UI)._Static_MainImage_2):getBaseTexture()):setUV(0, 0, 1, 1)
  else
    self:FaceSetting((self._UI)._Static_MainImage_2, char_Type)
  end
  ;
  ((self._UI)._Static_MainImage_2):setRenderTexture(((self._UI)._Static_MainImage_2):getBaseTexture())
  ;
  ((self._UI)._Static_MainImage_2):SetShow(true)
  ;
  ((self._UI)._StaticText_Name_2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. char_Level .. " " .. char_Name)
  self._requestCharacterKey = characterData._characterNo_s64
end

CharacterTag.LoadMainFace = function(self)
  -- function num : 0_8 , upvalues : localDefine
  local selfPlayer = getSelfPlayer()
  local duelCharIndex = ToClient_GetMyDuelCharacterIndex()
  local selfCharIndex = ToClient_GetMyCharacterIndex()
  local isSetLeft = false
  if localDefine.NODUEL == duelCharIndex then
    for idx = 0, self._maxCharacterCount - 1 do
      local characterData = getCharacterDataByIndex(idx)
      local duelChar_No_s64 = characterData._duelCharacterNo
      if localDefine.NODUEL ~= duelChar_No_s64 then
        if isSetLeft then
          self:SetLeftFace(idx)
          isSetLeft = true
          ;
          ((self._UI)._CheckButton_TagState):SetCheck(true)
        else
          self:SetRightFace(idx)
          self._currentTagState = true
          ;
          ((self._UI)._Static_QuestionIcon_2):SetShow(false)
        end
      end
    end
    self._selfCharTag = false
    if isSetLeft == false then
      isSetLeft = true
      self:SetLeftFace(selfCharIndex, false)
      local selfPlayerChar_No_s64 = selfPlayer:getCharacterNo_64()
      local selfPos = float3((selfPlayer:get()):getPositionX(), (selfPlayer:get()):getPositionY(), (selfPlayer:get()):getPositionZ())
      ;
      ((self._UI)._StaticText_TagAreaValue):SetText((getRegionInfoByPosition(selfPos)):getAreaName())
      ;
      ((self._UI)._CheckButton_TagState):SetCheck(false)
      ;
      ((self._UI)._Static_MainImage_2):SetShow(false)
      ;
      ((self._UI)._StaticText_Name_2):SetText()
      ;
      ((self._UI)._StaticText_Name_2):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TAGCHAR_DESCSETTING"))
      self._selfCharTag = true
      self._currentTagState = false
      ;
      ((self._UI)._Static_QuestionIcon_2):SetShow(true)
    end
  else
    do
      isSetLeft = true
      self:SetLeftFace(selfCharIndex)
      self:SetRightFace(duelCharIndex)
      self._currentTagState = true
      ;
      ((self._UI)._CheckButton_TagState):SetCheck(true)
      self._selfCharTag = true
      ;
      ((self._UI)._Static_QuestionIcon_2):SetShow(false)
    end
  end
end

CharacterTag.FaceSetting = function(self, targetImage, char_Type)
  -- function num : 0_9 , upvalues : UI_Class, UI_DefaultFaceTexture
  if isNewCharacterInfo() == false then
    if char_Type == UI_Class.ClassType_Warrior then
      targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 1, 1, 156, 201)
      ;
      (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
      targetImage:setRenderTexture(targetImage:getBaseTexture())
    else
      do
        if char_Type == UI_Class.ClassType_Ranger then
          targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 157, 1, 312, 201)
          ;
          (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
          targetImage:setRenderTexture(targetImage:getBaseTexture())
        else
          do
            if char_Type == UI_Class.ClassType_Sorcerer then
              targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 313, 1, 468, 201)
              ;
              (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
              targetImage:setRenderTexture(targetImage:getBaseTexture())
            else
              do
                if char_Type == UI_Class.ClassType_Giant then
                  targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 1, 202, 156, 402)
                  ;
                  (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                  targetImage:setRenderTexture(targetImage:getBaseTexture())
                else
                  do
                    if char_Type == UI_Class.ClassType_Tamer then
                      targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                      local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 157, 202, 312, 402)
                      ;
                      (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                      targetImage:setRenderTexture(targetImage:getBaseTexture())
                    else
                      do
                        if char_Type == UI_Class.ClassType_BladeMaster then
                          targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                          local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 313, 202, 468, 402)
                          ;
                          (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                          targetImage:setRenderTexture(targetImage:getBaseTexture())
                        else
                          do
                            if char_Type == UI_Class.ClassType_Valkyrie then
                              targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                              local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 1, 1, 156, 201)
                              ;
                              (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                              targetImage:setRenderTexture(targetImage:getBaseTexture())
                            else
                              do
                                if char_Type == UI_Class.ClassType_BladeMasterWomen then
                                  targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 157, 1, 312, 201)
                                  ;
                                  (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                  targetImage:setRenderTexture(targetImage:getBaseTexture())
                                else
                                  do
                                    if char_Type == UI_Class.ClassType_Wizard then
                                      targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                      local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 313, 1, 468, 201)
                                      ;
                                      (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                      targetImage:setRenderTexture(targetImage:getBaseTexture())
                                    else
                                      do
                                        if char_Type == UI_Class.ClassType_WizardWomen then
                                          targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                          local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 1, 202, 156, 402)
                                          ;
                                          (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                          targetImage:setRenderTexture(targetImage:getBaseTexture())
                                        else
                                          do
                                            if char_Type == UI_Class.ClassType_NinjaWomen then
                                              targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                              local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 157, 202, 312, 402)
                                              ;
                                              (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                              targetImage:setRenderTexture(targetImage:getBaseTexture())
                                            else
                                              do
                                                if char_Type == UI_Class.ClassType_NinjaMan then
                                                  targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                  local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 313, 202, 468, 402)
                                                  ;
                                                  (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                  targetImage:setRenderTexture(targetImage:getBaseTexture())
                                                else
                                                  do
                                                    if char_Type == UI_Class.ClassType_DarkElf then
                                                      targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                      local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 1, 1, 156, 201)
                                                      ;
                                                      (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                      targetImage:setRenderTexture(targetImage:getBaseTexture())
                                                    else
                                                      do
                                                        if char_Type == UI_Class.ClassType_Combattant then
                                                          targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                          local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 157, 1, 312, 201)
                                                          ;
                                                          (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                          targetImage:setRenderTexture(targetImage:getBaseTexture())
                                                        else
                                                          do
                                                            if char_Type == UI_Class.ClassType_CombattantWomen then
                                                              targetImage:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(targetImage, 313, 1, 468, 201)
                                                              ;
                                                              (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                              targetImage:setRenderTexture(targetImage:getBaseTexture())
                                                            end
                                                            do
                                                              local DefaultFace = UI_DefaultFaceTexture[char_Type]
                                                              targetImage:ChangeTextureInfoName(DefaultFace[1])
                                                              local x1, y1, x2, y2 = setTextureUV_Func(targetImage, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
                                                              ;
                                                              (targetImage:getBaseTexture()):setUV(x1, y1, x2, y2)
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

HandleEvent_ClickCharacterList = function(charIndex)
  -- function num : 0_10 , upvalues : CharacterTag
  local self = CharacterTag
  local charMaxCount = getCharacterDataCount()
  if charIndex < 0 or charMaxCount < charIndex then
    return 
  end
  self:SetRightFace(charIndex)
  ;
  ((self._UI)._Static_QuestionIcon_2):SetShow(false)
  local characterData = getCharacterDataByIndex(charIndex)
  self._requestCharacterKey = characterData._characterNo_s64
end

CharacterTag.LoadList = function(self)
  -- function num : 0_11 , upvalues : localDefine
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local isSetLeft = false
  local selfPlayerIndex = ToClient_GetMyCharacterIndex()
  local selfPlayerChar_No_s64 = selfPlayer:getCharacterNo_64()
  local selfPos = float3((selfPlayer:get()):getPositionX(), (selfPlayer:get()):getPositionY(), (selfPlayer:get()):getPositionZ())
  local selfPlayerRegionInfoKey = (getRegionInfoByPosition(selfPos)):getRegionKey()
  local duelCharIndex = ToClient_GetMyDuelCharacterIndex()
  for jj = 0, 11 do
    (((self._UI)._Static_CharacterList)[jj]):SetShow(false)
  end
  for idx = 0, 11 do
    local ii = idx + self._pageIndex * 6
    if self._maxCharacterCount - 1 < ii then
      return 
    end
    local targetUI = ((self._UI)._Static_CharacterList)[idx]
    local targetLevel = (UI.getChildControl)(targetUI, "StaticText_Level")
    local targetImage = (UI.getChildControl)(targetUI, "Static_Image")
    local targetState = (UI.getChildControl)(targetUI, "StaticText_State")
    local characterData = getCharacterDataByIndex(ii)
    local char_Type = getCharacterClassType(characterData)
    local char_Level = (string.format)("%d", characterData._level)
    local char_Name = getCharacterName(characterData)
    local char_No_s64 = characterData._characterNo_s64
    local char_TextureName = getCharacterFaceTextureByIndex(ii)
    local pcDeliveryRegionKey = characterData._arrivalRegionKey
    local char_float3_position = characterData._currentPosition
    local duelChar_No_s64 = characterData._duelCharacterNo
    local duelRegion_Key = characterData._duelRegionKey
    local currentChar_Tag = false
    targetUI:SetShow(true)
    self:SetMonotoneIgnore(targetUI, targetImage, false)
    targetUI:SetPosX(32 + 105 * (idx % localDefine.CHARSLOTCOLMAX))
    targetUI:SetPosY(363 + (math.floor)(idx / localDefine.CHARSLOTCOLMAX) * 132)
    targetState:SetText("ํ๊ทธ ๊ฐ\128๋\165")
    targetUI:ChangeTextureInfoName("")
    local isCaptureExist = targetImage:ChangeTextureInfoNameNotDDS(char_TextureName, char_Type, PaGlobal_getIsExitPhoto())
    if isCaptureExist == true then
      (targetImage:getBaseTexture()):setUV(0, 0, 1, 1)
    else
      self:FaceSetting(targetImage, char_Type)
    end
    targetImage:setRenderTexture(targetImage:getBaseTexture())
    targetLevel:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. char_Level)
    targetImage:addInputEvent("Mouse_LUp", "HandleEvent_ClickCharacterList(" .. tostring(idx) .. ")")
    local regionInfo = getRegionInfoByPosition(char_float3_position)
    local serverUtc64 = getServerUtc64()
    local workingText = global_workTypeToStringSwap(characterData._pcWorkingType)
    if pcDeliveryRegionKey:get() ~= 0 and serverUtc64 < characterData._arrivalTime then
      self:SetMonotoneIgnore(targetUI, targetImage, true)
      targetState:SetText(PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_DELIVERY"))
    else
      if workingText ~= "" then
        targetState:SetText(workingText)
        self:SetMonotoneIgnore(targetUI, targetImage, true)
      else
        if localDefine.NODUEL ~= Int64toInt32(duelChar_No_s64) then
          self:SetMonotoneIgnore(targetUI, targetImage, true)
          targetState:SetText("ํ๊ทธ ์ค\145")
        else
          if selfPlayerRegionInfoKey ~= regionInfo:getRegionKey() then
            self:SetMonotoneIgnore(targetUI, targetImage, true)
            targetState:SetText(tostring(regionInfo:getAreaName()))
          end
        end
      end
    end
    local removeTime = getCharacterDataRemoveTime(idx)
    if removeTime ~= nil then
      self:SetMonotoneIgnore(targetUI, targetImage, true)
      targetState:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_DELETE"))
    end
    if ii == selfPlayerIndex then
      targetState:SetText("์ ์ ์ค\145")
      self:SetMonotoneIgnore(targetUI, targetImage, true)
    end
    if self._currentTagState == true then
      self:SetMonotoneIgnore(targetUI, targetImage, true)
    end
  end
end

CharacterTag.SetMonotoneIgnore = function(self, UIControl, ImageControl, value)
  -- function num : 0_12
  UIControl:SetMonoTone(value)
  UIControl:SetIgnore(value)
  ImageControl:SetMonoTone(value)
  ImageControl:SetIgnore(value)
end

CharacterTag.Clear = function(self)
  -- function num : 0_13
  ((self._UI)._CheckButton_TagState):SetIgnore(false)
  ;
  ((self._UI)._CheckButton_TagState):SetMonoTone(false)
  ;
  ((self._UI)._Static_MainImage_2):SetShow(true)
  ;
  ((self._UI)._Static_QuestionIcon_2):SetShow(true)
  ;
  ((self._UI)._Static_MainImage_2):ChangeTextureInfoName("")
  ;
  ((self._UI)._Static_MainImage_2):setRenderTexture(((self._UI)._Static_MainImage_2):getBaseTexture())
  for ii = 0, 11 do
    (((self._UI)._Static_CharacterList)[ii]):SetShow(false)
  end
end

CharacterTag.WindowPosition = function(self)
  -- function num : 0_14
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  local panelSizeX = Panel_CharacterTag:GetSizeX()
  local panelSizeY = Panel_CharacterTag:GetSizeY()
  Panel_CharacterTag:SetPosX(screenSizeX / 2 - panelSizeX / 2)
  Panel_CharacterTag:SetPosY((math.max)(0, (screenSizeY - panelSizeY) / 2))
end

CharacterTag.Open = function(self)
  -- function num : 0_15 , upvalues : isOpenCharacterTag
  if isOpenCharacterTag == false then
    return 
  end
  self:WindowPosition()
  self:Clear()
  self:LoadMainFace()
  self:LoadList()
  Panel_CharacterTag:SetShow(true, true)
end

CharacterTag.Close = function(self)
  -- function num : 0_16
  Panel_CharacterTag:CloseUISubApp()
  ;
  ((self._UI)._CheckButton_PopUp):SetCheck(false)
  Panel_CharacterTag:SetShow(false, false)
end

InitializeCharacterTag = function()
  -- function num : 0_17 , upvalues : CharacterTag
  CharacterTag:Initialize()
end

FromClient_SuccessRequest = function()
  -- function num : 0_18 , upvalues : CharacterTag
  CharacterTag:Open()
end

FromClient_SuccessDelete = function()
  -- function num : 0_19 , upvalues : CharacterTag
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  CharacterTag._doTag = false
  CharacterTag:Open()
end

PaGlobal_CharacterTag_Open = function()
  -- function num : 0_20 , upvalues : CharacterTag
  CharacterTag:Open()
end

PaGlobal_CharacterTag_Close = function()
  -- function num : 0_21 , upvalues : CharacterTag
  CharacterTag:Close()
end

PaGlobal_CharacterTag_ScrollEvent = function(isUp)
  -- function num : 0_22 , upvalues : CharacterTag
  local self = CharacterTag
  self._pageIndex = (UIScroll.ScrollEvent)((self._UI)._Scroll_Tag, isUp, 2, 4, self._pageIndex, 1)
  self:LoadList()
end

registerEvent("FromClient_luaLoadComplete", "InitializeCharacterTag")
registerEvent("FromClient_SuccessRequest", "FromClient_SuccessRequest")
registerEvent("FromClient_SuccessDelete", "FromClient_SuccessDelete")
CharacterTag_PopUp_UI = function()
  -- function num : 0_23 , upvalues : CharacterTag
  local self = CharacterTag
  if ((self._UI)._CheckButton_PopUp):IsCheck() then
    Panel_CharacterTag:OpenUISubApp()
  else
    Panel_CharacterTag:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

CharacterTag_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_24 , upvalues : CharacterTag
  local self = CharacterTag
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if ((self._UI)._CheckButton_PopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show((self._UI)._CheckButton_PopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

CharacterTag_WebHelper_ShowToolTip = function(isShow)
  -- function num : 0_25 , upvalues : CharacterTag
  local self = CharacterTag
  if isShow then
    local name = ""
    local desc = ""
    TooltipSimple_Show((self._UI)._Button_Question, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

CharacterTag_WebHelper = function()
  -- function num : 0_26
  Panel_WebHelper_ShowToggle("CharacterTag")
end


