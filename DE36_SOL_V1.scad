
//
//  **************************************************************
//  * Sole(Semelle) du Chassis  Canon de 36 livres modèle 1780   *
//  **************************************************************
//
// DE36_SOL_V1.scad
//
// Michel RIVIERE 2018 03 14
// V1

include <DE36_REF_V1.scad>;


module SOL(PR3D_Flag=0){

//  SOL_BAS donnée de la base de la sole (parallépipède)
//

BaseSolePoints= [
[-SOL_BAS_LON,-SOL_BAS_GrandeLargeur/2,0],        // 0 
[-SOL_BAS_LON,SOL_BAS_GrandeLargeur/2,0],         // 1 
[0,SOL_BAS_PetiteLargeur/2,0],                    // 2 
[0,-SOL_BAS_PetiteLargeur/2,0],                   // 3 
[-SOL_BAS_LON,-SOL_BAS_GrandeLargeur/2,SOL_HAU],  // 4 
[-SOL_BAS_LON,SOL_BAS_GrandeLargeur/2,SOL_HAU],   // 5 
[0,SOL_BAS_PetiteLargeur/2,SOL_HAU],              // 6 
[0,-SOL_BAS_PetiteLargeur/2,SOL_HAU]];            // 7 

BaseSoleFaces= [
[0,1,2,3],    // bottom
[4,5,1,0],    // front
[7,6,5,4],    // top
[5,6,2,1],    // right
[6,7,3,2],    // back
[7,4,0,3]];   // left
    
    

render() //mode rendering est necessaire pour éviter la visu d'un mesh du disque complet
union () {
// SOL_BAS Generation de la base de la Sole
//
    polyhedron( BaseSolePoints, BaseSoleFaces );
 
// SOL_ARC Generation de l'arc de queue de la Sole : disque tronqué par un cube
//
    difference(){
        translate(v=[-SOL_BAS_LON+SOL_ARC_Rayon-SOL_ARC_Pied,0,0])
        cylinder(h=SOL_HAU,r1=SOL_ARC_Rayon,r2=SOL_ARC_Rayon,$fn=Fn_sphere);
        
        translate(v=[-SOL_BAS_LON+SOL_ARC_Rayon,0,SOL_HAU/2])
        cube([2*SOL_ARC_Rayon,2*SOL_ARC_Rayon,SOL_HAU],center=true);
}
}
}
/*Demo*/
SOL(1);