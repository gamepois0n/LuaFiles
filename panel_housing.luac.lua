-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\panel_housing.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
Panel_Housing:SetShow(false, false)
Panel_Housing:ActiveMouseEventEffect(true)
local IM = CppEnums.EProcessorInputMode
local housing = {_btnHousingMode, _textHarvestTime, _btnObjectMove, _btnObjectFix, _btnObjectDelete, _btnObjectCancel, _staticHelp, _staticBackInstallations, _btnCheckAll, _btnCheckBottom, _btnCheckWall, _btnCheckTable, _btnCheckTop, _btnCheckCurtain, _btnCheckWallPaper, _btnCheckCapet, _imgHelpMouse, _btnCheckRotate, _btnCameraRotateLeft, _btnCameraRotateRight, _btnCheckIsShowInstalledObject, _btnDeleteAllObject, _staticBackFloor, _radioBtnFirstFloor, _radioBtnSecondFloor, _radioBtnThirdFloor, _textInstallationcount; 
_installationSlots = {}
, _installationSlotShowCount = 0, _maxInstallationSlotCount = 10, _installationStartIndex = 0, _installationSelectIndex = -1, _selectIndexForInstalledObjectList = -1, _isShow = false, _isMyHouse = true}
local housing_ViewControlValue = {startMousePosX = 0, startMousePosY = 0, lastMousePosX = 0, lastMousePosY = 0}
local IM = CppEnums.EProcessorInputMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local ScrX = getScreenSizeX()
local ScrY = getScreenSizeY()
local CURRENT_SHOWING_INSTALLATIONLIST = {}
local CURRENT_SHOWING_INSTALLATION_COUNT = 0
local CURRENT_HOUSEACTOR_IS_FIXED = false
housing.Init = function(self)
  -- function num : 0_0 , upvalues : housing, ScrX, UI_PUCT
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  housing._btnHousingMode = (UI.getChildControl)(Panel_Housing, "Button_Housing")
  ;
  (housing._btnHousingMode):addInputEvent("Mouse_LUp", "Event_HousingCancelInstallModeMessageBox()")
  ;
  (housing._btnHousingMode):ActiveMouseEventEffect(true)
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  housing.FixingBG = (UI.getChildControl)(Panel_Housing, "Static_FixingBG")
  ;
  (housing.FixingBG):SetShow(false)
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

  housing._btnObjectRotateLeft = (UI.getChildControl)(Panel_Housing, "Button_ObjectRotationLeft")
  ;
  (housing._btnObjectRotateLeft):addInputEvent("Mouse_LUp", "Panel_Housing_ObjectRotation_Click(1)")
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

  housing._btnObjectRotateRight = (UI.getChildControl)(Panel_Housing, "Button_ObjectRotationRight")
  ;
  (housing._btnObjectRotateRight):addInputEvent("Mouse_LUp", "Panel_Housing_ObjectRotation_Click(2)")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  housing._btnObjectMove = (UI.getChildControl)(Panel_Housing, "Button_ObjectTranslation")
  ;
  (housing._btnObjectMove):addInputEvent("Mouse_LUp", "Panel_Housing_ObjectTranslation_Click()")
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

  housing._btnObjectFix = (UI.getChildControl)(Panel_Housing, "Button_ObjectFixing")
  ;
  (housing._btnObjectFix):addInputEvent("Mouse_LUp", "Panel_Housing_ObjectFixing_Click()")
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

  housing._btnObjectDelete = (UI.getChildControl)(Panel_Housing, "Button_ObjectDelete")
  ;
  (housing._btnObjectDelete):addInputEvent("Mouse_LUp", "Panel_Housing_ObjectDelete_Click()")
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

  housing._btnObjectCancel = (UI.getChildControl)(Panel_Housing, "Button_ObjectCancel")
  ;
  (housing._btnObjectCancel):addInputEvent("Mouse_LUp", "Panel_Housing_ObjectCancel_Click()")
  -- DECOMPILER ERROR at PC114: Confused about usage of register: R1 in 'UnsetPending'

  housing._staticBackInstallations = (UI.getChildControl)(Panel_Housing, "Static_Installations")
  ;
  (housing._staticBackInstallations):addInputEvent("Mouse_UpScroll", "Panel_Housing_Static_Back_Installations_ScrollUp()")
  ;
  (housing._staticBackInstallations):addInputEvent("Mouse_DownScroll", "Panel_Housing_Static_Back_Installations_ScrollDown()")
  -- DECOMPILER ERROR at PC133: Confused about usage of register: R1 in 'UnsetPending'

  housing._staticSlotFront = (UI.getChildControl)(Panel_Housing, "Static_SlotFront")
  ;
  (housing._staticSlotFront):SetShow(false)
  -- DECOMPILER ERROR at PC145: Confused about usage of register: R1 in 'UnsetPending'

  housing._staticSlotBorder = (UI.getChildControl)(Panel_Housing, "Static_SlotBorder")
  ;
  (housing._staticSlotBorder):SetShow(false)
  -- DECOMPILER ERROR at PC157: Confused about usage of register: R1 in 'UnsetPending'

  housing._staticSlotArrow = (UI.getChildControl)(Panel_Housing, "Static_SlotArrow")
  ;
  (housing._staticSlotArrow):SetShow(false)
  -- DECOMPILER ERROR at PC169: Confused about usage of register: R1 in 'UnsetPending'

  housing._helpImage = (UI.getChildControl)(Panel_Housing, "Static_helpMouse")
  -- DECOMPILER ERROR at PC176: Confused about usage of register: R1 in 'UnsetPending'

  housing._helpTxtMove = (UI.getChildControl)(Panel_Housing, "StaticText_Help_Move")
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

  housing._helpTxtRotate = (UI.getChildControl)(Panel_Housing, "StaticText_Help_Rot")
  -- DECOMPILER ERROR at PC190: Confused about usage of register: R1 in 'UnsetPending'

  housing._helpTxtZoom = (UI.getChildControl)(Panel_Housing, "StaticText_Help_Zoom")
  ;
  (housing._helpImage):SetPosX(getScreenSizeX() / 2 - (housing._helpImage):GetSizeX() / 2 - (housing._staticBackInstallations):GetSizeX() / 2)
  local _helpImgPosX = (housing._helpImage):GetPosX()
  local _helpImgPosY = (housing._helpImage):GetPosY()
  ;
  (housing._helpTxtMove):SetPosX(_helpImgPosX + 20)
  ;
  (housing._helpTxtRotate):SetPosX(_helpImgPosX + 88)
  ;
  (housing._helpTxtZoom):SetPosX(_helpImgPosX + 164)
  ;
  (housing._helpTxtMove):SetPosY(_helpImgPosY + 7)
  ;
  (housing._helpTxtRotate):SetPosY(_helpImgPosY + 7)
  ;
  (housing._helpTxtZoom):SetPosY(_helpImgPosY + 7)
  -- DECOMPILER ERROR at PC254: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckRotate = (UI.getChildControl)(Panel_Housing, "CheckButton_Rotation")
  ;
  (housing._btnCheckRotate):SetPosX((getScreenSizeX() - (housing._btnCheckRotate):GetSizeX() - (housing._btnCheckRotate):GetTextSizeX() - (housing._staticBackInstallations):GetSizeX()) / 2)
  ;
  (housing._btnCheckRotate):SetPosY((housing._helpImage):GetPosY() + (housing._helpImage):GetSizeY() + 30)
  ;
  (housing._btnCheckRotate):addInputEvent("Mouse_LUp", "Panel_Housing_CheckRotateObject_MouseLUp()")
  -- DECOMPILER ERROR at PC303: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCameraRotateLeft = (UI.getChildControl)(Panel_Housing, "Button_CameraRotateLeft")
  -- DECOMPILER ERROR at PC310: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCameraRotateRight = (UI.getChildControl)(Panel_Housing, "Button_CameraRotateRight")
  ;
  (housing._btnCameraRotateLeft):SetPosX((getScreenSizeX() - (housing._btnCheckRotate):GetSizeX() - (housing._staticBackInstallations):GetSizeX()) / 2 - (housing._btnCameraRotateRight):GetSizeX())
  ;
  (housing._btnCameraRotateLeft):SetPosY((housing._btnCheckRotate):GetPosY() + 30)
  ;
  (housing._btnCameraRotateRight):SetPosX((housing._btnCameraRotateLeft):GetPosX() + (housing._btnCameraRotateLeft):GetSizeX() + 10)
  ;
  (housing._btnCameraRotateRight):SetPosY((housing._btnCheckRotate):GetPosY() + 30)
  ;
  (housing._btnCameraRotateLeft):addInputEvent("Mouse_LUp", "Panel_Housing_CameraRotationLeft_Click()")
  ;
  (housing._btnCameraRotateRight):addInputEvent("Mouse_LUp", "Panel_Housing_CameraRotationRight_Click()")
  -- DECOMPILER ERROR at PC383: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckAll = (UI.getChildControl)(Panel_Housing, "CheckButton_All")
  ;
  (housing._btnCheckAll):addInputEvent("Mouse_LUp", "Panel_Housing_CheckAll_MouseLUp()")
  ;
  (housing._btnCheckAll):SetCheck(false)
  -- DECOMPILER ERROR at PC401: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckBottom = (UI.getChildControl)(Panel_Housing, "CheckButton_Bottom")
  ;
  (housing._btnCheckBottom):addInputEvent("Mouse_LUp", "Panel_Housing_CheckBottom_MouseLUp()")
  ;
  (housing._btnCheckBottom):SetCheck(false)
  -- DECOMPILER ERROR at PC419: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckWall = (UI.getChildControl)(Panel_Housing, "CheckButton_Wall")
  ;
  (housing._btnCheckWall):addInputEvent("Mouse_LUp", "Panel_Housing_CheckWall_MouseLUp()")
  ;
  (housing._btnCheckWall):SetCheck(false)
  -- DECOMPILER ERROR at PC437: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckTable = (UI.getChildControl)(Panel_Housing, "CheckButton_Out")
  ;
  (housing._btnCheckTable):addInputEvent("Mouse_LUp", "Panel_Housing_CheckOut_MouseLUp()")
  ;
  (housing._btnCheckTable):SetCheck(false)
  -- DECOMPILER ERROR at PC455: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckTop = (UI.getChildControl)(Panel_Housing, "CheckButton_Top")
  ;
  (housing._btnCheckTop):addInputEvent("Mouse_LUp", "Panel_Housing_CheckTop_MouseLUp()")
  ;
  (housing._btnCheckTop):SetCheck(false)
  -- DECOMPILER ERROR at PC473: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckCurtain = (UI.getChildControl)(Panel_Housing, "CheckButton_Curtain")
  ;
  (housing._btnCheckCurtain):addInputEvent("Mouse_LUp", "Panel_Housing_CheckCurtain_MouseLUp()")
  ;
  (housing._btnCheckCurtain):SetCheck(false)
  -- DECOMPILER ERROR at PC491: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckWallPaper = (UI.getChildControl)(Panel_Housing, "CheckButton_WallPaper")
  ;
  (housing._btnCheckWallPaper):addInputEvent("Mouse_LUp", "Panel_Housing_CheckWallPaper_MouseLUp()")
  ;
  (housing._btnCheckWallPaper):SetCheck(false)
  -- DECOMPILER ERROR at PC509: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckCapet = (UI.getChildControl)(Panel_Housing, "CheckButton_Capet")
  ;
  (housing._btnCheckCapet):addInputEvent("Mouse_LUp", "Panel_Housing_CheckCapet_MouseLUp()")
  ;
  (housing._btnCheckCapet):SetCheck(false)
  -- DECOMPILER ERROR at PC527: Confused about usage of register: R3 in 'UnsetPending'

  housing._staticCheckBack = (UI.getChildControl)(Panel_Housing, "Static_BackCheck")
  -- DECOMPILER ERROR at PC534: Confused about usage of register: R3 in 'UnsetPending'

  housing._buttonQuestion = (UI.getChildControl)(Panel_Housing, "Button_Question")
  -- DECOMPILER ERROR at PC541: Confused about usage of register: R3 in 'UnsetPending'

  housing._staticCheckBlackBG = (UI.getChildControl)(Panel_Housing, "Static_CheckBG")
  -- DECOMPILER ERROR at PC548: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnCheckIsShowInstalledObject = (UI.getChildControl)(Panel_Housing, "CheckButton_Installed")
  ;
  (housing._btnCheckIsShowInstalledObject):addInputEvent("Mouse_LUp", "Panel_Housing_CheckShowInstalledObject_MouseLUp()")
  ;
  (housing._btnCheckIsShowInstalledObject):SetPosX((housing._staticCheckBack):GetPosX() + 30)
  ;
  (housing._btnCheckIsShowInstalledObject):SetPosY((housing._staticCheckBack):GetPosY() + (housing._staticCheckBack):GetSizeY() + 105)
  ;
  (housing._btnCheckIsShowInstalledObject):SetEnableArea(0, 0, (housing._btnCheckIsShowInstalledObject):GetTextSizeX(), (housing._btnCheckIsShowInstalledObject):GetSizeY())
  -- DECOMPILER ERROR at PC598: Confused about usage of register: R3 in 'UnsetPending'

  housing._btnDeleteAllObject = (UI.getChildControl)(Panel_Housing, "Static_Button_DeleteAll")
  ;
  (housing._btnDeleteAllObject):addInputEvent("Mouse_LUp", "Panel_Housing_CheckIsDeleteAllObject_MouseLUp()")
  -- DECOMPILER ERROR at PC611: Confused about usage of register: R3 in 'UnsetPending'

  housing._staticBackFloor = (UI.getChildControl)(Panel_Housing, "Static_BackFloor")
  -- DECOMPILER ERROR at PC618: Confused about usage of register: R3 in 'UnsetPending'

  housing._radioBtnFirstFloor = (UI.getChildControl)(Panel_Housing, "RadioButton_FirstFloor")
  ;
  (housing._radioBtnFirstFloor):addInputEvent("Mouse_LUp", "Panel_Housing_FirstFloor_MouseLUp()")
  -- DECOMPILER ERROR at PC631: Confused about usage of register: R3 in 'UnsetPending'

  housing._radioBtnSecondFloor = (UI.getChildControl)(Panel_Housing, "RadioButton_SecondFloor")
  ;
  (housing._radioBtnSecondFloor):addInputEvent("Mouse_LUp", "Panel_Housing_SecondFloor_MouseLUp()")
  -- DECOMPILER ERROR at PC644: Confused about usage of register: R3 in 'UnsetPending'

  housing._radioBtnThirdFloor = (UI.getChildControl)(Panel_Housing, "RadioButton_ThirdFloor")
  ;
  (housing._radioBtnThirdFloor):addInputEvent("Mouse_LUp", "Panel_Housing_ThirdFloor_MouseLUp()")
  local tempText = (UI.getChildControl)(Panel_Housing, "StaticText_Floor")
  ;
  (housing._staticBackFloor):SetChild_DoNotUseXXX(tempText)
  ;
  (housing._staticBackFloor):SetChild_DoNotUseXXX(housing._radioBtnFirstFloor)
  ;
  (housing._staticBackFloor):SetChild_DoNotUseXXX(housing._radioBtnSecondFloor)
  ;
  (housing._staticBackFloor):SetChild_DoNotUseXXX(housing._radioBtnThirdFloor)
  ;
  (housing._staticBackFloor):SetShow(false)
  local sizeY = (housing._btnCheckAll):GetSizeY() + (housing._btnCheckBottom):GetSizeY() + (housing._btnCheckWall):GetSizeY() + (housing._btnCheckTable):GetSizeY() + 95 - ((housing._btnCheckWallPaper):GetSizeY() * 2 + 5)
  tempText = (UI.getChildControl)(Panel_Housing, "StaticText_InvenInst")
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._staticCheckBlackBG)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(tempText)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckAll)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckWall)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckBottom)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckTable)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckTop)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckCurtain)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckWallPaper)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._btnCheckCapet)
  ;
  (housing._staticCheckBack):SetChild_DoNotUseXXX(housing._buttonQuestion)
  ;
  (housing._staticCheckBack):SetShow(true)
  ;
  (housing._staticCheckBack):SetSize(220, sizeY)
  ;
  (housing._staticCheckBack):SetPosX(ScrX - 420)
  ;
  (housing._staticCheckBack):SetPosY(0)
  ;
  (housing._buttonQuestion):SetPosX((housing._staticCheckBack):GetSizeX() - (housing._buttonQuestion):GetSizeX() - 7)
  ;
  (housing._buttonQuestion):SetPosY(6)
  ;
  (housing._staticCheckBlackBG):SetSize((housing._staticCheckBack):GetSizeX() - ((housing._staticCheckBlackBG):GetSpanSize()).x - 7, (housing._staticCheckBack):GetSizeY() - ((housing._staticCheckBlackBG):GetSpanSize()).y - 7)
  ;
  (housing._btnCheckAll):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckAll):GetSizeX() / 2)
  ;
  (housing._btnCheckBottom):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckBottom):GetSizeX() / 2)
  ;
  (housing._btnCheckWall):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckWall):GetSizeX() / 2)
  ;
  (housing._btnCheckTable):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckTable):GetSizeX() / 2)
  ;
  (housing._btnCheckTop):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckTop):GetSizeX() / 2)
  ;
  (housing._btnCheckCurtain):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckCurtain):GetSizeX() / 2)
  ;
  (housing._btnCheckWallPaper):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckWallPaper):GetSizeX() / 2)
  ;
  (housing._btnCheckCapet):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckCapet):GetSizeX() / 2)
  tempText:SetPosX(0)
  tempText:SetPosY(5)
  tempText:SetSize((housing._staticCheckBack):GetSizeX(), 20)
  local templateStaticBackSlot = (UI.getChildControl)(Panel_Housing, "Static_BackSlot")
  local templateStaticImgSlot = (UI.getChildControl)(Panel_Housing, "Static_ImageSlot")
  local slotElapsedY = 5
  for ii = 0, housing._maxInstallationSlotCount - 1 do
    local newSlot = {}
    newSlot._staticBackSlot = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, housing._staticBackInstallations, "Static_Installation_SlotBack_" .. ii)
    CopyBaseProperty(templateStaticBackSlot, newSlot._staticBackSlot)
    ;
    (newSlot._staticBackSlot):SetIgnore(true)
    local slotSizeY = (newSlot._staticBackSlot):GetSizeY() + slotElapsedY * 2
    ;
    (newSlot._staticBackSlot):SetShow(false)
    ;
    (newSlot._staticBackSlot):SetPosX(23)
    ;
    (newSlot._staticBackSlot):SetPosY(ii * slotSizeY + slotElapsedY)
    newSlot._staticImgSlot = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, newSlot._staticBackSlot, "Static_Installation_SlotImg_" .. ii)
    CopyBaseProperty(templateStaticImgSlot, newSlot._staticImgSlot)
    ;
    (newSlot._staticImgSlot):SetPosX(3)
    ;
    (newSlot._staticImgSlot):SetPosY(5)
    ;
    (newSlot._staticImgSlot):SetSize(106, 106)
    ;
    (newSlot._staticImgSlot):addInputEvent("Mouse_LUp", "Panel_Housing_installationSlot_MouseLUp(" .. ii .. ")")
    ;
    (newSlot._staticImgSlot):ActiveMouseEventEffect(true)
    ;
    (newSlot._staticImgSlot):addInputEvent("Mouse_On", "Panel_Housing_installationSlot_MouseOver(true," .. ii .. ")")
    ;
    (newSlot._staticImgSlot):addInputEvent("Mouse_Out", "Panel_Housing_installationSlot_MouseOver(false," .. ii .. ")")
    ;
    (newSlot._staticImgSlot):addInputEvent("Mouse_UpScroll", "Panel_Housing_Static_Back_Installations_ScrollUp()")
    ;
    (newSlot._staticImgSlot):addInputEvent("Mouse_DownScroll", "Panel_Housing_Static_Back_Installations_ScrollDown()")
    newSlot.icon = newSlot._staticBackSlot
    Panel_Tooltip_Item_SetPosition(ii, newSlot, "HousingMode")
    -- DECOMPILER ERROR at PC1111: Confused about usage of register: R14 in 'UnsetPending'

    ;
    (housing._installationSlots)[ii] = newSlot
  end
  -- DECOMPILER ERROR at PC1119: Confused about usage of register: R8 in 'UnsetPending'

  housing._staticTextInstalledTentCount = (UI.getChildControl)(Panel_Housing, "StaticText_InstalledCount")
  -- DECOMPILER ERROR at PC1126: Confused about usage of register: R8 in 'UnsetPending'

  housing._staticTextMaxTentCount = (UI.getChildControl)(Panel_Housing, "StaticText_MaxTentCount")
  ;
  (housing._staticTextInstalledTentCount):SetShow(false)
  ;
  (housing._staticTextMaxTentCount):SetShow(false)
