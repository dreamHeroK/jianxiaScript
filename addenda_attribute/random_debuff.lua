
random_debuff = {
	{"state_sleep",18*2},
	{"state_paralysis",18*2},
	{"state_confusion",18*2},
	{"state_fetter",18*2},
	{"state_vertigo",18*2},
}

function OnSkill(nNpcIndex, nSkillID, nSkillLV)	
	local randomIdx = random(1,getn(random_debuff))
	local stateStr = random_debuff[randomIdx][1]
	local stateTime = random_debuff[randomIdx][2]
	CastState2NpcOrPlayer(nNpcIndex,stateStr,100,stateTime)
end
