-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\myvendorlist.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_MyVendor_List:SetShow(false, false)
Panel_MyVendor_List:setGlassBackground(true)
Panel_MyVendor_List:ActiveMouseEventEffect(true)
Panel_MyVendor_List:RegisterShowEventFunc(true, "Panel_MyVendor_List_ShowAni()")
Panel_MyVendor_List:RegisterShowEventFunc(false, "Panel_MyVendor_List_HideAni()")
Panel_MyVendor_List_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.AlphaAnimation)(1, Panel_MyVendor_List, 0, 0.2)
  local aniInfo1 = Panel_MyVendor_List:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.05)
  aniInfo1.AxisX = Panel_MyVendor_List:GetSizeX() / 2
  aniInfo1.AxisY = Panel_MyVendor_List:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_MyVendor_List:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.05)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_MyVendor_List:GetSizeX() / 2
  aniInfo2.AxisY = Panel_MyVendor_List:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_MyVendor_List_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_MyVendor_List, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local IM = CppEnums.EProcessorInputMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PP = CppEnums.PAUIMB_PRIORITY
local VCK = CppEnums.VirtualKeyCode
local MyVendorList = {
_list = {}
, _buttonXClose = (UI.getChildControl)(Panel_MyVendor_List, "Button_Win_Close"), _buttonClose = (UI.getChildControl)(Panel_MyVendor_List, "Button_Close"), _buttonQuestion = (UI.getChildControl)(Panel_MyVendor_List, "Button_Question")}
MyVendorList.initialize = function(self)
  -- function num : 0_2 , upvalues : UCT
  local copyStaticBack = (UI.getChildControl)(Panel_MyVendor_List, "Static_C_BG")
  local copyStaticType = (UI.getChildControl)(Panel_MyVendor_List, "StaticText_C_Type")
  local copyStaticName = (UI.getChildControl)(Panel_MyVendor_List, "StaticText_C_Name")
  createVendorList = function(pIndex)
    -- function num : 0_2_0 , upvalues : UCT, copyStaticBack, copyStaticType, copyStaticName
    local rtVendor = {}
    rtVendor._staticBack = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_MyVendor_List, "Static_BackGround_" .. pIndex)
    rtVendor._staticType = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtVendor._staticBack, "Static_Type" .. pIndex)
    rtVendor._staticName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtVendor._staticBack, "Static_Name" .. pIndex)
    CopyBaseProperty(copyStaticBack, rtVendor._staticBack)
    CopyBaseProperty(copyStaticType, rtVendor._staticType)
    CopyBaseProperty(copyStaticName, rtVendor._staticName)
    rtVendor.SetPos = function(self, x, y)
      -- function num : 0_2_0_0 , upvalues : rtVendor
      (rtVendor._staticBack):SetPosX(x)
      ;
      (rtVendor._staticBack):SetPosY(y)
      ;
      (rtVendor._staticName):SetPosY(0)
    end

    rtVendor.SetShow = function(self, isShow)
      -- function num : 0_2_0_1 , upvalues : rtVendor
      (rtVendor._staticBack):SetShow(isShow)
    end

    rtVendor.SetData = function(self, vendorStaticStatus)
      -- function num : 0_2_0_2 , upvalues : rtVendor
      (rtVendor._staticName):SetText(vendorStaticStatus:getName())
      ;
      (rtVendor._staticType):SetShow(false)
    end

    return rtVendor
  end

  for index = 0, 2 do
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R8 in 'UnsetPending'

    (self._list)[index] = createVendorList(index)
    ;
    ((self._list)[index]):SetPos(5, 60 * index + 45)
  end
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "handleClickedMyVendorListClose()")
  ;
  (self._buttonXClose):addInputEvent("Mouse_LUp", "handleClickedMyVendorListClose()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"MyVendorList\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"MyVendorList\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"MyVendorList\", \"false\")")
  ;
  (UI.deleteControl)(copyStaticBack)
  ;
  (UI.deleteControl)(copyStaticType)
  ;
  (UI.deleteControl)(copyStaticName)
  copyStaticBack, copyStaticType, copyStaticName = nil
end

handleClickedMyVendorListClose = function()
  -- function num : 0_3 , upvalues : MyVendorList
  MyVendorList:Close()
end

MyVendorList.Open = function(self)
  -- function num : 0_4 , upvalues : IM
  Panel_MyVendor_List:SetShow(true, true)
  local myVendorListCount = ToClient_RequestGetMyVendorListCount()
  for index = 0, 2 do
    if index < myVendorListCount then
      local vendorStatus = ToClient_RequestGetMyVendorListAt(index)
      ;
      ((self._list)[index]):SetData(vendorStatus)
      ;
      ((self._list)[index]):SetShow(true)
    else
      do
        do
          ;
          ((self._list)[index]):SetShow(false)
          -- DECOMPILER ERROR at PC32: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC32: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC32: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

MyVendorList.Close = function(self)
  -- function num : 0_5 , upvalues : IM
  if Panel_MyVendor_List:IsShow() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    Panel_MyVendor_List:SetShow(false, true)
  end
  HelpMessageQuestion_Out()
end

MyVendorList:initialize()
FGlobal_ShowMyVendorList = function()
  -- function num : 0_6 , upvalues : MyVendorList
  MyVendorList:Open()
end

FGlobal_CloseMyVendorList = function()
  -- function num : 0_7 , upvalues : MyVendorList
  MyVendorList:Close()
end


