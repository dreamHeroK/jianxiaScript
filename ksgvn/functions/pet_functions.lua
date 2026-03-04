Import("\\script\\ksgvn\\lib.lua")

function pet_AddLinhLuc()
    gf_ModifyPetLingli(10000)
end

function pet_Active(nLevel)
    if gf_GetPetSkillLevel() < nLevel then
        gf_SetPetSkillLevel(nLevel)
        pet_AddPetAndBook(nLevel)
    end
end

function pet_AddRandom(nLevel)
    local tbPet = {
        [1] = random(24, 26),
        [2] = random(1, 3),
        [3] = random(4, 15),
        [4] = random(16, 23),
        [5] = random(27, 45),
        [6] = random(46, 55),
        [7] = random(56, 65),
        [8] = random(66, 68),
    }
    if not tbPet[nLevel] then
        return
    end
    local bRet = AddPet(tbPet[nLevel])
    if bRet and bRet ~= -1 then
        Msg2Player(format("NhËn ®­îc 1 thó c­ng cÊp %d", nLevel))
    end
end

function pet_AddBookByNum(nLevel, nNumber)
    nNumber = nNumber or 1
    nLevel = nLevel or 1
    for i = 1, nNumber do
        pet_AddBook(nLevel)
    end
end

function pet_AddPetAndBook(nLevel)
    nLevel = nLevel or 1
    pet_AddRandom(nLevel)
    pet_AddBook(nLevel)
end

function pet_AddBook(nLevel)
    if nLevel > 4 then
        if nLevel == 5 then
            AddItem(2, 150, random(67, 86), 1)
        end
        if nLevel == 6 then
            AddItem(2, 150, random(87, 101), 1)
        end
        if nLevel == 7 then
            AddItem(2, 150, random(100, 106), 1)
        end    
        if nLevel == 8 then
            AddItem(2, 150, random(107, 126), 1)
        end
    else
        local tbPetBook = {
            { 2, 150, 1 + nLevel - 1 },
            { 2, 150, 5 + nLevel - 1 },
            { 2, 150, 9 + nLevel - 1 },
            { 2, 150, 13 + nLevel - 1 },
            { 2, 150, 17 + nLevel - 1 },
            { 2, 150, 21 + nLevel - 1 },
            { 2, 150, 25 + nLevel - 1 },
            { 2, 150, 29 + nLevel - 1 },
            { 2, 150, 33 + nLevel - 1 },
            { 2, 150, 37 + nLevel - 1 },
            { 2, 150, 41 + nLevel - 1 },
            { 2, 150, 45 + nLevel - 1 },
            { 2, 150, 49 + nLevel - 1 },
            { 2, 150, 53 + nLevel - 1 },
            { 2, 150, 57 + nLevel - 1 },
        }
        KsgAward:Give(KsgLib:RandomTableValue(tbPetBook))
    end
end
