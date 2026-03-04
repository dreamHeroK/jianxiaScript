Import("\\script\\task_access_code_def.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")

TASK_ID_TONG_GXD=3375--帮会贡献度
TASK_ID_DAILY_TASK=3376--每日任务 (BYTE1:任务id，BYTE2:完成次数 BYTE3：今日掉落侠义之证数目)
TASK_ID_TONG_TITLE=3377--帮会称号(BYTE1:使用Lv， Byte2：MaxLv)

TASK_BYTE_DAILY_TASK_IDX=1
TASK_BYTE_DAILY_TASK_CNT=2
TASK_BYTE_DAILY_DROP_CNT=3
TASK_BYTE_DAILY_EXT_DROP=4
TASK_BYTE_TITLE_LV=1
TASK_BYTE_TITLE_MAX_LV=2

MAX_TASK_DAILY_CNT=10
MAX_TASK_VAL_TONG_GXD=2000000000
NO_TITLE_GXD_LIMIT=1000
TONG_TITLE_MAX_LV=10
TONG_TITLE_G=72
DROP_RATE_MAX_RAND=10000
MAX_DAILY_DROP_XYZZ=100--每日掉落侠义之证上限
MAX_DAILY_DROP_XYZZ_EXT=100

TJZY_G,TJZY_D,TJZY_P=2,1,30913

tTongTitlePara = {
	--贡献度,同济之愿,gold,consume,drop_rate
    [1]={50, 7, 50, 25, 100},
    [2]={75, 14, 100, 35, 200},
    [3]={200, 28, 150, 50, 300},
    [4]={250, 42, 200, 65, 400},
    [5]={450, 63, 250, 75, 500},
    [6]={600, 84, 300, 100, 1000},
    [7]={1000, 112, 400, 125, 2000},
    [8]={2400, 168, 500, 150, 3000},
    [9]={4800, 252, 700, 175, 4000},
    [10]={8000, 364, 1000, 250, 5000},
}

function get_tong_gxd()
	return GetTask(TASK_ID_TONG_GXD)
end
function set_tong_gxd(nVal)
	return SetTask(TASK_ID_TONG_GXD, nVal, 0)
end
function add_tong_gxd(nVal)
	if nVal >= 0 then
		local nNew = get_tong_gxd() + nVal
		if nNew > 0 and nNew <= MAX_TASK_VAL_TONG_GXD then
			set_tong_gxd(nNew)
			return nNew
		end
	end
	return -1
end
function dec_tong_gxd(nVal)
	if nVal >= 0 then
		local nNew = get_tong_gxd() - nVal
		if nNew >= 0 and nNew <= MAX_TASK_VAL_TONG_GXD then
			set_tong_gxd(nNew)
			return nNew
		end
	end
	return -1
end


function reset_daily_task()
	return SetTask(TASK_ID_DAILY_TASK, 0, TASK_ACCESS_CODE_TONG_TITLE)
end
function get_daily_task_idx()
	return gf_SafeGetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_TASK_IDX)
end
function set_daily_task_idx(nVal)
	gf_SafeSetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_TASK_IDX, nVal, TASK_ACCESS_CODE_TONG_TITLE)
end
function get_daily_task_cnt()
	return gf_SafeGetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_TASK_CNT)
end
function inc_daily_task_cnt()
	local nNew = get_daily_task_cnt() + 1
	if nNew <= MAX_TASK_DAILY_CNT then
		gf_SafeSetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_TASK_CNT, nNew, TASK_ACCESS_CODE_TONG_TITLE)
		return nNew
	end
	return 0
end
function get_drop_xyzz()
	return gf_SafeGetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_DROP_CNT)
end
function set_drop_xyzz(nVal)
	return gf_SafeSetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_DROP_CNT, nVal, TASK_ACCESS_CODE_TONG_TITLE)
end
function add_drop_xyzz(nVal)
	if nVal >= 0 then
		local nMaxDrop = get_ext_drop() * MAX_DAILY_DROP_XYZZ_EXT + MAX_DAILY_DROP_XYZZ
		local nNew = get_drop_xyzz() + nVal
		if nNew > 0 and nNew <= nMaxDrop then
			set_drop_xyzz(nNew)
			if nNew == nMaxDrop then
				local szMsg = "H玬 nay nh薾 頲 ch鴑g nh薾 Hi謕 Ngh躠  t gi韎 h筺"
				Msg2Player(szMsg)
				Talk(1, "", szMsg)
			else
				Msg2Player(format("Ch骳 m鮪g nh薾 頲 ch鴑g nh薾 Hi謕 ngh躠, h玬 nay  nh薾 頲 %d/%d",nNew, nMaxDrop))
			end
			return nNew
		end
	end
	return -1
end
function get_ext_drop()
	return gf_SafeGetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_EXT_DROP)
end
function set_ext_drop(nVal)
	local nRet = gf_SafeSetTaskByte(TASK_ID_DAILY_TASK, TASK_BYTE_DAILY_EXT_DROP, nVal, TASK_ACCESS_CODE_TONG_TITLE)
	if check_drop_xyzz() == 1 then
		isolate_enable_player_event_watch("event_kill_npc", "handle_on_kill_npc") --可能还需要杀
	end
	return nRet
end
function check_drop_xyzz()
	local nMaxDrop = get_ext_drop() * MAX_DAILY_DROP_XYZZ_EXT + MAX_DAILY_DROP_XYZZ
	if get_drop_xyzz() >= nMaxDrop then return 0 end
	return 1
end


function get_tong_title_lv()
	return gf_SafeGetTaskByte(TASK_ID_TONG_TITLE, TASK_BYTE_TITLE_LV)
end
function set_tong_title_lv(nVal)
	return gf_SafeSetTaskByte(TASK_ID_TONG_TITLE, TASK_BYTE_TITLE_LV, nVal, TASK_ACCESS_CODE_TONG_TITLE)
end
function get_tong_title_max_lv()
	return gf_SafeGetTaskByte(TASK_ID_TONG_TITLE, TASK_BYTE_TITLE_MAX_LV)
end
function set_tong_title_max_lv(nVal)
	return gf_SafeSetTaskByte(TASK_ID_TONG_TITLE, TASK_BYTE_TITLE_MAX_LV, nVal, TASK_ACCESS_CODE_TONG_TITLE)
end
