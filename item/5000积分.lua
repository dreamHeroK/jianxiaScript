--黑鹰网络；57274446<color

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\function\\ornament\\ornament.lua")

g_szTitle = "<color=green>剑侠情缘网络版Ⅱ<color>"

function OnUse(nItem)
  ornament_add_score(5000)
  local n, m, l = GetWorldPos();
  Msg2Player("恭喜你，挂件积分增加5000");
  DelItem(2,102,308,1)
  local nW,nX,nY = GetWorldPos()
  local tSay = {}
  local nRoute = GetPlayerRoute();
  if nRoute <= 0 then
    tSay = {
      "\n加 入 门 派 后 才 可 以 使 用/nothing",
    }
  else

  end

  tinsert(tSay, "\n关 闭/nothing");
  Say(g_szTitle .. "\n挂件积分成功增加5000点！", getn(tSay), tSay);
end

function open_box()

	OpenBox();
end;