Import("\\script\\class\\mem.lua");

KIniFile = {};

function KIniFile:__new(args)
	if not args or not args[1] then return end
	self:load(args[1]);
end

function KIniFile:load(szFilePath)
	self.__filename = szFilePath;
	if type(szFilePath) ~= "string" then return end
	
	if 0 == IniFile_Load(szFilePath) then
		print(format("[Error] [open ini file failed] [FilePath:%s]", tostring(szFilePath)));
		return
	end
	return 1;
end

function KIniFile:getItem(szSection, szKey)
	if not szSection or not szKey or "string" ~= type(szSection) or "string" ~= type(szKey) then
		print(format("[Error] [szSection = %s, szKey = %s]", tostring(szSection), tostring(szKey)));
		return
	end
		
	return IniFile_GetData(self.__filename, szSection, szKey);
end
