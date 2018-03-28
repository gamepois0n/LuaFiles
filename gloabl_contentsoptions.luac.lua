-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\gloabl_contentsoptions.luac 

-- params : ...
-- function num : 0
_ContentsGroup_3DMiniMapOpen = ToClient_IsContentsGroupOpen("345")
_ContentsGroup_isFurnitureWarehouse = ToClient_IsContentsGroupOpen("342")
if not ToClient_IsContentsGroupOpen("315") then
  _ContentsGroup_isUsedNewEnchant = isGameTypeKorea()
  if not ToClient_IsContentsGroupOpen("315") and not isGameTypeKorea() and not isGameTypeTH() then
    _ContentsGroup_isUsedNewTradeEventNotice = isGameTypeID()
    if not isGameTypeKorea() and not ToClient_IsContentsGroupOpen("315") and not isGameTypeTH() then
      _ContentsGroup_isMemoOpen = isGameTypeID()
      if not isGameTypeKorea() then
        _ContentsGroup_isNewLifeRanking = ToClient_IsContentsGroupOpen("315")
        if not isGameTypeKorea() and not ToClient_IsContentsGroupOpen("315") and not isGameTypeTH() then
          _ContentsGroup_isNewOption = isGameTypeID()
          _ContentsGroup_skillOldandNew = ToClient_IsContentsGroupOpen("920")
          if not ToClient_IsContentsGroupOpen("315") then
            _ContentsGroup_isUsedNewCharacterInfo = isGameTypeKorea()
            _ContentsGroup_webAlbumOpen = ToClient_IsContentsGroupOpen("205")
            _ContentsGroup_isContentsCustomizationVoice = ToClient_IsContentsGroupOpen("244")
            if getGamePadEnable() then
              _ContentsGroup_isConsoleTest = ToClient_IsDevelopment()
              _ContentsGroup_isCamp = ToClient_IsContentsGroupOpen("347")
              _ContentsGroup_isFairy = ToClient_IsContentsGroupOpen("357")
            end
          end
        end
      end
    end
  end
end

