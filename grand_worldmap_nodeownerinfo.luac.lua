-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\grand_worldmap_nodeownerinfo.luac 

-- params : ...
-- function num : 0
local UI_Color = Defines.Color
local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
Panel_NodeOwnerInfo:SetShow(false)
local nodeOwnerInfo = {
ui = {_static_GuildMarkBG = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_Static_GuildMarkBG"), _static_GuildMark = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_Static_GuildMark"), _txt_GuildName_Title = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_StaticText_GuildName"), _txt_GuildName_Value = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_StaticText_GuildName_Value"), _txt_GuildMaster_Title = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_StaticText_GuildMaster"), _txt_GuildMaster_Value = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_StaticText_GuildMaster_Value"), _txt_HasDate_Title = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_StaticText_HasDate"), _txt_HasDate_Value = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_StaticText_HasDate_Value"), _txt_NodeBonus_Title = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_NodeBonus"), _txt_NodeBonus_Value = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_NodeBonus_Value"), _txt_NowWar = (UI.getChildControl)(Panel_NodeOwnerInfo, "NodeInfo_StaticText_NowWar")}
, 
config = {}
}
;
((nodeOwnerInfo.ui)._txt_NodeBonus_Title):SetFontColor(UI_Color.C_FFFFD46D)
;
((nodeOwnerInfo.ui)._txt_NodeBonus_Value):SetFontColor(UI_Color.C_FFEDE699)
nodeOwnerInfo.SetFontColor = function(self, isSiegeBeing, hasOccupant)
  -- function num : 0_0 , upvalues : UI_Color
  if isSiegeBeing == true then
    ((self.ui)._txt_GuildName_Title):SetFontColor(UI_Color.C_FFD20000)
    ;
    ((self.ui)._txt_GuildMaster_Title):SetFontColor(UI_Color.C_FFD20000)
    ;
    ((self.ui)._txt_HasDate_Title):SetFontColor(UI_Color.C_FFD20000)
  else
    if hasOccupant == true then
      ((self.ui)._txt_GuildName_Title):SetFontColor(UI_Color.C_FF00C0D7)
      ;
      ((self.ui)._txt_GuildMaster_Title):SetFontColor(UI_Color.C_FF00C0D7)
      ;
      ((self.ui)._txt_HasDate_Title):SetFontColor(UI_Color.C_FF00C0D7)
    else
      ;
      ((self.ui)._txt_GuildName_Title):SetFontColor(UI_Color.C_FFEFEFEF)
      ;
      ((self.ui)._txt_GuildMaster_Title):SetFontColor(UI_Color.C_FFEFEFEF)
      ;
      ((self.ui)._txt_HasDate_Title):SetFontColor(UI_Color.C_FFEFEFEF)
    end
  end
end

nodeOwnerInfo.SetShowText = function(self, isSiegeBeing)
  -- function num : 0_1
  ((self.ui)._txt_GuildMaster_Title):SetShow(not isSiegeBeing)
  ;
  ((self.ui)._txt_GuildMaster_Value):SetShow(not isSiegeBeing)
  ;
  ((self.ui)._txt_HasDate_Title):SetShow(not isSiegeBeing)
  ;
  ((self.ui)._txt_HasDate_Value):SetShow(not isSiegeBeing)
  ;
  ((self.ui)._txt_NowWar):SetShow(isSiegeBeing)
end

