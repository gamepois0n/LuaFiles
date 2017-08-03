-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_util.luac 

-- params : ...
-- function num : 0
Util = {}
local _math_floor = math.floor
local _math_sin = math.sin
local _math_cos = math.cos
local _math_pi = math.pi
local _math_sqrt = math.sqrt
local _math_atan2 = math.atan2
local _time_Formatting = function(second)
  -- function num : 0_0 , upvalues : _math_floor
  local formatter = {PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE"), PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR"), PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")}
  if second == 0 then
    return tostring(0) .. formatter[0]
  end
  local timeVal = {}
  timeVal[0] = second
  timeVal[1] = _math_floor(timeVal[0] / 60)
  timeVal[0] = timeVal[0] - timeVal[1] * 60
  timeVal[2] = _math_floor(timeVal[1] / 60)
  timeVal[1] = timeVal[1] - timeVal[2] * 60
  timeVal[3] = _math_floor(timeVal[2] / 24)
  timeVal[2] = timeVal[2] - timeVal[3] * 24
  local resultString = ""
  for i = 0, 3 do
    if (string.len)(resultString) > 0 then
      resultString = " " .. resultString
    end
    if timeVal[i] > 0 then
      resultString = tostring(timeVal[i]) .. formatter[i] .. resultString
    end
  end
  return resultString
end

local _time_Formatting_Minute = function(second)
  -- function num : 0_1 , upvalues : _math_floor
  local formatter = {PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE"), PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR"), PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")}
  if second < 60 then
    return " 0" .. formatter[1]
  end
  local timeVal = {}
  timeVal[0] = second
  timeVal[1] = _math_floor(timeVal[0] / 60)
  timeVal[0] = timeVal[0] - timeVal[1] * 60
  timeVal[2] = _math_floor(timeVal[1] / 60)
  timeVal[1] = timeVal[1] - timeVal[2] * 60
  timeVal[3] = _math_floor(timeVal[2] / 24)
  timeVal[2] = timeVal[2] - timeVal[3] * 24
  local resultString = ""
  for i = 1, 3 do
    if (string.len)(resultString) > 0 then
      resultString = " " .. resultString
    end
    if timeVal[i] > 0 then
      resultString = tostring(timeVal[i]) .. formatter[i] .. resultString
    end
  end
  return resultString
end

local u64_Zero = (Defines.u64_const).u64_0
local u64_1000 = (Defines.u64_const).u64_1000
local u64_Hour = toUint64(0, 3600)
local u64_Minute = toUint64(0, 60)
local _time_Formatting_ShowTop = function(second_u64)
  -- function num : 0_2 , upvalues : u64_Hour, u64_Minute
  if u64_Hour * toInt64(0, 2) < second_u64 then
    local recalc_time = second_u64 / u64_Hour
    local strHour = (string.format)("%d", Int64toInt32(recalc_time))
    return PAGetStringParam1(Defines.StringSheet_GAME, "BUFF_HOUR", "time_hour", strHour)
  else
    do
      if u64_Minute < second_u64 then
        local recalc_time = second_u64 / u64_Minute
        local strMinute = (string.format)("%d", Int64toInt32(recalc_time))
        return PAGetStringParam1(Defines.StringSheet_GAME, "BUFF_MINUTE", "time_minute", strMinute)
      else
        do
          local recalc_time = second_u64
          local strSecond = (string.format)("%d", Int64toInt32(recalc_time))
          do return PAGetStringParam1(Defines.StringSheet_GAME, "BUFF_SECOND", "time_second", strSecond) end
        end
      end
    end
  end
end

local _time_GameTimeFormatting = function(inGameMinute)
  -- function num : 0_3 , upvalues : _math_floor
  local clockMinute = inGameMinute % 60
  local clockHour = _math_floor(inGameMinute / 60)
  local calcMinute = "00"
  if clockMinute < 10 then
    calcMinute = "0" .. clockMinute
  else
    calcMinute = "" .. clockMinute
  end
  local calcHour = ""
  if clockHour < 12 or clockHour == 24 then
    calcHour = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_TIME_MORNING") .. " "
  else
    calcHour = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_TIME_AFTERNOON") .. " "
  end
  if clockHour > 12 then
    clockHour = clockHour - 12
  end
  calcHour = calcHour .. tostring(clockHour) .. " : " .. calcMinute
  return calcHour
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R14 in 'UnsetPending'

Util.Time = {timeFormatting = _time_Formatting, timeFormatting_Minute = _time_Formatting_Minute, inGameTimeFormatting = _time_GameTimeFormatting, inGameTimeFormattingTop = _time_Formatting_ShowTop}
local _math_calculateCross = function(lho, rho)
  -- function num : 0_4
  local v = {}
  return float3(lho.y * rho.z - lho.z * rho.y, lho.z * rho.x - lho.x * rho.z, lho.x * rho.y - lho.y * rho.x)
end

local _math_calculateDot = function(lho, rho)
  -- function num : 0_5
  return lho.x * rho.x + lho.y * rho.y + lho.z * rho.z
end

local _math_calculateLength = function(vector)
  -- function num : 0_6 , upvalues : _math_sqrt, _math_calculateDot
  return _math_sqrt(_math_calculateDot(vector, vector))