end

housing.ShowMode = function(self, isShow)
  -- function num : 0_1 , upvalues : housing, CURRENT_HOUSEACTOR_IS_FIXED
  (housing._staticTextInstalledTentCount):SetShow(false)
  ;
  (housing._staticTextMaxTentCount):SetShow(false)
  if isShow then
    (housing._staticSlotFront):SetShow(false)
    ;
    (housing._staticSlotBorder):SetShow(false)
    ;
    (housing._staticSlotArrow):SetShow(false)
    ;
    (housing._btnCheckAll):SetCheck(true)
    ;
    (housing._btnCheckBottom):SetCheck(false)
    ;
    (housing._btnCheckWall):SetCheck(false)
    ;
    (housing._btnCheckTable):SetCheck(false)
    ;
    (housing._btnCheckTop):SetCheck(false)
    ;
    (housing._btnCheckCurtain):SetCheck(false)
    ;
    (housing._btnCheckWallPaper):SetCheck(false)
    ;
    (housing._btnCheckCapet):SetCheck(false)
    if housing_isInstallMode() then
      local houseWrapper = housing_getHouseholdActor_CurrentPosition()
      if houseWrapper == nil then
        _PA_ASSERT(false, "housing_getHouseholdActor_CurrentPosition()�\128 nullptr 이면 안됩니다.")
        return 
      end
      if not ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isFixedHouse() then
        do
          CURRENT_HOUSEACTOR_IS_FIXED = ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isInnRoom()
          if CURRENT_HOUSEACTOR_IS_FIXED then
            (housing._staticCheckBack):SetShow(true)
            ;
            (housing._btnCheckAll):SetShow(true)
            ;
            (housing._btnCheckBottom):SetShow(true)
            ;
            (housing._btnCheckWall):SetShow(true)
            ;
            (housing._btnCheckTable):SetShow(true)
            ;
            (housing._btnCheckTop):SetShow(true)
            ;
            (housing._btnCheckCurtain):SetShow(true)
            ;
            (housing._btnCheckWallPaper):SetShow(false)
            ;
            (housing._btnCheckCapet):SetShow(false)
            ;
            (housing._buttonQuestion):SetShow(true)
            ;
            (housing._staticCheckBlackBG):SetShow(true)
            ;
            (housing._btnCheckIsShowInstalledObject):SetShow(true)
            ;
            (housing._staticTextInstalledTentCount):SetShow(false)
            ;
            (housing._staticTextMaxTentCount):SetShow(false)
            ;
            (housing._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowHouse\" )")
          else
            ;
            (housing._btnCheckAll):SetShow(false)
            ;
            (housing._btnCheckBottom):SetShow(false)
            ;
            (housing._btnCheckWall):SetShow(false)
            ;
            (housing._btnCheckTable):SetShow(false)
            ;
            (housing._btnCheckTop):SetShow(false)
            ;
            (housing._btnCheckCurtain):SetShow(false)
            ;
            (housing._btnCheckWallPaper):SetShow(false)
            ;
            (housing._btnCheckCapet):SetShow(false)
            ;
            (housing._buttonQuestion):SetShow(false)
            ;
            (housing._staticCheckBlackBG):SetShow(false)
            ;
            (housing._btnCheckIsShowInstalledObject):SetShow(false)
            ;
            (housing._staticCheckBack):SetShow(false)
            ;
            (housing._staticTextInstalledTentCount):SetShow(true)
            ;
            (housing._staticTextMaxTentCount):SetShow(true)
            ;
            (housing._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowTent\" )")
            ;
            (housing._staticTextInstalledTentCount):SetPosX((housing._staticBackInstallations):GetPosX() - ((housing._staticTextInstalledTentCount):GetSizeX() + 15))
            ;
            (housing._staticTextMaxTentCount):SetPosX((housing._staticBackInstallations):GetPosX() - ((housing._staticTextMaxTentCount):GetSizeX() + 15))
          end
          housing:ShowInstallationInven(true)
          housing:ShowFloorStatic(true)
          -- DECOMPILER ERROR at PC288: Confused about usage of register: R3 in 'UnsetPending'

          housing._installationStartIndex = 0
          -- DECOMPILER ERROR at PC290: Confused about usage of register: R3 in 'UnsetPending'

          housing._selectIndexForInstalledObjectList = -1
          Panel_Housing_Update_ShowingInstallationList()
          Panel_Housing_Update_installationSlots()
          housing:updateInstallableCount()
          ;
          (housing._helpImage):SetText(PAGetString(Defines.StringSheet_RESOURCE, "HOUSING_TXT_HELPTEXT"))
          ;
          (housing._btnCheckRotate):SetShow(true)
          ;
          (housing._btnCheckRotate):SetCheck(housing_getRestrictedRatateObject())
          ;
          (housing._btnCameraRotateLeft):SetShow(true)
          ;
          (housing._btnCameraRotateRight):SetShow(true)
          housing:ShowFloorStatic(false)
          housing:ShowInstallationInven(false)
          ;
          (housing._helpImage):SetText("")
          ;
          (housing._btnCheckRotate):SetShow(false)
          ;
          (housing._btnCameraRotateLeft):SetShow(false)
          ;
          (housing._btnCameraRotateRight):SetShow(false)
          ;
          (housing._btnCheckIsShowInstalledObject):SetShow(false)
          ;
          (housing._btnDeleteAllObject):SetShow(false)
          housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
          Panel_Housing:SetShow(isShow, false)
        end
      end
    end
  end
