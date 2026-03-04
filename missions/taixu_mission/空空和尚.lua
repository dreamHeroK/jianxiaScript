

Include("\\script\\missions\\taixu_mission\\head.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\missions\\taixu_mission\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\taixu_mission\\award.lua")

TAIXU_TIME = 1782;--进入太虚的时间
--结束

--八卦换取数量 对应GetEquipBaGua()返回值，注意返回5为太极
tBaguaNum = { --第2，3，4为物品id，第5位为灵气值81-120需要的数量  第六位灵气值61-80需要的数量
	[1] = { "太虚八卦盘-坎", 2, 1, 471, 10, 10 },
	[2] = { "太虚八卦盘-坤", 2, 1, 470, 10, 10 },
	[3] = { "太虚八卦盘-震", 2, 1, 474, 9, 2 },
	[4] = { "太虚八卦盘-巽", 2, 1, 476, 9, 2 },
	[6] = { "太虚八卦盘-乾", 2, 1, 469, 10, 10 },
	[7] = { "太虚八卦盘-兑", 2, 1, 472, 10, 10 },
	[8] = { "太虚八卦盘-艮", 2, 1, 475, 9, 3 },
	[9] = { "太虚八卦盘-离", 2, 1, 473, 9, 3 }
}
tWood = {
	{ 0, 0, 0, 0, 0, 0, 0, 5, 5 }, --100灵气神木八卦
	{ 0, 0, 5, 5, 0, 0, 0, 0, 0 }, --100灵气紫金八卦
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0 }, --80灵气神木八卦
	{ 0, 0, 0, 0, 0, 0, 0, 0, 0 }, --80灵气紫金八卦
}
function tx_level_chk()
	local nOldIndex = PlayerIndex
	local ret = 1
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local player_level = GetLevel()
		if player_level < g_NeedLevel then
			ret = 0
			break
		end
	end
	PlayerIndex = nOldIndex
	return ret;
end
function TodayCanEnter()
	local nTime = GetTask(TAIXU_TIME)--取值进入次数
	if nTime  < 2 then
	return 1
	else
	return 0
	end
end

function chk_enter()
	local szSex = {"少侠", "女侠"}
	local szNoTeam ={"太虚幻境凶险无比，", "还是组队前往为好。"}
	local nSex = GetSex()
	local szLevel = format("<color=green>等级不足%d<color>", g_NeedLevel);
	local szTimes = "<color=green>一次<color>"
	local szLeader = "<color=green>队长<color>"
	local szTown = "<color=green>在同一城市的队员<color>"
	local szExMsg = ""				-- 额外的信息
	local nRetCode = 1
--	local szItemCount = "<color=green>1个太虚多蜜花果<color>"
	if IsinTeam() == 0 then --是否组队
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then --队员不在一块
		nRetCode = 0
		return nRetCode, szNoGs[1]..szSex[nSex]..szNoGs[2]
	end
	

	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>队长<color>"
	end

	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	if tx_level_chk() ~= 1 then
		nRetCode = 0
		szLevel = format("<color=red>等级不足%d<color>", g_NeedLevel)
	end
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i)
		if TodayCanEnter() <= 0 then
			nRetCode = 0
			szTimes = "<color=red>1次<color>"
			szExMsg = szExMsg..GetName()..",已经进入过2次 "
		end
	end
	PlayerIndex = OldPlayer
	if szExMsg ~= "" then
        Msg2Team(szExMsg)
	end

	if AreaCheck() == 0 then --队员不再同一个城市
		nRetCode = 0
		szTown = "<color=red>在同一城市的队员<color>"
	end

	local nSleepCheckRet = 0
	local szSleepCheck = ""
	nSleepCheckRet, szSleepCheck = SleepCheck()
	if nSleepCheckRet == 0 then
		nRetCode = 0
	end

	if szExMsg ~= "" then --队员今日是否已经进入过提示
		gf_Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		gf_Msg2Team(szSleepCheck)
--		return
	end
    local szMsg = "由"..szLeader.."带领"..szLevel..""..szTown.."，每天可以免费进入"..szTimes.."太虚幻境。 \n\n(<color=gray>(绿色表示条件满足，红色表示条件不满足，公告提示不满足条件的原因)<color>)"
	return nRetCode, szMsg