nodeOwnerInfo.Update = function(self, nodeStaticStatus)
  -- function num : 0_2 , upvalues : nodeOwnerInfo
  local regionInfo = nodeStaticStatus:getMinorSiegeRegion()
  if regionInfo ~= nil then
    local regionKey = regionInfo._regionKey
    local regionWrapper = getRegionInfoWrapper(regionKey:get())
    local minorSiegeWrapper = regionWrapper:getMinorSiegeWrapper()
    local siegeWrapper = ToClient_GetSiegeWrapperByRegionKey(regionKey:get())
    if siegeWrapper ~= nil then
      local paDate = siegeWrapper:getOccupyingDate()
      local siegeTentCount = ToClient_GetCompleteSiegeTentCount(regionKey:get())
      local dropType = regionInfo:getDropGroupRerollCountOfSieger()
      local nodeTaxType = regionInfo:getVillageTaxLevel()
      local year = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_YEAR", "year", tostring(paDate:GetYear()))
      local month = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_MONTH", "month", tostring(paDate:GetMonth()))
      local day = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_DAY", "day", tostring(paDate:GetDay()))
      local hour = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_HOUR", "hour", tostring(paDate:GetHour()))
      local dropTypeValue = ""
      local isSiegeBeing = minorSiegeWrapper:isSiegeBeing()
      local hasOccupantExist = siegeWrapper:doOccupantExist()
      self:SetShowText(isSiegeBeing)
      self:SetFontColor(isSiegeBeing, hasOccupantExist)
      if isSiegeBeing == true then
        local isSiegeChannel = ToClient_doMinorSiegeInTerritory(regionWrapper:getTerritoryKeyRaw())
        if isSiegeChannel == true then
          ((self.ui)._txt_NowWar):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_COUNT", "siegeTentCount", siegeTentCount))
        else
          ;
          ((self.ui)._txt_NowWar):SetText("<PAColor0xfff26a6a>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODEOWNERINFO_NOT_NODEWAR") .. "<PAOldColor>")
        end
        ;
        ((self.ui)._txt_GuildName_Value):SetText("<PAColor0xfff26a6a>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODEOWNERINFO_WAR") .. "<PAOldColor>")
        if dropType == 0 and nodeTaxType >= 1 then
          dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_TAX", "nodeTaxType", nodeTaxType)
        else
          if dropType >= 1 and nodeTaxType == 0 then
            dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_LIFE", "dropType", dropType + 1)
          else
            if dropType >= 1 and nodeTaxType >= 1 then
              dropTypeValue = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_BOTH", "nodeTaxType", tostring(nodeTaxType), "dropType", tostring(dropType + 1))
            else
              dropTypeValue = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_NOT")
            end
          end
        end
        ;
        ((self.ui)._txt_NodeBonus_Value):SetText(dropTypeValue)
      else
        do
          if hasOccupantExist == true then
            local isSet = setGuildTextureByGuildNo(siegeWrapper:getGuildNo(), (self.ui)._static_GuildMark)
            if not isSet then
              ((self.ui)._static_GuildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
              local x1, y1, x2, y2 = setTextureUV_Func((self.ui)._static_GuildMark, 183, 1, 188, 6)
              ;
              (((self.ui)._static_GuildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              ((self.ui)._static_GuildMark):setRenderTexture(((self.ui)._static_GuildMark):getBaseTexture())
            end
            do
              do
                ;
                ((self.ui)._txt_GuildName_Value):SetText("<PAColor0xff00c0d7>" .. siegeWrapper:getGuildName() .. "<PAOldColor>")
                ;
                ((self.ui)._txt_GuildMaster_Value):SetText("<PAColor0xff96d4fc>" .. siegeWrapper:getGuildMasterName() .. "<PAOldColor>")
                ;
                ((self.ui)._txt_HasDate_Value):SetText("<PAColor0xff96d4fc>" .. year .. " " .. month .. " " .. day .. " " .. hour .. "<PAOldColor>")
                if dropType == 0 and nodeTaxType >= 1 then
                  dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_TAX", "nodeTaxType", nodeTaxType)
                else
                  if dropType >= 1 and nodeTaxType == 0 then
                    dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_LIFE", "dropType", dropType + 1)
                  else
                    if dropType >= 1 and nodeTaxType >= 1 then
                      dropTypeValue = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_BOTH", "nodeTaxType", tostring(nodeTaxType), "dropType", tostring(dropType + 1))
                    else
                      dropTypeValue = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_NOT")
                    end
                  end
                end
                ;
                ((self.ui)._txt_NodeBonus_Value):SetText(dropTypeValue)
                ;
                ((self.ui)._static_GuildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
                do
                  local x1, y1, x2, y2 = setTextureUV_Func((self.ui)._static_GuildMark, 0, 0, 0, 0)
                  ;
                  (((self.ui)._static_GuildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  ((self.ui)._static_GuildMark):setRenderTexture(((self.ui)._static_GuildMark):getBaseTexture())
                  ;
                  ((self.ui)._txt_GuildName_Value):SetText("<PAColor0xfff26a6a>" .. PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_WORLDMAP_NODEOWNERINFO_NOWAR") .. "<PAOldColor>")
                  ;
                  ((self.ui)._txt_GuildMaster_Value):SetText("<PAColor0xff515151>-<PAOldColor>")
                  ;
                  ((self.ui)._txt_HasDate_Value):SetText("<PAColor0xff515151>-<PAOldColor>")
                  if dropType == 0 and nodeTaxType >= 1 then
                    dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_TAX", "nodeTaxType", nodeTaxType)
                  else
                    if dropType >= 1 and nodeTaxType == 0 then
                      dropTypeValue = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_LIFE", "dropType", dropType + 1)
                    else
                      if dropType >= 1 and nodeTaxType >= 1 then
                        dropTypeValue = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_BOTH", "nodeTaxType", tostring(nodeTaxType), "dropType", tostring(dropType + 1))
                      else
                        dropTypeValue = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_NODEWAR_BENEFITS_NOT")
                      end
                    end
                  end
                  ;
                  ((self.ui)._txt_NodeBonus_Value):SetText(dropTypeValue)
                  nodeOwnerInfo:Close()
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_nodeOwnerInfo_SetInfo = function(nodeStaticStatus)
  -- function num : 0_3 , upvalues : nodeOwnerInfo
  nodeOwnerInfo:Update(nodeStaticStatus)
end

nodeOwnerInfo.Close = function(self)
  -- function num : 0_4
  Panel_NodeOwnerInfo:SetShow(false)
end

FGlobal_nodeOwnerInfo_SetPosition = function()
  -- function num : 0_5 , upvalues : positionTarget
  Panel_NodeOwnerInfo:SetPosX((positionTarget:GetSpanSize()).x + positionTarget:GetSizeX() + 10)
  Panel_NodeOwnerInfo:SetPosY((positionTarget:GetSpanSize()).y + 5)
end

FGlobal_nodeOwnerInfo_Close = function()
  -- function num : 0_6 , upvalues : nodeOwnerInfo
  nodeOwnerInfo:Close()
end


