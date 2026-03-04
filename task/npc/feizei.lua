Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\tmp_task_id_def.lua")

function _ck_BZBD_Kill_Set()

    				Msg2Player("你已经获得白虎骨。");
end

function get_task_mimi()
	SetTask(3378, 10);
end