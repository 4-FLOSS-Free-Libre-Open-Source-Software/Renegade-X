class Rx_DmgType_MRLS extends Rx_DmgType_Shell;

defaultproperties
{
    KillStatsName=KILLS_MRLS
    DeathStatsName=DEATHS_MRLS
    SuicideStatsName=SUICIDES_MRLS

    VehicleDamageScaling=0.48
	lightArmorDmgScaling=0.48
    BuildingDamageScaling=0.96f
	AircraftDamageScaling=-1 //Ummm, Laser Rifle is OP as crap already vs. light vehicles. Seriously, how does Nod EVER lose the field when the SBH is this powerful?? Ignorant SBHs... that's how.
	MineDamageScaling=2.0

	IconTextureName="T_DeathIcon_MRLS"
	IconTexture=Texture2D'RX_VH_MRLS.UI.T_DeathIcon_MRLS'
}