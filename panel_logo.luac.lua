-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_logo.luac 

-- params : ...
-- function num : 0
Panel_Logo:SetShow(true, false)
Panel_Logo:SetSize(getScreenSizeX(), getScreenSizeY())
local static_PearlAbyss = (UI.getChildControl)(Panel_Logo, "Static_Pearl")
local static_Daum = (UI.getChildControl)(Panel_Logo, "Static_Daum")
local static_Grade = (UI.getChildControl)(Panel_Logo, "Static_Grade")
local staticText_Warning = ((UI.getChildControl)(Panel_Logo, "MultilineText_Warning"))
local static_Movie = nil
Panel_Logo_Init = function()
  -- function num : 0_0 , upvalues : static_Daum, static_Grade, staticText_Warning, static_PearlAbyss
  static_Daum:SetShow(true)
  if isGameTypeKorea() then
    static_Grade:SetSize(311, 121)
    static_Grade:ChangeTextureInfoName("GameGradeIcon18.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(static_Grade, 0, 0, 311, 121)
    ;
    (static_Grade:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_Grade:setRenderTexture(static_Grade:getBaseTexture())
    static_Daum:SetShow(true)
  else
    do
      if isGameTypeEnglish() then
        static_Grade:SetSize(317, 122)
        static_Grade:ChangeTextureInfoName("GameGradeIcon18.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(static_Grade, 0, 0, 317, 122)
        ;
        (static_Grade:getBaseTexture()):setUV(x1, y1, x2, y2)
        static_Grade:setRenderTexture(static_Grade:getBaseTexture())
        static_Grade:SetShow(true)
        staticText_Warning:SetShow(false)
      else
        do
          if isGameTypeTaiwan() then
            static_Grade:SetSize(130, 129)
            static_Grade:ChangeTextureInfoName("GameGradeIcon18.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(static_Grade, 0, 0, 130, 129)
            ;
            (static_Grade:getBaseTexture()):setUV(x1, y1, x2, y2)
            static_Grade:setRenderTexture(static_Grade:getBaseTexture())
            static_Daum:SetShow(false)
          else
            do
              if isGameTypeSA() then
                static_Daum:SetSize(1024, 302)
                static_Daum:ChangeTextureInfoName("DAUM_CI.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(static_Daum, 0, 0, 1024, 302)
                ;
                (static_Daum:getBaseTexture()):setUV(x1, y1, x2, y2)
                static_Daum:setRenderTexture(static_Daum:getBaseTexture())
                staticText_Warning:SetShow(false)
                static_Grade:SetShow(false)
              else
                do
                  if isGameTypeRussia() then
                    static_Daum:SetSize(600, 300)
                    static_Daum:ChangeTextureInfoName("DAUM_CI.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(static_Daum, 0, 0, 600, 300)
                    ;
                    (static_Daum:getBaseTexture()):setUV(x1, y1, x2, y2)
                    static_Daum:setRenderTexture(static_Daum:getBaseTexture())
                    staticText_Warning:SetShow(false)
                    static_Grade:SetShow(false)
                  else
                    do
                      if isGameTypeKR2() then
                        static_Daum:SetSize(406, 248)
                        static_Daum:ChangeTextureInfoName("DAUM_CI.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(static_Daum, 0, 0, 406, 248)
                        ;
                        (static_Daum:getBaseTexture()):setUV(x1, y1, x2, y2)
                        static_Daum:setRenderTexture(static_Daum:getBaseTexture())
                        static_Grade:SetShow(false)
                      else
                        do
                          if isGameTypeJapan() then
                            static_Daum:SetSize(688, 323)
                            static_Daum:ChangeTextureInfoName("DAUM_CI.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(static_Daum, 0, 0, 688, 323)
                            ;
                            (static_Daum:getBaseTexture()):setUV(x1, y1, x2, y2)
                            static_Daum:setRenderTexture(static_Daum:getBaseTexture())
                          else
                            do
                              static_Grade:SetSize(311, 121)
                              static_Grade:ChangeTextureInfoName("GameGradeIcon18.dds")
                              do
                                local x1, y1, x2, y2 = setTextureUV_Func(static_Grade, 0, 0, 311, 121)
                                ;
                                (static_Grade:getBaseTexture()):setUV(x1, y1, x2, y2)
                                static_Grade:setRenderTexture(static_Grade:getBaseTexture())
                                if isGameTypeKorea() then
                                  staticText_Warning:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_LOGO_AGE"))
                                else
                                  if isGameTypeTaiwan() then
                                    staticText_Warning:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_LOGO_AGE_TW"))
                                  else
                                    if isGameTypeKR2() then
                                      staticText_Warning:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BDOKR2_A"))
                                    end
                                  end
                                end
                                static_PearlAbyss:SetShow(false)
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

Panel_Logo_Init()
Panel_Logo:ComputePos()
static_PearlAbyss:ComputePos()
static_Daum:ComputePos()
static_Grade:ComputePos()
staticText_Warning:ComputePos()
static_Daum:SetAlpha(0)
static_Grade:SetAlpha(0)
staticText_Warning:SetFontAlpha(0)
local startAniTime = 6
if isGameTypeKorea() then
  local aniInfo11 = static_Daum:addColorAnimation(startAniTime + 0, startAniTime + 3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo11:SetStartColor((Defines.Color).C_00FFFFFF)
  aniInfo11:SetEndColor((Defines.Color).C_FFFFFFFF)
  local aniInfo1 = static_Daum:addColorAnimation(startAniTime + 3, startAniTime + 6, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
  local aniInfo2 = static_Grade:addColorAnimation(startAniTime + 6, startAniTime + 9, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo2:SetEndColor((Defines.Color).C_FFFFFFFF)
  local aniInfo3 = staticText_Warning:addColorAnimation(startAniTime + 6, startAniTime + 9, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo3:SetEndColor((Defines.Color).C_FFFFFFFF)
else
  do
    if isGameTypeEnglish() then
      local aniInfo11 = static_Daum:addColorAnimation(startAniTime + 0, startAniTime + 3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
      aniInfo11:SetStartColor((Defines.Color).C_00FFFFFF)
      aniInfo11:SetEndColor((Defines.Color).C_FFFFFFFF)
      local aniInfo1 = static_Daum:addColorAnimation(startAniTime + 3, startAniTime + 6, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
      aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
      aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
      local aniInfo2 = static_Grade:addColorAnimation(startAniTime + 6, startAniTime + 9, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
      aniInfo2:SetStartColor((Defines.Color).C_FFFFFFFF)
      aniInfo2:SetEndColor((Defines.Color).C_FFFFFFFF)
    else
      do
        if isGameTypeTaiwan() then
          local aniInfo11 = static_Daum:addColorAnimation(startAniTime + 0, startAniTime + 3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo11:SetStartColor((Defines.Color).C_00FFFFFF)
          aniInfo11:SetEndColor((Defines.Color).C_FFFFFFFF)
          local aniInfo1 = static_Daum:addColorAnimation(startAniTime + 3, startAniTime + 8, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
          aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
          local aniInfo2 = static_Grade:addColorAnimation(startAniTime + 0, startAniTime + 3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo2:SetStartColor((Defines.Color).C_00FFFFFF)
          aniInfo2:SetEndColor((Defines.Color).C_FFFFFFFF)
          local aniInfo3 = staticText_Warning:addColorAnimation(startAniTime + 0, startAniTime + 3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo3:SetStartColor((Defines.Color).C_00FFFFFF)
          aniInfo3:SetEndColor((Defines.Color).C_FFFFFFFF)
          aniInfo3.IsChangeChild = true
          local aniInfo4 = static_Grade:addColorAnimation(startAniTime + 3, startAniTime + 8, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo4:SetStartColor((Defines.Color).C_FFFFFFFF)
          aniInfo4:SetEndColor((Defines.Color).C_00FFFFFF)
          local aniInfo5 = staticText_Warning:addColorAnimation(startAniTime + 3, startAniTime + 8, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
          aniInfo5:SetStartColor((Defines.Color).C_FFFFFFFF)
          aniInfo5:SetEndColor((Defines.Color).C_00FFFFFF)
          aniInfo5.IsChangeChild = true
        else
          do
            if isGameTypeKR2() then
              local aniInfo11 = static_Daum:addColorAnimation(startAniTime + 0, startAniTime + 3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
              aniInfo11:SetStartColor((Defines.Color).C_00FFFFFF)
              aniInfo11:SetEndColor((Defines.Color).C_FFFFFFFF)
              local aniInfo1 = static_Daum:addColorAnimation(startAniTime + 3, startAniTime + 8, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
              aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
              aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
              local aniInfo3 = staticText_Warning:addColorAnimation(startAniTime + 8, startAniTime + 10, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
              aniInfo3:SetStartColor((Defines.Color).C_00FFFFFF)
              aniInfo3:SetEndColor((Defines.Color).C_FFFFFFFF)
              aniInfo3.IsChangeChild = true
              local aniInfo5 = staticText_Warning:addColorAnimation(startAniTime + 13, startAniTime + 15, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
              aniInfo5:SetStartColor((Defines.Color).C_FFFFFFFF)
              aniInfo5:SetEndColor((Defines.Color).C_00FFFFFF)
              aniInfo5.IsChangeChild = true
            else
              do
                local aniInfo11 = static_Daum:addColorAnimation(startAniTime + 0, startAniTime + 3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
                aniInfo11:SetStartColor((Defines.Color).C_00FFFFFF)
                aniInfo11:SetEndColor((Defines.Color).C_FFFFFFFF)
                do
                  local aniInfo1 = static_Daum:addColorAnimation(startAniTime + 3, startAniTime + 8, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
                  aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
                  aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
                  local updateTime = 0
                  Panel_Logo_Update = function()
  -- function num : 0_1 , upvalues : static_Movie
  static_Movie = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Logo, "WebControl_Movie")
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  static_Movie:SetIgnore(true)
  static_Movie:SetPosX(-8)
  static_Movie:SetPosY(-8)
  static_Movie:SetSize(sizeX + 34, sizeY + 19)
  local soundEnabled = getEnableSound(2)
  if soundEnabled == true then
    static_Movie:SetUrl(1920, 1080, "coui://UI_Movie/CI_Play.html", false, true)
  else
    static_Movie:SetUrl(1920, 1080, "coui://UI_Movie/CI_Play_NoSound.html", false, true)
  end
end

                  Panel_Logo_Pause = function(deltaTime)
  -- function num : 0_2 , upvalues : updateTime, static_Movie
  updateTime = updateTime + deltaTime
  if updateTime > 6 then
    static_Movie:ResetUrl()
    static_Movie:SetShow(false)
  end
end

                  Panel_Logo_Update()
                  Panel_Logo:RegisterUpdateFunc("Panel_Logo_Pause")
                end
              end
            end
          end
        end
      end
    end
  end
end

