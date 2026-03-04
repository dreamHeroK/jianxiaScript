Include("\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")
Include("\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua")
Include("\\script\\missions\\eyt_battle\\join_npc.lua")
Include("\\settings\\static_script\\kf_newbattles\\sign_up_npc_kf.lua")
Include("\\script\\missions\\one_road_battle\\orb_functions.lua")
Include("\\script\\system_switch_config.lua")

function main()
	local tbSay = {}
	local szTitle = "当前服务器活动，您想领取奖励吗？"
	tinsert(tbSay, format("%s/#get_award(1)", "参与重要活动"))
	if IsKfNewBattleOpen() ~= 0 then tinsert(tbSay, format("%s/#get_award(6)", "Ph竜 Уi Chi課 Li猲 Server")) end
	if IsKfNewBattleOpen() ~= 0 then tinsert(tbSay, format("%s/#get_award(7)", "Nh筺 M玭 Quan Li猲 Server")) end
	tinsert(tbSay, format("%s/#get_award(2)", "加入帮派"))
	--tinsert(tbSay, format("%s/#get_award(3)", "比武大会联赛"))
	--tinsert(tbSay, format("%s/#get_award(4)", "比武大会单人赛"))
	tinsert(tbSay, format("%s/#get_award(5)", "参与特殊活动"))
	tinsert(tbSay, format("%s/orb_award_talk", "Chi課 trng Hi謕 L? Tng Ph飊g"))
	
	tinsert(tbSay, format("\n%s/nothing", "离开"))
	Say(szTitle, getn(tbSay), tbSay)
end

function get_award(nType)
	if 1 == nType then
		if IsKfNewBattleOpen() ~= 0 then
			get_kf_pt_award() --开启了跨服炮台战
			return 0;
		end
		jyr_main_lingjiang()
	elseif 2 == nType then
		tm_award_tong_melee()
	elseif 3 == nType then
		SendScript2Client("Open([[XvxRank]])");
	elseif 4 == nType then
		main_bwdh_award()
	elseif 5 == nType then
		main_eyt_award()
	end
end
function nothing()
end