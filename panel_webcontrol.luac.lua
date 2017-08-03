-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\panel_webcontrol.luac 

-- params : ...
-- function num : 0
local PA_UI = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_WebControl:RegisterShowEventFunc(true, "Panel_WebHelper_ShowAni()")
Panel_WebControl:RegisterShowEventFunc(false, "Panel_WebHelper_HideAni()")
Panel_WebControl:setGlassBackground(true)
Panel_WebControl:ActiveMouseEventEffect(true)
local html_WebHelper_Control = (UI.createControl)(PA_UI.PA_UI_CONTROL_WEBCONTROL, Panel_WebControl, "WebControl_Help_CharInfo")
local ui = {_btn_Close = (UI.getChildControl)(Panel_WebControl, "Button_Close"), _btn_CloseWin = (UI.getChildControl)(Panel_WebControl, "Button_CloseWindow"), _edit_Question = (UI.getChildControl)(Panel_WebControl, "Edit_InputQuestion"), _btn_Search = (UI.getChildControl)(Panel_WebControl, "Button_Search")}
;
(ui._btn_Close):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle()")
;
(ui._btn_CloseWin):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle()")
Panel_WebHelper_ShowToggle = function(helpType)
  -- function num : 0_0 , upvalues : html_WebHelper_Control
  if isDeadInWatchingMode() then
    return 
  end
  do
    if ToClient_IsConferenceMode() then
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_MSGBOX_COMMON_READY"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    end
    if Panel_WebControl:IsShow() then
      Panel_WebControl:SetShow(false, true)
      html_WebHelper_Control:ResetUrl()
      return false
    else
      do
        if (isGameTypeJapan() or isGameTypeRussia()) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
          local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_MSGBOX_COMMON_READY"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageBoxData)
          return false
        end
        do
          if isGameTypeSA() then
            local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_MSGBOX_COMMON_READY"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageBoxData)
            return false
          end
          if isGameTypeKR2() then
            return false
          end
          if Panel_Login == nil then
            if Panel_WorldMap:GetShow() then
              WorldMapPopupManager:push(Panel_WebControl, true)
            else
              Panel_WebControl:SetShow(true, true)
            end
          else
            Panel_WebControl:SetShow(true, true)
          end
          Panel_WebControl_TakeAndShow(helpType)
          do return true end
        end
      end
    end
  end
end

FGlobal_Panel_WebHelper_ShowToggle = function()
  -- function num : 0_1
  Panel_WebHelper_ShowToggle("GUIDE")
end

Panel_WebHelper_ShowAni = function()
  -- function num : 0_2 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_WebControl)
  local aniInfo1 = Panel_WebControl:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_WebControl:GetSizeX() / 2
  aniInfo1.AxisY = Panel_WebControl:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_WebControl:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_WebControl:GetSizeX() / 2
  aniInfo2.AxisY = Panel_WebControl:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_WebHelper_HideAni = function()
  -- function num : 0_3
  audioPostEvent_SystemUi(1, 1)
  Panel_WebControl:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_WebControl, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

Panel_WebControl_Initialize = function()
  -- function num : 0_4 , upvalues : html_WebHelper_Control
  Panel_WebControl:SetShow(false, false)
  html_WebHelper_Control:SetHorizonCenter()
  html_WebHelper_Control:ResetUrl()
  html_WebHelper_Control:SetSize(960, 600)
  html_WebHelper_Control:SetSpanSize(0, 5)
  html_WebHelper_Control:SetShow(false)
end

local countryType = ""
local isIME = false
if isGameTypeTaiwan() then
  countryType = "_TW"
  isIME = true
