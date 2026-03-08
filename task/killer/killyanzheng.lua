Include("\\script\\class\\ktabfile.lua");
Include("\\script\\task\\world\\task_head.lua")
QuestTab = new(KTabFile, "\\settings\\abluemoon_question.txt");

tbl_answer_index = {
	['A'] = 1,
	['B'] = 2,
	['C'] = 3,
	['D'] = 4,
	['a'] = 1,
	['b'] = 2,
	['c'] = 3,
	['d'] = 4,
};

tbl_answer_order = {
	"A",
	"B",
	"C",
	"D",
};

--========================================================================================
--===================================================答题公共部分开始============================================
function abluemoon_2nd_go()
  local  num = random(2,5)
	show_question(num, "问题如下，请听题：<enter>" )		
end	
-- 显示灯谜问题
function show_question(num, caption)
	local row_start = 1;
	local row_end = 417;
	local Qnum = num;
	local Onum = Qnum;

	if (row_end > 1) then
		local row = random(row_start, row_end)
		local answer = QuestTab:getCell(row, 2)
		local question = format("%s%s", caption, QuestTab:getCell(row, 3))
		local options = {}
		
		for i = 1, 4 do
			options[i] = QuestTab:getCell(row, 3 + i)
			options[i] = format("%s/#answer_ok(%d,%d)", options[i], Onum, Qnum)
			-- if (tbl_answer_index[answer] == i) then
			-- 	options[i] = format("%s/#answer_ok(%d,%d)", options[i], Onum, Qnum)
			-- else
			-- 	options[i] = format("%s/#answer_fail(%d,%d)", options[i], Onum, Qnum)
			-- end
		end
		ReSort(options)
		Say(question, 4, options[1], options[2], options[3], options[4])
	end
end

function ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

-- 回答正确
function answer_ok(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	local Qnum = num2;
	local num = num1;
	Msg2Player("恭喜你答对了！")
	SetTask(TASK_KILLER_DONUM_yanzheng,1);
--	use_yanhuo("神秘烟花")  --放烟花庆祝,能不能做情绪动作？
	--DoFireworks(862,1)  --后羿效果
end

-- 回答错误
function answer_fail(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	SetTask(ABLUEMOON_STATE,2) --停止答题
	local Qnum = num2;
	local num = num1;
	Msg2Player("你答错了！")
	SetTask(TASK_KILLER_DONUM_yanzheng,3);

end
--==================================================答题公共部分结束=================================================





function end_say()

end