end

housing.updateInstallableCount = function(self)
  -- function num : 0_2 , upvalues : CURRENT_HOUSEACTOR_IS_FIXED, housing
  if housing_isInstallMode() == false then
    return 
  end
  if CURRENT_HOUSEACTOR_IS_FIXED == true then
    return 
  end
  local houseActorWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseActorWrapper == nil then
    _PA_ASSERT(false, "housing_getHouseholdActor_CurrentPosition()�\128 nullptr 이면 안됩니다.")
    return 
  end
  local css = (houseActorWrapper:getStaticStatusWrapper()):get()
  ;
  (housing._staticTextInstalledTentCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "INSTALLATION_MAX_INSTALL_COUNT", "maxInstallCount", css:getInstallationMaxCount()))
  ;
  (housing._staticTextMaxTentCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "INSTALLATION_CURRENT_INSTALL_COUNT", "currentCount", houseActorWrapper:getInstallationCountSum()))
end

local housing_harvest_graph = {
waterRateStatic = {}
, 
tempRateStatic = {}
}
housing.ShowInstallationMenu = function(self, isShow, posX, posY, isHarvest, isShowMove, isShowFix, isShowDelete, isShowCancel)
  -- function num : 0_3 , upvalues : housing, IM
  (housing.FixingBG):SetShow(false)
  ;
  (housing._btnObjectMove):SetShow(false)
  ;
  (housing._btnObjectFix):SetShow(false)
  ;
  (housing._btnObjectDelete):SetShow(false)
  ;
  (housing._btnObjectCancel):SetShow(false)
  if isShow == false then
    return 
  else
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  end
  audioPostEvent_SystemUi(12, 16)
  if isHarvest then
    PAHousing_FarmInfo_Open((housing._staticCheckBack):GetPosX() + 10, (housing._staticCheckBack):GetPosY() + (housing._staticCheckBack):GetSizeY() + 100)
  else
    PAHousing_FarmInfo_Close()
  end
  ;
  (housing.FixingBG):SetShow(isShow)
  ;
  (housing._btnObjectMove):SetShow(isShowMove)
  ;
  (housing._btnObjectFix):SetShow(isShowFix)
  ;
  (housing._btnObjectDelete):SetShow(isShowDelete)
  ;
  (housing._btnObjectCancel):SetShow(isShowCancel)
  local showCount = 0
  if isShowFix then
    showCount = showCount + 1
  end
  if isShowDelete then
    showCount = showCount + 1
  end
  if isShowMove then
    showCount = showCount + 1
  end
  if isShowCancel then
    showCount = showCount + 1
  end
  local modeSequence = housing_getInstallModeSequence()
  if modeSequence == 2 then
    (housing.FixingBG):SetShow(true)
    showCount = showCount + 2
  end
  local startPosX = posX
  if showCount == 1 then
    startPosX = startPosX - 25
  else
    if showCount == 2 then
      startPosX = startPosX - 55
    else
      if showCount == 3 then
        startPosX = startPosX - 75
      else
        if showCount == 4 then
          startPosX = startPosX - 100
        else
          if showCount == 5 then
            startPosX = startPosX - 125
          else
            if showCount == 6 then
              startPosX = startPosX - 150
            else
              tempPosX = 0
            end
          end
        end
      end
    end
  end
  local elapsedPos = 0
  local yPos = 0
  local menuCount = 0
  if (housing.FixingBG):GetShow() then
    (housing.FixingBG):SetPosX(startPosX - 6)
    ;
    (housing.FixingBG):SetPosY(posY - 6)
  end
  if (housing._btnObjectFix):GetShow() then
    (housing._btnObjectFix):SetPosX(startPosX)
    ;
    (housing._btnObjectFix):SetPosY(posY + yPos)
    yPos = yPos + 35
    menuCount = menuCount + 1
  end
  if (housing._btnObjectDelete):GetShow() then
    (housing._btnObjectDelete):SetPosX(startPosX)
    ;
    (housing._btnObjectDelete):SetPosY(posY + (yPos))
    yPos = yPos + 35
    menuCount = menuCount + 1
  end
  if (housing._btnObjectMove):GetShow() then
    (housing._btnObjectMove):SetPosX(startPosX)
    ;
    (housing._btnObjectMove):SetPosY(posY + (yPos))
    yPos = yPos + 35
    menuCount = menuCount + 1
  end
  if (housing._btnObjectCancel):GetShow() then
    (housing._btnObjectCancel):SetPosX(startPosX)
    ;
    (housing._btnObjectCancel):SetPosY(posY + (yPos))
    menuCount = menuCount + 1
  end
  ;
  (housing.FixingBG):SetSize((housing.FixingBG):GetSizeX(), (menuCount) * 35 + 10)
