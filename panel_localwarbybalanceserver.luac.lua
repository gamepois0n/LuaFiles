-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_localwarbybalanceserver.luac 

-- params : ...
-- function num : 0
Panel_LocalwarByBalanceServer:SetShow(false)
local localwarWidget = (UI.getChildControl)(Panel_LocalwarByBalanceServer, "Static_LocalWar")
local txt_LocalwarIcon = (UI.getChildControl)(localwarWidget, "StaticText_1")
PaGlobal_Panel_LocalwarByBalanceServer_Init = function()
  -- function num : 0_0 , upvalues : txt_LocalwarIcon, localwarWidget
  txt_LocalwarIcon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_LOCALWAR_INFO"))
  localwarWidget:addInputEvent("Mouse_LUp", "PaGlobal_Panel_LocalwarByBalanceServer_ClickMessage()")
  localwarWidget:SetVertexAniRun("Ani_Color_Reset", true)
  Panel_LocalwarByBalanceServer:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - Panel_Radar:GetSizeX() / 2)
  Panel_LocalwarByBalanceServer:SetPosY(Panel_Radar:GetPosY() + Panel_Radar:GetSizeY() / 2)
end

PaGlobal_Panel_LocalwarByBalanceServer_ClickMessage = function()
  -- function num : 0_1
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CURRENTCHANNELJOIN")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = PaGlobal_Panel_LocalwarByBalanceServer_Click, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PaGlobal_Panel_LocalwarByBalanceServer_Click = function()
  -- function num : 0_2
  audioPostEvent_SystemUi(1, 6)
  local playerWrapper = getSelfPlayer()
  local player = playerWrapper:get()
  local hp = player:getHp()
  local maxHp = player:getMaxHp()
  local isGameMaster = ToClient_SelfPlayerIsGM()
  if ToClient_GetMyTeamNoLocalWar() == 0 then
    if hp == maxHp or isGameMaster then
      ToClient_JoinLocalWar()
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_MAXHP_CHECK"))
    end
  else
  end
  if hp ~= maxHp then
    if isGameMaster then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_MAXHP_CHECK"))
    end
  end
end

PaGlobal_Panel_LocalwarByBalanceServer_Position = function()
  -- function num : 0_3
  Panel_LocalwarByBalanceServer:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - Panel_Radar:GetSizeX() / 2)
  Panel_LocalwarByBalanceServer:SetPosY(Panel_Radar:GetPosY() + Panel_Radar:GetSizeY() / 2)
end

PaGlobal_Panel_LocalwarByBalanceServer_Open = function()
  -- function num : 0_4
  local curChannelData = getCurrentChannelServerData()
  local isBalanceServer = curChannelData._isBalanceChannel
  if isBalanceServer == true then
    if ToClient_GetMyTeamNoLocalWar() == 0 then
      Panel_LocalwarByBalanceServer:SetShow(true)
    else
      Panel_LocalwarByBalanceServer:SetShow(false)
    end
  else
    Panel_LocalwarByBalanceServer:SetShow(false)
  end
end

PaGlobal_Panel_LocalwarByBalanceServer_Init()
PaGlobal_Panel_LocalwarByBalanceServer_Open()
registerEvent("onScreenResize", "PaGlobal_Panel_LocalwarByBalanceServer_Position")

