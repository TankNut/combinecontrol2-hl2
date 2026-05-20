module("Combine", package.seeall)

local PLAYER = FindMetaTable("Player")

CharacterVar.Add("CID", {Default = "0000", DataType = VARCHAR(4)})

Doors.AddAccessType("combine_basic", {
	Name = "Combine",
	Color = Color(33, 106, 196),
	CanAccess = function(ent, ply)
		return ply:HasCombineAccess("doors")
	end
})

function PLAYER:GetCombineAccess()
	local access = {}

	local function add(flag, key)
		local data = flag:Run(self, key)

		if data then
			table.Merge(access, table.Lookup(data))
		end
	end

	add(self:GetCharFlag(), "CombineAccess")

	local flag = self:GetCombineFlag()

	if flag then
		add(flag, "BaseAccess")

		if self:Flagged() then
			add(flag, "Access")
		end
	end

	return access
end

function PLAYER:HasCombineAccess(name)
	return tobool(self:GetCombineAccess()[name])
end

function GenerateCID()
	return string.format("%04i", math.random(9999))
end

hook.Add("PreCreateCharacter", "cc2.Combine.CID", function(ply, fields)
	if not fields.CID then
		fields.CID = GenerateCID()
	end
end)

function GM:OnCIDChanged(ply, old, new, loaded)
	if loaded then
		return
	end

	ply:UpdateVisibleName()
end

function GM:GetPlayerClassification(ply)
	if ply:IsLoneWolf() then
		return CLASSIFY_LONEWOLF
	end

	if ply:HasCombineAccess("npcs") then
		return CLASSIFY_COMBINE
	end

	if ply:IsArmed() then
		return CLASSIFY_ARMED
	end

	return CLASSIFY_NEUTRAL
end
