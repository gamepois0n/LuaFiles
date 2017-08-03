-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\introduction\panel_introduction.luac 

-- params : ...
-- function num : 0
local UI_Color = Defines.Color
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TM = CppEnums.TextMode
local UI_classType = CppEnums.ClassType
local classPicture = {
[UI_classType.ClassType_Warrior] = {1, 1, 96, 145}
, 
[UI_classType.ClassType_Ranger] = {97, 1, 192, 145}
, 
[UI_classType.ClassType_Sorcerer] = {193, 1, 288, 145}
, 
[UI_classType.ClassType_Giant] = {289, 1, 384, 145}
, 
[UI_classType.ClassType_Tamer] = {385, 1, 480, 145}
, 
[UI_classType.ClassType_BladeMaster] = {1, 146, 96, 290}
, 
[UI_classType.ClassType_BladeMasterWomen] = {193, 146, 288, 290}
, 
[UI_classType.ClassType_Valkyrie] = {97, 146, 192, 290}
, 
[UI_classType.ClassType_Wizard] = {289, 146, 384, 290}
, 
[UI_classType.ClassType_WizardWomen] = {385, 146, 480, 290}
, 
[UI_classType.ClassType_NinjaWomen] = {1, 291, 96, 435}
, 
[UI_classType.ClassType_NinjaMan] = {97, 291, 192, 435}
, 
[UI_classType.ClassType_DarkElf] = {193, 291, 288, 435}
, 
[UI_classType.ClassType_Combattant] = {289, 291, 384, 435}
, 
[UI_classType.ClassType_CombattantWomen] = {385, 291, 480, 435}
}
local tooltip = {_bg = (UI.getChildControl)(Panel_Introduction, "Static_TooltipBG"), _pic = (UI.getChildControl)(Panel_Introduction, "Static_CharacterPic"), _name = (UI.getChildControl)(Panel_Introduction, "StaticText_FamilyName"), _level = (UI.getChildControl)(Panel_Introduction, "StaticText_CharacterLv"), _desc = (UI.getChildControl)(Panel_Introduction, "StaticText_SelfIntro"), _close = (UI.getChildControl)(Panel_Introduction, "Button_Close")}
;
(tooltip._desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(tooltip._close):addInputEvent("Mouse_LUp", "FGlobal_Introcution_TooltipHide()")
FGlobal_Introcution_TooltipHide = function()
  -- function num : 0_0
  Panel_Introduction:SetShow(false)
end

local replaceClassType = function(classNo)
  -- function num : 0_1 , upvalues : UI_classType
  local returnValue = ""
  if UI_classType.ClassType_Warrior == classNo then
    returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WARRIOR")
  else
    if UI_classType.ClassType_Ranger == classNo then
      returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_RANGER")
    else
      if UI_classType.ClassType_Sorcerer == classNo then
        returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_SORCERER")
      else
        if UI_classType.ClassType_Giant == classNo then
          returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_GIANT")
        else
          if UI_classType.ClassType_Tamer == classNo then
            returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_TAMER")
          else
            if UI_classType.ClassType_BladeMaster == classNo then
              returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_BLADEMASTER")
            else
              if UI_classType.ClassType_BladeMasterWomen == classNo then
                returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_BLADEMASTERWOMAN")
              else
                if UI_classType.ClassType_Valkyrie == classNo then
                  returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_VALKYRIE")
                else
                  if UI_classType.ClassType_Wizard == classNo then
                    returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WIZARD")
                  else
                    if UI_classType.ClassType_WizardWomen == classNo then
                      returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WIZARDWOMAN")
                    else
                      if UI_classType.ClassType_Kunoichi == classNo then
                        returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_KUNOICHI")
                      else
                        if UI_classType.ClassType_NinjaWomen == classNo then
                          returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_NINJAWOMEN")
                        else
                          if UI_classType.ClassType_NinjaMan == classNo then
                            returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_NINJAMAN")
                          else
                            if UI_classType.ClassType_DarkElf == classNo then
                              returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_DARKELF")
                            else
                              if UI_classType.ClassType_Combattant == classNo then
                                returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_STRIKER")
                              else
                                if UI_classType.ClassType_CombattantWomen == classNo then
                                  returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_COMBATTANTWOMEN")
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
  return returnValue
end

local panelSizeY = Panel_Introduction:GetSizeY()
FGlobal_Introduction_TooltipShow = function(uiControl, name, desc, isClose, actorKey)
  -- function num : 0_2 , upvalues : tooltip, panelSizeY, replaceClassType, classPicture
  FGlobal_Introcution_TooltipHide()
  Panel_Introduction:SetShow(true)
  local self = tooltip
  ;
  (self._bg):SetShow(true)
  ;
  (self._name):SetShow(true)
  ;
  (self._desc):SetShow(true)
  ;
  (self._close):SetShow(isClose)
  ;
  (self._name):SetText(name)
  local nameLength = (math.max)(135, (self._name):GetTextSizeX() + 15) + 15
  if desc == nil or desc == "" then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO_NODATA")
  end
  ;
  (self._desc):SetText(desc)
  if (self._desc):GetTextSizeY() > 70 then
    local plusSizeY = (self._desc):GetTextSizeY() - 68
    Panel_Introduction:SetSize(Panel_Introduction:GetSizeX(), panelSizeY + plusSizeY)
    ;
    (tooltip._bg):SetSize(Panel_Introduction:GetSizeX(), panelSizeY + plusSizeY)
  else
    do
      Panel_Introduction:SetSize(Panel_Introduction:GetSizeX(), panelSizeY)
      ;
      (tooltip._bg):SetSize(Panel_Introduction:GetSizeX(), panelSizeY)
      local playerActorProxyWrapper = getPlayerActor(actorKey)
      local charLevel = (playerActorProxyWrapper:get()):getLevel()
      local playerClass = playerActorProxyWrapper:getClassType()
      ;
      (tooltip._level):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INTRODUCTIONMYSELF_SUBINFO", "class", replaceClassType(playerClass), "level", charLevel))
      ;
      (tooltip._pic):ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/Lobby_ClassSelect_00.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(tooltip._pic, (classPicture[playerClass])[1], (classPicture[playerClass])[2], (classPicture[playerClass])[3], (classPicture[playerClass])[4])
      ;
      ((tooltip._pic):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (tooltip._pic):setRenderTexture((tooltip._pic):getBaseTexture())
      local posX, posY = nil, nil
      if uiControl ~= nil then
        posX = uiControl:GetPosX() + 130
        posY = uiControl:GetPosY() + 25
      else
        posX = getScreenSizeX() / 3
        posY = getScreenSizeY() / 3
      end
      Panel_Introduction:SetPosX(posX)
      Panel_Introduction:SetPosY(posY)
      ;
      (self._close):ComputePos()
    end
  end
end

FromClient_InterActionUserIntroduction = function(actorKey)
  -- function num : 0_3
  local name, desc, uiControl = nil, nil, nil
  local playerActorProxyWrapper = getPlayerActor(actorKey)
  local name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTRODUCTIONMYSELF_TITLE", "name", playerActorProxyWrapper:getOriginalName())
  local desc = playerActorProxyWrapper:getUserIntroduction()
  FGlobal_Introduction_TooltipShow(uiControl, name, desc, true, actorKey)
end

registerEvent("FromClient_InterActionUserIntroduction", "FromClient_InterActionUserIntroduction")

