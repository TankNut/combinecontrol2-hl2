FLAG.Name = "Overwatch Soldier"
FLAG.Team = TEAM_OVERWATCH

FLAG.Health = 150
FLAG.Armor = 200

FLAG.Loadout = {"weapon_cc_hands"}

FLAG.Clothing = CLOTHING_PARTIAL

FLAG.SoldierModel = Model("models/player/combine_soldier.mdl")
FLAG.SoldierMaterial = "models/combine_soldier/combinesoldiersheet"

function FLAG:GetModelData(ply)
	return {_base = {
		Model = self.SoldierModel,
		Materials = self.SoldierMaterial
	}}
end
