-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\autoquest\panel_autoquest.luac 

-- params : ...
-- function num : 0
Panel_AutoQuest:SetShow(false)
PaGlobal_AutoQuestMsg = {
_ui = {_staticBlackSpirit = (UI.getChildControl)(Panel_AutoQuest, "Static_BlackSpirit"), _staticStartAutoBG = (UI.getChildControl)(Panel_AutoQuest, "Static_StartAutoBG"), _staticTextStartAuto = nil}
, _accessBlackSpiritClick = nil}
-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AutoQuestMsg._ui)._btn_Start = (UI.getChildControl)((PaGlobal_AutoQuestMsg._ui)._staticStartAutoBG, "Button_BlackSpirit")
-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AutoQuestMsg._ui)._static_OutLine = (UI.getChildControl)((PaGlobal_AutoQuestMsg._ui)._staticStartAutoBG, "Static_OutLineDefault")
-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AutoQuestMsg._ui)._static_MainLightBG = (UI.getChildControl)((PaGlobal_AutoQuestMsg._ui)._staticStartAutoBG, "Static_MainLightBG")
-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AutoQuestMsg._ui)._static_Over = (UI.getChildControl)((PaGlobal_AutoQuestMsg._ui)._staticStartAutoBG, "Static_Over")
-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AutoQuestMsg._ui)._static_Under = (UI.getChildControl)((PaGlobal_AutoQuestMsg._ui)._staticStartAutoBG, "Static_Under")
-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AutoQuestMsg._ui)._static_StarBG1 = (UI.getChildControl)((PaGlobal_AutoQuestMsg._ui)._staticStartAutoBG, "Static_StarBG1")
-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

