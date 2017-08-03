-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\search\panel_dialog_search.luac 

-- params : ...
-- function num : 0
searchClearQuest = {}
checkClearSearchQuest = function(npcCharacterKey)
  -- function num : 0_0
  do return searchClearQuest[npcCharacterKey] ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local var_UI = {panel = Panel_Dialog_Search, title = (UI.getChildControl)(Panel_Dialog_Search, "StaticText_Search_Title"), btn_left = (UI.getChildControl)(Panel_Dialog_Search, "Button_Arrow_Left"), btn_right = (UI.getChildControl)(Panel_Dialog_Search, "Button_Arrow_Right"), btn_top = (UI.getChildControl)(Panel_Dialog_Search, "Button_Arrow_Top"), btn_bottom = (UI.getChildControl)(Panel_Dialog_Search, "Button_Arrow_Bottom"), btn_detail = (UI.getChildControl)(Panel_Dialog_Search, "Button_Detail"), btn_ZoomIn = (UI.getChildControl)(Panel_Dialog_Search, "Button_ZoomIn"), btn_ZoomOut = (UI.getChildControl)(Panel_Dialog_Search, "Button_ZoomOut"), StaticText_Q = (UI.getChildControl)(Panel_Dialog_Search, "StaticText_Q"), StaticText_W = (UI.getChildControl)(Panel_Dialog_Search, "StaticText_W"), StaticText_E = (UI.getChildControl)(Panel_Dialog_Search, "StaticText_E"), StaticText_A = (UI.getChildControl)(Panel_Dialog_Search, "StaticText_A"), StaticText_S = (UI.getChildControl)(Panel_Dialog_Search, "StaticText_S"), StaticText_D = (UI.getChildControl)(Panel_Dialog_Search, "StaticText_D")}
local variable = {isShow = false, directionIndex = 0, currentNpcCharacterKey = 0}
local additionYaw = 0
local additionPitch = 0
local yawValue = 0.02
local ptichValue = 0.02
local moveCameraDistance = 1000
local findCameraDistance = 0
local findCameraAngle = 0
local moveAbleAngleUp = 60
local moveAbleAngleDown = -40
local isShowSearchObject = false
searchView_Open = function()
  -- function num : 0_1 , upvalues : variable, isShowSearchObject, moveCameraDistance, findCameraDistance, findCameraAngle, moveAbleAngleUp, moveAbleAngleDown
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  variable.currentNpcCharacterKey = dialog_getTalkNpcKey()
  if variable.currentNpcCharacterKey == 0 then
    return 
  end
  if checkClearSearchQuest(variable.currentNpcCharacterKey) == true then
    return 
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  searchClearQuest[variable.currentNpcCharacterKey] = nil
  Panel_Dialog_Search:SetShow(true)
  isShowSearchObject = false
  setCutSceneCameraEditMode(true)
  openClientChangeScene(variable.currentNpcCharacterKey, 1)
  moveCameraDistance = search_initCameraDistance()
  findCameraDistance = search_conditionDistance()
  findCameraAngle = search_conditionAngle()
  moveAbleAngleUp = search_getMoveAbleAngleUp()
  moveAbleAngleDown = search_getMoveAbleAngleDown()
end

searchView_Close = function()
  -- function num : 0_2 , upvalues : additionYaw, additionPitch, moveAbleAngleUp, moveAbleAngleDown
  Panel_Dialog_Search:SetShow(false)
  additionYaw = 0
  search_additionYaw2(additionYaw)
  additionPitch = 0
  moveAbleAngleUp = 60
  moveAbleAngleDown = -40
  search_additionPitch2(additionPitch)
  setCutSceneCameraEditMode(false)
end

searchView_ScreenResize = function()
  -- function num : 0_3 , upvalues : var_UI
  (var_UI.panel):SetSize(getScreenSizeX(), getScreenSizeY())
  for _,v in pairs(var_UI) do
    v:ComputePos()
  end
end

local check_searchObject = function()
  -- function num : 0_4 , upvalues : variable, findCameraDistance, moveCameraDistance, isShowSearchObject, findCameraAngle
  if checkClearSearchQuest(variable.currentNpcCharacterKey) then
    return 
  end
  if findCameraDistance < moveCameraDistance then
    if isShowSearchObject == true then
      isShowSearchObject = false
      showSceneCharacter(1, false)
    end
    return 
  end
  local curCameraPosition = getCameraPosition()
  local objectPos = getSceneCharacterSpawnPosition(1)
  local objectLookPos = search_getObjectLookPos()
  local objectToDir = ((Util.Math).calculateDirection)(objectPos, objectLookPos)
  local cameraToObjectDir = ((Util.Math).calculateDirection)(objectPos, curCameraPosition)
  local calcDot = ((Util.Math).calculateDot)(cameraToObjectDir, objectToDir)
  local angle = (math.acos)(calcDot)
  local toDegree = angle * 180 / math.pi
  -- DECOMPILER ERROR at PC63: Unhandled construct in 'MakeBoolean' P1

  if toDegree < findCameraAngle and isShowSearchObject == false then
    showSceneCharacter(1, true)
    isShowSearchObject = true
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R8 in 'UnsetPending'

    if checkClearSearchQuest(variable.currentNpcCharacterKey) == false then
      searchClearQuest[variable.currentNpcCharacterKey] = true
      click_DialogSearchObject()
      ReqeustDialog_retryTalk()
      searchView_Close()
    end
  end
  if isShowSearchObject == true then
    isShowSearchObject = false
    showSceneCharacter(1, false)
  end
