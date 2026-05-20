FLAG.Name = "Rank Leader"
FLAG.Team = TEAM_COMBINE

FLAG.Armor = 100

function FLAG:VisibleRPName(ply)
	return "CCA.C17.RL-" .. ply:CID()
end

function FLAG:GetModelData(ply)
	return {_base = {
		Model = Model("models/player/police.mdl"),
		Color = Color(60, 20, 20)
	}}
end