end

Panel_Housing_CancelModeFromKeyBinder = function()
  -- function num : 0_4
  if housing_isInstallMode() then
    if housing_isTemporaryObject() then
      Panel_Housing_CancelInstallObject_InteractionFromMessageBox()
    else
      Event_HousingCancelInstallModeMessageBox()
    end
  else
    Event_HousingCancelBuildTentMessageBox()
  end
  FGlobal_AlertHouseLightingReset()
end

housing.ShowInstallationInven = function(self, isShow)
  -- function num : 0_5 , upvalues : housing, CURRENT_HOUSEACTOR_IS_FIXED
  (housing._staticBackInstallations):SetShow(isShow)
  if not CURRENT_HOUSEACTOR_IS_FIXED then
    isShow = false
  end
  ;
  (housing._staticCheckBack):SetShow(isShow)
end

housing.ShowFloorStatic = function(self, isShow)
  -- function num : 0_6 , upvalues : housing
  if isShow == false then
    (housing._staticBackFloor):SetShow(false)
    return 
  end
  local numFloor = housing_getHouseFloorCount()
  if numFloor <= 1 then
    (housing._staticBackFloor):SetShow(false)
    return 
  end
  ;
  (housing._staticBackFloor):SetShow(true)
  local sizeY = 0
  if numFloor <= 2 then
    (housing._radioBtnFirstFloor):SetShow(true)
    ;
    (housing._radioBtnSecondFloor):SetShow(true)
    ;
    (housing._radioBtnThirdFloor):SetShow(false)
    sizeY = 90
  else
    if numFloor <= 3 then
      (housing._radioBtnFirstFloor):SetShow(true)
      ;
      (housing._radioBtnSecondFloor):SetShow(true)
      ;
      (housing._radioBtnThirdFloor):SetShow(true)
      sizeY = 115
    end
  end
  ;
  (housing._staticBackFloor):SetSize((housing._staticBackFloor):GetSizeX(), sizeY)
  local curFloor = housing_getHouseFloorSelfPlayerBeing()
  if curFloor == 0 then
    (housing._radioBtnFirstFloor):SetCheck(true)
  else
    if curFloor == 1 then
      (housing._radioBtnSecondFloor):SetCheck(true)
    else
      if curFloor == 2 then
        (housing._radioBtnThirdFloor):SetCheck(true)
      end
    end
  end
end

Panel_Housing_IsShow_InstalledObject = function()
  -- function num : 0_7 , upvalues : housing
  if (housing._btnCheckIsShowInstalledObject):IsCheck() then
    (housing._btnDeleteAllObject):SetShow(true)
  else
    ;
    (housing._btnDeleteAllObject):SetShow(false)
  end
  return (housing._btnCheckIsShowInstalledObject):IsCheck()
end

Panel_Housing_Mode_Click = function()
  -- function num : 0_8 , upvalues : housing
  if not IsSelfPlayerWaitAction() and not IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_ONLYWAITSTENCE"))
    return 
  end
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_GOTO_NEAR_HOUSEHOLD"))
    return 
  end
  if not ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isFixedHouse() then
    local houseInstallationMode = ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isInnRoom()
  end
  if houseInstallationMode == true then
    audioPostEvent_SystemUi(1, 32)
  else
    audioPostEvent_SystemUi(1, 32)
  end
  if housing._isShow == false then
    local rv = housing_changeHousingMode(true, housing._isMyHouse)
    FGlobal_House_InstallationMode_Open()
  else
    do
      housing_changeHousingMode(false, housing._isMyHouse)
      FGlobal_House_InstallationMode_Close()
      if houseInstallationMode == false then
        FGlobal_FarmGuide_Open()
      else
        FGlobal_FarmGuide_Close()
      end
    end
  end
end

Panel_Housing_ObjectRotation_Click = function(rotateType)
  -- function num : 0_9
  housing_rotateObject(rotateType)
end

Panel_Housing_CameraRotationLeft_Click = function()
  -- function num : 0_10
  local xDegree = -0.5
  local yDegree = 0
  housing_rotateCamera(xDegree, yDegree)
end

Panel_Housing_CameraRotationRight_Click = function()
  -- function num : 0_11
  local xDegree = 0.5
  local yDegree = 0
  housing_rotateCamera(xDegree, yDegree)
