--¼àÀÎNPCÀÎÍ·
--created by lizhi
--2005-9-25 19:46
Include("\\script\\lib\\dailogsay.lua");

function main()
        local szSay = {
            "Thiªn lao träng ®Þa, kh«ng ®­îc ®i l¹i lung tung!",
            "Gióp dïm ®i m?/bribe",
            "Rêi khái thiªn lao/leave_prison",
            "Xem ngµy chÞu ph¹t/inquire",
            "KÕt thóc ®èi tho¹i/end_say"
        }
        SelectSay(szSay)
end

function bribe()
	 nNeedPrisonTime = 1440*2*GetBePrisonedNum()
	 nLeftPrisonTime = GetPrisonLeftTime()
	 if (nLeftPrisonTime == 0) then
	 		NoSin()
	 elseif (nLeftPrisonTime <= nNeedPrisonTime)  then 
	    nMoney = GetCash()
	    nSaveMoney = GetSaveMoney()
	    nNeedMoney = nNeedPrisonTime * 5 *10000 / 60
	    nGold = nNeedMoney / 10000
			if (nMoney >= nNeedMoney) then
			      local szSay = {
            "Ng­¬i ?®©y mÊy ngµy råi, nÕu c?ng©n l­îng"..nGold.."ta s?gióp ng­¬i rêi khái ®©y!",
            "Ta ®ång ?/#leave_by_paymoney("..nNeedMoney..")",
            "ThËt kinh tëm!/end_say"
            }
           SelectSay(szSay)
			elseif (nMoney + nSaveMoney >= nNeedMoney) then
						local szSay = {
            "Ng­¬i ?®©y mÊy ngµy råi, nÕu c?ng©n l­îng"..nGold.."ta s?gióp ng­¬i rêi khái ®©y!",
            "Ta ®ång ?/#leave_by_paysavemoney("..nNeedMoney..")",
            "ThËt kinh tëm!/end_say"
            }
           SelectSay(szSay)
			else
			    laugh()
			end		
	 else
	 	    local szSay = {
        "Hõm! Míi v?®· muèn ra råi, v?suy ngh?l¹i ®i!",
        "KÕt thóc ®èi tho¹i/end_say"
        }
        SelectSay(szSay)
	 end	 
end

function leave_prison()
    nLeftPrisonTime = GetPrisonLeftTime()
    
    if (nLeftPrisonTime > 0) then
    	  local szSay = {
        "Ch­a hÕt ngµy th?h×nh, kh«ng ®­îc rêi khái thiªn lao!",
        "KÕt thóc ®èi tho¹i/end_say"
        }
        SelectSay(szSay)
    else 
			  leave_say()
    end 
end

function end_say()

end

function leave_say()
  local szSay = {
  "Ch¬i game ®Ó gi¶i tr? kh«ng nªn s?auto!",
  "Rêi khái thiªn lao/leave"
  }
  SelectSay(szSay)	
end

function leave()
		NewWorld(200, 1373, 2700, 1)
		SetPlayerRevivalPos(200, 200)
		SetLeftPunishTime(0)
		SetPrisonLeftTime(0)
		UseSkillEnable(1)
		StallEnable(1)
end

function laugh()
  local szSay = {
  "Hõm! Ch?Ýt ái ng©n l­îng vÇy m?còng muèn qua ¶i ? v?suy ngh?l¹i ®i!",
  "KÕt thóc ®èi tho¹i/end_say"
  }
  SelectSay(szSay)
end

function NoSin()
	local szSay = {
  "Ng­¬i ®©u c?téi, t×m ta lµm chi vËy!",
  "KÕt thóc ®èi tho¹i/end_say"
  }
  SelectSay(szSay)
end

function leave_by_paymoney(nNeedMoney)
	 if Pay(nNeedMoney) == 1 then
	 		szLog = "[BribeMoney]Account: "..GetAccount().." RoleName: "..GetName().." Bribe Money: "..nNeedMoney .."In Pack"
	    WriteLog(szLog)
			leave_say()
	 end
end

function leave_by_paysavemoney(nNeedMoney)
  nMoney = GetCash()
  nSaveMoney = nNeedMoney - nMoney
	if (Pay(nMoney) == 1)  then
		szLog = "[BribeMoney]Account: "..GetAccount().." RoleName: "..GetName().." Bribe Money: "..nNeedMoney .."In Pack"
		WriteLog(szLog)
		if (PaySaveMoney(nSaveMoney)==1) then
			szLog2 = "[BribeMoney]Account: "..GetAccount().." RoleName: "..GetName().." Bribe Money: "..nSaveMoney.."In Box"
	    WriteLog(szLog2)
	    leave_say()
		end
	end
end

function inquire()
  nNeedPrisonTime = 1440*2*GetBePrisonedNum()
	nLeftPrisonTime = GetPrisonLeftTime()
	
	if nLeftPrisonTime > 0 then
	  local szSay = {
	  "Theo luËt §¹i Tèng ng­¬i ®· b?b¾t"..nNeedPrisonTime.." phót, thêi gian rêi thiªn lao cßn "..nLeftPrisonTime.." phót!",
	  "KÕt thóc ®èi tho¹i/end_say"
	  }
	  SelectSay(szSay)
  else
	  local szSay = {
	  "Ng­¬i ®· ®­îc tha, mau rêi khái ®©y!",
	  "KÕt thóc ®èi tho¹i/end_say"
	  }
	  SelectSay(szSay)
  end
  
end