end

local _math_calculateDistance = function(from, to)
  -- function num : 0_7 , upvalues : _math_calculateLength
  return _math_calculateLength(float3(from.x - to.x, from.y - to.y, from.z - to.z))
end

local _math_calculateNormalVector = function(vector)
  -- function num : 0_8 , upvalues : _math_calculateLength
  local len = _math_calculateLength(vector)
  return float3(vector.x / len, vector.y / len, vector.z / len)
end

local _math_calculateSpinVector = function(axis, radian)
  -- function num : 0_9 , upvalues : _math_calculateCross, _math_calculateNormalVector, _math_cos, _math_sin
  local axisCorss = _math_calculateCross({x = 0, y = 1, z = 0}, axis)
  local axisUp = _math_calculateCross(axisCorss, axis)
  return _math_calculateNormalVector(float3(axisCorss.x * -_math_cos(radian) + axisUp.x * -_math_sin(radian), axisCorss.y * -_math_cos(radian) + axisUp.y * -_math_sin(radian), axisCorss.z * -_math_cos(radian) + axisUp.z * -_math_sin(radian)))
end

local _math_lerp = function(from, to, factor)
  -- function num : 0_10
  return from * (1 - factor) + to * factor
end

local _math_lerpVector = function(from, to, factor)
  -- function num : 0_11 , upvalues : _math_lerp
  return float3(_math_lerp(from.x, to.x, factor), _math_lerp(from.y, to.y, factor), _math_lerp(from.z, to.z, factor))
end

local _math_calculateDirection = function(from, to)
  -- function num : 0_12 , upvalues : _math_calculateNormalVector
  return _math_calculateNormalVector(float3(to.x - from.x, to.y - from.y, to.z - from.z))
end

local _math_convertRotationToDirection = function(radian)
  -- function num : 0_13 , upvalues : _math_sin, _math_cos
  return {x = -_math_sin(radian), y = 0, z = -_math_cos(radian)}
end

local _math_convertDirectionToRotation = function(dir)
  -- function num : 0_14 , upvalues : _math_atan2
  return _math_atan2(-dir.x, -dir.z)
end

local _math_radianFix = function(radian)
  -- function num : 0_15 , upvalues : _math_floor, _math_pi
  local fixRadian = radian
  if fixRadian < 0 then
    local nDivide = _math_floor(-fixRadian / (_math_pi * 2)) + 1
    fixRadian = fixRadian + nDivide * _math_pi * 2
  else
    do
      do
        local nDivide = _math_floor((fixRadian) / (_math_pi * 2)) + 1
        fixRadian = fixRadian - nDivide * _math_pi * 2
        return fixRadian
      end
    end
  end
end

local _math_calculateSinCurve = function(startPoint, endPoint, offset, height, rotate, lerpFactor)
  -- function num : 0_16 , upvalues : _math_sin, _math_pi, _math_lerp, _math_calculateDirection, _math_calculateSpinVector
  local SunHeight = _math_sin(lerpFactor * _math_pi)
  local resultPoint = float3(0, 0, 0)
  resultPoint.x = _math_lerp(startPoint.x, endPoint.x, lerpFactor)
  resultPoint.y = _math_lerp(startPoint.y, endPoint.y, lerpFactor)
  resultPoint.z = _math_lerp(startPoint.z, endPoint.z, lerpFactor)
  local spinAxis = _math_calculateDirection(endPoint, startPoint)
  spinAxis = _math_calculateSpinVector(spinAxis, _math_pi * rotate)
  resultPoint.x = resultPoint.x + offset.x + spinAxis.x * SunHeight * height
  resultPoint.y = resultPoint.y + offset.y + spinAxis.y * SunHeight * height
  resultPoint.z = resultPoint.z + offset.z + spinAxis.z * SunHeight * height
  return resultPoint
end

local _math_AddVectorToVector = function(lho, rho)
  -- function num : 0_17
  return float3(lho.x + rho.x, lho.y + rho.y, lho.z + rho.z)
end

local _math_AddNumberToVector = function(lho, rho)
  -- function num : 0_18
  return float3(lho.x + rho, lho.y + rho, lho.z + rho)
end

local _math_MulNumberToVector = function(lho, rho)
  -- function num : 0_19
  return float3(lho.x * rho, lho.y * rho, lho.z * rho)
end

local _math_calculateSinCurveList = function(startPoint, endPoint, offset, height, rotate, lerpCount)
  -- function num : 0_20 , upvalues : _math_calculateDirection, _math_calculateSpinVector, _math_pi, _math_AddVectorToVector, _math_lerpVector, _math_MulNumberToVector, _math_sin
  local spinAxis = _math_calculateDirection(endPoint, startPoint)
  spinAxis = _math_calculateSpinVector(spinAxis, _math_pi * rotate)
  local resultPointList = {}
  local lerpFactor = nil
  for i = 0, lerpCount do
    lerpFactor = i / lerpCount
    resultPointList[i] = _math_AddVectorToVector(_math_AddVectorToVector(offset, _math_lerpVector(startPoint, endPoint, lerpFactor)), _math_MulNumberToVector(spinAxis, _math_sin(lerpFactor * _math_pi) * height))
  end
  return resultPointList
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R31 in 'UnsetPending'

