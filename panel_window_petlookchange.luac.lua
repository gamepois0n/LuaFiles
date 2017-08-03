-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\petinfo\panel_window_petlookchange.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_Window_PetLookChange:SetShow(false)
Panel_Window_PetLookChange:setGlassBackground(true)
Panel_Window_PetLookChange:ActiveMouseEventEffect(true)
Panel_Window_PetLookChange:RegisterShowEventFunc(true, "PetLookChangeShowAni()")
Panel_Window_PetLookChange:RegisterShowEventFunc(false, "PetLookChangeHideAni()")
PetLookChangeShowAni = function()
  -- function num : 0_0
end

PetLookChangeHideAni = function()
  -- function num : 0_1
end

local petGeneral = {_btnClose = (UI.getChildControl)(Panel_Window_PetLookChange, "Button_Win_Close"), _btnQuestion = (UI.getChildControl)(Panel_Window_PetLookChange, "Button_Question"), _selectBg = (UI.getChildControl)(Panel_Window_PetLookChange, "Template_Static_ListContentSelectBG"), _scroll = (UI.getChildControl)(Panel_Window_PetLookChange, "Scroll_PetListNew"), _buttonClose = (UI.getChildControl)(Panel_Window_PetLookChange, "Button_Close"), _startIndex = 0, _selectedIndex = 0, _petCount = 0, 
_changableIndex = {}
}
petGeneral._scrollCtrBTN = (UI.getChildControl)(petGeneral._scroll, "Scroll_CtrlButton")
;
(petGeneral._scrollCtrBTN):addInputEvent("Mouse_LPress", "HandleClicked_PetLookChange_ScrollBtn()")
;
(petGeneral._scrollCtrBTN):addInputEvent("Mouse_DownScroll", "PetLookChange_ScrollEvent( false )")
;
(petGeneral._scrollCtrBTN):addInputEvent("Mouse_UpScroll", "PetLookChange_ScrollEvent( true )")
;
(petGeneral._scroll):addInputEvent("Mouse_DownScroll", "PetLookChange_ScrollEvent( false )")
;
(petGeneral._scroll):addInputEvent("Mouse_UpScroll", "PetLookChange_ScrollEvent( true )")
;
(petGeneral._scroll):addInputEvent("Mouse_LUp", "HandleClicked_PetLookChange_ScrollBtn()")
;
(petGeneral._btnQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Pet\" )")
;
(petGeneral._btnQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Pet\", \"true\")")
;
(petGeneral._btnQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Pet\", \"false\")")
petGeneral.registerEvent = function(self)
  -- function num : 0_2
  (self._btnClose):addInputEvent("Mouse_LUp", "Panel_Window_PetLookChange_Close()")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "Panel_Window_PetLookChange_Close()")
end

petGeneral:registerEvent()
local lookChange = {_petIcon = (UI.getChildControl)(Panel_Window_PetLookChange, "Static_IconPet"), _btnLeft = (UI.getChildControl)(Panel_Window_PetLookChange, "Button_Left"), _btnRight = (UI.getChildControl)(Panel_Window_PetLookChange, "Button_Right"), _btnChange = (UI.getChildControl)(Panel_Window_PetLookChange, "Button_Change"), _lookIndex = (UI.getChildControl)(Panel_Window_PetLookChange, "StaticText_LookIndex"), _currentIndex = 0}
local template = {_bg = (UI.getChildControl)(Panel_Window_PetLookChange, "Template_Static_ListContentBG"), _iconBg = (UI.getChildControl)(Panel_Window_PetLookChange, "Template_Static_IconPetBG"), _icon = (UI.getChildControl)(Panel_Window_PetLookChange, "Template_Static_IconPet"), _level = (UI.getChildControl)(Panel_Window_PetLookChange, "Template_StaticText_Level"), _name = (UI.getChildControl)(Panel_Window_PetLookChange, "Template_StaticText_PetName")}
for _,control in pairs(template) do
  control:SetShow(false)
