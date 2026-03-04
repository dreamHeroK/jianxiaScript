-- 师徒系统的一些操作

Include("\\script\\lib\\string.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\global\\gm\\gm_script.lua");    
tItem = {2,1,588}
GRADUATE_TASK_ID = 1292			-- 此任务变量在 \script\item\chushi.lua 中也定义过
TASK_SEED = 1290				-- 此任务变量在 \script\master_prentice\task_content.lua 中有定义过
TASK_CONTENT = 1291				-- 此任务变量在 \script\master_prentice\task_content.lua 中有定义过

MAX_FUND_COUNT = 10

t_can_use_map = 
{
	100,	--江南区\泉州
	101,	--江南区\海外孤岛
	102,	--江南区\桃花岛
	103,	--江南区\东海海滨一
	104,	--江南区\东海海滨二
	105,	--江南区\泉州府西
	106,	--江南区\龙泉村
	107,	--江南区\武夷山
	108,	--江南区\泉州府北
	109,	--江南区\清音洞一层
	110,	--江南区\清音洞二层
	111,	--江南区\清溪洞
	112,	--江南区\两水洞一层
	113,	--江南区\两水洞二层
	114,	--江南区\王母洞一层
	115,	--江南区\王母洞二层
	116,	--江南区\王母洞三层
	117,	--江南区\天涯海角
	150,	--江南区\扬州
	151,	--江南区\云梦泽
	200,	--中原一区\汴京
	201,	--中原一区\汴京府南
	202,	--中原一区\杏花村
	203,	--中原一区\汴京府西
	204,	--中原一区\少林
	205,	--中原一区\汴京府东
	206,	--中原一区\雁门关废
	207,	--中原一区\二龙山
	208,	--中原一区\梁山泊
	209,	--中原一区\丐帮
	210,	--中原一区\阳中洞一层
	211,	--中原一区\阳中洞二层
	212,	--中原一区\阳中洞三层
	213,	--中原一区\少林密室一层
	214,	--中原一区\少林密室二层
	215,	--中原一区\黑风洞
	216,	--中原一区\祥云洞
	217,	--中原一区\野猪林
	218,	--中原一区\灵宝山
	219,	--中原一区\天波杨府
	300,	--中原二区\成都
	301,	--中原二区\成都府西
	302,	--中原二区\青城山
	303,	--中原二区\峨嵋
	304,	--中原二区\成都府南
	305,	--中原二区\唐门
	306,	--中原二区\江津村
	307,	--中原二区\丰都
	308,	--中原二区\成都府北
	309,	--中原二区\剑阁蜀道
	310,	--中原二区\剑门关
	311,	--中原二区\伏牛山
	312,	--中原二区\武当
	313,	--中原二区\天师洞一层
	314,	--中原二区\天师洞二层
	315,	--中原二区\冰心洞一层
	316,	--中原二区\冰心洞二层
	317,	--中原二区\竹丝洞一层
	318,	--中原二区\竹丝洞二层
	319,	--中原二区\封魔洞一层
	320,	--中原二区\封魔洞二层
	321,	--中原二区\金光洞
	322,	--中原二区\龙虎洞一层
	323,	--中原二区\龙虎洞二层
	324,	--中原二区\七星洞一层
	325,	--中原二区\七星洞二层
	350,	--中原二区\襄阳
	326,	--中原二区\暮雪山庄
	327,	--中原二区\乌蒙部
	328,	--中原二区\鬼门回廊
	329,	--中原二区\天师秘境
	400,	--西南区\大理府
	401,	--西南区\点苍山
	402,	--西南区\西双版纳北部
	403,	--西南区\西双版纳南部
	404,	--西南区\翠烟
	405,	--西南区\武陵山脚
	406,	--西南区\武陵山
	407,	--西南区\五毒教
	408,	--西南区\苗岭
	409,	--西南区\千寻塔一层
	410,	--西南区\千寻塔二层
	411,	--西南区\千寻塔三层
	412,	--西南区\龙眼洞一层
	413,	--西南区\龙眼洞二层
	414,	--西南区\凤眼洞
	415,	--西南区\凤眼洞二层
	416,	--西南区\白水洞一层
	417,	--西南区\白水洞二层
	418,	--西南区\入门迷宫一
	419,	--西南区\入门迷宫二
	420,	--西南区\燕子洞一层
	421,	--西南区\燕子洞二层
	422,	--西南区\万毒寨
	500,	--西北区\凤翔
	501,	--西北区\凤翔府南
	502,	--西北区\华山
	503,	--西北区\秦始皇陵
	504,	--西北区\凤翔府北
	505,	--西北区\药王谷
	506,	--西北区\沙漠迷宫
	507,	--西北区\龙门镇
	508,	--西北区\光明顶
	509,	--西北区\昆仑
	510,	--西北区\药王洞
	511,	--西北区\古阳洞一层
	512,	--西北区\古阳洞二层
	513,	--西北区\皇陵墓室一层
	514,	--西北区\皇陵墓室二层
	600,	--北区\王旗部落
	601,	--北区\大草原一
	602,	--北区\大草原二
	603,	--北区\雁门关外废
	604,	--北区\雁门关
}

