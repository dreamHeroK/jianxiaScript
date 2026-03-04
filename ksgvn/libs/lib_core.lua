KsgLib = KsgLib or {}
function KsgLib:GetMapPos()
  local nMapId, nX, nY = GetWorldPos()
  local x = floor(nX / 8)
  local y = floor(nY / 16)
  return x, y, nMapId
end

function KsgLib:Trim(szString)
  local start, last = strfind(szString, "%S+.*%S+")
  if (start == nil or last == nil) then
    return szString
  end
  return strsub(szString, start, last)
end

function KsgLib:Split(str, separator)
  if (separator == nil) then
    separator = ","
  end
  local strArray = {}
  local strStart = 1
  local splitorLen = strlen(separator)
  local index = strfind(str, separator, strStart)
  if not index then
    strArray[1] = str
    return strArray
  end
  local i = 1
  while index do
    strArray[i] = strsub(str, strStart, index - 1)
    i = i + 1
    strStart = index + splitorLen
    index = strfind(str, separator, strStart)
  end
  strArray[i] = strsub(str, strStart, strlen(str))
  return strArray
end

function KsgLib:IsRate(percent)
  local nRateTotal = 10000000
  local nRandom = random(1, nRateTotal)
  local nRate = floor(percent * nRateTotal / 100)
  if (nRandom <= nRate) then
    return 1
  end
  return nil
end

function KsgLib:IsInTable(item, tb)
  if not tb or type(tb) ~= 'table' then
    return nil
  end
  for _, v in tb do
    if v == item then
      return 1
    end
  end
  return nil
end

function KsgLib:TableLength(T)
  local count = 0
  for _, _ in pairs(T) do
    count = count + 1
  end
  return count
end

function KsgLib:RandomTableValue(tb, bIsReturnKey)
  local nRandomIndex = random(1, getn(tb))
  local index = 0
  for k, v in tb do
    index = index + 1
    if index == nRandomIndex then
      if bIsReturnKey then
        return v, k
      end
      return v
    end
  end
  return KsgLib:RandomTableValue(tb, bIsReturnKey)
end

function KsgLib:IsInRange(nValue, nStart, nEnd)
  if nValue >= nStart and nValue <= nEnd then
    return 1
  end
  return nil
end

function KsgLib:UnPack(tbTable, nStartIdx, nEndIdx)
  local nSize = getn(tbTable);
  nStartIdx = nStartIdx or 1;
  nEndIdx = nEndIdx or nSize;
  if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
    return tbTable[nStartIdx], KsgLib:UnPack(tbTable, nStartIdx + 1, nEndIdx)
  end
end

function KsgLib:HasEnoughBagRoom(nNeedRoom, nNeedWeight, szMsgHead)
  nNeedWeight = nNeedWeight or 0
  szMsgHead = szMsgHead or ''
  if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight() - GetCurItemWeight() < nNeedWeight then
    if szMsgHead then
      KsgNpc:Talk(szMsgHead .. format("Hµnh trang cña ®¹i hiÖp <color=yellow>kh«ng ®ñ %d chç trèng hoÆc søc lùc kh«ng ®ñ %d<color>, xin h·y <color=green>s¾p xÕp l¹i hµnh trang<color>!", nNeedRoom, nNeedWeight))
    end
    return nil
  end
  return 1
end

function KsgLib:Exp2String(nExp)
  if nExp >= 1e6 and nExp < 1e9 then
    return format("%d.%d triÖu kinh nghiÖm", floor(nExp / 1e6), mod(nExp, 1e6))
  end
  if nExp >= 1e9 then
    local nBillion = floor(nExp / 1e9)
    local nMillion = mod(nExp, 1e9)
    if nMillion > 0 then
      return format("%d tû %d.%d triÖu kinh nghiÖm", nBillion, floor(nMillion / 1e6), mod(nMillion, 1e6))
    end
    return format("%d tû ®iÓm kinh nghiÖm", nBillion)
  end
  return format("%d ®iÓm kinh nghiÖm", nExp)
end

function KsgLib:Level2String(nBigLevel)
  if nBigLevel > 100 then
    local nRebornCount, nLevel = KsgPlayer:GetRebornAndLevel(nBigLevel)
    return format("chuyÓn sinh %d cÊp %d", nRebornCount, nLevel)
  end
  return format("cÊp %d", nBigLevel)
end