end
function entry(nType,npcIdx,nJump)
	nJump = nJump or 0;
	local nRetCode, szMsg = chk_enter();
	if nRetCode == nil and szMsg == nil then
		return
	end
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end
	local nPlace = random(1,4);
	local nId,nX,nY = GetNpcWorldPos(npcIdx);
	SendScript2VM("\\script\\missions\\taixu_mission\\mission.lua",format("create_enter_exit_pos(%d,%d)", nPlace,nId)); 
	local nMapID = tbTaiXu:Create()
	local nOldPlayer = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		SetTask(TAIXU_TIME,GetTask(TAIXU_TIME)+1);--次数加1
	end
	PlayerIndex = nOldPlayer;
	mf_SetMissionV(tbTaiXu.missionID,tbTaiXu.mv4,nPlace,nMapID)--区域
	tbTaiXu:TeamEnter(nMapID,nType);
end

function main()
	local nNpcIdx = GetTargetNpc();
	local tbSay = {}
	tinsert(tbSay, "◆ 何为太虚幻境？/Hewei");
	tinsert(tbSay, "◆ 大师慈悲，请即刻渡送我等吧/#entry(1," ..nNpcIdx .. ", 0)");
	tinsert(tbSay, "◆ 太虚八卦牌兑换首饰/#show_equip_shop(4000)");	
	tinsert(tbSay, "◆ 用太虚八卦牌换取奖励/GetAwardPai");
	tinsert(tbSay, "◆ 我要激活装备的八卦装备/choose_lingqi");
	tinsert(tbSay, "◆ 结束对话/do_nothing");
	Say("<color=green>神游真人<color>：贫道奉九天玄女之命，特来此地渡送世人进入太虚幻境，积些功德。施主看来也是有缘之人，不知有何指教",
		getn(tbSay), tbSay)
end
function Hewei()
	local tbSay = {}
	tinsert(tbSay, "◆ 如何进入太虚幻境/Ruhe");
	tinsert(tbSay, "◆ 我随便问问而已，打搅了/do_nothing");
	Say("<color=green>神游真人<color>：人生有苦，在于有欲，纵尊为帝王，或卑如草芥，皆念念不得脱。九天玄女见世人痴念如此，乃采三秋清露，百花果蜜，育成灵兽种种；又摘云采雾，炼化五色奇石，方置成幻境一处，号为太虚。但凡夫俗子入得此地，有志抒志，钟情得情，望利得利。一言一蔽之：解世间苦也。尔等江湖儿女，入得此境，也必大有收获。",
	getn(tbSay),tbSay)
end
function Ruhe()
	local tbSay = {}
	tinsert(tbSay, "◆ 何为太虚幻境？/Hewei");
	tinsert(tbSay, "◆ 我随便问问而已，打搅了/do_nothing");
	Say("<color=green>神游真人<color>：只要召集三五知己组建队伍，即可进入闯关。不过太虚毕竟是神仙之地，凡人呆得太久会经亏血损，反而有害无益，故每人每天最多只能免费进入太虚幻境2次。队伍玩家流派数量有多少，就有多少关，每重天需击败众灵兽才能进入下一重天，通过每一重天会获得经验、修为奖励，队伍中所有玩家流派数量越多，奖励的经验和修为越多，还有机会获得各种太虚盘奖励。",
	getn(tbSay),tbSay)
end
--===================================================================结束==========================================================
function do_nothing()
	--do nothing
end

function choose_lingqi()
	local strtab = {
		"◆ 我要激活灵气值在60以下的八卦装备/mianfei_jihuo",
		"◆ 我要激活灵气值在61-79的八卦装备/#jihuo_bagua(2)",
		"◆ 我要激活灵气值在80-120的八卦装备/#jihuo_bagua(1)",
		"◆ 等等，我先看看我的装备的灵气值/do_nothing"
		}
	Say("<color=green>神游真人<color>：想激活装备上蕴涵的八卦之力，需要对应的太虚八卦牌才行，如果你将指定数量的太虚八卦牌给我，我就可以将你身上的八卦装备激活。请选择你要激活八卦装备的灵气值，灵气值在<color=yellow>60以下<color>，除了<color=yellow>震和巽<color>卦装备，其他的我都可以<color=yellow>免费<color>为你激活。大于60的不同灵气值段需要的太虚八卦牌数量有所不同。",
		getn(strtab),
		strtab)