Util.Math = {calculateCross = _math_calculateCross, calculateDot = _math_calculateDot, calculateLength = _math_calculateLength, calculateDistance = _math_calculateDistance, calculateNormalVector = _math_calculateNormalVector, calculateSpinVector = _math_calculateSpinVector, Lerp = _math_lerp, LerpVector = _math_lerpVector, calculateDirection = _math_calculateDirection, convertRotationToDirection = _math_convertRotationToDirection, convertDirectionToRotation = _math_convertDirectionToRotation, radianFix = _math_radianFix, calculateSinCurve = _math_calculateSinCurve, AddVectorToVector = _math_AddVectorToVector, AddNumberToVector = _math_AddNumberToVector, MulNumberToVector = _math_MulNumberToVector, calculateSinCurveList = _math_calculateSinCurveList}
local _table_sizeofDictionary = function(dictionary)
  -- function num : 0_21
  local size = 0
  for key,values in pairs(dictionary) do
    size = size + 1
  end
  return size
end

local _table_isEmptyDictionary = function(dictionary)
  -- function num : 0_22
  for key,values in pairs(dictionary) do
    do return false end
  end
  return true
end

local _table_fill = function(_table, _start, _end, _value)
  -- function num : 0_23
  for ii = _start, _end do
    _table[ii] = _value
  end
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R34 in 'UnsetPending'

Util.Table = {sizeofDictionary = _table_sizeofDictionary, isEmptyDictionary = _table_isEmptyDictionary, fill = _table_fill}
Array = {}
-- DECOMPILER ERROR at PC121: Confused about usage of register: R34 in 'UnsetPending'

Array.__index = Array
-- DECOMPILER ERROR at PC124: Confused about usage of register: R34 in 'UnsetPending'

Array.new = function()
  -- function num : 0_24
  local arr = {}
  setmetatable(arr, Array)
  return arr
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R34 in 'UnsetPending'

