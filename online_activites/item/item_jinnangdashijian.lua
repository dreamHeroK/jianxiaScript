--=============================================
--create by baiyun 2010.1.7
--describe:越南版活动公共物品 锦囊大事件 脚本文件
--=============================================

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_define.lua")
--添加特殊对话
Include("\\script\\online_activites\\201211\\christmas_tree.lua")
Include("\\script\\online_activites\\201305\\plant_flower.lua")
Include("\\script\\online_activites\\201309\\plant_flower.lua")
Include("\\script\\online_activites\\201410\\plant_flower.lua")
Include("\\script\\online_activites\\201501\\item_shijinzongzi.lua")
Include("\\script\\online_activites\\201501\\gouhuo.lua")
Include("\\script\\online_activites\\201502\\item_xunchun.lua")
Include("\\script\\online_activites\\201503\\shangpinxiangshui.lua")
Include("\\script\\online\\viet_event\\event_notify_pouch.lua") 
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse(nItemIdx)
	SelectSay()
end