end

Panel_Housing_ObjectTranslation_Click = function()
  -- function num : 0_12 , upvalues : housing
  if housing_isInstallMode() then
    local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
    if characterStaticWrapper ~= nil then
      local isHarvest = (characterStaticWrapper:getObjectStaticStatus()):isHarvest()
      if isHarvest == true then
        audioPostEvent_SystemUi(12, 13)
      else
        audioPostEvent_SystemUi(12, 17)
      end
    end
  end
  do
    housing_moveObject()
    housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
  end
end

Panel_Housing_ObjectFixing_Click = function()
  -- function num : 0_13 , upvalues : housing
  if housing_isInstallMode() then
    local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
    if characterStaticWrapper ~= nil then
      local isHarvest = (characterStaticWrapper:getObjectStaticStatus()):isHarvest()
      if isHarvest == true then
        audioPostEvent_SystemUi(12, 15)
      else
        audioPostEvent_SystemUi(12, 19)
        local itemEnchantStatic = (characterStaticWrapper:get()):getItemEnchantStatic()
        if itemEnchantStatic ~= nil then
          local itemKey = (itemEnchantStatic._key):getItemKey()
          FGlobal_MiniGame_RequestEditingHouse(itemKey)
        end
      end
    end
  end
  do
    local installationType = (CppEnums.InstallationType).TypeCount
    if housing_isInstallMode() then
      local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
      if characterStaticWrapper ~= nil then
        installationType = (characterStaticWrapper:getObjectStaticStatus()):getInstallationType()
        if installationType == (CppEnums.InstallationType).eType_WallPaper or installationType == (CppEnums.InstallationType).eType_FloorMaterial then
          local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_TITLE_WALLPAPERDONTCANCLE")
          local contentString = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_MEMO_WALLPAPERDONTCANCLE")
          local messageboxData = {title = titleString, content = contentString, functionYes = Panel_Housing_FixFloorMaterial_InteractionFromMessageBox, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
          return 
        end
      end
    else
      do
        Panel_Housing_FixTent_InteractionFromMessageBox()
        local rv = housing_InstallObject()
        if rv == 0 then
          if housing_isInstallMode() then
            housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
          else
            Event_Housing_ShowHousingModeUI(false)
          end
        end
      end
    end
  end
end

Panel_Housing_FixTent_InteractionFromMessageBox = function()
  -- function num : 0_14
  local rv = housing_InstallObject()
  if rv == 0 then
    Event_Housing_ShowHousingModeUI(false)
  end
end

Panel_Housing_FixFloorMaterial_InteractionFromMessageBox = function()
  -- function num : 0_15 , upvalues : housing
  local rv = housing_InstallObject()
  if rv == 0 and housing_isInstallMode() then
    housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
  end
end

Panel_Housing_ObjectDelete_Click = function()
  -- function num : 0_16 , upvalues : housing
  local checkEquip = housing_isEquipObject()
  do
    if checkEquip then
      local errorString = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_EQUIP_DELETE")
      Event_MessageBox_NotifyMessage(errorString)
      return 
    end
    if Panel_Housing_IsShow_InstalledObject() then
      local houseWrapper = housing_getHouseholdActor_CurrentPosition()
      if houseWrapper == nil then
        _PA_ASSERT(false, "housing_getHouseholdActor_CurrentPosition()�\128 nullptr 이면 안됩니다.")
        return 
      end
      local actorKeyRaw = houseWrapper:getInstallationActorKeyRaw(housing._selectIndexForInstalledObjectList)
      local installationActorWrapper = getInstallationActor(actorKeyRaw)
      if installationActorWrapper ~= nil then
        local cssWrapper = installationActorWrapper:getStaticStatusWrapper()
        local contentString = ""
        local installationType = (cssWrapper:getObjectStaticStatus()):getInstallationType()
        if installationType == (CppEnums.InstallationType).eType_WallPaper or installationType == (CppEnums.InstallationType).eType_FloorMaterial then
          contentString = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_DELETE_MEMO_WALLPAPERDONTCANCLE")
        else
          contentString = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_DELETE_MESSAGEBOX_MEMO")
        end
        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_OBJECTDELETE"), content = contentString, functionYes = Panel_Housing_DeleteObject_InteractionFromMessageBox, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
      end
    else
      do
        local contentString = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_DELETE_MESSAGEBOX_MEMO")
        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_DELETE_MESSAGEBOX_TITLE"), content = contentString, functionYes = Panel_Housing_DeleteObject_InteractionFromMessageBox, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
        do return  end
      end
    end
  end
end

Panel_Housing_ObjectCancel_Click = function()
  -- function num : 0_17 , upvalues : housing
  housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
  if housing_isInstallMode() and housing_isTemporaryObject() then
    housing_CancelInstallObject()
  end
  Event_Housing_ShowHousingModeUI(false)
  housing_CancelBuildTent()
end

Panel_Housing_DeleteObject_InteractionFromMessageBox = function()
  -- function num : 0_18 , upvalues : housing
  if housing_isInstallMode() then
    local characterStaticWrapper = housing_getCreatedCharacterStaticWrapper()
    if characterStaticWrapper ~= nil then
      local isHarvest = (characterStaticWrapper:getObjectStaticStatus()):isHarvest()
      if isHarvest == true then
        audioPostEvent_SystemUi(12, 14)
      else
        audioPostEvent_SystemUi(12, 18)
      end
    end
  end
  do
    if Panel_Housing_IsShow_InstalledObject() then
      housing_deleteObject_InstalledObjectList(housing._selectIndexForInstalledObjectList)
    else
      housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
      housing_deleteObject()
    end
  end
end

Panel_Housing_CancelBuildTent_InteractionFromMessageBox = function()
  -- function num : 0_19
  Event_Housing_ShowHousingModeUI(false)
  housing_CancelBuildTent()
end

Panel_Housing_CancelInstallObject_InteractionFromMessageBox = function()
  -- function num : 0_20 , upvalues : housing
  housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
  housing_CancelInstallObject()
end

Panel_Housing_CancelInstallMode_InteractionFromMessageBox = function()
  -- function num : 0_21
  Event_Housing_ShowHousingModeUI(false)
  housing_changeHousingMode(false)
end

Panel_Housing_BuildTent_InteractionFromMessageBox = function()
  -- function num : 0_22
  Panel_House_ObjectControl_Confirm()
end

Panel_Housing_IsMode = function()
  -- function num : 0_23 , upvalues : housing
  return housing._isShow
end

MessageBox_Housing_Default_Cancel_function = function()
  -- function num : 0_24
  if housing_isInstallMode() and housing_isTemporaryObject() then
    housing_moveObject()
  end
  housing_moveObject()
end

Event_Housing_HousingMode = function(isShow, isMyHouse)
  -- function num : 0_25 , upvalues : housing
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  housing._isMyHouse = isMyHouse
  _PA_LOG("유흥�\160", "Event_Housing_HousingMode " .. tostring(isMyHouse))
  Panel_Housing_Mode_Click()
end

Event_Housing_ShowHousingModeUI = function(isShow)
  -- function num : 0_26 , upvalues : housing
  toClient_FadeIn(0.3)
  if isShow == true then
    ToClient_SaveUiInfo(false)
    SetUIMode((Defines.UIMode).eUIMode_Housing)
    crossHair_SetShow(false)
    setShowLine(false)
  else
    SetUIMode((Defines.UIMode).eUIMode_Default)
    crossHair_SetShow(true)
    setShowLine(true)
    InventoryWindow_Close()
    HandleClicked_HouseInstallation_Exit_DO()
  end
  housing:ShowMode(isShow)
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

  housing._isShow = isShow
end

Event_Housing_ShowShowInstallationMenu = function(installMode, isShow, isShowMove, isShowFix, isShowDelete, isShowCancel)
  -- function num : 0_27 , upvalues : housing
  local posX = housing_getInstallationMenuPosX()
  local posY = housing_getInstallationMenuPosY()
  local isHarvest = housing_hasInstallationMenuHarvestTime()
  housing:ShowInstallationMenu(isShow, posX, posY, isHarvest, isShowMove, isShowFix, isShowDelete, isShowCancel)
end

Event_HousingCancelBuildTentMessageBox = function()
  -- function num : 0_28 , upvalues : housing
  housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "TENT_BUILD_CANCEL_MESSAGEBOX_MEMO")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "TENT_BUILD_CANCEL_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = Panel_Housing_CancelBuildTent_InteractionFromMessageBox, functionCancel = MessageBox_Housing_Default_Cancel_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  local isExist = (MessageBox.doHaveMessageBoxData)(messageboxData.title)
  if isExist == false then
    (MessageBox.showMessageBox)(messageboxData)
  end
end

Event_HousingCancelInstallObjectMessageBox = function()
  -- function num : 0_29 , upvalues : housing
  housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
end

