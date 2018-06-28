local UIGroup = Defines.UIGroup
__Guild_LimitPrice = false
local renewalUiOpen = false
local isActionModeActive = false
function isActionUiOpen()
  return isActionModeActive
end
local isUseNewGlobalKeyBinder = true
function isUseNewGlobalKeyBinder_chk()
  return isUseNewGlobalKeyBinder
end
GlobalSwitch_UseOldAlchemy = false
isRecordMode = false
isLuaLoadingComplete = false
local RenderMode = Defines.RenderMode
local defaultRenderModeBitSet = PAUIRenderModeBitSet({
  RenderMode.eRenderMode_Default
})
local RenderModeWorldMapBitSet = PAUIRenderModeBitSet({
  RenderMode.eRenderMode_WorldMap
})
local RenderModeBitSetInGameCashShop = PAUIRenderModeBitSet({
  RenderMode.eRenderMode_InGameCashShop
})
local RenderModeAllModeOpen = PAUIRenderModeBitSet({
  RenderMode.eRenderMode_Default,
  RenderMode.eRenderMode_WorldMap,
  RenderMode.eRenderMode_Knowledge,
  RenderMode.eRenderMode_Dialog,
  RenderMode.eRenderMode_Dye,
  RenderMode.eRenderMode_InGameCashShop,
  RenderMode.eRenderMode_HouseInstallation,
  RenderMode.eRenderMode_BlackSpirit,
  RenderMode.eRenderMode_MentalGame,
  RenderMode.eRenderMode_customScreenShot,
  RenderMode.eRenderMode_UISetting,
  RenderMode.eRenderMode_CutScene,
  RenderMode.eRenderMode_IngameCustomize,
  RenderMode.eRenderMode_SkillWindow
})
runLua("UI_Data/Script/RenderMode/renderMode.lua")
function CheckTutorialEnd()
  if getSelfPlayer() == nil then
    return false
  end
  return ToClient_getTutorialLimitLevel() <= getSelfPlayer():get():getLevel()
end
local UIFontType = ToClient_getGameOptionControllerWrapper():getUIFontSizeType()
preloadUI_cahngeUIFontSize(UIFontType)
function basicLoadUI(panelNodeName, panelID, panelGroup)
  loadUI(panelNodeName, panelID, panelGroup, defaultRenderModeBitSet)
end
function loadLogoUI()
  basicLoadUI("UI_Data/UI_Lobby/UI_Logo.xml", "Panel_Logo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_SpecialCharacter.XML", "Panel_SpecialCharacter", UIGroup.PAGameUIGroup_ModalDialog)
  runLua("UI_Data/Script/Panel_Logo.lua")
  runLua("UI_Data/Script/Panel_SpecialCharacter.lua")
  if true == ToClient_isXBox() then
    loadXboxLoadingUI()
  end
end
function loadXboxUI()
  basicLoadUI("UI_Data/UI_Lobby/UI_Logo_Xbox.xml", "Panel_LogoXbox", UIGroup.PAGameUIGroup_Windows)
  if false == _ContentsGroup_RenewUI_MessageBox then
    basicLoadUI("UI_Data/Window/MessageBox/UI_Win_System.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  else
    basicLoadUI("UI_Data/Window/MessageBox/Console/Panel_MessageBox.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  end
  basicLoadUI("UI_Data/UI_Lobby/UI_GamerTag.XML", "Panel_GamerTag", UIGroup.PAGameUIGroup_GameSystemMenu, RenderModeAllModeOpen)
  runLua("UI_Data/Script/Panel_GamerTag.lua")
  if false == _ContentsGroup_RenewUI_MessageBox then
    runLua("UI_Data/Script/Window/MessageBox/MessageBox.lua")
  else
    runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBox_Renew.lua")
  end
  runLua("UI_Data/Script/Panel_LogoXbox.lua")
  runLua("UI_Data/Script/globalKeyBinderNotPlay.lua")
end
function loadXboxLoadingUI()
  loadUI("UI_Data/UI_Loading/UI_Loading_Progress_Xbox.XML", "Panel_Loading_Xbox", UIGroup.PAGameUIGroup_GameSystemMenu, RenderModeAllModeOpen)
  runLua("UI_Data/Script/Panel_Loading_Xbox.lua")
end
function loadLoginUI()
  if ToClient_isXBox() then
    basicLoadUI("UI_Data/Window/Policy/Panel_Window_Policy.XML", "Panel_Window_Policy", UIGroup.PAGameUIGroup_GameSystemMenu)
  end
  basicLoadUI("UI_Data/UI_Lobby/UI_TermsofGameUse.XML", "Panel_TermsofGameUse", UIGroup.PAGameUIGroup_Movie)
  if true == _ContentsGroup_RenewUI then
    basicLoadUI("UI_Data/UI_Lobby/Console/Panel_Lobby_Login_Renew.xml", "Panel_Login_Renew", UIGroup.PAGameUIGroup_MainUI)
  else
    basicLoadUI("UI_Data/UI_Lobby/UI_Login.xml", "Panel_Login", UIGroup.PAGameUIGroup_MainUI)
  end
  basicLoadUI("UI_Data/UI_Lobby/UI_Login_Password.XML", "Panel_Login_Password", UIGroup.PAGameUIGroup_GameSystemMenu)
  basicLoadUI("UI_Data/UI_Lobby/UI_Login_Nickname.XML", "Panel_Login_Nickname", UIGroup.PAGameUIGroup_GameSystemMenu)
  basicLoadUI("UI_Data/UI_Lobby/Console/Panel_Lobby_Nickname_Renew.XML", "Panel_Login_Nickname_Renew", UIGroup.PAGameUIGroup_GameSystemMenu)
  if false == _ContentsGroup_RenewUI_MessageBox then
    basicLoadUI("UI_Data/Window/MessageBox/UI_Win_System.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  else
    basicLoadUI("UI_Data/Window/MessageBox/Console/Panel_MessageBox.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  end
  basicLoadUI("UI_Data/Window/MessageBox/Panel_ScreenShot_For_Desktop.XML", "Panel_ScreenShot_For_Desktop", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_SpecialCharacter.XML", "Panel_SpecialCharacter", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/HelpMessage/Panel_HelpMessage.xml", "Panel_HelpMessage", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Window/MessageBox/Panel_KickOff.XML", "Panel_KickOff", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/UI_Lobby/UI_GamerTag.XML", "Panel_GamerTag", UIGroup.PAGameUIGroup_GameSystemMenu, RenderModeAllModeOpen)
  runLua("UI_Data/Script/Panel_GamerTag.lua")
  if ToClient_isXBox() then
    runLua("UI_Data/Script/Window/Policy/Panel_Window_Policy.lua")
  end
  runLua("UI_Data/Script/Panel_TermsofGameUse.lua")
  if true == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Panel_Login_Renew.lua")
    runLua("UI_Data/Script/Panel_Login_Nickname_Renew.lua")
  else
    runLua("UI_Data/Script/Panel_Login.lua")
    runLua("UI_Data/Script/Panel_Login_Nickname.lua")
  end
  runLua("UI_Data/Script/Panel_Login_Password.lua")
  if false == _ContentsGroup_RenewUI_MessageBox then
    runLua("UI_Data/Script/Window/MessageBox/MessageBox.lua")
  else
    runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBox_Renew.lua")
  end
  runLua("UI_Data/Script/Window/MessageBox/Panel_ScreenShot_For_Desktop.lua")
  runLua("UI_Data/Script/Window/MessageBox/Panel_KickOff.lua")
  runLua("UI_Data/Script/globalKeyBinderNotPlay.lua")
  runLua("UI_Data/Script/Panel_SpecialCharacter.lua")
  runLua("UI_Data/Script/Widget/HelpMessage/Panel_HelpMessage.lua")
  if _ContentsGroup_isConsoleTest then
    loadUI("UI_Data/Widget/MainStatus/UI_Cursor.XML", "Panel_Cursor", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_customScreenShot,
      RenderMode.eRenderMode_IngameCustomize
    }))
    runLua("UI_Data/Script/globalPreLoadUI.lua")
  end
  preLoadGameOptionUI()
  loadGameOptionUI()
end
function loadSceneEditUI()
end
function loadServerSelectUI()
  if true == _ContentsGroup_RenewUI then
    basicLoadUI("UI_Data/UI_Lobby/Console/Panel_Lobby_ServerSelect_Renew.xml", "Panel_ServerSelect_Renew", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/UI_Lobby/UI_ServerSelect_New.xml", "Panel_ServerSelect", UIGroup.PAGameUIGroup_Windows)
  end
  if false == _ContentsGroup_RenewUI_MessageBox then
    basicLoadUI("UI_Data/Window/MessageBox/UI_Win_System.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  else
    basicLoadUI("UI_Data/Window/MessageBox/Console/Panel_MessageBox.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  end
  basicLoadUI("UI_Data/Window/MessageBox/Panel_ScreenShot_For_Desktop.XML", "Panel_ScreenShot_For_Desktop", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_SpecialCharacter.XML", "Panel_SpecialCharacter", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_SimpleText.XML", "Panel_Tooltip_SimpleText", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Window/MessageBox/Panel_KickOff.XML", "Panel_KickOff", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/UI_Lobby/UI_GamerTag.XML", "Panel_GamerTag", UIGroup.PAGameUIGroup_GameSystemMenu, RenderModeAllModeOpen)
  runLua("UI_Data/Script/Panel_GamerTag.lua")
  if true == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Widget/Lobby/Panel_Lobby_ServerSelect_Renew.lua")
  else
    runLua("UI_Data/Script/Panel_ServerSelect.lua")
  end
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_SimpleText.lua")
  if false == _ContentsGroup_RenewUI_MessageBox then
    runLua("UI_Data/Script/Window/MessageBox/MessageBox.lua")
  else
    runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBox_Renew.lua")
  end
  runLua("UI_Data/Script/Window/MessageBox/Panel_ScreenShot_For_Desktop.lua")
  runLua("UI_Data/Script/globalKeyBinderNotPlay.lua")
  runLua("UI_Data/Script/Panel_SpecialCharacter.lua")
  runLua("UI_Data/Script/Window/MessageBox/Panel_KickOff.lua")
end
function loadLoadingUI()
  loadUI("UI_Data/UI_Loading/UI_Loading_Progress.xml", "Panel_Loading", UIGroup.PAGameUIGroup_GameSystemMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Loading
  }))
  runLua("UI_Data/Script/Panel_Loading.lua")
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_SimpleText.XML", "Panel_Tooltip_SimpleText", UIGroup.PAGameUIGroup_ModalDialog, RenderModeAllModeOpen)
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_SimpleText.lua")
  basicLoadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeName.XML", "Panel_NodeName", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_InSideNode.XML", "Panel_NodeMenu", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_InSideNode_Guild.XML", "Panel_NodeOwnerInfo", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeSiegeTooltip.XML", "Panel_NodeSiegeTooltip", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_WarInfo.XML", "Panel_Win_Worldmap_WarInfo", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeWarInfo.XML", "Panel_Win_Worldmap_NodeWarInfo", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_NavigationButton.XML", "Panel_NaviButton", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Widget/WarInfoMessage/Panel_WarInfoMessage.XML", "Panel_WarInfoMessage", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Widget/WarInfoMessage/Panel_TerritoryWarKillingScore.XML", "Panel_TerritoryWarKillingScore", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_WolrdHouseInfo.XML", "Panel_WolrdHouseInfo", UIGroup.PAGameUIGroup_WorldMap_Popups)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_SpecialCharacter.XML", "Panel_SpecialCharacter", UIGroup.PAGameUIGroup_ModalDialog)
  ToClient_initializeWorldMap("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_Base.XML")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_PopupManager.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_HouseHold.lua")
  runLua("UI_Data/Script/Window/WorldMap_Grand/Grand_WorldMap_NodeMenu.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_Knowledge.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_Delivery.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_PinGuide.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WarInfo.lua")
  runLua("UI_Data/Script/Panel_SpecialCharacter.lua")
  if false == _ContentsGroup_RenewUI_MessageBox then
    loadUI("UI_Data/Window/MessageBox/UI_Win_System.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Loading
    }))
  else
    loadUI("UI_Data/Window/MessageBox/Console/Panel_MessageBox.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Loading
    }))
  end
  if false == _ContentsGroup_RenewUI_MessageBox then
    runLua("UI_Data/Script/Window/MessageBox/MessageBox.lua")
  else
    runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBox_Renew.lua")
  end
  ToCleint_openWorldMapForLoading()