end

local isMoveAbleAngle = function()
  -- function num : 0_5
  local curCameraPosition = getCameraPosition()
  local objectPos = getSceneCharacterSpawnPosition(1)
  local objectLookPos = search_getObjectLookPos()
  local noYObjectPos = float3(objectPos.x, 0, objectPos.z)
  local noYCurCameraPos = float3(curCameraPosition.x, 0, curCameraPosition.z)
  local noYObjectToCameraDir = ((Util.Math).calculateDirection)(noYObjectPos, noYCurCameraPos)
  local ObjectTocameraDir = ((Util.Math).calculateDirection)(objectPos, curCameraPosition)
  local normalaCalc = ((Util.Math).calculateDot)(ObjectTocameraDir, noYObjectToCameraDir)
  local normalAngle = (math.acos)(normalaCalc)
  local normalToDegree = normalAngle * 180 / math.pi
  if curCameraPosition.y < objectPos.y then
    normalToDegree = -normalToDegree
  end
  return normalToDegree
end

searchView_PushLeft = function()
  -- function num : 0_6 , upvalues : variable, isMoveAbleAngle, additionYaw, ptichValue, check_searchObject
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  variable.directionIndex = 0
  local normalToDegree = isMoveAbleAngle()
  additionYaw = additionYaw + ptichValue
  search_additionYaw2(additionYaw)
  check_searchObject()
end

searchView_PushTop = function()
  -- function num : 0_7 , upvalues : variable, isMoveAbleAngle, moveAbleAngleUp, additionPitch, yawValue, check_searchObject
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  variable.directionIndex = 1
  local normalToDegree = isMoveAbleAngle()
  if normalToDegree < moveAbleAngleUp then
    if moveAbleAngleUp < normalToDegree then
      return 
    end
    additionPitch = additionPitch - yawValue
    search_additionPitch2(additionPitch)
  end
  check_searchObject()
end

searchView_PushRight = function()
  -- function num : 0_8 , upvalues : variable, isMoveAbleAngle, additionYaw, ptichValue, check_searchObject
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  variable.directionIndex = 2
  local normalToDegree = isMoveAbleAngle()
  additionYaw = additionYaw - ptichValue
  search_additionYaw2(additionYaw)
  check_searchObject()
end

searchView_PushBottom = function()
  -- function num : 0_9 , upvalues : variable, isMoveAbleAngle, moveAbleAngleDown, additionPitch, yawValue, check_searchObject
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  variable.directionIndex = 3
  local normalToDegree = isMoveAbleAngle()
  if moveAbleAngleDown + 5 < normalToDegree then
    if normalToDegree < moveAbleAngleDown then
      return 
    end
    additionPitch = additionPitch + yawValue
    search_additionPitch2(additionPitch)
  end
  check_searchObject()
end

searchView_Detail = function()
  -- function num : 0_10 , upvalues : moveCameraDistance, check_searchObject
  moveCameraDistance = moveCameraDistance - 10
  search_LookAtPosDistance(moveCameraDistance)
  check_searchObject()
end

searchView_ZoomIn = function()
  -- function num : 0_11 , upvalues : moveCameraDistance, check_searchObject
  if moveCameraDistance > 300 then
    moveCameraDistance = moveCameraDistance - 10
    search_LookAtPosDistance(moveCameraDistance)
  end
  check_searchObject()
end

searchView_ZoomOut = function()
  -- function num : 0_12 , upvalues : moveCameraDistance, check_searchObject
  if moveCameraDistance < 1200 then
    moveCameraDistance = moveCameraDistance + 10
    search_LookAtPosDistance(moveCameraDistance)
  end
  check_searchObject()
end

searchViewMode_ShowToggle = function(isShow)
  -- function num : 0_13 , upvalues : variable, var_UI
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  if isShow == nil then
    variable.isShow = not variable.isShow
  else
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

    variable.isShow = isShow
  end
  if variable.isShow then
    (var_UI.panel):SetShow(true)
  end
end

local Alpha_Rate_Setting = function(alpha)
  -- function num : 0_14 , upvalues : var_UI
  for k,v in pairs(var_UI) do
    v:SetAlpha(alpha)
    if k ~= "panel" then
      v:SetFontAlpha(alpha)
    end
  end
end

local initialize = function()
  -- function num : 0_15 , upvalues : var_UI
  Panel_Dialog_Search:SetShow(false, false)
  searchView_ScreenResize()
  registerEvent("onScreenResize", "searchView_ScreenResize")
  registerEvent("EventQuestSearch", "searchView_Open")
  ;
  (var_UI.btn_detail):addInputEvent("Mouse_LPress", "searchView_Detail()")
  ;
  (var_UI.btn_left):addInputEvent("Mouse_LPress", "searchView_PushLeft()")
  ;
  (var_UI.btn_right):addInputEvent("Mouse_LPress", "searchView_PushRight()")
  ;
  (var_UI.btn_top):addInputEvent("Mouse_LPress", "searchView_PushTop()")
  ;
  (var_UI.btn_bottom):addInputEvent("Mouse_LPress", "searchView_PushBottom()")
  ;
  (var_UI.btn_ZoomIn):addInputEvent("Mouse_LPress", "searchView_ZoomIn()")
  ;
  (var_UI.btn_ZoomOut):addInputEvent("Mouse_LPress", "searchView_ZoomOut()")
end

initialize()

