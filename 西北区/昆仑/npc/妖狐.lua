TB_FOX_DIALOG = {
	"<color=green>妖狐<color>：是谁干的，我要杀了他！",
	"<color=green>妖狐<color>：啊啊啊，这法阵的力里越来越大，我已经不能动弹了！",
	"<color=green>妖狐<color>：谁来救救我！我已经没…半点力气……了……",
}
function main()
	Talk(1,"",TB_FOX_DIALOG[random(getn(TB_FOX_DIALOG))])
end
