-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\townnpcnavi\panel_widget_townnpcnavi.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local UI_ST = CppEnums.SpawnType
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AV = CppEnums.PA_UI_ALIGNVERTICAL
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
Panel_Widget_TownNpcNavi:RegisterShowEventFunc(true, "Panel_Widget_TownNpcNavi_ShowAni()")
Panel_Widget_TownNpcNavi:RegisterShowEventFunc(false, "Panel_Widget_TownNpcNavi_HideAni()")
Panel_Widget_TownNpcNavi:SetShow(false)
Panel_Widget_TownNpcNavi:setMaskingChild(true)
Panel_Widget_TownNpcNavi:ActiveMouseEventEffect(true)
local isSupplyEnable = ToClient_IsContentsGroupOpen("22")
local isTradeEnable = ToClient_IsContentsGroupOpen("26")
Panel_Widget_TownNpcNavi_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  Panel_Widget_TownNpcNavi:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toLeft.dds")
  local FadeMaskAni = Panel_Widget_TownNpcNavi:addTextureUVAnimation(0, 1.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(0.3, 0, 1)
  FadeMaskAni:SetEndUV(0.9, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(0.3, 1, 3)
  FadeMaskAni:SetEndUV(0.9, 1, 3)
  Panel_Widget_TownNpcNavi:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo8 = Panel_Widget_TownNpcNavi:addColorAnimation(0, 1.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R2 in 'UnsetPending'

  aniInfo3.IsChangeChild = true
end

Panel_Widget_TownNpcNavi_HideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_TT, UI_color
  Panel_Widget_TownNpcNavi:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_Gradient_toLeft.dds")
  local FadeMaskAni = Panel_Widget_TownNpcNavi:addTextureUVAnimation(0, 1.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0.6, 0, 0)
  FadeMaskAni:SetEndUV(0, 0, 0)
  FadeMaskAni:SetStartUV(0.9, 0, 1)
  FadeMaskAni:SetEndUV(0.3, 0, 1)
  FadeMaskAni:SetStartUV(0.6, 1, 2)
  FadeMaskAni:SetEndUV(0, 1, 2)
  FadeMaskAni:SetStartUV(0.9, 1, 3)
  FadeMaskAni:SetEndUV(0.3, 1, 3)
  Panel_Widget_TownNpcNavi:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = Panel_Widget_TownNpcNavi:addColorAnimation(0, 1.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  aniInfo3:SetHideAtEnd(true)
end

local npcTypeText = {[UI_ST.eSpawnType_SkillTrainer] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_1"), [UI_ST.eSpawnType_ItemRepairer] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_2"), [UI_ST.eSpawnType_ShopMerchant] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_3"), [UI_ST.eSpawnType_ImportantNpc] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_4"), [UI_ST.eSpawnType_TradeMerchant] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_5"), [UI_ST.eSpawnType_WareHouse] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_6"), [UI_ST.eSpawnType_Stable] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_7"), [UI_ST.eSpawnType_Wharf] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_8"), [UI_ST.eSpawnType_transfer] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_9"), [UI_ST.eSpawnType_intimacy] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_10"), [UI_ST.eSpawnType_guild] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_11"), [UI_ST.eSpawnType_explorer] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_12"), [UI_ST.eSpawnType_inn] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_13"), [UI_ST.eSpawnType_auction] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_14"), [UI_ST.eSpawnType_mating] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_15"), [UI_ST.eSpawnType_Potion] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_16"), [UI_ST.eSpawnType_Weapon] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_17"), [UI_ST.eSpawnType_Jewel] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_18"), [UI_ST.eSpawnType_Furniture] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_19"), [UI_ST.eSpawnType_Collect] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_20"), [UI_ST.eSpawnType_Fish] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_21"), [UI_ST.eSpawnType_Worker] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_22"), [UI_ST.eSpawnType_Alchemy] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_23"), [UI_ST.eSpawnType_GuildShop] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_24"), [UI_ST.eSpawnType_ItemMarket] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_25"), [UI_ST.eSpawnType_TerritorySupply] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_26"), [UI_ST.eSpawnType_TerritoryTrade] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_27"), [UI_ST.eSpawnType_Smuggle] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_28"), [UI_ST.eSpawnType_Cook] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_29"), [UI_ST.eSpawnType_PC] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_30"), [UI_ST.eSpawnType_Grocery] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_31"), [UI_ST.eSpawnType_RandomShop] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_32"), [UI_ST.eSpawnType_SupplyShop] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_33"), [UI_ST.eSpawnType_RandomShopDay] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_34")}
local iconTexture = {
[UI_ST.eSpawnType_SkillTrainer] = {2, 2, 38, 38, 2, 39, 38, 75, 2, 76, 38, 112}
, 
[UI_ST.eSpawnType_ItemRepairer] = {39, 2, 75, 38, 39, 39, 75, 75, 39, 76, 75, 112}
, 
[UI_ST.eSpawnType_ShopMerchant] = {76, 2, 112, 38, 76, 39, 112, 75, 76, 76, 112, 112}
, 
[UI_ST.eSpawnType_TradeMerchant] = {113, 2, 149, 38, 113, 39, 149, 75, 113, 76, 149, 112}
, 
[UI_ST.eSpawnType_WareHouse] = {150, 2, 186, 38, 150, 39, 186, 75, 150, 76, 186, 112}
, 
[UI_ST.eSpawnType_Stable] = {187, 2, 223, 38, 187, 39, 223, 75, 187, 76, 223, 112}
, 
[UI_ST.eSpawnType_Wharf] = {224, 2, 260, 38, 224, 39, 260, 75, 224, 76, 260, 112}
, 
[UI_ST.eSpawnType_guild] = {261, 2, 297, 38, 261, 39, 297, 75, 261, 76, 297, 112}
, 
[UI_ST.eSpawnType_auction] = {298, 2, 334, 38, 298, 39, 334, 75, 298, 76, 334, 112}
, 
[UI_ST.eSpawnType_Potion] = {2, 113, 38, 149, 2, 150, 38, 186, 2, 187, 38, 223}
, 
[UI_ST.eSpawnType_Weapon] = {39, 113, 75, 149, 39, 150, 75, 186, 39, 187, 75, 223}
, 
[UI_ST.eSpawnType_Jewel] = {76, 113, 112, 149, 76, 150, 112, 186, 76, 187, 112, 223}
, 
[UI_ST.eSpawnType_Collect] = {113, 113, 149, 149, 113, 150, 149, 186, 113, 187, 149, 223}
, 
[UI_ST.eSpawnType_Fish] = {150, 113, 186, 149, 150, 150, 186, 186, 150, 187, 186, 223}
, 
[UI_ST.eSpawnType_Worker] = {187, 113, 223, 149, 187, 150, 223, 186, 187, 187, 223, 223}
, 
[UI_ST.eSpawnType_ItemMarket] = {224, 113, 260, 149, 224, 150, 260, 186, 224, 187, 260, 223}
, 
[UI_ST.eSpawnType_TerritorySupply] = {261, 113, 297, 149, 261, 150, 297, 186, 261, 287, 297, 223}
, 
[UI_ST.eSpawnType_TerritoryTrade] = {298, 113, 334, 149, 298, 150, 334, 186, 298, 187, 334, 223}
, 
[UI_ST.eSpawnType_Cook] = {2, 224, 38, 260, 2, 261, 38, 297, 2, 298, 38, 334}
, 
[UI_ST.eSpawnType_Furniture] = {39, 224, 75, 260, 39, 261, 75, 297, 39, 298, 75, 334}
, 
[UI_ST.eSpawnType_transfer] = {76, 224, 112, 260, 76, 261, 112, 297, 76, 298, 112, 334}
}
local toggleBtn = FGlobal_GetPersonalIconControl(0)
toggleBtn:SetShow(true)
toggleBtn:addInputEvent("Mouse_LUp", "NpcNavi_ShowToggle()")
local iconBG = (UI.getChildControl)(Panel_Widget_TownNpcNavi, "StaticText_ToolTip")
local npcIcon = (UI.getChildControl)(Panel_Widget_TownNpcNavi, "StaticText_TownNpcNavi_Icon")
iconBG:SetShow(false)
local iconSize = npcIcon:GetSizeX()
local iconStartPosY = 275
local _spawnType, _isAuto = nil, nil
local _isCheck = false
HandleClicked_TownNpcIcon_NaviStart = function(spawnType, isAuto)
  -- function num : 0_2 , upvalues : _spawnType, UI_ST, npcTypeText
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  if isAuto == nil then
    isAuto = false
  end
  audioPostEvent_SystemUi(0, 0)
  ToClient_DeleteNaviGuideByGroup(0)
  _spawnType = spawnType
  local position = player:get3DPos()
  local nearNpcInfo = getNearNpcInfoByType(spawnType, position)
  if nearNpcInfo == nil then
    return 
  end
  local curChannelData = getCurrentChannelServerData()
  if curChannelData._isMain == false and UI_ST.eSpawnType_TerritoryTrade == spawnType then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_IMPERIAL_DELIVERY_ONLY_FIRSTCH"))
    return 
  end
  local isSpawnNearNpc = nearNpcInfo:isTimeSpawn()
  local pos = nearNpcInfo:getPosition()
  local npcNaviKey = ToClient_WorldMapNaviStart(pos, NavigationGuideParam(), isAuto, isAuto)
  audioPostEvent_SystemUi(0, 14)
  local selfPlayer = (getSelfPlayer()):get()
  selfPlayer:setNavigationMovePath(npcNaviKey)
  selfPlayer:checkNaviPathUI(npcNaviKey)
  if isSpawnNearNpc == false then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_REST_AVAILABLE"))
  end
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOWNNPCNAVI_NAVIGATIONDESCRIPTION", "npcName", tostring(npcTypeText[spawnType])))
  TownfunctionNavi_Set()
  PaGlobal_TutorialManager:handleClickedTownNpcIconNaviStart(spawnType, isAuto)
