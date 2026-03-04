--万剑冢数据统计

Include("\\settings\\static_script\\missions\\base\\runtime_data_stat.lua")

MAIN_ID = 4
--开启时对玩家的统计
function _stat_on_player_when_open_misson()
end
--全通时对玩家的统计
function _stat_on_player_when_all_pass()
end
--开启时的统计
function _stat_when_open_mission(bTianJiaolingMode)
end
--全通时的统计
function _stat_when_all_pass()
end
--免费翻盘统计
function _stat_when_open_free_card()
end
--收费翻盘统计
function _stat_when_open_ib_card()
end
--ib消耗计数
function _stat_when_ib_consume(nConsume)
end
--ib产出1计数
function _stat_when_ib_produce_gulingyu(nProduce)
end
--ib产出2计数
function _stat_when_ib_produce_super_book(nProduce)
end

