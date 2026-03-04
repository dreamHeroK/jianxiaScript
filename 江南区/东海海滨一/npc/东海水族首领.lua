--”„π÷Õ∑ƒø
--created by lizhi
--2005-8-24 15:25
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()
local nNpcIdx = GetTargetNpc();
local nMapId, nX, nY = GetNpcWorldPos(nNpcIdx);
CreateNpc("“ı–∞÷ÆªÍ", "“ı–∞÷ÆªÍ", nMapId, nX, nY);

end;
