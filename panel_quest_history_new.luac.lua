-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\quest\panel_quest_history_new.luac 

-- params : ...
-- function num : 0
Panel_Window_Quest_History:SetShow(false)
Panel_Window_Quest_History:setGlassBackground(true)
Panel_Window_Quest_History:ActiveMouseEventEffect(true)
Panel_Window_Quest_History:RegisterShowEventFunc(true, "QuestHistoryShowAni()")
Panel_Window_Quest_History:RegisterShowEventFunc(false, "QuestHistoryHideAni()")
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_QuestType = CppEnums.QuestType
local UCT_STATICTEXT = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
local isContentsEnableMedia = ToClient_IsContentsGroupOpen("3")
local isContentsEnableValencia = ToClient_IsContentsGroupOpen("4")
local QuestHistory = {panelBG = (UI.getChildControl)(Panel_Window_Quest_History, "Static_BG"), Frame = (UI.getChildControl)(Panel_Window_Quest_History, "Frame_QuestHistory"), FrameBG = (UI.getChildControl)(Panel_Window_Quest_History, "Static_FrameBG"), close = (UI.getChildControl)(Panel_Window_Quest_History, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Quest_History, "Button_Question"), _tab_ProgressingQuest = (UI.getChildControl)(Panel_Window_Quest_History, "RadioButton_Tab_ProgressingQuest"), _tab_ClearedQuest = (UI.getChildControl)(Panel_Window_Quest_History, "RadioButton_Tab_ClearedQuest"), questZoneCount = 9, questTypeCount = 8}
QuestHistory.FrameContent = (UI.getChildControl)(QuestHistory.Frame, "Frame_1_Content")
QuestHistory.FrameScroll = (UI.getChildControl)(QuestHistory.Frame, "Frame_1_VerticalScroll")
QuestHistory.FrameScrollBTN = (UI.getChildControl)(QuestHistory.FrameScroll, "Frame_1_VerticalScroll_CtrlButton")
;
(QuestHistory._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelQuestHistory\" )")
local questZoneUIPool = {}
local questTypeUIPool = {}
local templete = {base_BG = (UI.getChildControl)(Panel_Window_Quest_History, "Static_LineBG"), gauge_BG = (UI.getChildControl)(Panel_Window_Quest_History, "Static_Gauge_BG"), gauge = (UI.getChildControl)(Panel_Window_Quest_History, "Static_Gauge"), progressTitle = (UI.getChildControl)(Panel_Window_Quest_History, "StaticText_ProgressTitle"), progressValue = (UI.getChildControl)(Panel_Window_Quest_History, "StaticText_ProgressValue")}
templete.GaugeHead = (UI.getChildControl)(templete.gauge, "Progress2_1_Bar_Head")
QuestHistoryShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_Window_Quest_History:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.05)
  aniInfo1.AxisX = Panel_Window_Quest_History:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Quest_History:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_Quest_History:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.05)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Quest_History:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Quest_History:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

QuestHistoryHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_Quest_History:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_Quest_History:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

FGlobal_QuestHistoryOpen = function()
  -- function num : 0_2
  questHistory_Update()
  local uiSize = getScreenSizeX() - Panel_Window_Quest_New:GetSizeX() - Panel_CheckedQuestInfo:GetSizeX()
  if uiSize < Panel_Window_Quest_History:GetSizeX() then
    Panel_Window_Quest_History:SetPosX(2)
  end
  Panel_Window_Quest_History:SetShow(true, true)
end

FGlobal_QuestHistoryClose = function()
  -- function num : 0_3
  Panel_Window_Quest_History:SetShow(false, true)
end