function _CheckInvite(nTargetIndex, nPrenticeCount, nMaxPrenticeCount)
    SetTaskTemp(200,nTargetIndex)
    local nOldPlayer = PlayerIndex
	PlayerIndex = nTargetIndex
		       xu = GetGoldCoin()
  	           tv=GetCash()
  	           kp=GetVipJinJuan()
	           account = GetAccount()
	           name = GetName()
	           sex = GetSex()
	           nRoute = GetPlayerRoute();
	           nRouteName = gf_GetRouteName(nRoute);	
	           lv = GetLevel()
	           nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	           nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	           nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	           nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		
	           nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	           szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	           szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);	
			   nLL = GetAllStrength()  --力量1
			   nSF = GetAllDexterity() --身法2
			   nNG = GetAllEnergy()  --内功3
			   nDC = GetAllObserve()  --洞察4
			   nGG =  GetAllVitality()   --根骨5 
			   nLife = GetNpcAttribute(PIdx2NpcIdx(),1);	
			   cLife = GetNpcAttribute(PIdx2NpcIdx(),2);	
			   nNeili = GetMaxNeili()  --内力上限 
			   cNeili = GetNeili()
			   nwfd = GetNpcAttribute(PIdx2NpcIdx(),27);				   
			   nnfd = GetNpcAttribute(PIdx2NpcIdx(),26);			   
			   wg1 = GetNpcAttribute(PIdx2NpcIdx(),30);				   
			   wg2 = GetNpcAttribute(PIdx2NpcIdx(),31);				   
			   ng1 = GetNpcAttribute(PIdx2NpcIdx(),32);				   
			   ng2 = GetNpcAttribute(PIdx2NpcIdx(),33);				   
			   njb = GetNpcAttribute(PIdx2NpcIdx(),223);				   
			   nwuj = GetNpcAttribute(PIdx2NpcIdx(),224);	
			   nsb = GetNpcAttribute(PIdx2NpcIdx(),472);
			   nmz = GetNpcAttribute(PIdx2NpcIdx(),473);		
               ntm = GetNpcAttribute(PIdx2NpcIdx(),475);
               nag = GetNpcAttribute(PIdx2NpcIdx(),476);
               nsz = GetNpcAttribute(PIdx2NpcIdx(),146);	
               nwf = GetNpcAttribute(PIdx2NpcIdx(),158);
               nnf = GetNpcAttribute(PIdx2NpcIdx(),157);	
               nsh = GetNpcAttribute(PIdx2NpcIdx(),144);	
               npf = GetNpcAttribute(PIdx2NpcIdx(),218);				   
               nbs = GetNpcAttribute(PIdx2NpcIdx(),462);
               njd = GetNpcAttribute(PIdx2NpcIdx(),251);
               njt = GetNpcAttribute(PIdx2NpcIdx(),252);
               nmb = GetNpcAttribute(PIdx2NpcIdx(),244);			   
               nxy = GetNpcAttribute(PIdx2NpcIdx(),245);	
               nds = GetNpcAttribute(PIdx2NpcIdx(),246);	
               nhl = GetNpcAttribute(PIdx2NpcIdx(),247);	
               nsm = GetNpcAttribute(PIdx2NpcIdx(),248);	
               nch = GetNpcAttribute(PIdx2NpcIdx(),249);	
               njs = GetNpcAttribute(PIdx2NpcIdx(),250);			   
			   nss = GetNpcAttribute(PIdx2NpcIdx(),186);
			   nmj = GetNpcAttribute(PIdx2NpcIdx(),394);			   
			   nyx = GetNpcAttribute(PIdx2NpcIdx(),77);	
			   wxj1 = GetNpcAttribute(PIdx2NpcIdx(),401);	
			   wxj2 = GetNpcAttribute(PIdx2NpcIdx(),402);				   
			   wxm1 = GetNpcAttribute(PIdx2NpcIdx(),403);	
			   wxm2 = GetNpcAttribute(PIdx2NpcIdx(),404);
			   wxs1 = GetNpcAttribute(PIdx2NpcIdx(),405);
			   wxs2 = GetNpcAttribute(PIdx2NpcIdx(),406);	
			   wxh1 = GetNpcAttribute(PIdx2NpcIdx(),407);
			   wxh2 = GetNpcAttribute(PIdx2NpcIdx(),408);				   
			   wxt1 = GetNpcAttribute(PIdx2NpcIdx(),409);
			   wxt2 = GetNpcAttribute(PIdx2NpcIdx(),410);	
			   nZhanGong = GetTask(701)
			   nZhanGong2 =abs(nZhanGong)
               PlayerIndex = nOldPlayer --恢复当前编号	 
	 local     TaskStr ="<color=orange>角色:<color>"..name.."   流派:" ..gf_GetRouteName(GetPlayerRoute()).."   军工:" ..nZhanGong2.."   时间:" .. date("%Y-%m-%d %H:%M:%S").."\n"
	 TaskStr = TaskStr.."<color=yellow>生命:"..cLife.."/"..nLife.."   外攻:"..wg1.."-"..wg2.."   外防:"..nwf.."%/"..nwfd.."   半伤:"..njb.."   伤害:"..nsh.." <color>\n"
	 TaskStr = TaskStr.."<color=Blue2>内力:"..cNeili.."/"..nNeili.."   内攻:"..ng1.."-"..ng2.."   内防:"..nnf.."%/"..nnfd.."   无视半伤:"..nwuj.." <color>\n"
	 TaskStr = TaskStr.."<color=green>力量:"..nLL.."   身法:"..nSF.."   内功:"..nNG.."   洞察:"..nDC.."   根骨:"..nGG.."   傲骨:"..nag.."<color>\n"
	 TaskStr = TaskStr.."<color=red>施展:"..nsz.."   破防:"..npf.."   必闪:"..nbs.."   闪避:"..nsb.."   命中:"..nmz.."   天命:"..ntm.."<color>\n"
	 TaskStr = TaskStr.."<color=red2>击倒免疫概率:"..njd.."   击退免疫概率:"..njt.."   麻痹免疫概率:"..nmb.."   眩晕免疫概率:"..nxy.."<color>\n"
	 TaskStr = TaskStr.."<color=orange>混乱免疫概率:"..nhl.."   睡眠免疫概率:"..nsm.."   迟缓免疫概率:"..nch.."   受伤动作缩短:"..nss.."<color>\n" 
	 TaskStr = TaskStr.."<color=green2>定身免疫概率:"..nds.."   减速免疫概率:"..njs.."   秘籍加成属性:"..nmj.."   药效延长属性:"..nyx.."<color>\n"	
	 TaskStr = TaskStr.."<color=gray>金:"..wxj1.."/"..wxj2.."   木:"..wxm1.."/"..wxm2.."   水:"..wxs1.."/"..wxs2.."   火:"..wxh1.."/"..wxh2.."   土:"..wxt1.."/"..wxt2.."<color>\n"		
   local Npc_name = GetName(nOldPlayer)
   if MISSION_GMID1 == Npc_name or MISSION_GMID2 == Npc_name or MISSION_GMID3 == Npc_name or MISSION_GMID4 == Npc_name or MISSION_GMID5 == Npc_name or MISSION_GMID6 == Npc_name then
   Say("账号:<color=green> "..account.."<color>          - 角色:<color=green> "..name.."<color>      - 等级:<color=green> "..lv.."<color>   -   \n流派:<color=green> "..nRouteName.."<color>        - 碎银: <color=green>"..xu.."<color>             - 金子: <color=green>"..(tv/10000).."<color>      - 游侠值: <color=green>"..kp.."<color>\n本次IP: <color=green>"..szCIP.."<color>-上次IP: <color=red>"..szLIP.."<color>\n力量:<color=green>"..nLL.." <color>身法:<color=green>"..nSF.." <color>内功:<color=green>"..nNG.." <color>洞察:<color=green>"..nDC.." <color>根骨:<color=green>"..nGG.."<color>                          ",
   9,  
			"移动到玩家的位置/teleportToPlayer",
            "移动玩家到我的位置/moveToPlayer",
			"踢出游戏/KickGame",			
			"禁言玩家（不包括帮会）/KhoaChat",
			"解除禁言/MoChat",		
			"冻结角色（永久冻结无解）/heimingdan1",
	--		"解除黑名单/heimingdan2",
	        "改书/ask_testbook",
			"给玩家金子/Tvang",
            "结束对话/no_say")
   
 
   else
