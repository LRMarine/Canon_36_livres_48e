//
//  **************************************************************
//  * Roulette d'affut pour canon de 36 livres modèle 1780   *
//  **************************************************************
//
// DE36_ROU_V1.scad
//
// Michel RIVIERE 2018 03 15
// V1

include <DE36_REF_V1.scad>;

module ROU(PR3D_Flag=0){

//  Calculs des marges d'assemblage pour le percement de la roulette
//  Diamètre de l'axe intérieur de la roulette légèrement plus grand que l'axe de l'essieu  
//  Sur une impression à support à cire perdue, on peut positionner les roues dès l'impression  
//  Pour impression3D, utilisation des caractéristiques d'impression
//  Pour 3D rendering visuel 1% de marge
//

function ROU_MargeDiametreAxe(PR3D_Flag)=
PR3D_Flag ==1 
    ? MinClearance*2 //Ecartement de pièces si elles sont séparées à l'impression
    : ROU_INT_DIA*0.01;    //marge pour le visuel

translate([0,-ROU_LAR/2,0])
rotate(a=[90,0,0])
difference () {
    union (){

// ROU generation de la roulette
//
        cylinder (h=ROU_LAR,d1=ROU_EXT_DIA,d2=ROU_EXT_DIA,center = true,$fn=Fn_sphere);
        translate(v=[0,0,ROU_LAR/2])
        cylinder (h=ROUMUS_LAR,d1=ROU_EXT_DIA,d2=ROUMUS_DIA,center = true,$fn=Fn_sphere);
        translate(v=[0,0,ROU_LAR/2+ROUMUS_Bord*2])
        cylinder (h=ROUMUS_Bord,d1=ROUMUS_DIA,d2=ROUMUS_DIA,center = true,$fn=Fn_sphere);
        }
       
// Percement de l'axe
//
    cylinder (h=ROU_LAR + ROUMUS_LAR*2 + ROUMUS_Bord*2,
        d1=ROU_INT_DIA+ROU_MargeDiametreAxe(PR3D_Flag),
        d2=ROU_INT_DIA+ROU_MargeDiametreAxe(PR3D_Flag),
        center = true,$fn=Fn_sphere);}      
}
/*Demo*/
ROU(1);
