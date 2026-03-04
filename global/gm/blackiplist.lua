--建议跟gm脚本放入一个路径可以直接在线直接重载增加或者删减ip地址
--playerloginin.lua更新名单时这个也要跟着重新载入可以两个写一起载入
tBlackIpList = 
{
	{"114.237.195.147"},--大蜗牛
	{"122.226.77.124"},--不知道是谁先干掉再说
	{"122.226.77.124"},--无邪	
	{"122.226.77.124"}--最后一列不需要逗号注意
}

function ck_ip_issue()
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
	local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
	return szLIP, szCIP
end;

function BlackIpList()--此处需要加载到玩家登录脚本里面playerloginin.lua--然后playerloginin.lua脚本要Include这个文件路径
BlackIpListOperation()
end

function BlackIpListOperation()	
local blackkip = ChkIp()	
	if blackkip == 1  then --接收下面检测函数得反馈
		ExitGame();--让他滚出去
	end
end

function ChkIp()
local szCIP = ck_ip_issue()--本次登录游戏的IP是
	for i, v in tBlackIpList do
		if v[1] == szCIP  then
			return 1
		end
	end
	return 0
end