end

function mianfei_jihuo()
	local strtab = {
		"◆ 头部/#mianfei_jihuo_weizhi(0)",
		"◆ 上衣/#mianfei_jihuo_weizhi(1)",
		"◆ 下装/#mianfei_jihuo_weizhi(3)",
		"◆ 武器/#mianfei_jihuo_weizhi(2)",
		"◆ 等等，我先穿上待激活装备/do_nothing"
		}
	Say("<color=green>神游真人<color>：如果装备的灵气值在<color=yellow>60或60以下<color>，激活<color=yellow>震和巽<color>卦装备需要对应的<color=yellow>1块<color>太虚八卦牌，其他的我可以免费为你激活。注意哦，我可没空翻看你的包裹，把你要激活的装备穿好来见我。你要激活哪个部位的八卦装备？",
		getn(strtab),
		strtab)
end

function jihuo_bagua(nType)
	local strtab = {};
	if nType == 2 then
		tinsert(strtab,"◆ 我要用"..tBaguaNum[3][6].."太虚八卦牌-震来激活一件震卦装备/#check_bagua(3,2)");
		tinsert(strtab,"◆ 我要用"..tBaguaNum[4][6].."太虚八卦牌-巽来激活一件巽卦装备/#check_bagua(4,2)");
		tinsert(strtab,"◆ 我要用"..tBaguaNum[1][5].."太虚八卦牌-坎来激活一件坎卦装备/#check_bagua(1,2)");
		tinsert(strtab,"◆ 我要用"..tBaguaNum[2][5].."太虚八卦牌-坤来激活一件坤卦装备/#check_bagua(2,2)");
	elseif nType == 1 then
		tinsert(strtab,"◆ 我要用"..tBaguaNum[3][5].."太虚八卦牌-震+5 来激活一件震卦装备/#check_bagua(3,1)");
		tinsert(strtab,"◆ 我要用"..tBaguaNum[4][5].."太虚八卦牌-巽+5 来激活一件巽卦装备/#check_bagua(4,1)");
		tinsert(strtab,"◆ 我要用"..tBaguaNum[1][5].."太虚八卦牌-坎来激活一件坎卦装备/#check_bagua(1,1)");
		tinsert(strtab,"◆ 我要用"..tBaguaNum[2][5].."太虚八卦牌-坤来激活一件坤卦装备/#check_bagua(2,1)");
	end
	tinsert(strtab,"下一页/#jihuo_bagua2("..nType..")");
	tinsert(strtab,"我还没有未激活的八卦装备/do_nothing");
	Say("<color=green>神游真人<color>：你想激活哪个卦位的装备。注意哦，我可没空翻看你的包裹，把你要激活的装备穿好来见我。",
		getn(strtab),
		strtab);
end