end

local npcIconChangeTexture = function(icon, spawnType)
  -- function num : 0_3 , upvalues : iconTexture, UI_ST
  if iconTexture[spawnType] == nil then
    spawnType = UI_ST.eSpawnType_ShopMerchant
  end
  icon:ChangeTextureInfoName("New_UI_Common_forLua/Default/NpcIcon_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(icon, (iconTexture[spawnType])[1], (iconTexture[spawnType])[2], (iconTexture[spawnType])[3], (iconTexture[spawnType])[4])
  ;
  (icon:getBaseTexture()):setUV(x1, y1, x2, y2)
  icon:setRenderTexture(icon:getBaseTexture())
  icon:ChangeOnTextureInfoName("New_UI_Common_forLua/Default/NpcIcon_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(icon, (iconTexture[spawnType])[5], (iconTexture[spawnType])[6], (iconTexture[spawnType])[7], (iconTexture[spawnType])[8])
  ;
  (icon:getOnTexture()):setUV(x1, y1, x2, y2)
  icon:ChangeClickTextureInfoName("New_UI_Common_forLua/Default/NpcIcon_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(icon, (iconTexture[spawnType])[9], (iconTexture[spawnType])[10], (iconTexture[spawnType])[11], (iconTexture[spawnType])[12])
  ;
  (icon:getClickTexture()):setUV(x1, y1, x2, y2)
end

local npcNaviIcon = {}
local iconTypeCount = 0
local slotConfig = {slotCount = 20, slotCols = 3, slotRows = 0, slotStartX = 20, slotStartY = 40, slotGapX = 125, slotGapY = 38}
Panel_Widget_TownNpcNavi:SetShow(not isRecordMode, true)
TownfunctionNavi_Set = function()
  -- function num : 0_4 , upvalues : iconTypeCount, UI_ST, npcNaviIcon, npcIcon, npcTypeText, _spawnType, UI_TM, npcIconChangeTexture, isSupplyEnable, isTradeEnable, slotConfig
  if isFlushedUI() then
    return 
  end
  iconTypeCount = UI_ST.eSpawnType_Count - 1
  local spawnType = {}
  for index = 1, UI_ST.eSpawnType_Count - 1 do
    local pushTownNpcIcon = function(i, index)
    -- function num : 0_4_0 , upvalues : npcNaviIcon, npcIcon, npcTypeText, spawnType, _spawnType, UI_TM, npcIconChangeTexture, isSupplyEnable, UI_ST, isTradeEnable
    if npcNaviIcon[i] ~= nil then
      (UI.deleteControl)(npcNaviIcon[i])
    end
    local tempIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_NpcNavi, "NpcNavi_Icon_" .. index)
    CopyBaseProperty(npcIcon, tempIcon)
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R3 in 'UnsetPending'

    npcNaviIcon[i] = tempIcon
    local npcNameColor = "<PAColor0xffc4bebe>" .. npcTypeText[spawnType[i]] .. "<PAOldColor>"
    if index == _spawnType then
      npcNameColor = "<PAColor0xFFFFEF82>" .. npcTypeText[spawnType[i]] .. "<PAOldColor>"
    end
    ;
    (npcNaviIcon[i]):SetTextMode(UI_TM.eTextMode_LimitText)
    ;
    (npcNaviIcon[i]):SetText(npcNameColor)
    local isUse = ToClient_HasClientSpawnByType(index)
    ;
    (npcNaviIcon[i]):SetShow(isUse)
    npcIconChangeTexture(npcNaviIcon[i], index)
    if not isSupplyEnable and UI_ST.eSpawnType_TerritorySupply == index then
      (npcNaviIcon[i]):SetShow(false)
    end
    if not isTradeEnable and UI_ST.eSpawnType_TerritoryTrade == index then
      (npcNaviIcon[i]):SetShow(false)
    end
    if index == UI_ST.eSpawnType_ShopMerchant then
      (npcNaviIcon[i]):SetShow(false)
    else
      if index == UI_ST.eSpawnType_auction then
        (npcNaviIcon[i]):SetShow(false)
      end
    end
  end

    if UI_ST.eSpawnType_SkillTrainer == index then
      spawnType[0] = index
      pushTownNpcIcon(0, index)
    else
      if UI_ST.eSpawnType_ItemRepairer == index then
        spawnType[1] = index
        pushTownNpcIcon(1, index)
      else
        if UI_ST.eSpawnType_WareHouse == index then
          spawnType[2] = index
          pushTownNpcIcon(2, index)
        else
          if UI_ST.eSpawnType_transfer == index then
            spawnType[3] = index
            pushTownNpcIcon(3, index)
          else
            if UI_ST.eSpawnType_Stable == index then
              spawnType[4] = index
              pushTownNpcIcon(4, index)
            else
              if UI_ST.eSpawnType_Wharf == index then
                spawnType[5] = index
                pushTownNpcIcon(5, index)
              else
                if UI_ST.eSpawnType_guild == index then
                  spawnType[6] = index
                  pushTownNpcIcon(6, index)
                else
                  if UI_ST.eSpawnType_TradeMerchant == index then
                    spawnType[7] = index
                    pushTownNpcIcon(7, index)
                  else
                    if UI_ST.eSpawnType_Potion == index then
                      spawnType[8] = index
                      pushTownNpcIcon(8, index)
                    else
                      if UI_ST.eSpawnType_Weapon == index then
                        spawnType[9] = index
                        pushTownNpcIcon(9, index)
                      else
                        if UI_ST.eSpawnType_Jewel == index then
                          spawnType[10] = index
                          pushTownNpcIcon(10, index)
                        else
                          if UI_ST.eSpawnType_Furniture == index then
                            spawnType[11] = index
                            pushTownNpcIcon(11, index)
                          else
                            if UI_ST.eSpawnType_Collect == index then
                              spawnType[12] = index
                              pushTownNpcIcon(12, index)
                            else
                              if UI_ST.eSpawnType_Fish == index then
                                spawnType[13] = index
                                pushTownNpcIcon(13, index)
                              else
                                if UI_ST.eSpawnType_Cook == index then
                                  spawnType[14] = index
                                  pushTownNpcIcon(14, index)
                                else
                                  if UI_ST.eSpawnType_Worker == index then
                                    spawnType[15] = index
                                    pushTownNpcIcon(15, index)
                                  else
                                    if UI_ST.eSpawnType_ItemMarket == index then
                                      spawnType[16] = index
                                      pushTownNpcIcon(16, index)
                                    else
                                      if UI_ST.eSpawnType_TerritorySupply == index then
                                        spawnType[17] = index
                                        pushTownNpcIcon(17, index)
                                      else
                                        if UI_ST.eSpawnType_TerritoryTrade == index then
                                          spawnType[18] = index
                                          pushTownNpcIcon(18, index)
                                        else
                                          iconTypeCount = iconTypeCount - 1
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
  -- DECOMPILER ERROR at PC227: Confused about usage of register: R1 in 'UnsetPending'

  slotConfig.slotRows = slotConfig.slotCount / slotConfig.slotCols
  for ii = 0, iconTypeCount - 1 do
    local row = (math.floor)(ii / slotConfig.slotCols)
    local col = ii % slotConfig.slotCols
    ;
    (npcNaviIcon[ii]):SetPosX(slotConfig.slotStartX + slotConfig.slotGapX * col)
    ;
    (npcNaviIcon[ii]):SetPosY(slotConfig.slotStartY + slotConfig.slotGapY * row)
    ;
    (npcNaviIcon[ii]):addInputEvent("Mouse_On", "HandleOn_IconSizeUp(" .. ii .. ", " .. spawnType[ii] .. ")")
    ;
    (npcNaviIcon[ii]):addInputEvent("Mouse_Out", "HandleOn_IconSizeUp()")
    ;
    (npcNaviIcon[ii]):setTooltipEventRegistFunc("TownNpcIcon_Tooltip( " .. ii .. ", " .. spawnType[ii] .. " )")
    ;
    (npcNaviIcon[ii]):addInputEvent("Mouse_LUp", "HandleClicked_TownNpcIcon_NaviStart(" .. spawnType[ii] .. ")")
    ;
    (npcNaviIcon[ii]):addInputEvent("Mouse_RUp", "HandleClicked_TownNpcIcon_NaviStart(" .. spawnType[ii] .. ", " .. "true)")
  end
end

HandleOn_IconSizeUp = function(index, spawnType)
  -- function num : 0_5 , upvalues : npcNaviIcon
  if index == nil then
    TownNpcIcon_Tooltip()
    TownfunctionNavi_Set()
  else
    registTooltipControl(npcNaviIcon[index], Panel_Tooltip_SimpleText)
    TownNpcIcon_Tooltip(index, spawnType)
  end
end

TownNpcIcon_Tooltip = function(index, spawnType)
  -- function num : 0_6 , upvalues : npcTypeText, npcNaviIcon
  local name = npcTypeText[spawnType]
  local uiControl = npcNaviIcon[index]
  local desc = nil
  if index == nil then
    TooltipSimple_Hide()
  else
    TooltipSimple_Show(uiControl, name, desc)
  end
end

TownNpcIcon_Resize = function()
  -- function num : 0_7
  Panel_Widget_TownNpcNavi:SetPosX(getScreenSizeX() - FGlobal_Panel_Radar_GetSizeX() - Panel_Widget_TownNpcNavi:GetSizeX() - 20)
  Panel_Widget_TownNpcNavi:SetPosY(10)
end

FGlobal_TownfunctionNavi_Set = function()
  -- function num : 0_8
  TownfunctionNavi_Set()
end

FGlobal_TownfunctionNavi_SetWorldMap = function()
  -- function num : 0_9
  if not Panel_Widget_TownNpcNavi:GetShow() then
    Panel_Widget_TownNpcNavi:SetShow(true)
  end
  TownfunctionNavi_Set()
  Panel_Widget_TownNpcNavi:SetPosX(getScreenSizeX() - Panel_Widget_TownNpcNavi:GetSizeX() - 20)
  Panel_Widget_TownNpcNavi:SetPosY(10)
end

FGlobal_TownfunctionNavi_UnSetWorldMap = function()
  -- function num : 0_10
  if not Panel_Widget_TownNpcNavi:GetShow() then
    Panel_Widget_TownNpcNavi:SetShow(true)
  end
  TownNpcIcon_Resize()
end

FromClient_SpawnTypeInit = function()
  -- function num : 0_11 , upvalues : _spawnType
  _spawnType = -1
  TownfunctionNavi_Set()
end

FGlobal_TownNpcNavi_AddEffect = function(effectName, isLoop, offsetPosX, offsetPosY)
  -- function num : 0_12 , upvalues : toggleBtn
  toggleBtn:AddEffect(effectName, isLoop, offsetPosX, offsetPosY)
end

FGlobal_TownNpcNavi_EraseAllEffect = function()
  -- function num : 0_13 , upvalues : toggleBtn
  toggleBtn:EraseAllEffect()
end

FGlobal_TownNpcNavi_GetFindNaviButton = function()
  -- function num : 0_14 , upvalues : toggleBtn
  return toggleBtn
end

FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex = function(arrayIndex)
  -- function num : 0_15 , upvalues : npcNaviIcon
  return npcNaviIcon[arrayIndex]
end

FGlobal_TownNavi_SetEffectForNewbie = function(bShow)
  -- function num : 0_16 , upvalues : toggleBtn
  toggleBtn:EraseAllEffect()
  if bShow == true then
    if getSelfPlayer() == nil then
      return 
    end
    if ((getSelfPlayer()):get()):getLevel() > 51 then
      return 
    end
    toggleBtn:AddEffect("UI_NPCNavi_Line", true, -1, 1)
  end
end

local townNaviEffectTimeCheck = 0
FGlobal_TownNpcNavi_UpdatePerFrame = function(deltaTime)
  -- function num : 0_17 , upvalues : townNaviEffectTimeCheck
  townNaviEffectTimeCheck = townNaviEffectTimeCheck + deltaTime
  if townNaviEffectTimeCheck > 10 then
    if PaGlobal_TutorialManager:isDoingTutorial() == false then
      FGlobal_TownNavi_SetEffectForNewbie(true)
    end
    townNaviEffectTimeCheck = 0
  end
end

Panel_Widget_TownNpcNavi:RegisterUpdateFunc("FGlobal_TownNpcNavi_UpdatePerFrame")
TownNpcIcon_Resize()
registerEvent("selfPlayer_regionChanged", "TownfunctionNavi_Set")
registerEvent("onScreenResize", "TownNpcIcon_Resize")
registerEvent("FromClient_DeleteNavigationGuide", "FromClient_SpawnTypeInit")
registerEvent("FromClient_ClearNavigationGuide", "FromClient_SpawnTypeInit")

