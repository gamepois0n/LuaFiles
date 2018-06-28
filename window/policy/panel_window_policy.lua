local IM = CppEnums.EProcessorInputMode
Panel_Window_Policy:SetShow(false)
local PaGlobal_Policy = {
  _ui = {
    btnConfirm = UI.getChildControl(Panel_Window_Policy, "StaticText_Confirm"),
    btnCancel = UI.getChildControl(Panel_Window_Policy, "StaticText_Close"),
    _content = UI.getChildControl(Panel_Window_Policy, "Frame_Content"),
    _text = {}
  },
  _defaultBtnConfirmPosX = 0,
  _defaultBtnCancelPosX = 0
}
function PaGlobal_Policy:init()
  local frameContent = UI.getChildControl(self._ui._content, "Frame_1_Content")
  local control = self._ui._text
  control[0] = UI.getChildControl(frameContent, "StaticText_Title_1")
  control[1] = UI.getChildControl(frameContent, "StaticText_Desc_1")
  control[2] = UI.getChildControl(frameContent, "StaticText_Title_2")
  control[3] = UI.getChildControl(frameContent, "StaticText_Desc_2")
  control[4] = UI.getChildControl(frameContent, "StaticText_Title_3")
  control[5] = UI.getChildControl(frameContent, "StaticText_Desc_3")
  control[6] = UI.getChildControl(frameContent, "StaticText_Title_4")
  control[7] = UI.getChildControl(frameContent, "StaticText_Desc_4")
  control[8] = UI.getChildControl(frameContent, "StaticText_Title_5")
  control[9] = UI.getChildControl(frameContent, "StaticText_Desc_5")
  control[10] = UI.getChildControl(frameContent, "StaticText_Desc_5_1")
  control[11] = UI.getChildControl(frameContent, "StaticText_Desc_5_2")
  control[12] = UI.getChildControl(frameContent, "StaticText_Desc_5_3")
  control[13] = UI.getChildControl(frameContent, "StaticText_Desc_5_4")
  control[14] = UI.getChildControl(frameContent, "StaticText_Desc_5_5")
  control[15] = UI.getChildControl(frameContent, "StaticText_Desc_5_6")
  control[16] = UI.getChildControl(frameContent, "StaticText_Desc_52")
  control[17] = UI.getChildControl(frameContent, "StaticText_Desc_53")
  control[18] = UI.getChildControl(frameContent, "StaticText_Title_6")
  control[19] = UI.getChildControl(frameContent, "StaticText_Desc_6")
  control[20] = UI.getChildControl(frameContent, "StaticText_Desc_62")
  control[21] = UI.getChildControl(frameContent, "StaticText_Title_7")
  control[22] = UI.getChildControl(frameContent, "StaticText_Desc_7")
  for index = 0, #control do
    control[index]:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    control[index]:SetText(control[index]:GetText())
  end
  local smallGap = 5
  local bigGap = 40
  local posY = 0
  control[0]:SetPosY(posY)
  posY = posY + control[0]:GetTextSizeY() + smallGap
  control[1]:SetPosY(posY)
  posY = posY + control[1]:GetTextSizeY() + bigGap
  control[2]:SetPosY(posY)
  posY = posY + control[2]:GetTextSizeY() + smallGap
  control[3]:SetPosY(posY)
  posY = posY + control[3]:GetTextSizeY() + bigGap
  control[4]:SetPosY(posY)
  posY = posY + control[4]:GetTextSizeY() + smallGap
  control[5]:SetPosY(posY)
  posY = posY + control[5]:GetTextSizeY() + bigGap
  control[6]:SetPosY(posY)
  posY = posY + control[6]:GetTextSizeY() + smallGap
  control[7]:SetPosY(posY)
  posY = posY + control[7]:GetTextSizeY() + bigGap
  control[8]:SetPosY(posY)
  posY = posY + control[8]:GetTextSizeY() + smallGap
  control[9]:SetPosY(posY)
  posY = posY + control[9]:GetTextSizeY() + bigGap
  control[10]:SetPosY(posY)
  posY = posY + control[10]:GetTextSizeY() + smallGap
  control[11]:SetPosY(posY)
  posY = posY + control[11]:GetTextSizeY() + smallGap
  control[12]:SetPosY(posY)
  posY = posY + control[12]:GetTextSizeY() + smallGap
  control[13]:SetPosY(posY)
  posY = posY + control[13]:GetTextSizeY() + smallGap
  control[14]:SetPosY(posY)
  posY = posY + control[14]:GetTextSizeY() + smallGap
  control[15]:SetPosY(posY)
  posY = posY + control[15]:GetTextSizeY() + bigGap
  control[16]:SetPosY(posY)
  posY = posY + control[16]:GetTextSizeY() + smallGap
  control[17]:SetPosY(posY)
  posY = posY + control[17]:GetTextSizeY() + bigGap
  control[18]:SetPosY(posY)
  posY = posY + control[18]:GetTextSizeY() + smallGap
  control[19]:SetPosY(posY)
  posY = posY + control[19]:GetTextSizeY() + smallGap
  control[20]:SetPosY(posY)
  posY = posY + control[20]:GetTextSizeY() + bigGap
  control[21]:SetPosY(posY)
  posY = posY + control[21]:GetTextSizeY() + smallGap
  control[22]:SetPosY(posY)
  posY = posY + control[22]:GetTextSizeY() + bigGap
  frameContent:SetSize(frameContent:GetSizeX(), posY + 10)
  self._defaultBtnConfirmPosX = self._ui.btnConfirm:GetPosX()
  self._defaultBtnCancelPosX = self._ui.btnCancel:GetPosX()
end
function PaGlobal_Policy_ShowWindow(isLogin)
  local self = PaGlobal_Policy
  Panel_Window_Policy:SetShow(true)
  self._ui.btnConfirm:SetShow(isLogin)
  self._ui.btnCancel:SetShow(true)
  if true == isLogin then
    self._ui.btnConfirm:SetPosX(self._defaultBtnConfirmPosX - 100)
    self._ui.btnCancel:SetPosX(self._defaultBtnCancelPosX + 100)
  else
    self._ui.btnConfirm:SetPosX(self._defaultBtnConfirmPosX)
    self._ui.btnCancel:SetPosX(self._defaultBtnCancelPosX)
  end
end
function PaGlobal_Policy_Close()
  local self = PaGlobal_Policy
  Panel_Window_Policy:SetShow(false)
end
PaGlobal_Policy:init()
