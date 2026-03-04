--脚本名称：西北区关卡玩家死亡脚本
--脚本功能：玩家死亡后测试是否所有的玩家都死亡，如果是则闯关失败
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-11-09
--代码修改记录：
Include("\\script\\missions\\northwest_mission\\stage\\stage_time.lua")
function OnDeath()
	--第六关死亡删除
		local minor_num = BigGetItemCount(2,0,1041)
		if minor_num  ~=0 then
			BigDelItem(2,0,1041,minor_num)
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().." 死亡,幻象,因为没有灵器,所以自己消失了!\")")
		end
	--结束
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	local death_chk_flag = 1
	local player_index_save = PlayerIndex
	for i = 1, getn(player) do
		if player[i] ~= player_index_save then
			PlayerIndex = player[i]
			death_chk_flag = (death_chk_flag * IsPlayerDeath())
		end
	end
	--如果全体死亡
	if death_chk_flag == 1 then
		local mission_count = GetMapTaskTemp(nMapID,1)
		WriteLog("[西北关卡]集体失败: ID 秈	"..GetMissionV(MS_STATE_DIFF_ID)..":"..nMapID..":"..mission_count.."	S? ngi ch琲	"..GetTeamSize().."	th阨 gian tr秈 qua	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
		SetMissionV(MS_TIMMER_LOOP_ID,6)
		stage_mission_fail(GetMissionV(MS_STATE_DIFF_ID))
		ClearMapNpc(nMapID)
		--准备关卡结束
	end
	PlayerIndex = player_index_save
end