Array.resize = function(self, _size, _value)
  -- function num : 0_25 , upvalues : _table_fill
  if #self < _size then
    _table_fill(self, #self + 1, _size, _value)
  else
    if _size < #self then
      _table_fill(self, _size + 1, #self, nil)
    end
  end
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R34 in 'UnsetPending'

Array.fill = function(self, from, to, iter)
  -- function num : 0_26
  local ii = 1
  if not iter then
    iter = 1
  end
  for value = from, to, iter do
    self[ii] = value
    ii = ii + 1
  end
end

-- DECOMPILER ERROR at PC134: Confused about usage of register: R34 in 'UnsetPending'

Array.printi = function(self, f)
  -- function num : 0_27
  if not f then
    f = print
  end
  for k,v in ipairs(self) do
    f(v)
  end
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R34 in 'UnsetPending'

Array.length = function(self)
  -- function num : 0_28
  return #self
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R34 in 'UnsetPending'

Array.push_back = function(self, msg)
  -- function num : 0_29
  self[self:length() + 1] = msg
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R34 in 'UnsetPending'

Array.pop_back = function(self)
  -- function num : 0_30
  local length = self:length()
  local v = self[length]
  self[length] = nil
  return v
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R34 in 'UnsetPending'

Array.pop_front = function(self)
  -- function num : 0_31
  do
    if self:length() > 0 then
      local tmp, _length = nil, nil
      tmp = self[1]
      _length = self:length()
      for ii = 2, _length do
        self[ii - 1] = self[ii]
      end
      self[_length] = nil
      return tmp
    end
    return 
  end
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R34 in 'UnsetPending'

Array.toString = function(self, deliminator)
  -- function num : 0_32
  if not deliminator then
    deliminator = "\n"
  end
  local tmpStr = ""
  for k,v in ipairs(self) do
    tmpStr = tmpStr .. v .. deliminator
  end
  return tmpStr
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R34 in 'UnsetPending'

Array.quicksort = function(self, f)
  -- function num : 0_33
  if type(f) ~= "function" then
    return 
  end
  self.compFunc = f
  self:_quicksort(1, #self)
  self.compFunc = nil
end

-- DECOMPILER ERROR at PC155: Confused about usage of register: R34 in 'UnsetPending'

Array._quicksort = function(self, is, ie)
  -- function num : 0_34
  local mid = self:_sortPartition(is, ie)
  if is < mid then
    self:_quicksort(is, mid - 1)
  end
  if mid < ie then
    self:_quicksort(mid + 1, ie)
  end
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R34 in 'UnsetPending'

Array._sortPartition = function(self, is, ie)
  -- function num : 0_35 , upvalues : _math_floor
  local ir = _math_floor((is + ie) / 2)
  self[ir] = self[ie]
  local i, j = is - 1, is
  while j < ie do
    if (self.compFunc)(self[j], self[ie]) > 0 then
      i = i + 1
      self[i] = self[j]
    end
    j = j + 1
  end
  self[i + 1] = self[ie]
  return i + 1
end

local __string_find = string.find
local __string_sub = string.sub
local __string_len = string.len
-- DECOMPILER ERROR at PC171: Confused about usage of register: R37 in 'UnsetPending'

string.split = function(str, pattern)
  -- function num : 0_36 , upvalues : __string_len, __string_find, __string_sub
  local pattern_length = __string_len(pattern)
  local str_length = __string_len(str)
  if pattern_length <= 0 or str_length < pattern_length then
    return {str}
  end
  local fStart, fEnd = nil, nil
  local index = 1
  local ii = 1
  local res = {}
  while 1 do
    if str_length < index then
      break
    end
    fStart = __string_find(str, pattern, index, true)
    if fStart == nil then
      res[ii] = __string_sub(str, index, str_length)
      break
    end
    res[ii] = __string_sub(str, index, fStart - 1)
    index = fEnd + 1
    ii = ii + 1
  end
  return res
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R37 in 'UnsetPending'

string.wlen = function(str)
  -- function num : 0_37
  local len = (string.len)(str)
  local strwLen = 1
  local retVal = 0
  local byteVal = ""
  while strwLen <= len do
    byteVal = (string.byte)(str, strwLen)
    if byteVal >= 128 then
      strwLen = strwLen + 2
    else
      strwLen = strwLen + 1
    end
    retVal = retVal + 1
  end
  return retVal
end

GlobalExitGameClient = function()
  -- function num : 0_38
  exitGameClient(true)
end

converStringFromLeftDateTime = function(s64_datetime)
  -- function num : 0_39
  local leftDate = getLeftSecond_TTime64(s64_datetime)
  return convertStringFromDatetime(leftDate)
end

convertStringFromDatetime = function(s64_datetime)
  -- function num : 0_40
  local s64_dayCycle = toInt64(0, 86400)
  local s64_hourCycle = toInt64(0, 3600)
  local s64_minuteCycle = toInt64(0, 60)
  local s64_day = s64_datetime / s64_dayCycle
  local s64_hour = (s64_datetime - s64_dayCycle * s64_day) / s64_hourCycle
  local s64_minute = (s64_datetime - s64_dayCycle * s64_day - s64_hourCycle * s64_hour) / s64_minuteCycle
  local s64_Second = s64_datetime - s64_dayCycle * s64_day - s64_hourCycle * s64_hour - s64_minuteCycle * s64_minute
  local strDate = ""
  if (Defines.s64_const).s64_0 < s64_day and (Defines.s64_const).s64_0 < s64_hour then
    strDate = tostring(s64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY") .. tostring(s64_hour) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR")
  else
    if (Defines.s64_const).s64_0 < s64_day then
      strDate = tostring(s64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY")
    else
      if (Defines.s64_const).s64_0 < s64_hour then
        strDate = tostring(s64_hour) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR") .. tostring(s64_minute) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE")
      else
        if (Defines.s64_const).s64_0 < s64_minute then
          strDate = tostring(s64_minute) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE") .. tostring(s64_Second) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")
        else
          if (Defines.s64_const).s64_0 <= s64_Second then
            strDate = tostring(s64_Second) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")
          else
            strDate = ""
          end
        end
      end
    end
  end
  return strDate
end

convertStringFromDatetimeForSkillTooltip = function(datetime)
  -- function num : 0_41
  local s64_dayCycle = 86400
  local s64_hourCycle = 3600
  local s64_minuteCycle = 60
  local s64_day = (math.floor)(datetime / s64_dayCycle)
  local s64_hour = (math.floor)((datetime - s64_dayCycle * s64_day) / s64_hourCycle)
  local s64_minute = (math.floor)((datetime - s64_dayCycle * s64_day - s64_hourCycle * s64_hour) / s64_minuteCycle)
  local s64_Second = datetime - s64_dayCycle * s64_day - s64_hourCycle * s64_hour - s64_minuteCycle * s64_minute
  local strDate = ""
  if s64_day > 0 and s64_hour > 0 then
    strDate = tostring(s64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY") .. tostring(s64_hour) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR")
  else
    if s64_day > 0 then
      strDate = tostring(s64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY")
    else
      if s64_hour > 0 then
        strDate = tostring(s64_hour) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR") .. tostring(s64_minute) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE")
      else
        if s64_minute > 0 then
          strDate = tostring(s64_minute) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE") .. tostring(s64_Second) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")
        else
          if s64_Second >= 0 then
            strDate = tostring(s64_Second) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")
          else
            strDate = ""
          end
        end
      end
    end
  end
  return strDate
end

calculateDayFromDateDay = function(s64_datetime)
  -- function num : 0_42
  local s64_dayCycle = toInt64(0, 86400)
  local s64_day = s64_datetime / s64_dayCycle
  return s64_day
end

convertStringFromDatetimeOverHour = function(s64_datetime)
  -- function num : 0_43
  local s64_dayCycle = toInt64(0, 86400)
  local s64_hourCycle = toInt64(0, 3600)
  local s64_day = s64_datetime / s64_dayCycle
  local s64_hour = (s64_datetime - s64_dayCycle * s64_day) / s64_hourCycle
  local strDate = ""
  if (Defines.s64_const).s64_0 < s64_day then
    strDate = tostring(s64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY")
  else
    if (Defines.s64_const).s64_0 < s64_hour then
      strDate = tostring(s64_hour) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR")
    else
      strDate = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR_IN")
    end
  end
  return strDate
end

convertStringFromDatetimeOverHourForFriends = function(s64_datetime)
  -- function num : 0_44
  local s64_dayCycle = toInt64(0, 86400)
  local s64_hourCycle = toInt64(0, 3600)
  local s64_day = s64_datetime / s64_dayCycle
  local s64_hour = (s64_datetime - s64_dayCycle * s64_day) / s64_hourCycle
  local strDate = ""
  if (Defines.s64_const).s64_0 < s64_day then
    strDate = tostring(s64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY")
  else
    if s64_hour <= toInt64(0, 24) then
      strDate = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_UTIL_TODAY")
    end
  end
  return strDate
end

convertStringFromMillisecondtime = function(u64_Millisecondtime)
  -- function num : 0_45
  local u64_dayCycle = toUint64(0, 86400000)
  local u64_houseCycle = toUint64(0, 3600000)
  local u64_minuteCycle = toUint64(0, 60000)
  local u64_day = u64_Millisecondtime / u64_dayCycle
  local u64_hour = (u64_Millisecondtime - u64_dayCycle * u64_day) / u64_houseCycle
  local u64_minute = (u64_Millisecondtime - u64_dayCycle * u64_day - u64_houseCycle * u64_hour) / u64_minuteCycle
  local u64_Second = (u64_Millisecondtime - u64_dayCycle * u64_day - u64_houseCycle * u64_hour - u64_minuteCycle * u64_minute) / toUint64(0, 1000)
  local strDate = ""
  if (Defines.u64_const).u64_0 < u64_day then
    strDate = tostring(u64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY") .. tostring(u64_hour) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR")
  else
    if (Defines.u64_const).u64_0 < u64_hour then
      strDate = tostring(u64_hour) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_HOUR") .. tostring(u64_minute) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE")
    else
      if (Defines.u64_const).u64_0 < u64_minute then
        strDate = tostring(u64_minute) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE") .. tostring(u64_Second) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")
      else
        if (Defines.u64_const).u64_0 < u64_Second then
          strDate = tostring(u64_Second) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")
        else
          strDate = ""
        end
      end
    end
  end
  return strDate
end

local UI_color = Defines.Color
local UI_CT = CppEnums.ChatType
local UI_CNT = CppEnums.EChatNoticeType
teamColorSettingList = {UI_color.C_FF84FFF5, UI_color.C_FF5922a3, UI_color.C_FF160929, UI_color.C_FFfdc9c8, UI_color.C_FFfa5d59, UI_color.C_FF7c1311, UI_color.C_FF80b9e6, UI_color.C_FF55a1dd, UI_color.C_FF014d89, UI_color.C_FF003966, UI_color.C_FFfef2b2, UI_color.C_FFbea216, UI_color.C_FFc1f8d1, UI_color.C_FF09e447, UI_color.C_FF023912, UI_color.C_FFfc5b95, UI_color.C_FFfb2472, UI_color.C_FF3f091d, UI_color.C_FFff8f59, UI_color.C_FFa2a2a2, UI_color.C_FF000000, UI_color.C_FF906bc1, UI_color.C_FFfa6e6b, UI_color.C_FFa61a17, UI_color.C_FFa8cfee, UI_color.C_FF015699, UI_color.C_FFfee568, UI_color.C_FFfdd81e, UI_color.C_FFfd92b9; [0] = UI_color.C_FFff6922}
FGlobal_TeamColorList = function(index)
  -- function num : 0_46 , upvalues : UI_color
  if index < 0 or index >= 30 then
    return UI_color.C_FFC4BEBE
  end
  return teamColorSettingList[index]
end

colorSettingList = {UI_color.C_FFc6b4e0, UI_color.C_FFac91d1, UI_color.C_FF906bc1, UI_color.C_FF8359ba, UI_color.C_FF5922a3, UI_color.C_FF43197a, UI_color.C_FF3c176d, UI_color.C_FF2c1151, UI_color.C_FF1e0c38, UI_color.C_FF160929, UI_color.C_FFfdc9c8, UI_color.C_FFfdb5b4, UI_color.C_FFfc9391, UI_color.C_FFfa6e6b, UI_color.C_FFfa5d59, UI_color.C_FFf82722, UI_color.C_FFba1d19, UI_color.C_FFa61a17, UI_color.C_FF7c1311, UI_color.C_FF550d0c, UI_color.C_FF3e0a09, UI_color.C_FFbfdcf2, UI_color.C_FFa8cfee, UI_color.C_FF80b9e6, UI_color.C_FF55a1dd, UI_color.C_FF4196d9, UI_color.C_FF0173cc, UI_color.C_FF015699, UI_color.C_FF014d89, UI_color.C_FF003966, UI_color.C_FF002746, UI_color.C_FF001d33, UI_color.C_FFfef5c7, UI_color.C_FFfef2b2, UI_color.C_FFfeec8f, UI_color.C_FFfee568, UI_color.C_FFfee256, UI_color.C_FFfdd81e, UI_color.C_FFbea216, UI_color.C_FFaa9114, UI_color.C_FF7e6c0f, UI_color.C_FF564a0a, UI_color.C_FF3f3608, UI_color.C_FFc1f8d1, UI_color.C_FFabf6c0, UI_color.C_FF84f2a3, UI_color.C_FF5aed84, UI_color.C_FF47eb75, UI_color.C_FF09e447, UI_color.C_FF07ab35, UI_color.C_FF069930, UI_color.C_FF047223, UI_color.C_FF034e18, UI_color.C_FF023912, UI_color.C_FFfec8dc, UI_color.C_FFfeb4cf, UI_color.C_FFfd92b9, UI_color.C_FFfc6ca0, UI_color.C_FFfc5b95, UI_color.C_FFfb2472, UI_color.C_FFbc1b55, UI_color.C_FFa8184c, UI_color.C_FF7d1239, UI_color.C_FF560c27, UI_color.C_FF3f091d, UI_color.C_FFffd9c8, UI_color.C_FFffccb4, UI_color.C_FFffb491, UI_color.C_FFff9a6b, UI_color.C_FFff8f59, UI_color.C_FFff6922, UI_color.C_FFbf4f19, UI_color.C_FFab4617, UI_color.C_FF7f3411, UI_color.C_FF57240c, UI_color.C_FF401a09, UI_color.C_FFfefefe, UI_color.C_FFcbcbcb, UI_color.C_FFa2a2a2, UI_color.C_FF828282, UI_color.C_FF656565, UI_color.C_FF474747, UI_color.C_FF323232, UI_color.C_FF232323, UI_color.C_FF181818, UI_color.C_FF111111, UI_color.C_FF000000; [0] = UI_color.C_FFd5c8e8}
FGlobal_ColorList = function(index)
  -- function num : 0_47 , upvalues : UI_color
  if index < 0 or index >= 88 then
    return UI_color.C_FFC4BEBE
  end
  return colorSettingList[index]
end

Chatting_MessageColor = function(msgChatType, msgNoticeType, panelIndex)
  -- function num : 0_48 , upvalues : UI_color, UI_CT, UI_CNT
  local msgColor = UI_color.C_FFE7E7E7
  if msgChatType == nil or msgChatType < -1 or msgChatType > 18 then
    return UI_color.C_FFC4BEBE
  end
  local chatColorIndex = -1
  do
    if panelIndex ~= nil then
      local chat = ToClient_getChattingPanel(panelIndex)
      if chat ~= nil then
        if UI_CT.System ~= msgChatType then
          chatColorIndex = chat:getChatColorIndex(msgChatType)
        else
          chatColorIndex = chat:getChatSystemColorIndex(msgChatType)
        end
      end
    end
    -- DECOMPILER ERROR at PC39: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Public == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFE7E7E7
      return msgColor
    end
    -- DECOMPILER ERROR at PC49: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Party == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FF8EBD00
      return msgColor
    end
    -- DECOMPILER ERROR at PC59: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Guild == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FF84FFF5
      return msgColor
    end
    -- DECOMPILER ERROR at PC69: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.World == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFFF973A
      return msgColor
    end
    -- DECOMPILER ERROR at PC79: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Private == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFF601FF
      return msgColor
    end
    -- DECOMPILER ERROR at PC89: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.System == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFC4BEBE
      return msgColor
    end
    -- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Notice == msgChatType and UI_CNT.Normal == msgNoticeType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFFFEF82
      return msgColor
    end
    -- DECOMPILER ERROR at PC117: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Notice == msgChatType and UI_CNT.Campaign == msgNoticeType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFBBFF84
      return msgColor
    end
    -- DECOMPILER ERROR at PC131: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Notice == msgChatType and UI_CNT.Emergency == msgNoticeType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFFF4B4B
      return msgColor
    end
    if UI_CT.Alliance == msgChatType then
      msgColor = UI_color.C_FF84FFF5
      return msgColor
    else
      -- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P1

      if UI_CT.WorldWithItem == msgChatType and chatColorIndex == -1 then
        msgColor = UI_color.C_FF00F3A0
        return msgColor
      end
    end
    -- DECOMPILER ERROR at PC159: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.LocalWar == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFB97FEF
      return msgColor
    end
    -- DECOMPILER ERROR at PC169: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.RolePlay == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FF00B4FF
      return msgColor
    end
    -- DECOMPILER ERROR at PC183: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Arsha == msgChatType and UI_CNT.PvPHost == msgNoticeType and chatColorIndex == -1 then
      msgColor = UI_color.C_FF00B4FF
      return msgColor
    end
    -- DECOMPILER ERROR at PC193: Unhandled construct in 'MakeBoolean' P1

    if UI_CT.Arsha == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFFFD237
      return msgColor
    end
    if UI_CT.Team == msgChatType and chatColorIndex == -1 then
      msgColor = UI_color.C_FFB97FEF
      return msgColor
    end
    return FGlobal_ColorList(chatColorIndex)
  end
end

getUseMemory = function()
  -- function num : 0_49
  return collectgarbage("count", 0)
end

in_array = function(e, t)
  -- function num : 0_50
  for _,v in pairs(t) do
    if v == e then
      return true
    end
  end
  return false
end

getContryTypeLua = function()
  -- function num : 0_51
  local returnValue = -1
  local gameServiceType = getGameServiceType()
  local eCountryType = CppEnums.CountryType
  if eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType then
    returnValue = (CppEnums.ContryCode).eContryCode_KOR
  else
    if eCountryType.JPN_ALPHA == gameServiceType or eCountryType.JPN_REAL == gameServiceType then
      returnValue = (CppEnums.ContryCode).eContryCode_JAP
    else
      if eCountryType.RUS_ALPHA == gameServiceType or eCountryType.RUS_REAL == gameServiceType then
        returnValue = (CppEnums.ContryCode).eContryCode_RUS
      else
        if eCountryType.KR2_ALPHA == gameServiceType or eCountryType.KR2_REAL == gameServiceType then
          returnValue = (CppEnums.ContryCode).eContryCode_KR2
        else
          if eCountryType.NA_ALPHA == gameServiceType or eCountryType.NA_REAL == gameServiceType then
            returnValue = (CppEnums.ContryCode).eContryCode_NA
          else
            if eCountryType.TW_ALPHA == gameServiceType or eCountryType.TW_REAL == gameServiceType then
              returnValue = (CppEnums.ContryCode).eContryCode_TW
            else
              if eCountryType.SA_ALPHA == gameServiceType or eCountryType.SA_REAL == gameServiceType then
                returnValue = (CppEnums.ContryCode).eContryCode_SA
              else
                if eCountryType.TH_ALPHA == gameServiceType or eCountryType.TH_REAL == gameServiceType then
                  returnValue = (CppEnums.ContryCode).eContryCode_TH
                else
                  if eCountryType.ID_ALPHA == gameServiceType or eCountryType.ID_REAL == gameServiceType then
                    returnValue = (CppEnums.ContryCode).eContryCode_ID
                  else
                    if eCountryType.TR_ALPHA == gameServiceType or eCountryType.TR_REAL == gameServiceType then
                      returnValue = (CppEnums.ContryCode).eContryCode_TR
                    else
                      if eCountryType.AE_ALPHA == gameServiceType or eCountryType.AE_REAL == gameServiceType then
                        returnValue = (CppEnums.ContryCode).eContryCode_AE
                      else
                        returnValue = (CppEnums.ContryCode).eContryCode_Count
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
  return returnValue
end

isGameTypeThisCountry = function(country)
  -- function num : 0_52
  if country == getContryTypeLua() then
    return true
  end
  return false
end

getContryDetailTypeLua = function()
  -- function num : 0_53
  local returnValue = -1
  local gameServiceType = getGameServiceType()
  local eCountryType = CppEnums.CountryType
  if eCountryType.NONE == gameServiceType or eCountryType.DEV == gameServiceType or eCountryType.KOR_ALPHA == gameServiceType or eCountryType.KOR_REAL == gameServiceType or eCountryType.KOR_TEST == gameServiceType then
    returnValue = (CppEnums.ContryCode).eContryCode_KOR
  else
    if eCountryType.JPN_ALPHA == gameServiceType or eCountryType.JPN_REAL == gameServiceType then
      returnValue = (CppEnums.ContryCode).eContryCode_JAP
    else
      if eCountryType.RUS_ALPHA == gameServiceType or eCountryType.RUS_REAL == gameServiceType then
        returnValue = (CppEnums.ContryCode).eContryCode_RUS
      else
        if eCountryType.KR2_ALPHA == gameServiceType or eCountryType.KR2_REAL == gameServiceType then
          returnValue = (CppEnums.ContryCode).eContryCode_KR2
        else
          if eCountryType.NA_ALPHA == gameServiceType or eCountryType.NA_REAL == gameServiceType then
            returnValue = (CppEnums.ContryCode).eContryCode_NA
          else
            if eCountryType.TW_ALPHA == gameServiceType or eCountryType.TW_REAL == gameServiceType then
              returnValue = (CppEnums.ContryCode).eContryCode_TW
            else
              if eCountryType.SA_ALPHA == gameServiceType or eCountryType.SA_REAL == gameServiceType then
                returnValue = (CppEnums.ContryCode).eContryCode_SA
              else
                if eCountryType.TH_ALPHA == gameServiceType or eCountryType.TH_REAL == gameServiceType then
                  returnValue = (CppEnums.ContryCode).eContryCode_TH
                else
                  if eCountryType.ID_ALPHA == gameServiceType or eCountryType.ID_REAL == gameServiceType then
                    returnValue = (CppEnums.ContryCode).eContryCode_ID
                  else
                    if eCountryType.TR_ALPHA == gameServiceType or eCountryType.TR_REAL == gameServiceType then
                      returnValue = (CppEnums.ContryCode).eContryCode_TR
                    else
                      if eCountryType.AE_ALPHA == gameServiceType or eCountryType.AE_REAL == gameServiceType then
                        returnValue = (CppEnums.ContryCode).eContryCode_AE
                      else
                        returnValue = (CppEnums.ContryCode).eContryCode_Count
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
  return returnValue
end

isGameDetailTypeThisCountry = function(country)
  -- function num : 0_54
  if country == getContryDetailTypeLua() then
    return true
  end
  return false
end

getGameContentsServiceType = function()
  -- function num : 0_55
  local returnValue = -1
  local gameContentServiceType = getContentsServiceType()
  local eContentType = CppEnums.ContentsServiceType
  if eContentType.eContentsServiceType_Closed == gameContentServiceType then
    returnValue = eContentType.eContentsServiceType_Closed
  else
    if eContentType.eContentsServiceType_CBT == gameContentServiceType then
      returnValue = eContentType.eContentsServiceType_CBT
    else
      if eContentType.eContentsServiceType_Pre == gameContentServiceType then
        returnValue = eContentType.eContentsServiceType_Pre
      else
        if eContentType.eContentsServiceType_OBT == gameContentServiceType then
          returnValue = eContentType.eContentsServiceType_OBT
        else
          if eContentType.eContentsServiceType_Commercial == gameContentServiceType then
            returnValue = eContentType.eContentsServiceType_Commercial
          else
            returnValue = eContentType.eContentsServiceType_Count
          end
        end
      end
    end
  end
  return returnValue
end

isGameContentServiceType = function(serviceType)
  -- function num : 0_56
  if serviceType == getGameContentsServiceType() then
    return true
  end
  return false
end

isGameTypeKorea = function()
  -- function num : 0_57
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KOR)
end

