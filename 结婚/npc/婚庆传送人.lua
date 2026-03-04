Include("\\script\\结婚\\marriage_head.lua");
CALLBACK_FILE		= "\\script\\结婚\\npc\\婚庆传送人.lua"		-- 回调文件名

g_date 		= 0		-- 日期
g_period 	= 0		-- 时段
g_couples 	= {}	-- 不同类型场地的新人名字
g_recvcount = 0		-- 收到的共享数据库记录数目

g_InfoHeader = "<color=green>侠侣庆典使者<color>：";

-- 是否在婚礼场地
function in_wedding_field()
	local mapid, x, y = GetWorldPos()
	for i = 1, getn(map_fieldpos) do
		if (map_fieldpos[i][1] == mapid) then
			return 1
		end
	end
	return 0
end

function main()
	if GetGlbValue(GLB_CLOSE_FIELD) == 1 then
		Talk(1,"",g_InfoHeader.."抱歉，婚礼场地暂时关闭。具体问题请问服务员！");
		return 0;
	end;
	if (in_wedding_field() == 1) then
		Say(g_InfoHeader.."恭喜你，您确定离开婚礼场地吗？", 2,
			"确定/ask_reason",
			"取消/cancel")
		return
	end
	
	local this_date = curr_date()
	local this_period = curr_period()
	if (g_date ~= this_date or g_period ~= this_period) then
		init(this_date, this_period)
	else
		Say(g_InfoHeader.."阁下是不是要到婚礼场地去？我可以帮忙送你过去。",
			3,
			"我要去侠侣庆典场地/enter",
			"看看现在是谁的侠侣庆典/show",
			"我再考虑考虑/cancel")
	end
end

function show()
	local sInfor = "";
	for type = 1, getn(map_fieldinfo) do
		if (g_couples[type][1] ~= "") then
			sInfor = sInfor..format("%s: 新郎<color=yellow>%s<color>和新娘<color=yellow>%s<color>", map_fieldinfo[type][1], g_couples[type][1], g_couples[type][2]).."<enter>";
		else
			sInfor = sInfor..format("%s：空闲", map_fieldinfo[type][1]).."<enter>";
		end
	end
	Talk(1,"main",g_InfoHeader.."现在各个婚礼场地的情况：<enter>"..sInfor)
end

function show_more_info()
	--需要的时候再添加内容吧
end;

function ask_reason()
	AskClientForString("leave"," 继续吧!......",1,32,"为什么要离开?");
end;	
-- 离开婚礼场地
function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"留言:"..sLeaveMsg);
end
--初始化场地信息，主要是初始化g_couples这个数组，将本时段场地所对应的新人名字填进去
function init(date, period)
	-- DEBUG
	gf_ShowDebugInfor(format("init(%d,%d)", date, period))
	for i = 1, getn(map_fieldpos) do
		g_couples[i] = {"", ""}
	end
	
	g_recvcount = 0
	for i = 1, getn(map_fieldpos) do
		local param2 = encode_param2(period, i)
		ApplyRelayShareData(KEY_WEDDING, date, param2, CALLBACK_FILE, "hook_recvsubs")
	end
end

-- 回调函数：读取场地预订信息
function hook_recvsubs(key, param1, param2, count)
	-- DEBUG
	gf_ShowDebugInfor(format("hook_recvsubs(%s,%d,%d,%d)", key, param1, param2, count))
	
	if (count ~= 0) then
		local period, type = decode_param2(param2)	
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		
		g_couples[type] = {role,wife}
	end
	
	g_recvcount = g_recvcount + 1
	if (g_recvcount == getn(map_fieldpos)) then
		g_date = curr_date()
		g_period = curr_period()
		main()
	end
end

