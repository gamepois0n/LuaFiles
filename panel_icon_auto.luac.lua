-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\autoquest\panel_icon_auto.luac 

-- params : ...
-- function num : 0
BlackSpiritIcon = {buttonBlackSpiritIcon = (UI.getChildControl)(Panel_Blackspirit_OnOff, "Button_Blackspirt")}
PaGlobal_PossessByBlackSpiritIcon = {}
-- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_PossessByBlackSpiritIcon.Init = function(self)
  -- function num : 0_0
  (BlackSpiritIcon.buttonBlackSpiritIcon):addInputEvent("Mouse_LUp", "PaGlobal_PossessByBlackSpiritIcon_OnOffToggle()")
end

PaGlobal_PossessByBlackSpiritIcon_OnOffToggle = function()
  -- function num : 0_1
  if PaGlobal_AutoManager._ActiveState == false then
    FromClient_AutoStart()
  else
    FromClient_AutoStop()
  end
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_PossessByBlackSpiritIcon.showAble = function(self)
  -- function num : 0_2
  if isFlushedUI() or ToClient_IsContentsGroupOpen("301") == false then
    return false
  end
  if ToClient_AutoPlay_UseableAutoPlay() == false then
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_PossessByBlackSpiritIcon.setPosIcon = function(self)
  -- function num : 0_3
  if isFlushedUI() then
    return 
  end
  if self:showAble() == true then
    local posX, posY = nil, nil
    if Panel_Icon_Camp:GetShow() then
      posX = Panel_Icon_Camp:GetPosX() + Panel_Icon_Camp:GetSizeX() - 3
      posY = Panel_Icon_Camp:GetPosY()
    else
      if Panel_Icon_Duel:GetShow() then
        posX = Panel_Icon_Duel:GetPosX() + Panel_Icon_Duel:GetSizeX() - 3
        posY = Panel_Icon_Duel:GetPosY()
      else
        if Panel_Icon_Maid:GetShow() then
          posX = Panel_Icon_Maid:GetPosX() + Panel_Icon_Maid:GetSizeX() - 3
          posY = Panel_Icon_Maid:GetPosY()
        else
          if Panel_Window_PetIcon:GetShow() then
            posX = Panel_Window_PetIcon:GetPosX() + Panel_Window_PetIcon:GetSizeX() - 3
            posY = Panel_Window_PetIcon:GetPosY()
          else
            if FGlobal_HouseIconCount() > 0 and Panel_MyHouseNavi:GetShow() then
              posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
              posY = Panel_MyHouseNavi:GetPosY()
            else
              if FGlobal_ServantIconCount() > 0 and Panel_Window_Servant:GetShow() then
                posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
                posY = Panel_Window_Servant:GetPosY()
              else
                posX = 0
                posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
              end
            end
          end
        end
      end
    end
    Panel_Blackspirit_OnOff:SetShow(true)
    Panel_Blackspirit_OnOff:SetPosX(posX)
    Panel_Blackspirit_OnOff:SetPosY(posY)
  else
    do
      Panel_Blackspirit_OnOff:SetShow(false)
    end
  end
end

PaGlobal_PossessByBlackSpiritIcon_UpdateVisibleState = function()
  -- function num : 0_4
  PaGlobal_PossessByBlackSpiritIcon:setPosIcon()
end

PaGlobal_PossessByBlackSpirit_Open = function()
  -- function num : 0_5
  PaGlobal_PossessByBlackSpiritIcon:setPosIcon()
  if PaGlobal_AutoManager._ActiveState == false then
    PaGlobal_AutoManager:start()
  end
end

PaGlobal_PossessByBlackSpiritIcon:Init()
registerEvent("FromClient_PossessByBlackSpiritIcon_UpdateVisibleState", "PaGlobal_PossessByBlackSpiritIcon_UpdateVisibleState")
registerEvent("FromClient_PossessByBlackSpirit_Open", "PaGlobal_PossessByBlackSpirit_Open")