function KsgLib:BattleRank2Title(nLevel)
  return g_tbBattleTitleCfg[nLevel]
end


-- Vi du
--tbRequirements = {
--    tbItems = {{tbProp = {2,1,2}, nCount = 10},} -- 10 duoi tho
--    nLevel = 90, -- Cap 99
--    nBattleRank = 6, -- Nguyen Soai
--}
function KsgLib:CheckMaterial(tbRequirements, szMsgHead, szMsgFooter, bNotTalk)
  local nPass = 1
  local nItemCount = 0
  local szJoinString = ", "
  local szMessage = szMsgHead or format("%s ch­a ®¹t ®iÒu kiÖn yªu cÇu: <enter>", KsgPlayer:GetSexName())
  local nIndex = 0
  for szConditionName, mCondition in tbRequirements do
    nIndex = nIndex + 1
    if nIndex == 1 then
      szJoinString = ""
    else
      szJoinString = ", "
    end
    if type(mCondition) == "number" and szConditionName == 'nPhongHoa' then
      local szColor = "green"
      if KsgPlayer:GetPhongHoa() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>%d ®iÓm phong hoa<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nGold' then
      local szColor = "green"
      if KsgPlayer:GetGold() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>%d vµng<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nMeridianLevel' then
      local szColor = "green"
      if KsgPlayer:GetMeridianLevel() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>kinh m¹ch ®¹t c¶nh giíi %s<color>", szJoinString, szColor, KsgPlayer:GetMeridianName(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nLevel' then
      local szColor = "green"
      if KsgPlayer:GetLevel() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>®¹t cÊp %d<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nBigLevel' then
      local szColor = "green"
      if KsgPlayer:GetBigLevel() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>®¹t %s<color>", szJoinString, szColor, KsgLib:Level2String(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nExp' then
      local szColor = "green"
      if KsgPlayer:GetExp() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>®ñ %s<color>", szJoinString, szColor, KsgLib:Exp2String(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nBattleRank' then
      local szColor = "green"
      if KsgPlayer:GetBattleRank() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã qu©n hµm %s<color>", szJoinString, szColor, KsgLib:BattleRank2Title(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nHonor' then
      local szColor = "green"
      if KsgPlayer:GetHonor() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>c«ng tr¹ng ®¹t %d ®iÓm trë lªn<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nFactionPoint' then
      local szColor = "green"
      if KsgPlayer:GetFactionPoint() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm s­ m«n<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nLinhKhi' then
      local szColor = "green"
      if KsgPlayer:GetLinhKhiPoint() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm Linh KhÝ<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nPopur' then
      local szColor = "green"
      if KsgPlayer:GetPopur() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm Tu LuyÖn<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nRepute' then
      local szColor = "green"
      if KsgPlayer:GetRepute() < mCondition then
        nPass = 0
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>danh väng ®¹t %d ®iÓm<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "table" and szConditionName == 'tbItems' then
      for _, tbItem in mCondition do
        if tbItem.tbProp and type(tbItem.tbProp) == "table" then
          local szColor = "green"
          local szName = tbItem.szName or KsgItem:GetName(tbItem.tbProp)
          if KsgItem:Count(tbItem.tbProp) < tbItem.nCount then
            nPass = 0
            szColor = "red"
          end
          local szItemDescText = "®em theo "
          nItemCount = nItemCount + 1
          if nItemCount > 1 then
            szItemDescText = ", "
          end
          szMessage = szMessage .. format("%s<color=%s>%s%d %s<color>", szJoinString, szColor, szItemDescText, tbItem.nCount, szName)
        end
      end
    end
  end
  if nPass == 0 then
    if not bNotTalk then
      szMsgFooter = szMsgFooter or format("Xin %s h·y chuÈn bÞ ®Çy ®ñ!", KsgPlayer:GetSexName())
      KsgNpc:Talk(szMessage .. format("<enter>§iÒu kiÖn <color=green>mµu xanh<color> lµ ®· ®¹t, <color=red>mµu ®á<color> lµ ch­a ®¹t.<enter>%s", szMsgFooter))
    end
  end
  return nPass == 1
end

