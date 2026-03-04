Include("\\script\\online\\spring2021\\head.lua")
Include("\\script\\lib\\talktmp.lua")

SP_NPC = "<color=green>游戏活动大使<color>：";
SP_TITLE = "百节岁为首，辞旧迎新过太年；岁首适逢浪漫情人节，与有情人做快乐事，携手你的TA，共度佳节；惊垫万物苏，初春来临，春寒料峭，一起携手踏青共赏剑2佳景！";

function sp_ReturnMain()
	SetPlayerScript("\\script\\online\\activity_ambassador.lua");
	SendScript2VM("\\script\\online\\activity_ambassador.lua", "main()");
end

SP_NPC_TALK = {
	"新春佳节活动介绍/sp_intro",
}

function sp_intro()
	local tSay = {
		"美味年夜饭/sp_intro_nianyefan",
		"驱赶大年兽活动/sp_intro_nianshou",  
--		"新春送红包/sp_intro_online",
--		"欢度佳节礼盒/sp_intro_box",
--		"情人节种植玫瑰花/sp_intro_meigui",
		"返回/sp_ReturnMain",
		"结束对话/nothing",
	};
	Say(SP_NPC.."活动说明：", getn(tSay), tSay);
end

function sp_intro_nianyefan()
	local tSay = {
		"返回/sp_intro",
		"结束对话/nothing",
	};
	Say(SP_NPC.."   2月9日-2月25日期间，玩家参与副本、种树、杀手任务、开启BOSS箱子活动或使用轻松完成，可以从中获得各种年夜饭食材。将年夜饭食材上交至成都城中刷新的年夜饭，可以累积个人贡献值与全服累积年夜饭价值，不同的食材应不同的贡献值及价值。每日上交食材莱得的每日贡献值，可以从年夜饭中领取每日贡献奖励，每天只可领取一次；活动期间累积个人贡献值，可以用于领取贡献大礼，每个奖励在活动期间仅可领取一次。", getn(tSay), tSay);
end

function sp_intro_nianshou()
	local tSay = {
		"返回/sp_intro",
		"结束对话/nothing",
	};
	Say(SP_NPC.."春节活动期间，，每天12点05分、22点05分，携带宝物的年兽将现身成都、汴京和泉州三大城市的城郊，诸位英雄击败年兽后，拾取小年兽将获得丰富的奖励。", getn(tSay), tSay);
end

function sp_intro_online()
	local tSay = {
		"返回/sp_intro",
		"结束对话/nothing",
	};
	Say(SP_NPC.."活动期间，每天12点05分、22点05分期间在线的玩家系统自动赠送新春大红包，开启红包随机获得18~888金和18~888万经验。", getn(tSay), tSay);
end

function sp_intro_meigui()
	local tSay = {
		"返回/sp_intro",
		"结束对话/nothing",
	};
	Say(SP_NPC.." 活动期间，男侠士可以从活跃度系统中获得3颗玫瑰花种。与Ta双人组队种植，玫瑰花种种植后可长出不同颜色的玫瑰花，不同颜色的玫瑰花可兑换稀有外装和坐骑。", getn(tSay), tSay);
end

function sp_intro_box()
	local tSay = {
		"返回/sp_intro",
		"结束对话/nothing",
	};
	Say(SP_NPC.."活动期间，每位侠士都可领取一个“欢度佳节礼盒”，开启礼盒获得“欢度佳节”称号（亮出称号每分钟都可获得经验奖励）并可获得红包奖励。", getn(tSay), tSay);
end

function sp_give_item_chenghao()
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",format("%s少侠没加入门派，请加入门派后再来吧。", SP_NPC));
		return 0;
	end

	if GetBit(GetTask(TASK_YEARS_BIT), GiveLiBaoTag) == 1 then
		Talk(1,"",format("%s少侠已经领取了[欢度佳节礼盒]，活动期间只能领取一次。", SP_NPC));
		return 0;
	end

	SetTask(TASK_YEARS_BIT, SetBit(GetTask(TASK_YEARS_BIT), GiveLiBaoTag, 1));
	local nRet, nItemIdx = gf_AddItemEx({2, 95, 1954, 1, 4},"欢度佳节礼盒");
	gf_SetItemExpireTime(nItemIdx, gf_UnPack(SP_END));
end


function nothing()
end
