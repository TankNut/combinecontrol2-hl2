FLAG.Name = "Citizen"
FLAG.Team = TEAM_CITIZEN

FLAG.Loadout = {"weapon_cc_hands"}

FLAG.Clothing = CLOTHING_FULL

function FLAG:GetModelData(ply)
	return {_base = {
		Model = ply:CharacterModel(),
		Skin = ply:CharacterSkin(),
		Materials = {
			["models/humans/male/group01/players_sheet"] = "models/humans/male/group01/citizen_sheet"
		}
	}}
end
