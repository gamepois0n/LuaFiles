-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\characternametag\panel_waitcomment.luac 

-- params : ...
-- function num : 0
Panel_Copy_WaitComment:SetPosX(-1000)
Panel_Copy_WaitComment:SetPosY(-1000)
FromClient_WaitCommentCreated = function(actorKeyRaw, targetPanel, selfPlayerActorWrapper)
  -- function num : 0_0
  copyPanelChild(Panel_Copy_WaitComment, targetPanel)
end

registerEvent("FromClient_WaitCommentCreated", "FromClient_WaitCommentCreated")

