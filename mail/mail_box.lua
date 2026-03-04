--脚本名称：邮箱
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-11-04
--代码修改记录
Include("\\script\\global\\gm\\gm_script.lua");   
function main()
	MailBoxEnable(1);
	SendScript2Client('Open([[MailBox]]);Open([[Items]]);');
	
--Talk(1,"","<color=green>邮箱<color>：当前仅支持管理员发送。");	
return
end
