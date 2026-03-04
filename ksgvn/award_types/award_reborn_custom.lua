AwardRebornCustom = {}
AwardRebornCustom.szKey = 'nRebornCustom'

function AwardRebornCustom:Give(tbAward, _, _)
    if type(tbAward.nRebornCustom) == "number" then
        if KsgPlayer:GetBigLevel() < tbAward.nRebornCustom then
            KsgReborn:PlayerRebornWithNews(tbAward.nRebornCustom, random(1, 4), tbAward.szCallback)
        end
    end
end