isGameTypeRussia = function()
  -- function num : 0_58
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_RUS)
end

isGameTypeJapan = function()
  -- function num : 0_59
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_JAP)
end

isGameTypeEnglish = function()
  -- function num : 0_60
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_NA)
end

isGameTypeTaiwan = function()
  -- function num : 0_61
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_TW)
end

isGameTypeSA = function()
  -- function num : 0_62
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_SA)
end

isGameTypeKR2 = function()
  -- function num : 0_63
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KR2)
end

isGameTypeTH = function()
  -- function num : 0_64
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_TH)
end

isGameTypeID = function()
  -- function num : 0_65
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_ID)
end

isGameTypeTR = function()
  -- function num : 0_66
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_TR)
end

isGameTypeAE = function()
  -- function num : 0_67
  return isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_AE)
end

isCommonGameType = function()
  -- function num : 0_68
  local returnValue = false
  if isGameTypeJapan() then
    returnValue = true
  else
    if isGameTypeRussia() then
      returnValue = true
    else
      if isGameTypeEnglish() then
        returnValue = true
      else
        if isGameTypeTaiwan() then
          returnValue = true
        else
          if isGameTypeSA() then
            returnValue = true
          else
            if isGameTypeKR2() then
              returnValue = true
            else
              returnValue = false
            end
          end
        end
      end
    end
  end
  return returnValue
