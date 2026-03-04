--  文件说明
--  所有触发器事件
--  Created by lizhi
--  2005-8-3 15:05
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_tsdl.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\tmp_task_id_def.lua")

function tgtask_trigger_c_189()
	CreateTrigger(0, 189, 80);
end;

function tgtask_trigger_r_189()
	RemoveTrigger(GetTrigger(80));
end;