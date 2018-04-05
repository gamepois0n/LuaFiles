-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\skill\panel_enableskill.luac 

-- params : ...
-- function num : 0
local UIMode = Defines.UIMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_classType = CppEnums.ClassType
Panel_EnableSkill:SetShow(false)
Panel_EnableSkill:RegisterShowEventFunc(true, "EnableSkill_ShowAni()")
Panel_EnableSkill:RegisterShowEventFunc(false, "EnableSkill_HideAni()")
Panel_EnableSkill:ActiveMouseEventEffect(true)
Panel_EnableSkill:setGlassBackground(true)
Panel_EnableSkill:SetDragAll(true)
local _buttonQuestion = (UI.getChildControl)(Panel_EnableSkill, "Button_Question")
local _frameBG = (UI.getChildControl)(Panel_EnableSkill, "Static_FrameBG")
local _slide = (UI.getChildControl)(Panel_EnableSkill, "VerticalScroll")
local _slideBtn = (UI.getChildControl)(_slide, "VerticalScroll_CtrlButton")
local skillEmptyText = (UI.getChildControl)(Panel_EnableSkill, "StaticText_EmptySkill")
local searchFailText = (UI.getChildControl)(Panel_EnableSkill, "StaticText_SearchFail")
local radio = {_radioButton_LearnSkill = (UI.getChildControl)(Panel_EnableSkill, "RadioButton_Tab_LearnSkill"), _radioButton_AllSkill = (UI.getChildControl)(Panel_EnableSkill, "RadioButton_Tab_AllSkill")}
local CopyUI = {_base_SkillBG = (UI.getChildControl)(Panel_EnableSkill, "Static_C_SkillBG"), _base_SkillBlueBG = (UI.getChildControl)(Panel_EnableSkill, "Static_C_SkillBlueBG"), _base_SkillYellowBG = (UI.getChildControl)(Panel_EnableSkill, "Static_C_SkillYellowBG"), _base_SkillIcon = (UI.getChildControl)(Panel_EnableSkill, "Static_C_SkillIcon"), _base_SkillName = (UI.getChildControl)(Panel_EnableSkill, "StaticText_C_SkillName"), _base_SkillNeedSP = (UI.getChildControl)(Panel_EnableSkill, "StaticText_C_NeedSP"), _base_LearnButton = (UI.getChildControl)(Panel_EnableSkill, "Button_LearnSkill")}
local CopyString = {_base_StringName = (UI.getChildControl)(Panel_EnableSkill, "StaticText_C_SkillName")}
local comboBox = (UI.getChildControl)(Panel_EnableSkill, "Combobox_Sort")
local editSearch = {_editSearchText = (UI.getChildControl)(Panel_EnableSkill, "EditSearchText"), _editSearchButton = (UI.getChildControl)(Panel_EnableSkill, "BtnSearch")}
local comboBoxString = {[-1] = PAGetString(Defines.StringSheet_GAME, "LUA_ENABLESKILL_RECOMMENDSKILL"), [0] = PAGetString(Defines.StringSheet_GAME, "LUA_ENABLESKILL_SKILLPOINT_HIGHORDER"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_ENABLESKILL_SKILLPOINT_LOWORDER")}
local IM = CppEnums.EProcessorInputMode
local enableSkillList_MaxCount = 7
local uiData = {}
local mousePosBG = nil
local slideIndex = 0
local skillNumber = {}
local editSkillName = {}
local editSkillNo = {}
local isEditCheck = false
local Panel_EnableSkill_Value_elementCount = 0
local recommendSkillCount = 0
local isSkillLearnTutorialClick = false
local learnSkillTabIndex = 0
local allSkillTabIndex = 1
local skillCount = 0
local onIndex = -1
local UI_TM = CppEnums.TextMode
local filterText = ""
local maxRecommendCount = 99
local recommendSkill = {}
recommendSkill[UI_classType.ClassType_Warrior] = {[0] = 1021, [1] = 1127, [2] = 1128, [3] = 1129, [4] = 1024, [5] = 1078, [6] = 1079, [7] = 349, [8] = 350, [9] = 351, [10] = 705, [11] = 1023, [12] = 1133, [13] = 1134, [14] = 1135}
recommendSkill[UI_classType.ClassType_Ranger] = {[0] = 1006, [1] = 1091, [2] = 1092, [3] = 1093, [4] = 1007, [5] = 1095, [6] = 1096, [7] = 1097, [8] = 1098, [9] = 1009, [10] = 1103, [11] = 1104, [12] = 1105, [13] = 1012, [14] = 1127, [15] = 1253, [16] = 1015, [17] = 1113, [18] = 1114, [19] = 1115, [20] = 318, [21] = 1363, [22] = 1364, [23] = 1365, [24] = 1366, [25] = 1367, [26] = 322, [27] = 323, [28] = 324}
recommendSkill[UI_classType.ClassType_Sorcerer] = {[0] = 310, [1] = 311, [2] = 312, [3] = 1056, [4] = 1202, [5] = 1203, [6] = 1430, [7] = 1431, [8] = 1432, [9] = 1055, [10] = 1201, [11] = 380, [12] = 171, [13] = 1353, [14] = 1354, [15] = 1355, [16] = 585, [17] = 586, [18] = 587, [19] = 588}
recommendSkill[UI_classType.ClassType_Giant] = {[0] = 1044, [1] = 1175, [2] = 1176, [3] = 1177, [4] = 1178, [5] = 1179, [6] = 1042, [7] = 1167, [8] = 1168, [9] = 1169, [10] = 1170, [11] = 1171, [12] = 1057, [13] = 1180, [14] = 1181, [15] = 1290, [16] = 102, [17] = 103, [18] = 104, [19] = 105, [20] = 106, [21] = 107, [22] = 1032, [23] = 1149, [24] = 1150, [25] = 1036, [26] = 1157, [27] = 1158}
recommendSkill[UI_classType.ClassType_Tamer] = {[0] = 11, [1] = 12, [2] = 13, [3] = 14, [4] = 15, [5] = 16, [6] = 17, [7] = 1070, [8] = 1232, [9] = 1233, [10] = 1234, [11] = 1073, [12] = 1241, [13] = 1242, [14] = 1243, [15] = 1244, [16] = 1245, [17] = 1065, [18] = 1220, [19] = 1221, [20] = 84, [21] = 228, [22] = 1068, [23] = 1227, [24] = 1228, [25] = 1229}
recommendSkill[UI_classType.ClassType_BladeMaster] = {[0] = 1455, [1] = 1456, [2] = 1457, [3] = 1279, [4] = 1280, [5] = 1281, [6] = 1282, [7] = 1445, [8] = 1446, [9] = 1447, [10] = 396, [11] = 1465, [12] = 401, [13] = 402, [14] = 403, [15] = 415, [16] = 416, [17] = 423, [18] = 404, [19] = 405, [20] = 406, [21] = 1273, [22] = 394}
recommendSkill[UI_classType.ClassType_BladeMasterWomen] = {[0] = 1591, [1] = 1592, [2] = 1593, [3] = 1539, [4] = 1540, [5] = 1541, [6] = 1542, [7] = 1572, [8] = 1573, [9] = 1574, [10] = 1575, [11] = 1576, [12] = 1582, [13] = 1583, [14] = 1584, [15] = 1585, [16] = 1586, [17] = 1587, [18] = 1588, [19] = 1589, [20] = 1590, [21] = 1529, [22] = 1533}
recommendSkill[UI_classType.ClassType_Valkyrie] = {[0] = 744, [1] = 745, [2] = 746, [3] = 732, [4] = 733, [5] = 734, [6] = 735, [7] = 770, [8] = 762, [9] = 763, [10] = 764, [11] = 772, [12] = 773, [13] = 774, [14] = 765, [15] = 766, [16] = 767, [17] = 768, [18] = 775}
recommendSkill[UI_classType.ClassType_Wizard] = {[0] = 834, [1] = 835, [2] = 836, [3] = 837, [4] = 838, [5] = 822, [6] = 823, [7] = 824, [8] = 825, [9] = 826, [10] = 847, [11] = 848, [12] = 849, [13] = 904, [14] = 905, [15] = 906, [16] = 907, [17] = 908, [18] = 909, [19] = 910, [20] = 911, [21] = 868, [22] = 869, [23] = 870, [24] = 871, [25] = 786, [26] = 787, [27] = 788, [28] = 789}
recommendSkill[UI_classType.ClassType_WizardWomen] = {[0] = 834, [1] = 835, [2] = 836, [3] = 837, [4] = 838, [5] = 822, [6] = 823, [7] = 824, [8] = 825, [9] = 826, [10] = 847, [11] = 848, [12] = 849, [13] = 904, [14] = 905, [15] = 906, [16] = 907, [17] = 908, [18] = 909, [19] = 910, [20] = 911, [21] = 868, [22] = 869, [23] = 870, [24] = 871, [25] = 786, [26] = 787, [27] = 788, [28] = 789}
recommendSkill[UI_classType.ClassType_NinjaWomen] = {[0] = 949, [1] = 950, [2] = 951, [3] = 1624, [4] = 1625, [5] = 958, [6] = 959, [7] = 960, [8] = 961, [9] = 966, [10] = 967, [11] = 968, [12] = 969, [13] = 970, [14] = 972, [15] = 973, [16] = 974, [17] = 1654, [18] = 1655, [19] = 1656, [20] = 1657, [21] = 1658}
recommendSkill[UI_classType.ClassType_NinjaMan] = {[0] = 949, [1] = 950, [2] = 951, [3] = 1624, [4] = 1625, [5] = 958, [6] = 959, [7] = 960, [8] = 961, [9] = 966, [10] = 967, [11] = 968, [12] = 969, [13] = 970, [14] = 972, [15] = 973, [16] = 974, [17] = 1698, [18] = 1699, [19] = 1700}
recommendSkill[UI_classType.ClassType_DarkElf] = {[0] = 2269, [1] = 2270, [2] = 2271, [3] = 2272, [4] = 2273, [5] = 2267, [6] = 2338, [7] = 2362, [8] = 2268, [9] = 2340, [10] = 2363, [11] = 2263, [12] = 2264, [13] = 2265, [14] = 2361, [15] = 2266, [16] = 2296, [17] = 2297, [18] = 2379, [19] = 2352, [20] = 2353, [21] = 2354, [22] = 2355, [23] = 2356, [24] = 2359, [25] = 2367, [26] = 2368, [27] = 2369, [28] = 2370}
recommendSkill[UI_classType.ClassType_Combattant] = {[0] = 2449, [1] = 2450, [2] = 2451, [3] = 2501, [4] = 2502, [5] = 2503, [6] = 2504, [7] = 2508, [8] = 2509, [9] = 2510, [10] = 2511, [11] = 2519, [12] = 2520, [13] = 2521, [14] = 2532, [15] = 2533, [16] = 2534, [17] = 2535, [18] = 2536, [19] = 2443, [20] = 2444, [21] = 2445, [22] = 2446, [23] = 2447, [24] = 2448}
recommendSkill[UI_classType.ClassType_CombattantWomen] = {[0] = 2723, [1] = 2724, [2] = 2725, [3] = 2726, [4] = 2727, [5] = 2718, [6] = 2719, [7] = 2720, [8] = 2721, [9] = 2722, [10] = 2706, [11] = 2707, [12] = 2708, [13] = 2709, [14] = 2710, [15] = 2711, [16] = 2712, [17] = 2713, [18] = 2714, [19] = 2715, [20] = 2716, [21] = 2691, [22] = 2692, [23] = 2693, [24] = 2694, [25] = 2695, [26] = 2696, [27] = 2697, [28] = 2698, [29] = 2699, [30] = 2674, [31] = 2675, [32] = 2676, [33] = 2677, [34] = 2631, [35] = 2632, [36] = 2633, [37] = 2637, [38] = 2638, [39] = 2639}
recommendSkill[UI_classType.ClassType_Lahn] = {[0] = 3221, [1] = 3222, [2] = 3223, [3] = 3224, [4] = 2948, [5] = 2975, [6] = 2976, [7] = 2949, [8] = 2977, [9] = 2950, [10] = 2978, [11] = 2979, [12] = 2980, [13] = 2981, [14] = 2951, [15] = 2992, [16] = 2993, [17] = 2994, [18] = 2952, [19] = 2982, [20] = 2983, [21] = 2984, [22] = 2985, [23] = 2986, [24] = 2953, [25] = 2987, [26] = 2988, [27] = 2989, [28] = 2954, [29] = 2990, [30] = 2991, [31] = 2955, [31] = 2995, [32] = 2956, [33] = 2957, [34] = 2996, [35] = 2997, [36] = 2958, [37] = 2959, [38] = 2960, [39] = 2998, [40] = 2999, [41] = 2961, [42] = 2962, [43] = 3000, [44] = 3001, [45] = 3002, [46] = 2964, [47] = 3003, [48] = 3004, [49] = 2966, [50] = 3005, [51] = 3006, [52] = 2967, [53] = 3007, [54] = 3008, [55] = 3009, [56] = 3010, [57] = 2969, [58] = 3011, [59] = 3012, [60] = 2970, [61] = 3013, [62] = 3014, [63] = 3015, [64] = 3016, [65] = 2971, [66] = 3017, [67] = 3018, [68] = 3019, [69] = 2972, [70] = 3020, [71] = 3021, [72] = 2973, [73] = 3022, [74] = 3023, [75] = 3024, [76] = 2974, [77] = 3025, [78] = 3026, [79] = 3027, [80] = 3028, [81] = 3029, [81] = 3147, [82] = 3148, [83] = 3149, [84] = 3150}
recommendSkill[UI_classType.ClassType_ShyWomen] = {}
recommendSkill[22] = {}
recommendSkill[29] = {}
recommendSkill[17] = {}
recommendSkill[18] = {}
EnableSkill_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.AlphaAnimation)(1, Panel_EnableSkill, 0, 0.15)
  local aniInfo1 = Panel_EnableSkill:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_EnableSkill:GetSizeX() / 2
  aniInfo1.AxisY = Panel_EnableSkill:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_EnableSkill:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_EnableSkill:GetSizeX() / 2
  aniInfo2.AxisY = Panel_EnableSkill:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

EnableSkill_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_EnableSkill, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

enableSkill_UpdateData = function(isEdit)
  -- function num : 0_2 , upvalues : Panel_EnableSkill_Value_elementCount, radio, comboBox, _slide, isEditCheck, skillEmptyText, searchFailText, enableSkillList_MaxCount, slideIndex, uiData, recommendSkillCount
  local skillInfo = {}
  local allSkillCount = 0
  if isEdit ~= true then
    skillInfo = EnableSkill_Setting()
  else
    skillInfo = EnableSearchSkill_Setting()
  end
  local isLearnCheck = (radio._radioButton_LearnSkill):IsCheck()
  -- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R4 in 'AssignReg'

  R4_PC11 = R4_PC11(R4_PC11)
  local isAllCheck = nil
  local selectIndex = comboBox:GetSelectIndex()
  if Panel_EnableSkill_Value_elementCount < 8 then
    _slide:SetShow(false)
  else
    _slide:SetShow(true)
  end
  -- DECOMPILER ERROR at PC49: Unhandled construct in 'MakeBoolean' P1

  -- DECOMPILER ERROR at PC49: Unhandled construct in 'MakeBoolean' P1

  if Panel_EnableSkill_Value_elementCount == 0 and isEditCheck == true and skillEmptyText:GetShow() == false then
    searchFailText:SetText()
    searchFailText:SetShow(true)
  end
  skillEmptyText:SetText()
  skillEmptyText:SetShow(true)
  skillEmptyText:SetShow(false)
  searchFailText:SetShow(false)
  -- DECOMPILER ERROR at PC82: Unhandled construct in 'MakeBoolean' P1

  if isAllCheck == true and (selectIndex == 0 or selectIndex == 1 or selectIndex == -1) then
    SkillPoint_Sort(Panel_EnableSkill_Value_elementCount, selectIndex + 1)
  end
  if selectIndex == 1 or selectIndex == 2 then
    SkillPoint_Sort(Panel_EnableSkill_Value_elementCount, selectIndex)
  end
  if isLearnCheck == true then
    for index = 0, enableSkillList_MaxCount - 1 do
      if slideIndex + index < Panel_EnableSkill_Value_elementCount then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus((skillInfo[slideIndex + index])._skillNo)
        if skillTypeStaticWrapper:isValidLocalizing() then
          (uiData[index]):SetData(skillTypeStaticWrapper, (skillInfo[slideIndex + index])._skillNo)
          if slideIndex + index < recommendSkillCount then
            ((uiData[index])._RecommendBG):SetShow(true)
            ;
            ((uiData[index])._RecommendBG):SetVertexAniRun("Ani_Color_New", true)
            ;
            ((uiData[index])._IconBG):SetShow(false)
          else
            ;
            ((uiData[index])._RecommendBG):SetShow(false)
            ;
            ((uiData[index])._RecommendBG):ResetVertexAni()
            ;
            ((uiData[index])._IconBG):SetShow(true)
          end
          ;
          ((uiData[index])._skillIcon):SetShow(true)
          ;
          ((uiData[index])._skillName):SetShow(true)
          ;
          ((uiData[index])._needSp):SetShow(true)
          ;
          ((uiData[index])._learnButton):SetShow(true)
        else
          ;
          ((uiData[index])._IconBG):SetShow(false)
          ;
          ((uiData[index])._RecommendBG):SetShow(false)
          ;
          ((uiData[index])._skillIcon):SetShow(false)
          ;
          ((uiData[index])._skillName):SetShow(false)
          ;
          ((uiData[index])._needSp):SetShow(false)
          ;
          ((uiData[index])._learnButton):SetShow(false)
        end
      else
        do
          do
            ;
            ((uiData[index])._IconBG):SetShow(false)
            ;
            ((uiData[index])._RecommendBG):SetShow(false)
            ;
            ((uiData[index])._skillIcon):SetShow(false)
            ;
            ((uiData[index])._skillName):SetShow(false)
            ;
            ((uiData[index])._needSp):SetShow(false)
            ;
            ((uiData[index])._learnButton):SetShow(false)
            -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC263: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  else
    for index = 0, enableSkillList_MaxCount - 1 do
      if slideIndex + index < Panel_EnableSkill_Value_elementCount then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus((skillInfo[slideIndex + index])._skillNo)
        if skillTypeStaticWrapper:isValidLocalizing() then
          (uiData[index]):SetData(skillTypeStaticWrapper, (skillInfo[slideIndex + index])._skillNo)
          ;
          ((uiData[index])._learnButton):SetShow(false)
          ;
          ((uiData[index])._RecommendBG):SetShow(false)
          ;
          ((uiData[index])._RecommendBG):ResetVertexAni()
          ;
          ((uiData[index])._IconBG):SetShow(true)
          ;
          ((uiData[index])._skillIcon):SetShow(true)
          ;
          ((uiData[index])._skillName):SetShow(true)
          ;
          ((uiData[index])._needSp):SetShow(true)
          ;
          ((uiData[index])._learnButton):SetShow(false)
        else
          ;
          ((uiData[index])._IconBG):SetShow(false)
          ;
          ((uiData[index])._skillIcon):SetShow(false)
          ;
          ((uiData[index])._skillName):SetShow(false)
          ;
          ((uiData[index])._needSp):SetShow(false)
          ;
          ((uiData[index])._learnButton):SetShow(false)
        end
      else
        do
          do
            ;
            ((uiData[index])._IconBG):SetShow(false)
            ;
            ((uiData[index])._skillIcon):SetShow(false)
            ;
            ((uiData[index])._skillName):SetShow(false)
            ;
            ((uiData[index])._needSp):SetShow(false)
            ;
            ((uiData[index])._learnButton):SetShow(false)
            -- DECOMPILER ERROR at PC403: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC403: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC403: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(_slide, enableSkillList_MaxCount, Panel_EnableSkill_Value_elementCount)
end

FGlobal_EnableSkillReturn = function()
  -- function num : 0_3 , upvalues : Panel_EnableSkill_Value_elementCount
  return Panel_EnableSkill_Value_elementCount
end

EnableSkillShowFunc = function()
  -- function num : 0_4 , upvalues : _slide, slideIndex, comboBox, radio, isEditCheck, editSearch
  if Panel_Window_Skill:IsShow() == true then
    Panel_EnableSkill:SetShow(true, true)
    _slide:SetControlPos(0)
    slideIndex = 0
    comboBox:SetShow(true)
    ClearFocusEdit()
    EnableSkill_LearnBtn_Effect()
    comboBox:SetSelectItemIndex(0)
    Panel_EnableSkill_SetPosition()
    ;
    (radio._radioButton_LearnSkill):SetCheck(true)
    ;
    (radio._radioButton_AllSkill):SetCheck(false)
    enableSkill_UpdateData(isEditCheck)
    RadioButton_Click(0)
  else
    Panel_EnableSkill:SetShow(false, true)
    ;
    (editSearch._editSearchText):SetEditText("", false)
    isEditCheck = false
  end
end

FGlobal_EnableSkillCloseFunc = function()
  -- function num : 0_5 , upvalues : editSearch, isEditCheck
  Panel_EnableSkill:SetShow(false, true)
  ;
  (editSearch._editSearchText):SetEditText("", false)
  isEditCheck = false
end

EnableSkill_LearnBtn_Effect = function()
  -- function num : 0_6 , upvalues : uiData, isSkillLearnTutorialClick
  ((uiData[0])._learnButton):EraseAllEffect()
  if ((uiData[0])._learnButton):GetShow() == true then
    if isSkillLearnTutorial() ~= nil and isSkillLearnTutorial() == true then
      isSkillLearnTutorialClick = true
      ;
      ((uiData[0])._learnButton):AddEffect("UI_Tuto_Skill_Learn_1", true, -1, 1.5)
      ;
      ((uiData[0])._learnButton):AddEffect("UI_Tuto_Skill_C_Learn_1", true, -1, 1.5)
      ;
      ((uiData[0])._learnButton):AddEffect("fUI_Tuto_Skill_Learn_01A", true, -1, 1.5)
    else
      isSkillLearnTutorialClick = false
    end
  end
end

Panel_EnableSkill_SetPosition = function()
  -- function num : 0_7
  Panel_EnableSkill:SetPosX(Panel_Window_Skill:GetPosX() + Panel_Window_Skill:GetSizeX() - 25)
  Panel_EnableSkill:SetPosY(Panel_Window_Skill:GetPosY() + 40)
end

enableSkill_MakeControl = function(index)
  -- function num : 0_8 , upvalues : UI_PUCT, CopyUI, UI_TM, recommendSkill, mousePosBG, comboBox
  local ui = {}
  ui._IconBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_EnableSkill, "Static_SkillBG_" .. index)
  CopyBaseProperty(CopyUI._base_SkillBG, ui._IconBG)
  ;
  (ui._IconBG):SetShow(false)
  ;
  (ui._IconBG):SetIgnore(false)
  ;
  (ui._IconBG):SetPosY(132 + index * ((ui._IconBG):GetSizeY() + 9))
  ui._RecommendBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_EnableSkill, "Static_SkillBlueBG_" .. index)
  CopyBaseProperty(CopyUI._base_SkillBlueBG, ui._RecommendBG)
  ;
  (ui._RecommendBG):SetShow(false)
  ;
  (ui._RecommendBG):SetIgnore(false)
  ;
  (ui._RecommendBG):SetPosY(132 + index * ((ui._IconBG):GetSizeY() + 9))
  ui._skillIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_EnableSkill, "Static_SkillIcon_" .. index)
  CopyBaseProperty(CopyUI._base_SkillIcon, ui._skillIcon)
  ;
  (ui._skillIcon):SetShow(false)
  ;
  (ui._skillIcon):SetPosY(134 + index * ((ui._IconBG):GetSizeY() + 9))
  ui._skillName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_EnableSkill, "StaticText_SkillName_" .. index)
  CopyBaseProperty(CopyUI._base_SkillName, ui._skillName)
  ;
  (ui._skillName):SetShow(false)
  ;
  (ui._skillName):SetIgnore(true)
  ;
  (ui._skillName):SetPosY(137 + index * ((ui._IconBG):GetSizeY() + 9))
  ui._needSp = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_EnableSkill, "StaticText_SkillNeedSP_" .. index)
  CopyBaseProperty(CopyUI._base_SkillNeedSP, ui._needSp)
  ;
  (ui._needSp):SetShow(false)
  ;
  (ui._needSp):SetIgnore(true)
  ;
  (ui._needSp):SetPosY(152 + index * ((ui._IconBG):GetSizeY() + 9))
  ui._learnButton = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, Panel_EnableSkill, "StaticText_LearnButton_" .. index)
  CopyBaseProperty(CopyUI._base_LearnButton, ui._learnButton)
  ;
  (ui._learnButton):SetShow(false)
  ;
  (ui._learnButton):SetIgnore(false)
  ;
  (ui._learnButton):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (ui._learnButton):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ENABLESKILL_LEARNSKILL_BTN"))
  if (ui._learnButton):IsLimitText() then
    (ui._learnButton):addInputEvent("Mouse_On", "enableSkill_Simpletooltips(true, " .. index .. ")")
    ;
    (ui._learnButton):addInputEvent("Mouse_Out", "enableSkill_Simpletooltips(false)")
  end
  ;
  (ui._learnButton):ComputePos()
  ;
  (ui._learnButton):SetPosY(134 + index * ((ui._IconBG):GetSizeY() + 9))
  ui.SetData = function(self, skillTypeSSW, skillNo)
    -- function num : 0_8_0 , upvalues : recommendSkill
    local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
    local needSp = (skillStaticWrapper:get())._needSkillPointForLearning
    ;
    (self._skillIcon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
    local recommendCheck = false
    for i = 0, 3 do
      if skillNo == (recommendSkill[(getSelfPlayer()):getClassType()])[i] then
        recommendCheck = true
      end
    end
    if recommendCheck == true then
      (self._skillName):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ENABLESKILL_RECOMMAND", "getName", skillTypeSSW:getName()))
    else
      ;
      (self._skillName):SetText(skillTypeSSW:getName())
    end
    ;
    (self._needSp):SetText(PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_NEWSKILL") .. " <PAColor0xffbcf281>" .. needSp .. "<PAOldColor>")
    ;
    (self._skillIcon):addInputEvent("Mouse_On", "enableSkill_OverEvent(" .. skillNo .. ",false, \"MainStatusSkill\")")
    ;
    (self._skillIcon):addInputEvent("Mouse_Out", "enableSkill_OverEventHide(" .. skillNo .. ",\"MainStatusSkill\")")
    ;
    (self._skillIcon):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_LearnButtonClick(" .. skillNo .. ")")
    ;
    (self._learnButton):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_LearnButtonClick(" .. skillNo .. ")")
    Panel_SkillTooltip_SetPosition(skillNo, self._skillIcon, "MainStatusSkill")
  end

  ;
  (ui._IconBG):addInputEvent("Mouse_LUp", "enableSkill_MoveSkill(" .. index .. ")")
  ;
  (ui._IconBG):addInputEvent("Mouse_On", "enableSkill_BackgroundOverEvent(" .. index .. ",true)")
  ;
  (ui._IconBG):addInputEvent("Mouse_Out", "enableSkill_BackgroundOverEvent(" .. index .. ",false)")
  ;
  (ui._IconBG):addInputEvent("Mouse_UpScroll", "enableSkill_Scroll( true )")
  ;
  (ui._IconBG):addInputEvent("Mouse_DownScroll", "enableSkill_Scroll( false )")
  ;
  (ui._RecommendBG):addInputEvent("Mouse_LUp", "enableSkill_MoveSkill(" .. index .. ")")
  ;
  (ui._RecommendBG):addInputEvent("Mouse_On", "enableSkill_BackgroundOverEvent(" .. index .. ",true)")
  ;
  (ui._RecommendBG):addInputEvent("Mouse_Out", "enableSkill_BackgroundOverEvent(" .. index .. ",false)")
  mousePosBG:addInputEvent("Mouse_LUp", "enableSkill_MoveSkill(" .. index .. ")")
  mousePosBG:addInputEvent("Mouse_On", "enableSkill_BackgroundOverEvent(" .. index .. ",true)")
  mousePosBG:addInputEvent("Mouse_Out", "enableSkill_BackgroundOverEvent(" .. index .. ",false)")
  ;
  (ui._RecommendBG):addInputEvent("Mouse_UpScroll", "enableSkill_Scroll( true )")
  ;
  (ui._RecommendBG):addInputEvent("Mouse_DownScroll", "enableSkill_Scroll( false )")
  ;
  (ui._skillIcon):addInputEvent("Mouse_UpScroll", "enableSkill_Scroll( true )")
  ;
  (ui._skillIcon):addInputEvent("Mouse_DownScroll", "enableSkill_Scroll( false )")
  comboBox:addInputEvent("Mouse_LUp", "ComboBox_show()")
  ;
  (comboBox:GetListControl()):addInputEvent("Mouse_LUp", "ComboBox_Set()")
  return ui
end

local skillNoCache = 0
local slotTypeCache = 0
local tooltipcacheCount = 0
enableSkill_BackgroundOverEvent = function(index, isOn)
  -- function num : 0_9 , upvalues : mousePosBG, onIndex
  if Panel_EnableSkill:isPlayAnimation() == true then
    return 
  end
  if isOn == true then
    mousePosBG:SetShow(true)
    mousePosBG:SetPosY(132 + index * (mousePosBG:GetSizeY() + 9))
  else
    if isOn == false then
      mousePosBG:SetShow(false)
    end
  end
  if isOn then
    onIndex = index
  else
    onIndex = -1
  end
end

enableSkill_MoveSkill = function(index)
  -- function num : 0_10 , upvalues : skillNumber, slideIndex
  if Panel_EnableSkill:isPlayAnimation() == true then
    return 
  end
  local rowNumber = (skillNumber[index + slideIndex])._row
  local colNumber = (skillNumber[index + slideIndex])._col
  local skillNoNumber = (skillNumber[index + slideIndex])._skillNo
  if (skillNumber[index + slideIndex])._awaken == 0 then
    PaGlobal_Skill:SkillWindowEffect(rowNumber, colNumber, skillNoNumber, true, true)
  else
    if (skillNumber[index + slideIndex])._awaken == 1 then
      PaGlobal_Skill:SkillWindowEffect(rowNumber, colNumber, skillNoNumber, true, false)
    end
  end
end

enableSkill_Simpletooltips = function(isShow, index)
  -- function num : 0_11 , upvalues : uiData
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ENABLESKILL_LEARNSKILL_BTN")
  control = (uiData[index])._learnButton
  TooltipSimple_Show(control, name, desc)
end

enableSkill_OverEventHide = function(skillNo, SlotType)
  -- function num : 0_12 , upvalues : skillNoCache, slotTypeCache, tooltipcacheCount
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount - 1
  else
    tooltipcacheCount = 0
  end
  if tooltipcacheCount <= 0 then
    Panel_SkillTooltip_Hide()
  end
end

enableSkill_OverEvent = function(skillNo, isShowNextLevel, SlotType)
  -- function num : 0_13 , upvalues : skillNoCache, slotTypeCache, tooltipcacheCount
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount + 1
  else
    skillNoCache = skillNo
    slotTypeCache = SlotType
    tooltipcacheCount = 1
  end
  Panel_SkillTooltip_Show(skillNo, false, SlotType)
end

enableSkill_Scroll = function(isUp)
  -- function num : 0_14 , upvalues : slideIndex, _slide, enableSkillList_MaxCount, Panel_EnableSkill_Value_elementCount, isEditCheck
  slideIndex = (UIScroll.ScrollEvent)(_slide, isUp, enableSkillList_MaxCount, Panel_EnableSkill_Value_elementCount, slideIndex, 1)
  enableSkill_UpdateData(isEditCheck)
end

EnableSkillWindow_EffectOff = function()
  -- function num : 0_15 , upvalues : isSkillLearnTutorialClick
  isSkillLearnTutorialClick = false
end

isSkillLearnTutorialClick_check = function()
  -- function num : 0_16 , upvalues : isSkillLearnTutorialClick
  return isSkillLearnTutorialClick
end

enableSkill_Init = function()
  -- function num : 0_17 , upvalues : mousePosBG, UI_PUCT, CopyUI, enableSkillList_MaxCount, uiData, radio, editSearch, _slide, _frameBG, isEditCheck, comboBox
  mousePosBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_EnableSkill, "Static_SkillYellowBG_")
  CopyBaseProperty(CopyUI._base_SkillYellowBG, mousePosBG)
  mousePosBG:SetShow(false)
  mousePosBG:SetIgnore(false)
  for index = 0, enableSkillList_MaxCount - 1 do
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R4 in 'UnsetPending'

    uiData[index] = enableSkill_MakeControl(index)
  end
  ;
  (radio._radioButton_LearnSkill):addInputEvent("Mouse_LUp", "RadioButton_Click( 0 )")
  ;
  (radio._radioButton_AllSkill):addInputEvent("Mouse_LUp", "RadioButton_Click( 1 )")
  if isGameTypeKorea() then
    (editSearch._editSearchText):SetMaxInput(20)
  else
    ;
    (editSearch._editSearchText):SetMaxInput(40)
  end
  ;
  (editSearch._editSearchText):SetShow(true)
  ;
  (editSearch._editSearchButton):SetShow(true)
  Panel_EnableSkill:RemoveControl(CopyUI._base_SkillBG)
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

  CopyUI._base_SkillBG = nil
  Panel_EnableSkill:RemoveControl(CopyUI._base_SkillBlueBG)
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

  CopyUI._base_SkillBlueBG = nil
  Panel_EnableSkill:RemoveControl(CopyUI._base_SkillYellowBG)
  -- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

  CopyUI._base_SkillYellowBG = nil
  Panel_EnableSkill:RemoveControl(CopyUI._base_SkillIcon)
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

  CopyUI._base_SkillIcon = nil
  Panel_EnableSkill:RemoveControl(CopyUI._base_SkillName)
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

  CopyUI._base_SkillName = nil
  ;
  (UIScroll.InputEvent)(_slide, "enableSkill_Scroll")
  _frameBG:addInputEvent("Mouse_UpScroll", "enableSkill_Scroll( true )")
  _frameBG:addInputEvent("Mouse_DownScroll", "enableSkill_Scroll( false )")
  ;
  (editSearch._editSearchButton):addInputEvent("Mouse_LUp", "SearchButton_Click()")
  ;
  (editSearch._editSearchText):addInputEvent("Mouse_LDown", "SearchText_Click()")
  ;
  (editSearch._editSearchText):addInputEvent("Mouse_LUp", "SearchText_Click()")
  ;
  (editSearch._editSearchText):RegistReturnKeyEvent("SearchButton_Click()")
  isAllCheck = (radio._radioButton_LearnSkill):SetCheck(true)
  isLearnCheck = (radio._radioButton_AllSkill):SetCheck(false)
  enableSkill_UpdateData(isEditCheck)
  Panel_EnableSkill:SetChildIndex(comboBox, 9998)
  RadioButton_Click(0)
end

FromClient_EventSkillWindowUpdate = function()
  -- function num : 0_18 , upvalues : slideIndex, _slide, isEditCheck
  slideIndex = 0
  _slide:SetControlPos(0)
  enableSkill_UpdateData(isEditCheck)
  PaGlobal_SkillCombination:update()
end

FromClient_UseSkillAskFromOtherPlayer = function(fromName)
  -- function num : 0_19
  local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ANSWERSKILL_QUESTTION", "from_name", fromName)
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_ANSWERSKILL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = UseSkillFromOtherPlayer_Yes, functionCancel = UseSkillFromOtherPlayer_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

UseSkillFromOtherPlayer_Yes = function()
  -- function num : 0_20
  ToClient_AnswerUseSkill(true)
end

UseSkillFromOtherPlayer_No = function()
  -- function num : 0_21
  ToClient_AnswerUseSkill(false)
end

EnableSkill_Setting = function()
  -- function num : 0_22 , upvalues : radio, comboBox, Panel_EnableSkill_Value_elementCount, recommendSkillCount, skillNumber, editSkillName, editSkillNo, maxRecommendCount, recommendSkill
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local cellTable = {[0] = nil, [1] = nil}
  local classType = selfPlayer:getClassType()
  if classType >= 0 then
    cellTable[0] = getAwakeningWeaponSkillTree(classType)
    cellTable[1] = getCombatSkillTree(classType)
  else
    return 
  end
  local isLearnCheck = (radio._radioButton_LearnSkill):IsCheck()
  local isAllCheck = (radio._radioButton_AllSkill):IsCheck()
  local selectIndex = comboBox:GetSelectIndex()
  Panel_EnableSkill_Value_elementCount = 0
  recommendSkillCount = 0
  for iii = 0, 1 do
    if cellTable[iii] == nil then
      return 
    end
    local cols = (cellTable[iii]):capacityX()
    local rows = (cellTable[iii]):capacityY()
    for row = 0, rows - 1 do
      for col = 0, cols - 1 do
        local cell = (cellTable[iii]):atPointer(col, row)
        local skillNo = cell._skillNo
        if cell:isSkillType() then
          local skillLevelInfo = getSkillLevelInfo(skillNo)
          local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
          local needSp = (skillStaticWrapper:get())._needSkillPointForLearning
          local recommendCheck = false
          local skillType = getSkillTypeStaticStatus(skillNo)
          -- DECOMPILER ERROR at PC99: Confused about usage of register: R27 in 'UnsetPending'

          -- DECOMPILER ERROR at PC99: Unhandled construct in 'MakeBoolean' P1

          if skillType:isValidLocalizing() and isAllCheck == true and not recommendCheck then
            skillNumber[Panel_EnableSkill_Value_elementCount] = {_skillNo = skillNo, _needSp = needSp, _row = row, _col = col, _awaken = iii}
            -- DECOMPILER ERROR at PC104: Confused about usage of register: R27 in 'UnsetPending'

            editSkillName[Panel_EnableSkill_Value_elementCount] = skillStaticWrapper:getName()
            -- DECOMPILER ERROR at PC107: Confused about usage of register: R27 in 'UnsetPending'

            editSkillNo[Panel_EnableSkill_Value_elementCount] = skillNo
            Panel_EnableSkill_Value_elementCount = Panel_EnableSkill_Value_elementCount + 1
          end
        end
        if isLearnCheck == true and skillLevelInfo._learnable then
          if selectIndex == -1 or selectIndex == 0 then
            for i = 0, maxRecommendCount - 1 do
              if skillNo == (recommendSkill[selfPlayer:getClassType()])[i] then
                for ii = Panel_EnableSkill_Value_elementCount + 1, recommendSkillCount, -1 do
                  -- DECOMPILER ERROR at PC148: Confused about usage of register: R35 in 'UnsetPending'

                  if recommendSkillCount == ii then
                    skillNumber[ii] = {_skillNo = skillNo, _needSp = needSp, _row = row, _col = col, _awaken = iii}
                  else
                    -- DECOMPILER ERROR at PC154: Confused about usage of register: R35 in 'UnsetPending'

                    skillNumber[ii] = skillNumber[ii - 1]
                  end
                end
                recommendSkillCount = recommendSkillCount + 1
                -- DECOMPILER ERROR at PC163: Confused about usage of register: R31 in 'UnsetPending'

                editSkillName[Panel_EnableSkill_Value_elementCount] = skillStaticWrapper:getName()
                -- DECOMPILER ERROR at PC166: Confused about usage of register: R31 in 'UnsetPending'

                editSkillNo[Panel_EnableSkill_Value_elementCount] = skillNo
                Panel_EnableSkill_Value_elementCount = Panel_EnableSkill_Value_elementCount + 1
                recommendCheck = true
              end
            end
          end
          do
            do
              -- DECOMPILER ERROR at PC182: Confused about usage of register: R27 in 'UnsetPending'

              if not recommendCheck then
                skillNumber[Panel_EnableSkill_Value_elementCount] = {_skillNo = skillNo, _needSp = needSp, _row = row, _col = col, _awaken = iii}
                -- DECOMPILER ERROR at PC187: Confused about usage of register: R27 in 'UnsetPending'

                editSkillName[Panel_EnableSkill_Value_elementCount] = skillStaticWrapper:getName()
                -- DECOMPILER ERROR at PC190: Confused about usage of register: R27 in 'UnsetPending'

                editSkillNo[Panel_EnableSkill_Value_elementCount] = skillNo
                Panel_EnableSkill_Value_elementCount = Panel_EnableSkill_Value_elementCount + 1
              end
              -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  return skillNumber
end

FGlobal_IsLearn = function()
  -- function num : 0_23 , upvalues : radio
  local isLearn = (radio._radioButton_LearnSkill):IsCheck()
  return isLearn
end

RadioButton_Click = function(radioIndex)
  -- function num : 0_24 , upvalues : comboBox, learnSkillTabIndex, comboBoxString, radio, allSkillTabIndex, skillEmptyText, searchFailText, isEditCheck, editSearch
  comboBox:DeleteAllItem(0)
  local count = 0
  if radioIndex == learnSkillTabIndex then
    for index = -1, #comboBoxString do
      comboBox:AddItem(comboBoxString[index])
      count = count + 1
    end
    ;
    (radio._radioButton_LearnSkill):SetCheck(true)
    ;
    (radio._radioButton_AllSkill):SetCheck(false)
  else
    if radioIndex == allSkillTabIndex then
      for index = 0, #comboBoxString do
        comboBox:AddItem(comboBoxString[index])
        count = count + 1
      end
      ;
      (radio._radioButton_LearnSkill):SetCheck(false)
      ;
      (radio._radioButton_AllSkill):SetCheck(true)
    end
  end
  comboBox:SetSelectItemIndex(0)
  ;
  (comboBox:GetListControl()):SetSize(comboBox:GetSizeX(), (count) * 20)
  skillEmptyText:SetShow(false)
  searchFailText:SetShow(false)
  RadioButton_Click_Init()
  isEditCheck = false
  ;
  (editSearch._editSearchText):SetEditText("", false)
  enableSkill_UpdateData(isEditCheck)
  ClearFocusEdit()
  HandleMLUp_SkillWindow_UpdateData()
end

SkillPoint_Sort = function(skillCount, comboIndex)
  -- function num : 0_25 , upvalues : skillNumber
  for i = 1, skillCount do
    for j = 1, skillCount - i do
      local skillStaticWrapper = getSkillStaticStatus((skillNumber[j - 1])._skillNo, 1)
      local needSp = (skillStaticWrapper:get())._needSkillPointForLearning
      local skillStaticWrapper = getSkillStaticStatus((skillNumber[j])._skillNo, 1)
      local nextNeedSp = (skillStaticWrapper:get())._needSkillPointForLearning
      -- DECOMPILER ERROR at PC39: Confused about usage of register: R15 in 'UnsetPending'

      -- DECOMPILER ERROR at PC40: Confused about usage of register: R14 in 'UnsetPending'

      -- DECOMPILER ERROR at PC40: Unhandled construct in 'MakeBoolean' P1

      if comboIndex == 2 and nextNeedSp < needSp then
        skillNumber[j] = skillNumber[j - 1]
      end
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R16 in 'UnsetPending'

      -- DECOMPILER ERROR at PC57: Confused about usage of register: R14 in 'UnsetPending'

      if (comboIndex == 1 or comboIndex == 0) and needSp < nextNeedSp then
        skillNumber[j - 1] = skillNumber[j]
      end
    end
  end
end

ComboBox_show = function()
  -- function num : 0_26 , upvalues : comboBox
  comboBox:ToggleListbox()
end

ComboBox_Set = function()
  -- function num : 0_27 , upvalues : comboBox, isEditCheck
  comboBox:SetSelectItemIndex(comboBox:GetSelectIndex())
  comboBox:ToggleListbox()
  enableSkill_UpdateData(isEditCheck)
end

RadioButton_Click_Init = function()
  -- function num : 0_28 , upvalues : _slide, slideIndex, Panel_EnableSkill_Value_elementCount
  _slide:SetControlPos(0)
  slideIndex = 0
  Panel_EnableSkill_Value_elementCount = 0
  ClearFocusEdit()
end

SearchButton_Click = function()
  -- function num : 0_29 , upvalues : mousePosBG, slideIndex, filterText, editSearch, isEditCheck
  if CheckChattingInput() == false then
    ClearFocusEdit()
  end
  mousePosBG:SetShow(false)
  slideIndex = 0
  filterText = (editSearch._editSearchText):GetEditText()
  if filterText ~= nil and filterText:len() ~= 0 then
    isEditCheck = true
  else
    isEditCheck = false
  end
  enableSkill_UpdateData(isEditCheck)
end

SearchEditText_Reset = function()
  -- function num : 0_30 , upvalues : _slide, slideIndex, Panel_EnableSkill_Value_elementCount, editSearch, isEditCheck
  _slide:SetControlPos(0)
  slideIndex = 0
  Panel_EnableSkill_Value_elementCount = 0
  ClearFocusEdit()
  ;
  (editSearch._editSearchText):SetEditText("", false)
  isEditCheck = false
  enableSkill_UpdateData(isEditCheck)
end

SearchText_Click = function()
  -- function num : 0_31 , upvalues : editSearch
  SetFocusEdit(editSearch._editSearchText)
  ;
  (editSearch._editSearchText):SetEditText("", false)
end

local stringMatching = function(filterText, editSkillName)
  -- function num : 0_32
  return stringSearch(filterText, editSkillName)
end

EnableSearchSkill_Setting = function()
  -- function num : 0_33 , upvalues : Panel_EnableSkill_Value_elementCount, stringMatching, editSkillName, filterText, editSkillNo, skillNumber, isEditCheck
  enableSkill_UpdateData(false)
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local cellTable = {[0] = nil, [1] = nil}
  local classType = selfPlayer:getClassType()
  if classType >= 0 then
    cellTable[0] = getAwakeningWeaponSkillTree(classType)
    cellTable[1] = getCombatSkillTree(classType)
  else
    return 
  end
  local editSkillMatchNo = {}
  local editSkillCount = 0
  for i = 1, Panel_EnableSkill_Value_elementCount do
    local stringMatch = stringMatching(editSkillName[i - 1], filterText)
    if filterText ~= nil and filterText:len() ~= 0 and stringMatch == true then
      editSkillMatchNo[editSkillCount] = editSkillNo[i - 1]
      editSkillCount = editSkillCount + 1
    end
  end
  local allSkillCount = 0
  for iii = 0, 1 do
    local cols = (cellTable[iii]):capacityX()
    local rows = (cellTable[iii]):capacityY()
    if filterText ~= nil and filterText:len() ~= 0 then
      for row = 0, rows - 1 do
        for col = 0, cols - 1 do
          local cell = (cellTable[iii]):atPointer(col, row)
          local skillNo = cell._skillNo
          allSkillCount = allSkillCount + 1
          if cell:isSkillType() then
            for i = 0, editSkillCount do
              -- DECOMPILER ERROR at PC104: Confused about usage of register: R26 in 'UnsetPending'

              if skillNo == editSkillMatchNo[i] then
                skillNumber[i] = {_skillNo = skillNo, _row = row, _col = col, _awaken = iii}
              end
            end
          end
        end
      end
    end
  end
  isEditCheck = true
  return skillNumber, editSkillCount, allSkillCount
end

enableSkill_Init()
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelEnableSkill\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelEnableSkill\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelEnableSkill\", \"false\")")
registerEvent("EventSkillWindowUpdate", "FromClient_EventSkillWindowUpdate")
registerEvent("FromClient_UseSkillAskFromOtherPlayer", "FromClient_UseSkillAskFromOtherPlayer")

