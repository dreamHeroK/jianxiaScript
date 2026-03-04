Include("\\script\\isolate\\online_activites\\liyu_challenge\\main.lua")
Import("\\script\\class\\ktabfile.lua")

function liyu_readFile()
    local szFile = "\\script\\isolate\\online_activites\\liyu_challenge\\liyu_data.txt"
    liyu_local_buf = {};
    local tTemp = {}
    local file = new(KTabFile,szFile)
    if not file then
		TabFile_Unload(szFile);
        return
	end
    local nRow = file:getRow();
    local nCol = file:getCol();
    for i=1,nRow do
        tTemp={file:getCell(i,1),file:getCell(i,2),tonumber(file:getCell(i,3)),file:getCell(i,4),tonumber(file:getCell(i,5)),file:getCell(i,6),tonumber(file:getCell(i,7)),tonumber(file:getCell(i,8))}
        liyu_local_buf[file:getCell(i,1)] = tTemp;
    end
    TabFile_Unload(szFile);
end

function liyu_writeFile()
    local szFile = "script/isolate/online_activites/liyu_challenge/liyu_data.txt"
    local szStr = "";
    for key,var in liyu_local_buf do
        if var == nil then return end;
        local tTmp = var
		local szTemp = format("%s	%s	%s	%s	%s	%s	%s	%s\n",tTmp[1],tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7],tTmp[8])
		szStr = szStr..szTemp;
    end
    local hFile = openfile(szFile, "w");
    write (hFile, szStr);
    closefile (hFile);
end