end
local petList = {}
local maxSlot = 4
petList.Init = function(self)
  -- function num : 0_3 , upvalues : maxSlot, UI_PUCT, template, UI_TM, petList
  for index = 0, maxSlot - 1 do
    local temp = {}
    temp._bg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetLookChange, "Static_PetListBg_" .. index)
    CopyBaseProperty(template._bg, temp._bg)
    ;
    (temp._bg):SetPosY(50 + ((temp._bg):GetSizeY() + 5) * index)
    ;
    (temp._bg):SetShow(false)
    temp._iconBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, temp._bg, "Static_PetListIconBg_" .. index)
    CopyBaseProperty(template._iconBg, temp._iconBg)
    ;
    (temp._iconBg):SetPosX(5)
    ;
    (temp._iconBg):SetPosY(5)
    ;
    (temp._iconBg):SetShow(true)
    temp._icon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, temp._bg, "Static_PetListIcon_" .. index)
    CopyBaseProperty(template._icon, temp._icon)
    ;
    (temp._icon):SetPosX(5)
    ;
    (temp._icon):SetPosY(5)
    ;
    (temp._icon):SetShow(true)
    temp._level = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, temp._bg, "StaticText_PetListLevel_" .. index)
    CopyBaseProperty(template._level, temp._level)
    ;
    (temp._level):SetPosX(65)
    ;
    (temp._level):SetPosY(20)
    ;
    (temp._level):SetShow(true)
    temp._name = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, temp._bg, "StaticText_PetListName_" .. index)
    CopyBaseProperty(template._name, temp._name)
    ;
    (temp._name):SetPosX(105)
    ;
    (temp._name):SetPosY(20)
    ;
    (temp._name):SetTextMode(UI_TM.eTextMode_LimitText)
    ;
    (temp._name):SetShow(true)
    -- DECOMPILER ERROR at PC148: Confused about usage of register: R6 in 'UnsetPending'

    petList[index] = temp
  end
end

petLookChange_Update = function()
  -- function num : 0_4 , upvalues : petGeneral, maxSlot, petList
  if not Panel_Window_PetLookChange:GetShow() then
    return 
  end
  local sealPetCount = petGeneral._petCount
  for index = 0, maxSlot - 1 do
    if (petGeneral._changableIndex)[index] ~= nil then
      local petData = ToClient_getPetSealedDataByIndex((petGeneral._changableIndex)[index + petGeneral._startIndex])
      if petData ~= nil then
        local iconPath = petData:getIconPath()
        local petLevel = petData._level
        local petName = petData:getName()
        ;
        ((petList[index])._icon):ChangeTextureInfoName(iconPath)
        ;
        ((petList[index])._level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel)
        ;
        ((petList[index])._name):SetText(petName)
        if ((petList[index])._name):IsLimitText() then
          ((petList[index])._name):addInputEvent("Mouse_On", "PetLookChange_SimpleTooltip( true, " .. index .. ", " .. (petGeneral._changableIndex)[index + petGeneral._startIndex] .. " )")
          ;
          ((petList[index])._name):addInputEvent("Mouse_Out", "PetLookChange_SimpleTooltip( false, " .. index .. ", " .. (petGeneral._changableIndex)[index + petGeneral._startIndex] .. " )")
        else
          ;
          ((petList[index])._name):addInputEvent("Mouse_On", "")
          ;
          ((petList[index])._name):addInputEvent("Mouse_Out", "")
        end
        ;
        ((petList[index])._name):addInputEvent("Mouse_LUp", "PetLookChange_SelectSlot(" .. index .. ")")
        ;
        ((petList[index])._bg):SetShow(true)
        ;
        ((petList[index])._bg):addInputEvent("Mouse_LUp", "PetLookChange_SelectSlot(" .. index .. ")")
        ;
        ((petList[index])._bg):addInputEvent("Mouse_DownScroll", "PetLookChange_ScrollEvent( false )")
        ;
        ((petList[index])._bg):addInputEvent("Mouse_UpScroll", "PetLookChange_ScrollEvent( true )")
      else
        do
          ;
          ((petList[index])._bg):SetShow(false)
          ;
          ((petList[index])._bg):addInputEvent("Mouse_LUp", "")
          if petGeneral._startIndex <= petGeneral._selectedIndex and petGeneral._selectedIndex < petGeneral._startIndex + maxSlot then
            (petGeneral._selectBg):SetShow(true)
            local posY = ((petList[petGeneral._selectedIndex - petGeneral._startIndex])._bg):GetPosY()
            ;
            (petGeneral._selectBg):SetPosY(posY)
          else
            do
              do
                do
                  ;
                  (petGeneral._selectBg):SetShow(false)
                  ;
                  ((petList[index])._bg):SetShow(false)
                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC215: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
