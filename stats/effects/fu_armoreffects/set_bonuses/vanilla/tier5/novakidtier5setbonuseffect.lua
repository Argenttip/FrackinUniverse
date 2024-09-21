require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName="fu_novakidtier5setnew"

-- weaponBonus={
	-- {stat = "powerMultiplier", effectiveMultiplier = 1.22}
-- }

armorBonus={
	{stat = "shotgunMastery", amount = 0.22},
	{stat = "sniperrifleMastery", amount = 0.22},
	{stat = "rifleMastery", amount = 0.22},
	{stat = "pistolMastery", amount = 0.22},
	{stat = "shadowImmunity", amount = 1}
}

function init()
	setSEBonusInit(setName)
	-- effectHandlerList.weaponBonusHandle=effect.addStatModifierGroup({})

	-- checkWeapons()

	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	-- else

		-- checkWeapons()
	end
end

-- function checkWeapons()
	-- local weapons=weaponCheck({"shotgun","sniperrifle","rifle","pistol"})

	-- if weapons["either"] then
		-- effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,weaponBonus)
	-- else
		-- effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,{})
	-- end
-- end
