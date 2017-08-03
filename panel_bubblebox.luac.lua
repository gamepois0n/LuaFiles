-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\characternametag\panel_bubblebox.luac 

-- params : ...
-- function num : 0
Panel_Copy_BubbleBox:SetPosX(-1000)
Panel_Copy_BubbleBox:SetPosY(-1000)
ToClient_SetBubbleBoxPanel(Panel_Copy_BubbleBox)
ToClient_InitializeBubbleBoxPanelPool(500)
EventBubbleBoxCreated = function(actorKeyRaw, targetPanel, actorType, actorProxyWrapper)
  -- function num : 0_0
  local bubbleBox = (UI.getChildControl)(targetPanel, "StaticText_BubbleBox")
  if bubbleBox ~= nil then
    bubbleBox:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    bubbleBox:SetAutoResize(true)
  end
end

registerEvent("EventBubbleBoxCreated", "EventBubbleBoxCreated")

