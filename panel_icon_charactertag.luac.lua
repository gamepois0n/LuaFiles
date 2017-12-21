-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\charactertag\panel_icon_charactertag.luac 

-- params : ...
-- function num : 0
local Button_CharacterTag = nil
local isOpenCharacterTag = ToClient_IsContentsGroupOpen("330")
PaGlobal_CharacterTag_SetPosIcon = function()
  -- function num : 0_0 , upvalues : Button_CharacterTag, isOpenCharacterTag
  if isFlushedUI() then
    return 
  end
  if Button_CharacterTag == nil then
    return 
  end
  if PaGlobal_TutorialManager:isDoingTutorial() == true then
    return 
  end
  if isOpenCharacterTag == true then
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
    Panel_Icon_CharacterTag:SetShow(true)
    Panel_Icon_CharacterTag:SetPosX(posX)
    Panel_Icon_CharacterTag:SetPosY(posY)
  else
    do
      Panel_Icon_CharacterTag:SetShow(false)
    end
  end
end

PaGlobal_CharacterTag_IconMouseToolTip = function(isShow)
  -- function num : 0_1
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
end

InitializeTagIcon = function()
  -- function num : 0_2 , upvalues : Button_CharacterTag
  Panel_Icon_CharacterTag:SetIgnore(false)
  Button_CharacterTag = (UI.getChildControl)(Panel_Icon_CharacterTag, "Button_TagIcon")
  Button_CharacterTag:ActiveMouseEventEffect(true)
  Button_CharacterTag:addInputEvent("Mouse_LUp", "PaGlobal_CharacterTag_Open()")
  Button_CharacterTag:addInputEvent("Mouse_RUp", "PaGlobal_TagCharacter_Change()")
  Button_CharacterTag:addInputEvent("Mouse_Out", "PaGlobal_CharacterTag_IconMouseToolTip(false)")
  Button_CharacterTag:addInputEvent("Mouse_On", "PaGlobal_CharacterTag_IconMouseToolTip(true)")
  PaGlobal_CharacterTag_SetPosIcon()
end

registerEvent("FromClient_luaLoadComplete", "InitializeTagIcon")

