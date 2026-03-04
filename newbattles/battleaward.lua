Include("\\script\\equip_shop\\equip_shop_head.lua")

--Create date：2007-3-2
--Author：yanjun
--Describe：战场奖励模块
--note：此脚本不宜乱被Include
SONG_ID = 1;
LIAO_ID = 2;

if IB_VERSION == 1 then
	g_szNeedItemName = "和氏璧";
else
	g_szNeedItemName = "和氏璧";
end;

--战场奖励主入口
function BTA_Main()
	CalcBattleRank();
	local nCurRank = BT_GetData(PT_CURRANK);
	local selTab = {
			"我想换取都统先锋装备/#show_equip_shop(24)",
			"我想换取将军装备/#show_equip_shop(25)",
			"我想换取天之将军装备/#show_equip_shop(26)",
			"我想换取元帅装备/#show_equip_shop(27)",
			"我想换取天之元帅装备/#show_equip_shop(28)",
			"我想了解换取规则/BTA_KnowRule",
			"我只是来看看！/nothing",
			}
	if abs(nCurRank) <= 7 then  -- 2 改 7 关闭
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：暂时关闭战场装备兑换！");
--		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的军衔太低，无法兑换战场装备！");
		return 0;
	end;
	for i=1,6-abs(nCurRank) do	--这个是用来去掉一些选项的，看起来比较怪，看不懂就算了
		tremove(selTab,abs(nCurRank)-1);	
	end;
	if (g_nNpcCamp == SONG_ID and nCurRank <= 0) or (g_nNpcCamp == LIAO_ID and nCurRank >= 0) then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：不好意思，你不符合换取<color=yellow>"..tCampNameZ[g_nNpcCamp].."方<color>战场装备的条件，请确认你的当前军衔是否为<color=yellow>"..tCampNameZ[g_nNpcCamp].."方<color>？");
		return 0;
	end;
	Say("<color=green>"..g_sNpcName.."<color>：你需要领取那种战场装备？",getn(selTab),selTab);
end;

--战场奖励兑换规则说明
function BTA_KnowRule()
	Talk(1,"BTA_KnowRule2","<color=green>"..g_sNpcName.."<color>：<enter>换取<color=yellow>都统装备<color>军衔必须达到<color=yellow>都统<color>及以上，每件装备需要消耗<color=yellow>500金<color>，<color=yellow>15000点战场积分<color>和<color=yellow>"..g_szNeedItemName.."<color>1个<enter>换取<color=yellow>先锋装备<color>军衔必须达到<color=yellow>先锋<color>及以上，每件装备需要消耗<color=yellow>1300金<color>，<color=yellow>30000点战场积分<color>和<color=yellow>"..g_szNeedItemName.."<color>4个");
end;

function BTA_KnowRule2()
	Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>：<enter>换取<color=yellow>将军装备<color>军衔必须达到<color=yellow>将军<color>及以上，每件装备需要消耗<color=yellow>2500金<color>，<color=yellow>60000点战场积分<color>和<color=yellow>"..g_szNeedItemName.."<color>10个<enter>换取<color=yellow>元帅装备<color>军衔必须达到<color=yellow>元帅<color>及以上，每件装备需要消耗<color=yellow>4000金<color>，<color=yellow>100000点战场积分<color>和<color=yellow>"..g_szNeedItemName.."<color>20个");
end;