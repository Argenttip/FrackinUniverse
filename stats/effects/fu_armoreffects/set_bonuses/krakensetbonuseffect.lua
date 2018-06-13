setName="fu_krakenset"

armorBonus2={
	{stat = "critChance", amount = 4},
	{stat = "powerMultiplier", effectiveMultiplier = 1.15},
	{stat = "sulphuricImmunity", amount = 1},
	{stat = "gasImmunity", amount = 1},
	{stat = "poisonStatusImmunity", amount = 1},
	{stat = "biooozeImmunity", amount = 1},
	{stat = "breathProtection", amount = 1},
	{stat = "swimboost2", amount = 1}
}

armorBonus={
	{stat = "sulphuricImmunity", amount = 1},
	{stat = "gasImmunity", amount = 1},
	{stat = "poisonStatusImmunity", amount = 1},
	{stat = "biooozeImmunity", amount = 1},
	{stat = "breathProtection", amount = 1}
}

require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

function init()
	setSEBonusInit(setName)

	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
	if (world.type() == "ocean") or (world.type() == "sulphuricocean") or (world.type() == "aethersea") or (world.type() == "nitrogensea") or (world.type() == "strangesea") or (world.type() == "tidewater") then
		effect.setStatModifierGroup(effectHandlerList.armorBonusHandle,armorBonus2)
	end
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		status.removeEphemeralEffect("swimboost2")
		effect.expire()
	else
		status.addEphemeralEffect("swimboost2")
	end
	if (world.type() == "ocean") or (world.type() == "sulphuricocean") or (world.type() == "aethersea") or (world.type() == "nitrogensea") or (world.type() == "strangesea") or (world.type() == "tidewater") then
		effect.setStatModifierGroup(effectHandlerList.armorBonusHandle,armorBonus2)

		mcontroller.controlModifiers({
			speedModifier = 1.05
		})
	else
		effect.setStatModifierGroup(effectHandlerList.armorBonusHandle,armorBonus)
	end
end