-- 进入婚礼场地对话
function enter()
	-- DEBUG
	gf_ShowDebugInfor("enter()")
	local name = GetName()
	local sex = GetSex()
	for i = 1, getn(g_couples) do
		if (g_couples[i][sex] == name) then
			-- DEBUG
			gf_ShowDebugInfor("有人来了")
			local nDesMapID = map_fieldpos[i][1];
			local nFieldState = mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID);
			if nFieldState == MS_STATE_IDEL then	--目标场地空闲
				Talk(1,"main",g_InfoHeader.."目前婚礼尚不开放，请稍候！");
			else	--新人随时都可以进场
				mf_JoinMission(MISSION_ID,CAMP_COUPLE,nDesMapID);
				WriteLog("[结婚]: 亲人"..GetName().."结婚的场地,场地类型:"..i);
			end;
			return
		end
	end
	
	local this_date = curr_date()
	local this_period = curr_period()
	local types = get_invitaion(this_date, this_period)
	if (getn(types) == 0) then	--出错时才有可能为０
		Talk(1, "enter",g_InfoHeader.."场地上有新的结婚邀请")
	else
		local talk = {}
		local nSelCount = 0;
		for i = 1, getn(types) do
			nSelCount = nSelCount + 1;
			talk[nSelCount] = format("%s/#enter_field(%d,%d,%d)",
				map_fieldinfo[i][1],
				this_date,
				this_period,
				i)
		end
		talk[nSelCount+1] = "我先不过去/cancel"
		Say(g_InfoHeader.."请选择要去的婚礼场地", getn(talk), talk)
	end
end

-- 进入婚礼场地
function enter_field(date, period, type)
	local nDesMapID = map_fieldpos[type][1];
	local nDesWeddingID = mf_GetMissionV(MISSION_ID,MV_WEDDING_ID,nDesMapID);
	local nPlayerWeddingID = GetTask(TASK_WEDDING1_ID+type-1);
	local nFieldState = mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID);
	if nFieldState == MS_STATE_IDEL then
		Talk(1,"main",g_InfoHeader.."目前该婚礼场地还没开放，请阁下耐心等待！");
	elseif mf_GetPlayerCount(MISSION_ID,CAMP_FRIEND,nDesMapID) >= map_fieldinfo[type][5] then
		Talk(1,"main",g_InfoHeader.."在婚礼阶段，现场气氛非常热闹。新郎和新郎还未出来，在这里慢慢等着吧！");
	elseif nFieldState == MS_STATE_READY then	--如果是准备阶段
		if is_compere() == 1 then	--如果是主婚人
			if nPlayerWeddingID == nDesWeddingID then	--如果之前进去过
				mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--可以进场
				return
			end;
			if del_invitaion(date, period, type) == 1 then
				mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--可以进场
			else
				Talk(1,"enter",g_InfoHeader.."场地上有新的结婚邀请");
			end;
			return
		end;
		Talk(1,"main",g_InfoHeader.."新婚礼准备就绪，请稍等。");
		return
	else	--其它时间大家都可以进场
		if nPlayerWeddingID == nDesWeddingID then	--如果之前进去过
			mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--可以进场
			return
		end;
		if del_invitaion(date, period, type) == 1 then
			mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);
		else
			Talk(1,"enter",g_InfoHeader.."场地上有新的结婚邀请");
		end;
	end;
end
--返回一个table，只有四个元素，对应是否有相应类型场地的请帖，0表示没有，1表示有
function get_invitaion(date, period)
	local types = {};
	for i=1,getn(map_fieldinfo) do
		types[i] = 0;	--根据场地数量初始化types数组
	end;
	local obj_index, item_index = GetFirstItem()
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		if (genre == ITEM_INVITATION[1] and detail == ITEM_INVITATION[2] and particular == ITEM_INVITATION[3]) then
			local item_date = GetItemParam(item_index, 0)
			local item_period, type = decode_param2(GetItemParam(item_index, 1))
			if (date == item_date and period == item_period) then
				types[type] = 1;
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
		-- DEBUG
		gf_ShowDebugInfor(format("GetNextItem(%d,%d)", obj_index, item_index))
	end
	-- DEBUG
	gf_ShowDebugInfor("get_invitaion return")
	return types
end

function del_invitaion(date,period,type)
	local obj_index, item_index = GetFirstItem()
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		if (genre == ITEM_INVITATION[1] and detail == ITEM_INVITATION[2] and particular == ITEM_INVITATION[3]) then
			local item_date = GetItemParam(item_index, 0)
			local item_period, item_type = decode_param2(GetItemParam(item_index, 1))
			if (date == item_date and period == item_period and type == item_type) then
				if DelItemByIndex(item_index,1) == 1 then
					return 1;
				end;
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
	end
	return 0;
end;