Event_HousingBuildTentMessageBox = function()
  -- function num : 0_30 , upvalues : housing
  if Panel_House_InstallationMode_VillageTent:GetShow() then
    return 
  end
  housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "TENT_BUILD_MESSAGEBOX_MEMO")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "TENT_BUILD_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = Panel_Housing_BuildTent_InteractionFromMessageBox, functionCancel = MessageBox_Housing_Default_Cancel_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  local isExist = (MessageBox.doHaveMessageBoxData)(messageboxData.title)
  if isExist == false then
    (MessageBox.showMessageBox)(messageboxData)
  end
end

Event_HousingCancelInstallModeMessageBox = function()
  -- function num : 0_31 , upvalues : IM, housing
  audioPostEvent_SystemUi(1, 33)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_MODE_EXIT_MESSAGEBOX_MEMO")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "INSTALLATION_MODE_EXIT_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = Panel_Housing_CancelInstallMode_InteractionFromMessageBox, functionCancel = MessageBox_Housing_Default_Cancel_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  local isExist = (MessageBox.doHaveMessageBoxData)(messageboxData.title)
  if isExist == false then
    (MessageBox.showMessageBox)(messageboxData)
  end
end

Event_Housing_UpdateInstallationEquip = function()
  -- function num : 0_32
end

Event_Housing_UpdateInstallationSlots = function()
  -- function num : 0_33 , upvalues : housing
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
end

Event_Housing_UpdateInstallationActor = function(isAdd)
  -- function num : 0_34 , upvalues : housing
  housing:updateInstallableCount()
end

Event_HousingOnScreenResize = function()
  -- function num : 0_35 , upvalues : housing
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  Panel_Housing:SetSize(sizeX, sizeY)
  ;
  (housing._btnHousingMode):ComputePos()
  ;
  (housing._btnObjectMove):ComputePos()
  ;
  (housing._btnObjectFix):ComputePos()
  ;
  (housing._btnObjectDelete):ComputePos()
  ;
  (housing._btnObjectCancel):ComputePos()
  ;
  (housing._helpImage):SetPosX(getScreenSizeX() / 2 - (housing._helpImage):GetSizeX() / 2 - (housing._staticBackInstallations):GetSizeX() / 2)
  ;
  (housing._btnCheckIsShowInstalledObject):SetPosX((housing._staticCheckBack):GetPosX() + 30)
  ;
  (housing._btnCheckIsShowInstalledObject):SetPosY((housing._staticCheckBack):GetPosY() + (housing._staticCheckBack):GetSizeY() + 105)
  ;
  (housing._btnDeleteAllObject):SetPosX((housing._btnCheckIsShowInstalledObject):GetPosX())
  ;
  (housing._btnDeleteAllObject):SetPosY((housing._btnCheckIsShowInstalledObject):GetPosY() + 20)
  ;
  (housing._helpTxtMove):SetPosX((housing._helpImage):GetPosX() + 20)
  ;
  (housing._helpTxtRotate):SetPosX((housing._helpImage):GetPosX() + 88)
  ;
  (housing._helpTxtZoom):SetPosX((housing._helpImage):GetPosX() + 164)
  ;
  (housing._helpTxtMove):SetPosY((housing._helpImage):GetPosY() + 7)
  ;
  (housing._helpTxtRotate):SetPosY((housing._helpImage):GetPosY() + 7)
  ;
  (housing._helpTxtZoom):SetPosY((housing._helpImage):GetPosY() + 7)
  local templateStaticBackSlot = (UI.getChildControl)(Panel_Housing, "Static_BackSlot")
  local slotSizeY = templateStaticBackSlot:GetSizeY() + 10
  local slotCount = (math.floor)(sizeY / slotSizeY)
  -- DECOMPILER ERROR at PC161: Confused about usage of register: R5 in 'UnsetPending'

  if housing._maxInstallationSlotCount < slotCount then
    housing._installationSlotShowCount = housing._maxInstallationSlotCount
  else
    -- DECOMPILER ERROR at PC164: Confused about usage of register: R5 in 'UnsetPending'

    housing._installationSlotShowCount = slotCount
  end
  ;
  (housing._staticBackInstallations):SetSize((housing._staticBackInstallations):GetSizeX(), sizeY - 25)
  ;
  (housing._staticBackInstallations):ComputePos()
  local slotPosX = (housing._staticBackInstallations):GetPosX() + 23
  local slotStartPosY = (sizeY - slotSizeY * slotCount) / 2
  for ii = 0, housing._maxInstallationSlotCount - 1 do
    local slot = (housing._installationSlots)[ii]
    local tempY = slotSizeY * ii + slotStartPosY
    ;
    (slot._staticBackSlot):SetPosY(tempY - 10)
    if ii <= housing._installationSlotShowCount - 1 then
      (slot._staticBackSlot):SetShow(true)
    else
      ;
      (slot._staticBackSlot):SetShow(false)
    end
  end
  local panelSize = (housing._btnCheckAll):GetSizeY() + (housing._btnCheckBottom):GetSizeY() + (housing._btnCheckWall):GetSizeY() + (housing._btnCheckTable):GetSizeY() + (housing._btnCheckTop):GetSizeY() + (housing._btnCheckWallPaper):GetSizeY() + (housing._btnCheckWallPaper):GetSizeY() + (housing._btnCheckCapet):GetSizeY() + 65 - ((housing._btnCheckWallPaper):GetSizeY() * 2 + 5)
  ;
  (housing._staticCheckBack):SetShow(true)
  ;
  (housing._staticCheckBack):SetSize(220, panelSize)
  ;
  (housing._staticCheckBack):SetPosX(sizeX - 420)
  ;
  (housing._staticCheckBack):SetPosY(0)
  ;
  (housing._staticCheckBlackBG):SetSize((housing._staticCheckBack):GetSizeX() - ((housing._staticCheckBlackBG):GetSpanSize()).x - 7, (housing._staticCheckBack):GetSizeY() - ((housing._staticCheckBlackBG):GetSpanSize()).y - 7)
  ;
  (housing._btnCheckAll):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckAll):GetSizeX() / 2)
  ;
  (housing._btnCheckBottom):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckBottom):GetSizeX() / 2)
  ;
  (housing._btnCheckWall):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckWall):GetSizeX() / 2)
  ;
  (housing._btnCheckTable):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckTable):GetSizeX() / 2)
  ;
  (housing._btnCheckTop):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckTop):GetSizeX() / 2)
  ;
  (housing._btnCheckCurtain):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckCurtain):GetSizeX() / 2)
  ;
  (housing._btnCheckWallPaper):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckWallPaper):GetSizeX() / 2)
  ;
  (housing._btnCheckCapet):SetPosX((housing._staticCheckBack):GetSizeX() / 2 - (housing._btnCheckCapet):GetSizeX() / 2)
  ;
  (housing._staticTextInstalledTentCount):ComputePos()
  ;
  (housing._staticTextInstalledTentCount):SetPosX(sizeX - 380)
  ;
  (housing._staticTextMaxTentCount):ComputePos()
  ;
  (housing._staticTextMaxTentCount):SetPosX(sizeX - 380)
end

Panel_Housing_Update_ShowingInstallationList = function()
  -- function num : 0_36 , upvalues : housing, UI_color
  local isCheckFloor = (housing._btnCheckBottom):IsCheck()
  local isCheckWall = (housing._btnCheckWall):IsCheck()
  local isCheckTable = (housing._btnCheckTable):IsCheck()
  local isCheckTop = (housing._btnCheckTop):IsCheck()
  local isCheckCurtain = (housing._btnCheckCurtain):IsCheck()
  local isCheckWallPaper = (housing._btnCheckWallPaper):IsCheck()
  local isCheckCapet = (housing._btnCheckCapet):IsCheck()
  local isAll = (not isCheckFloor and not isCheckWall and not isCheckTable and not isCheckTop and not isCheckCurtain and not isCheckWallPaper and not isCheckCapet and (housing._btnCheckAll):IsCheck())
  if isCheckFloor then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FF888888)
  elseif isCheckWall then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FF888888)
  elseif isCheckTable then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FF888888)
  elseif isCheckTop then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FF888888)
  elseif isCheckCurtain then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FF888888)
  elseif isCheckWallPaper then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FF888888)
  elseif isCheckCapet then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FFFFFFFF)
  elseif isAll then
    (housing._btnCheckBottom):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWall):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckTable):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckAll):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (housing._btnCheckTop):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCurtain):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckWallPaper):SetFontColor(UI_color.C_FF888888)
    ;
    (housing._btnCheckCapet):SetFontColor(UI_color.C_FF888888)
  end
  do
    local isShowInstalledObject = Panel_Housing_IsShow_InstalledObject()
    if isShowInstalledObject then
      Panel_Housing_Update_ShowingInstallationList_Sub_2()
    else
      Panel_Housing_Update_ShowingInstallationList_Sub_1()
    end
    -- DECOMPILER ERROR: 12 unprocessed JMP targets
  end