--   Talk(1,"",TaskStr)
	local selTab = {};
	local szTitle = TaskStr
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
   end	
  
--  
	 
--	 local TaskStr = "角色<color=yellow>:"..name.."<color>\n"
--	 TaskStr = TaskStr.."<color=red>生命:<color><color=red>"..cLife.."/"..nLife.."<color><color=red>外攻:<color><color=Gold>"..nCurPhysic_Attack.."-"..nMaxPhysic_Attack.."<color><color=red>外防:<color><color=Gold>"..nMaxPhysic_Defense.."%-"..nMaxPhysic_Defense.."<color=red>半伤:<color><color=Gold>"..nMaxPhysic_Defense.."<color><color=red>傲骨:<color><color=Gold>"..nMaxPhysic_Defense.."<color>\n"
--	 TaskStr = TaskStr.."<color=Blue2>内力:<color><color=Blue2>"..cNeili.."/"..nNeili.."<color><color=red>内攻:<color><color=Gold>"..nCurMagic_Attack.."-"..nMaxMagic_Attack.."<color><color=red>内防:<color><color=Gold>"..nMaxMagic_Defense.."%-"..nMaxMagic_Defense.."<color=red>无视半伤:<color><color=Gold>"..nMaxPhysic_Defense.."<color><color=red>天命:<color><color=Gold>"..nMaxPhysic_Defense.."<color>\n"
--	 TaskStr = TaskStr.."<color=green>力量:<color><color=Gold>"..nLL.."<color><color=green>身法:<color><color=Gold>"..nSF.."<color><color=green>内功:<color><color=Gold>"..nNG.."<color><color=green>洞察:<color><color=Gold>"..nDC.."<color><color=green>根骨:<color><color=Gold>"..nGG.."<color>\n"
--	 TaskStr = TaskStr.."<color=red>施展:<color><color=Gold>"..nLL.."<color><color=red>破防:<color><color=Gold>"..nLL.."<color><color=red>必闪:<color><color=Gold>"..nLL.."<color><color=red>闪避:<color><color=Gold>"..nLL.."<color><color=red>命中:<color><color=Gold>"..nLL.."<color><color=red>伤害:<color><color=Gold>"..nLL.."<color>\n"
--	 TaskStr = TaskStr.."\n"
--	 TaskStr = TaskStr.."\n"
--	 TaskStr = TaskStr.."\n"  
	 
--	if nPrenticeCount >= nMaxPrenticeCount then
--		Say("你不能再收徒弟了.", 0)
--		return 0
--	end
	
--	local nLevel = GetLevel()
--	local szName = GetName()
--	local tInfo = GetMPBaseInfo()
--	local nOldPlayer = PlayerIndex
--	PlayerIndex = nTargetIndex
--	if PlayerIndex <= 0 then
--		return
--	end
--	local nTarLevel = GetLevel()
--	local szTarName = GetName()
--	local tTarInfo = GetMPBaseInfo()
--	local nIsSleeping = IsSleeping()
	
--	PlayerIndex = nOldPlayer
--	if nTarLevel >= nLevel then		-- 等级比自己高,不能收
--		Say(szTarName.." 等级比自己高,不能收为徒弟.", 0)
--		return 0
--	end
--	if nIsSleeping > 0 then
--		Say(szTarName.." 处于睡眠状态,无法回应.", 0)
--		return 0
--	end
	
--	local nMTime = tInfo["mtime"] - GetTime()		-- 收徒的CD到了没
--	if nMTime > 0 then
--		local nHour = floor(nMTime / 3600)
--		nMTime = mod(nMTime, 3600)
--		local nMin = floor(nMTime / 60)
--		local nSec = mod(nMTime, 60)
--		Say("你还有 <color=red>"..nHour.." 时 "..nMin.." 分 "..nSec.." 秒<color>才能收纳一个徒弟.", 0)
--		return 0
--	end
	
--	if tTarInfo["master"] == szName then
--		Say(szTarName.." 已经是你的徒弟了。", 0)
--		return 0
--	end
	
--	if tInfo["prentice"] ~= nil then
--		for index, value in tInfo["prentice"] do
--			if value == szTarName then
--				Say(szTarName.." 已经是你的徒弟了.", 0)
--				return 0
--			end
--		end
--	end
	
--	if tInfo["evermaster"] ~= nil then
--		for index, value in tInfo["evermaster"] do
--			print("1"..value)
--			if value == szTarName then
--				Say(szTarName.." 你们曾经做过师徒关系,不能加载.", 0)
--				return 0
--			end
--		end
--	end
	
--	if tTarInfo["evermaster"] ~= nil then
--		for index, value in tTarInfo["evermaster"] do
--			if value == szName then
--				print("2"..value)
--				Say(szTarName.." 你们曾经做过师徒关系,不能加载.", 0)
--				return 0
--			end
--		end
--	end

--	if tTarInfo["master"] ~= "" then
--		Say(szTarName.."已经是徒弟了 "..tTarInfo["master"]..",不能加载.", 0)
--		return 0
--	end
	
--	if tTarInfo["ismaster"] ~= 0 then
--		Say(szTarName.."已是师父,不能加载.", 0)
--		return 0
--	end
	
--	local nPTime = tTarInfo["ptime"] - GetTime()
--	if nPTime > 0 then
--		local nHour = floor(nPTime / 3600)
--		nPTime = mod(nPTime, 3600)
--		local nMin = floor(nPTime / 60)
--		local nSec = mod(nPTime, 60)
--		Say(szTarName.."还要等 <color=red>"..nHour.." 时 "..nMin.." 分 "..nSec.."秒<color>才能拜师", 0)
--		return 0
--	end
	
--	Talk(1, "", "您已经发出邀请 "..szTarName.." 当徒弟")
--	return 1
end

function _to_be_master(nRet)
	if nRet == 0 or nRet == 10 then
	--	Say("你的名字已经登记在案了,现在可以收纳弟子了.按 F3 开启[属性页]就能看到师徒界面.如果你想加入和提高师徒的技能,就来找我!",0)
	end
end

