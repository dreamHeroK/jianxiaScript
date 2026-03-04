Include("\\script\\missions\\taixu_mission\\head.lua")



function OnUse(nItemidx)
  local g, d, p = GetItemInfoByIndex(nItemidx);
  local itemID = PackItemId(g, d, p)
  local item = tTxExpGDP2Item[itemID]

  local nSubWorldTmpId = GetMapTemplate(SubWorld)
  local nDrugTime = 60 * 30
  if nSubWorldTmpId ~= 1010 then
    Talk(1, "", "道具只在<color=yellow>虚拟幻境<color>中使用！")
    return
  end
  local nCurTime = GetTime()
  local nLastTime = GetTask(TAIXU_TASKID_EXP_DRUG_TIME);
  if nLastTime > nCurTime then         -- ?????aé??????y
    Talk(1, "", "已有同类效果，不可重复使用！")
    return
  end
  if DelItemByIndex(nItemidx, 1) == 1 then
    AddRuntimeStat(71, 1, 0, 1)
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    Msg2Player(format("%s正在生效，太虚幻境接受%s。还有%d秒。", item[2], item[3], nDrugTime))
    SetTask(TAIXU_TASKID_EXP_DRUG_TIME, nCurTime + nDrugTime)
    SetTask(TAIXU_TASKID_EXP_DRUG_TYPE, item[1])
  end
end
