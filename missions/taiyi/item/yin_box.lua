Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\itemfunctions.lua")
Include("\\script\\server_allaward.lua")


TSK_SCRORE = 2689
TSK_SCRORE_ACC_CODE=0
LOG_TITLE="taiyi yin box"
NEED_ROOM=2
OPEN_BOX_NEED = {"天骄令",2, 97, 236,2}
TIANGANGLING = {2, 95, 204, "天罡令"}
T_NEED_TIANJIAOLING = 500

--灵石宝箱随机开启(ok)
function gl_aw_giveAward_1()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	tAllAward[32]:giveClause();
	SetTask(Pre_Click_Time1,GetTime());
	return 1
end

function OnUse(nItem)
	Say("开启[太一白银宝箱]需要消耗2个[天骄令]，你确定开启吗？",
		2,
		"\n 收费开启/#IamDaye("..nItem..")",
		"\n 不开启/nothing");
	return
end

Pre_Click_Time1 = 3089; --宝箱A点击时间
Click_Space_time = 1; --2s--箱子点击间隔

function IamDaye(nItem)
	if GetTime() - GetTask(Pre_Click_Time1) < Click_Space_time then
		Msg2Player(format("开启间隔%d秒",Click_Space_time));
		return 
	end
	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
		local g,d,p	= getItemGDP(nItem);
		if DelItem(g,d,p, 1) == 1 then
			gl_aw_giveAward_1()
			gf_ModifyTask(TSK_SCRORE, OPEN_BOX_NEED[5], TSK_SCRORE_ACC_CODE);
			local nNeedTianjiao = GetTask(TSK_SCRORE)
			if nNeedTianjiao >= T_NEED_TIANJIAOLING then
				local nR = random(1,100);
				local nNum = 0
				if nR <= 55 then
					nNum = 1;
				elseif nR > 56 and nR <= 90 then
					nNum = 2;
				else
					nNum = 3;
				end;
				gf_AddItemEx({TIANGANGLING[1],TIANGANGLING[2],TIANGANGLING[3],1}, TIANGANGLING[4], nNum)
				SaveNow(); -- 立即存盘
				local szNotice = format("恭喜%s在%s获得[%s]×%d", GetName(), "太一", TIANGANGLING[4], nNum)
				Msg2SubWorld(szNotice);
				SetTask(TSK_SCRORE, 0, TSK_SCRORE_ACC_CODE)
			end
			gf_SetLogCaption(LOG_TITLE);
		end
	else
		Talk(1, "", "你确定带了[天骄令]了吗？要开启<color=green>太一白银宝箱<color>需要<color=yellow>2个<color>[天骄令]。");
	end
end

function nothing()
end