end

Panel_Housing_Update_ShowingInstallationList_Sub_1 = function()
  -- function num : 0_37 , upvalues : housing, CURRENT_SHOWING_INSTALLATIONLIST, CURRENT_HOUSEACTOR_IS_FIXED, CURRENT_SHOWING_INSTALLATION_COUNT
  local isCheckFloor = (housing._btnCheckBottom):IsCheck()
  local isCheckWall = (housing._btnCheckWall):IsCheck()
  local isCheckTable = (housing._btnCheckTable):IsCheck()
  local isCheckTop = (housing._btnCheckTop):IsCheck()
  local isCheckCurtain = (housing._btnCheckCurtain):IsCheck()
  local isCheckWallPaper = (housing._btnCheckWallPaper):IsCheck()
  local isCheckCapet = (housing._btnCheckCapet):IsCheck()
  local isAll = (not isCheckFloor and not isCheckWall and not isCheckTable and not isCheckTop and not isCheckWallPaper and not isCheckCapet and (housing._btnCheckAll):IsCheck())
  CURRENT_SHOWING_INSTALLATIONLIST = nil
  CURRENT_SHOWING_INSTALLATIONLIST = {}
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local invenSize = inventory:size()
  local loop = invenSize - 1
  do
    local count = 0
    for ii = 0, loop do
      local itemWrapper = getInventoryItem(ii)
      if itemWrapper ~= nil and ((itemWrapper:getStaticStatus()):get()):isItemInstallation() then
        if isCheckFloor then
          local isFloor = (((itemWrapper:getStaticStatus()):getCharacterStaticStatus()):getObjectStaticStatus()):isInstallableOnFloor()
        end
        if isCheckWall then
          local isWall = (((itemWrapper:getStaticStatus()):getCharacterStaticStatus()):getObjectStaticStatus()):isInstallableOnWall()
        end
        if isCheckTable then
          local isTable = (((itemWrapper:getStaticStatus()):getCharacterStaticStatus()):getObjectStaticStatus()):isInstallableOnTheTable()
        end
        local isAdd = true
        local objectSSW = ((itemWrapper:getStaticStatus()):getCharacterStaticStatus()):getObjectStaticStatus()
        if objectSSW:isHarvest() ~= false or (CppEnums.InstallationType).eType_Scarecrow == objectSSW:getInstallationType() or (CppEnums.InstallationType).eType_Waterway == objectSSW:getInstallationType() then
          isAdd = not CURRENT_HOUSEACTOR_IS_FIXED
          isAdd = objectSSW:isHarvest() == true or (CppEnums.InstallationType).eType_Scarecrow == objectSSW:getInstallationType() or (CppEnums.InstallationType).eType_Waterway == objectSSW:getInstallationType()
          do
            if isAdd and (isAll or isFloor or isWall or isTable) then
              local tempItem = {}
              tempItem._slotNo = ii
              tempItem._name = tostring((itemWrapper:getStaticStatus()):getName())
              tempItem._imgPath = tostring((((itemWrapper:getStaticStatus()):getCharacterStaticStatus()):getObjectStaticStatus()):getHouseScreenShotPath(0))
              -- DECOMPILER ERROR at PC191: Confused about usage of register: R23 in 'UnsetPending'

              CURRENT_SHOWING_INSTALLATIONLIST[count] = tempItem
              count = count + 1
            end
            -- DECOMPILER ERROR at PC193: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC193: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC193: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC193: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    CURRENT_SHOWING_INSTALLATION_COUNT = count
    -- DECOMPILER ERROR: 12 unprocessed JMP targets
  end
end

Panel_Housing_Update_ShowingInstallationList_Sub_2 = function()
  -- function num : 0_38 , upvalues : housing, CURRENT_SHOWING_INSTALLATIONLIST, CURRENT_HOUSEACTOR_IS_FIXED, CURRENT_SHOWING_INSTALLATION_COUNT
  local isCheckFloor = (housing._btnCheckBottom):IsCheck()
  local isCheckWall = (housing._btnCheckWall):IsCheck()
  local isCheckTable = (housing._btnCheckTable):IsCheck()
  local isCheckTop = (housing._btnCheckTop):IsCheck()
  local isCheckCurtain = (housing._btnCheckCurtain):IsCheck()
  local isCheckWallPaper = (housing._btnCheckWallPaper):IsCheck()
  local isCheckCapet = (housing._btnCheckCapet):IsCheck()
  local isAll = (not isCheckFloor and not isCheckWall and not isCheckTable and not isCheckTop and not isCheckCurtain and not isCheckWallPaper and not isCheckCapet and (housing._btnCheckAll):IsCheck())
  CURRENT_SHOWING_INSTALLATIONLIST = nil
  CURRENT_SHOWING_INSTALLATIONLIST = {}
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    _PA_ASSERT(false, "housing_getHouseholdActor_CurrentPosition()�\128 nullptr 이면 안됩니다.")
    return 
  end
  local loop = houseWrapper:getInstallationCount()
  do
    local count = 0
    for ii = 0, loop do
      local actorKeyRaw = houseWrapper:getInstallationActorKeyRaw(ii)
      local installationActorWrapper = getInstallationActor(actorKeyRaw)
      if installationActorWrapper ~= nil then
        local cssWrapper = installationActorWrapper:getStaticStatusWrapper()
        if isCheckFloor then
          local isFloor = (cssWrapper:getObjectStaticStatus()):isInstallableOnFloor()
        end
        if isCheckWall then
          local isWall = (cssWrapper:getObjectStaticStatus()):isInstallableOnWall()
        end
        if isCheckTable then
          local isTable = (cssWrapper:getObjectStaticStatus()):isInstallableOnTheTable()
        end
        local isAdd = false
        if (cssWrapper:getObjectStaticStatus()):isHarvest() ~= false then
          isAdd = not CURRENT_HOUSEACTOR_IS_FIXED
          isAdd = (cssWrapper:getObjectStaticStatus()):isHarvest() == true
          do
            if isAdd and (isAll or isFloor or isWall or isTable) then
              local tempItem = {}
              tempItem._slotNo = CppEnums.TInventorySlotNoUndefined
              tempItem._name = tostring(cssWrapper:getName())
              tempItem._imgPath = tostring((cssWrapper:getObjectStaticStatus()):getHouseScreenShotPath(0))
              -- DECOMPILER ERROR at PC146: Confused about usage of register: R23 in 'UnsetPending'

              CURRENT_SHOWING_INSTALLATIONLIST[count] = tempItem
              count = count + 1
            end
            -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    CURRENT_SHOWING_INSTALLATION_COUNT = count
    -- DECOMPILER ERROR: 12 unprocessed JMP targets
  end
end

Panel_Housing_Update_installationSlots = function()
  -- function num : 0_39 , upvalues : housing, CURRENT_SHOWING_INSTALLATIONLIST
  if housing_isInstallMode() == false then
    return 
  end
  for idx = 0, housing._installationSlotShowCount - 1 do
    local slot = (housing._installationSlots)[idx]
    ;
    (slot._staticImgSlot):SetShow(false)
    slot._invenSlotNo = nil
  end
  local slotIndex = 0
  for start = 0, housing._installationSlotShowCount - 1 do
    local slot = (housing._installationSlots)[slotIndex]
    if slot == nil then
      local itemIndex = housing._installationStartIndex + start
      do
        local installationItem = CURRENT_SHOWING_INSTALLATIONLIST[itemIndex]
        if installationItem ~= nil then
          if installationItem._imgPath ~= nil then
            if (string.len)(installationItem._imgPath) > 0 then
              (slot._staticImgSlot):ChangeTextureInfoName(installationItem._imgPath)
            else
              ;
              (slot._staticImgSlot):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Housing/Object_NoImage.dds")
            end
          end
          ;
          (slot._staticImgSlot):SetShow(true)
          slot._invenSlotNo = installationItem._slotNo
          slot._name = installationItem._name
          slotIndex = slotIndex + 1
        end
        -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC67: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end

