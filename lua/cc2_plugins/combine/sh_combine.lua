module("Combine", package.seeall)

local PLAYER = FindMetaTable("Player")

CharacterVar.Add("CID", {Default = "0000", DataType = VARCHAR(4)})

Doors.AddAccessType("combine", {
	Name = "Combine",
	Color = Color(33, 106, 196),
	CanAccess = function(ent, ply)
		return ply:IsCombine()
	end
})

function PLAYER:IsCombine()
	return tobool(self:ActiveCombineFlag() or self:RunCharFlag("IsCombine"))
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

	if ply:IsCombine() then
		return CLASSIFY_COMBINE
	end

	if ply:IsArmed() then
		return CLASSIFY_ARMED
	end

	return CLASSIFY_NEUTRAL
end