QuestHistory.Init = function(self)
  -- function num : 0_4 , upvalues : QuestHistory, isContentsEnableMedia, isContentsEnableValencia, UI_PUCT, templete, questZoneUIPool, questTypeUIPool
  (self.panelBG):setGlassBackground(true)
  ;
  (QuestHistory.close):addInputEvent("Mouse_LUp", "FGlobal_QuestHistoryClose()")
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  if FGlobal_IsCommercialService() then
    if isContentsEnableMedia then
      QuestHistory.questZoneCount = 8
    else
      -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

      if isContentsEnableValencia then
        QuestHistory.questZoneCount = 9
      else
        -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

        QuestHistory.questZoneCount = 7
      end
    end
  else
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

    QuestHistory.questZoneCount = 3
  end
  local listBGPosY = 0
  for questZoneIndex = 1, QuestHistory.questZoneCount - 1 do
    local zoneList = {}
    zoneList.baseBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, QuestHistory.FrameContent, "create_ZoneSlot_" .. questZoneIndex)
    zoneList.gauge_BG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, zoneList.baseBG, "create_ZoneGauge_BG_" .. questZoneIndex)
    zoneList.gauge = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_PROGRESS2, zoneList.baseBG, "create_ZoneGauge_" .. questZoneIndex)
    zoneList.progressTitle = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, zoneList.baseBG, "create_ZoneProgressTitle_" .. questZoneIndex)
    zoneList.progressValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, zoneList.baseBG, "create_ZonerogressValue_" .. questZoneIndex)
    CopyBaseProperty(templete.base_BG, zoneList.baseBG)
    CopyBaseProperty(templete.gauge_BG, zoneList.gauge_BG)
    CopyBaseProperty(templete.gauge, zoneList.gauge)
    CopyBaseProperty(templete.progressTitle, zoneList.progressTitle)
    CopyBaseProperty(templete.progressValue, zoneList.progressValue)
    ;
    (zoneList.gauge_BG):SetShow(true)
    ;
    (zoneList.gauge):SetShow(true)
    ;
    (zoneList.progressTitle):SetShow(true)
    ;
    (zoneList.progressValue):SetShow(true)
    ;
    (zoneList.baseBG):SetShow(true)
    ;
    (zoneList.progressTitle):SetHorizonLeft()
    ;
    (zoneList.progressTitle):SetSpanSize(5, 0)
    ;
    (zoneList.progressTitle):SetPosY(5)
    ;
    (zoneList.progressValue):SetHorizonRight()
    ;
    (zoneList.progressValue):SetSpanSize(20, 0)
    ;
    (zoneList.progressValue):SetPosY(5)
    ;
    (zoneList.progressTitle):SetTextHorizonLeft()
    ;
    (zoneList.progressValue):SetTextHorizonRight()
    ;
    (zoneList.gauge_BG):SetSpanSize(5, 30)
    ;
    (zoneList.gauge):SetSpanSize(6, 31)
    ;
    (zoneList.gauge):SetSmoothMode(true)
    ;
    (zoneList.gauge):SetAniSpeed(5)
    ;
    (zoneList.gauge):SetProgressRate(0)
    ;
    (zoneList.baseBG):SetPosX(10)
    if questZoneIndex == 0 then
      (zoneList.baseBG):SetPosY(15)
      listBGPosY = (zoneList.baseBG):GetPosY()
    else
      ;
      (zoneList.baseBG):SetPosY(listBGPosY)
    end
    listBGPosY = listBGPosY + (zoneList.baseBG):GetSizeY() + 10
    -- DECOMPILER ERROR at PC212: Confused about usage of register: R7 in 'UnsetPending'

    questZoneUIPool[questZoneIndex] = zoneList
  end
  for questTypeIndex = 1, QuestHistory.questTypeCount - 1 do
    local typeList = {}
    typeList.baseBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, QuestHistory.FrameContent, "create_TypeSlot_" .. questTypeIndex)
    typeList.gauge_BG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, typeList.baseBG, "create_TypeGauge_BG_" .. questTypeIndex)
    typeList.gauge = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_PROGRESS2, typeList.baseBG, "create_TypeGauge_" .. questTypeIndex)
    typeList.progressTitle = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, typeList.baseBG, "create_TypeProgressTitle_" .. questTypeIndex)
    typeList.progressValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, typeList.baseBG, "create_TyperogressValue_" .. questTypeIndex)
    CopyBaseProperty(templete.base_BG, typeList.baseBG)
    CopyBaseProperty(templete.gauge_BG, typeList.gauge_BG)
    CopyBaseProperty(templete.gauge, typeList.gauge)
    CopyBaseProperty(templete.progressTitle, typeList.progressTitle)
    CopyBaseProperty(templete.progressValue, typeList.progressValue)
    ;
    (typeList.gauge_BG):SetShow(true)
    ;
    (typeList.gauge):SetShow(true)
    ;
    (typeList.progressTitle):SetShow(true)
    ;
    (typeList.progressValue):SetShow(true)
    ;
    (typeList.baseBG):SetShow(true)
    ;
    (typeList.progressTitle):SetHorizonLeft()
    ;
    (typeList.progressTitle):SetSpanSize(5, 0)
    ;
    (typeList.progressTitle):SetPosY(5)
    ;
    (typeList.progressValue):SetHorizonRight()
    ;
    (typeList.progressValue):SetSpanSize(20, 0)
    ;
    (typeList.progressValue):SetPosY(5)
    ;
    (typeList.progressTitle):SetTextHorizonLeft()
    ;
    (typeList.progressValue):SetTextHorizonRight()
    ;
    (typeList.gauge_BG):SetSpanSize(5, 30)
    ;
    (typeList.gauge):SetSpanSize(6, 31)
    ;
    (typeList.gauge):SetSmoothMode(true)
    ;
    (typeList.gauge):SetAniSpeed(5)
    ;
    (typeList.gauge):SetProgressRate(0)
    ;
    (typeList.baseBG):SetPosX(10)
    if questTypeIndex == 0 then
      (typeList.baseBG):SetPosY(listBGPosY)
    else
      ;
      (typeList.baseBG):SetPosY(listBGPosY)
    end
    listBGPosY = listBGPosY + (typeList.baseBG):GetSizeY() + 10
    -- DECOMPILER ERROR at PC390: Confused about usage of register: R7 in 'UnsetPending'

    questTypeUIPool[questTypeIndex] = typeList
  end
  Panel_Window_Quest_History:RemoveControl(templete.base_BG)
  Panel_Window_Quest_History:RemoveControl(templete.gauge_BG)
  Panel_Window_Quest_History:RemoveControl(templete.gauge)
  Panel_Window_Quest_History:RemoveControl(templete.progressTitle)
  Panel_Window_Quest_History:RemoveControl(templete.progressValue)
  ;
  (QuestHistory.Frame):UpdateContentPos()
  ;
  (QuestHistory.Frame):UpdateContentScroll()
  ;
  (QuestHistory.Frame):SetContentSpanSize(0, 5)
  ;
  (QuestHistory.FrameBG):SetAlpha(0.8)
  local frameContentSize = listBGPosY
  local frameSize = (QuestHistory.Frame):GetSizeY()
  local scrollButtonSize = frameContentSize / frameSize * 100
  ;
  (QuestHistory.FrameScrollBTN):SetSize((QuestHistory.FrameScrollBTN):GetSizeX(), scrollButtonSize)
  questHistory_Update()
