-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dance\danceui.luac 

-- params : ...
-- function num : 0
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_IngameCustomize}, false)
Dance_Open = function()
  -- function num : 0_0 , upvalues : renderMode
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_BEAUTYOPENALERT_INDEAD"))
    return 
  end
  ToClient_SaveUiInfo(false)
  if isFlushedUI() then
    return 
  end
  local terraintype = selfPlayerNaviMaterial()
  if terraintype == 8 or terraintype == 9 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_DONTOPEN_INWATER"))
    return 
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Gacha_Roulette then
    return 
  end
  if getGameDanceEditor() == nil or (getGameDanceEditor()):isShow() == true or (getGameDanceEditor()):show() == false then
    return 
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  SetUIMode((Defines.UIMode).eUIMode_InGameDance)
  renderMode:set()
end

Dance_Show = function(show)
  -- function num : 0_1
  Panel_DanceEdit:SetShow(show, false)
  Panel_DanceAction:SetShow(show, false)
  if show == true then
  end
end

Dance_ShowUpUI = function()
  -- function num : 0_2
  Dance_Show(true)
end

Dance_Close = function()
  -- function num : 0_3 , upvalues : renderMode
  Dance_Show(false)
  ;
  (getGameDanceEditor()):hide()
  renderMode:reset()
  SetUIMode((Defines.UIMode).eUIMode_Default)
end

registerEvent("OpenDanceInfoUI", "Dance_Open")
registerEvent("Dance_ShowUpUI", "Dance_ShowUpUI")