end
function preloadCustomizationUI()
  if true == _ContentsGroup_RenewUI_Customization then
    loadUI("UI_Data/Customization/Console/Panel_Customizing.xml", "Panel_Customizing", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_BodyPose.xml", "Panel_Customizing_BodyPose", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_BodyShape.xml", "Panel_Customizing_BodyShape", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_Skin.xml", "Panel_Customizing_Skin", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_FaceShape.xml", "Panel_Customizing_FaceShape", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_HairShape.xml", "Panel_Customizing_HairShape", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_Mesh.xml", "Panel_Customizing_Mesh", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_InputName.xml", "Panel_Customizing_InputName", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_ShowOutfit.xml", "Panel_Customizing_ShowOutfit", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_ShowPose.xml", "Panel_Customizing_ShowPose", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_Voice.xml", "Panel_Customizing_Voice", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/Console/Panel_Customizing_CommonDecoration.xml", "Panel_Customizing_CommonDecoration", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    basicLoadUI("UI_Data/UI_Lobby/UI_Startl.xml", "Panel_Start", UIGroup.PAGameUIGroup_Windows)
  else
    loadUI("UI_Data/Customization/UI_Customization_Common_Decoration.xml", "Panel_Customization_Common_Decoration", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Main.XML", "Panel_CustomizationMain", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Transform.xml", "Panel_CustomizationTransform", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_TransformHair.xml", "Panel_CustomizationTransformHair", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_TransformBody.xml", "Panel_CustomizationTransformBody", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_CustomizationTest.xml", "Panel_CustomizationTest", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Control.xml", "Panel_Customization_Control", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Mesh.xml", "Panel_CustomizationMesh", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Motion.xml", "Panel_CustomizationMotion", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Expression.xml", "Panel_CustomizationExpression", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Cloth.xml", "Panel_CustomizationCloth", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_PoseEditor.xml", "Panel_CustomizationPoseEdit", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Frame.xml", "Panel_CustomizationFrame", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Skin.xml", "Panel_CustomizationSkin", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Static.xml", "Panel_CustomizationStatic", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_Voice.xml", "Panel_CustomizationVoice", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_TextureMenu.xml", "Panel_CustomizationTextureMenu", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
    loadUI("UI_Data/Customization/UI_Customization_ImagePreset.xml", "Panel_CustomizationImage", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_IngameCustomize
    }))
  end
  loadUI("UI_Data/Customization/UI_Customization_Message.xml", "Panel_CustomizationMessage", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_IngameCustomize
  }))
  loadUI("UI_Data/Window/FileExplorer/FileExplorer.XML", "Panel_FileExplorer", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_IngameCustomize
  }))
  loadUI("UI_Data/Window/CustomizingAlbum/Panel_Window_CustomizingAlbum.xml", "Panel_CustomizingAlbum", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_IngameCustomize
  }))
  loadUI("UI_Data/Widget/ScreenShotMode/Panel_Widget_ScreenShotFrame.xml", "Panel_Widget_ScreenShotFrame", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_customScreenShot,
    RenderMode.eRenderMode_IngameCustomize
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_SimpleText.XML", "Panel_Tooltip_SimpleText", UIGroup.PAGameUIGroup_ModalDialog, RenderModeAllModeOpen)
end
function loadCustomizationUI()
  if true == _ContentsGroup_RenewUI_Customization then
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_Main_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_Common_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_Decoration_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_HairShape_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_Mesh_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_CustomizaingHandle_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_PaletteHandle_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_FaceBone_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_BodyBone_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_BodyPose_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_Skin_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_Voice_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_ShowPose_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_ShowCloth_Renew.lua")
    runLua("UI_Data/Script/Customization/Console/Panel_Customization_InputName_Renew.lua")
  else
    runLua("UI_Data/Script/Customization/Customization_Common.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_HairShape.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_Common_Decoration.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_UiFrame.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_Mesh.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_FaceBone.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_BodyBone.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_Skin.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_Pose.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_Palette.lua")
    runLua("UI_Data/Script/Customization/Panel_CharacterCreation_Main.lua")
    runLua("UI_Data/Script/Customization/Panel_Action_Expression.lua")
    runLua("UI_Data/Script/Customization/Panel_Action_Cloth.lua")
    runLua("UI_Data/Script/Customization/Panel_Action_Pose.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_Voice.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_TextureMenu.lua")
    runLua("UI_Data/Script/Customization/Panel_Customization_Image.lua")
    runLua("UI_Data/Script/Customization/Customization_HistoryTable.lua")
  end
  runLua("UI_Data/Script/Window/FileExplorer/FileExplorer.lua")
  runLua("UI_Data/Script/Window/FileExplorer/FileExplorer_GuildInfo.lua")
  runLua("UI_Data/Script/Window/FileExplorer/FileExplorer_Customization.lua")
  runLua("UI_Data/Script/Widget/CustomScreenShot/CustomScreenShot.lua")
  runLua("UI_Data/Script/Customization/Panel_Customization_WebAlbum.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_SimpleText.lua")
end
function loadLobbyUI()
  basicLoadUI("UI_Data/UI_Lobby/UI_Startl.xml", "Panel_Start", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/UI_Lobby/UI_CharacterSelect.xml", "Panel_CharacterSelect", UIGroup.PAGameUIGroup_Windows)
  if true == _ContentsGroup_RenewUI then
    basicLoadUI("UI_Data/UI_Lobby/Console/Panel_Lobby_CharacterSelect_Renew.xml", "Panel_CharacterSelect_Renew", UIGroup.PAGameUIGroup_Windows)
  elseif renewalUiOpen then
    basicLoadUI("UI_Data/UI_Lobby/UI_CharacterSelectRenewal.xml", "Panel_CharacterSelectNew", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/UI_Lobby/UI_CharacterSelectNew.xml", "Panel_CharacterSelectNew", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/UI_Lobby/UI_CharacterCreate_SelectClass.xml", "Panel_CharacterCreateSelectClass", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/UI_Lobby/UI_CharacterCreate.xml", "Panel_CharacterCreate", UIGroup.PAGameUIGroup_Windows)
  if false == _ContentsGroup_RenewUI_MessageBox then
    basicLoadUI("UI_Data/Window/MessageBox/UI_Win_System.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  else
    basicLoadUI("UI_Data/Window/MessageBox/Console/Panel_MessageBox.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_ModalDialog)
  end
  basicLoadUI("UI_Data/Window/MessageBox/Panel_ScreenShot_For_Desktop.XML", "Panel_ScreenShot_For_Desktop", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Window/FirstLogin/Panel_FirstLogin.XML", "Panel_FirstLogin", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/NoticeAlert/NoticeAlert.XML", "Panel_NoticeAlert", UIGroup.PAGameUIGroup_GameSystemMenu)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_SpecialCharacter.XML", "Panel_SpecialCharacter", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Window/Panel_IME.XML", "Panel_IME", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Widget/DataProgress/Panel_DataProgress.XML", "Panel_DataProgress", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/UI_Lobby/UI_GamerTag.XML", "Panel_GamerTag", UIGroup.PAGameUIGroup_GameSystemMenu, RenderModeAllModeOpen)
  runLua("UI_Data/Script/Panel_GamerTag.lua")
  runLua("UI_Data/Script/Common/Common_UIMode.lua")
  preloadCustomizationUI()
  loadCustomizationUI()
  basicLoadUI("UI_Data/Widget/NakMessage/NakMessage.XML", "Panel_NakMessage", UIGroup.PAGameUIGroup_ModalDialog)
  runLua("UI_Data/Script/Widget/NakMessage/NakMessage.lua")
  runLua("UI_Data/Script/Widget/Lobby/Panel_Lobby_Main.lua")
  if true == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Widget/Lobby/Panel_Lobby_CharacterSelect_Renew.lua")
  elseif renewalUiOpen then
    runLua("UI_Data/Script/Widget/Lobby/Panel_Lobby_SelectCharacterRenewal.lua")
  else
    runLua("UI_Data/Script/Widget/Lobby/Panel_Lobby_SelectCharacter.lua")
  end
  if false == _ContentsGroup_RenewUI_MessageBox then
    runLua("UI_Data/Script/Window/MessageBox/MessageBox.lua")
  else
    runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBox_Renew.lua")
  end
  runLua("UI_Data/Script/Window/MessageBox/Panel_ScreenShot_For_Desktop.lua")
  runLua("UI_Data/Script/globalKeyBinderNotPlay.lua")
  runLua("UI_Data/Script/Window/FirstLogin/Panel_FirstLogin.lua")
  runLua("UI_Data/Script/Panel_SpecialCharacter.lua")
  runLua("UI_Data/Script/Widget/NoticeAlert/NoticeAlert.lua")
  runLua("UI_Data/Script/Panel_Ime.lua")
  runLua("UI_Data/Script/Widget/Lobby/Panel_Lobby_DataProgress.lua")
  basicLoadUI("UI_Data/Window/Mercenary/Panel_Window_RedDesert.XML", "Panel_Window_RedDesert", UIGroup.PAGameUIGroup_Windows)
  runLua("UI_Data/Script/Window/Mercenary/Panel_Window_RedDesert.lua")
  if _ContentsGroup_isConsoleTest then
    loadUI("UI_Data/Widget/MainStatus/UI_Cursor.XML", "Panel_Cursor", UIGroup.PAGameUIGroup_FadeScreen, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_customScreenShot,
      RenderMode.eRenderMode_IngameCustomize
    }))
    runLua("UI_Data/Script/globalPreLoadUI.lua")
  end
  runLua("UI_Data/Script/Panel_GamerTag.lua")
end
function preLoadGameUI()
  loadUI("UI_Data/Widget/UIcontrol/Panel_OnlyPerframeUsed.XML", "Panel_OnlyPerframeUsed", UIGroup.PAGameUIGroup_Widget, RenderModeAllModeOpen)
  basicLoadUI("UI_Data/Widget/UIcontrol/Panel_CommonGameScreenUI.XML", "Panel_CommonGameScreenUI", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Movie/Panel_MovieTheater_MessageBox.XML", "Panel_MovieTheater_MessageBox", UIGroup.PAGameUIGroup_Movie)
  basicLoadUI("UI_Data/Window/Movie/UI_IntroMovie.xml", "Panel_IntroMovie", UIGroup.PAGameUIGroup_Movie)
  basicLoadUI("UI_Data/Window/Movie/Panel_MovieTheater_320.XML", "Panel_MovieTheater_320", UIGroup.PAGameUIGroup_Movie)
  loadUI("UI_Data/Window/Movie/Panel_MovieTheater_640.XML", "Panel_MovieTheater_640", UIGroup.PAGameUIGroup_Movie, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Window/Movie/Panel_MovieTheater_LowLevel.XML", "Panel_MovieTheater_LowLevel", UIGroup.PAGameUIGroup_Movie)
  basicLoadUI("UI_Data/Window/Movie/Panel_MovieTheater_SkillGuide_640.XML", "Panel_MovieTheater_SkillGuide_640", UIGroup.PAGameUIGroup_Movie)
  loadUI("UI_Data/Window/Movie/Panel_MovieGuide_Weblist.XML", "Panel_MovieGuide_Weblist", UIGroup.PAGameUIGroup_Movie, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/Movie/Panel_MovieGuide_Web.XML", "Panel_MovieGuide_Web", UIGroup.PAGameUIGroup_Movie, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/Movie/Panel_MovieSkillGuide_Weblist.XML", "Panel_MovieSkillGuide_Weblist", UIGroup.PAGameUIGroup_Movie, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/Movie/Panel_MovieSkillGuide_Web.XML", "Panel_MovieSkillGuide_Web", UIGroup.PAGameUIGroup_Movie, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/Movie/Panel_MovieWorldMapGuide_Web.XML", "Panel_MovieWorldMapGuide_Web", UIGroup.PAGameUIGroup_Movie, RenderModeAllModeOpen)
  basicLoadUI("UI_Data/Window/Panel_IME.XML", "Panel_IME", UIGroup.PAGameUIGroup_ModalDialog)
  basicLoadUI("UI_Data/Window/Mail/Panel_Mail_InputText.XML", "Panel_Mail_InputText", UIGroup.PAGameUIGroup_WorldMap_Popups)
  loadUI("UI_Data/Window/WebHelper/Panel_WebControl.XML", "Panel_WebControl", UIGroup.PAGameUIGroup_DeadMessage, RenderModeAllModeOpen)
  loadUI("UI_Data/Widget/UIcontrol/UI_SpecialCharacter.XML", "Panel_SpecialCharacter", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_LocalwarByBalanceServer.XML", "Panel_LocalwarByBalanceServer", UIGroup.PAGameUIGroup_Widget)
  loadUI("UI_Data/Widget/HelpMessage/Panel_HelpMessage.xml", "Panel_HelpMessage", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/FirstLogin/Panel_FirstLogin.XML", "Panel_FirstLogin", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Damage/CounterAttack.XML", "Panel_CounterAttack", UIGroup.PAGameUIGroup_MainUI)
  if _ContentsGroup_RenewUI_MiniGame then
    basicLoadUI("UI_Data/Widget/GlobalManual/Console/Panel_Global_Manual_Renew.xml", "Panel_Global_Manual", UIGroup.PAGameUIGroup_MainUI)
  else
    basicLoadUI("UI_Data/Widget/GlobalManual/Panel_Global_Manual.xml", "Panel_Global_Manual", UIGroup.PAGameUIGroup_MainUI)
  end
  basicLoadUI("UI_Data/Widget/Fishing/Panel_Fishing.xml", "Panel_Fishing", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Window/GuildWarInfo/Panel_GuildWarInfo.XML", "Panel_GuildWarInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/GuildWarInfo/Panel_GuildWarScore.XML", "Panel_GuildWarScore", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/HorseBattle/Panel_HorseBattleList.XML", "Panel_HorseBattleList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Window_GuildBattle.XML", "Panel_Window_GuildBattle", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildBattle_JoinMember.XML", "Panel_GuildBattle_JoinMember", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildBattle_Point.XML", "Panel_GuidlBattle_Point", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildBattle_EntryList.XML", "Panel_GuildBattle_EntryList", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildBattle_SelectMember.XML", "Panel_GuildBattle_SelectMember", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Guild/PersonalBattle/Panel_Window_PersonalBattle.XML", "Panel_Window_PersonalBattle", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Auction/Panel_House_Auction.xml", "Panel_Auction", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Auction/Panel_GuildHouse_Auction.XML", "Panel_GuildHouse_Auction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/Auction/Panel_Villa_Auction.XML", "Panel_Villa_Auction", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Auction/Panel_Masterpiece_Auction_new.XML", "Panel_Window_MasterpieceAuction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Default
  }))
  basicLoadUI("UI_Data/Window/TerritoryTrade/Panel_Territory_authority.xml", "Panel_TerritoryAuth_Auction", UIGroup.PAGameUIGroup_Windows)
  if _ContentsGroup_RenewUI then
    basicLoadUI("UI_Data/Window/CharacterInfo/Console/Panel_Window_CharacterInfo_Renew.XML", "Panel_Window_CharacterInfo_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/Console/Panel_Window_CharacterInfo_Title_Renew.XML", "Panel_Window_CharacterInfo_Title_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/Console/Panel_Window_CharacterInfo_History_Renew.XML", "Panel_Window_CharacterInfo_History_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/Console/Panel_Window_CharacterInfo_Challenge_Renew.XML", "Panel_Window_CharacterInfo_Challenge_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/Console/Panel_Window_CharacterInfo_Profile_Renew.XML", "Panel_Window_CharacterInfo_Profile_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/Console/Panel_Window_CharacterInfo_LifeInfo.XML", "Panel_Window_Life_Renew", UIGroup.PAGameUIGroup_Windows)
  elseif _ContentsGroup_isUsedNewCharacterInfo == false then
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Basic.xml", "Panel_Window_CharInfo_BasicStatus", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Title.xml", "Panel_Window_CharInfo_TitleInfo", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_History.XML", "Panel_Window_CharInfo_HistoryInfo", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Challenge.XML", "Panel_Window_Challenge", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Profile.xml", "Panel_Window_Profile", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo.xml", "Panel_Window_CharInfo_Status", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Basic_New.xml", "Panel_Window_CharInfo_BasicStatus", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Title_New.xml", "Panel_Window_CharInfo_TitleInfo", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_History.XML", "Panel_Window_CharInfo_HistoryInfo", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Challenge.XML", "Panel_Window_Challenge", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_Profile.xml", "Panel_Window_Profile", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/CharacterInfo/UI_Window_CharacterInfo_New.xml", "Panel_Window_CharInfo_Status", UIGroup.PAGameUIGroup_Windows)
  end
  if _ContentsGroup_isNewLifeRanking then
    basicLoadUI("UI_Data/Window/LifeRanking/Panel_LifeRanking_Renewal.xml", "Panel_LifeRanking", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/Window/LifeRanking/Panel_LifeRanking.xml", "Panel_LifeRanking", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/Window/Recommand/Panel_Window_Recommand.xml", "Panel_RecommandName", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/LocalWar/Panel_LocalWarInfo.xml", "Panel_LocalWarInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/CompetitionGame/Panel_CompetitionGame.XML", "Panel_CompetitionGame", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/CompetitionGame/Panel_CompetitionGame_JoinDesc.XML", "Panel_CompetitionGame_JoinDesc", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/CompetitionGame/Panel_CompetitionGame_GuildReservation.XML", "Panel_CompetitionGame_GuildReservation", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/CompetitionGame/Panel_CompetitionGame_TeamUi.XML", "Panel_CompetitionGame_TeamUi", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Arsha/Panel_Window_Arsha.XML", "Panel_Window_Arsha", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Arsha/Panel_Window_ArshaPvPSubMenu.XML", "Panel_Window_ArshaPvPSubMenu", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Arsha/Panel_Arsha_TeamChangeControl.XML", "Panel_Arsha_TeamChangeControl", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Arsha/Panel_Window_ArshaInviteList.XML", "Panel_Window_ArshaInviteList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Arsha/Panel_Arsha_TeamWidget.XML", "Panel_Arsha_TeamWidget", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Arsha/Panel_Window_ArshaTeamNameChange.XML", "Panel_Window_ArshaTeamNameChange", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Arsha/Panel_Window_ArshaSelectMember.XML", "Panel_Window_ArshaSelectMember", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Mercenary/Panel_Window_Mercenary.XML", "Panel_Window_Mercenary", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Mercenary/Panel_Window_MercenaryDesc.XML", "Panel_Window_MercenaryDesc", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Mercenary/Panel_Window_MercenaryList.XML", "Panel_Window_MercenaryList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SavageDefence/SavageDefenceInfo.XML", "Panel_SavageDefenceInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SavageDefence/SavageDefenceShop.XML", "Panel_SavageDefenceShop", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SavageDefence/Panel_SavageDefenceMember.XML", "Panel_SavageDefenceMember", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SavageDefence/Panel_SavageDefenceTowerHp.XML", "Panel_SavageDefenceTowerHp", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SavageDefence/Panel_SavageDefenceWave.XML", "Panel_SavageDefenceWave", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SavageDefence/Panel_SavageDefence_Result.XML", "Panel_SavageDefence_Result", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Looting/UI_Window_Looting.XML", "Panel_Looting", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Dye/Panel_DyePreview.XML", "Panel_DyePreview", UIGroup.PAGameUIGroup_Interaction, PAUIRenderModeBitSet({
    Defines.RenderMode.eRenderMode_Dye
  }))
  loadUI("UI_Data/Window/Dye/Panel_Dye_New.XML", "Panel_Dye_New", UIGroup.PAGameUIGroup_Interaction, PAUIRenderModeBitSet({
    Defines.RenderMode.eRenderMode_Dye
  }))
  loadUI("UI_Data/Window/Dye/Panel_DyeNew_CharacterController.XML", "Panel_DyeNew_CharacterController", UIGroup.PAGameUIGroup_Housing, PAUIRenderModeBitSet({
    Defines.RenderMode.eRenderMode_Dye
  }))
  loadUI("UI_Data/Window/Dye/Panel_DyePalette.XML", "Panel_DyePalette", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    Defines.RenderMode.eRenderMode_Default,
    Defines.RenderMode.eRenderMode_Dye
  }))
  loadUI("UI_Data/Window/Dye/Panel_Dye_ReNew.XML", "Panel_Dye_ReNew", UIGroup.PAGameUIGroup_Interaction, PAUIRenderModeBitSet({
    Defines.RenderMode.eRenderMode_Dye
  }))
  basicLoadUI("UI_Data/Window/Dye/Panel_ColorBalance.XML", "Panel_ColorBalance", UIGroup.PAGameUIGroup_Window_Progress)
  if true == _ContentsGroup_RenewUI then
    loadUI("UI_Data/Window/Inventory/Console/Panel_Window_Inventory_Renew.xml", "Panel_Window_Inventory", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Inventory/Console/Panel_Window_InventoryPopup_Renew.xml", "Panel_Window_InventoryPopup_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/Inventory/UI_Window_Inventory.xml", "Panel_Window_Inventory", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dye,
      RenderMode.eRenderMode_InGameCashShop,
      RenderMode.eRenderMode_Dialog
    }))
  end
  basicLoadUI("UI_Data/Window/Inventory/UI_Inventory_SkillCooltime_Effect_Item_Slot.XML", "Panel_Inventory_CoolTime_Effect_Item_Slot", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Widget/Popup/UI_Popup_Inventory.XML", "Panel_Popup_MoveItem", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/MessageBox/UI_Win_UseItem.xml", "Panel_UseItem", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Window/Inventory/UI_Inventory_Manufacture_Note.XML", "Panel_Invertory_Manufacture_BG", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Inventory/UI_Inventory_ExchangeItemButton.XML", "Panel_Invertory_ExchangeButton", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Window/Inventory/UI_Window_ClothInventory.XML", "Panel_Window_ClothInventory", UIGroup.PAGameUIGroup_Window_Progress)
  loadUI("UI_Data/Window/Equipment/UI_Window_Equipment.XML", "Panel_Equipment", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Equipment/Panel_Equipment_SetEffectTooltip.XML", "Panel_Equipment_SetEffectTooltip", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_BattlePoint.XML", "Panel_Tooltip_BattlePoint", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/Dance/Panel_Window_Dance.xml", "Panel_Window_Dance", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Dance/Dance_Edit.XML", "Panel_DanceEdit", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_IngameCustomize
  }))
  loadUI("UI_Data/Window/Dance/Dance_Action.XML", "Panel_DanceAction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_IngameCustomize
  }))
  basicLoadUI("UI_Data/Window/ExtendExpiration/Panel_ExtendExpiration.XML", "Panel_ExtendExpiration", UIGroup.PAGameUIGroup_Window_Progress)
  loadUI("UI_Data/Window/LordMenu/Panel_LordMenu_Territory.XML", "Panel_LordMenu_Territory", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/LordMenu/Panel_LordMenu_PayInfo.XML", "Panel_LordMenu_PayInfo", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/LordMenu/Panel_LordMenu_TaxControl.XML", "Panel_LordMenu_TaxControl", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/LordMenu/Panel_LordMenu_Main.XML", "Panel_LordMenu", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/LordMenu/Panel_Lord_Controller.XML", "Panel_Lord_Controller", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/LordMenu/Panel_LordMenu_TerritoryTex_Message.XML", "Panel_TerritoryTex_Message", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/NodeWarMenu/Panel_NodeWarMenu_Main.XML", "Panel_NodeWarMenu", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  if true == _ContentsGroup_RenewUI_Skill then
    loadUI("UI_Data/Window/Skill/Console/Panel_Window_Skill.XML", "Panel_Window_Skill", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_SkillWindow,
      RenderMode.eRenderMode_Dialog
    }))
  else
    if _ContentsGroup_skillOldandNew then
      loadUI("UI_Data/Window/Skill/UI_Window_Skill_New.xml", "Panel_Window_Skill", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
        RenderMode.eRenderMode_Default,
        RenderMode.eRenderMode_Dialog
      }))
    else
      loadUI("UI_Data/Window/Skill/UI_Window_Skill.xml", "Panel_Window_Skill", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
        RenderMode.eRenderMode_Default,
        RenderMode.eRenderMode_Dialog
      }))
    end
    loadUI("UI_Data/Window/Skill/UI_Window_SkillCombination.XML", "Panel_SkillCombination", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Skill/Panel_EnableSkill.XML", "Panel_EnableSkill", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  end
  basicLoadUI("UI_Data/Window/SkillAwaken/UI_Frame_SkillAwaken_Options.xml", "Panel_Frame_AwkOptions", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SkillAwaken/UI_Frame_SkillAwaken_List.xml", "Panel_Frame_AwkSkillList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Skill/UI_Window_SkillGuide.xml", "Panel_Window_SkillGuide", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/SkillAwaken/UI_Window_SkillAwaken.xml", "Panel_SkillAwaken", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/SkillAwaken/Panel_SkillAwaken_ResultOption.xml", "Panel_SkillAwaken_ResultOption", UIGroup.PAGameUIGroup_Window_Progress, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/Skill/Panel_Window_Skill_CoolTimeSlot.XML", "Panel_SkillCoolTimeSlot", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  if true == _ContentsGroup_RenewUI_ReinforceSkill then
    loadUI("UI_Data/Widget/Dialogue/Console/Panel_Dialog_SkillSpecialize.xml", "Panel_Dialog_SkillSpecialize", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/Skill/UI_Window_ReinforceSkill.xml", "Panel_Window_ReinforceSkill", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Skill/UI_Window_SkillReinforce.xml", "Panel_SkillReinforce", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  end
  basicLoadUI("UI_Data/Window/DailyStamp/UI_Window_DailyStamp.XML", "Panel_Window_DailyStamp", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Window/BlackSpiritAdventure/Panel_Window_BlackSpiritAdventure.XML", "Panel_Window_BlackSpiritAdventure", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/BlackSpiritAdventure/Panel_Window_BlackSpiritAdventure_PCRoom.XML", "Panel_Window_BlackSpiritAdventureVerPC", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Copyright/Panel_Window_Copyright.XML", "Panel_Copyright", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Policy/Panel_Window_Policy.XML", "Panel_Window_Policy", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/dance/DanceFrame.XML", "Panel_DanceFrame", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Twitch/Panel_Twitch.XML", "Panel_Twitch", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/SaveSetting/Panel_SaveSetting.XML", "Panel_SaveSetting", UIGroup.PAGameUIGroup_Windows, RenderModeAllModeOpen)
  basicLoadUI("UI_Data/Window/Quest/UI_Window_Quest_Option.XML", "Panel_Window_Quest_New_Option", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Quest/UI_Window_Quest_History.xml", "Panel_Window_Quest_History", UIGroup.PAGameUIGroup_Windows)
  if true == _ContentsGroup_RenewUI then
    loadUI("UI_Data/Window/Quest/Console/Panel_Window_QuestInfo.xml", "Panel_Window_QuestInfo", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default
    }))
  else
    basicLoadUI("UI_Data/Window/Quest/UI_Window_Quest_160525.xml", "Panel_Window_Quest_New", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/Window/AutoQuest/Panel_Window_AutoQuest.xml", "Panel_Window_AutoQuest", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Widget/AutoQuest/Panel_AutoQuest.xml", "Panel_AutoQuest", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Default
  }))
  basicLoadUI("UI_Data/Widget/AutoQuest/Panel_Widget_Keyboard.xml", "Panel_Widget_Keyboard", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/AutoQuest/Panel_Widget_Blackspirt.xml", "Panel_Blackspirit_OnOff", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/BuyDrink/Panel_BuyDrink.XML", "Panel_BuyDrink", UIGroup.PAGameUIGroup_Windows)
  if true == _ContentsGroup_RenewUI_NpcShop then
    loadUI("UI_Data/Widget/Dialogue/Console/Panel_Dialog_NPCShop.xml", "Panel_Dialog_NPCShop", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/Shop/UI_Win_Npc_Shop.xml", "Panel_Window_NpcShop", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  end
  loadUI("UI_Data/Window/Worldmap/WorkerRandomSelect/UI_New_WorkerRandomSelect.XML", "Panel_Window_WorkerRandomSelect", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Worldmap/UnKnowItemSelect/UI_New_UnKnowItemSelect.XML", "Panel_Window_UnknownRandomSelect", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  if true == _ContentsGroup_RenewUI_SpiritEnchant then
    loadUI("UI_Data/Window/Enchant/Console/Panel_Window_Enchant_Renew.XML", "Panel_Window_Enchant_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Enchant/Console/Panel_Window_Improvement_Renew.XML", "Panel_Window_Improvement_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Enchant/Console/Panel_Window_Socket_Renew.XML", "Panel_Window_Socket_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  end
  if _ContentsGroup_isUsedNewEnchant == true then
    loadUI("UI_Data/Window/Enchant/UI_Window_Enchant_New.XML", "Panel_Window_Enchant", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/Enchant/UI_Win_Enchant.XML", "Panel_Window_Enchant", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  end
  loadUI("UI_Data/Window/Enchant/UI_Window_Improvement.XML", "Panel_Improvement", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Socket/UI_Win_Enchant_Socket.XML", "Panel_Window_Socket", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/Enchant/UI_Window_BonusEnchant.XML", "Panel_BonusEnchant", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_MyHouseNavi.XML", "Panel_MyHouseNavi", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Housing/Panel_HousingList.XML", "Panel_HousingList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Housing/Panel_HarvestList.XML", "Panel_HarvestList", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Inventory/UI_Window_ServantInventory.XML", "Panel_Window_ServantInventory", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/Servant/UI_TopIcon_Servant.XML", "Panel_Window_Servant", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Servant/UI_HorseMp.XML", "Panel_HorseMp", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Servant/UI_HorseHp.XML", "Panel_HorseHp", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Servant/UI_ServantInfo.xml", "Panel_Window_ServantInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/UI_CarriageInfo.xml", "Panel_CarriageInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/UI_LinkedHorse_Skill.XML", "Panel_LinkedHorse_Skill", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/UI_ShipInfo.xml", "Panel_ShipInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/UI_WorkerShipInfo.xml", "Panel_WorkerShipInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/Panel_GuildServantList.xml", "Panel_GuildServantList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/Panel_GuildeServant_RevivalList.xml", "Panel_GuildServant_RevivalList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/UI_HorseRace.xml", "Panel_Window_HorseRace", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/UI_Cannon.XML", "Panel_Cannon", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Servant/UI_CannonShip.XML", "Panel_CannonShip", UIGroup.PAGameUIGroup_Widget)
  loadUI("UI_Data/Window/WareHouse/UI_Window_WareHouse.XML", "Panel_Window_Warehouse", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Delivery/UI_Window_Delivery_Request.XML", "Panel_Window_Delivery_Request", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Delivery/UI_Window_Delivery_Information.XML", "Panel_Window_Delivery_Information", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Delivery/UI_Window_Delivery_InformationView.XML", "Panel_Window_Delivery_InformationView", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Delivery/UI_Window_Carriage_Information.XML", "Panel_Window_Delivery_CarriageInformation", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap
  }))
  if false == _ContentsGroup_RenewUI_MessageBox then
    loadUI("UI_Data/Window/MessageBox/UI_Win_Check.XML", "Panel_Win_Check", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/MessageBox/Console/Panel_MessageBox_Check.XML", "Panel_Win_Check", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  end
  if false == _ContentsGroup_RenewUI_Stable then
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Function.XML", "Panel_Window_StableFunction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Register.XML", "Panel_Window_StableRegister", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_List.XML", "Panel_Window_StableList", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Move.XML", "Panel_ServantMove", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Info.XML", "Panel_Window_StableInfo", UIGroup.PAGameUIGroup_Party, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    basicLoadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Equipment.XML", "Panel_Window_StableEquipInfo", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Shop.XML", "Panel_Window_StableShop", UIGroup.PAGameUIGroup_Windows)
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Breed.XML", "Panel_Window_StableMating", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Market.XML", "Panel_Window_StableMarket", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_WorldMap
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_ConfirmMarket.XML", "Panel_Servant_Market_Input", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Mix.XML", "Panel_Window_StableMix", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_AddToCarriage.XML", "Panel_AddToCarriage", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_LookChange.XML", "Panel_Window_HorseLookChange", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Stallion.XML", "Panel_Window_StableStallion", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Stallion_ItemNotify.XML", "Panel_Window_StableStallion_ItemNotify", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Stable/UI_Window_Stable_Stallion_Effect.XML", "Panel_Window_StableStallion_Effect", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_Function.XML", "Panel_Window_StableFunction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_List.XML", "Panel_Window_StableList", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_Info.XML", "Panel_Window_StableInfo", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_InfoMenu.XML", "Panel_Window_StableInfo_Menu", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_RegiItem.XML", "Panel_Window_StableRegister", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_Market.XML", "Panel_Window_StableMarket", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_WorldMap
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_Mate.XML", "Panel_Window_StableMating", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_ChangeSkill.XML", "Panel_Window_Stable_ChangeSkill", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_Exchange.XML", "Panel_Window_Stable_Exchange", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_RegiMarket.XML", "Panel_Window_StableRegister_Market", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_RegiConfirm.XML", "Panel_Window_StableRegister_MarketCheck", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_RegiName.XML", "Panel_Window_StableRegister_Name", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Stable/Panel_Stable_Filter.XML", "Panel_Window_StableMarket_Filter", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  end
  if false == _ContentsGroup_RenewUI_Stable then
    loadUI("UI_Data/Window/Servant/GuildStable/UI_Window_GuildStable_Function.XML", "Panel_Window_GuildStableFunction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/GuildStable/UI_Window_GuildStable_List.XML", "Panel_Window_GuildStable_List", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/GuildStable/UI_Window_GuildStable_Info.XML", "Panel_Window_GuildStable_Info", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/GuildStable/UI_Window_GuildStable_Register.XML", "Panel_Window_GuildStableRegister", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  else
  end
  if false == _ContentsGroup_RenewUI_Stable then
    loadUI("UI_Data/Window/Servant/Wharf/UI_Window_Wharf_Function.XML", "Panel_Window_WharfFunction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Wharf/UI_Window_Wharf_Register.XML", "Panel_Window_WharfRegister", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Wharf/UI_Window_Wharf_List.XML", "Panel_Window_WharfList", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Wharf/UI_Window_Wharf_Info.XML", "Panel_Window_WharfInfo", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/Servant/Console/Wharf/Panel_Wharf_Function.XML", "Panel_Window_WharfFunction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Wharf/Panel_Wharf_List.XML", "Panel_Window_WharfList", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Wharf/Panel_Wharf_Info.XML", "Panel_Window_WharfInfo", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Wharf/Panel_Wharf_InfoMenu.XML", "Panel_Window_WharfInfo_Menu", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/Console/Wharf/Panel_Wharf_RegiItem.XML", "Panel_Window_WharfRegister", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  end
  if false == _ContentsGroup_RenewUI_Stable then
    loadUI("UI_Data/Window/Servant/GuildWharf/UI_Window_GuildWharf_Function.XML", "Panel_Window_GuildWharfFunction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/GuildWharf/UI_Window_GuildWharf_Register.XML", "Panel_Window_GuildShipNaming_Input", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/GuildWharf/UI_Window_GuildWharf_List.XML", "Panel_Window_GuildWharf_List", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Servant/GuildWharf/UI_Window_GuildWharf_Info.XML", "Panel_Window_GuildWharfInfo", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  else
  end
  if true == _ContentsGroup_RenewUI_Pet then
    basicLoadUI("UI_Data/Window/PetInfo/Console/Panel_PetCommand_Renew.XML", "Panel_Window_PetCommand_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Console/Panel_PetExchange_Renew.XML", "Panel_Window_PetExchange_Renew", UIGroup.PAGameUIGroup_InstanceMission)
    basicLoadUI("UI_Data/Window/PetInfo/Console/Panel_PetFood_Renew.XML", "Panel_Window_PetFood_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Console/Panel_PetInfo_Renew.XML", "Panel_Window_PetInfo_Renew", UIGroup.PAGameUIGroup_Window_Progress)
    basicLoadUI("UI_Data/Window/PetInfo/Console/Panel_PetList_Renew.XML", "Panel_Window_PetList_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Console/Panel_PetRegister_Renew.XML", "Panel_Window_PetRegister_Renew", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetRegister.XML", "Panel_Window_PetRegister", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetInfo.XML", "Panel_Window_PetInfoNew", UIGroup.PAGameUIGroup_Window_Progress)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetListNew.XML", "Panel_Window_PetListNew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetLookChange.XML", "Panel_Window_PetLookChange", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetControl.XML", "Panel_Window_PetControl", UIGroup.PAGameUIGroup_Widget)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_Compose.XML", "Panel_Window_PetCompose", UIGroup.PAGameUIGroup_InstanceMission)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetMarketRegister.XML", "Panel_Window_PetMarketRegist", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetRestoreAll.XML", "Panel_PetRestoreAll", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_PetMarket.XML", "Panel_Window_PetMarket", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/Window/PetInfo/Panel_Window_NoPetIcon.XML", "Panel_Window_PetIcon", UIGroup.PAGameUIGroup_Widget)
  if true == _ContentsGroup_isFairy then
    basicLoadUI("UI_Data/Window/FairyInfo/Panel_Window_FairyRegister.XML", "Panel_Window_FairyRegister", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/FairyInfo/Panel_Window_FairySetting.XML", "Panel_Window_FairySetting", UIGroup.PAGameUIGroup_Window_Progress)
    basicLoadUI("UI_Data/Window/FairyInfo/Panel_Window_FairyUpgrade.XML", "Panel_Window_FairyUpgrade", UIGroup.PAGameUIGroup_Window_Progress)
    basicLoadUI("UI_Data/Window/FairyInfo/Panel_Fairyinfo.XML", "Panel_FairyInfo", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/FairyInfo/Panel_Window_FairyChoiseTheReset.XML", "Panel_Window_FairyChoiseTheReset", UIGroup.PAGameUIGroup_Window_Progress)
    if _ContentsGroup_FairyTierUpgradeAndRebirth then
      basicLoadUI("UI_Data/Window/FairyInfo/Panel_Window_FairyTierUpgrade.XML", "Panel_Window_FairyTierUpgrade", UIGroup.PAGameUIGroup_Window_Progress)
    end
  end
  basicLoadUI("UI_Data/Window/FairyInfo/Panel_Window_FairyIcon.XML", "Panel_Window_FairyIcon", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Maid/Panel_Icon_Maid.XML", "Panel_Icon_Maid", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Maid/Panel_Window_MaidList.XML", "Panel_Window_MaidList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Camp/Panel_Icon_Camp.XML", "Panel_Icon_Camp", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Camp/Panel_Window_Camp.XML", "Panel_Window_Camp", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Camp/Panel_Window_CampRegister.XML", "Panel_Window_CampRegister", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Duel/Panel_Icon_Duel.XML", "Panel_Icon_Duel", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Exchange/UI_Window_Exchange.XML", "Panel_Window_Exchange", UIGroup.PAGameUIGroup_Windows)
  if false == _ContentsGroup_RenewUI_Number then
    loadUI("UI_Data/Window/Exchange/UI_Window_Exchange_Number.XML", "Panel_Window_Exchange_Number", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_WorldMap
    }))
  else
    loadUI("UI_Data/Window/Exchange/Console/Panel_Window_Number.XML", "Panel_Window_Exchange_Number", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_WorldMap
    }))
  end
  basicLoadUI("UI_Data/Window/FadeScreen/UI_Fade_Screen.XML", "Panel_Fade_Screen", UIGroup.PAGameUIGroup_FadeScreen)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Main_NewMail_Alarm.XML", "Panel_NewMail_Alarm", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Mail/Panel_Mail_Send.xml", "Panel_Mail_Send", UIGroup.PAGameUIGroup_Windows)
  if true == _ContentsGroup_RenewUI_Mail then
    basicLoadUI("UI_Data/Window/Mail/Console/Panel_Window_Mail_Renew.xml", "Panel_Window_Mail_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Mail/Console/Panel_Window_MailDetail_Renew.xml", "Panel_Window_MailDetail_Renew", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Mail/Console/Panel_Widget_NewMailAlarm_Renew.xml", "Panel_Widget_NewMailAlarm_Renew", UIGroup.PAGameUIGroup_Widget)
  else
    basicLoadUI("UI_Data/Window/Mail/Panel_Mail.xml", "Panel_Mail_Main", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Mail/Panel_Mail_Popup.xml", "Panel_Mail_Detail", UIGroup.PAGameUIGroup_Windows)
  end
  loadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_OutSideNode.XML", "Panel_WorldMap_Main", UIGroup.PAGameUIGroup_Interaction, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Loading
  }))
  loadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_InSideNode.XML", "Panel_NodeMenu", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_MovieTooltip.XML", "Panel_WorldMap_MovieGuide", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/Panel_HouseIcon.XML", "Panel_HouseIcon", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeName.XML", "Panel_NodeName", UIGroup.PAGameUIGroup_Interaction, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_InSideNode_Guild.XML", "Panel_NodeOwnerInfo", UIGroup.PAGameUIGroup_Interaction, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeSiegeTooltip.XML", "Panel_NodeSiegeTooltip", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_nodeHouseFilter.XML", "Panel_NodeHouseFilter", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_manageWork_House.XML", "Panel_RentHouse_WorkManager", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_manageWork_House_SelectBox.XML", "Panel_Select_Inherit", UIGroup.PAGameUIGroup_WorldMap_Contents, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_manageWork_LargeCraft.XML", "Panel_LargeCraft_WorkManager", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_manageWork_Building.XML", "Panel_Building_WorkManager", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_manageWork_Plant.XML", "Panel_Plant_WorkManager", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_manageWork_Harvest.XML", "Panel_Harvest_WorkManager", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_manageWork_Finance.XML", "Panel_Finance_WorkManager", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_WarInfo.XML", "Panel_Win_Worldmap_WarInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeWarInfo.XML", "Panel_Win_Worldmap_NodeWarInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Widget/WarInfoMessage/Panel_WarInfoMessage.XML", "Panel_WarInfoMessage", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Widget/WarInfoMessage/Panel_TerritoryWarKillingScore.XML", "Panel_TerritoryWarKillingScore", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/HouseInfo/Panel_WolrdHouseInfo.XML", "Panel_WolrdHouseInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_Territory.XML", "Panel_Worldmap_Territory", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_WorldMap_Tooltip.XML", "Panel_WorldMap_Tooltip", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/WorldMap/UI_New_Worldmap_PartyMemberTail.XML", "Panel_WorldMap_PartyMemberTail", UIGroup.PAGameUIGroup_Party, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/WorldMap/UI_New_Worldmap_PartyMemberIcon.XML", "Panel_WorldMap_PartyMemberIcon", UIGroup.PAGameUIGroup_Party, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_Worldmap_town_manageWorker.XML", "Panel_manageWorker", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_Worldmap_Working_Progress.XML", "Panel_Working_Progress", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_TentInfo.XML", "Panel_Worldmap_TentInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Worldmap/UI_Worldmap_TradeNpcItemInfo.XML", "Panel_TradeNpcItemInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/FishEncyclopedia/Panel_FishEncyclopedia.XML", "Panel_FishEncyclopedia", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeStable.XML", "Panel_NodeStable", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_New_Worldmap_NodeStableInfo.XML", "Panel_NodeStableInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap/UI_Worldmap_QuestInfo.XML", "Panel_QuestInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_NavigationButton.XML", "Panel_NaviButton", UIGroup.PAGameUIGroup_Interaction, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_VotePopUp.XML", "Panel_WorldMap_PlunderVote", UIGroup.PAGameUIGroup_Windows, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Console/Panel_Worldmap_Console.XML", "Panel_Worldmap_Console", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Console/Panel_Worldmap_NodeInfo_Console.XML", "Panel_Worldmap_NodeInfo_Console", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Console/Panel_Worldmap_CraftTooltip.XML", "Panel_Worldmap_CraftTooltip", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Console/Panel_Worldmap_Finance.XML", "Panel_Worldmap_Finance", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Console/Panel_Worldmap_HouseCraft.XML", "Panel_Worldmap_HouseCraft", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  loadUI("UI_Data/Window/Worldmap_Grand/Console/Panel_Worldmap_BuyHouse.XML", "Panel_Worldmap_BuyHouse", UIGroup.PAGameUIGroup_WorldMap_Popups, RenderModeWorldMapBitSet)
  basicLoadUI("UI_Data/Widget/Alert/Panel_Alert_Message.XML", "Panel_Alert_Message", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Worldmap_Grand/WordMap_Craft/Worldmap_Grand_GuildCraft.XML", "Worldmap_Grand_GuildCraft", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Worldmap_Grand/WordMap_Craft/Worldmap_Grand_GuildHouseControl.XML", "Worldmap_Grand_GuildHouseControl", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Worldmap_Grand/WordMap_Craft/Worldmap_Grand_GuildCraft_ChangeWorker.XML", "Worldmap_Grand_GuildCraft_ChangeWorker", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  if true == _ContentsGroup_RenewUI_Guild then
    basicLoadUI("UI_Data/Window/Guild/Console/Console_Window_Guild.XML", "Panel_Console_Window_Guild", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Guild/Console/Console_window_AgreementGuild.XML", "Panel_Console_Window_GuildAgreement", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Guild/Console/Panel_Window_Guild_SignOption.XML", "Panel_Console_Window_SignOption", UIGroup.PAGameUIGroup_Windows)
    loadUI("UI_Data/Window/Guild/Console/Panel_Window_GuildCreate_Renew.XML", "Panel_Console_Window_GuildCreate", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Widget/Dialogue/Console/Panel_Dialog_GuildCreate.XML", "Panel_Console_Dialog_GuildPopup", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog
    }))
  end
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_History.XML", "Panel_Guild_History", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_List.XML", "Panel_Guild_List", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_Quest.XML", "Panel_Guild_Quest", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_Warfare.XML", "Panel_Guild_Warfare", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_Skill.XML", "Panel_Guild_Skill", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_Recruitment.XML", "Panel_Guild_Recruitment", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_CraftInfo.XML", "Panel_Guild_CraftInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Frame_Guild_Manufacture_New.XML", "Panel_Guild_Manufacture", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild.XML", "Panel_Window_Guild", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_ManufactureSelect.XML", "Panel_Guild_ManufactureSelect", UIGroup.PAGameUIGroup_Window_Progress)
  loadUI("UI_Data/Window/Guild/Panel_Guild_Create.XML", "Panel_CreateGuild", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_Manager.XML", "Panel_GuildManager", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildTentAttackedMsg.XML", "Panel_GuildTentAttackedMsg", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_Declaration.XML", "Panel_Guild_Declaration", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_Duel.XML", "Panel_GuildDuel", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_GetDailyPay.XML", "Panel_Guild_GetDailyPay", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_NoneJoinMember.XML", "Panel_Guild_NoneJoinMember", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_UseGuildFunds.XML", "Panel_Guild_UseGuildFunds", UIGroup.PAGameUIGroup_Window_Progress)
  if __Guild_LimitPrice then
    basicLoadUI("UI_Data/Window/Guild/Panel_Guild_SetFundsList.XML", "Panel_Guild_SetFundsList", UIGroup.PAGameUIGroup_Window_Progress)
  end
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_ChoiseTheMoney.XML", "Panel_Guild_ChoiseTheMoney", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_AllianceInfo.XML", "Panel_Guild_AllianceInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildAlliance_Invitation.XML", "Panel_GuildAlliance_Invitation", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Guild/Panel_CreateClan.XML", "Panel_CreateClan", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/Guild/Panel_ClanToGuild.XML", "Panel_ClanToGuild", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_AgreementGuild.XML", "Panel_AgreementGuild", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_AgreementGuild_Master.XML", "Panel_AgreementGuild_Master", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildIncentive.XML", "Panel_GuildIncentive", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_Incentive_Foundation.XML", "Panel_Guild_Incentive_Foundation", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_Incentive.XML", "Panel_Guild_IncentiveOption", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Guild/Panel_ClanList.XML", "Panel_ClanList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_Journal.XML", "Panel_Guild_Journal", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Guild_Rank.XML", "Panel_Guild_Rank", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildRank_Web.XML", "Panel_GuildRank_Web", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_GuildWebInfo.XML", "Panel_GuildWebInfo", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Guild/Panel_Window_GuildWatchingMode.XML", "Panel_GuildBattleWatchingMode", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/OneOnOne/Panel_Guild_OneOnOneClock.XML", "Panel_Guild_OneOnOneClock", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/OneOnOne/Panel_Guild_OneOnOneAlert.XML", "Panel_Guild_OneOnOneAlert", UIGroup.PAGameUIGroup_Windows)
  if true == _ContentsGroup_isNewOption then
    basicLoadUI("UI_Data/Window/c_Option/Panel_Option_Main.XML", "Panel_Window_cOption", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_Camera.XML", "Panel_Performance_Camera", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_GraphicQuality.XML", "Panel_Performance_GraphicQuality", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_Npc.XML", "Panel_Performance_Npc", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_Optimize.XML", "Panel_Performance_Optimize", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Performance_OptimizeBeta.XML", "Panel_Performance_OptimizeBeta", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Alert.XML", "Panel_Function_Alert", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Convenience.XML", "Panel_Function_Convenience", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Etc.XML", "Panel_Function_Etc", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Interaction.XML", "Panel_Function_Interaction", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Nation.XML", "Panel_Function_Nation", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_View.XML", "Panel_Function_View", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Function_Worldmap.XML", "Panel_Function_Worldmap", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Camera.XML", "Panel_Graphic_Camera", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Effect.XML", "Panel_Graphic_Effect", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Quality.XML", "Panel_Graphic_Quality", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_ScreenShot.XML", "Panel_Graphic_ScreenShot", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Graphic_Window.XML", "Panel_Graphic_Window", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Interface_Action.XML", "Panel_Interface_Action", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Interface_Function.XML", "Panel_Interface_Function", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Interface_Mouse.XML", "Panel_Interface_Mouse", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Interface_Pad.XML", "Panel_Interface_Pad", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Interface_QuickSlot.XML", "Panel_Interface_QuickSlot", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Interface_UI.XML", "Panel_Interface_UI", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Sound_OnOff.XML", "Panel_Sound_OnOff", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Sound_Volume.XML", "Panel_Sound_Volume", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Alert_Alarm.XML", "Panel_Alert_Alarm", UIGroup.PAGameUIGroup_Windows)
  else
  end
  basicLoadUI("UI_Data/Window/Option/Panel_SetShortCut.XML", "Panel_SetShortCut", UIGroup.PAGameUIGroup_Windows)
  if false == _ContentsGroup_RenewUI_MessageBox then
    loadUI("UI_Data/Window/MessageBox/UI_Win_System.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_FadeScreen, RenderModeAllModeOpen)
  else
    loadUI("UI_Data/Window/MessageBox/Console/Panel_MessageBox.XML", "Panel_Win_System", UIGroup.PAGameUIGroup_FadeScreen, RenderModeAllModeOpen)
  end
  loadUI("UI_Data/Window/MessageBox/Panel_ScreenShot_For_Desktop.XML", "Panel_ScreenShot_For_Desktop", UIGroup.PAGameUIGroup_FadeScreen, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/MessageBox/Panel_KickOff.XML", "Panel_KickOff", UIGroup.PAGameUIGroup_FadeScreen, RenderModeAllModeOpen)
  if false == _ContentsGroup_RenewUI_Knowledge then
    loadUI("UI_Data/Window/Knowledge/Panel_Knowledge_Info.XML", "Panel_Knowledge_Info", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/Knowledge/Panel_Knowledge_List.XML", "Panel_Knowledge_List", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/Knowledge/Panel_Knowledge_Main.XML", "Panel_Knowledge_Main", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/Knowledge/Panel_Knowledge_Point.XML", "Panel_Knowledge_Point", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Knowledge
    }))
  else
    loadUI("UI_Data/Window/Knowledge/Console/Panel_Window_Knowledge_Renew.XML", "Panel_Window_Knowledge_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default
    }))
  end
  if true == _ContentsGroup_RenewUI_MentalGame then
    loadUI("UI_Data/Window/MentalKnowledge/Console/Panel_MentalGame.XML", "Panel_Window_MentalGame", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/MentalKnowledge/Console/Panel_MentalGame_Tooltip.XML", "Panel_Window_MentalGame_Tooltip", UIGroup.PAGameUIGroup_Movie, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/MentalKnowledge/Console/Panel_MentalGame_Center.XML", "Panel_Window_MentalGame_Finish", UIGroup.PAGameUIGroup_Movie, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
  else
    loadUI("UI_Data/Window/MentalKnowledge/MentalGame_Base.XML", "Panel_MentalGame_Base", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/MentalKnowledge/MentalGame_Left.XML", "Panel_MentalGame_Left", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/MentalKnowledge/MentalGame_Select.XML", "Panel_MentalGame_Select", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/MentalKnowledge/MentalGame_Tooltip.XML", "Panel_MentalGame_Tooltip", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/MentalKnowledge/MentalGame_Center.XML", "Panel_MentalGame_Center", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
    loadUI("UI_Data/Window/MentalKnowledge/MentalGame_Right_List.XML", "Panel_MentalGame_Right", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_MentalGame,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_Knowledge
    }))
  end
  basicLoadUI("UI_Data/Widget/Damage/UI_Damage.XML", "Panel_Damage", UIGroup.PAGameUIGroup_Dialog)
  basicLoadUI("UI_Data/Widget/QuestList/Field_QuestIcon.XML", "Panel_fieldQuest", UIGroup.PAGameUIGroup_Dialog)
  basicLoadUI("UI_Data/Widget/Enduarance/UI_Endurance.XML", "Panel_Endurance", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Enduarance/UI_HorseEndurance.XML", "Panel_HorseEndurance", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Enduarance/UI_CarriageEndurance.XML", "Panel_CarriageEndurance", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Enduarance/UI_ShipEndurance.XML", "Panel_ShipEndurance", UIGroup.PAGameUIGroup_MainUI)
  if true == _ContentsGroup_RenewUI_Repair then
    loadUI("UI_Data/Window/Repair/Panel_Repair_Renew.XML", "Panel_Repair_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
    loadUI("UI_Data/Window/Repair/Panel_FixMaxEndurance_Renew.XML", "Panel_FixMaxEndurance_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  end
  loadUI("UI_Data/Window/Repair/UI_Window_Repair_Function.XML", "Panel_Window_Repair", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Repair/Panel_FixEquip.XML", "Panel_FixEquip", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Repair/Panel_LuckyRepair_Result.XML", "Panel_LuckyRepair_Result", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Extraction/UI_Window_Extraction_Function.XML", "Panel_Window_Extraction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Extraction/UI_Window_Extraction_Crystal.XML", "Panel_Window_Extraction_Crystal", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Extraction/UI_Window_Extraction_EnchantStone.XML", "Panel_Window_Extraction_EnchantStone", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Extraction/UI_Window_Extraction_Cloth.XML", "Panel_Window_Extraction_Cloth", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Extraction/UI_Window_Extraction_Result.XML", "Panel_Window_Extraction_Result", UIGroup.PAGameUIGroup_Alert, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Enchant/UI_Window_SpiritEnchant_Extraction.XML", "Panel_EnchantExtraction", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/CharacterTag/Panel_CharacterTag.XML", "Panel_CharacterTag", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/CharacterTag/Panel_Icon_CharacterTag.XML", "Panel_Icon_CharacterTag", UIGroup.PAGameUIGroup_Widget)
  if _ContentsGroup_isConsoleTest then
    loadUI("UI_Data/Widget/MainStatus/UI_Cursor.XML", "Panel_Cursor", UIGroup.PAGameUIGroup_FadeScreen, RenderModeAllModeOpen)
  else
    loadUI("UI_Data/Widget/MainStatus/UI_Cursor.XML", "Panel_Cursor", UIGroup.PAGameUIGroup_Window_Progress, RenderModeAllModeOpen)
  end
  if isActionModeActive then
    basicLoadUI("UI_Data/Widget/Z_Console/UI_SelfPlayer_Main_Slot_User_Bar.XML", "Panel_MainStatus_User_Bar", UIGroup.PAGameUIGroup_MainUI)
    basicLoadUI("UI_Data/Widget/Z_Console/UI_SelfPlayer_Main_Slot_User_BarSimple.XML", "Panel_MainStatus_User_Bar_simplify", UIGroup.PAGameUIGroup_MainUI)
    basicLoadUI("UI_Data/Widget/Z_Console/UI_ConsoleModeWidget_MainStatus.XML", "Panel_SelfPlayerExpGage", UIGroup.PAGameUIGroup_MainUI)
  else
    basicLoadUI("UI_Data/Widget/MainStatus/UI_SelfPlayer_Main_Slot_User_Bar.XML", "Panel_MainStatus_User_Bar", UIGroup.PAGameUIGroup_MainUI)
    if true == _ContentsGroup_RenewUI_Main then
      basicLoadUI("UI_Data/Widget/MainStatus/Console/Panel_Widget_MainStatus_Renew.XML", "Panel_SelfPlayerExpGage", UIGroup.PAGameUIGroup_MainUI)
    else
      basicLoadUI("UI_Data/Widget/MainStatus/UI_SelfPlayerExp.XML", "Panel_SelfPlayerExpGage", UIGroup.PAGameUIGroup_MainUI)
    end
    basicLoadUI("UI_Data/Widget/MainStatus/Panel_PersonalIcon_Left.XML", "Panel_PersonalIcon_Left", UIGroup.PAGameUIGroup_MainUI)
  end
  basicLoadUI("UI_Data/Widget/MainStatus/UI_SelfPlayer_Main_Slot_Casting_Bar.XML", "Panel_Casting_Bar", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MainStatus/PvpMode_Button.XML", "Panel_PvpMode", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_ClassResource.XML", "Panel_ClassResource", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_Adrenallin.XML", "Panel_Adrenallin", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_GuardGauge.XML", "Panel_GuardGauge", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_AutoTraining.XML", "Panel_AutoTraining", UIGroup.PAGameUIGroup_MainUI)
  if not isActionModeActive then
    basicLoadUI("UI_Data/Widget/RightTopIcons/Panel_PersonalIcon.XML", "Panel_PersonalIcon", UIGroup.PAGameUIGroup_MainUI)
  end
  basicLoadUI("UI_Data/Widget/DropItem/Panel_Widget_DropItem.XML", "Panel_Widget_DropItem", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/DropItem/Panel_Window_DropItem.XML", "Panel_Window_DropItem", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/MovieGuide/Panel_MovieGuide.XML", "Panel_MovieGuide", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/ImportantKnowledge/Panel_ImportantKnowledge.XML", "Panel_ImportantKnowledge", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/ImportantKnowledge/Panel_Knowledge_Main.XML", "Panel_NewKnowledge", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/ImportantKnowledge/Panel_NormalKnowledge.XML", "Panel_NormalKnowledge", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/NewEquip/Panel_NewEquip.XML", "Panel_NewEquip", UIGroup.PAGameUIGroup_MainUI)
  loadUI("UI_Data/Widget/NakMessage/NakMessage.XML", "Panel_NakMessage", UIGroup.PAGameUIGroup_ModalDialog, RenderModeAllModeOpen)
  loadUI("UI_Data/Widget/NakMessage/RewardSelect_NakMessage.XML", "Panel_RewardSelect_NakMessage", UIGroup.PAGameUIGroup_Chatting, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Challenge_Reward_Alarm.XML", "Panel_ChallengeReward_Alert", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Challenge_SpecialReward_Alarm.XML", "Panel_SpecialReward_Alert", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_NewEventProduct_Alarm.XML", "Panel_NewEventProduct_Alarm", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_DailyStamp_Alarm.XML", "Panel_DailyStamp_Alert", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Coupon_Alarm.XML", "Panel_Coupon_Alert", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_ItemMarket_Alarm.XML", "Panel_ItemMarket_Alert", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/CraftLevInfo/UI_Widget_CraftLevInfo.XML", "Panel_Widget_CraftLevInfo", UIGroup.PAGameUIGroup_ProgressBar)
  basicLoadUI("UI_Data/Widget/PotenGradeInfo/UI_Widget_PotenGradeInfo.xml", "Panel_Widget_PotenGradeInfo", UIGroup.PAGameUIGroup_ProgressBar)
  if true == _ContentsGroup_RenewUI_Chatting then
    loadUI("UI_Data/Widget/Chatting/Console/Panel_Widget_Chatting_Renew.XML", "Panel_Widget_Chatting_Renew", UIGroup.PAGameUIGroup_Widget, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_WorldMap
    }))
    loadUI("UI_Data/Widget/Chatting/Console/Panel_Widget_ChattingHistory_Renew.XML", "Panel_Widget_ChattingHistory_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_WorldMap
    }))
  end
  loadUI("UI_Data/Widget/Chatting/UI_Window_Chat.XML", "Panel_Chat", UIGroup.PAGameUIGroup_Widget, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/UI_Window_ChatOption.XML", "Panel_ChatOption", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/UI_Window_Chatting_Input.XML", "Panel_Chatting_Input", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Filter.XML", "Panel_Chatting_Filter", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Macro.XML", "Panel_Chatting_Macro", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chat_SocialMenu.XML", "Panel_Chat_SocialMenu", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chat_SubMenu.XML", "Panel_Chat_SubMenu", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Block_GoldSeller.XML", "Panel_Chatting_Block_GoldSeller", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/Chatting/Panel_Chatting_Color.XML", "Panel_Chatting_Color", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Widget/GameTips/UI_Widget_GameTips.XML", "Panel_GameTips", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/GameTips/UI_Widget_GameTipsMask.XML", "Panel_GameTipMask", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/GameTips/UI_Window_GameTips.XML", "Panel_Window_GameTips", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Widget/NoticeAlert/NoticeAlert.XML", "Panel_NoticeAlert", UIGroup.PAGameUIGroup_GameSystemMenu)
  basicLoadUI("UI_Data/Widget/QuickSlot/UI_Panel_QuickSlot.XML", "Panel_QuickSlot", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/Panel_NewQuickSlot.XML", "Panel_NewQuickSlot", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_0.XML", "Panel_NewQuickSlot_0", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_1.XML", "Panel_NewQuickSlot_1", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_2.XML", "Panel_NewQuickSlot_2", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_3.XML", "Panel_NewQuickSlot_3", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_4.XML", "Panel_NewQuickSlot_4", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_5.XML", "Panel_NewQuickSlot_5", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_6.XML", "Panel_NewQuickSlot_6", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_7.XML", "Panel_NewQuickSlot_7", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_8.XML", "Panel_NewQuickSlot_8", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_9.XML", "Panel_NewQuickSlot_9", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_10.XML", "Panel_NewQuickSlot_10", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_11.XML", "Panel_NewQuickSlot_11", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_12.XML", "Panel_NewQuickSlot_12", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_13.XML", "Panel_NewQuickSlot_13", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_14.XML", "Panel_NewQuickSlot_14", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_15.XML", "Panel_NewQuickSlot_15", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_16.XML", "Panel_NewQuickSlot_16", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_17.XML", "Panel_NewQuickSlot_17", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_18.XML", "Panel_NewQuickSlot_18", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/NewQuickSlot/Panel_NewQuickSlot_19.XML", "Panel_NewQuickSlot_19", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/UI_SkillCooltime_QuickView.XML", "Panel_SkillCooltime", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/Panel_SkillCoolTimeQuickSlot.XML", "Panel_SkillCoolTimeQuickSlot", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_0.XML", "Panel_SkillCoolTimeQuickSlot_0", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_1.XML", "Panel_SkillCoolTimeQuickSlot_1", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_2.XML", "Panel_SkillCoolTimeQuickSlot_2", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_3.XML", "Panel_SkillCoolTimeQuickSlot_3", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_4.XML", "Panel_SkillCoolTimeQuickSlot_4", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_5.XML", "Panel_SkillCoolTimeQuickSlot_5", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_6.XML", "Panel_SkillCoolTimeQuickSlot_6", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_7.XML", "Panel_SkillCoolTimeQuickSlot_7", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_8.XML", "Panel_SkillCoolTimeQuickSlot_8", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/SkillCoolTimeQuickSlot/Panel_SkillCoolTimeQuickSlot_9.XML", "Panel_SkillCoolTimeQuickSlot_9", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Stamina/Stamina.XML", "Panel_Stamina", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Stamina/CannonGauge.XML", "Panel_CannonGauge", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Housing/UI_Panel_Housing.XML", "Panel_Housing", UIGroup.PAGameUIGroup_Housing)
  loadUI("UI_Data/Widget/Housing/Panel_HouseName.XML", "Panel_HouseName", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default
  }))
  loadUI("UI_Data/Widget/Housing/Panel_Housing_FarmInfo_New.XML", "Panel_Housing_FarmInfo_New", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_HouseInstallation
  }))
  loadUI("UI_Data/Widget/Housing/Panel_InstallationMode_FarmInfo.XML", "Panel_InstallationMode_FarmInfo", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_HouseInstallation
  }))
  if false == isNewHousing then
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode.XML", "Panel_House_InstallationMode", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation
    }))
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_ObjectControl.XML", "Panel_House_InstallationMode_ObjectControl", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation
    }))
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_WarInfomation.XML", "Panel_House_WarInformation", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation,
      RenderMode.eRenderMode_WorldMap
    }))
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_Cart.XML", "Panel_House_InstallationMode_Cart", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation
    }))
  else
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_New.XML", "Panel_House_InstallationMode", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation
    }))
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_ObjectControl.XML", "Panel_House_InstallationMode_ObjectControl", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation
    }))
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_WarInfomation.XML", "Panel_House_WarInformation", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation,
      RenderMode.eRenderMode_WorldMap
    }))
    loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_Cart_New.XML", "Panel_House_InstallationMode_Cart", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_HouseInstallation
    }))
  end
  basicLoadUI("UI_Data/Window/ChangeName/UI_Change_Nickname.XML", "Panel_ChangeNickname", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Housing/Panel_House_InstallationMode_VillageTent.XML", "Panel_House_InstallationMode_VillageTent", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_HouseInstallation
  }))
  basicLoadUI("UI_Data/Widget/ProgressBar/UI_Win_Collect_Bar.XML", "Panel_Collect_Bar", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Widget/ProgressBar/UI_Win_Product_Bar.XML", "Panel_Product_Bar", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Widget/ProgressBar/UI_Win_Enchant_Bar.XML", "Panel_Enchant_Bar", UIGroup.PAGameUIGroup_Window_Progress)
  if true == _ContentsGroup_RenewUI_Dailog then
    loadUI("UI_Data/Widget/Dialogue/Console/Panel_Dialog_Main.xml", "Panel_Dialog_Main", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_BlackSpirit
    }))
  else
    loadUI("UI_Data/Widget/Dialogue/UI_Win_Npc_Dialog.xml", "Panel_Npc_Dialog", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_BlackSpirit
    }))
    loadUI("UI_Data/Widget/Dialogue/UI_Win_Npc_Exchange_Item.xml", "Panel_Exchange_Item", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_BlackSpirit
    }))
  end
  loadUI("UI_Data/Widget/Dialogue/UI_Win_Npc_Quest_Reward.xml", "Panel_Npc_Quest_Reward", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit
  }))
  loadUI("UI_Data/Widget/Dialogue/UI_Npc_Dialog_Scene.xml", "Panel_Dialog_Scene", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit
  }))
  loadUI("UI_Data/Widget/Dialogue/Dialog_Itemtake.xml", "Panel_Dialogue_Itemtake", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit
  }))
  loadUI("UI_Data/Widget/Dialogue/UI_DetectPlayer.xml", "Panel_DetectPlayer", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_BlackSpirit
  }))
  loadUI("UI_Data/Widget/Dialogue/UI_Win_Interest_Knowledge.XML", "Panel_Interest_Knowledge", UIGroup.PAGameUIGroup_Dialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit
  }))
  loadUI("UI_Data/Widget/Dialogue/Panel_Knowledge_Management.XML", "Panel_KnowledgeManagement", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_BlackSpirit
  }))
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Main_Control.xml", "Panel_UIControl", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Main_Normal.xml", "Panel_UIMain", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/QuestList/NewQuest.XML", "Panel_NewQuest", UIGroup.PAGameUIGroup_Chatting)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_Main_NewQuest_Alarm.xml", "Panel_NewQuest_Alarm", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Widget/Menu/Panel_Menu.XML", "Panel_Menu", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_UISetting
  }))
  loadUI("UI_Data/Widget/Menu/Panel_Menu_New.XML", "Panel_Menu_New", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_UISetting
  }))
  basicLoadUI("UI_Data/Widget/SkillLog/Panel_Widget_SkillLog.XML", "Panel_Widget_SkillLog", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/LvUpMessage/UI_Levelup_Reward.XML", "Panel_Levelup_Reward", UIGroup.PAGameUIGroup_Chatting)
  if true == _ContentsGroup_RenewUI_Pet then
    basicLoadUI("UI_Data/Widget/Acquire/Acquire.XML", "Panel_Acquire", UIGroup.PAGameUIGroup_InstanceMission, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_SkillWindow
    }))
  else
    basicLoadUI("UI_Data/Widget/Acquire/Acquire.XML", "Panel_Acquire", UIGroup.PAGameUIGroup_Chatting, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog,
      RenderMode.eRenderMode_SkillWindow
    }))
  end
  loadUI("UI_Data/Widget/Acquire/Acquire_QuestDirect.XML", "Panel_QuestDirect", UIGroup.PAGameUIGroup_Chatting, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Knowledge,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_BlackSpirit,
    RenderMode.eRenderMode_MentalGame,
    RenderMode.eRenderMode_customScreenShot,
    RenderMode.eRenderMode_CutScene
  }))
  if isActionModeActive then
    basicLoadUI("UI_Data/Widget/Z_Console/UI_Widget_EnemyGauge.XML", "Panel_Monster_Bar", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/Widget/EnemyGauge/EnemyGauge.XML", "Panel_Monster_Bar", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/Widget/Region/Region.XML", "Panel_Region", UIGroup.PAGameUIGroup_Widget)
  if _ContentsGroup_isUsedNewCharacterInfo == false then
    basicLoadUI("UI_Data/Widget/PotencialUp/UI_Potencial_Up.xml", "Panel_Potencial_Up", UIGroup.PAGameUIGroup_Chatting)
  else
    basicLoadUI("UI_Data/Widget/PotencialUp/UI_Potencial_Up_New.xml", "Panel_Potencial_Up", UIGroup.PAGameUIGroup_Chatting)
  end
  basicLoadUI("UI_Data/Widget/Party/UI_Party.xml", "Panel_Party", UIGroup.PAGameUIGroup_Dialog)
  basicLoadUI("UI_Data/Widget/Party/Panel_PartyOption.xml", "Panel_PartyOption", UIGroup.PAGameUIGroup_Chatting)
  basicLoadUI("UI_Data/Window/Inventory/UI_Window_PartyInventory.XML", "Panel_Window_PartyInventory", UIGroup.PAGameUIGroup_Quest)
  basicLoadUI("UI_Data/Widget/UIcontrol/UI_WhereUseTargetItem.XML", "Panel_WhereUseItemDirection", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/Party/Panel_Party_ItemList.XML", "Panel_Party_ItemList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Party/UI_Party_New.xml", "Panel_LargeParty", UIGroup.PAGameUIGroup_Dialog)
  basicLoadUI("UI_Data/Widget/QuestList/ProgressGuildQuest.XML", "Panel_Current_Guild_Quest", UIGroup.PAGameUIGroup_Dialog)
  loadUI("UI_Data/Widget/QuestList/Panel_CheckedQuestInfo.XML", "Panel_CheckedQuestInfo", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Widget/QuestList/Panel_CheckedQuest.XML", "Panel_CheckedQuest", UIGroup.PAGameUIGroup_QuestLog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  if _ContentsGroup_RenewUI then
    loadUI("UI_Data/Widget/QuestList/Console/Panel_MainQuest_Renew.XML", "Panel_MainQuest", UIGroup.PAGameUIGroup_QuestLog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_WorldMap
    }))
  else
    loadUI("UI_Data/Widget/QuestList/Panel_MainQuest.XML", "Panel_MainQuest", UIGroup.PAGameUIGroup_QuestLog, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_WorldMap
    }))
  end
  loadUI("UI_Data/Widget/EnemyGauge/EnemyAlert_OnShip.XML", "Panel_EnemyAlert_OnShip", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Widget/Rader/Rader.XML", "Panel_Radar", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Rader/RaderTimeBarNumber.XML", "Panel_TimeBarNumber", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Rader/RaderTimeBar.XML", "Panel_TimeBar", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Rader/Rader_NightAlert.XML", "Panel_Rader_NightAlert", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_FrameLoop_Widget.XML", "Panel_FrameLoop_Widget", UIGroup.PAGameUIGroup_MainUI)
  loadUI("UI_Data/Widget/NpcNavigation/NpcNavigation.XML", "Panel_NpcNavi", UIGroup.PAGameUIGroup_Housing, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_NpcNavigation.XML", "Panel_Tooltip_NpcNavigation", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Widget/NaviPath/Panel_NaviPath.XML", "Panel_NaviPath", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/TownNpcNavi/Panel_Widget_TownNpcNavi.XML", "Panel_Widget_TownNpcNavi", UIGroup.PAGameUIGroup_Widget)
  if true == _ContentsGroup_RenewUI_VoiceChat then
    basicLoadUI("UI_Data/Window/VoiceChat/Console/Panel_Window_VoiceChat.XML", "Panel_Window_VoiceChat", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/Window/VoiceChat/Panel_SetVoiceChat.XML", "Panel_SetVoiceChat", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/Widget/Bubble/Bubble.XML", "Panel_Bubble", UIGroup.PAGameUIGroup_Widget)
  if true == _ContentsGroup_RenewUI_Interaction then
    basicLoadUI("UI_Data/Widget/Interaction/Console/Panel_Widget_Interaction_Renew.XML", "Panel_Widget_PanelInteraction_Renew", UIGroup.PAGameUIGroup_Interaction)
  else
    basicLoadUI("UI_Data/Widget/Interaction/UI_Character_InterAction.XML", "Panel_Interaction", UIGroup.PAGameUIGroup_Interaction)
  end
  basicLoadUI("UI_Data/Widget/Interaction/Panel_Interaction_HouseRank.XML", "Panel_Interaction_HouseRank", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Interaction/Panel_Interaction_FriendHouseList.XML", "Panel_Interaction_FriendHouseList", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Interaction/Panel_Interaction_House.XML", "Panel_Interaction_House", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Interaction/Panel_WatchingCommand.XML", "Panel_WatchingMode", UIGroup.PAGameUIGroup_Interaction)
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Skill.XML", "Panel_Tooltip_Skill", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Skill_forLearning.XML", "Panel_Tooltip_Skill_forLearning", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item.XML", "Panel_Tooltip_Item", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_InGameCashShop,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_Dye
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_chattingLinkedItem.XML", "Panel_Tooltip_Item_chattingLinkedItem", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_chattingLinkedItemClick.XML", "Panel_Tooltip_Item_chattingLinkedItemClick", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Item_equipped.XML", "Panel_Tooltip_Item_equipped", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Guild_Introduce.XML", "Panel_Tooltip_Guild_Introduce", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Common.XML", "Panel_Tooltip_Common", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Worker.XML", "Panel_Worker_Tooltip", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Work.XML", "Panel_Tooltip_Work", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Dye,
    RenderMode.eRenderMode_HouseInstallation,
    RenderMode.eRenderMode_InGameCashShop
  }))
  basicLoadUI("UI_Data/Widget/Introduction/Panel_Widget_Introduction.XML", "Panel_Introduction", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/QuickSlot/UI_SkillCooltime_Effect.XML", "Panel_CoolTime_Effect", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/UI_SkillCooltime_Effect_Slot.XML", "Panel_CoolTime_Effect_Slot", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/UI_SkillCooltime_Effect_Item.XML", "Panel_CoolTime_Effect_Item", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/QuickSlot/UI_SkillCooltime_Effect_Item_Slot.XML", "Panel_CoolTime_Effect_Item_Slot", UIGroup.PAGameUIGroup_MainUI)
  loadUI("UI_Data/Window/DeadMessage/DeadMessage.XML", "Panel_DeadMessage", UIGroup.PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_Default
  }))
  basicLoadUI("UI_Data/Window/DeadMessage/Panel_Cash_Revival_BuyItem.XML", "Panel_Cash_Revival_BuyItem", UIGroup.PAGameUIGroup_FadeScreen)
  basicLoadUI("UI_Data/Window/DeadMessage/Panel_DeadNodeSelect.XML", "Panel_DeadNodeSelect", UIGroup.PAGameUIGroup_FadeScreen)
  basicLoadUI("UI_Data/Window/DeadMessage/DangerAlert.XML", "Panel_Danger", UIGroup.PAGameUIGroup_ScreenEffect)
  loadUI("UI_Data/Window/TradeMarket/UI_Win_Npc_TradeMarket.xml", "Panel_Npc_Trade_Market", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/TradeMarket/UI_Win_Npc_TradeMarket_BuyItemList_Panel.xml", "Panel_Trade_Market_BuyItemList", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/TradeMarket/UI_Win_Npc_TradeMarket_SellItemList_Panel.xml", "Panel_Trade_Market_Sell_ItemList", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/TradeMarket/UI_Win_Npc_TradeMarket_GraphPanel.xml", "Panel_Trade_Market_Graph_Window", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/TradeMarket/UI_Win_Npc_TradeGame.xml", "Panel_TradeGame", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  if true == _ContentsGroup_isUsedNewTradeEventNotice then
    loadUI("UI_Data/Window/TradeMarket/UI_Win_Npc_TradeEventNotice_Renewal.xml", "Panel_TradeEventNotice_Renewal", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  else
    loadUI("UI_Data/Window/TradeMarket/UI_Win_Npc_TradeMarket_Event.xml", "Panel_TradeMarket_EventInfo", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  end
  if true == GlobalSwitch_UseOldAlchemy then
    basicLoadUI("UI_Data/Window/Alchemy/Panel_Alchemy.xml", "Panel_Alchemy", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Alchemy/Panel_RecentCook.xml", "Panel_RecentCook", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/Window/Alchemy/Panel_RecentCook_New.xml", "Panel_RecentCook", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Alchemy/Panel_Alchemy_New.xml", "Panel_Alchemy", UIGroup.PAGameUIGroup_Windows)
  end
  if true == _ContentsGroup_RenewUI then
    basicLoadUI("UI_Data/Window/Friend/Console/Console_window_Friend.XML", "Panel_FriendList", UIGroup.PAGameUIGroup_Windows)
  else
    basicLoadUI("UI_Data/Window/Friend/Friend.xml", "Panel_FriendList", UIGroup.PAGameUIGroup_Windows)
  end
  basicLoadUI("UI_Data/Window/Friend/Panel_Friend_Messanger.xml", "Panel_Friend_Messanger", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/Alchemy/Panel_Manufacture.xml", "Panel_Manufacture", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/Alchemy/Panel_Manufacture_Notify.XML", "Panel_Manufacture_Notify", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Widget/FieldViewMode/UI_FieldViewMode.xml", "Panel_FieldViewMode", UIGroup.PAGameUIGroup_InstanceMission, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_UISetting
  }))
  basicLoadUI("UI_Data/Window/GameExit/Panel_ChannelSelect.XML", "Panel_ChannelSelect", UIGroup.PAGameUIGroup_GameMenu)
  if true == _ContentsGroup_RenewUI_ExitGame then
    basicLoadUI("UI_Data/Window/GameExit/Console/Panel_Window_GameExit.XML", "Panel_Window_GameExit", UIGroup.PAGameUIGroup_WorldMap_Contents)
    basicLoadUI("UI_Data/Window/GameExit/Console/Panel_Window_GameExit_CharMove.XML", "Panel_Window_GameExit_CharMove", UIGroup.PAGameUIGroup_WorldMap_Contents)
    basicLoadUI("UI_Data/Window/GameExit/Console/Panel_Window_ExitConfirm.XML", "Panel_Window_GameExit_Confirm", UIGroup.PAGameUIGroup_WorldMap_Contents)
  else
    basicLoadUI("UI_Data/Window/GameExit/Panel_GameExit.xml", "Panel_GameExit", UIGroup.PAGameUIGroup_WorldMap_Contents)
    loadUI("UI_Data/Window/GameExit/Panel_ExitConfirm_New.xml", "Panel_ExitConfirm", UIGroup.PAGameUIGroup_GameMenu, RenderModeAllModeOpen)
    loadUI("UI_Data/Window/GameExit/Panel_ExitConfirm.xml", "Panel_ExitConfirm_Old", UIGroup.PAGameUIGroup_GameMenu, RenderModeAllModeOpen)
  end
  if false == _ContentsGroup_RenewUI then
    loadUI("UI_Data/Widget/RecentMemory/Panel_RecentMemory.XML", "Panel_RecentMemory", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default
    }))
  end
  basicLoadUI("UI_Data/Window/DeadMessage/UI_NoAccessibleArea_Alert.xml", "Panel_NoAceessArea_Alert", UIGroup.PAGameUIGroup_ScreenEffect)
  loadUI("UI_Data/Window/ProductNote/Panel_ProductNote.XML", "Panel_ProductNote", UIGroup.PAGameUIGroup_GameSystemMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/KeyboardHelp/Panel_KeyboardHelp.XML", "Panel_KeyboardHelp", UIGroup.PAGameUIGroup_DeadMessage, RenderModeAllModeOpen)
  basicLoadUI("UI_Data/Window/LevelupGuide/Panel_LevelupGuide.XML", "Panel_LevelupGuide", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Window/QnAWebLink/Panel_QnAWebLink.XML", "Panel_QnAWebLink", UIGroup.PAGameUIGroup_WorldMap_Contents)
  if _ContentsGroup_RenewUI_MiniGame then
    basicLoadUI("UI_Data/Widget/MiniGame/Console/MiniGame_Timing_Renew.xml", "Panel_MiniGame_Timing", UIGroup.PAGameUIGroup_MainUI)
    basicLoadUI("UI_Data/Widget/MiniGame/Console/MiniGame_BattleGauge_Renew.xml", "Panel_BattleGauge", UIGroup.PAGameUIGroup_MainUI)
  else
    basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Timing.xml", "Panel_MiniGame_Timing", UIGroup.PAGameUIGroup_MainUI)
    basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_BattleGauge.xml", "Panel_BattleGauge", UIGroup.PAGameUIGroup_MainUI)
  end
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Gradient.xml", "Panel_Minigame_Gradient", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_SinGauge.xml", "Panel_SinGauge", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Command.xml", "Panel_Command", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Rhythm.xml", "Panel_RhythmGame", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Rhythm_Drum.xml", "Panel_RhythmGame_Drum", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_FillGauge.xml", "Panel_FillGauge", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_GradientY.xml", "Panel_MiniGame_Gradient_Y", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Steal.xml", "Panel_MiniGame_Steal", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_PowerControl.xml", "Panel_MiniGame_PowerControl", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Jaksal.xml", "Panel_MiniGame_Jaksal", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/Minagame_SteeringGear.xml", "Panel_SteeringWheel", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Hammer_New.xml", "Panel_Hammer_New", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_Find.xml", "Panel_MiniGame_Find", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/MiniGame/MiniGame_ResultMessage.xml", "Panel_MiniGame_MiniGameResult", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Widget/SkillCommand/UI_SkillCommand.xml", "Panel_SkillCommand", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Menu/Panel_Combo_Guide.xml", "Panel_Combo_Guide", UIGroup.PAGameUIGroup_MainUI)
  if ToClient_IsDevelopment() then
    basicLoadUI("UI_Data/Widget/SkillCommand/UI_ComboCommand.xml", "Panel_ComboCommand", UIGroup.PAGameUIGroup_MainUI)
    basicLoadUI("UI_Data/Widget/Console/UI_Widget_NextCombo.xml", "Panel_ConsoleCombo", UIGroup.PAGameUIGroup_MainUI)
  end
  loadUI("UI_Data/Widget/Search/UI_Dialog_Search.xml", "Panel_Dialog_Search", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Widget/Tutorial/Panel_Movie_KeyViewer.xml", "Panel_Movie_KeyViewer", UIGroup.PAGameUIGroup_MainUI)
  loadUI("UI_Data/Widget/Tutorial/UI_Masking_Tutorial_Quest.XML", "Panel_Masking_Tutorial", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Tutorial
  }))
  loadUI("UI_Data/Widget/Tutorial/Welcome_to_BlackDesert.xml", "Panel_Tutorial", UIGroup.PAGameUIGroup_Alert, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Tutorial,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/Tutorial/Panel_TutorialMenu.xml", "Panel_TutorialMenu", UIGroup.PAGameUIGroup_Interaction, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default
  }))
  basicLoadUI("UI_Data/Widget/Tutorial/Panel_ArousalTutorial.xml", "Panel_ArousalTutorial", UIGroup.PAGameUIGroup_Alert)
  basicLoadUI("UI_Data/Widget/Tutorial/Panel_SummonBossTutorial.xml", "Panel_SummonBossTutorial", UIGroup.PAGameUIGroup_Alert)
  basicLoadUI("UI_Data/Widget/Tutorial/UI_ButtonHelp.xml", "Panel_ButtonHelp", UIGroup.PAGameUIGroup_Movie)
  basicLoadUI("UI_Data/Widget/Tutorial/UI_KeyTutorial.xml", "Panel_KeyTutorial", UIGroup.PAGameUIGroup_Movie)
  basicLoadUI("UI_Data/Widget/Tutorial/Panel_LifeTutorial.xml", "Panel_LifeTutorial", UIGroup.PAGameUIGroup_Alert)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_Housing_VendingMachineList.xml", "Panel_Housing_VendingMachineList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_Housing_SettingVendingMachine.xml", "Panel_Housing_SettingVendingMachine", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_Housing_ConsignmentSale.xml", "Panel_Housing_ConsignmentSale", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_Housing_SettingConsignmentSale.xml", "Panel_Housing_SettingConsignmentSale", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_Housing_RegisterConsignmentSale.xml", "Panel_Housing_RegisterConsignmentSale", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/HouseInfo/Panel_MyVendor_List.xml", "Panel_MyVendor_List", UIGroup.PAGameUIGroup_Window_Progress)
  loadUI("UI_Data/Window/HouseInfo/Panel_HouseControl_Main.XML", "Panel_HouseControl", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/HouseInfo/Panel_House_SellBuy_Condition.XML", "Panel_House_SellBuy_Condition", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Widget/Scroll/UI_Scroll.xml", "Panel_Scroll", UIGroup.PAGameUIGroup_GameSystemMenu)
  basicLoadUI("UI_Data/Widget/BreathGauge/Panel_BreathGauge.XML", "Panel_BreathGauge", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Delivery/UI_Window_Delivery_Person.XML", "Panel_Window_DeliveryForPerson", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Delivery/UI_Window_Delivery_GameExit.XML", "Panel_Window_DeliveryForGameExit", UIGroup.PAGameUIGroup_GameMenu)
  loadUI("UI_Data/Widget/Dialogue/Panel_AskKnowledge.XML", "Panel_AskKnowledge", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Cutscene/Panel_CutsceneMovie.XML", "Panel_Cutscene", UIGroup.PAGameUIGroup_MainUI, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_CutScene
  }))
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_HouseHold.XML", "Panel_Copy_HouseHold", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Installation.XML", "Panel_Copy_Installation", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Monster.XML", "Panel_Copy_Monster", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Npc.XML", "Panel_Copy_Npc", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_OtherPlayer.XML", "Panel_Copy_OtherPlayer", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_SelfPlayer.XML", "Panel_Copy_SelfPlayer", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_NameTag_Vehicle.XML", "Panel_Copy_Vehicle", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_BubbleBox.XML", "Panel_Copy_BubbleBox", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/HumanRelation/HumanRelation.XML", "Panel_Copy_HumanRelation", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/HumanRelation/HumanRelationIcon.XML", "Panel_Copy_HumanRelationIcon", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Actor/UI_Actor_WaitComment.XML", "Panel_Copy_WaitComment", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/NaviPath/Panel_NaviPath.XML", "Panel_Copy_NaviPath", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/MessageHistory/Panel_MessageHistory.XML", "Panel_MessageHistory", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/MessageHistory/Panel_MessageHistory_BTN.XML", "Panel_MessageHistory_BTN", UIGroup.PAGameUIGroup_Windows)
  if _ContentsGroup_RenewUI_PearlShop then
    loadUI("UI_Data/Window/IngameCashShop/Console/Panel_PearlShop_Renew.XML", "Panel_PearlShop", UIGroup.PAGameUIGroup_Interaction, RenderModeBitSetInGameCashShop)
    loadUI("UI_Data/Window/IngameCashShop/Console/Panel_PearlShop_Category_Renew.XML", "Panel_Pearlshop_Category", UIGroup.PAGameUIGroup_Interaction, RenderModeBitSetInGameCashShop)
    loadUI("UI_Data/Window/IngameCashShop/Console/Panel_PearlShop_ProductInfo_Renew.XML", "Panel_PearlShop_ProductInfo", UIGroup.PAGameUIGroup_Interaction, RenderModeBitSetInGameCashShop)
    loadUI("UI_Data/Window/IngameCashShop/Console/Panel_PearlShop_ProductBuy_Renew.XML", "Panel_PearlShop_ProductBuy", UIGroup.PAGameUIGroup_Interaction, RenderModeBitSetInGameCashShop)
  end
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop.XML", "Panel_IngameCashShop", UIGroup.PAGameUIGroup_Interaction, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_GoodsTooltip.XML", "Panel_IngameCashShop_GoodsTooltip", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_GoodsDetailInfo.XML", "Panel_IngameCashShop_GoodsDetailInfo", UIGroup.PAGameUIGroup_Window_Progress, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_SetEquip.XML", "Panel_IngameCashShop_SetEquip", UIGroup.PAGameUIGroup_Window_Progress, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_Controller.XML", "Panel_IngameCashShop_Controller", UIGroup.PAGameUIGroup_Interaction, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_BuyOrGift.XML", "Panel_IngameCashShop_BuyOrGift", UIGroup.PAGameUIGroup_ModalDialog, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_Password.XML", "Panel_IngameCashShop_Password", UIGroup.PAGameUIGroup_GameSystemMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_InGameCashShop,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_NewCart.XML", "Panel_IngameCashShop_NewCart", UIGroup.PAGameUIGroup_InstanceMission, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_ChargeDaumCash.XML", "Panel_IngameCashShop_ChargeDaumCash", UIGroup.PAGameUIGroup_GameSystemMenu, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_TermsofDaumCash.XML", "Panel_IngameCashShop_TermsofDaumCash", UIGroup.PAGameUIGroup_GameSystemMenu, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_MakePaymentsFromCart.XML", "Panel_IngameCashShop_MakePaymentsFromCart", UIGroup.PAGameUIGroup_Siege, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_BuyPearlBox.XML", "Panel_IngameCashShop_BuyPearlBox", UIGroup.PAGameUIGroup_WorldMap_Contents, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_HowUsePearlShop.XML", "Panel_IngameCashShop_HowUsePearlShop", UIGroup.PAGameUIGroup_WorldMap_Contents, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_Coupon.XML", "Panel_IngameCashShop_Coupon", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_InGameCashShop
  }))
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_CategorySale.XML", "Panel_IngameCashShop_EventCart", UIGroup.PAGameUIGroup_WorldMap_Contents, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_EasyPayment.XML", "Panel_IngameCashShop_EasyPayment", UIGroup.PAGameUIGroup_ModalDialog, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/IngameCashShop/Panel_Window_StampCoupon.XML", "Panel_Window_StampCoupon", UIGroup.PAGameUIGroup_WorldMap_Contents, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_RecommandGoods.XML", "Panel_Window_RecommandGoods", UIGroup.PAGameUIGroup_InstanceMission, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/IngameCashShop/Panel_IngameCashShop_RecommandGoods_PopUp.XML", "Panel_Window_RecommandGoods_PopUp", UIGroup.PAGameUIGroup_InstanceMission, RenderModeBitSetInGameCashShop)
  loadUI("UI_Data/Window/Cash_Customization/Panel_Cash_Customization.XML", "Panel_Cash_Customization", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_IngameCustomize
  }))
  loadUI("UI_Data/Window/Cash_Customization/Panel_Cash_Customization_BuyItem.XML", "Panel_Cash_Customization_BuyItem", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_IngameCustomize
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarket_Function.XML", "Panel_Window_ItemMarket_Function", UIGroup.PAGameUIGroup_WorldMap_Contents, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarketNew.XML", "Panel_Window_ItemMarket", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarket_Favorite.XML", "Panel_Window_ItemMarket_Favorite", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_BidDesc.XML", "Panel_ItemMarket_BidDesc", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarket_ItemSet.XML", "Panel_Window_ItemMarket_ItemSet", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarket_RegistItem.XML", "Panel_Window_ItemMarket_RegistItem", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarket_BuyConfirm.XML", "Panel_Window_ItemMarket_BuyConfirm", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarket_BuyConfirm_Secure.XML", "Panel_Window_ItemMarket_BuyConfirmSecure", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_AlarmList.XML", "Panel_ItemMarket_AlarmList", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_Alarm.XML", "Panel_ItemMarket_Alarm", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_PreBid.XML", "Panel_ItemMarket_PreBid", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_PreBid_Manager.XML", "Panel_ItemMarket_PreBid_Manager", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_Password.XML", "Panel_ItemMarket_Password", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_AlarmList_New.XML", "Panel_Window_ItemMarketAlarmList_New", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_ItemMarket_NewAlarm.XML", "Panel_ItemMarket_NewAlarm", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/ItemMarket/Panel_Window_ItemMarket_RClickMenu.XML", "Panel_Window_ItemMarket_RClickMenu", UIGroup.PAGameUIGroup_GameMenu, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/RandomBoxSelect/Panel_RandomBoxSelect.XML", "Panel_RandomBoxSelect", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Widget/Gacha_Roulette/Panel_Gacha_Roulette.XML", "Panel_Gacha_Roulette", UIGroup.PAGameUIGroup_Chatting)
  basicLoadUI("UI_Data/Widget/PowerGauge/Panel_PowerGauge.XML", "Panel_PowerGauge", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/PcRoomNotify/Panel_PcRoomNotify.XML", "Panel_PcRoomNotify", UIGroup.PAGameUIGroup_WorldMap_Contents)
  basicLoadUI("UI_Data/Window/EventNotify/Panel_EventNotify.XML", "Panel_EventNotify", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/EventNotify/Panel_EventNotifyContent.XML", "Panel_EventNotifyContent", UIGroup.PAGameUIGroup_Window_Progress)
  basicLoadUI("UI_Data/Window/Event/Panel_Event_100Day.XML", "Panel_Event_100Day", UIGroup.PAGameUIGroup_ModalDialog)
  preloadCustomizationUI()
  basicLoadUI("UI_Data/Window/ChallengePresent/Panel_ChallengePresent.XML", "Panel_ChallengePresent", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/CarveSeal/Panel_CarveSeal.XML", "Panel_CarveSeal", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/CarveSeal/Panel_ResetSeal.XML", "Panel_ResetSeal", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/ClearVested/Panel_ClearVested.XML", "Panel_ClearVested", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/UI_Setting/Panel_UI_Setting.XML", "Panel_UI_Setting", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_UISetting
  }))
  loadUI("UI_Data/Window/UI_Setting/Panel_SaveFreeSet.XML", "Panel_SaveFreeSet", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_UISetting
  }))
  loadUI("UI_Data/Window/WorkerManager/UI_WorkerManager.XML", "Panel_WorkerManager", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/WorkerManager/UI_WorkerRestoreAll.XML", "Panel_WorkerRestoreAll", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/WorkerManager/UI_WorkerChangeSkill.XML", "Panel_WorkerChangeSkill", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/Auction/Panel_Worker_Auction.XML", "Panel_Worker_Auction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Auction/Panel_WorkerList_Auction.XML", "Panel_WorkerList_Auction", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Window/Auction/Panel_WorkerResist_Auction.XML", "Panel_WorkerResist_Auction", UIGroup.PAGameUIGroup_Window_Progress, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/TransferLifeExperience/Panel_TransferLifeExperience.XML", "Panel_TransferLifeExperience", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/ChangeItem/Panel_ChangeItem.XML", "Panel_ChangeItem", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/ChangeItem/Panel_ChangeWeapon.XML", "Panel_ChangeWeapon", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Party/Panel_MatchResult.XML", "Panel_MatchResult", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_RaceTimeAttack.XML", "Panel_RaceTimeAttack", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/MainStatus/Panel_RaceFinishTime.XML", "Panel_RaceFinishTime", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/Party/Panel_RaceResult.XML", "Panel_RaceResult", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Alchemy/Panel_AlchemyStone.XML", "Panel_AlchemyStone", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Alchemy/Panel_AlchemyFigureHead.XML", "Panel_AlchemyFigureHead", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/RallyRanking/Panel_RallyRanking.XML", "Panel_RallyRanking", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/LocalWar/Panel_LocalWar.XML", "Panel_LocalWar", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Widget/LocalWar/Panel_LocalWarTeam.XML", "Panel_LocalWarTeam", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Join/Panel_Window_Join.XML", "Panel_Join", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/WarInfoMessage/Panel_TerritoryWar_Caution.XML", "Panel_TerritoryWar_Caution", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/ItemWarp/Panel_ItemWarp.XML", "Panel_ItemWarp", UIGroup.PAGameUIGroup_WorldMap_Contents)
  loadUI("UI_Data/Window/WorkerTrade/Panel_WorkerTrade_Main.XML", "Panel_WorkerTrade", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/WorkerTrade/Panel_WorkerTrade_Office.XML", "Panel_WorkerTrade_Office", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/WorkerTrade/Panel_WorkerTrade_Caravan.XML", "Panel_WorkerTrade_Caravan", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/WorkerTrade/Panel_WorkerTrade_HireOffice.XML", "Panel_WorkerTrade_HireOffice", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  loadUI("UI_Data/Window/WorkerTrade/Panel_WorkerTrade_DropItem.XML", "Panel_WorkerTrade_DropItem", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Window/GoldenTreasureBox/Panel_TreasureBox.XML", "Panel_GoldenTreasureBox", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/ScreenShot_WebAlbum/Panel_ScreenShot_WebAlbum.XML", "Panel_ScreenShotAlbum", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/ScreenShot_WebAlbum/Panel_ScreenShotAlbum_FullScreen.XML", "Panel_ScreenShotAlbum_FullScreen", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Broadcast/Panel_Broadcast.xml", "Panel_Broadcast", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/CashShopAlert/UI_Widget_CashShopAlert.xml", "Panel_CashShopAlert", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/NakMessage/NakMessageByActionChart.xml", "Panel_ActionMessage", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Tutorial/Panel_RescueShip.xml", "Panel_RescueShip", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Tutorial/Panel_SummonGamos.xml", "Panel_SummonGamos", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Widget/Tutorial/Panel_TamingBubble.xml", "Panel_TamingBubble", UIGroup.PAGameUIGroup_Interaction)
  basicLoadUI("UI_Data/Window/SeasonTexture/Panel_SeasonTexture.xml", "Panel_SeasonTexture", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/BossWave/Panel_Widget_BossWave.xml", "Panel_BossWave", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/Party/Panel_PartyList.xml", "Panel_PartyList", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Party/Panel_PartyRecruite.xml", "Panel_PartyRecruite", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Servant/Panel_ServantResurrection.xml", "Panel_ServantResurrection", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Widget/TimeAttack/Panel_TimeAttack.xml", "Panel_TimeAttack", UIGroup.PAGameUIGroup_Widget)
  basicLoadUI("UI_Data/Window/MonsterRanking/Panel_MonsterRanking.xml", "Panel_Window_MonsterRanking", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/BuildingBuff/Panel_Window_BuildingBuff.xml", "Panel_Window_BuildingBuff", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/BlackSpiritAdventure/Panel_Window_BlackSpiritAdventure2.xml", "Panel_Window_BlackSpiritAdventure_2", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Widget/RemoteControl/Panel_RemoteControl_Main.XML", "Panel_RemoteControl", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/RemoteControl/Panel_RemoteControl_Inventory.XML", "Panel_RemoteInventory", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/RemoteControl/Panel_RemoteControl_Equipment.XML", "Panel_RemoteEquipment", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/RemoteControl/Panel_RemoteControl_Warehouse.XML", "Panel_RemoteWarehouse", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  loadUI("UI_Data/Widget/RemoteControl/Panel_RemoteControl_Manufacture.XML", "Panel_RemoteManufacture", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  if true == isGameServiceTypeTurkey() then
    basicLoadUI("UI_Data/Window/TurkeyIME/Panel_TurkeyIME.XML", "Panel_TurkeyIME", UIGroup.PAGameUIGroup_Windows)
  end
  if true == _ContentsGroup_isMemoOpen then
    basicLoadUI("UI_Data/Window/Memo/Panel_Memo_Sticky.xml", "Panel_Memo_Sticky", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/Memo/Panel_Memo_Main.xml", "Panel_Memo_List", UIGroup.PAGameUIGroup_Windows)
  end
  loadUI("UI_Data/Window/ButtonShortcuts/Panel_ButtonShortcuts.xml", "Panel_ButtonShortcuts", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default
  }))
  loadUI("UI_Data/Window/TranslationReport/Panel_Window_TranslationReport.XML", "Panel_TranslationReport", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Knowledge,
    RenderMode.eRenderMode_Dialog
  }))
  basicLoadUI("UI_Data/Window/TranslationReport/Panel_Window_TranslationText.XML", "Panel_Window_TranslationText", UIGroup.PAGameUIGroup_Windows)
  basicLoadUI("UI_Data/Window/Under18/Panel_Message_Under18.xml", "Panel_Message_Under18", UIGroup.PAGameUIGroup_FadeScreen)
  if isActionModeActive then
    basicLoadUI("UI_Data/Widget/Z_AlertArea/UI_Widget_AlertArea.xml", "Panel_AlertArea", UIGroup.PAGameUIGroup_Widget)
    basicLoadUI("UI_Data/Widget/Z_RightTopIcons/UI_Widget_Function.xml", "Panel_FunctionButton_Area", UIGroup.PAGameUIGroup_Widget)
  end
  if true == _ContentsGroup_isConsoleTest then
    loadUI("UI_Data/Widget/Menu/Console/Panel_QuickMenu.xml", "Panel_QuickMenu", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_WorldMap
    }))
    basicLoadUI("UI_Data/Widget/Menu/Console/Panel_QuickMenuCustom_Edit.xml", "Panel_QuickMenuCustom", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Widget/Menu/Console/Panel_QuickMenuCustom_RightRing.xml", "Panel_QuickMenuCustom_RightRing", UIGroup.PAGameUIGroup_Window_Progress)
    basicLoadUI("UI_Data/Widget/Menu/Console/Panel_Widget_QuickMenu.xml", "Panel_Widget_QuickMenu", UIGroup.PAGameUIGroup_Windows)
  end
  loadUI("UI_Data/Widget/Dialogue/Panel_NpcGift.xml", "Panel_NpcGift", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  if true == _ContentsGroup_RenewUI_Gift then
    loadUI("UI_Data/Widget/Dialogue/Console/Panel_Dialog_NpcGift_Renew.xml", "Panel_Dialog_NpcGift_Renew", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
      RenderMode.eRenderMode_Default,
      RenderMode.eRenderMode_Dialog
    }))
  end
  basicLoadUI("UI_Data/Widget/KeyGuide/Panel_ConsoleKeyGuide.xml", "Panel_ConsoleKeyGuide", UIGroup.PAGameUIGroup_Widget)
  loadUI("UI_Data/Widget/KeyGuide/Panel_WorldmapKeyGuide.xml", "Panel_WorldmapKeyGuide", UIGroup.PAGameUIGroup_WorldMap_Popups, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_WorldMap
  }))
  basicLoadUI("UI_Data/Window/BlackDesertLab/Panel_Window_BlackDesertLab.xml", "Panel_Window_BlackDesertLab", UIGroup.PAGameUIGroup_Windows)
  loadUI("UI_Data/Window/MacroCheckQuiz/Panel_Window_MacroCheckQuiz.XML", "Panel_Window_MacroCheckQuiz", UIGroup.PAGameUIGroup_FadeScreen, RenderModeAllModeOpen)
  loadUI("UI_Data/Window/MacroCheckQuiz/Panel_Window_MacroCheckQuizKeyPad.XML", "Panel_Window_MacroCheckQuizKeyPad", UIGroup.PAGameUIGroup_FadeScreen, RenderModeAllModeOpen)
  if true == _ContentsGroup_Politics then
    basicLoadUI("UI_Data/Window/Politics/Panel_Window_Politics.xml", "Panel_Window_Politics", UIGroup.PAGameUIGroup_Windows)
  end
  loadUI("UI_Data/Window/Purification/Panel_Purification.XML", "Panel_Purification", UIGroup.PAGameUIGroup_Windows, PAUIRenderModeBitSet({
    RenderMode.eRenderMode_Default,
    RenderMode.eRenderMode_Dialog
  }))
  if _ContentsGroup_RenewUI then
    basicLoadUI("UI_Data/Widget/Menu/Console/Panel_Menu_Renew.xml", "Panel_Window_Menu_Renew", UIGroup.PAGameUIGroup_Windows)
  end
