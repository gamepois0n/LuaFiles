-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\helpmessage\panel_helpmessage.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local _staticDescBG = (UI.getChildControl)(Panel_HelpMessage, "Static_DescBG")
local _staticTextDesc = (UI.getChildControl)(Panel_HelpMessage, "StaticText_Desc")
_staticTextDesc:SetShow(true)
_staticTextDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
_staticDescBG:SetShow(true)
HelpMessageQuestion_Show = function(where, isTrue)
  -- function num : 0_0 , upvalues : _staticTextDesc
  if isGameTypeKR2() then
    return 
  end
  if where == "PanelImportantKnowledge" then
    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Knowledge"))
  else
    if where == "PanelAlchemy" then
      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Alchemy"))
    else
      if where == "PanelCook" then
        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Cook"))
      else
        if where == "PanelManufacture" then
          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Product"))
        else
          if where == "HouseAuction" then
            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_HouseAuction"))
          else
            if where == "PanelAuction" then
              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Auction"))
            else
              if where == "PanelHouseAuction" then
                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_HouseAuction"))
              else
                if where == "PanelBuyDrink" then
                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Alcohol"))
                else
                  if where == "DeliveryCarriageinformation" then
                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Goods"))
                  else
                    if where == "DeliveryInformation" then
                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Trans"))
                    else
                      if where == "DeliveryPerson" then
                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Char_Trans"))
                      else
                        if where == "DeliveryRequest" then
                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Sent_Receipt"))
                        else
                          if where == "SpiritEnchant" then
                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_PotenBreak"))
                          else
                            if where == "PanelWindowEquipment" then
                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Equip"))
                            else
                              if where == "PanelExchangeWithPC" then
                                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Person_Deal"))
                              else
                                if where == "PanelWindowExtractionCrystal" then
                                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Extraction"))
                                else
                                  if where == "PanelWindowExtractionEnchantStone" then
                                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Stone_Extraction"))
                                  else
                                    if where == "PanelGameExit" then
                                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Game_Exit"))
                                    else
                                      if where == "PanelGuild" then
                                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Guild"))
                                      else
                                        if where == "PanelClan" then
                                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Clan"))
                                        else
                                          if where == "HouseList" then
                                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Get_House"))
                                          else
                                            if where == "PanelHouseControl" then
                                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_House"))
                                            else
                                              if where == "PanelHouseInfo" then
                                                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_HouseInfo"))
                                              else
                                                if where == "PanelInn" then
                                                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Hotel_Rent"))
                                                else
                                                  if where == "PanelWindowInventory" then
                                                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Bag"))
                                                  else
                                                    if where == "PanelServantInventory" then
                                                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_BoardingBag"))
                                                    else
                                                      if where == "PanelLordMenu" then
                                                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Seignior"))
                                                      else
                                                        if where == "Panelmail" then
                                                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_MailRead"))
                                                        else
                                                          if where == "PanelMailDetail" then
                                                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_MailSend"))
                                                          else
                                                            if where == "PanelMailSend" then
                                                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_MailSend"))
                                                            else
                                                              if where == "UIGameOption" then
                                                                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_GameOption"))
                                                              else
                                                                if where == "PanelQuestHistory" then
                                                                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Request"))
                                                                else
                                                                  if where == "PanelQuestReward" then
                                                                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Request_Reward"))
                                                                  else
                                                                    if where == "PanelFixEquip" then
                                                                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Repair"))
                                                                    else
                                                                      if where == "PanelPetSkill" then
                                                                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Obedience"))
                                                                      else
                                                                        if where == "PanelServantinfo" then
                                                                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_BoardingInfo"))
                                                                        else
                                                                          if where == "PanelEnableSkill" then
                                                                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_GetSkill"))
                                                                          else
                                                                            if where == "PanelWindowSkill" then
                                                                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Skill"))
                                                                            else
                                                                              if where == "PanelSkillAwaken" then
                                                                                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_SkillAwaken"))
                                                                              else
                                                                                if where == "Socket" then
                                                                                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_PotenTransition"))
                                                                                else
                                                                                  if where == "PanelWindowStableMating" then
                                                                                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Mating"))
                                                                                  else
                                                                                    if where == "PanelWindowStableMarket" then
                                                                                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_HorseMarket"))
                                                                                    else
                                                                                      if where == "PanelWindowStableRegister" then
                                                                                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Regist"))
                                                                                      else
                                                                                        if where == "PanelWindowStableShop" then
                                                                                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Shop"))
                                                                                        else
                                                                                          if where == "PanelTradeMarketGraph" then
                                                                                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_QuoteStatus"))
                                                                                          else
                                                                                            if where == "HouseManageWork" then
                                                                                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_TaskManage"))
                                                                                            else
                                                                                              if where == "FarmManageWork" then
                                                                                                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_TaskManage2"))
                                                                                              else
                                                                                                if where == "PanelWorldMapTownWorkerManage" then
                                                                                                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_WorkerMange"))
                                                                                                else
                                                                                                  if where == "SelfCharacterInfo" then
                                                                                                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_MyInfo"))
                                                                                                  else
                                                                                                    if where == "PanelFriends" then
                                                                                                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_FriendsList"))
                                                                                                    else
                                                                                                      if where == "MyVendorList" then
                                                                                                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_GetShop"))
                                                                                                      else
                                                                                                        if where == "HousingConsignmentSale" then
                                                                                                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Consignment"))
                                                                                                        else
                                                                                                          if where == "HosingVendingMachine" then
                                                                                                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_AutoSales"))
                                                                                                          else
                                                                                                            if where == "PartyOption" then
                                                                                                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_PartySetting"))
                                                                                                            else
                                                                                                              if where == "NodeMenu" then
                                                                                                                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_NodeName"))
                                                                                                              else
                                                                                                                if where == "WareHouse" then
                                                                                                                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_WareHouse"))
                                                                                                                else
                                                                                                                  if where == "Panel_Farm_ManageWork" then
                                                                                                                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_TaskManage"))
                                                                                                                  else
                                                                                                                    if where == "NpcShop" then
                                                                                                                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_NpcShop"))
                                                                                                                    else
                                                                                                                      if where == "HouseRank" then
                                                                                                                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_HouseRank"))
                                                                                                                      else
                                                                                                                        if where == "TerritoryAuth" then
                                                                                                                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_ImperialTrade"))
                                                                                                                        else
                                                                                                                          if where == "Chatting" then
                                                                                                                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Chatting"))
                                                                                                                          else
                                                                                                                            if where == "Worker" then
                                                                                                                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Worker"))
                                                                                                                            else
                                                                                                                              if where == "WarInfo" then
                                                                                                                                _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_WarInfo"))
                                                                                                                              else
                                                                                                                                if where == "ItemMarket" then
                                                                                                                                  _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_ItemMarket"))
                                                                                                                                else
                                                                                                                                  if where == "Pet" then
                                                                                                                                    _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Pet"))
                                                                                                                                  else
                                                                                                                                    if where == "ProductNote" then
                                                                                                                                      _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Productnote"))
                                                                                                                                    else
                                                                                                                                      if where == "Dye" then
                                                                                                                                        _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_Dye"))
                                                                                                                                      else
                                                                                                                                        if where == "AlchemyStone" then
                                                                                                                                          _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_AlchemyStone"))
                                                                                                                                        else
                                                                                                                                          if where == "LifeRanking" then
                                                                                                                                            _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_LifeRanking"))
                                                                                                                                          else
                                                                                                                                            if where == "ClothExchange" then
                                                                                                                                              _staticTextDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HELPMESSAGE_ClothExchange"))
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
  if isTrue == "true" then
    HelpMessageQuestion_On()
  else
    HelpMessageQuestion_Out()
  end
end

HelpMessageQuestion_On = function()
  -- function num : 0_1
  if getMousePosX() <= getScreenSizeX() / 2 and getMousePosY() <= getScreenSizeY() / 2 then
    Panel_HelpMessage:SetPosX(getMousePosX() + 15)
    Panel_HelpMessage:SetPosY(getMousePosY() + 15)
  else
    if getScreenSizeX() / 2 < getMousePosX() and getMousePosY() <= getScreenSizeY() / 2 then
      Panel_HelpMessage:SetPosX(getMousePosX() - 200)
      Panel_HelpMessage:SetPosY(getMousePosY() + 15)
    else
      if getMousePosX() <= getScreenSizeX() / 2 and getScreenSizeY() / 2 < getMousePosY() then
        Panel_HelpMessage:SetPosX(getMousePosX() + 15)
        Panel_HelpMessage:SetPosY(getMousePosY() - 90)
      else
        Panel_HelpMessage:SetPosX(getMousePosX() - 200)
        Panel_HelpMessage:SetPosY(getMousePosY() - 90)
      end
    end
  end
  Panel_HelpMessage:SetShow(true)
end

HelpMessageQuestion_Out = function()
  -- function num : 0_2
  Panel_HelpMessage:SetShow(false)
end


