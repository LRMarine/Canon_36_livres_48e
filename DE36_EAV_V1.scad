
//
//  *************************************************
//  * Essieu Avant Canon de 36 livres modèle 1780   *
//  *************************************************
//
// DE36_EAV_V1.scad
//
// Michel RIVIERE 2018 03 13
// V1

include <DE36_REF_V1.scad>;


module EAV(PR3D_Flag=0){

//  EAV_PCC Essieu arriere, donnée de l'encoche de la semelle
// 
    
//  Calculs des marges d'assemblage pour l'encoche de la semelle    
//  Pour impression3D, utilisation des caractéristiques d'impression
//  Pour 3D rendering visuel 1% de marge
//

function ENC_EAV_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)=
PR3D_Flag ==1 
    ? (SOL_BAS_GrandeLargeur + MinEngravedDetail) 
    : (SOL_BAS_GrandeLargeur*1.02);

function ENC_EAV_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)=
PR3D_Flag ==1 
    ? (SOL_BAS_PetiteLargeur + MinEngravedDetail) 
    : (SOL_BAS_PetiteLargeur*1.02);
    
function ENC_EAV_MargeHauteur(PR3D_Flag)=
PR3D_Flag ==1 
    ? MinEngravedDetail //Elargissement pour positionnement de pièces si elles sont séparées à l'impression
    : 0;    //pas de marge pour le visuel
    
  
EncocheSolePoints= [
[-ENC_EAV_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,0],        // 0 
[ENC_EAV_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,0],         // 1 
[ENC_EAV_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,0],                    // 2 
[-ENC_EAV_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,0],                   // 3 
[-ENC_EAV_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,SOL_HAU+ENC_EAV_MargeHauteur(PR3D_Flag)],  // 4 
[ENC_EAV_GrandeLargeur(SOL_BAS_GrandeLargeur,PR3D_Flag)/2,-SOL_BAS_LON,SOL_HAU+ENC_EAV_MargeHauteur(PR3D_Flag)],   // 5 
[ENC_EAV_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,SOL_HAU+ENC_EAV_MargeHauteur(PR3D_Flag)],              // 6 
[-ENC_EAV_PetiteLargeur(SOL_BAS_PetiteLargeur,PR3D_Flag)/2,0,SOL_HAU+ENC_EAV_MargeHauteur(PR3D_Flag)]];            // 7 

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
    //  EAV_PCC Essieu arriere, partie centrale carrée
    //  
        cube(size=[EAV_PCC_LON,EAV_PCC_LAR,EAV_PCC_HAU],center=true);
        
    //  EAV_PCC Essieu arriere, moyeux (des deux cotés)
    //  
        rotate(a=[0,90,0])
        cylinder (h=2*EAV_AXE_LON + EAV_PCC_LON,d1= EAV_AXE_DIA,d2=EAV_AXE_DIA,center=true,$fn=Fn_sphere);
        
    //  EAV_PCC Essieu arriere, generation museau G
    //    
        translate(v=[EAV_PCC_LON/2+EAV_AXE_LON,0,0])
        rotate(a=[0,90,0])
        cylinder (h=EAV_AXEMUS_LON,d1=EAV_AXE_DIA,d2=EAV_AXEMUS_DIA,$fn=Fn_sphere);
        
    //  EAV_PCC Essieu arriere, generation museau D
    // 
        translate(v=[-EAV_PCC_LON/2-EAV_AXE_LON,0,0])
        rotate(a=[0,-90,0])
        cylinder (h=EAV_AXEMUS_LON,d1=EAV_AXE_DIA,d2=EAV_AXEMUS_DIA,$fn=Fn_sphere);
     
    //  EAV_PCC Essieu arriere, generation bord museau G
    // 
        translate(v=[EAV_PCC_LON/2+EAV_AXE_LON+EAV_AXEMUS_LON,0,0])
        rotate(a=[0,90,0])
        cylinder (h=EAV_AXEMUS_Bord,d1=EAV_AXEMUS_DIA,d2=EAV_AXEMUS_DIA,$fn=Fn_sphere);
        
    //  EAV_PCC Essieu arriere, generation bord museau D
    // 
        translate(v=[-EAV_PCC_LON/2-EAV_AXE_LON-EAV_AXEMUS_LON-EAV_AXEMUS_Bord,0,0])
        rotate(a=[0,90,0])
        cylinder (h=EAV_AXEMUS_Bord,d1=EAV_AXEMUS_DIA,d2=EAV_AXEMUS_DIA,$fn=Fn_sphere);
        }
 
    // Creusement de l'encoche pour la sole
    // C'est un polyhedre compte-tenu de la forme non parallélépipédique de la base de sole    
        
    translate([0,-SOL_OFFSETX+EAV_OFFSETX,EAV_PCC_HAU/2-SOL_HAU+EAR_OFFSETZ-EAV_OFFSETZ])
    polyhedron( EncocheSolePoints, EncocheSoleFaces );
}
}
/*Demo*/
EAV(1);






