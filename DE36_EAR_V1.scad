
//
//  *************************************************
//  * Essieu Arriere Canon de 36 livres modèle 1780 *
//  *************************************************
//
// DE36_EAR_V1.scad
//
// Michel RIVIERE 2018 03 13
// V1

include <DE36_REF_V1.scad>;


module EAR(PR3D_Flag=0){

//  EAR_PCC Essieu arriere, donnée de l'encoche de la semelle
// 
    
//  Calculs des marges d'assemblage pour l'encoche de la semelle    
//  Pour impression3D, utilisation des caractéristiques d'impression
//  Pour 3D rendering visuel 1% de marge
//

function ENC_EAR_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)=
PR3D_Flag ==1 
    ? (SOL_BAS_GrandeLargeur + MinEngravedDetail) 
    : (SOL_BAS_GrandeLargeur*1.02);

function ENC_EAR_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)=
PR3D_Flag ==1 
    ? (SOL_BAS_PetiteLargeur + MinEngravedDetail) 
    : (SOL_BAS_PetiteLargeur*1.02);
  
EncocheSolePoints= [
[-ENC_EAR_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,0],        // 0 
[ENC_EAR_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,0],         // 1 
[ENC_EAR_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,0],                    // 2 
[-ENC_EAR_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,0],                   // 3 
[-ENC_EAR_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,SOL_HAU],  // 4 
[ENC_EAR_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,SOL_HAU],   // 5 
[ENC_EAR_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,SOL_HAU],              // 6 
[-ENC_EAR_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,SOL_HAU]];            // 7 

EncocheSoleFaces= [
[0,1,2,3],    // bottom
[4,5,1,0],    // front
[7,6,5,4],    // top
[5,6,2,1],    // right
[6,7,3,2],    // back
[7,4,0,3]];   // left

render () 
rotate([0,0,-90])
difference(){  

    union(){
    //  EAR_PCC Essieu arriere, partie centrale carrée
    //  
        cube(size=[EAR_PCC_LON,EAR_PCC_LAR,EAR_PCC_HAU],center=true);
        
    //  EAR_PCC Essieu arriere, moyeux (des deux cotés)
    //  
        rotate(a=[0,90,0])
        cylinder (h=2*EAR_AXE_LON + EAR_PCC_LON,d1= EAR_AXE_DIA,d2=EAR_AXE_DIA,center=true,$fn=Fn_sphere);
        
    //  EAR_PCC Essieu arriere, generation museau G
    //    
        translate(v=[EAR_PCC_LON/2+EAR_AXE_LON,0,0])
        rotate(a=[0,90,0])
        cylinder (h=EAR_AXEMUS_LON,d1=EAR_AXE_DIA,d2=EAR_AXEMUS_DIA,$fn=Fn_sphere);
        
    //  EAR_PCC Essieu arriere, generation museau D
    // 
        translate(v=[-EAR_PCC_LON/2-EAR_AXE_LON,0,0])
        rotate(a=[0,-90,0])
        cylinder (h=EAR_AXEMUS_LON,d1=EAR_AXE_DIA,d2=EAR_AXEMUS_DIA,$fn=Fn_sphere);
     
    //  EAR_PCC Essieu arriere, generation bord museau G
    // 
        translate(v=[EAR_PCC_LON/2+EAR_AXE_LON+EAR_AXEMUS_LON,0,0])
        rotate(a=[0,90,0])
        cylinder (h=EAR_AXEMUS_Bord,d1=EAR_AXEMUS_DIA,d2=EAR_AXEMUS_DIA,$fn=Fn_sphere);
        
    //  EAR_PCC Essieu arriere, generation bord museau D
    // 
        translate(v=[-EAR_PCC_LON/2-EAR_AXE_LON-EAR_AXEMUS_LON-EAR_AXEMUS_Bord,0,0])
        rotate(a=[0,90,0])
        cylinder (h=EAR_AXEMUS_Bord,d1=EAR_AXEMUS_DIA,d2=EAR_AXEMUS_DIA,$fn=Fn_sphere);}
 
    translate([0,-SOL_OFFSETX+EAR_OFFSETX,EAR_PCC_HAU/2-SOL_HAU])
    polyhedron( EncocheSolePoints, EncocheSoleFaces );
}
}
/*Demo*/
//EAR(0);