end
function loadOceanUI()
  basicLoadUI("UI_Data/Window/Cutscene/Panel_CutsceneMovie.XML", "Panel_Cutscene", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Acquire/Acquire.XML", "Panel_Acquire", UIGroup.PAGameUIGroup_MainUI)
  basicLoadUI("UI_Data/Widget/Acquire/Acquire_QuestDirect.XML", "Panel_QuestDirect", UIGroup.PAGameUIGroup_ModalDialog)
  runLua("UI_Data/Script/Widget/Acquire/Acquire.lua")
  runLua("UI_Data/Script/CutScene_Ocean.lua")
  runLua("UI_Data/Script/Widget/Acquire/Acquire_QuestDirect.lua")
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
    basicLoadUI("UI_Data/Window/c_Option/Option_Sound_OnOff.XML", "Panel_Sound_OnOff", UIGroup.PAGameUIGroup_Windows)
    basicLoadUI("UI_Data/Window/c_Option/Option_Sound_Volume.XML", "Panel_Sound_Volume", UIGroup.PAGameUIGroup_Windows)
  else
  end
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Skill.XML", "Panel_Tooltip_Skill", UIGroup.PAGameUIGroup_GameMenu)
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_Skill_forLearning.XML", "Panel_Tooltip_Skill_forLearning", UIGroup.PAGameUIGroup_GameMenu)
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
  basicLoadUI("UI_Data/Widget/Tooltip/UI_Tooltip_SimpleText.XML", "Panel_Tooltip_SimpleText", UIGroup.PAGameUIGroup_ModalDialog)
end
function loadGameOptionUI()
  if true == _ContentsGroup_isNewOption then
    runLua("UI_Data/Script/Window/Option/GameOptionHeader.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionMain.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionUtil.lua")
    runLua("UI_Data/Script/Window/Option/Panel_Option_Main.lua")
    PaGlobal_Option:Init()
    ToClient_initGameOption()
  else
  end
  if true == isUseNewGlobalKeyBinder_chk() then
    runLua("UI_Data/Script/GlobalKeyBinder/globalKeyBinderManager.lua")
    runLua("UI_Data/Script/GlobalKeyBinder/globalKeyBinder.lua")
  else
  end
  runLua("UI_Data/Script/Tutorial/Panel_WebControl.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Skill.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Item.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Guild_Introduce.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Common.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_SimpleText.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_New_Worker.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_New_Work.lua")
end
function loadGameUI()
  runLua("UI_Data/Script/Common/Common_ConsoleConfig.lua")
  runLua("UI_Data/Script/Panel_Ime.lua")
  runLua("UI_Data/Script/Tutorial/Panel_WebControl.lua")
  runLua("UI_Data/Script/DragManager.lua")
  runLua("UI_Data/Script/Fullsizemode.lua")
  runLua("UI_Data/Script/globalPreLoadUI.lua")
  runLua("UI_Data/Script/global_fromActionChart_LuaEvent.lua")
  if _ContentsGroup_RenewUI_MiniGame then
    runLua("UI_Data/Script/Widget/GlobalManual/Console/Panel_Global_Manual_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/GlobalManual/Panel_Global_Manual.lua")
  end
  runLua("UI_Data/Script/Widget/Fishing/Panel_Fishing.lua")
  runLua("UI_Data/Script/Window/ButtonShortcuts/Panel_ButtonShortcuts.lua")
  runLua("UI_Data/Script/Window/FirstLogin/Panel_FirstLogin.lua")
  runLua("UI_Data/Script/NpcWorker/workerLuaWrapper.lua")
  runLua("UI_Data/Script/Widget/Rader/Radar_GlobalValue.lua")
  runLua("UI_Data/Script/Window/GuildWarInfo/GuildWarInfo.lua")
  runLua("UI_Data/Script/Window/GuildWarInfo/GuildWarScore.lua")
  runLua("UI_Data/Script/Window/HorseBattle/Panel_HorseBattleList.lua")
  runLua("UI_Data/Script/Window/OneOnOne/Panel_Guild_OneOnOne_Control.lua")
  runLua("UI_Data/Script/Window/OneOnOne/Panel_Guild_OneOnOneClock.lua")
  runLua("UI_Data/Script/Window/OneOnOne/Panel_Guild_OneOnOneAlert.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Window_GuildBattle.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_GuildBattle_Control.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_GuildBattle_JoinMember.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_GuildBattle_Point.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_GuildBattle_SelectAttend.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_GuildBattle_SelectEntry.lua")
  runLua("UI_Data/Script/Window/Guild/PersonalBattle/Panel_Window_PersonalBattle.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_House_Auction.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_GuildHouse_Auction.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_TerritoryAuthority_Auction.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_Worker_Auction.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_WorkerList_Auction.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_WorkerResist_Auction.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_Villa_Auction.lua")
  runLua("UI_Data/Script/Window/Auction/Panel_Masterpiece_Auction.lua")
  runLua("UI_Data/Script/Window/ChangeNickName/Panel_Change_Nickname.lua")
  runLua("UI_Data/Script/Common/Common_UIMode.lua")
  runLua("UI_Data/Script/Common/Common_BlackSpirit.lua")
  runLua("UI_Data/Script/Widget/MainStatus/Panel_LocalwarByBalanceServer.lua")
  runLua("UI_Data/Script/Common/Common_Web.lua")
  runLua("UI_Data/Script/Window/LordMenu/Panel_LordMenu.lua")
  runLua("UI_Data/Script/Window/LordMenu/TerritoryTex_Message.lua")
  runLua("UI_Data/Script/Window/NodeWarMenu/Panel_NodeWarMenu.lua")
  runLua("UI_Data/Script/Widget/FieldViewMode/FieldViewMode.lua")
  if true == _ContentsGroup_RenewUI_Chatting then
    runLua("UI_Data/Script/Widget/Chatting/Console/Panel_Widget_Chatting_Renew.lua")
    runLua("UI_Data/Script/Widget/Chatting/Console/Panel_Widget_ChattingHistory_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/Chatting/Panel_ChatNew.lua")
    runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Input.lua")
  end
  runLua("UI_Data/Script/Widget/Chatting/Panel_ChatOption.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Filter.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Macro.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_SocialAction.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_ChatNew_ReportGoldSeller.lua")
  runLua("UI_Data/Script/Widget/Chatting/Panel_Chatting_Color.lua")
  runLua("UI_Data/Script/Widget/Chatting/CreateChattingContent.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Skill.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Item.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Guild_Introduce.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_Common.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_SimpleText.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_New_Worker.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_New_Work.lua")
  runLua("UI_Data/Script/Widget/Introduction/Panel_Introduction.lua")
  runLua("UI_Data/Script/Widget/Menu/Panel_Menu.lua")
  runLua("UI_Data/Script/Widget/Menu/Panel_Menu_New.lua")
  runLua("UI_Data/Script/Widget/SkillLog/Widget_SkillLog.lua")
  runLua("UI_Data/Script/Widget/NakMessage/NakMessage.lua")
  runLua("UI_Data/Script/Widget/NakMessage/RewardSelect_NakMessage.lua")
  runLua("UI_Data/Script/Widget/Stamina/Stamina.lua")
  runLua("UI_Data/Script/Widget/Acquire/Acquire.lua")
  runLua("UI_Data/Script/Widget/Acquire/Acquire_QuestDirect.lua")
  runLua("UI_Data/Script/Widget/Region/Region.lua")
  if true == _ContentsGroup_RenewUI_SpiritEnchant then
    runLua("UI_Data/Script/Window/Enchant/Console/Panel_Window_Enchant_Renew.lua")
    runLua("UI_Data/Script/Window/Enchant/Console/Panel_Window_Improvement_Renew.lua")
    runLua("UI_Data/Script/Window/Enchant/Console/Panel_Window_Socket_Renew.lua")
  else
    if _ContentsGroup_isUsedNewEnchant == true then
      runLua("UI_Data/Script/Window/Enchant/SpiritEnchant_Main_New.lua")
      runLua("UI_Data/Script/Window/Enchant/SpiritEnchant_Control_New.lua")
    else
      runLua("UI_Data/Script/Window/Enchant/SpiritEnchant_Main.lua")
      runLua("UI_Data/Script/Window/Enchant/SpiritEnchant_Control.lua")
    end
    runLua("UI_Data/Script/Window/Socket/Socket.lua")
  end
  runLua("UI_Data/Script/Window/Enchant/SpiritEnchant_Animation.lua")
  runLua("UI_Data/Script/Window/Enchant/Panel_Improvement.lua")
  runLua("UI_Data/Script/Window/Enchant/Panel_BonusEnchant.lua")
  runLua("UI_Data/Script/Window/DeadMessage/DeadMessage.lua")
  runLua("UI_Data/Script/Window/Looting/Panel_Looting.lua")
  if _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Window_CharacterInfo_Renew.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Window_CharacterInfo_Title_Renew.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Window_CharacterInfo_History_Renew.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Window_CharacterInfo_Challenge_Renew.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Window_CharacterInfo_Profile_Renew.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Window_CharacterInfo_LifeInfo_Renew.lua")
  elseif _ContentsGroup_isUsedNewCharacterInfo == false then
    runLua("UI_Data/Script/Widget/PotencialUp/Panel_Potencial_Up.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/UI_CharacterInfo_Title.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/UI_CharacterInfo_History.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Challenge.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/Panel_Profile.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/UI_Lua_SelfCharacterInfo.lua")
  else
    runLua("UI_Data/Script/Widget/PotencialUp/Panel_Potencial_Up_New.lua")
    runLua("UI_Data/Script/Window/CharacterInfo/UI_CharacterInfo.lua")
  end
  runLua("UI_Data/Script/Widget/CraftLevInfo/UI_Lua_CraftLevInfo.lua")
  runLua("UI_Data/Script/Widget/PotenGradeInfo/UI_Lua_PotenGradeInfo.lua")
  if true == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Window/Inventory/Console/Panel_Window_Inventory_Renew.lua")
    runLua("UI_Data/Script/Window/Inventory/Console/Panel_Window_InventoryPopup.lua")
  else
    runLua("UI_Data/Script/Window/Equipment/Panel_Window_Equiment.lua")
    runLua("UI_Data/Script/Window/Inventory/Panel_Window_Inventory.lua")
  end
  runLua("UI_Data/Script/Window/Inventory/Panel_Window_PartyInventory.lua")
  runLua("UI_Data/Script/Window/Inventory/Panel_Window_ClothInventory.lua")
  runLua("UI_Data/Script/Window/Dance/Panel_Window_Dance.lua")
  runLua("UI_Data/Script/Window/Dance/Panel_DanceEdit.lua")
  runLua("UI_Data/Script/Window/Dance/Panel_DanceAction.lua")
  runLua("UI_Data/Script/Window/Dance/DanceUI.lua")
  runLua("UI_Data/Script/Widget/Dance/Panel_DanceFrame.lua")
  runLua("UI_Data/Script/Widget/Popup/Panel_Popup_MoveItem.lua")
  runLua("UI_Data/Script/Window/Equipment/Panel_Equiment_SetEffectTooltip.lua")
  runLua("UI_Data/Script/Widget/ToolTip/Panel_Tooltip_BattlePoint.lua")
  runLua("UI_Data/Script/Window/MessageBox/Panel_UseItem.lua")
  runLua("UI_Data/Script/Window/ExtendExpiration/Panel_ExtendExpiration.lua")
  runLua("UI_Data/Script/Widget/UIcontrolBar/Panel_WhereUseItemDirection.lua")
  if _ContentsGroup_isNewLifeRanking then
    runLua("UI_Data/Script/Window/LifeRanking/Panel_LifeRanking_Renewal.lua")
  else
    runLua("UI_Data/Script/Window/LifeRanking/Panel_LifeRanking.lua")
  end
  runLua("UI_Data/Script/Window/LocalWar/Panel_LocalWarInfo.lua")
  runLua("UI_Data/Script/Window/CompetitionGame/Panel_CompetitionGame.lua")
  runLua("UI_Data/Script/Window/CompetitionGame/Panel_CompetitionGame_JoinDesc.lua")
  runLua("UI_Data/Script/Window/CompetitionGame/Panel_CompetitionGame_GuildReservation.lua")
  runLua("UI_Data/Script/Window/CompetitionGame/Panel_CompetitionGameTeamUi.lua")
  runLua("UI_Data/Script/Window/Arsha/Panel_Arsha.lua")
  runLua("UI_Data/Script/Window/Arsha/Panel_Arsha_TeamChangeControl.lua")
  runLua("UI_Data/Script/Window/Arsha/Panel_Arsha_InviteList.lua")
  runLua("UI_Data/Script/Window/Arsha/Panel_Arsha_SelectMember.lua")
  runLua("UI_Data/Script/Window/Arsha/Panel_Arsha_TeamWidget.lua")
  runLua("UI_Data/Script/Window/Arsha/Panel_Arsha_TeamNameChange.lua")
  runLua("UI_Data/Script/Window/Mercenary/Panel_Mercenary.lua")
  runLua("UI_Data/Script/Window/Mercenary/Panel_MercenaryGuide.lua")
  runLua("UI_Data/Script/Window/Mercenary/Panel_MercenaryMember.lua")
  runLua("UI_Data/Script/Window/SavageDefence/SavageDefenceInfo.lua")
  runLua("UI_Data/Script/Window/SavageDefence/SavageDefenceShop.lua")
  runLua("UI_Data/Script/Window/SavageDefence/SavageDefenceMember.lua")
  runLua("UI_Data/Script/Window/SavageDefence/SavageDefenceTowerHp.lua")
  runLua("UI_Data/Script/Window/SavageDefence/SavageDefenceWave.lua")
  runLua("UI_Data/Script/Window/SavageDefence/SavageDefenceGame.lua")
  runLua("UI_Data/Script/Window/SavageDefence/SavageDefenceResult.lua")
  runLua("UI_Data/Script/Window/Recommand/Panel_RecommandName.lua")
  runLua("UI_Data/Script/Window/Steam/Panel_Window_Steam.lua")
  runLua("UI_Data/Script/Window/DailyStamp/Panel_Window_DailyStamp.lua")
  runLua("UI_Data/Script/Window/BlackSpiritAdventure/Panel_BlackSpiritAdventure.lua")
  runLua("UI_Data/Script/Window/BlackSpiritAdventure/Panel_BlackSpiritAdventure_VerPcroom.lua")
  runLua("UI_Data/Script/Window/Copyright/Panel_Copyright.lua")
  runLua("UI_Data/Script/Window/Policy/Panel_Window_Policy.lua")
  runLua("UI_Data/Script/Window/Twitch/Panel_Twitch.lua")
  runLua("UI_Data/Script/Window/SaveSetting/Panel_SaveSetting.lua")
  runLua("UI_Data/Script/Window/Skill/Panel_Window_Skill_Awaken.lua")
  if true == _ContentsGroup_RenewUI_Skill then
    runLua("UI_Data/Script/Window/Skill/Console/Panel_Window_Skill_Renew.lua")
  else
    runLua("UI_Data/Script/Window/Skill/Panel_Window_Skill_Global.lua")
    runLua("UI_Data/Script/Window/Skill/Panel_Window_Skill_Event.lua")
    runLua("UI_Data/Script/Window/Skill/Panel_Window_Skill_Combination.lua")
    runLua("UI_Data/Script/Window/Skill/Panel_Window_Skill_Animation.lua")
    runLua("UI_Data/Script/Window/Skill/Panel_EnableSkill.lua")
  end
  runLua("UI_Data/Script/Window/SkillAwaken/Panel_Window_SkillAwaken.lua")
  runLua("UI_Data/Script/Window/Skill/Panel_Window_SkillGuide.lua")
  runLua("UI_Data/Script/Window/Skill/Panel_Window_Skill_CoolTimeSlot.lua")
  if true == _ContentsGroup_RenewUI_ReinforceSkill then
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_SkillSpecialize_Renew.lua")
  else
    runLua("UI_Data/Script/Window/Skill/Panel_Window_ReinforceSkill.lua")
    runLua("UI_Data/Script/Window/Skill/Panel_Window_Skill_Reinforce.lua")
  end
  runLua("UI_Data/Script/Window/WareHouse/Panel_Window_Warehouse.lua")
  runLua("UI_Data/Script/Window/WareHouse/Panel_Window_SearchMenuWarehouse.lua")
  if false == _ContentsGroup_RenewUI_Stable then
    runLua("UI_Data/Script/Window/Servant/ServantCommon.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableFunction.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableRegister.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableInfo.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableList.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableEquipInfo.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableShop.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableMating.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableMarket.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableMix.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableAddCarriage.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableStallion.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableStallion_ItemNotify.lua")
    runLua("UI_Data/Script/Window/Servant/Stable/Panel_Window_StableStallion_Effect.lua")
  else
    runLua("UI_Data/Script/Window/Servant/Console/Servant_Common_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableFunction_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableList_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableInfo_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableInfoMenu_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableRegister_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableMarket_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableMating_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableChangeSkill_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableExchange_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableRegister_Market_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableRegister_MarketCheck_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableRegister_MarketCheck_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableRegister_Name_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Stable/Panel_Window_StableMarket_Filter_Renew.lua")
  end
  if false == _ContentsGroup_RenewUI_Stable then
    runLua("UI_Data/Script/Window/Servant/GuildStable/Panel_Window_GuildStableFunction.lua")
    runLua("UI_Data/Script/Window/Servant/GuildStable/Panel_Window_GuildStableInfo.lua")
    runLua("UI_Data/Script/Window/Servant/GuildStable/Panel_Window_GuildStableList.lua")
    runLua("UI_Data/Script/Window/Servant/GuildStable/Panel_Window_GuildStableRegister.lua")
  else
  end
  if false == _ContentsGroup_RenewUI_Stable then
    runLua("UI_Data/Script/Window/Servant/Wharf/Panel_Window_WharfFunction.lua")
    runLua("UI_Data/Script/Window/Servant/Wharf/Panel_Window_WharfRegister.lua")
    runLua("UI_Data/Script/Window/Servant/Wharf/Panel_Window_WharfList.lua")
    runLua("UI_Data/Script/Window/Servant/Wharf/Panel_Window_WharfInfo.lua")
  else
    runLua("UI_Data/Script/Window/Servant/Console/Wharf/Panel_Window_WharfFunction_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Wharf/Panel_Window_WharfList_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Wharf/Panel_Window_WharfInfo_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Wharf/Panel_Window_WharfInfoMenu_Renew.lua")
    runLua("UI_Data/Script/Window/Servant/Console/Wharf/Panel_Window_WharfRegister_Renew.lua")
  end
  if false == _ContentsGroup_RenewUI_Stable then
    runLua("UI_Data/Script/Window/Servant/GuildWharf/Panel_Window_GuildWharfFunction.lua")
    runLua("UI_Data/Script/Window/Servant/GuildWharf/Panel_Window_GuildWharfRegister.lua")
    runLua("UI_Data/Script/Window/Servant/GuildWharf/Panel_Window_GuildWharfList.lua")
    runLua("UI_Data/Script/Window/Servant/GuildWharf/Panel_Window_GuildWharfInfo.lua")
  else
  end
  runLua("UI_Data/Script/Window/Servant/Panel_Window_Servant.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Window_ServantInfo.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Window_ServantInfo_Carriage.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Window_ServantInfo_Ship.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Window_ServantInfo_WorkerShip.lua")
  runLua("UI_Data/Script/Window/Servant/HorseMp.lua")
  runLua("UI_Data/Script/Window/Servant/HorseHp.lua")
  runLua("UI_Data/Script/Window/Inventory/Panel_Window_ServantInventory.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Window_GuildServantList.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Window_GuildServant_RevivalList.lua")
  runLua("UI_Data/Script/Widget/AutoQuest/Panel_Icon_Auto.lua")
  runLua("UI_Data/Script/Window/HouseInfo/Panel_MyHouseNavi.lua")
  runLua("UI_Data/Script/Widget/Housing/Panel_HousingList.lua")
  runLua("UI_Data/Script/Widget/Housing/Panel_HarvestList.lua")
  runLua("UI_Data/Script/Widget/Maid/Panel_Icon_Maid.lua")
  runLua("UI_Data/Script/Window/CharacterTag/Panel_Window_CharacterTag.lua")
  runLua("UI_Data/Script/Window/CharacterTag/Panel_Icon_CharacterTag.lua")
  runLua("UI_Data/Script/Widget/Camp/Panel_Window_Camp.lua")
  runLua("UI_Data/Script/Widget/Camp/Panel_Window_CampRegister.lua")
  runLua("UI_Data/Script/Widget/PvP/PvP_Battle.lua")
  if true == _ContentsGroup_RenewUI_Pet then
    runLua("UI_Data/Script/Window/PetInfo/Console/Panel_Window_PetList_Renew.lua")
    runLua("UI_Data/Script/Window/PetInfo/Console/Panel_Window_PetInfo_Renew.lua")
    runLua("UI_Data/Script/Window/PetInfo/Console/Panel_Window_PetFood_Renew.lua")
    runLua("UI_Data/Script/Window/PetInfo/Console/Panel_Window_PetRegister_Renew.lua")
    runLua("UI_Data/Script/Window/PetInfo/Console/Panel_Window_PetCommand_Renew.lua")
    runLua("UI_Data/Script/Window/PetInfo/Console/Panel_Window_PetExchange_Renew.lua")
  else
    runLua("UI_Data/Script/Window/PetInfo/Panel_Window_PetRegister.lua")
    runLua("UI_Data/Script/Window/PetInfo/Panel_Window_PetInfo.lua")
    runLua("UI_Data/Script/Window/PetInfo/Panel_Window_PetControl.lua")
    runLua("UI_Data/Script/Window/PetInfo/Panel_Window_PetList.lua")
    runLua("UI_Data/Script/Window/PetInfo/Panel_Window_PetLookChange.lua")
    runLua("UI_Data/Script/Window/PetInfo/Panel_Window_PetMarket.lua")
    runLua("UI_Data/Script/Window/PetInfo/Panel_Window_PetMarketRegist.lua")
  end
  if true == _ContentsGroup_isFairy then
    runLua("UI_Data/Script/Window/FairyInfo/Panel_Window_FairyRegister.lua")
    runLua("UI_Data/Script/Window/FairyInfo/Panel_Window_FairySetting_ReNew.lua")
    runLua("UI_Data/Script/Window/FairyInfo/Panel_Window_FairyUpgrade.lua")
    if _ContentsGroup_FairyTierUpgradeAndRebirth then
      runLua("UI_Data/Script/Window/FairyInfo/Panel_Window_FairyTierUpgrade.lua")
    end
    runLua("UI_Data/Script/Window/FairyInfo/Panel_Fairyinfo.lua")
    runLua("UI_Data/Script/Window/FairyInfo/Panel_Window_FairyChoiseTheReset.lua")
  end
  runLua("UI_Data/Script/Window/FairyInfo/Panel_Window_FairyIcon.lua")
  runLua("UI_Data/Script/Widget/MessageHistory/Panel_MessageHistory.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Cannon.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_CannonShip.lua")
  runLua("UI_Data/Script/Widget/QuestList/Panel_NewQuest.lua")
  runLua("UI_Data/Script/Widget/UIControlBar/Panel_UIControl.lua")
  runLua("UI_Data/Script/Widget/UIControlBar/Panel_UIMain.lua")
  runLua("UI_Data/Script/Widget/QuickSlot/Panel_QuickSlot.lua")
  runLua("UI_Data/Script/Widget/QuickSlot/Panel_NewQuickSlot.lua")
  runLua("UI_Data/Script/Widget/QuickSlot/Panel_SkillCooltime.lua")
  runLua("UI_Data/Script/Widget/QuickSlot/Panel_SkillcoolTimeQuickSlot.lua")
  if isActionModeActive then
    runLua("UI_Data/Script/Widget/Z_MainStatus/Panel_MainStatus_User_Bar.lua")
    runLua("UI_Data/Script/Widget/Z_MainStatus/Panel_SelfPlayerExpGage.lua")
    runLua("UI_Data/Script/Widget/Z_MainStatus/PvpMode_Button.lua")
  elseif true == _ContentsGroup_RenewUI_Main then
    runLua("UI_Data/Script/Widget/MainStatus/Console/Panel_Widget_MainStatus_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/MainStatus/Panel_MainStatus_User_Bar.lua")
    runLua("UI_Data/Script/Widget/MainStatus/Panel_SelfPlayerExpGage.lua")
    runLua("UI_Data/Script/Widget/MainStatus/PvpMode_Button.lua")
  end
  if false == _ContentsGroup_RenewUI_Main then
    runLua("UI_Data/Script/Widget/MainStatus/Panel_ClassResource.lua")
    runLua("UI_Data/Script/Widget/MainStatus/Panel_Adrenallin.lua")
  end
  runLua("UI_Data/Script/Widget/MainStatus/SelfPlayer_HpCheck.lua")
  runLua("UI_Data/Script/Widget/MainStatus/Panel_GuardGauge.lua")
  if not isActionModeActive then
    runLua("UI_Data/Script/Widget/MainStatus/Panel_PersonalIcon_Left.lua")
  end
  if true == _ContentsGroup_RenewUI_VoiceChat then
    runLua("UI_Data/Script/Window/voiceChat/Console/Panel_Window_VoiceChat_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_SetVoiceChat.lua")
  end
  if not isActionModeActive then
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_NpcNavigation.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_MovieGuide.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_VoiceChatStatus.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_Hunting.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_SiegeArea.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_AutoTraining2.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_AutoTraining_Alarm.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_BusterCall.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_WarCall.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_ReturnStone.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_SummonElephant.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_SummonParty.lua")
    runLua("UI_Data/Script/Widget/RightTopIcons/Panel_PersonalIcon_DropItem.lua")
    runLua("UI_Data/Script/Window/DropItem/Panel_Window_DropItem.lua")
  end
  runLua("UI_Data/Script/Widget/ImportantKnowledge/Panel_ImportantKnowledge.lua")
  runLua("UI_Data/Script/Widget/NewEquip/Panel_NewEquip.lua")
  runLua("UI_Data/Script/Widget/NoticeAlert/NoticeAlert.lua")
  runLua("UI_Data/Script/Widget/Damage/UI_Lua_Damage.lua")
  runLua("UI_Data/Script/Widget/CharacterNameTag/Panel_CharacterNameTag.lua")
  runLua("UI_Data/Script/Widget/CharacterNameTag/Panel_BubbleBox.lua")
  runLua("UI_Data/Script/Widget/CharacterNameTag/Panel_WaitComment.lua")
  runLua("UI_Data/Script/Widget/CharacterNameTag/Panel_Navigation.lua")
  runLua("UI_Data/Script/Widget/HumanRelations/HumanRelations.lua")
  if false == _ContentsGroup_RenewUI_Number then
    runLua("UI_Data/Script/Window/Keypad/Panel_Window_Number.lua")
  else
    runLua("UI_Data/Script/Window/Keypad/Panel_Window_Number_Renew.lua")
  end
  runLua("UI_Data/Script/Window/BuyDrink/Panel_BuyDrink.lua")
  if true == _ContentsGroup_RenewUI_Dailog then
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Main_Renew.lua")
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Main_Right_Renew.lua")
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Main_Bottom_Renew.lua")
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Main_Intimacy_Renew.lua")
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Main_Quest_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Main.lua")
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Exchange_Item.lua")
  end
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Reward.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Itemtake.lua")
  if true == _ContentsGroup_RenewUI_NpcShop then
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_NPCShop_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Window_NpcShop.lua")
  end
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_Scene.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_DetectPlayer.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_ButtonType.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_Dialog_InterestKnowledge.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_KnowledgeManagement.lua")
  runLua("UI_Data/Script/Window/Worldmap/WorkerRandomSelect/UI_New_WorkerRandomSelect.lua")
  runLua("UI_Data/Script/Window/Worldmap/UnKnowItemSelect/UI_New_UnKnowItemSelect.lua")
  runLua("UI_Data/Script/Widget/HelpMessage/Panel_HelpMessage.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_MentalKnowledge_Base.lua")
  if true == _ContentsGroup_RenewUI_MentalGame then
    runLua("UI_Data/Script/Widget/Dialogue/Panel_Window_MentalGame_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/Dialogue/Panel_MentalGame.lua")
  end
  if false == _ContentsGroup_RenewUI_Knowledge then
    runLua("UI_Data/Script/Window/Knowledge/Panel_Knowledge_Main.lua")
  else
    runLua("UI_Data/Script/Window/Knowledge/Panel_Window_Knowledge_Renew.lua")
  end
  runLua("UI_Data/Script/Window/Movie/Panel_IntroMovie.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieTheater_320.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieTheater_640.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieTheater_LowLevel.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieTheater_SkillGuide_640.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieGuide_Web.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieGuide_Weblist.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieSkillGuide_Web.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieSkillGuide_Weblist.lua")
  runLua("UI_Data/Script/Window/Movie/Panel_MovieWorldMapGuide_Web.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Manager.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_EventList.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase1_BasicMove.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase2_BasicControl.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase3_InteractionSupplyBox.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase4_InventoryAndQuickSlot.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase5_CallBlackSpirit.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_BladeMasterWomen.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Warrior.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Ranger.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Sorcerer.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Giant.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Tamer.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_BladeMaster.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Valkyrie.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_WizardWomen.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Wizard.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_NinjaWomen.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_NinjaMan.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_DarkElf.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Combattant.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_CombattantWomen.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_Ran.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_LocalHost.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase_BasicSkill_7Layer.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase7_FindRequestTarget.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase8_WesternGuardCamp.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase9_AncientStoneChamber.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase10_WorldmapNodeAndNavi.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase11_WorldmapBuyHouse.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase12_WorldmapMenu.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase13_Hidel_FindNearNpc.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase14_Hidel_Trade.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase15_Hidel_Worker.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase16_NewItemEquip.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase17_ItemSell.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase18_Enchant.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase19_ExtractionEnchantStone.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase20_WallRiding.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase21_ItemSellPractice.lua")
  runLua("UI_Data/Script/Tutorial/Tutorial_Phase22_EnchantStack.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_Tutorial_UiBlackSpirit.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_Tutorial_UiHeadlineMessage.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_Tutorial_UiKeyButton.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_Tutorial_UiMasking.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_Tutorial_UiManager.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_TutorialMenu.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_Movie_KeyViewer.lua")
  runLua("UI_Data/Script/Tutorial/ArousalTutorial_Manager.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_ArousalTutorial_UiManager.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_ArousalTutorial_UiBlackSpirit.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_ArousalTutorial_UiHeadlineMessage.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_ArousalTutorial_UiKeyButton.lua")
  runLua("UI_Data/Script/Tutorial/SummonBossTutorial_Manager.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_SummonBossTutorial_UiManager.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_SummonBossTutorial_UiBlackSpirit.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_SummonBossTutorial_UiHeadlineMessage.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_SummonBossTutorial_UiKeyButton.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_LifeTutorial.lua")
  runLua("UI_Data/Script/Widget/QuestList/Panel_LatestQuest.lua")
  runLua("UI_Data/Script/Widget/QuestList/Panel_MainQuest.lua")
  runLua("UI_Data/Script/Widget/QuestList/Panel_CheckedQuest.lua")
  runLua("UI_Data/Script/Widget/QuestList/Panel_QuestInfo.lua")
  runLua("UI_Data/Script/Widget/Party/Panel_PartyCombat.lua")
  runLua("UI_Data/Script/Widget/RaceMatch/Panel_RaceMatch.lua")
  runLua("UI_Data/Script/Widget/Party/Panel_LargeParty.lua")
  runLua("UI_Data/Script/Widget/Party/Panel_Party.lua")
  runLua("UI_Data/Script/Widget/Party/Panel_PartyItemList.lua")
  runLua("UI_Data/Script/Widget/Buff/Panel_AppliedBuffList.lua")
  runLua("UI_Data/Script/Window/Delivery/Panel_Window_Delivery_Request.lua")
  runLua("UI_Data/Script/Window/Delivery/Panel_Window_Delivery_Information.lua")
  runLua("UI_Data/Script/Window/Delivery/Panel_Window_Delivery_InformationView.lua")
  runLua("UI_Data/Script/Window/Delivery/Panel_Window_Delivery_CarriageInformation.lua")
  runLua("UI_Data/Script/Window/WorldMap/FishEncyclopedia/Panel_FishEncyclopedia.lua")
  if true == _ContentsGroup_RenewUI_Guild then
    runLua("UI_Data/Script/Window/Guild/Console/Panel_Window_Guild_Renew.lua")
    runLua("UI_Data/Script/Window/Guild/Console/Panel_Window_Guild_Agreement_Renew.lua")
    runLua("UI_Data/Script/Window/Guild/Console/Panel_Window_Guild_AgreementOption_Renew.lua")
    runLua("UI_Data/Script/Window/Guild/Console/Panel_Window_Guild_Create.lua")
    runLua("UI_Data/Script/Window/Guild/Console/Panel_Dialog_Guild_Popup.lua")
  end
  runLua("UI_Data/Script/Window/Guild/Frame_Guild_History.lua")
  runLua("UI_Data/Script/Window/Guild/Frame_Guild_List.lua")
  runLua("UI_Data/Script/Window/Guild/Frame_Guild_Quest.lua")
  runLua("UI_Data/Script/Window/Guild/Frame_Guild_Warfare.lua")
  runLua("UI_Data/Script/Window/Guild/Frame_Guild_Recruitment.lua")
  runLua("UI_Data/Script/Window/Guild/Frame_Guild_CraftInfo.lua")
  runLua("UI_Data/Script/Window/Guild/Frame_Guild_Skill.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_GuildDuel.lua")
  runLua("UI_Data/Script/Window/Guild/Guild_Popup.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_AgreementGuild.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_AgreementGuild_Master.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_Incentive.lua")
  if __Guild_LimitPrice then
    runLua("UI_Data/Script/Window/Guild/Panel_Guild_SetFundsList.lua")
  end
  runLua("UI_Data/Script/Window/Guild/Panel_GuildRank.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_GuildWebInfo.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_UseGuildFunds.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_ChoiseTheMoney.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_ClanList.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_GetDailyPay.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_NoneJoinMember.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_Manufacture.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_ManufactureSelect.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_AllianceInfo.lua")
  runLua("UI_Data/Script/Window/Guild/Panel_Guild_InvitationGuildAlliance.lua")
  runLua("UI_Data/Script/Widget/LevelUpMessage/Panel_Levelup_Reward.lua")
  runLua("UI_Data/Script/Widget/FadeScreen/Panel_Fade_Screen.lua")
  if true == _ContentsGroup_RenewUI_Interaction then
    runLua("UI_Data/Script/Widget/Interaction/Panel_Interaction_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/Interaction/Panel_Interaction.lua")
  end
  runLua("UI_Data/Script/Widget/Interaction/Panel_Interaction_FriendHouseList.lua")
  runLua("UI_Data/Script/Widget/Interaction/Panel_Interaction_HouseRank.lua")
  runLua("UI_Data/Script/Widget/Interaction/Panel_WatchingMode.lua")
  runLua("UI_Data/Script/Widget/Housing/Panel_Housing_FarmInfo.lua")
  runLua("UI_Data/Script/Widget/Housing/Panel_InstallationMode_FarmGuide.lua")
  runLua("UI_Data/Script/Widget/Housing/Panel_Housing.lua")
  runLua("UI_Data/Script/Widget/Housing/Panel_HouseName.lua")
  runLua("UI_Data/Script/Widget/Housing/AlertInstallation.lua")
  runLua("UI_Data/Script/Window/HouseInfo/Panel_House_SellBuy_Condition.lua")
  if false == isNewHousing then
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode.lua")
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode_ObjectControl.lua")
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode_Cart.lua")
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode_VillageTentPopUp.lua")
  else
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode_New.lua")
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode_ObjectControl.lua")
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode_Cart_New.lua")
    runLua("UI_Data/Script/Window/Housing/Panel_House_InstallationMode_VillageTentPopUp.lua")
  end
  runLua("UI_Data/Script/Window/HouseInfo/Panel_New_HouseControl.lua")
  runLua("UI_Data/Script/Widget/Housing/HousingVendingMachine.lua")
  runLua("UI_Data/Script/Widget/Housing/HousingConsignmentSale.lua")
  runLua("UI_Data/Script/Widget/Housing/MyVendorList.lua")
  runLua("UI_Data/Script/Widget/ProgressBar/Panel_ProgressBar.lua")
  runLua("UI_Data/Script/Widget/EnemyGauge/Panel_RecentTargetInfo.lua")
  runLua("UI_Data/Script/Widget/EnemyGauge/Panel_EnemyAlert_OnShip.lua")
  runLua("UI_Data/Script/Window/Exchange/Panel_ExchangeWithPC.lua")
  if _ContentsGroup_3DMiniMapOpen then
    runLua("UI_Data/Script/Window/WorldMap/WorldMiniMap.lua")
    runLua("UI_Data/Script/Window/WorldMap/WorldMiniMapPin.lua")
  end
  runLua("UI_Data/Script/Widget/Rader/Rader_Background.lua")
  runLua("UI_Data/Script/Widget/Rader/Radar_Pin.lua")
  runLua("UI_Data/Script/Widget/Rader/Rader.lua")
  if false == _ContentsGroup_RenewUI_MessageBox then
    runLua("UI_Data/Script/Window/MessageBox/MessageBox.lua")
    runLua("UI_Data/Script/Window/MessageBox/MessageBoxCheck.lua")
  else
    runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBox_Renew.lua")
    runLua("UI_Data/Script/Window/MessageBox/Panel_Window_MessageBoxCheck_Renew.lua")
  end
  runLua("UI_Data/Script/Window/MessageBox/Panel_ScreenShot_For_Desktop.lua")
  runLua("UI_Data/Script/Window/MessageBox/Panel_KickOff.lua")
  runLua("UI_Data/Script/Window/TradeMarket/Panel_Window_TradeMarket.lua")
  runLua("UI_Data/Script/Window/TradeMarket/Panel_TradeMarket_BuyList.lua")
  runLua("UI_Data/Script/Window/TradeMarket/Panel_TradeMarket_SellList.lua")
  runLua("UI_Data/Script/Window/TradeMarket/Panel_Window_TradeMarket_Graph.lua")
  runLua("UI_Data/Script/Window/TradeMarket/Panel_TradeGame.lua")
  if true == _ContentsGroup_isUsedNewTradeEventNotice then
    runLua("UI_Data/Script/Window/TradeMarket/Panel_TradeEventNotice_Renewal.lua")
  else
    runLua("UI_Data/Script/Window/TradeMarket/Panel_TradeEventNotice.lua")
  end
  if true == GlobalSwitch_UseOldAlchemy then
    runLua("UI_Data/Script/Window/Alchemy/Panel_Alchemy.lua")
  else
    runLua("UI_Data/Script/Window/Alchemy/Panel_Alchemy_New.lua")
    runLua("UI_Data/Script/Window/Alchemy/Panel_RecentCook_New.lua")
  end
  if true == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Window/Friend/Console/Panel_FriendsNew.lua")
  else
    runLua("UI_Data/Script/Window/Friend/Panel_Friends.lua")
  end
  runLua("UI_Data/Script/Window/Alchemy/Panel_Manufacture.lua")
  if true == _ContentsGroup_RenewUI_Mail then
    runLua("UI_Data/Script/Window/Mail/Console/Panel_Window_Mail_Renew.lua")
    runLua("UI_Data/Script/Window/Mail/Console/Panel_Window_MailDetail_Renew.lua")
    runLua("UI_Data/Script/Window/Mail/Console/Panel_Widget_NewMailAlarm_Renew.lua")
  else
    runLua("UI_Data/Script/Window/Mail/Panel_Mail.lua")
    runLua("UI_Data/Script/Window/Mail/Panel_Mail_Detail.lua")
    runLua("UI_Data/Script/Window/Mail/Panel_Mail_Send.lua")
  end
  if true == _ContentsGroup_isNewOption then
    runLua("UI_Data/Script/Window/Option/GameOptionHeader.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionMain.lua")
    runLua("UI_Data/Script/Window/Option/GameOptionUtil.lua")
    runLua("UI_Data/Script/Window/Option/Panel_Option_Main.lua")
  else
  end
  runLua("UI_Data/Script/Window/Option/Panel_SetShortCut.lua")
  runLua("UI_Data/Script/Window/Option/Attacked_ClosePanel.lua")
  runLua("UI_Data/Script/Widget/SkillCommand/UI_Widget_SkillCommand.lua")
  if ToClient_IsDevelopment() then
    runLua("UI_Data/Script/Widget/SkillCommand/ConsoleKeyCombo.lua")
    runLua("UI_Data/Script/Widget/SkillCommand/ConsoleKeyFirstCombo.lua")
  end
  runLua("UI_Data/Script/Window/ProductNote/Panel_ProductNote.lua")
  runLua("UI_Data/Script/Window/KeyboardHelp/Panel_Window_KeyboardHelp.lua")
  runLua("UI_Data/Script/Window/LevelupGuide/Panel_LevelupGuide.lua")
  runLua("UI_Data/Script/Window/QnAWebLink/Panel_QnAWebLink.lua")
  runLua("UI_Data/Script/Window/Dye/Panel_Dye_ReNew_ButtonHandler.lua")
  runLua("UI_Data/Script/Window/Dye/Panel_ColorBalance.lua")
  runLua("UI_Data/Script/Window/Dye/Panel_DyePreview.lua")
  runLua("UI_Data/Script/Window/Dye/Panel_DyeNew_CharacterController.lua")
  runLua("UI_Data/Script/Window/Dye/Panel_DyePalette.lua")
  runLua("UI_Data/Script/Window/Dye/Panel_Dye_ReNew.lua")
  if false == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Widget/GameTips/Panel_GameTips.lua")
    runLua("UI_Data/Script/Widget/GameTips/Panel_GameTips_Frame.lua")
  end
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Main.lua")
  if _ContentsGroup_RenewUI_MiniGame then
    runLua("UI_Data/Script/Widget/MiniGame/Console/MiniGame_BattleGauge_Renew.lua")
    runLua("UI_Data/Script/Widget/MiniGame/Console/MiniGame_Timing_Renew.lua")
  else
    runLua("UI_Data/Script/Widget/MiniGame/MiniGame_BattleGauge.lua")
    runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Timing.lua")
  end
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Gradient.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_SinGauge.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Command.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Rhythm.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Rhythm_Drum.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_FillGauge.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_GradientY.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_HerbMachine.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Steal.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Buoy.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_PowerControl.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Jaksal.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_SteeringGear.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Hammer.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Clear.lua")
  runLua("UI_Data/Script/Widget/MiniGame/MiniGame_Find.lua")
  runLua("UI_Data/Script/Widget/Search/Panel_Dialog_Search.lua")
  runLua("UI_Data/Script/Window/GameExit/Panel_GameExitServerSelect.lua")
  if true == _ContentsGroup_RenewUI_ExitGame then
    runLua("UI_Data/Script/Window/GameExit/Console/Panel_Window_GameExit_Renew.lua")
    runLua("UI_Data/Script/Window/GameExit/Console/Panel_Window_GameExit_CharMove_Renew.lua")
    runLua("UI_Data/Script/Window/GameExit/Console/Panel_Window_GameExit_Confirm_Renew.lua")
  else
    runLua("UI_Data/Script/Window/GameExit/Panel_GameExit_New.lua")
  end
  runLua("UI_Data/Script/Window/DeadMessage/Panel_NoAccessArea_Alert.lua")
  runLua("UI_Data/Script/Window/DeadMessage/Panel_Cash_Revival_BuyItem.lua")
  runLua("UI_Data/Script/Widget/Enduarance/Enduarance.lua")
  runLua("UI_Data/Script/Widget/BreathGauge/Panel_BreathGauge.lua")
  if true == _ContentsGroup_RenewUI_Repair then
    runLua("UI_Data/Script/Window/Repair/Panel_Repair_Renew.lua")
    runLua("UI_Data/Script/Window/Repair/Panel_FixMaxEndurance_Renew.lua")
  else
    runLua("UI_Data/Script/Window/Repair/Panel_Window_Repair.lua")
    runLua("UI_Data/Script/Window/Repair/Panel_FixEquip.lua")
  end
  runLua("UI_Data/Script/Window/Extraction/Panel_Window_Extraction.lua")
  runLua("UI_Data/Script/Window/Extraction/Panel_Window_Extraction_Result.lua")
  runLua("UI_Data/Script/Window/Extraction/Panel_Window_Extraction_Crystal.lua")
  runLua("UI_Data/Script/Window/Extraction/Panel_Window_Extraction_EnchantStone.lua")
  runLua("UI_Data/Script/Window/Extraction/Panel_Window_Extraction_Cloth.lua")
  runLua("UI_Data/Script/Window/Enchant/Panel_EnchantExtraction.lua")
  runLua("UI_Data/Script/Widget/Scroll/Panel_Scroll.lua")
  runLua("UI_Data/Script/Tutorial/TutorialMain.lua")
  runLua("UI_Data/Script/Window/Delivery/Panel_Window_Delivery_Person.lua")
  runLua("UI_Data/Script/Window/Delivery/Panel_Window_Delivery_GameExit.lua")
  runLua("UI_Data/Script/Window/Quest/Panel_Quest_History_New.lua")
  if true == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Window/Quest/Console/Panel_Window_QuestInfo_Renew.lua")
  else
    runLua("UI_Data/Script/Window/Quest/Panel_Quest_Window_160525.lua")
  end
  runLua("UI_Data/Script/Window/AutoQuest/Panel_Window_AutoQuest.lua")
  runLua("UI_Data/Script/Widget/AutoQuest/Panel_AutoQuest.lua")
  runLua("UI_Data/Script/Widget/AutoQuest/Panel_AutoQuest_KeyViewer.lua")
  runLua("UI_Data/Script/Widget/Dialogue/Panel_AskKnowledge.lua")
  runLua("UI_Data/Script/Widget/NaviPath/NaviPath.lua")
  runLua("UI_Data/Script/Widget/TownNpcNavi/Panel_Widget_TownNpcNavi.lua")
  runLua("UI_Data/Script/CutScene.lua")
  runLua("UI_Data/Script/Widget/InGameCustomize/InGameCustomize.lua")
  if false == _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Widget/RecentMemory/RecentMemory.lua")
  end
  ToClient_initializeWorldMap("UI_Data/Window/Worldmap_Grand/Worldmap_Grand_Base.XML")
  if true == _ContentsGroup_ForXBoxFinalCert then
    runLua("UI_Data/Script/Window/Worldmap_Grand/Console/Panel_WorldMapSidebar_Renew.lua")
    runLua("UI_Data/Script/Window/Worldmap_Grand/Console/Panel_WorldMapNodeInfo_Renew.lua")
    runLua("UI_Data/Script/Window/Worldmap_Grand/Console/Panel_WorldMapHouseCraft_Renew.lua")
  else
    runLua("UI_Data/Script/Window/WorldMap_Grand/Grand_WorldMap_MenuPanel.lua")
    runLua("UI_Data/Script/Window/WorldMap_Grand/Grand_WorldMap_MainPanel.lua")
    runLua("UI_Data/Script/Window/WorldMap_Grand/Grand_WorldMap_NodeMenu.lua")
  end
  runLua("UI_Data/Script/Window/Worldmap_Grand/Grand_WorldMap_NodeName.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_HouseNavi.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/Grand_WorldMap_MovieTooltip.lua")
  runLua("UI_Data/Script/Widget/WarInfoMessage/Panel_WarInfoMessage.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WarInfo.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_NodeWarInfo.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/Grand_WorldMap_NodeOwnerInfo.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_QuestTooltip.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_TerritoryTooltip.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_ActorTooltip.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_PopupManager.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_HouseHold.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WorkManager_House.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WorkManager_LargeCraft.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WorkManager_Building.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WorkManager_Plant.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WorkManager_Harvest.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_WorkManager_Finance.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_Knowledge.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_Town_WorkerManage.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_Working_Progress.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_LordManager.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_Delivery.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WroldMap_TradeNpcItemInfo.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_TradeNpcList.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_Tent.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_PinGuide.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_WorldMap_NodeStable.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/New_Worldmap_NodeStableInfo.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/Grand_WorldMap_ApprovalRating.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/Grand_WorldMap_PlunderVote.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/WordMap_Craft/Worldmap_Grand_GuildCraft.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/WordMap_Craft/Worldmap_Grand_GuildHouseControl.lua")
  runLua("UI_Data/Script/Window/Worldmap_Grand/WordMap_Craft/Worldmap_Grand_GuildCraft_ChangeWorker.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_Cart.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_MakePaymentsFromCart.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_GoodsTooltip.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_GoodsDetailInfo.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_SetEquip.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_BuyOrGift.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_PaymentPassword.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_ChargeDaumCash.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_TermsofDaumCash.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_BuyPearlBox.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_HowUsePearlShop.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_Coupon.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_EasyPayment.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_EventCart.lua")
  runLua("UI_Data/Script/Widget/CashShopAlert/Recommend_Manager.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_RecommandGoods.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_IngameCashShop_RecommandGoods_PopUp.lua")
  if _ContentsGroup_RenewUI_PearlShop then
    runLua("UI_Data/Script/Window/IngameCashShop/Console/Panel_PearlShop.lua")
    runLua("UI_Data/Script/Window/IngameCashShop/Console/Panel_Pearlshop_Category.lua")
    runLua("UI_Data/Script/Window/IngameCashShop/Console/Panel_Pearlshop_ProductInfo.lua")
    runLua("UI_Data/Script/Window/IngameCashShop/Console/Panel_PearlShop_ProductBuy.lua")
  end
  runLua("UI_Data/Script/Widget/Coupon/Coupon.lua")
  runLua("UI_Data/Script/Window/Cash_Customization/Panel_Cash_Customization.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_Function.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_ItemSet.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarketNew.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_Favorite.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_RegistItem.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_BuyConfirm.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_AlarmList.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_Alarm.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_PreBid.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_PreBid_Manager.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_Password.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_Window_ItemMarket_Alarm_New.lua")
  runLua("UI_Data/Script/Window/ItemMarket/Panel_ItemMarket_NewAlarm.lua")
  runLua("UI_Data/Script/Window/ChallengePresent/Panel_ChallengePresent.lua")
  runLua("UI_Data/Script/Window/ChallengePresent/Panel_Special_Reward.lua")
  runLua("UI_Data/Script/Widget/Gacha_Roulette/Panel_Gacha_Roulette.lua")
  runLua("UI_Data/Script/Widget/PowerGauge/Panel_PowerGauge.lua")
  runLua("UI_Data/Script/Widget/PowerGauge/CannonGuage.lua")
  runLua("UI_Data/Script/Window/PcRoomNotify/Panel_PcRoomNotify.lua")
  runLua("UI_Data/Script/Window/EventNotify/Panel_EventNotify.lua")
  runLua("UI_Data/Script/Window/EventNotify/Panel_EventNotifyContent.lua")
  runLua("UI_Data/Script/Window/Event/Panel_Event_100Day.lua")
  runLua("UI_Data/Script/Window/BuildingBuff/Panel_Window_BuildingBuff.lua")
  runLua("UI_Data/Script/Window/CarveSeal/Panel_CarveSeal.lua")
  runLua("UI_Data/Script/Window/CarveSeal/Panel_ResetSeal.lua")
  runLua("UI_Data/Script/Window/ClearVested/Panel_ClearVested.lua")
  runLua("UI_Data/Script/Window/UI_Setting/Panel_UI_Setting.lua")
  runLua("UI_Data/Script/Window/WorkerManager/Panel_WorkerManager.lua")
  runLua("UI_Data/Script/Window/WorkerManager/Panel_WorkerRestoreAll.lua")
  runLua("UI_Data/Script/Window/WorkerManager/Panel_WorkerChangeSkill.lua")
  runLua("UI_Data/Script/Window/TransferLifeExperience/Panel_TransferLifeExperience.lua")
  runLua("UI_Data/Script/Window/ChangeItem/Panel_ChangeItem.lua")
  runLua("UI_Data/Script/Window/ChangeItem/Panel_ChangeWeapon.lua")
  runLua("UI_Data/Script/Window/Alchemy/Panel_AlchemyStone.lua")
  runLua("UI_Data/Script/Window/Alchemy/Panel_AlchemyFigureHead.lua")
  runLua("UI_Data/Script/Window/RallyRanking/Panel_RallyRanking.lua")
  runLua("UI_Data/Script/Panel_SpecialCharacter.lua")
  runLua("UI_Data/Script/Widget/LocalWar/Panel_LocalWar.lua")
  runLua("UI_Data/Script/Window/Join/Panel_Window_Join.lua")
  runLua("UI_Data/Script/Widget/WarInfoMessage/Panel_TerritoryWar_Alert.lua")
  runLua("UI_Data/Script/Widget/Alert/Alert_Message.lua")
  runLua("UI_Data/Script/Widget/Alert/Alert_Message_Control.lua")
  runLua("UI_Data/Script/Window/Item/Panel_Window_Item_Warp.lua")
  runLua("UI_Data/Script/Window/Item/ConnectUi.lua")
  runLua("UI_Data/Script/Window/WorkerTrade/Panel_WorkerTrade.lua")
  runLua("UI_Data/Script/Window/WorkerTrade/Panel_WorkerTrade_Office.lua")
  runLua("UI_Data/Script/Window/WorkerTrade/Panel_WorkerTrade_Caravan.lua")
  runLua("UI_Data/Script/Window/WorkerTrade/Panel_WorkerTrade_HireOffice.lua")
  runLua("UI_Data/Script/Window/WorkerTrade/Panel_WorkerTrade_DropItem.lua")
  runLua("UI_Data/Script/Window/GoldenTreasureBox/Panel_TreasureBox.lua")
  runLua("UI_Data/Script/Widget/ScreenshotMode/Panel_ScreenShot_WebAlbum.lua")
  runLua("UI_Data/Script/Widget/ScreenshotMode/Panel_ScreenShotAlbum_FullScreen.lua")
  runLua("UI_Data/Script/Widget/Competition/Competition.lua")
  runLua("UI_Data/Script/Widget/QuestList/Panel_CheckedQuest_Option.lua")
  runLua("UI_Data/Script/Window/Broadcast/Panel_Broadcast.lua")
  runLua("UI_Data/Script/Widget/CashShopAlert/Panel_CashShopAlert.lua")
  runLua("UI_Data/Script/SeasonTexture_Window.lua")
  runLua("UI_Data/Script/Widget/NakMessage/ActionMessage.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_RescueShipBubble.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_SummonGamos.lua")
  runLua("UI_Data/Script/Widget/Tutorial/Panel_TamingBubble.lua")
  runLua("UI_Data/Script/Widget/BossWave/Panel_BossWave.lua")
  runLua("UI_Data/Script/Window/Party/Panel_PartyList.lua")
  runLua("UI_Data/Script/Window/Party/Panel_PartyRecruite.lua")
  runLua("UI_Data/Script/Window/Servant/Panel_Window_ServantResurrection.lua")
  runLua("UI_Data/Script/Window/BlackSpiritAdventure/Panel_BlackSpiritAdventure2.lua")
  runLua("UI_Data/Script/Widget/RemoteControl/Panel_RemoteControl.lua")
  runLua("UI_Data/Script/Widget/RemoteControl/Panel_RemoteInventory.lua")
  runLua("UI_Data/Script/Widget/RemoteControl/Panel_RemoteEquip.lua")
  runLua("UI_Data/Script/Widget/RemoteControl/Panel_RemoteManufacture.lua")
  runLua("UI_Data/Script/Widget/RemoteControl/Panel_RemoteWarehouse.lua")
  runLua("UI_Data/Script/AutoQuest/AutoQuestManager.lua")
  runLua("UI_Data/Script/Auto/Auto_Func.lua")
  runLua("UI_Data/Script/Auto/Auto_ClientCall.lua")
  runLua("UI_Data/Script/Auto/AutoManager.lua")
  runLua("UI_Data/Script/Auto/AutoState_Move.lua")
  runLua("UI_Data/Script/Auto/AutoState_WaitForPressButton.lua")
  runLua("UI_Data/Script/Auto/AutoState_DialogInteraction.lua")
  runLua("UI_Data/Script/Auto/AutoState_Hunt.lua")
  runLua("UI_Data/Script/Auto/AutoState_Dead.lua")
  runLua("UI_Data/Script/Auto/AutoState_ExceptionGuide.lua")
  runLua("UI_Data/Script/Auto/AutoState_Tutorial.lua")
  runLua("UI_Data/Script/Widget/TimeAttack/TimeAttack.lua")
  runLua("UI_Data/Script/Window/MonsterRanking/Panel_Window_MonsterRanking.lua")
  runLua("UI_Data/Script/AutoQuest/AutoFrameCheckManager.lua")
  runLua("UI_Data/Script/ReconnectAction/HorseRiding.lua")
  runLua("UI_Data/Script/Window/Under18/Panel_Window_Under18.lua")
  runLua("UI_Data/Script/Widget/ConsoleKeyGuide/Panel_ConsoleKeyGuide.lua")
  runLua("UI_Data/Script/Widget/ConsoleKeyGuide/Panel_ConsoleWorldMapKeyGuide.lua")
  runLua("UI_Data/Script/Window/BlackDesertLab/Panel_Window_BlackDesertLab.lua")
  runLua("UI_Data/Script/Panel_OnlyPerframeUsed.lua")
  runLua("UI_Data/Script/Panel_CommonGameScreenUI.lua")
  loadCustomizationUI()
  runLua("UI_Data/Script/QASupport/QASupportMain.lua")
  runLua("UI_Data/Script/QASupport/QADontSpawn.lua")
  runLua("UI_Data/Script/Window/TranslationReport/Panel_TranslationReport.lua")
  runLua("UI_Data/Script/Window/TranslationReport/Panel_Window_TranslationText.lua")
  runLua("UI_Data/Script/Window/IngameCashShop/Panel_Window_StampCoupon.lua")
  if true == isGameServiceTypeTurkey() then
    runLua("UI_Data/Script/Window/TurkeyIME/Panel_TurkeyIME.lua")
  end
  if true == _ContentsGroup_isMemoOpen then
    runLua("UI_Data/Script/Window/Memo/Panel_Memo_Main.lua")
    runLua("UI_Data/Script/Window/Memo/Panel_Memo_Sticky.lua")
  end
  runLua("UI_Data/Script/Window/RecommendEngine/Panel_RecommendEngine_Main.lua")
  if isActionModeActive then
    runLua("UI_Data/Script/Widget/Z_AlertArea/Panel_AlertArea.lua")
    runLua("UI_Data/Script/Widget/Z_RightTopIcons/Panel_FunctionButtonArea.lua")
  end
  if true == _ContentsGroup_isConsoleTest then
    ToClient_loadQuickMenuPanel(Panel_QuickMenu)
    runLua("UI_Data/Script/Widget/Menu/Console/Panel_QuickMenu.lua")
    runLua("UI_Data/Script/Widget/Menu/Console/ConsoleQuickMenu.lua")
    runLua("UI_Data/Script/Widget/Menu/Console/Panel_QuickMenuSetting.lua")
  end
  runLua("UI_Data/Script/Widget/Dialogue/Panel_NpcGift.lua")
  if true == _ContentsGroup_RenewUI_Gift then
    runLua("UI_Data/Script/Widget/Dialogue/Console/Panel_Dialog_NpcGift_Renew.lua")
  end
  if true == _ContentsGroup_Politics then
    runLua("UI_Data/Script/Window/Politics/Panel_Window_Politics.lua")
  end
  runLua("UI_Data/Script/Window/MacroCheckQuiz/Panel_Window_MacroCheckQuiz.lua")
  runLua("UI_Data/Script/Window/Purification/Panel_Window_Purification.lua")
  if _ContentsGroup_RenewUI then
    runLua("UI_Data/Script/Widget/Menu/Console/Panel_Window_Menu_Renew.lua")
  end
  if ToClient_isXBox() or ToClient_IsDevelopment() then
    runLua("UI_Data/Script/GlobalKeyBinder/globalCloseManager.lua")
  else
    runLua("UI_Data/Script/globalUIManager.lua")
  end
  if true == isUseNewGlobalKeyBinder_chk() then
    runLua("UI_Data/Script/GlobalKeyBinder/globalKeyBinderUiInputType.lua")
    runLua("UI_Data/Script/GlobalKeyBinder/globalKeyBinderManager.lua")
    runLua("UI_Data/Script/GlobalKeyBinder/globalKeyBinder.lua")
  else
  end
  isLuaLoadingComplete = true
end
function WorldMapWindow_Update_ExplorePoint()
end
