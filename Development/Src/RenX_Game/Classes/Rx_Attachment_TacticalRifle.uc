class Rx_Attachment_TacticalRifle extends Rx_WeaponAttachment;

var ParticleSystem BeamTemplate;
var class<UDKExplosionLight> ImpactLightClass;

var int CurrentPath;

simulated function SpawnBeam(vector Start, vector End, bool bFirstPerson)
{
	local ParticleSystemComponent E;
	local actor HitActor;
	local vector HitNormal, HitLocation;

	if ( End == Vect(0,0,0) )
	{
		if ( !bFirstPerson || (Instigator.Controller == None) )
		{
	    	return;
		}
		// guess using current viewrotation;
		End = Start + vector(Instigator.Controller.Rotation) * WeaponClass.default.WeaponRange;
		HitActor = Instigator.Trace(HitLocation, HitNormal, End, Start, TRUE, vect(0,0,0),, TRACEFLAG_Bullet);
		if ( HitActor != None )
		{
			End = HitLocation;
		}
	}

	E = WorldInfo.MyEmitterPool.SpawnEmitter(BeamTemplate, Start);
	E.SetVectorParameter('BeamEnd', End);
	if (bFirstPerson && !class'Engine'.static.IsSplitScreen())
	{
		E.SetDepthPriorityGroup(SDPG_Foreground);
	}
	else
	{
		E.SetDepthPriorityGroup(SDPG_World);
	}
}

simulated function FirstPersonFireEffects(Weapon PawnWeapon, vector HitLocation)
{
	local vector EffectLocation;

	Super.FirstPersonFireEffects(PawnWeapon, HitLocation);
	
	if(Rx_Weapon(PawnWeapon).WeaponFireTypes[Instigator.FiringMode] != 0) return; //Projectiles can handle their own effects

	if (Instigator.FiringMode == 0 || Instigator.FiringMode == 3)
	{
		EffectLocation = UTWeapon(PawnWeapon).GetEffectLocation();
		SpawnBeam(EffectLocation, HitLocation, true);

		if (!WorldInfo.bDropDetail && Instigator.Controller != None && ImpactLightClass != None)
		{
			UDKEmitterPool(WorldInfo.MyEmitterPool).SpawnExplosionLight(ImpactLightClass, HitLocation);
		}
	}
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{

	Super.ThirdPersonFireEffects(HitLocation);
	
	
	
	if(Instigator.Controller != none && (Instigator.Weapon == none || Instigator.Weapon.WeaponFireTypes[Instigator.FiringMode] != 0)) return; //Projectiles can handle their own effects


	if ((Instigator.FiringMode == 0 || Instigator.FiringMode == 3))
	{
		SpawnBeam(GetEffectLocation(), HitLocation, false);
	}
}

DefaultProperties
{
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'RX_WP_TacticalRifle.Mesh.SK_WP_TacticalRifle_3P'
		//Translation=(Y=2,Z=-2)
		//Rotation=(Pitch=-1,Yaw=1000)
		Scale=1.0
	End Object

	DefaultImpactEffect=(ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Stone',Sound=SoundCue'RX_SoundEffects.Bullet_Impact.SC_BulletImpact_Stone')

    ImpactEffects(0)=(MaterialType=Dirt, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Dirt',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Dirt')
    ImpactEffects(1)=(MaterialType=Stone, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Stone',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Stone')
	ImpactEffects(2)=(MaterialType=Concrete, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Stone',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Stone')
    ImpactEffects(3)=(MaterialType=Metal, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Metal',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Metal')
    ImpactEffects(4)=(MaterialType=Glass, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Glass',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Glass')
    ImpactEffects(5)=(MaterialType=Wood, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Wood',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Wood')
    ImpactEffects(6)=(MaterialType=Water, ParticleTemplate=ParticleSystem'RX_FX_Munitions.Impact_Bullet.P_Incendiary_Impact_Water',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Water')
    ImpactEffects(7)=(MaterialType=Liquid, ParticleTemplate=ParticleSystem'RX_FX_Munitions.Impact_Bullet.P_Incendiary_Impact_Water',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Water')
	ImpactEffects(8)=(MaterialType=Flesh, ParticleTemplate=ParticleSystem'RX_FX_Munitions.Impact_Bullet.P_Incendiary_Impact_Flesh',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Flesh')
	ImpactEffects(9)=(MaterialType=TiberiumGround, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_TibGround_Green',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Dirt')
	ImpactEffects(10)=(MaterialType=TiberiumCrystal, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_TibCrystal_Green',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Glass')
	ImpactEffects(11)=(MaterialType=TiberiumGroundBlue, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_TibGround_Blue',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Dirt')
	ImpactEffects(12)=(MaterialType=TiberiumCrystalBlue, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_TibCrystal_Blue',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Glass')
	ImpactEffects(13)=(MaterialType=Mud, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Mud',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Water')
	ImpactEffects(14)=(MaterialType=WhiteSand, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_WhiteSand',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Dirt')
	ImpactEffects(15)=(MaterialType=YellowSand, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_YellowSand',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Dirt')
	ImpactEffects(16)=(MaterialType=Grass, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Grass',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Dirt')
	ImpactEffects(17)=(MaterialType=YellowStone, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_YellowSand',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Stone')
	ImpactEffects(18)=(MaterialType=Snow, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Snow',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Dirt')
	ImpactEffects(19)=(MaterialType=SnowStone, ParticleTemplate=ParticleSystem'RX_FX_Munitions2.Particles.bullets.P_Bullet_Incendiary_Snow',Sound=SoundCue'RX_WP_TacticalRifle.Sounds.Impact.SC_BulletImpact_Stone')
	
	BulletWhip=SoundCue'RX_SoundEffects.Bullet_WhizBy.SC_Bullet_WhizBy'
	BeamTemplate=ParticleSystem'RX_FX_Munitions.Beams.P_InstantHit_Tracer_Heavy'

	WeaponClass = class'Rx_Weapon_TacticalRifle'
	MuzzleFlashSocket=MuzzleFlashSocket
	MuzzleFlashPSCTemplate=ParticleSystem'RX_WP_TacticalRifle.Effects.P_MuzzleFlash_3P'
	MuzzleFlashLightClass=class'Rx_Light_AutoRifle_MuzzleFlash'
	MuzzleFlashDuration=0.1
	
	ShellEjectPSCTemplate=ParticleSystem'RX_WP_AutoRifle.Effects.P_ShellCasing'
	ShellEjectDuration = 1.0
	ShellEjectSocket = ShellEjectSocket
	
	AimProfileName = TacticalRifle //AutoRifle
	WeaponAnimSet = AnimSet'RX_CH_Animations.Anims.AS_WeapProfile_AutoRifle'
}
