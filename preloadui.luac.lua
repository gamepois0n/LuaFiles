-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\preloadui.luac 

-- params : ...
-- function num : 0
if ToClient_isConsoleUIOption() then
  __GLOBAL_DEFINE_CONSOLE_UI = isGameServiceTypeDev()
  convertUIFontTypeToUIFontSize = function(fontType)
  -- function num : 0_0
  local addSize = 0
  if fontType == (CppEnums.UIFontSizeType).eUIFontSizeType_Normal then
    addSize = 0
  else
    if fontType == (CppEnums.UIFontSizeType).eUIFontSizeType_Biggish then
      addSize = 3
    else
      if fontType == (CppEnums.UIFontSizeType).eUIFontSizeType_Big then
        addSize = 4
      end
    end
  end
  return addSize
end

  preloadUI_cahngeUIFontSize = function(fontRaiseSize)
  -- function num : 0_1
  if isGameServiceTypeDev() or isGameTypeTaiwan() or isGameTypeKorea() or isGameTypeJapan() then
    local addFontSize = convertUIFontTypeToUIFontSize(fontRaiseSize)
    ;
    (ToClient_getFontWrapper("BaseFont_10")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_Glow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_10_Bold")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_10_Normal")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_10_Line")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_10_Glow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_8")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_8_Bold")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_8_Line")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_8_Glow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_7_Bold")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_6")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_12")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_12_Yellow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_12_Bold")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_12_Glow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("SubTitleFont_14")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("SubTitleFont_14_Bold")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("SubTitleFont_14_Glow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("TitleFont_18")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_18_Glow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("TitleFont_22")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_22_Glow")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("HeaderFont_26")):changeCurrentFontSizeBeMore(addFontSize)
    ;
    (ToClient_getFontWrapper("BaseFont_26_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  end
end

end