Panel_Housing_installationSlot_MouseLUp = function(index)
  -- function num : 0_40 , upvalues : housing, CURRENT_HOUSEACTOR_IS_FIXED
  local slot = (housing._installationSlots)[index]
  local iconPosX = (slot._staticImgSlot):GetPosX() + (slot._staticBackSlot):GetPosX() + (housing._staticBackInstallations):GetPosX() - 5
  local iconPosY = (slot._staticImgSlot):GetPosY() + (slot._staticBackSlot):GetPosY() + (housing._staticBackInstallations):GetPosY() - 5
  audioPostEvent_SystemUi(0, 0)
  if slot ~= nil then
    if (slot._staticImgSlot):GetShow() then
      (housing._staticSlotFront):SetShow(true)
      ;
      (housing._staticSlotFront):ResetVertexAni()
      ;
      (housing._staticSlotFront):SetVertexAniRun("Ani_Color_CursorAni", true)
      ;
      (housing._staticSlotFront):SetPosX(iconPosX)
      ;
      (housing._staticSlotFront):SetPosY(iconPosY)
      ;
      (housing._staticSlotBorder):SetShow(true)
      ;
      (housing._staticSlotBorder):ResetVertexAni()
      ;
      (housing._staticSlotBorder):SetVertexAniRun("Ani_Color_BorderAni", true)
      ;
      (housing._staticSlotBorder):SetPosX(iconPosX - 21)
      ;
      (housing._staticSlotBorder):SetPosY(iconPosY - 21)
    end
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

    if Panel_Housing_IsShow_InstalledObject() then
      housing._selectIndexForInstalledObjectList = housing._installationStartIndex + index
      Panel_Housing_ObjectDelete_Click()
    else
      if slot._invenSlotNo ~= nil then
        if CURRENT_HOUSEACTOR_IS_FIXED then
          housing_selectInstallationItem(0, slot._invenSlotNo)
        else
          local houseActorWrapper = housing_getHouseholdActor_CurrentPosition()
          local css = (houseActorWrapper:getStaticStatusWrapper()):get()
          local max = css:getInstallationMaxCount()
          local now = (houseActorWrapper:get()):getInstallationCount()
          if now < max then
            housing_selectInstallationItem(0, slot._invenSlotNo)
          else
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_NOMOREHARVEST"))
          end
        end
      end
    end
  end
end

Panel_Housing_Static_Back_Installations_ScrollUp = function()
  -- function num : 0_41 , upvalues : CURRENT_SHOWING_INSTALLATION_COUNT, housing
  local installationCount = CURRENT_SHOWING_INSTALLATION_COUNT
  if installationCount <= housing._installationSlotShowCount then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  housing._installationStartIndex = housing._installationStartIndex - 1
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  if housing._installationStartIndex < 0 then
    housing._installationStartIndex = 0
  end
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  housing_CancelInstallObject()
  Panel_Housing_Update_installationSlots()
end

Panel_Housing_Static_Back_Installations_ScrollDown = function()
  -- function num : 0_42 , upvalues : CURRENT_SHOWING_INSTALLATION_COUNT, housing
  local installationCount = CURRENT_SHOWING_INSTALLATION_COUNT
  if installationCount <= housing._installationSlotShowCount then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  housing._installationStartIndex = housing._installationStartIndex + 1
  local lastIndex = housing._installationStartIndex + housing._installationSlotShowCount
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

  if installationCount < lastIndex then
    housing._installationStartIndex = installationCount - housing._installationSlotShowCount
  end
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  housing_CancelInstallObject()
  Panel_Housing_Update_installationSlots()
end

Panel_Housing_CheckRotateObject_MouseLUp = function()
  -- function num : 0_43 , upvalues : housing
  local isCheck = (housing._btnCheckRotate):IsCheck()
  housing_setRestrictedRatateObject(isCheck)
end

Panel_Housing_CheckAll_MouseLUp = function()
  -- function num : 0_44 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckBottom_MouseLUp = function()
  -- function num : 0_45 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckWall_MouseLUp = function()
  -- function num : 0_46 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckOut_MouseLUp = function()
  -- function num : 0_47 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckTop_MouseLUp = function()
  -- function num : 0_48 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckCurtain_MouseLUp = function()
  -- function num : 0_49 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckWallPaper_MouseLUp = function()
  -- function num : 0_50 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckCapet_MouseLUp = function()
  -- function num : 0_51 , upvalues : housing
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
  ;
  (housing._staticSlotFront):SetShow(false)
  ;
  (housing._staticSlotBorder):SetShow(false)
  ;
  (housing._staticSlotArrow):SetShow(false)
  if housing_isInstallMode() then
    housing_CancelInstallObject()
  end
end

Panel_Housing_CheckShowInstalledObject_MouseLUp = function()
  -- function num : 0_52
  if housing_isInstallMode() and housing_isTemporaryObject() then
    Panel_Housing_CancelInstallObject_InteractionFromMessageBox()
  end
  Panel_Housing_Update_ShowingInstallationList()
  Panel_Housing_Update_installationSlots()
end

Panel_Housing_CheckIsDeleteAllObject_MouseLUp = function()
  -- function num : 0_53 , upvalues : housing
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    return 
  end
  local installedCount = houseWrapper:getInstallationCount()
  local freeInventorySlot = (((getSelfPlayer()):get()):getInventory()):getFreeCount()
  local installed_Delete_All = function()
    -- function num : 0_53_0 , upvalues : installedCount, housing
    for i = 0, installedCount - 1 do
      local slot = (housing._installationSlots)[i]
      -- DECOMPILER ERROR at PC18: Confused about usage of register: R5 in 'UnsetPending'

      if slot ~= nil and Panel_Housing_IsShow_InstalledObject() then
        housing._selectIndexForInstalledObjectList = housing._installationStartIndex + i
        housing_deleteObject_InstalledObjectList(housing._selectIndexForInstalledObjectList)
      end
    end
  end

  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_1")
  local msgContent = ""
  if installedCount == 0 then
    msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_2")
    local messageboxData = {title = titleString, content = msgContent, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    return 
  else
    do
      if freeInventorySlot == 0 then
        msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_3")
        local messageboxData = {title = titleString, content = msgContent, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
        return 
      else
        do
          if freeInventorySlot < installedCount then
            msgContent = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_4", "InstalledCount", installedCount, "FreeInventorySlot", freeInventorySlot)
          else
            msgContent = installedCount .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_INSTALLMODE_WITHDRAW_5")
          end
          local messageboxData = {title = titleString, content = msgContent, functionYes = installed_Delete_All, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
        end
      end
    end
  end
end

Panel_Housing_FirstFloor_MouseLUp = function()
  -- function num : 0_54
  housing_selectHouseFloor(0)
end

Panel_Housing_SecondFloor_MouseLUp = function()
  -- function num : 0_55
  housing_selectHouseFloor(1)
end

Panel_Housing_ThirdFloor_MouseLUp = function()
  -- function num : 0_56
  housing_selectHouseFloor(2)
end

Panel_Housing_installationSlot_MouseOver = function(isOn, index)
  -- function num : 0_57 , upvalues : housing
  audioPostEvent_SystemUi(0, 4)
  if (housing._installationSlots)[index] == nil then
    return 
  end
  if Panel_Housing_IsShow_InstalledObject() then
    local slot = (housing._installationSlots)[index]
    Panel_Tooltip_Item_Show_GeneralNormal(index, "HousingMode", isOn, false)
  end
end

Panel_Housing_SlotNo = function(index)
  -- function num : 0_58 , upvalues : housing
  if (housing._installationSlots)[index] == nil then
    return -1
  end
  local slot = (housing._installationSlots)[index]
  return slot._invenSlotNo
end

Panel_Housing_UpdateObject_bySelectIndex = function()
  -- function num : 0_59 , upvalues : housing
  local index = housing._installationSelectIndex
  if (housing._installationSlots)[index] == nil then
    (housing._staticSlotFront):SetShow(false)
    ;
    (housing._staticSlotBorder):SetShow(false)
    ;
    (housing._staticSlotArrow):SetShow(false)
    return 
  end
  local slot = (housing._installationSlots)[index]
  ;
  (housing._staticSlotArrow):SetText(slot._name)
  housing_selectInstallationItem(0, slot._invenSlotNo)
end

FromClient_ChangeCurrentHousehold = function()
  -- function num : 0_60
  if Panel_House_InstallationMode:IsShow() == false then
    return 
  end
  Event_Housing_ShowHousingModeUI(false)
  housing_changeHousingMode(false)
end

registerEvent("EventHousingHousingMode", "Event_Housing_HousingMode")
registerEvent("EventHousingShowInstallationMenu", "Event_Housing_ShowShowInstallationMenu")
registerEvent("onScreenResize", "Event_HousingOnScreenResize")
registerEvent("EventHousingCancelBuildTentMessageBox", "Event_HousingCancelBuildTentMessageBox")
registerEvent("EventHousingCancelInstallObjectMessageBox", "Event_HousingCancelInstallObjectMessageBox")
registerEvent("EventHousingBuildTentMessageBox", "Event_HousingBuildTentMessageBox")
registerEvent("EventHousingInstallationEquip", "Event_Housing_UpdateInstallationEquip")
registerEvent("EventUpdateInstallationActor", "Event_Housing_UpdateInstallationActor")
registerEvent("FromClient_SetSelfTent", "Event_Housing_UpdateInstallationActor")
registerEvent("FromClient_ChangeCurrentHousehold", "FromClient_ChangeCurrentHousehold")
housing:Init()
housing:ShowMode(false)
housing:ShowInstallationMenu(false, 0, 0, false, false, false, false, false)

