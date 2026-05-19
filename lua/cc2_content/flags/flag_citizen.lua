FLAG.Name = "Citizen"
FLAG.Team = TEAM_CITIZEN

FLAG.Loadout = {"weapon_cc_hands"}

FLAG.Clothing = CLOTHING_FULL

-- CombineFlag support
function FLAG:Run(ply, name, ...)
	local flag = ply:ActiveCombineFlag()

	if flag and flag[name] then
		local var = flag[name]

		if isfunction(var) then
			return var(flag, ply, ...)
		else
			return util.SafeCopy(var)
		end
	else
		local var = self[name]

		if isfunction(var) then
			return var(self, ply, ...)
		else
			return util.SafeCopy(var)
		end
	end
end

function FLAG:GetModelData(ply)
	return {_base = {
		Model = ply:CharacterModel(),
		Skin = ply:CharacterSkin(),
		Materials = {
			["models/humans/male/group01/players_sheet"] = "models/humans/male/group01/citizen_sheet",
			["models/humans/female/group01/players_sheet"] = "models/humans/female/group01/citizen_sheet"
		}
	}}
end