end
Panel_WebControl_TakeAndShow = function(helpType)
  -- function num : 0_5 , upvalues : html_WebHelper_Control, countryType
  Panel_WebControl:SetShow(true, true)
  html_WebHelper_Control:SetHorizonCenter()
  if helpType == "GUIDE" then
    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GUIDE" .. countryType))
  else
    if helpType == "SelfCharacterInfo" then
      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_SELFCHARACTERINFO" .. countryType))
    else
      if helpType == "PanelImportantKnowledge" then
        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_PANELIMPORTANTKNOWLEDGE" .. countryType))
      else
        if helpType == "PanelWindowEquipment" then
          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_WINDOWEQUIPMENT" .. countryType))
        else
          if helpType == "PanelGameExit" then
            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_GAMEEXIT" .. countryType))
          else
            if helpType == "PanelWindowInventory" then
              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_WINDOWINVENTORY" .. countryType))
            else
              if helpType == "UIGameOption" then
                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_GAMEOPTION" .. countryType))
              else
                if helpType == "PanelQuestHistory" then
                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_QUESTHISTORY" .. countryType))
                else
                  if helpType == "PanelQuestReward" then
                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_QUESTREWARD" .. countryType))
                  else
                    if helpType == "PanelFixEquip" then
                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_FIXEQUIP" .. countryType))
                    else
                      if helpType == "NodeMenu" then
                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_NODE" .. countryType))
                      else
                        if helpType == "NpcShop" then
                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_NPCSHOP" .. countryType))
                        else
                          if helpType == "PanelBuyDrink" then
                            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_BUYDRINK" .. countryType))
                          else
                            if helpType == "Chatting" then
                              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEINFO_CHATTING" .. countryType))
                            else
                              if helpType == "PanelAlchemy" then
                                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_ALCHEMY" .. countryType))
                              else
                                if helpType == "PanelCook" then
                                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_COOK" .. countryType))
                                else
                                  if helpType == "PanelManufacture" then
                                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_MANUFACTURE" .. countryType))
                                  else
                                    if helpType == "PanelHouseControl" then
                                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_HOUSECONTROL" .. countryType))
                                    else
                                      if helpType == "PanelTradeMarketGraph" then
                                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_TRADEMARKETGRAPH" .. countryType))
                                      else
                                        if helpType == "TerritoryTrade" then
                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_TERRITORYTRADE" .. countryType))
                                        else
                                          if helpType == "TerritorySupply" then
                                            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_TERRITORYSUPPLY" .. countryType))
                                          else
                                            if helpType == "TerritoryAuth" then
                                              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_TERRITORYTRADE" .. countryType))
                                            else
                                              if helpType == "HouseManageWork" then
                                                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_HOUSEMANAGEWORK" .. countryType))
                                              else
                                                if helpType == "PanelWorldMapTownWorkerManage" then
                                                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_WORLDMAPTOWNWORKERMANAGE" .. countryType))
                                                else
                                                  if helpType == "FarmManageWork" then
                                                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_FARMMANAGEWORK" .. countryType))
                                                  else
                                                    if helpType == "PanelWindowHouse" then
                                                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_WINDOWHOUSE" .. countryType))
                                                    else
                                                      if helpType == "PanelWindowTent" then
                                                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_WINDOWTENT" .. countryType))
                                                      else
                                                        if helpType == "Gathering" then
                                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_GATHERING" .. countryType))
                                                        else
                                                          if helpType == "Pet" then
                                                            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_PET" .. countryType))
                                                          else
                                                            if helpType == "Dye" then
                                                              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_DYE" .. countryType))
                                                            else
                                                              if helpType == "HouseRank" then
                                                                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_HOUSERANK" .. countryType))
                                                              else
                                                                if helpType == "Worker" then
                                                                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFE_WORKER" .. countryType))
                                                                else
                                                                  if helpType == "AlchemyStone" then
                                                                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_ALCHEMYSTONE" .. countryType))
                                                                  else
                                                                    if helpType == "LifeRanking" then
                                                                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_LIFERANKING" .. countryType))
                                                                    else
                                                                      if helpType == "DeliveryPerson" then
                                                                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_DELIVERYPERSON" .. countryType))
                                                                      else
                                                                        if helpType == "PanelServantinfo" then
                                                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_SERVANTINFO" .. countryType))
                                                                        else
                                                                          if helpType == "PanelServantInventory" then
                                                                            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_SERVANTINVENTORY" .. countryType))
                                                                          else
                                                                            if helpType == "PanelWindowStableShop" then
                                                                              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_WINDOWSTABLEMARKET" .. countryType))
                                                                            else
                                                                              if helpType == "PanelWindowStableMarket" then
                                                                                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_WINDOWSTABLEMARKET" .. countryType))
                                                                              else
                                                                                if helpType == "PanelWindowStableMating" then
                                                                                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_WINDOWSTABLEMATING" .. countryType))
                                                                                else
                                                                                  if helpType == "PanelWindowStableRegister" then
                                                                                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_WINDOWSTABLEREGISTER" .. countryType))
                                                                                  else
                                                                                    if helpType == "HousingConsignmentSale" then
                                                                                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_HOUSINGCONSIGNMENTSALE" .. countryType))
                                                                                    else
                                                                                      if helpType == "HosingVendingMachine" then
                                                                                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_HOUSINGVENDINGMACHINE" .. countryType))
                                                                                      else
                                                                                        if helpType == "WareHouse" then
                                                                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_WAREHOUSE" .. countryType))
                                                                                        else
                                                                                          if helpType == "DeliveryInformation" then
                                                                                            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_DELIVERYINFORMATION" .. countryType))
                                                                                          else
                                                                                            if helpType == "DeliveryRequest" then
                                                                                              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_DELIVERYREQUEST" .. countryType))
                                                                                            else
                                                                                              if helpType == "MyVendorList" then
                                                                                                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_MYVENDORLIST" .. countryType))
                                                                                              else
                                                                                                if helpType == "ProductNote" then
                                                                                                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_PRODUCTNOTE" .. countryType))
                                                                                                else
                                                                                                  if helpType == "ItemMarket" then
                                                                                                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CONVENI_ITEMMARKET" .. countryType))
                                                                                                  else
                                                                                                    if helpType == "ClothExchange" then
                                                                                                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_CLOTHEXCHANGE" .. countryType))
                                                                                                    else
                                                                                                      if helpType == "QuickSlot" then
                                                                                                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_QUICKSLOT" .. countryType))
                                                                                                      else
                                                                                                        if helpType == "SpiritEnchant" then
                                                                                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_SPIRITENCHANT" .. countryType))
                                                                                                        else
                                                                                                          if helpType == "PanelWindowExtractionCrystal" then
                                                                                                            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_WINDOWEXTRACTIONCRYSTAL" .. countryType))
                                                                                                          else
                                                                                                            if helpType == "PanelWindowExtractionEnchantStone" then
                                                                                                              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_WINDOWEXTRACTIONENCHANTSTONE" .. countryType))
                                                                                                            else
                                                                                                              if helpType == "PanelWindowSkill" then
                                                                                                                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_WINDOWSKILL" .. countryType))
                                                                                                              else
                                                                                                                if helpType == "PanelEnableSkill" then
                                                                                                                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_ENABLESKILL" .. countryType))
                                                                                                                else
                                                                                                                  if helpType == "PanelSkillAwaken" then
                                                                                                                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_SKILLAWAKEN" .. countryType))
                                                                                                                  else
                                                                                                                    if helpType == "Socket" then
                                                                                                                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_SOCKET" .. countryType))
                                                                                                                    else
                                                                                                                      if helpType == "WarInfo" then
                                                                                                                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMBAT_WARINFO" .. countryType))
                                                                                                                      else
                                                                                                                        if helpType == "PanelExchangeWithPC" then
                                                                                                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_EXCHANGEWITHPC" .. countryType))
                                                                                                                        else
                                                                                                                          if helpType == "PanelFriends" then
                                                                                                                            html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_FRIENDS" .. countryType))
                                                                                                                          else
                                                                                                                            if helpType == "PanelClan" then
                                                                                                                              html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_CLAN" .. countryType))
                                                                                                                            else
                                                                                                                              if helpType == "PanelGuild" then
                                                                                                                                html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_GUILD" .. countryType))
                                                                                                                              else
                                                                                                                                if helpType == "PanelLordMenu" then
                                                                                                                                  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_LORDMENU" .. countryType))
                                                                                                                                else
                                                                                                                                  if helpType == "Panelmail" then
                                                                                                                                    html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_MAIL" .. countryType))
                                                                                                                                  else
                                                                                                                                    if helpType == "PartyOption" then
                                                                                                                                      html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_PARTYOPTION" .. countryType))
                                                                                                                                    else
                                                                                                                                      if helpType == "HouseAuction" then
                                                                                                                                        html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_HOUSEAUCTION" .. countryType))
                                                                                                                                      else
                                                                                                                                        if helpType == "PanelMailSend" then
                                                                                                                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_COMM_MAILSEND" .. countryType))
                                                                                                                                        else
                                                                                                                                          if helpType == "Update" then
                                                                                                                                            html_WebHelper_Control:SetUrl(960, 600, "http://blackigwiki.daum.net/wiki/%EC%9D%B4%EB%B2%88_%EC%A3%BC")
                                                                                                                                          else
                                                                                                                                            if helpType == "DeliveryCarriageinformation" then
                                                                                                                                              html_WebHelper_Control:SetUrl(960, 600, "coui://UI_Data/UI_Html/WebHelper/Window/Delivery/WebHelper_Delivery_CarriageInformation.html")
                                                                                                                                            else
                                                                                                                                              if helpType == "HouseList" then
                                                                                                                                                html_WebHelper_Control:SetUrl(960, 600, "coui://UI_Data/UI_Html/WebHelper/Window/HouseInfo/WebHelper_HouesList.html")
                                                                                                                                              else
                                                                                                                                                if helpType == "PanelHouseInfo" then
                                                                                                                                                  html_WebHelper_Control:SetUrl(960, 600, "coui://UI_Data/UI_Html/WebHelper/Window/HouseInfo/WebHelper_Panel_HouseInfo.html")
                                                                                                                                                else
                                                                                                                                                  if helpType == "PanelInn" then
                                                                                                                                                    html_WebHelper_Control:SetUrl(960, 600, "coui://UI_Data/UI_Html/WebHelper/Window/Inn/WebHelper_Inn.html")
                                                                                                                                                  else
                                                                                                                                                    if helpType == "PanelMailDetail" then
                                                                                                                                                      html_WebHelper_Control:SetUrl(960, 600, "coui://UI_Data/UI_Html/WebHelper/Window/Mail/WebHelper_Mail_Detail.html")
                                                                                                                                                    else
                                                                                                                                                      if helpType == "PanelPetSkill" then
                                                                                                                                                        html_WebHelper_Control:SetUrl(960, 600, "coui://UI_Data/UI_Html/WebHelper/Window/Servant/WebHelper_PetSkill.html")
                                                                                                                                                      else
                                                                                                                                                        if helpType == "PanelAuction" then
                                                                                                                                                          html_WebHelper_Control:SetUrl(960, 600, "coui://UI_Data/UI_Html/WebHelper/Window/Auction/WebHelper_Panel_Auction.html")
                                                                                                                                                        else
                                                                                                                                                          html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, "WEBHELPER_GAMEGUIDE"))
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
  if isGameTypeTaiwan() then
    html_WebHelper_Control:SetIME(true)
  end
  html_WebHelper_Control:SetSize(960, 600)
  html_WebHelper_Control:SetPosY(40)
  html_WebHelper_Control:SetSpanSize(0, 5)
  html_WebHelper_Control:SetShow(true)
end

Panel_WebControl_LevelUpGuide = function(isString)
  -- function num : 0_6 , upvalues : html_WebHelper_Control
  if isString == nil then
    return 
  end
  html_WebHelper_Control:SetUrl(960, 600, PAGetString(Defines.StringSheet_GAME, isString))
  html_WebHelper_Control:SetSize(960, 600)
  html_WebHelper_Control:SetPosY(40)
  html_WebHelper_Control:SetSpanSize(0, 5)
  html_WebHelper_Control:SetShow(true)
  Panel_WebControl:SetShow(true, false)
end

Panel_WebControl_Initialize()

