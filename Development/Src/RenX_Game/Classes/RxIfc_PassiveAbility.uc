interface RxIfc_PassiveAbility; //Interface for anything capable of using passive abilities

simulated function bool ActivateJumpAbility(bool Toggle) ; //(Usually Tied to 'SpaceBar') Returns if the ability was successfully activated 

simulated function bool ActivateAbility0(bool Toggle); // (Usually tied to 'X')Returns if the ability was successfully activated 

simulated function bool ActivateAbility1(bool Toggle); //(Usually Tied to 'G') Returns if the ability was successfully activated 