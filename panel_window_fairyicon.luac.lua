-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fairyinfo\panel_window_fairyicon.luac 

-- params : ...
-- function num : 0
local FairyIcon = {_icon = (UI.getChildControl)(Panel_Window_FairyIcon, "Button_FairyIcon")}
PaGlobal_Fairy_SetPosIcon = function()
  -- function num : 0_0 , upvalues : FairyIcon
  do return  end
  if ToClient_IsDevelopment() == false then
    return 
  end
  if isFlushedUI() then
    return 
  end
  if FairyIcon._icon == nil then
    return 
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true then
    return 
  end
  if ToClient_getFairyUnsealedList() + ToClient_getFairySealedList() > 0 then
    local posX, posY = nil, nil
    if Panel_Icon_CharacterTag:GetShow() then
      posX = Panel_Icon_CharacterTag:GetPosX() + Panel_Icon_CharacterTag:GetSizeX() - 3
      posY = Panel_Icon_CharacterTag:GetPosY()
    else
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
              if Panel_Icon_Camp:GetShow() then
                posX = Panel_Icon_Camp:GetPosX() + Panel_Icon_Camp:GetSizeX() - 3
                posY = Panel_Icon_Camp:GetPosY()
              else
                if Panel_Blackspirit_OnOff:GetShow() then
                  posX = Panel_Blackspirit_OnOff:GetPosX() + Panel_Blackspirit_OnOff:GetSizeX() - 3
                  posY = Panel_Blackspirit_OnOff:GetPosY()
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
        end
      end
    end
    Panel_Window_FairyIcon:SetShow(true)
    Panel_Window_FairyIcon:SetPosX(posX)
    Panel_Window_FairyIcon:SetPosY(posY)
  else
    do
      Panel_Window_FairyIcon:SetShow(false)
    end
  end
end

InitializeFairyIcon = function()
  -- function num : 0_1 , upvalues : FairyIcon
  Panel_Window_FairyIcon:SetIgnore(false)
  ;
  (FairyIcon._icon):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_Open()")
  ;
  (FairyIcon._icon):ActiveMouseEventEffect(true)
  PaGlobal_Fairy_SetPosIcon()
end

registerEvent("FromClient_luaLoadComplete", "InitializeFairyIcon")

