setName="fu_ultrameshset"

weaponBonus={
	{stat = "powerMultiplier", effectiveMultiplier = 1.20}
}


armorBonus={
	{stat = "shieldStaminaRegen", baseMultiplier = 1.35},
	{stat = "shieldBonusShield", amount = 0.35},
	{stat = "perfectBlockLimitRegen", baseMultiplier = 1.35},
	{stat = "aetherImmunity", amount = 1},
	{stat = "extremepressureProtection", amount = 1},
	{stat = "pressureProtection", amount = 1},
	{stat = "insanityImmunity", amount = 1}
}

require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

function init()
	setSEBonusInit(setName)
	effectHandlerList.weaponBonusHandle=effect.addStatModifierGroup({})

	checkWeapons()

	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		checkWeapons()
	end
end


function checkWeapons()
	local weaponSword=weaponCheck({"shortsword","rapier","katana"})
	local weaponShield=weaponCheck({"shield"})
	--local weapons=weaponCheck({"shortsword","shield"})
	
	if weaponSword["either"] and weaponShield["either"] then
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,weaponBonus)
	else
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,{})
	end
end