function mianfei_jihuo_weizhi(nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if nIndex == 0 then
		Talk(1,"","<color=green>神游真人<color>：你身上穿的这件装备不是激活的装备啊！");
		return
	end
	if GetEquipBaGua(nIndex) == 0 then
		Talk(1,"","<color=green>神游真人<color>：你身上穿的这件装备不是未激活的八卦装备啊！");
		return
	end
	local nLingqi = GetItemMaxLingQi(nIndex);
	if GetEquipBaGuaJiHuo(nIndex) ~= 0 then
		Talk(1,"","<color=green>神游真人<color>：你身上穿的这件装备已经激活了！")
		return
	end
	if nLingqi > 60 then
		Talk(1,"","<color=green>神游真人<color>：你身上穿的这件装备不是未激活的<color=yellow>60灵气<color>以上的装备啊！");
		return
	elseif nLingqi == 0 then
		Talk(1,"","<color=green>神游真人<color>：你身上穿的这件装备不是没有灵气啊！")
		return
	end
	if GetEquipBaGua(nIndex) == 3 then
		if GetItemCount(tBaguaNum[3][2],tBaguaNum[3][3],tBaguaNum[3][4]) < 1 then
			Talk(1,"","<color=green>神游真人<color>：激活这件装备需要1个太虚八卦盘-震！");
			return
		else
			Say("<color=green>神游真人<color>：您确定使用一个太虚八卦盘-震来激活这件震卦装备吗？",
				2,
				"是的，我要激活/#jihuo_zhengua(3,"..nWz..")",
				"我再想一想/do_nothing")
			return
		end
	end
	if GetEquipBaGua(nIndex) == 4 then
		if GetItemCount(tBaguaNum[4][2],tBaguaNum[4][3],tBaguaNum[4][4]) < 1 then
			Talk(1,"","<color=green>神游真人<color>：激活这件装备需要1个太虚八卦盘-巽！");
			return
		else
			Say("<color=green>神游真人<color>：您确定使用一个太虚八卦盘-巽来激活这件巽卦装备吗？",
				2,
				"是的，我要激活/#jihuo_zhengua(4,"..nWz..")",
				"我再想一想/do_nothing")
			return
		end
	end
	if nLingqi > 0 and nLingqi <= 60 and GetEquipBaGuaJiHuo(nIndex) == 0 then
		local tZhuangBei = {"帽子","上衣","武器","下装"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("恭喜你成功激活"..tZhuangBei[nWz+1].."并赋予了八卦属性");
	end
end

function check_bagua(nType,nLqType)
	if nLqType == 1 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][5] then
			Talk(1,"","<color=green>神游真人<color>：带齐太虚八卦牌再来找我，这么几块怎么可能激活啊。");
			return
		end
	elseif nLqType == 2 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][6] then
			Talk(1,"","<color=green>神游真人<color>：带齐太虚八卦牌再来找我，这么几块怎么可能激活啊。");
			return
		end
	end
	-- local nCount1 = tWood[nLqType * 2 - 1][nType];
	-- if GetItemCount(2,95,550) < nCount1 then
	-- 	Talk(1, "", "<color=green>神游真人<color>：带齐神木八卦再来找我，这么几块怎么可能激活啊。");
	-- 	return
	-- end
	-- local nCount2 = tWood[nLqType * 2][nType];
	-- if GetItemCount(2,95,551) < nCount2 then
	-- 	Talk(1, "", "<color=green>神游真人<color>：带齐紫金八卦再来找我，这么几块怎么可能激活啊。");
	-- 	return
	-- end
		local nMaoziIndex = GetPlayerEquipIndex(0);
		local nYifuIndex = GetPlayerEquipIndex(1);
		local nKuziIndex = GetPlayerEquipIndex(3);
		local nWuqiIndex = GetPlayerEquipIndex(2);
		local strtab = {} ;
		if GetEquipBaGua(nMaoziIndex) == nType and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
			tinsert(strtab,"帽子/#item_jihuo("..nMaoziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nYifuIndex) == nType and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
			tinsert(strtab,"上衣/#item_jihuo("..nYifuIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nKuziIndex) == nType and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
			tinsert(strtab,"下装/#item_jihuo("..nKuziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nWuqiIndex) == nType and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			tinsert(strtab,"武器/#item_jihuo("..nWuqiIndex..","..nLqType..","..nType..")");
		end
		if getn(strtab) == 0 then
			Talk(1,"","<color=green>神游真人<color>：您没有与此八卦属性相对应的激活的装备。");
		else
			tinsert(strtab,"我再想一想/do_nothing");
			Say("<color=green>神游真人<color>：您决定激活哪个位置的装备属性？请选择要激活的设备。",getn(strtab),strtab) --..tBaguaNum[nType][1].."
		end
end