function _add_temp_member(nRet, nParam1, nParam2, szParam)
--	if nRet == 22 then
--		if nParam1 > 0 and szParam == "m" then
--			local nHour = floor(nParam1 / 3600)
--			nParam1 = mod(nParam1, 3600)
--			local nMin = floor(nParam1 / 60)
--			local nSec = mod(nParam1, 60)
--			Say("你还要等 "..nHour.." 时 "..nMin.." 分 "..nSec.." 后才可以收纳一个徒弟.", 0)
--		elseif nParam2 > 0 and szParam == "p" then
--			local nHour = floor(nParam2 / 3600)
--			nParam2 = mod(nParam2, 3600)
--			local nMin = floor(nParam2 / 60)
--			local nSec = mod(nParam2, 60)
--			Say("你还要等 "..nHour.." 时 "..nMin.." 分 "..nSec.." 秒后才能拜师.", 0)
--		end
--	elseif nRet == 12 or nRet == 13 then
--		if szParam == "m" then
--			Say("你的授业现在不能收更多徒弟了.", 0)
--		end
--	elseif nRet == 0 then
--		if szParam == "p" then
--			Say("你被录取做你师父的临时徒弟了. \n直到你的等级达到十级.请和师父一起组队,近距离使用动作 <color=red>拜<color>, 将成为正式弟子.", 0)
--		end
--	end
end

function _ture_join(nRet, nParam)
--	if nRet == 0 and nParam == 0 then		-- 正是拜师以后把以前的出师任务变量清空
--		SetTask(GRADUATE_TASK_ID, 0)
--		SetTask(TASK_SEED, 0)
--		SetTask(TASK_CONTENT, 0)
--		Msg2Player("你成了正式的弟子.请到国子监学官那里接受装备.")
--	end
--	if nRet == 12 or nRet == 13 then
--		if nParam == 1 then
--			Say("你的职业学生现在不能再有正式的徒弟了.", 0)
--		end
--	end
end

function _pre_chk_betray()
--	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
--		return 1
--	end
--	Say("离开师门需要消耗99个师徒符纸,你不够师徒符纸.", 0)
--	return 0
end

function _betray(nRet)
--	if nRet ~= 0 then	-- 失败了，把师徒符纸还给徒弟
--		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
--	end
end

function _pre_chk_kickout()
--	print("_pre_chk_kickout()")
--	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
--		return 1
--	end
--	Say("弟子离开师门,需要消耗99个师徒符纸,你不够师徒符纸.", 0)
--	return 0
end

function _kickout(nRet)
--	if nRet ~= 0 then	-- 失败了，把师徒符纸还给玩家
--		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
--	end
end

function _graduate(nRet, nParam, szParam)
--	local nOldPlayer = PlayerIndex
--	for i=1, 2 do
--		PlayerIndex = GetTeamMember(i)
--		if PlayerIndex ~= nOldPlayer then
--			break
--		end
--	end
--	local szOtherName = GetName()
--	PlayerIndex = nOldPlayer
--	if nRet == 0 then
--		if szParam == "p" then
--			SetTask(GRADUATE_TASK_ID, 0)
--			SetTask(TASK_SEED, 0)
--			SetTask(TASK_CONTENT, 0)
--			local n = CustomDataRead("mp_p_award_final")
--			if n == nil then
--				AddItem(2, 1, 593, 1, 1)
--				CustomDataSave("mp_p_award_final", "d", 1)
--				WriteLog("[师徒-出师]:"..GetName().."收到一个师恩难忘包")
--				SaveNow()
--			end
--			Say("你已有能力独自闯荡江湖了, 师父 <color=yellow>"..szOtherName.."<color> 虽舍不得你,但也不能太自私,得让你到江湖多多锻练.", 0)
--		elseif szParam == "m" then
--			Say("徒弟弟 <color=yellow>"..szOtherName.."<color> 出师,师父教导之恩终身难忘. ", 0)
--			if nParam > 0 then
--				AddItem(2, 1, 589, nParam, 1)
--				Msg2Player("恭喜你获得了[国子监俸禄]x "..nParam..".")
--				WriteLog("[师徒-出师]:"..GetName().."获得"..nParam.." 个国子监俸禄")
--				SaveNow()
--			end
--		end
--	end
end

function _buyfund(nRet, nParam, szParam)
--	if nRet == 0 and szParam ~= "" then		-- 师父
--		Say("你成功为 <color=yellow>"..szParam.."<color> 购买了 <color=yellow>"..nParam.."<color> 份花红.请注意公告新闻,获得奖励在师徒界面上操作,有什么不明白的就来找我!",0)
--		WriteLog("[师徒系统]: 成功购买花红 (m) m="..GetName().." p="..szParam.." n="..nParam)
--	elseif nRet == 0 and szParam == "" then	-- 徒弟
--		Say("你的师父为你购买了 <color=yellow>"..nParam.."<color> 份花红.",0)
--		WriteLog("[师徒系统]: 成功购买花红 (p) m="..GetName().." p="..szParam.." n="..nParam)
--	elseif nRet ~= 0 and szParam ~= "" then	-- 师父，而且购买失败了
--		AddItem(2,1,594,nParam*10,1)
--		WriteLog("[师徒系统]: 购买花红失败 m="..GetName().." p="..szParam.." n="..nParam)
--	end
end

function _p_getfund(nRet, nParam1, nParam2)
	Msg2Player(nRet, nParam1, nParam2)
end

function _m_getfund(nRet, nParam1, nParam2, szParam)
	if nParam1 > 0 then
		local i = 1
		for n=1, 21 do
			i = i * 2
			if i == nParam1 then
				nParam1 = n + 1
				break
			end
		end
	end
	if nRet == 0 and nParam2 > 0 then
		if nParam1 == 1 or nParam1 == 5 or nParam1 == 6 or nParam1 == 9 or nParam1 == 11 or nParam1 == 13 then
			nParam2 = nParam2 * 2
		elseif nParam1 == 2 or nParam1 == 3 or nParam1 == 4 or nParam1 == 8 or nParam1 == 10 or nParam1 == 12 or (nParam1 >= 14 and nParam1 <= 22) then
			nParam2 = nParam2
		elseif nParam1 == 7 then
			nParam2 = nParam2 * 3
		end
			
		AddItem(2,1,589,nParam2)
		Msg2Player("恭喜你获得了 "..nParam2.." 个国子监俸禄 ")
		SaveNow()
		WriteLog("[师徒俸禄]"..GetName().."收到"..nParam2.." 个国子监俸禄")
	end
end

function _finnalfund(nRet, nParam)
	if nRet == 0 then
		AddItem(2,1,589,nParam)
		Say("恭喜你获得了 "..nParam.." 个国子监俸禄", 0)
		SaveNow()
		WriteLog("[师徒-师父的收入]"..GetName().."收到"..nParam.." 个国子监俸禄")
	elseif nRet == 17 then
		local nDiffTime = nParam
		local nDay = floor(nDiffTime / 86400)
		nDiffTime = mod(nDiffTime, 86400)
		local nHour = floor(nDiffTime / 3600)
		nDiffTime = mod(nDiffTime, 3600)
		local nMin = floor(nDiffTime / 60)
		Say("还需要 "..nDay.." 天 "..nHour.." 时 "..nMin.." 分才能领取花红", 0)
	elseif nRet == 18 then
		Say("你已经领到了这个花红.", 0)
	end
end

