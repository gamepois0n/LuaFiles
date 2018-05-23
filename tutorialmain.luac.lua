-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorialmain.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_classType = CppEnums.ClassType
runLua("UI_Data/Script/Tutorial/KeyTutorial.lua")
isClearedQuest = false
registerEvent("executeLuaFunc", "executeLuaFunc")
local isFirstSummonBoss = false
executeLuaFunc = function(funcText)
  -- function num : 0_0
  local classType = (getSelfPlayer()):getClassType()
  if isIntroMoviePlaying then
    return 
  end
  local charLevel = ((getSelfPlayer()):get()):getLevel()
  if funcText ~= "move_tutorial1" then
    if funcText ~= "move_tutorial2" or funcText == "closeDialog" then
      close_WindowPanelList()
    else
      if funcText == "PVP_Notice" then
        close_WindowPanelList()
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NOWYOUCANKILLANYONE")
        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = pvpMode_changedMode, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
      else
        do
          if funcText == "manufacture" then
            Panel_WebHelper_ShowToggle("PanelManufacture")
          else
            if funcText == "gathering" then
              Panel_WebHelper_ShowToggle("Gathering")
            else
              if funcText == "trade" then
                Panel_WebHelper_ShowToggle("PanelTradeMarketGraph")
              else
                if funcText == "node" then
                  Panel_WebHelper_ShowToggle("NodeMenu")
                else
                  if funcText == "housing" then
                    Panel_WebHelper_ShowToggle("PanelHouseControl")
                  else
                    if funcText == "tent" then
                      Panel_WebHelper_ShowToggle("PanelWindowTent")
                    else
                      if funcText == "alchemy" then
                        Panel_WebHelper_ShowToggle("PanelAlchemy")
                      else
                        if funcText == "cook" then
                          Panel_WebHelper_ShowToggle("PanelCook")
                        else
                          if funcText == "pet" then
                            Panel_WebHelper_ShowToggle("Pet")
                          else
                            if funcText == "servant" then
                              Panel_WebHelper_ShowToggle("PanelServantinfo")
                            else
                              if funcText == "stable" then
                                Panel_WebHelper_ShowToggle("PanelWindowStableShop")
                              else
                                if funcText == "selectQuest" then
                                  if _ContentsGroup_RenewUI_Dailog == true then
                                    FGlobal_HideDialog()
                                  else
                                    PaGlobalFunc_MainDialog_Hide()
                                  end
                                  FGlobal_FirstLogin_InGameOpen()
                                else
                                  if funcText == "findTargetMovieGuide" then
                                    FGlobal_Panel_LowLevelGuide_MovePlay_FindTarget()
                                  else
                                    if funcText == "learnSkillMovieGuide" then
                                      FGlobal_Panel_LowLevelGuide_MovePlay_LearnSkill()
                                      FGlobal_FirstLearnSkill_WindowShow()
                                      Panel_SkillCommand:SetShow(false)
                                    else
                                      if funcText == "acceptQuestMovieGuide" then
                                        FGlobal_Panel_LowLevelGuide_MovePlay_AcceptQuest()
                                        Panel_SkillCommand:SetShow(false)
                                      else
                                        if funcText == "callblackspiritmovieguide" then
                                          FGlobal_Panel_LowLevelGuide_MovePlay_BlackSpirit()
                                          Panel_SkillCommand:SetShow(false)
                                        else
                                          if funcText == "summonBoss1" then
                                            PaGlobal_SummonBossTutorial_Manager:startTutorial(0)
                                          else
                                            if funcText == "summonBoss2" then
                                              PaGlobal_SummonBossTutorial_Manager:startTutorial(1)
                                            else
                                              if funcText == "summonBoss3" or funcText == "summonBoss4" or funcText == "summonBoss5" or funcText == "summonBoss6" or funcText == "summonBoss7" or funcText == "summonBoss8" or funcText == "summonBoss9" or funcText == "summonBoss10" or funcText == "summonBoss11" or funcText == "summonBoss12" or funcText == "summonBoss13" or funcText == "summonBoss14" or funcText == "summonBoss15" or funcText == "summonBoss16" or funcText == "summonBoss17" or funcText == "summonBoss18" or funcText == "summonBoss19" or funcText == "summonBoss20" or funcText == "summonBoss21" or funcText == "summonBoss22" or funcText == "summonBoss23" or funcText == "summonBoss24" then
                                                PaGlobal_SummonBossTutorial_Manager:startTutorial(2)
                                              else
                                                if funcText == "arousal_attack_tutorial" then
                                                  PaGlobal_ArousalTutorial_Manager:startTutorial()
                                                else
                                                  if funcText == "huntingTutorial1" then
                                                    FGlobal_HuntingTutorial(1)
                                                  else
                                                    if funcText == "huntingTutorial2" then
                                                      FGlobal_HuntingTutorial(2)
                                                    else
                                                      if funcText == "huntingTutorial3" then
                                                        FGlobal_HuntingTutorial(3)
                                                      else
                                                        if funcText == "huntingTutorialEnd" then
                                                          FGlobal_HuntingTutorialEnd()
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