function jihuo_bagua2(nType)
	if nType == 1 then
		local strtab = {
			"◆ 我要用"..tBaguaNum[6][5].."太虚八卦牌-乾来激活一件乾卦装备/#check_bagua(6,1)",
			"◆ 我要用"..tBaguaNum[7][5].."太虚八卦牌-兑来激活一件兑卦装备/#check_bagua(7,1)",
			"◆ 我要用"..tBaguaNum[8][5].."太虚八卦牌-艮来激活一件艮卦装备/#check_bagua(8,1)",
			"◆ 我要用"..tBaguaNum[9][5].."太虚八卦牌-离来激活一件离卦装备/#check_bagua(9,1)",
			"◆ 上一页/#jihuo_bagua("..nType..")",
			"◆ 我还没有未激活的八卦装备/do_nothing"
			}
		Say("<color=green>神游真人<color>：你想激活哪个卦位的装备。注意哦，我可没空翻看你的包裹，把你要激活的装备穿好来见我。",
			getn(strtab),
			strtab);
	elseif nType == 2 then
		local strtab = {
			"◆ 我要用"..tBaguaNum[6][6].."太虚八卦牌-乾来激活一件乾卦装备/#check_bagua(6,2)",
			"◆ 我要用"..tBaguaNum[7][6].."太虚八卦牌-兑来激活一件兑卦装备/#check_bagua(7,2)",
			"◆ 我要用"..tBaguaNum[8][6].."太虚八卦牌-艮来激活一件艮卦装备/#check_bagua(8,2)",
			"◆ 我要用"..tBaguaNum[9][6].."太虚八卦牌-离来激活一件离卦装备/#check_bagua(9,2)",
			"◆ 上一页/#jihuo_bagua("..nType..")",
			"◆ 我还没有未激活的八卦装备/do_nothing"
			}
		Say("<color=green>神游真人<color>：你想激活哪个卦位的装备。注意哦，我可没空翻看你的包裹，把你要激活的装备穿好来见我。",
			getn(strtab),
			strtab);
	end
end


function item_jihuo(nIndex,nLqType,nType)
	local tZhuangBei = {"帽子","上衣","武器","下装"};
	local nLingqi = GetItemMaxLingQi(nIndex);
	if nLqType == 1 then
		if nLingqi < 80 or nLingqi > 120 then
			Talk(1,"","<color=green>神游真人<color>：你身上穿的这件装备的灵气不是80-120的啊！");
			return
		end
	end
	if nLqType == 2 then
		if nLingqi <= 60 or nLingqi >= 80 then
			Talk(1,"","<color=green>神游真人<color>：你身上穿的这件装备的灵气不是60-80的啊！");
			return
		end
	end

	-- local nCount1 = tWood[nLqType * 2 - 1][nType];
	-- if nCount1 > 0 and DelItem(2,95,550, nCount1) ~= 1 then
	-- 	Talk(1, "", "<color=green>神游真人<color>：带齐神木八卦再来找我，这么几块怎么可能激活啊。");
	-- 	return
	-- end
	-- local nCount2 = tWood[nLqType * 2][nType];
	-- if nCount2 > 0 and DelItem(2,95,551, nCount2) ~= 1 then
	-- 	Talk(1, "", "<color=green>神游真人<color>：带齐紫金八卦再来找我，这么几块怎么可能激活啊。");
	-- 	return
	-- end

	if nLqType == 1 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][5]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
				  SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("恭喜你成功激活"..tZhuangBei[i].."并赋予了八卦属性");
					break;
				end
			end
		end
	elseif nLqType == 2 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][6]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
					SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("恭喜你成功激活"..tZhuangBei[i].."并赋予了八卦属性");
					break;
				end
			end
		end
	end
end

function jihuo_zhengua(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if DelItem(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4],1) == 1 then
		local tZhuangBei = {"帽子","上衣","武器","下装"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("恭喜你成功激活"..tZhuangBei[nWz+1].."并赋予了八卦属性");
	end
end
-- 是否在队伍中
function IsinTeam()
	if GetTeamSize() < 1 then
		return 0
	else
		return 1
	end
end
-- 是否为队长
function IsCaptain()
	if IsinTeam() == 0 then
		return 0
	end
	
	local nCaptain = GetTeamMember(0)
	if nCaptain == PlayerIndex then
		return 1
	else
		return 0
	end
end
-- 在进入前判断所有队员是否在同一个城里
function AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--随便取一个队员的worldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function SleepCheck()
	local nTeamSize = 0
	local szExMsg = ""
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsSleeping() == 1 then
			szExMsg = szExMsg..GetName()..", "
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if szExMsg ~= "" then
	    local nLen = strlen(szExMsg)
	    szExMsg = strsub(szExMsg, 1, nLen - 2)
	    szExMsg = szExMsg.."无法进入太虚幻境（目前已关闭）"
	end
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1, szExMsg
	else
		return 0, szExMsg
	end
end