function KsgLib:PayMaterial(tbRequirements, bNotTalk)
  if not KsgLib:CheckMaterial(tbRequirements, "", "", bNotTalk) then
    return nil
  end
  local nPassedCondition = 0
  for szConditionName, mCondition in tbRequirements do
    if type(mCondition) == "number" and szConditionName == "nGold" then
      KsgPlayer:PayGold(mCondition)
      nPassedCondition = nPassedCondition + 1
    end
    if type(mCondition) == "number" and szConditionName == "nPhongHoa" then
      if KsgPlayer:GetPhongHoa() >= mCondition then
        KsgPlayer:ModifyPhongHoaPoint(-mCondition)
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nMeridianLevel" then
      if KsgPlayer:GetMeridianLevel() >= mCondition then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nLevel" then
      if KsgPlayer:GetLevel() >= mCondition then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nBigLevel" then
      if KsgPlayer:GetBigLevel() >= mCondition then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nExp" then
      if KsgPlayer:BigDelExp(mCondition) == 1 then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nBattleRank" then
      if KsgPlayer:GetBattleRank() >= mCondition then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nHonor" then
      if KsgPlayer:GetHonor() >= mCondition then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nFactionPoint" then
      if KsgPlayer:GetFactionPoint() >= mCondition then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nLinhKhi" then
      if KsgPlayer:GetLinhKhiPoint() >= mCondition then
        KsgPlayer:ModifyLinhKhiPoint(-mCondition)
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nPopur" then
      if KsgPlayer:GetPopur() >= mCondition then
        ModifyPopur(-mCondition)
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "number" and szConditionName == "nRepute" then
      if KsgPlayer:GetRepute() >= mCondition then
        nPassedCondition = nPassedCondition + 1
      end
    end
    if type(mCondition) == "table" and szConditionName == 'tbItems' then
      local nSubPass = 0
      for _, tbItem in mCondition do
        if tbItem.tbProp and type(tbItem.tbProp) == "table" then
          if KsgItem:Delete(tbItem.tbProp, tbItem.nCount) == 1 then
            nSubPass = nSubPass + 1
            if tbItem.tbProp[1] == GENRE_ITEM_OTHER then
              FireEvent("event_ib_cost", tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.nCount)
            end
          end
        end
      end
      if nSubPass == KsgLib:TableLength(mCondition) then
        nPassedCondition = nPassedCondition + 1
      end
    end
  end

  return nPassedCondition == KsgLib:TableLength(tbRequirements)
end

function KsgLib:MaterialDescription(tbRequirements)
  local nItemCount = 0
  local szJoinString = ", "
  local szMessage = ""
  local nIndex = 0
  for szConditionName, mCondition in tbRequirements do
    nIndex = nIndex + 1
    if nIndex == 1 then
      szJoinString = ""
    else
      szJoinString = ", "
    end
    if type(mCondition) == "number" and szConditionName == 'nPhongHoa' then
      local szColor = "green"
      if KsgPlayer:GetPhongHoa() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>%d ®iÓm phong hoa<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nGold' then
      local szColor = "green"
      if KsgPlayer:GetGold() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>%d vµng<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nMeridianLevel' then
      local szColor = "green"
      if KsgPlayer:GetMeridianLevel() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>kinh m¹ch ®¹t c¶nh giíi %s<color>", szJoinString, szColor, KsgPlayer:GetMeridianName(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nLevel' then
      local szColor = "green"
      if KsgPlayer:GetLevel() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>®¹t cÊp %d<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nBigLevel' then
      local szColor = "green"
      if KsgPlayer:GetBigLevel() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>®¹t %s<color>", szJoinString, szColor, KsgLib:Level2String(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nExp' then
      local szColor = "green"
      if KsgPlayer:GetExp() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>®ñ %s<color>", szJoinString, szColor, KsgLib:Exp2String(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nBattleRank' then
      local szColor = "green"
      if KsgPlayer:GetBattleRank() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã qu©n hµm %s<color>", szJoinString, szColor, KsgLib:BattleRank2Title(mCondition))
    end
    if type(mCondition) == "number" and szConditionName == 'nHonor' then
      local szColor = "green"
      if KsgPlayer:GetHonor() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>c«ng tr¹ng ®¹t %d ®iÓm trë lªn<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nFactionPoint' then
      local szColor = "green"
      if KsgPlayer:GetFactionPoint() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm s­ m«n<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nLinhKhi' then
      local szColor = "green"
      if KsgPlayer:GetLinhKhiPoint() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm Linh KhÝ<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nPopur' then
      local szColor = "green"
      if KsgPlayer:GetPopur() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm Tu LuyÖn<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "number" and szConditionName == 'nRepute' then
      local szColor = "green"
      if KsgPlayer:GetRepute() < mCondition then
        szColor = "red"
      end
      szMessage = szMessage .. format("%s<color=%s>danh väng ®¹t %d ®iÓm<color>", szJoinString, szColor, mCondition)
    end
    if type(mCondition) == "table" and szConditionName == 'tbItems' then
      for _, tbItem in mCondition do
        if tbItem.tbProp and type(tbItem.tbProp) == "table" then
          local szColor = "green"
          local szName = tbItem.szName or KsgItem:GetName(tbItem.tbProp)
          if KsgItem:Count(tbItem.tbProp) < tbItem.nCount then
            szColor = "red"
          end
          local szItemDescText = "cã "
          nItemCount = nItemCount + 1
          if nItemCount > 1 then
            szItemDescText = ", "
          end
          szMessage = szMessage .. format("%s<color=%s>%s%d %s<color>", szJoinString, szColor, szItemDescText, tbItem.nCount, szName)
        end
      end
    end
  end

  return szMessage
