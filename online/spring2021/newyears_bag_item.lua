Include("\\script\\online\\spring2021\\head.lua")

--使用补偿礼包（欢度佳节礼盒）
function OnUse(nItem)
	local tSay = {
		format("确定/#_GetBcAward(%d)", nItem),
		"取消/nothing",
	}
	Say("<color=green>欢度佳节礼盒<color>： 百节岁为首，辞旧迎新过太年；岁首适逢浪漫情人节，与有情人做快乐事，携手你的TA，共度佳节；惊垫万物苏，初春来临，春寒料峭，一起携手踏青共赏剑2佳景！！开启可获得丰厚的礼品。少侠确定要开启吗？", getn(tSay), tSay);
end

function _GetBcAward(nItem)
	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end
	if DelItemByIndex(tonumber(nItem), 1) ~= 1 then
		return 0;
	end
	DoFireworks(832, 3);
--	local nDate = tonumber(date("%Y%m%d"));
--	if IsTitleExist(3,8) <= 0 then
--		gf_AddTitle(3, 8, 2, 20210219)
--		SetTask(TSK_YEARS_BEGIN_DATE,nDate);
--		local nEndDate = tf_GetResultDate(GetTask(TSK_YEARS_BEGIN_DATE),g_nYearsDays-1);
--		SetTask(TSK_YEARS_END_DATE,nEndDate);	
--	end	
--	sp_aw_giveAward_2()
end