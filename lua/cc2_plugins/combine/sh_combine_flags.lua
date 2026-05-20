module("CombineFlag", package.seeall)

List = List or {}

local PLAYER = FindMetaTable("Player")

CharacterVar.Add("CombineFlag", {DataType = VARCHAR(64)})
CharacterVar.Add("Flagged", {Default = false, DataType = BOOL()})

function Register(name, flag)
	List[name] = inherit.Register("combineflag", name, flag, flag.Base or "base")
end

function Get(name)
	return name and List[name]
end

function Exists(name)
	return tobool(name and List[name])
end

function RegisterFolder(dir)
	file.IterateRecursive(dir, "shared.lua", "LUA", function(path, folder)
		local name = string.Filename(path)

		if name == "shared" then
			name = string.Filename(folder)
		end

		_G.FLAG = {}

		shared(path)

		Register(string.gsub(name, "^flag_", ""), FLAG)

		FLAG = nil
	end)
end

function PLAYER:GetCombineFlag()
	return Get(PLAYER.CombineFlag(self))
end

function PLAYER:ActiveCombineFlag()
	if not PLAYER.Flagged(self) then
		return
	end

	return Get(PLAYER.CombineFlag(self))
end

function PLAYER:RunCharFlag(name, ...)
	local flag = self:ActiveCombineFlag()

	if flag and flag[name] then
		return flag:Run(self, name, ...)
	else
		return self:GetCharFlag():Run(self, name, ...)
	end
end

function GM:OnCombineFlagChanged(ply, old, new, loaded)
	if loaded or not ply:Flagged() then
		return
	end

	if not CombineFlag.Exists(new) then
		ply:SetFlagged(false)
	end

	ply:ApplyFlag()

	if SERVER then
		for _, item in pairs(ply:GetEquipment()) do
			item:CheckEquipmentSlot()
		end

		ply:GiveLoadoutWeapons()
	end
end

function GM:OnFlaggedChanged(ply, old, new, loaded)
	if loaded then
		return
	end

	ply:ApplyFlag()

	if SERVER then
		for _, item in pairs(ply:GetEquipment()) do
			item:CheckEquipmentSlot()
		end
	end
end

hook.Add("LoadContent", "cc2.CombineFlag", function(folder)
	RegisterFolder(folder .. "combineflags/")
end)