end

function KsgLib:GetServerId()
  return GetGlbValue(GLB_VALUE_SERVER_ID)
end

function KsgLib:IsTestServer()
  return KsgLib:GetServerId() > 99 and not KsgPlayer:IsAdmin()
end

function KsgLib:ServerIsOpened()
  local tbTimeOpen = KsgLib:GetSrvCfg("tbTimeOpen")

  return GetTime() >= MkTime(tbTimeOpen.nYear, tbTimeOpen.nMonth, tbTimeOpen.nDay, tbTimeOpen.nHour, 0, 0)
end

function KsgLib:OpenLuckyBox()
  SendScript2Client("Open[[luckybox]]")
end

function KsgLib:OpenTuBaoTrai()
  SendScript2Client("Open[[JbzBox]]")
end

function KsgLib:ShowInputNumber(szCallback, nMin, nMax)
  nMin = nMin or 0
  nMax = nMax or 8888
  AskClientForNumber(szCallback, nMin, nMax, "NhËp vµo sè l­îng.")
end

function KsgLib:GetValueFromRange(nPosition, nStart, nEnd)
  local nIndex = 0
  for i = nStart, nEnd do
    nIndex = nIndex + 1
    if nIndex == nPosition then
      return i
    end
  end
  return nil
end

function KsgLib:GetPosValue(nSource, nStart, nEnd)
  return floor(mod(nSource, 10 ^ (nEnd)) / (10 ^ (nStart - 1)))
end

function KsgLib:SetPosValue(nSource, nSetValue, nStart, nEnd)
  local nHead = floor(nSource / (10 ^ nEnd)) * (10 ^ nEnd)
  local nTail = mod(nSource, 10 ^ (nStart - 1))
  local nBody = nSetValue * (10 ^ (nStart - 1))
  return (nHead + nBody + nTail)
end

function KsgLib:GetSrvCfg(szKey, nServerId)
  local nCurServerId = nServerId or KsgLib:GetServerId()
  if nCurServerId then
    return g_tbServerCfg[nCurServerId][szKey]
  end
  return g_tbServerDefaultCfg[szKey]
end

function KsgLib:IsInDualTopTime()
  local nDate = KsgDate:Today()
  return KsgLib:GetSrvCfg('bOpenTop') == 1 and nDate >= KsgLib:GetSrvCfg('tbTimeTop').nStartDate and nDate < KsgLib:GetSrvCfg('tbTimeTop').nEndDate
end

function KsgLib:OpenEquipShop(nShopId)
  if not g_tbEquipShop[nShopId] then
    return
  end

  SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", nShopId, g_tbEquipShop[nShopId]))
end

function KsgLib:Random(tbItem)
  if not tbItem then
    return nil
  end
  local nRateTotal = 10000000
  local nRandom = random(1, nRateTotal)
  local nStep = 0
  for i = 1, getn(tbItem) do
    nStep = nStep + floor(tbItem[i].nRate * nRateTotal / 100);
    if (nRandom <= nStep) then
      return tbItem[i], i
    end
  end
  return nil
end

function KsgLib:SetUnitCurStates(Npc_index, att_seq, number)
  if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
    return 0
  end
  local num_save = GetUnitCurStates(Npc_index, att_seq)
  num_save = number - num_save
  AddUnitStates(Npc_index, att_seq, num_save)
  return 1
end
