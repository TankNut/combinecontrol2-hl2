TEAM_CITIZEN   = Team.Add("citizen", "Citizens", Color(0, 120, 0))
TEAM_COMBINE   = Team.Add("combine", "Combine",  Color(33, 106, 196))
TEAM_OVERWATCH = Team.Add("overwatch", "Overwatch", Color(222, 92, 0, 255))

local function Lang(command, name, unknown, default, override)
	return {
		Command = command,
		Name = name,
		Unknown = unknown or name,
		Default = default,
		Override = override
	}
end

GM.Languages = {
	Lang("eng", "English", nil, true)
}
