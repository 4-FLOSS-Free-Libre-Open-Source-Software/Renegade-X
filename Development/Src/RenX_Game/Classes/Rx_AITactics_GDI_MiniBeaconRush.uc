class Rx_AITactics_GDI_MiniBeaconRush extends Rx_AITactics;

defaultproperties
{
	bPrioritizeInfantry = true
	GameTimeRelevancy = 90
	SkillMinimum = 4
	CreditsNeeded = 1300
	Orders=ATTACK
	bIsRush = True
	bIsBeaconRush = True

	PreparationTime = 30

	InfantryToMass[0] = class'Rx_FamilyInfo_GDI_Officer'
	InfantryToMass[1] = class'Rx_FamilyInfo_GDI_RocketSoldier'


	MinimumParticipant = 2;

	TacticName = "Mini-Beacon Rush"
}