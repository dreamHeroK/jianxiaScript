--魔改版本技能石
function OnUse()
if DelItem(2,1,10011,1000) == 1 then
AddItem(2,22,1,1,4);
else
Talk(1,"","您并没有1000个碎片。")
end;
end;