;
(PaGlobal_AutoQuestMsg._ui)._static_StarBG2 = (UI.getChildControl)((PaGlobal_AutoQuestMsg._ui)._staticStartAutoBG, "Static_StarBG2")
-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestMsg.Initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._staticTextStartAuto = (UI.getChildControl)((self._ui)._staticStartAutoBG, "StaticText_StartAutoText")
  ;
  ((self._ui)._btn_Start):addInputEvent("Mouse_LUp", "FGlobal_MouseclickTest()")
  ;
  ((self._ui)._static_Over):SetPosX(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2)
  ;
  ((self._ui)._static_Over):SetPosY(((self._ui)._static_OutLine):GetPosY() - 5)
  ;
  ((self._ui)._static_Under):SetPosX(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2)
  ;
  ((self._ui)._static_Under):SetPosY(((self._ui)._static_OutLine):GetPosY() + ((self._ui)._static_OutLine):GetSizeY() - 5)
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestMsg.AniShow = function(self)
  -- function num : 0_1
  local ImageMoveAni1 = ((self._ui)._static_Over):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni1:SetStartPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() - 5)
  ImageMoveAni1:SetEndPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() - 10)
  ImageMoveAni1.IsChangeChild = true
  ;
  ((self._ui)._static_Over):CalcUIAniPos(ImageMoveAni1)
  ImageMoveAni1:SetDisableWhileAni(true)
  local ImageMoveAni2 = ((self._ui)._static_Under):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni2:SetStartPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() + ((self._ui)._static_OutLine):GetSizeY() - 5)
  ImageMoveAni2:SetEndPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() + ((self._ui)._static_OutLine):GetSizeY())
  ImageMoveAni2.IsChangeChild = true
  ;
  ((self._ui)._static_Under):CalcUIAniPos(ImageMoveAni2)
  ImageMoveAni2:SetDisableWhileAni(true)
  local fadeColor1 = ((self._ui)._static_Over):addColorAnimation(0, 1.5, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  fadeColor1:SetStartColor((Defines.Color).C_FFFFFFFF)
  fadeColor1:SetEndColor((Defines.Color).C_FF24e8ff)
  local fadeColor2 = ((self._ui)._static_Under):addColorAnimation(0, 1.5, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  fadeColor2:SetStartColor((Defines.Color).C_FFFFFFFF)
  fadeColor2:SetEndColor((Defines.Color).C_FF24e8ff)
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestMsg.AniHide = function(self)
  -- function num : 0_2
  local ImageMoveAni1 = ((self._ui)._static_Over):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni1:SetStartPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() - 10)
  ImageMoveAni1:SetEndPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() - 5)
  ImageMoveAni1.IsChangeChild = true
  ;
  ((self._ui)._static_Over):CalcUIAniPos(ImageMoveAni1)
  ImageMoveAni1:SetDisableWhileAni(true)
  ImageMoveAni1:SetHideAtEnd(false)
  ImageMoveAni1:SetDisableWhileAni(true)
  local ImageMoveAni2 = ((self._ui)._static_Under):addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni2:SetStartPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() + ((self._ui)._static_OutLine):GetSizeY())
  ImageMoveAni2:SetEndPosition(((self._ui)._static_OutLine):GetPosX() + ((self._ui)._static_OutLine):GetSizeX() / 2 - ((self._ui)._static_Over):GetSizeX() / 2, ((self._ui)._static_OutLine):GetPosY() + ((self._ui)._static_OutLine):GetSizeY() - 5)
  ImageMoveAni2.IsChangeChild = true
  ;
  ((self._ui)._static_Under):CalcUIAniPos(ImageMoveAni2)
  ImageMoveAni2:SetDisableWhileAni(true)
  ImageMoveAni2:SetHideAtEnd(false)
  ImageMoveAni2:SetDisableWhileAni(true)
  local fadeColor1 = ((self._ui)._static_Over):addColorAnimation(0, 1.5, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  fadeColor1:SetStartColor((Defines.Color).C_FF24e8ff)
  fadeColor1:SetEndColor((Defines.Color).C_FFFFFFFF)
  local fadeColor2 = ((self._ui)._static_Under):addColorAnimation(0, 1.5, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  fadeColor2:SetStartColor((Defines.Color).C_FF24e8ff)
  fadeColor2:SetEndColor((Defines.Color).C_FFFFFFFF)
end

FGlobal_AutoQuestBlackSpiritMessage = function(message)
  -- function num : 0_3
  self = PaGlobal_AutoQuestMsg
  ;
  ((self._ui)._btn_Start):SetShow(true)
  ;
  ((self._ui)._staticStartAutoBG):SetShow(true)
  ;
  ((self._ui)._staticTextStartAuto):SetShow(true)
  ;
  ((self._ui)._staticTextStartAuto):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._staticTextStartAuto):SetText(message)
  if ((self._ui)._staticTextStartAuto):GetTextSizeX() > 300 then
    ((self._ui)._staticStartAutoBG):SetSize(450, ((self._ui)._staticTextStartAuto):GetTextSizeY() + 45)
  else
    ;
    ((self._ui)._staticStartAutoBG):SetSize(((self._ui)._staticTextStartAuto):GetTextSizeX() + 150, ((self._ui)._staticTextStartAuto):GetTextSizeY() + 45)
  end
  Panel_AutoQuest:SetShow(true)
end

FGlobal_AutoQuestBlakcSpirit_Hide = function()
  -- function num : 0_4
  Panel_AutoQuest:SetShow(false)
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestMsg.AniStart = function(self)
  -- function num : 0_5
  ((self._ui)._static_OutLine):ResetVertexAni()
  ;
  ((self._ui)._static_OutLine):SetVertexAniRun("Ani_Rotate_New", true)
  ;
  ((self._ui)._static_MainLightBG):SetVertexAniRun("Ani_Rotate_New", true)
  ;
  ((self._ui)._static_StarBG1):SetVertexAniRun("Ani_Color_BG1", true)
  ;
  ((self._ui)._static_StarBG2):SetVertexAniRun("Ani_Color_BG2", true)
  PaGlobal_AutoQuestMsg:AniShow()
  ;
  ((PaGlobal_AutoQuestMsg._ui)._staticBlackSpirit):EraseAllEffect()
  ;
  ((PaGlobal_AutoQuestMsg._ui)._staticBlackSpirit):AddEffect("fN_DarkSpirit_Idle_2_AutoQuest_02A", false, -50, -70)
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestMsg.AniStop = function(self)
  -- function num : 0_6
  ((self._ui)._static_OutLine):ResetVertexAni()
  ;
  ((self._ui)._static_OutLine):SetVertexAniRun("Ani_Rotate_Reset", true)
  ;
  ((self._ui)._static_MainLightBG):ResetVertexAni()
  ;
  ((self._ui)._static_StarBG1):ResetVertexAni()
  ;
  ((self._ui)._static_StarBG2):ResetVertexAni()
  PaGlobal_AutoQuestMsg:AniHide()
end

FGlobal_MouseclickTest = function()
  -- function num : 0_7
  self = PaGlobal_AutoQuestMsg
  FGlobal_AutoQuestBlackSpiritMessage(PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRIT_POSSESS_WANG"))
  if PaGlobal_AutoQuestMsg._accessBlackSpiritClick ~= nil then
    (PaGlobal_AutoQuestMsg._accessBlackSpiritClick)()
    PaGlobal_AutoQuestMsg:AniStart()
  end
end

FGlobal_EndBlackSpiritMessage = function()
  -- function num : 0_8
  self = PaGlobal_AutoQuestMsg
  ;
  ((self._ui)._staticTextStartAuto):SetText("")
  ;
  ((self._ui)._staticStartAutoBG):SetShow(false)
  PaGlobal_AutoQuestMsg:AniStop()
end

PaGlobal_AutoQuestMsg:Initialize()