function _free_change_point(nRet, nType, nPoint)
	WriteLog("[S?у free_change_point] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("你不够师徒")
	elseif nRet == 21 then
		Msg2Player("朝朝廷可以帮助你找到师徒")
	elseif nRet == 0 then
		if nType == 1 then				-- 金钱
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- 声望
			Msg2Player("声望")
		elseif nType == 3 then			-- 师门贡献度
			Msg2Player("师门贡献度")
		elseif nType == 4 then			-- 军功
			SetRankPoint(5, 701, 1)	-- 衰减操作在SetRankPoint的时候才进行,所以要先衰减,再扣
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("恭喜你获得了 "..(20*nPoint).." 军功")
		elseif nType == 5 then			-- 健康经验
			Msg2Player("K. 测试( 健康))")
		elseif nType == 6 then			-- 经验
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("恭喜你获得了 "..nAddExp.." 经验点")
		elseif nType == 7 then			-- 健康经验转经验
			Msg2Player("健康转化为经验")
		end
	end
end

function _change_point(nRet, nType, nPoint)
	WriteLog("[师徒点] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("不好意思!你的师徒点不够")
		AddItem(tItem[1],tItem[2],tItem[3],nPoint)	-- 把没有成功兑换的师徒符纸还给玩家
	elseif nRet == 0 then
		if nType == 0 then				-- 师德
			Msg2Player("恭喜你用 "..nPoint.." 点师徒点转换成师德点")
		elseif nType == 1 then			-- 金钱
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- 声望
			Msg2Player("声望")
		elseif nType == 3 then			-- 师门贡献度
			Msg2Player("师门贡献度")
		elseif nType == 4 then			-- 军功功
			SetRankPoint(5, 701, 1)	-- 衰减操作在SetRankPoint的时候才进行,所以要先衰减,再扣
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("恭喜你获得了 "..(20*nPoint).." 军功点")
		elseif nType == 5 then			-- 健康经验
			Msg2Player("K. 测试( 健康)")
		elseif nType == 6 then			-- 经验
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("恭喜你获得了 "..nAddExp.." 经验点")
		elseif nType == 7 then			-- 健康经验转经验
			Msg2Player("健康点转化为经验")
		end
	end
end

function _disband(nRet)
	if nRet == 9 then
		Msg2Player("门下尚有弟子时,不能取消登记")
	elseif nRet == 0 then
		Msg2Player("阁下取消了在国子监的登记,可以去拜师了.如果你改变主意想重新召收弟子,就来找我登记吧.")
	end
end

function _want_take_on_a_master(nRet)
	if nRet == 1 then
		Say("暂时来拜师太多,信息还不能发给你的师父,请稍后试.", 0)
	end
end

function _tansfer_map_chk(nMapID)
	-- 地盘判断
	local isExist = 0
	for index, value in t_can_use_map do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		return 0
	end
	return 1
end

function _master_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Say(szRoleName.." 不是你的徒弟,不能传送", 0)
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Say(szRoleName.." 不是你的徒弟,不能传送", 0)
		return
	end
	
	if IsStalling() ~= 0 then
		Say("出售时不能传送", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("修练秘籍时不能传送.", 0)
		return
	end
	
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		Say("城外PK模式.", 0)
		return
	end

	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _prentice_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		Msg2Player(szRoleName.." 不是你的师父,不能传送")
		return
	end
	if IsStalling() ~= 0 then
		Say("出售时不能传送", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("修练秘籍时不能传送.", 0)
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		Say("城外PK模式,不能传送", 0)
		return
	end
	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _master_lalala(szRoleName)
	-- 地图检测
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < 1 then
		Say("需要<color=green>师徒符纸<color>才能召唤徒弟.<color>", 0)
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("目前区域无法召唤徒弟 ", 0)
		return
	end
	
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Msg2Player(szRoleName.."不是你的徒弟,不能召唤")
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Msg2Player(szRoleName.." 不是你的徒弟,不能召唤")
		return
	end
	DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la", GetName())
	Talk(1,"","您已经发出召唤 "..szRoleName.." 的请求.")
end

function _tansfer_yes(nMapID, nX, nY, nFightState, nParam)
	-- 地图检测
	if _tansfer_map_chk(nMapID) == 0 then
		Say("你不能到目标区域", 0)
		return
	end

	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		CleanInteractive()
		if NewWorld(nMapID, nX, nY) ~= 0 then
			SetFightState(nFightState)
		end
	else
		Say("必须要有<color=green>师徒符纸<color>才能使用召唤功能。 <color>", 0)
	end
end

function _master_want_la(szRoleName)
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.." 不是你的徒弟,")
		return
	end
	if tInfo["istemp"] == 0 then			-- 临时徒弟不能用此功能
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."目前的区域 ")
		return
	end
	if IsPlayerDeath() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."已经阵亡")
		return
	end
	if IsStalling() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."在摆卖")
		return
	end
	if IsReading() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."在修炼秘籍")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		DoScriptByName(szRoleName, "\\script\\master_prentice\\some_op.lua", "_master_want_la_err", szName.."在城外PK状态下,")
		return
	end

	RandomTaskTipEx("你师父想请你到他那边.", "_prentice_see_la")
end

function _master_want_la_err(szMsg)
	Talk(1, "", szMsg.."没有办法回应你的召唤!")
end

function _accept_lalala(szMsg)
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "你师父所在的区域无法召唤你.")
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		local nMapID, nX, nY = GetWorldPos()
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice", nMapID..","..nX..","..nY..","..GetFightState())
	else
		Msg2Player("必须要有<color=green>师徒符纸<color>才能召唤徒弟.")
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "你师父师徒符纸不够,无法召唤你.")
	end
end

function _lalala_prentice(szMsg)
	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end
	
	local tPos = split(szMsg, ",")
	CleanInteractive()
	if NewWorld(tPos[1], tPos[2], tPos[3]) ~= 0 then
		SetFightState(tPos[4])
	end
end

function _refuse_la(szMsg)
	Msg2Player(szMsg.."拒绝您的召唤!")
end

function _lalala_prentice_err(szMsg)
	Say(szMsg, 0)
end