end

PetLookChange_SelectSlot = function(petIndex)
  -- function num : 0_5 , upvalues : petGeneral, lookChange, petList
  local petData = ToClient_getPetSealedDataByIndex((petGeneral._changableIndex)[petIndex + petGeneral._startIndex])
  if petData == nil then
    return 
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

  petGeneral._selectedIndex = petIndex + petGeneral._startIndex
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

  lookChange._currentIndex = 0
  PetLook_IconChange(petIndex + petGeneral._startIndex, lookChange._currentIndex)
  ;
  (petGeneral._selectBg):SetShow(true)
  local posY = ((petList[petIndex])._bg):GetPosY()
  ;
  (petGeneral._selectBg):SetPosY(posY)
end

PetLook_IconChange = function(petIndex, lookIndex)
  -- function num : 0_6 , upvalues : petGeneral, lookChange
  local petData = ToClient_getPetSealedDataByIndex((petGeneral._changableIndex)[petIndex])
  if petData == nil then
    return 
  end
  local petStaticStatus = petData:getPetStaticStatus()
  local count = ToClient_getPetChangeLookCount(petStaticStatus)
  if lookIndex < 0 or count <= lookIndex then
    return 
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R5 in 'UnsetPending'

  lookChange._currentIndex = lookIndex
  local iconPath = ToClient_getPetChangeLook_IconPath(petStaticStatus, lookIndex)
  ;
  (lookChange._petIcon):ChangeTextureInfoName(iconPath)
  ;
  (lookChange._lookIndex):SetText(lookChange._currentIndex + 1 .. " / " .. count)
  local actionIndex = ToClient_getPetChangeLook_ActionIndex(petStaticStatus, lookChange._currentIndex)
  ;
  (lookChange._btnRight):addInputEvent("Mouse_LUp", "PetLook_IconChange(" .. petIndex .. "," .. lookChange._currentIndex + 1 .. ")")
  ;
  (lookChange._btnLeft):addInputEvent("Mouse_LUp", "PetLook_IconChange(" .. petIndex .. "," .. lookChange._currentIndex - 1 .. ")")
  ;
  (lookChange._btnChange):addInputEvent("Mouse_LUp", "PetLookChange_Request(" .. petIndex .. "," .. actionIndex .. ")")
end

local _whereType, _slotNo = nil, nil
PetLookChange_Request = function(petIndex, actionIndex)
  -- function num : 0_7 , upvalues : petGeneral, _whereType, _slotNo
  local petData = ToClient_getPetSealedDataByIndex((petGeneral._changableIndex)[petIndex])
  if petData == nil then
    return 
  end
  local currentActionIndex = petData._actionIndex
  if currentActionIndex == actionIndex then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLOOKCHANGE_SAMETHING"))
    return 
  end
  local petNo = petData._petNo
  ToClient_requestPetChangeLook(petNo, actionIndex, _whereType, _slotNo)
end

PetLookChange_ScrollEvent = function(isUp)
  -- function num : 0_8 , upvalues : petGeneral, maxSlot
  local sealPetCount = petGeneral._petCount
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC12: Unhandled construct in 'MakeBoolean' P1

  if isUp and petGeneral._startIndex > 0 then
    petGeneral._startIndex = petGeneral._startIndex - 1
    petLookChange_Update()
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  if petGeneral._startIndex + maxSlot < sealPetCount then
    petGeneral._startIndex = petGeneral._startIndex + 1
    petLookChange_Update()
  end
  local interval = sealPetCount - maxSlot
  ;
  (petGeneral._scroll):SetControlPos(petGeneral._startIndex / interval)
  TooltipSimple_Hide()
end

HandleClicked_PetLookChange_ScrollBtn = function()
  -- function num : 0_9 , upvalues : petGeneral, maxSlot
  local self = petGeneral
  local listCount = self._petCount
  local posByIndex = 1 / (listCount - maxSlot)
  local currentIndex = (math.floor)((self._scroll):GetControlPos() / posByIndex)
  self._startIndex = currentIndex
  petLookChange_Update()
end