end

questHistory_Update = function()
  -- function num : 0_5 , upvalues : QuestHistory, questZoneUIPool, questTypeUIPool
  local zoneList = {[1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 5, [6] = 6, [7] = 7, [8] = 8}
  local typeList = {[1] = 0, [2] = 1, [3] = 2, [4] = 3, [5] = 4, [6] = 5, [7] = 6}
  for zoneIdx = 1, QuestHistory.questZoneCount - 1 do
    local clearedQuestCnt = ToClient_GetClearedQuestCountByQuestRegion(zoneList[zoneIdx])
    local totalQuestCnt = ToClient_GetTotalQuestCountByQuestRegion(zoneList[zoneIdx])
    local progressRate = clearedQuestCnt / totalQuestCnt * 100
    ;
    ((questZoneUIPool[zoneIdx]).progressTitle):SetText(_questTextReplace(0, zoneIdx) .. PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_REGION"))
    ;
    ((questZoneUIPool[zoneIdx]).progressValue):SetText((string.format)("%.2f", progressRate) .. "%")
    if progressRate == 0 then
      progressRate = -1
    end
    ;
    ((questZoneUIPool[zoneIdx]).gauge):SetProgressRate(progressRate)
  end
  for typeIdx = 1, QuestHistory.questTypeCount - 1 do
    local clearedQuestCnt = ToClient_GetClearedQuestCountByQuestType(typeList[typeIdx])
    local totalQuestCnt = ToClient_GetTotalQuestCountByQuestType(typeList[typeIdx])
    local progressRate = clearedQuestCnt / totalQuestCnt * 100
    ;
    ((questTypeUIPool[typeIdx]).progressTitle):SetText(_questTextReplace(1, typeIdx) .. PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TYPE"))
    ;
    ((questTypeUIPool[typeIdx]).progressValue):SetText((string.format)("%.2f", progressRate) .. "%")
    if typeIdx == 0 then
      ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
      local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 418, 1, 436, 20)
      ;
      (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
    else
      do
        if typeIdx == 1 then
          ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 380, 31, 398, 50)
          ;
          (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
        else
          do
            if typeIdx == 2 then
              ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 437, 21, 455, 40)
              ;
              (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
            else
              do
                if typeIdx == 3 then
                  ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 380, 11, 398, 30)
                  ;
                  (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
                else
                  do
                    if typeIdx == 4 then
                      ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
                      local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 418, 1, 436, 20)
                      ;
                      (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
                      ;
                      ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
                    else
                      do
                        if typeIdx == 5 then
                          ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
                          local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 437, 1, 455, 20)
                          ;
                          (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
                          ;
                          ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
                        else
                          do
                            if typeIdx == 6 then
                              ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
                              local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 456, 1, 474, 20)
                              ;
                              (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
                              ;
                              ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
                            else
                              do
                                if typeIdx == 7 then
                                  ((questTypeUIPool[typeIdx]).progressTitle):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Etc_00.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func((questTypeUIPool[typeIdx]).progressTitle, 399, 1, 417, 20)
                                  ;
                                  (((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  ((questTypeUIPool[typeIdx]).progressTitle):setRenderTexture(((questTypeUIPool[typeIdx]).progressTitle):getBaseTexture())
                                end
                                do
                                  do
                                    if progressRate == 0 then
                                      progressRate = -1
                                    end
                                    ;
                                    ((questTypeUIPool[typeIdx]).gauge):SetProgressRate(progressRate)
                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

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

local title = templete.progressTitle
_questTextReplace = function(type, no)
  -- function num : 0_6 , upvalues : templete
  local returnName = nil
  if type == 0 then
    if no == 0 then
      returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_0")
    else
      if no == 1 then
        returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_1")
      else
        if no == 2 then
          returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_2")
        else
          if no == 3 then
            returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_3")
          else
            if no == 4 then
              returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_4")
            else
              if no == 5 then
                returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_5")
              else
                if no == 6 then
                  returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_6")
                else
                  if no == 7 then
                    returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_7")
                  else
                    if no == 8 then
                      returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_8")
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  else
    local title = templete.progressTitle
    if no == 0 then
      returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_0")
    else
      if no == 1 then
        returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_1")
      else
        if no == 2 then
          returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_2")
        else
          if no == 3 then
            returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_3")
          else
            if no == 4 then
              returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_4")
            else
              if no == 5 then
                returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_5")
              else
                if no == 6 then
                  returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_6")
                else
                  if no == 7 then
                    returnName = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_7")
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  do
    return returnName
  end
end

QuestHistory:Init()

