local FLAG = {}

function FLAG:Run(ply, name, ...)
	local var = self[name]

	if isfunction(var) then
		return var(self, ply, ...)
	else
		return util.SafeCopy(var)
	end
end

inherit.Register("combineflag", "base", FLAG)