Panel_Window_PetLookChange_Open = function()
  -- function num : 0_10 , upvalues : petGeneral, lookChange, maxSlot
  if not Panel_Window_PetLookChange:GetShow() then
    Panel_Window_PetLookChange:SetShow(true)
    Panel_Window_PetLookChange:SetPosX(getScreenSizeX() / 2 - Panel_Window_PetLookChange:GetSizeX() - 100)
    Panel_Window_PetLookChange:SetPosY(getScreenSizeY() / 2 - Panel_Window_PetLookChange:GetSizeY() / 2 - 50)
  end
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

  petGeneral._startIndex = 0
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

  petGeneral._selectedIndex = 0
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

  lookChange._currentIndex = 0
  petLookChange_Update()
  ;
  (petGeneral._scroll):SetControlPos(lookChange._currentIndex)
  PetLookChange_SelectSlot(petGeneral._selectedIndex, 0)
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

  petGeneral._petCount = petLookChangeableCount()
  if maxSlot < petGeneral._petCount then
    (petGeneral._scroll):SetShow(true)
    ;
    (UIScroll.SetButtonSize)(petGeneral._scroll, maxSlot, petGeneral._petCount)
  else
    ;
    (petGeneral._scroll):SetShow(false)
  end
end

Panel_Window_PetLookChange_Close = function()
  -- function num : 0_11
  Panel_Window_PetLookChange:SetShow(false)
end

FromClient_SealPetCountChange = function()
  -- function num : 0_12 , upvalues : petGeneral, lookChange
  if not Panel_Window_PetLookChange:GetShow() then
    return 
  end
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  petGeneral._startIndex = 0
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  petGeneral._selectedIndex = 0
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  lookChange._currentIndex = 0
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  petGeneral._petCount = petLookChangeableCount()
  petLookChange_Update()
  ;
  (petGeneral._scroll):SetControlPos(lookChange._currentIndex)
  PetLookChange_SelectSlot(petGeneral._selectedIndex)
end

FromClient_PetChangeLook = function(whereType, slotNo)
  -- function num : 0_13 , upvalues : petGeneral, _whereType, _slotNo
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R2 in 'UnsetPending'

  petGeneral._petCount = petLookChangeableCount()
  if petGeneral._petCount > 0 then
    _whereType = whereType
    _slotNo = slotNo
    Panel_Window_PetLookChange_Open()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLOOKCHANGE_NOPET"))
  end
end

FromClient_PetLookChanged = function(petNo, actionIndex)
  -- function num : 0_14
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLOOKCHANGE_CHANGEPET"))
  Panel_Window_PetLookChange_Close()
end

petLookChangeableCount = function()
  -- function num : 0_15 , upvalues : petGeneral
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  petGeneral._changableIndex = {}
  local lookChangablePetCount = 0
  for index = 0, ToClient_getPetSealedList() - 1 do
    local petData = ToClient_getPetSealedDataByIndex(index)
    if petData ~= nil then
      local petStaticStatus = petData:getPetStaticStatus()
      local lookcount = ToClient_getPetChangeLookCount(petStaticStatus)
      -- DECOMPILER ERROR at PC24: Confused about usage of register: R8 in 'UnsetPending'

      if lookcount > 1 then
        (petGeneral._changableIndex)[lookChangablePetCount] = index
        lookChangablePetCount = lookChangablePetCount + 1
      end
    end
  end
  _PA_LOG("이문�\133", "ToClient_getPetSealedList() : " .. ToClient_getPetSealedList() .. " / lookChangablePetCount : " .. lookChangablePetCount)
  return lookChangablePetCount
end

PetLookChange_SimpleTooltip = function(isShow, index, changableIndex)
  -- function num : 0_16 , upvalues : petList
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  local petData = ToClient_getPetSealedDataByIndex(changableIndex)
  local petName = petData:getName()
  name = petName
  control = (petList[index])._name
  TooltipSimple_Show(control, name, desc)
end

petList:Init()
registerEvent("FromClient_PetChangeLook", "FromClient_PetChangeLook")
registerEvent("FromClient_PetLookChanged", "FromClient_PetLookChanged")
registerEvent("FromClient_PetAddSealedList", "FromClient_SealPetCountChange")
registerEvent("FromClient_PetDelSealedList", "FromClient_SealPetCountChange")

