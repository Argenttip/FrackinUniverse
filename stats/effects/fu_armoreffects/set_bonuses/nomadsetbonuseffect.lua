require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

weaponBonus={
	{stat = "powerMultiplier", effectiveMultiplier = 1.15}
}

armorBonus2={
	{stat = "fireStatusImmunity", amount = 1},
	{stat = "fireResistance", amount = 0.30},
	{stat = "quicksandImmunity", amount = 1},
	{stat = "sandstormImmunity", amount = 1},
	{stat = "shieldStaminaRegen", baseMultiplier = 1.20}
}

armorBonus={
	{stat = "fireStatusImmunity", amount = 1},
	{stat = "quicksandImmunity", amount = 1},
	{stat = "sandstormImmunity", amount = 1},
	{stat = "shieldStaminaRegen", baseMultiplier = 1.20}
}

setName="fu_nomadset"

function init()
	setSEBonusInit(setName)
	effectHandlerList.weaponBonusHandle=effect.addStatModifierGroup({})

	checkWeapons()

	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
	if (world.type() == "desert") or (world.type() == "desertwastes") or (world.type() == "desertwastesdark") then--optional condition to have different armor bonuses
		effect.setStatModifierGroup(effectHandlerList.armorBonusHandle,armorBonus2)
	end
	
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		checkWeapons()
	end
	if (world.type() == "desert") or (world.type() == "desertwastes") or (world.type() == "desertwastesdark") then--optional condition to have different armor bonuses
		effect.setStatModifierGroup(effectHandlerList.armorBonusHandle,armorBonus2)
	else
		effect.setStatModifierGroup(effectHandlerList.armorBonusHandle,armorBonus)
	end
end

function checkWeapons()
	local weapons=weaponCheck({"dagger","knife","shortspear"})
	
	if weapons["either"] then
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,weaponBonus)
	else
		effect.setStatModifierGroup(effectHandlerList.weaponBonusHandle,{})
	end
end