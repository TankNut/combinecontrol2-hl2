FLAG.Name = "Unit"
FLAG.Team = TEAM_COMBINE

FLAG.Armor = 100

function FLAG:VisibleRPName(ply)
	return "CCA.C17." .. ply:CID()
end

function FLAG:GetModelData(ply)
	return {_base = {
		Model = Model("models/player/police.mdl"),
		Materials = "models/police/metrocop_sheet"
	}}
end