end

isItemMarketSecureCode = function()
  -- function num : 0_69
  local isSecureCode = false
  if (isGameTypeKorea() or isGameTypeJapan() or isGameTypeRussia() or isGameTypeEnglish() or isGameTypeTaiwan() or isGameTypeSA()) and isSecureCode == true then
    return true
  else
    return false
  end
end

local timerObject = {_timerNo = 0, _endTime = 0, _function = nil, _isRepeat = false, _repeatTime = 0}
local g_TimerNo = 0
local g_Timerlist = {}
local g_TimerCount = 0
luaTimer_UpdatePerFrame = function(fDelta)
  -- function num : 0_70 , upvalues : g_TimerCount, g_Timerlist
  if g_TimerCount <= 0 then
    return 
  end
  local currentTickCount = getTickCount32()
  local removeTimerList = {}
  local removeIndex = 1
  for index,timer in pairs(g_Timerlist) do
    -- DECOMPILER ERROR at PC18: Unhandled construct in 'MakeBoolean' P1

    if timer ~= nil and timer._endTime <= currentTickCount then
      (timer._function)()
      if timer._isRepeat == false then
        local tempIndex = timer._timerNo
        -- DECOMPILER ERROR at PC24: Confused about usage of register: R10 in 'UnsetPending'

        g_Timerlist[tempIndex] = nil
        g_TimerCount = g_TimerCount - 1
      else
        do
          do
            timer._endTime = currentTickCount + timer._repeatTime
            _PA_LOG("LUA", "timer �\128 nil 이다~~!!!!")
            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

luaTimer_AddEvent = function(func, endTime, isRepeat, repeatTime)
  -- function num : 0_71 , upvalues : g_TimerNo, g_Timerlist, g_TimerCount
  g_TimerNo = g_TimerNo + 1
  local tempTimer = {}
  tempTimer._timerNo = g_TimerNo
  tempTimer._endTime = getTickCount32() + endTime
  tempTimer._function = func
  tempTimer._isRepeat = isRepeat
  tempTimer._repeatTime = repeatTime
  if g_Timerlist == nil then
    g_Timerlist = {}
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R5 in 'UnsetPending'

  g_Timerlist[g_TimerNo] = tempTimer
  g_TimerCount = g_TimerCount + 1
  return g_TimerNo
end

luaTimer_RemoveEvent = function(timerNo)
  -- function num : 0_72 , upvalues : g_Timerlist, g_TimerCount
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  if g_Timerlist[timerNo] ~= nil then
    g_Timerlist[timerNo] = nil
    g_TimerCount = g_TimerCount - 1
  end
end

registerEvent("FromClient_LuaTimer_UpdatePerFrame", "luaTimer_UpdatePerFrame")