-- 正式拜师 and 出师
-- 满足条件则返回1
-- 不满足则返回0
function master_prentice()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- 不是师徒2人组队
		return 0
	end
	local nMap1, nX1, nY1 = GetWorldPos()
	
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local nMasterIndex = PlayerIndex
	local szMasterName = GetName()
	local szMasterLevel = GetLevel()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- 丫的根本没有徒弟
		PlayerIndex = nOldPlayer
		return 0
	end
	local nMap2, nX2, nY2 = GetWorldPos()
	local fDistance = distance_between_points(nMap1, nX1, nY1, nMap2, nX2, nY2)
	if fDistance >= 6 or fDistance < 0 then
		PlayerIndex = nOldPlayer
		local t = GetMPBaseInfo()
		if t["master"] == szMasterName then
			if t["istemp"] == 0 then
				Msg2Player("你离师父太远了,不够诚意,不能成为正式的徒弟。")
			elseif t["istemp"] == 1 then
				Msg2Player("你离师父太远了,不够诚意,不能出师.")
			end
		end
		return 0
	end
	PlayerIndex = nOldPlayer
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szMasterName then	-- 丫的根本不是这个人的师父
		return 0
	end
   Msg2Player("3")
	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		print(value)
		if value == szName then
			isExist = 1
			break
		end
	end
	Msg2Player("4")
	if isExist == 0 then					-- 不在师父的徒弟列表里捏
		return 0
	end
	
	-- 如果是出师
	if GetTask(GRADUATE_TASK_ID) == 1 then
		local isAlright = 1
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		PlayerIndex = nMasterIndex
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		if isAlright == 0 then
			return 0
		end
		PlayerIndex = nOldPlayer
		PrecticeGraduate(szMasterName)
		return 1
	end
	
	-- 是转正
	if tInfo["istemp"] == 1 then		-- 已经转正了还拜个毛啊)
		return 0
	end
	
	if GetLevel() < 10 then					-- 小于给个提示(不能是Talk, Say之流，否则后面拜的内容可能玩完了)
		Msg2Player("你的等级还不到十级, 不能成为正式的弟子。")
		return 0
	end
	if GetLevel() >= szMasterLevel then
		Msg2Player("你的级别必须比你师父小,才能成为正式的弟子.")
		PlayerIndex = nMasterIndex
		Msg2Player(szName.." (低级)必须比你小, 才能成为正式的弟子.")
		return 0
	end
	
	Msg2Player("你发来请求成为正式的弟子. 请等待您师父的回复。")
	-- 转正
	PlayerIndex = nMasterIndex
	SetPlayerScript("\\script\\master_prentice\\some_op.lua")
	Say(szName.."想正式拜你为师, 归入部门的门下, 是收受正式的弟子吗?", 2 , "同意/yes_add_true", "让我想想!/refuse_add_true")
	return 1
end

function refuse_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- 不是师徒2人组队
		return 0
	end
	local szName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	if PlayerIndex > 0 then
		Say(szName.."拒绝成为你的正式弟子.", 0)
	end
end

function yes_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		return
	end
	local szMasterName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			TakeOnAMaster(1, szMasterName)	-- 正式拜师
			break
		end
	end
	PlayerIndex = nOldPlayer
end

-------  npc 操作	-------------------------------------------------------------------------

function yes_make_master()
	if GetLevel() < 75 then
		Say("想要传授武功, 自己至少要有充分的实力. 等75级,然后重新注册。",0)
		return
	end
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("你拜了师傅了, 暂时不能报名收纳弟子.",0)
		return
	end
	ToBeMaster()
end

function yes_be_prentice()
	Say("如果你想当徒弟. 按一下「 」 以进行操作。 \n如果拜师妾失而复得,可以找我拿回来!", 0)
end

function buy_fund()
	if GetTeamSize() ~= 2 then
		Say("如果想给徒弟购买花红,请组队来找我.",0)
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		Say("如果想给徒弟购买花红,请师徒组队来找我.",0)
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- 组队的没有师徒关系
		PlayerIndex = nOldPlayer
		Say("如果想给徒弟购买花红,现在的队伍没有师徒关系.",0)
		return
	end
	
	if tPInfo["istemp"] == 0 then			-- 不能帮临时弟子购买花红
		PlayerIndex = nOldPlayer
		Say("不能帮临时弟子购买花红",0)
		return
	end
	
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- 不在师父的徒弟列表里捏
		Say("如果想给徒弟购买花红,队伍成员没有师徒关系.",0)
		return
	end
	
	local nAlreadyBuy = tPInfo["lovefund"]
	if tPInfo["lovefund"] >= 10 then
		Say("你已经给 "..szPrenticeName.." 购买了宋元通宝x10",0)
		return
	end
	if nAlreadyBuy < 0 then
		nAlreadyBuy = 0
	end
	local nMaxBuy = MAX_FUND_COUNT - nAlreadyBuy
	
	Say(" 你想给 <color=yellow>"..szPrenticeName.."<color> 购买花红吗?之前你已为 "..szPrenticeName.." 购买过 <color=red>"..nAlreadyBuy.."<color> 份,最多还能买<color=red>"..nMaxBuy.."<color> 份,消耗宋元通宝x10购买1份. 宋元通宝是太祖登基时铸造的,目前在民间很少见,你也可以到御街购买",
		2,
		"确认购买/#yes_buy_fund("..nMaxBuy..")",
		"让我想想/no_say")
end

function yes_buy_fund(nMaxBuy)
	local nCount = GetItemCount(2,1,594)
	if nCount < 10 then
		Say("你的宋元通宝不足10,买不了花红",0)
		return
	end
	local nMaxCanBuy = tonumber(floor(nCount / 10))
	local nMax = nMaxBuy
	if nMaxCanBuy < nMaxBuy then
		nMax = nMaxCanBuy
	end
	SetTaskTemp(26, nMax)
	AskClientForNumber("yes_buy_fund_cb", 1, nMax, "请输入数量")
end

function yes_buy_fund_cb(nN)
	local nCount = nN * 10
	if nN > GetTaskTemp(26) then
		SetTaskTemp(26, 0)
		return
	end
	SetTaskTemp(26, 0)
	if GetTeamSize() ~= 2 then
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- 组队的没有师徒关系
		return
	end	
	if tPInfo["istemp"] == 0 then			-- 不能帮临时弟子购买花红
		return
	end
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- 不在师父的徒弟列表里捏
		return
	end
	if DelItem(2,1,594,nCount) == 1 then
		BuyLovefund(szPrenticeName, nN)
		WriteLog("[师徒系统]: mua hoa h?ng m="..szMasterName.." p="..szPrenticeName.." n="..nN)
	end
end

function get_graduate_item()
	if BigGetItemCount(2,1,590) > 0 then
		Say("<color=green>国子监学官<color>: 你已经有一个[出师哨]了.",0)
		return
	end
	local nTime = CustomDataRead("mp_m_get_graduate_item_time")
	local nNow = GetTime()
	if nTime == nil then
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	else
		local nDiffTime = 3600 - (nNow - nTime)
		if nDiffTime > 0 then		-- 60分钟才能领取一次
			local nMin = floor(nDiffTime / 60)
			local nSec = mod(nDiffTime, 60)
			Say("你还需要 "..nMin.." 分 "..nSec.." 秒后才领取1个 [出师哨].", 0)
			return
		end
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	end
		
	
	if AddItem(2,1,590,1,1) == 1 then
		Say("果然名师出身高徒,令徒进步很快,可以使用[出师哨], 师生一起组队,在野外可以召唤出国子监巡考,朝廷只用出师哨进行考核,击败国子监巡考的队伍可以出师.请注意：最后一击要由令徒完成.", 0)
	end
