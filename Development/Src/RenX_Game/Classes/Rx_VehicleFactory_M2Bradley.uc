/*********************************************************
*
* File: Rx_VehicleFactory_M2Bradley.uc
* Author: RenegadeX-Team
* Pojekt: Renegade-X UDK <www.renegade-x.com>
*
* Desc:
*
*
* ConfigFile:
*
*********************************************************
*
*********************************************************/
class Rx_VehicleFactory_M2Bradley extends UTVehicleFactory;

DefaultProperties
{
	Begin Object Name=SVehicleMesh
		SkeletalMesh=SkeletalMesh'RX_VH_M2Bradley.Mesh.SK_VH_M2Bradley'
		Translation=(X=-40.0,Y=0.0,Z=-70.0)
	End Object

	Components.Remove(Sprite)

	Begin Object Name=CollisionCylinder
		CollisionHeight=+120.0
		CollisionRadius=+200.0
		Translation=(X=0.0,Y=0.0,Z=-40.0)
	End Object

	VehicleClassPath="RenX_Game.Rx_Vehicle_M2Bradley"
	DrawScale=1.0
}
