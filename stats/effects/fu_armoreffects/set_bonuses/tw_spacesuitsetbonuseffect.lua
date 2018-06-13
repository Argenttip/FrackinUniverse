require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

setName="tw_spacesuitset"

weaponBonus={}

armorBonus={
	{stat = "maxBreath", amount = 900},
	{stat = "breathDepletionRate", baseMultiplier = 1.0}
}

function init()
	setSEBonusInit(setName)
	effectHandlerList.weaponBonusHandle=effect.addStatModifierGroup({})
	effectHandlerList.armorBonusHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		effect.setStatModifierGroup(effectHandlerList.armorBonusHandle,armorBonus)
	end
end