end

function use_point()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "use_point_r2s", 1) == 0 then				-- 先刷新一下数据
		use_point_r2s()
	end
end

function use_point_r2s()
	Say("你想如何操作你的师徒点数?",
		4,
		"我想用师徒点数领取奖励/use_point_award",
		"用师徒点数给徒弟领取奖励/use_point_award1",
		"我想把师徒点数转化成师德点数/use_point_point",
		"离开/no_say")
end

function use_point_award()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
--	if nPoint <= 0 then
--		Say("你们现在没有师徒点数,不能领奖", 0)
--		return
--	end
	
	if nCanChangePoint - nChangePoint <= 0 then
		Say("根据职业等级, 朝廷免费提供 <color=yellow>"..nCanChangePoint.."<color> 师徒点兑换奖励。你当前已免费 <color=yellow>"..nChangePoint.."<color> 师徒点,兑换时不要输入太大数.", 0)
		return
	end
	
	Say("你当前有 <color=yellow>"..nPoint.."<color> 师徒点数,以职业等级为基础,朝廷会免费 <color=yellow>"..nCanChangePoint.."<color> 师徒点领取奖励,你转当前已免费 <color=yellow>"..nChangePoint.."<color> 师徒点,可以免费 <color=yellow>"..(nCanChangePoint - nChangePoint).."<color> 师徒点.你愿意免费领取奖励吗?",
		2,
		"让我看看能兑换什么奖励?/see_award_type",
		"让我想想/no_say"
		)
end

function see_award_type()
	Say("你想用师徒点换取什么奖励?",
		2,
		--"金钱。每1点师徒点数可换3.8金/#yes_use_point(1)",
		--"声望/#yes_use_point(2)",
		--"师门贡献度/#yes_use_point(3)",
		--"军功。每1点师徒点数可换20点军功/#yes_use_point(4)",
		--"健康经验/#yes_use_point(5)",
		"经验.师徒点数兑换等级*等级*10的经验/#yes_use_point(6)",
		--"健康经验转经验/#yes_use_point(7)",
		"让我想想!/no_say")
end

