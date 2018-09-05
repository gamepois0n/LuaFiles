local UIGroup = Defines.UIGroup
local RenderMode = Defines.RenderMode
local _IsXbox = ToClient_isXBox()
runLua("UI_Data/Script/RenderMode/renderMode.lua")
local isActionModeActive = false
function isActionUiOpen()
  return isActionModeActive
end
local _isRemasterUIOption = ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(CppEnums.GlobalUIOptionType.SwapRemasterUISetting)
local _isRemasterUIInit = ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(CppEnums.GlobalUIOptionType.InitRemasterUI)
function PaGlobalFunc_IsRemasterUIOption()
  if false == _isRemasterUIInit then
    return true
  end
  return _isRemasterUIOption
end
function PaGlobalFunc_SetRemasterUIOption(isRemaster)
  _isRemasterUIOption = isRemaster
end
function basicLoadUI(panelNodeName, panelID, panelGroup)
  loadUI(panelNodeName, panelID, panelGroup, SETRENDERMODE_BITSET_DEFULAT())
end
function CheckTutorialEnd()
  if getSelfPlayer() == nil then
    return false
  end
  return ToClient_getTutorialLimitLevel() <= getSelfPlayer():get():getLevel()
end
function loadLogoUI()
  if true == _IsXbox then
    loadLogoUI_XB()
  else
    loadLogoUI_PC()
  end
end
function loadLoginUI()
  if true == _IsXbox then
    loadLoginUI_XB()
  else
    loadLoginUI_PC()
  end
end
function loadServerSelectUI()
  if true == _IsXbox then
    loadServerSelectUI_XB()
  else
    loadServerSelectUI_PC()
  end
end
function loadLoadingUI()
  if true == _IsXbox then
    loadLoadingUI_XB()
  else
    loadLoadingUI_PC()
  end
end
function loadSceneEditUI()
end
function loadLobbyUI()
  if true == _IsXbox then
    loadLobbyUI_XB()
  else
    loadLobbyUI_PC()
  end
end
function preLoadGameUI()
  if true == _IsXbox then
    preLoadGameUI_XB()
  else
    preLoadGameUI_PC()
  end
end
function loadGameUI()
  if true == _IsXbox then
    loadGameUI_XB()
  else
    loadGameUI_PC()
  end
end
function preLoadGameOptionUI()
  basicLoadUI("UI_Data/Window/WebHelper/Panel_WebControl.XML", "Panel_WebControl", UIGroup.PAGameUIGroup_DeadMessage)
  if true == _ContentsGroup_isNewOption then
    basicLoadUI("UI_Data/Window/c_Option/Panel_Option_Main.XML", "Panel_Window_cOption", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_Camera.XML", "Panel_Performance_Camera", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_GraphicQuality.XML", "Panel_Performance_GraphicQuality", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_Npc.XML", "Panel_Performance_Npc", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_Optimize.XML", "Panel_Performance_Optimize", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_OptimizeBeta.XML", "Panel_Performance_OptimizeBeta", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Alert.XML", "Panel_Function_Alert", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Nation.XML", "Panel_Function_Nation", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Camera.XML", "Panel_Graphic_Camera", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Effect.XML", "Panel_Graphic_Effect", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Quality.XML", "Panel_Graphic_Quality", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_ScreenShot.XML", "Panel_Graphic_ScreenShot", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Window.XML", "Panel_Graphic_Window", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Hdr.XML", "Panel_Graphic_HDR", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Sound_OnOff.XML", "Panel_Sound_OnOff", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Sound_Volume.XML", "Panel_Sound_Volume", UIGroup.PAGameUIGroup_Windows)
  elseif true == _ContentsGroup_RenewUI_RenewOPtion then
    basicLoadUI("UI_Data/Window/c_Option/Console/Panel_Window_OptionMain_Renew.XML", "Panel_Window_Option_Main", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Skill.XML", "Panel_Tooltip_Skill", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Skill_forLearning.XML", "Panel_Tooltip_Skill_forLearning", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Skill_BlackSpirit.XML", "Panel_Tooltip_Skill_forBlackSpirit", UIGroup.PAGameUIGroup_GameMenu)
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item.XML", "Panel_Tooltip_Item", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_InGameCashShop,
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_chattingLinkedItem.XML", "Panel_Tooltip_Item_chattingLinkedItem", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_chattingLinkedItemClick.XML", "Panel_Tooltip_Item_chattingLinkedItemClick", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_equipped.XML", "Panel_Tooltip_Item_equipped", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Guild_Introduce.XML", "Panel_Tooltip_Guild_Introduce", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Common.XML", "Panel_Tooltip_Common", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Worker.XML", "Panel_Worker_Tooltip", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Work.XML", "Panel_Tooltip_Work", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_SimpleText.XML", "Panel_Tooltip_SimpleText", UIGroup.PAGameUIGroup_SimpleTooltip)
end
function loadGameOptionUI()
  if true == _ContentsGroup_isNewOption then
    runLua("UI_Data/Script/Window/Option/GameOptionHeader.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionMain.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionUtil.lua")
    runLua("UI_Data/Script/Window/Option/Panel_Option_Main.lua")
    PaGlobal_Option:Init()
    ToClient_initGameOption()
  elseif true == _ContentsGroup_RenewUI_RenewOPtion then
    runLua("UI_Data/Script/Window/Option/GameOptionHeader_Renew.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionMain_Renew.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionUtil.lua")
    runLua("UI_Data/Script/Window/Option/Panel_Option_Main_Renew.lua")
    PaGlobal_Option:Init()
    ToClient_initGameOption()
  end
  runLua("UI_Data/Script/GlobalKeyBinder/globalKeyBinderManager.lua")
  runLua("UI_Data/Script/GlobalKeyBinder/globalKeyBinder.lua")
  runLua("UI_Data/Script/Tutorial/Panel_WebControl.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Skill.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Item.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Guild_Introduce.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Common.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_SimpleText.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_New_Worker.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_New_Work.lua")
end
function loadOceanUI()
  basicLoadUI("UI_Data/Window/Cutscene/Panel_CutsceneMovie.XML", "Panel_Cutscene", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Acquire/Acquire.XML", "Panel_Acquire", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Acquire/Acquire_QuestDirect.XML", "Panel_QuestDirect", UIGroup.PAGameUIGroup_ModalDialog)
  runLua("UI_Data/Script/Widget/Acquire/Acquire.lua")
  runLua("UI_Data/Script/CutScene_Ocean.lua")
  runLua("UI_Data/Script/Widget/Acquire/Acquire_QuestDirect.lua")
end
