-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\transferlifeexperience\panel_transferlifeexperience.luac 

-- params : ...
-- function num : 0
local UI_Class = CppEnums.ClassType
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_TransferLifeExperience:SetShow(false)
Panel_TransferLifeExperience:RegisterShowEventFunc(true, "TransferLife_ShowAni()")
Panel_TransferLifeExperience:RegisterShowEventFunc(false, "TransferLife_HideAni()")
Panel_TransferLifeExperience:ActiveMouseEventEffect(true)
Panel_TransferLifeExperience:setGlassBackground(true)
local TransferLife = {itemWhereType = nil, itemSlotNo = nil, itemLifeType = nil, characterIndex = nil, characterNo_64 = nil, title = (UI.getChildControl)(Panel_TransferLifeExperience, "StaticText_Title"), panelBG = (UI.getChildControl)(Panel_TransferLifeExperience, "Static_PanelBG"), btn_Confirm = (UI.getChildControl)(Panel_TransferLifeExperience, "Button_Confirm"), btn_Cancel = (UI.getChildControl)(Panel_TransferLifeExperience, "Button_Cancel"), btn_Close = (UI.getChildControl)(Panel_TransferLifeExperience, "Button_Win_Close"), _scroll = (UI.getChildControl)(Panel_TransferLifeExperience, "Scroll_TransferLife"), notify = (UI.getChildControl)(Panel_TransferLifeExperience, "Static_Notify"), maxSlotCount = 4, listCount = 0, startPos_characterBtn = 5, startCharacterIdx = 0, 
Slot = {}
}
TransferLife._scrollBtn = (UI.getChildControl)(TransferLife._scroll, "Scroll_CtrlButton")
;
(TransferLife.btn_Cancel):addInputEvent("Mouse_LUp", "TransferLife_Close()")
;
(TransferLife.btn_Close):addInputEvent("Mouse_LUp", "TransferLife_Close()")
TransferLife_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  Panel_TransferLifeExperience:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_TransferLifeExperience, 0, 0.15)
  local aniInfo1 = Panel_TransferLifeExperience:addScaleAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(1.5)
  aniInfo1:SetEndScale(0.8)
  aniInfo1.AxisX = Panel_TransferLifeExperience:GetSizeX() / 2
  aniInfo1.AxisY = Panel_TransferLifeExperience:GetSizeY() / 2
  aniInfo1.ScaleType = 0
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_TransferLifeExperience:addScaleAnimation(0.15, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(0.8)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_TransferLifeExperience:GetSizeX() / 2
  aniInfo2.AxisY = Panel_TransferLifeExperience:GetSizeY() / 2
  aniInfo2.ScaleType = 0
  aniInfo2.IsChangeChild = true
end

TransferLife_HideAni = function()
  -- function num : 0_1
  Panel_TransferLifeExperience:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_TransferLifeExperience, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local TransferLife_Initialize = function()
  -- function num : 0_2 , upvalues : TransferLife
  local self = TransferLife
  ;
  (self.notify):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self.notify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRANSFERLIFEEXPERIENCE_NOTIFY"))
  for slotIdx = 0, self.maxSlotCount - 1 do
    local slotBtn = (UI.createAndCopyBasePropertyControl)(Panel_TransferLifeExperience, "Button_Character0", self.panelBG, "TransferLife_CharacterBTN_" .. R10_PC27)
    slotBtn:SetPosY(self.startPos_characterBtn + (slotBtn:GetSizeY() + 5) * slotIdx)
    slotBtn:addInputEvent("Mouse_UpScroll", "TransferLife_ScrollEvent( true )")
    slotBtn:addInputEvent("Mouse_DownScroll", "TransferLife_ScrollEvent( false )")
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.Slot)[slotIdx] = slotBtn
  end
  ;
  (self.panelBG):addInputEvent("Mouse_UpScroll", "TransferLife_ScrollEvent( true )")
  ;
  (self.panelBG):addInputEvent("Mouse_DownScroll", "TransferLife_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)(self._scroll, "TransferLife_ScrollEvent")
  self.characterNo_64 = (getSelfPlayer()):getCharacterNo_64()
end

TransferLife_Initialize()
local ChangeTexture_Class = function(control, classType)
  -- function num : 0_3 , upvalues : UI_Class
  if classType == UI_Class.ClassType_Warrior then
    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
    ;
    (control:getOnTexture()):setUV(x1, y1, x2, y2)
    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
    ;
    (control:getClickTexture()):setUV(x1, y1, x2, y2)
  else
    do
      if classType == UI_Class.ClassType_Ranger then
        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
        ;
        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
        control:setRenderTexture(control:getBaseTexture())
        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
        ;
        (control:getOnTexture()):setUV(x1, y1, x2, y2)
        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
        ;
        (control:getClickTexture()):setUV(x1, y1, x2, y2)
      else
        do
          if classType == UI_Class.ClassType_Sorcerer then
            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 367, 458, 427)
            ;
            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
            control:setRenderTexture(control:getBaseTexture())
            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 428, 458, 488)
            ;
            (control:getOnTexture()):setUV(x1, y1, x2, y2)
            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
            ;
            (control:getClickTexture()):setUV(x1, y1, x2, y2)
          else
            do
              if classType == UI_Class.ClassType_Giant then
                control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                ;
                (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                control:setRenderTexture(control:getBaseTexture())
                control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                ;
                (control:getOnTexture()):setUV(x1, y1, x2, y2)
                control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                ;
                (control:getClickTexture()):setUV(x1, y1, x2, y2)
              else
                do
                  if classType == UI_Class.ClassType_Tamer then
                    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                    ;
                    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                    control:setRenderTexture(control:getBaseTexture())
                    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                    ;
                    (control:getOnTexture()):setUV(x1, y1, x2, y2)
                    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                    ;
                    (control:getClickTexture()):setUV(x1, y1, x2, y2)
                  else
                    do
                      if classType == UI_Class.ClassType_BladeMaster then
                        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                        ;
                        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                        control:setRenderTexture(control:getBaseTexture())
                        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                        ;
                        (control:getOnTexture()):setUV(x1, y1, x2, y2)
                        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_02.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                        ;
                        (control:getClickTexture()):setUV(x1, y1, x2, y2)
                      else
                        do
                          if classType == UI_Class.ClassType_BladeMasterWomen then
                            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                            ;
                            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                            control:setRenderTexture(control:getBaseTexture())
                            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                            ;
                            (control:getOnTexture()):setUV(x1, y1, x2, y2)
                            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                            ;
                            (control:getClickTexture()):setUV(x1, y1, x2, y2)
                          else
                            do
                              if classType == UI_Class.ClassType_Valkyrie then
                                control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                ;
                                (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                control:setRenderTexture(control:getBaseTexture())
                                control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                ;
                                (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_04.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                ;
                                (control:getClickTexture()):setUV(x1, y1, x2, y2)
                              else
                                do
                                  if classType == UI_Class.ClassType_Wizard then
                                    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                    ;
                                    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                    control:setRenderTexture(control:getBaseTexture())
                                    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                    ;
                                    (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                    ;
                                    (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                  else
                                    do
                                      if classType == UI_Class.ClassType_WizardWomen then
                                        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                        ;
                                        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                        control:setRenderTexture(control:getBaseTexture())
                                        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                        ;
                                        (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_05.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                        ;
                                        (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                      else
                                        do
                                          if classType == UI_Class.ClassType_NinjaWomen then
                                            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_06.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                            ;
                                            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                            control:setRenderTexture(control:getBaseTexture())
                                            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_06.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                            ;
                                            (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_06.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                            ;
                                            (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                          else
                                            do
                                              if classType == UI_Class.ClassType_NinjaMan then
                                                control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                                ;
                                                (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                control:setRenderTexture(control:getBaseTexture())
                                                control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                                ;
                                                (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                                ;
                                                (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                              else
                                                do
                                                  if classType == UI_Class.ClassType_DarkElf then
                                                    control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                                    ;
                                                    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    control:setRenderTexture(control:getBaseTexture())
                                                    control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                                    ;
                                                    (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                    control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                                    ;
                                                    (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                                  else
                                                    do
                                                      if classType == UI_Class.ClassType_Combattant then
                                                        control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 367, 458, 427)
                                                        ;
                                                        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                        control:setRenderTexture(control:getBaseTexture())
                                                        control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_07.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 428, 458, 488)
                                                        ;
                                                        (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                        control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 1, 458, 61)
                                                        ;
                                                        (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                                      else
                                                        do
                                                          if classType == UI_Class.ClassType_CombattantWomen then
                                                            control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 62, 458, 122)
                                                            ;
                                                            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                            control:setRenderTexture(control:getBaseTexture())
                                                            control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 123, 458, 183)
                                                            ;
                                                            (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                            control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_08.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 184, 458, 244)
                                                            ;
                                                            (control:getClickTexture()):setUV(x1, y1, x2, y2)
                                                          else
                                                            do
                                                              control:ChangeTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 245, 458, 305)
                                                              ;
                                                              (control:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                              control:setRenderTexture(control:getBaseTexture())
                                                              control:ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 306, 458, 366)
                                                              ;
                                                              (control:getOnTexture()):setUV(x1, y1, x2, y2)
                                                              control:ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Lobby/Lobby_ClassSelect_Btn_01.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(control, 2, 367, 458, 427)
                                                              ;
                                                              (control:getClickTexture()):setUV(x1, y1, x2, y2)
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

local TransferLife_Update = function()
  -- function num : 0_4 , upvalues : TransferLife, ChangeTexture_Class
  local self = TransferLife
  for slotIdx = 0, self.maxSlotCount - 1 do
    local slotBtn = (self.Slot)[slotIdx]
    slotBtn:SetShow(false)
  end
  self.listCount = getCharacterDataCount()
  if self.maxSlotCount < self.listCount then
    (self._scroll):SetShow(true)
  else
    ;
    (self._scroll):SetShow(false)
  end
  local uiIdx = 0
  for slotIdx = self.startCharacterIdx, self.listCount - 1 do
    if self.maxSlotCount <= uiIdx then
      return 
    end
    local slotBtn = (self.Slot)[uiIdx]
    slotBtn:SetMonoTone(false)
    slotBtn:SetEnable(true)
    local characterData = getCharacterDataByIndex(slotIdx)
    local characterName = getCharacterName(characterData)
    local classType = getCharacterClassType(characterData)
    local characterLevel = (string.format)("%d", characterData._level)
    if self.characterNo_64 == characterData._characterNo_s64 then
      characterName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRANSFERLIFEEXPERIENCE_CHARACTERNAME", "characterName", characterName)
      slotBtn:SetMonoTone(true)
      slotBtn:SetEnable(false)
    end
    slotBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. characterLevel .. " " .. characterName)
    slotBtn:addInputEvent("Mouse_LUp", "TransferLife_SelectedCharacter(" .. slotIdx .. ")")
    ChangeTexture_Class(slotBtn, classType)
    slotBtn:SetShow(true)
    uiIdx = uiIdx + 1
  end
end

TransferLife_Open = function()
  -- function num : 0_5 , upvalues : TransferLife
  Panel_TransferLifeExperience:SetShow(true, true)
  ;
  (TransferLife._scroll):SetControlPos(0)
end

TransferLife_Close = function()
  -- function num : 0_6
  Panel_TransferLifeExperience:SetShow(false, false)
end

FGlobal_TransferLife_Close = function()
  -- function num : 0_7
  TransferLife_Close()
end

TransferLife_ScrollEvent = function(isUp)
  -- function num : 0_8 , upvalues : TransferLife, TransferLife_Update
  local self = TransferLife
  self.startCharacterIdx = (UIScroll.ScrollEvent)(self._scroll, isUp, self.maxSlotCount, self.listCount, self.startCharacterIdx, 1)
  TransferLife_Update()
end

TransferLife_SelectedCharacter = function(slotIdx)
  -- function num : 0_9 , upvalues : TransferLife
  local self = TransferLife
  self.characterIndex = slotIdx
end

TransferLife_Confirm = function(_type)
  -- function num : 0_10 , upvalues : TransferLife
  local self = TransferLife
  if self.itemWhereType == nil or self.itemSlotNo == nil or self.characterIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TRANSFERLIFEEXPERIENCE_WRONGVALUE"))
    return 
  end
  if _type == 0 then
    if self.itemLifeType == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TRANSFERLIFEEXPERIENCE_WRONGVALUE"))
      return 
    end
    ToClient_requestTransferLifeExperience(self.itemWhereType, self.itemSlotNo, self.itemLifeType, self.characterIndex)
  else
    if _type == 1 then
      ToClient_requestExchangeBattleAndSkillExp(self.itemWhereType, self.itemSlotNo, self.characterIndex)
    end
  end
end

registerEvent("FromClient_RequestUseTransferLifeExperience", "FromClient_RequestUseTransferLifeExperience")
registerEvent("FromClient_TransferLifeExperience", "FromClient_TransferLifeExperience")
registerEvent("FromClient_RequestUseExchangeBattleAndSkillExp", "FromClient_RequestUseExchangeBattleAndSkillExp")
registerEvent("FromClient_ResponseExchangeBattleAndSkillExp", "FromClient_ResponseExchangeBattleAndSkillExp")
FromClient_RequestUseTransferLifeExperience = function(fromWhereType, fromSlotNo, lifeType)
  -- function num : 0_11 , upvalues : TransferLife, TransferLife_Update
  local self = TransferLife
  self.itemWhereType = fromWhereType
  self.itemSlotNo = fromSlotNo
  self.itemLifeType = lifeType
  self.startCharacterIdx = 0
  TransferLife_Update()
  TransferLife_Open()
  ;
  (TransferLife.btn_Confirm):addInputEvent("Mouse_LUp", "TransferLife_Confirm(" .. 0 .. ")")
  ;
  (self.title):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRANSFERLIFEXPERIENCE_TITLE"))
end

FromClient_TransferLifeExperience = function(lifeType)
  -- function num : 0_12
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TRANSFERLIFEEXPERIENCE_SUCCESS_TRANSFER"))
  TransferLife_Close()
end

FromClient_RequestUseExchangeBattleAndSkillExp = function(fromWhereType, fromSlotNo)
  -- function num : 0_13 , upvalues : TransferLife, TransferLife_Update
  local self = TransferLife
  self.itemWhereType = fromWhereType
  self.itemSlotNo = fromSlotNo
  self.itemLifeType = nil
  self.startCharacterIdx = 0
  TransferLife_Update()
  TransferLife_Open()
  ;
  (TransferLife.btn_Confirm):addInputEvent("Mouse_LUp", "TransferLife_Confirm(" .. 1 .. ")")
  ;
  (self.title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRANSFERLIFEEXPERIENCE_TITLE"))
end

FromClient_ResponseExchangeBattleAndSkillExp = function()
  -- function num : 0_14
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TRANSFERLIFEEXPERIENCE_SUCCESS_TRANSFER"))
  TransferLife_Close()
end