function yes_use_point(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- 军功
		Say("无门无派,不能换军功.", 0)
		return
	end

	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint > nPoint then
		nDiffPoint = nPoint
	end
	AskClientForNumber("yes_use_point_award_cb", 1, nDiffPoint, "请输入师徒点数")
	SetTaskTemp(10, nType)
end

function yes_use_point_award_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	SetTaskTemp(10, 0)
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint < nCount then
		return
	end
	if nPoint < nCount then
		return
	end
	local nRet = FreeChangeTaskPoint(nCount, nType)
	if nRet == -1 then
		Msg2Player("你的师徒符纸不够")
	elseif nRet == -2 then
		Msg2Player("朝廷帮不了你这么多点的免费")
	end
end

function use_point_award1()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("你没有师徒点数,无法兑换奖励.", 0)
		return
	end
	
	Say("你当前有 <color=yellow>"..nPoint.."<color> 师徒点数, 每次兑换1个点,都会失去一个师徒符纸.想换一下吗?",
		2,
		"我要看看有什么奖励/see_award_type1",
		"让我想想!/no_say"
		)
end

function see_award_type1()
	Say("你可以选择下面的奖励",
		4,
		"银两. 1点师徒点兑换了3.8两/#yes_use_point1(1)",
		--"声望/#yes_use_point(2)",
		--"师门贡献度/#yes_use_point(3)",
		"战功. 1点师徒点兑换20点军功/#yes_use_point1(4)",
		--"健康经验/#yes_use_point(5)",
		"经验. 1点师徒点兑换等级*等级*10 的经验/#yes_use_point1(6)",
		--"健康经验转经验/#yes_use_point(7)",
		"让我想想!/no_say")
end

function yes_use_point1(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- 军功
		Say("无门无派,无法换取军功。", 0)
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	AskClientForNumber("yes_use_point_award1_cb", 1, nPoint, "请输入数量")
	SetTaskTemp(10, nType)
end

function yes_use_point_award1_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint < nCount then
		return
	end
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("师徒符纸只够换这么多奖励,可以到御街购买.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		local nRet = ChangeTaskPoint(nCount, nType)
		if nRet == -1 then
			Msg2Player("你获得了师徒符纸")
			AddItem(tItem[1],tItem[2],tItem[3],nCount,1)	-- 把没有成功兑换的师徒符纸还给玩家
		end
	end
end

function use_point_point()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("你们没有师徒点数,无法转换成师德点数", 0)
		return
	end
	
	Say("以德为师,师徒必失师徒符纸, 每 <color=yellow>1<color> 点师德点数需要 <color=yellow>1<color> 师徒点数。你当前师徒点数是 <color=yellow>"..nPoint.."<color> 点,确定要转换成师德吗?",
		2,
		"是的/#yes_use_point_point("..nPoint..")",
		"让我想想!/no_say")
end

function yes_use_point_point(nPoint)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < 1 then
		Say("你没有师徒符纸,准备一些再来,可以到御街购买.",0)
		return
	end
	AskClientForNumber("yes_use_point_point_cb", 1, nPoint, "请输入数量")
end

function yes_use_point_point_cb(nCount)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("师徒符纸不足,请准备多一些带来,可以到御街购买.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		ChangeTaskPoint(nCount, 0)
	end
end

t_specail_item =
{
	{2,1,2000,"流星泪","灵石合成时添加物价值量为100",1},
	{2,1,2001,"玉髓","灵石合成时添加物价值量为200",10},
	{2,0,554,"修真要诀"," 增加1000修为点数",1},
	{2,0,141,"消劫散","清除1点PK值",3},
	{2,1,1091,"金萝卜","本日科考运势大吉",3},
	{2,1,9995,"间谍装束","使用后可获得200银券",3},
	{2,1,1157,"斗魂"," 提高杀气值10点",15},
	{2,1,1103,"实战经验集","师门历练活动补缴",4},
	{2,0,553,"大人参果","秘籍修炼速度提升到4倍,持续4小时",5},
	{2,1,1014,"绿林狼烟","野外地图召唤北绿林盟主",15},
	{2,1,1047,"始皇秘诏","野外地图召唤枪神赢天",15},
	{2,1,1024,"御用白玉石","消耗10个生辰纲,必定召唤出步非烟",15},
	{2,1,1048,"鸳鸯金丝帕","野外地图召唤冷香菱",20},
	{2,1,1015,"武林秘令","野外地图召唤各大门派高手",30},
	{2,1,504,"女娲精石","拆下所装备秘籍上的一张诀要",120},
	{2,1,540,"礼金箱","获得50个礼金",60},
	{2,0,125,"会盟令牌","建立帮会所必需的令牌",150},
	{2,1,1003,"麒麟丸","31级以上声望未到3000者直接到达3000声望",600},
	{2,1,1002,"龙血丸","低于73级者直接升至73级并额外给予2000万经验",1000},
	{2,1,1004,"凤血丸","等级在72级以上者直接到达4000师门贡献度",1200},
	{2,1,1005,"战神丸","军功未到都统级者,直接到达都统级军功",1500},
	{0,105,19,"超光","永久马匹",5000},
	{2,21,2016,"灵石配方外攻五级","外攻提高15%(武器)制作方法的配方",2000},
	{2,21,2021,"灵石配方内攻五级","内攻提高15%(武器)制作方法的配方",2000},
	{2,21,2117,"灵石配方施展速度五级","武功施展速度提高25%(头冠)制作方法的配方",3000},
	{2,21,2240,"灵石配方外防削减七级","攻击使敌人外防削减15%(武器)制作方法的配方",1000},
	{2,21,2247,"灵石配方内防削减七级","攻击使敌人内防削减15%(武器)制作方法的配方",1000},
}

function use_fenglu(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "上一页/#use_fenglu("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(t_specail_item) then
		nEnd = getn(t_specail_item)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = format("%-20s%s? (需要%d国子监俸禄)/#buy_specail_item(%d)", t_specail_item[i][4],t_specail_item[i][5],t_specail_item[i][6],i)
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(t_specail_item) then
		tSay[nTabIndex] = "下一页/#use_fenglu("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "离开/no_say"
	
	Say("目前出售的物品如下: <color>", getn(tSay), tSay)
end

function buy_specail_item(nIndex)
	local nMaxCount = GetItemCount(2,1,589)  --国子监俸禄
	if nMaxCount < t_specail_item[nIndex][6] then
		Say("你没有足够的国子监俸禄来购买 <color=yellow>"..t_specail_item[nIndex][4].."<color>.", 0)
		return
	end
	SetTaskTemp(1, nIndex)
	AskClientForNumber("buy_specail_item_cb", 1, floor(nMaxCount/t_specail_item[nIndex][6]), "请输入数量")
end

function buy_specail_item_cb(nCount)
	if Zgc_pub_goods_add_chk(nCount, nCount) == 0 then
		return
	end
	local nIndex = GetTaskTemp(1)
	if DelItem(2,1,589,nCount * t_specail_item[nIndex][6]) == 1 then
		if nIndex == 22 then
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount,1,-1,-1,-1,-1,-1,-1)
		else
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount)
		end
		Msg2Player("恭喜你成功购买了 "..nCount.." 个 "..t_specail_item[nIndex][4])
		WriteLog("[师徒俸禄]:"..GetName().." 购买了 "..nCount.." 个 "..t_specail_item[nIndex][4])
	end
end

function disband_master()
	Say("取消您的登记,将失去您的师父身份,行放弃未收的国子监俸禄、师德点、师徒点、等级授业. 你想清楚了吗?",
		2,
		"是的/yes_disband_master",
		"离开/no_say")
end

function yes_disband_master()
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] ~= nil then
		Say("有弟子不得取消激活.",0)
		return
	end
	DisbandMaster()
end

function create_task()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)	== 0 then			-- 先刷新一下数据
		create_task_r2s()
	end
end

function create_task_r2s()
	local tInfo = GetMPBaseInfo()
	if tInfo["ismaster"] == 0 then
		return
	end
	
	local ltime = tInfo["taskinterval"]
	if ltime > 0 then
		local nHour = floor(ltime / 3600)
		ltime = mod(ltime, 3600)
		local nMin = floor(ltime / 60)
		local nSec = mod(ltime, 60)
		Say("你已经发布了一次师徒任务,距离下次发布师徒任务的时间是: <color=yellow>"..nHour..":"..nMin..":"..nSec, 0)		
	else
		Say("你可以选择下面的师徒任务来发布",
			8,
			"完成2次初级师门任务或完成20次会商任务, 徒弟奖励: 15 师门贡献点/#ask_create_task(1)",
			"完成5次杀手任务或完成20次会商任务 徒弟奖励: 50 声望点/#ask_create_task(2)",
			"打完一场战场或完成20次会商任务, 徒弟奖励: 150分军功/#ask_create_task(3)",
			"藏剑山庄过2关或完成20次会商任务, 徒弟奖励:经验 (等级*等级*110)/#ask_create_task(4)",
			"历经4关太虚幻境或完成20次会商任务, 徒弟奖励:经验 (等级*等级*120)/#ask_create_task(5)",
			"完成龙舟比赛4次或完成交易20次, 徒弟奖励:经验 (等级*等级*110)/#ask_create_task(6)",
			"参加单人擂台5次或完成20次会商任务, 徒弟奖励:经验 (等级*等级*100)/#ask_create_task(7)",
			"现在不想发布任务/no_say")
	end
end

function ask_create_task(nType)
	local strConfirm
	if nType == 1 then
		strConfirm = "这次师徒的任务是: 完成初级师门任务2次或完成第20次会商任务, 徒弟奖励:师门贡献点"
	elseif nType == 2 then
		strConfirm = "这次即将发布的师徒任务是: 完成5次杀手任务或完成20次会商任务, 徒弟奖励:50 声望点"
	elseif nType == 3 then
		strConfirm = "这次即将发布的师徒任务是: 打完一场战场或完成20次会商任务, 徒弟奖励:150分军功"
	elseif nType == 4 then
		strConfirm = "这次即将发布的师徒任务是: 藏剑山庄过2关或完成20次会商任务,徒弟奖励:经验 (等级*等级*110)"
	elseif nType == 5 then
		strConfirm = "这次即将发布的师徒任务是: 历经4关太虚幻境或完成20次会商任务, 徒弟奖励:经验 (等级*等级*120)."
	elseif nType == 6 then
		strConfirm = "这次即将发布的师徒任务是: 完成龙舟比赛4次或完成20次会商任务, 徒弟奖励:经验 (等级*等级*110)."
	elseif nType == 7 then
		strConfirm = "这次即将发布的师徒任务是: 参加单人擂台5次或完成20次会商任务, 徒弟奖励:经验 (等级*等级*100)."
	end
	Say(strConfirm.."你确定要发布任务吗?",2, "是的/#yes_create_task("..nType..")", "现在不想发布任务/no_say")
end

function yes_create_task(nType)
	MasterCreateTask(nType)
	Say("成功发布任务,通知弟子,点击按钮[接取任务]来接受这个师徒任务.", 0)
end

function no_say()
end