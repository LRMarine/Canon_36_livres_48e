//
//  *********************************************************************
//  * Esse (goupille) de Roulette pour Canon de 36 livres modèle 1780   *
//  *********************************************************************
//
// DE36_ESS_V1.scad
//
// Michel RIVIERE 2018 03 16
// V1 - formes simples
// V2 - basé sur SDK de Justin Lin (dotscad)

// vérifier que la variable OPENSCADPATH contient le SDK
// panneau de configuration/Systèmes/Paramètres Avancés/Variables Environnement/User variables
//


include <DE36_REF_V1.scad>;



module ESS (PR3D_Flag=0){


$fn=Fn_sphere;

translate([0,0,EAV_AXE_DIA/2+ESS_TIG_Offset])
color("grey")
union(){
    
    // 1er segment (base verticale)
    //
    translate([0,0,0])
    linear_extrude(height = ESS_SE1_Z,scale=[ReductionSE1,ReductionSE1])
    offset(r=ESS_SE1_RoundingOffset)
    polygon(points=[
        [-ESS_SE1_X/2+ESS_SE1_RoundingOffset,0],
        [0,-ESS_SE1_Y/2+ESS_SE1_RoundingOffset],
        [ESS_SE1_X/2-ESS_SE1_RoundingOffset,0],
        [0,ESS_SE1_Y/2-ESS_SE1_RoundingOffset]]);
     
    // 1ere jointure entre SEG1 et SEG2
    //

    translate([-ESS_SE2_X/2,0,ESS_SE1_Z])      
    rotate([0,90,0])
    rotate_extrude()
    rotate([0,0,-90])
    translate([-ESS_SE2_X/2,0])
    difference(){
        offset(r=ESS_SE2_RoundingOffset)
        polygon(points=[
            [(-ESS_SE2_X/2+ESS_SE2_RoundingOffset),0],
            [0,(-ESS_SE2_Y/2+ESS_SE2_RoundingOffset)],
            [(ESS_SE2_X/2-ESS_SE2_RoundingOffset),0],
            [0,(ESS_SE2_Y/2-ESS_SE2_RoundingOffset)]]);
        translate([-ESS_SE2_X/2,0])
        square([ESS_SE2_X,ESS_SE2_Y]);}
    
    // 2eme segment (base horizontale)
    //
        
    translate([0,0,ESS_SE1_Z])
    rotate([80])
    linear_extrude(height = ESS_SE2_Z,scale=[ReductionSE2,ReductionSE2])
    offset(r=ESS_SE2_RoundingOffset)
    polygon(points=[
        [(-ESS_SE2_X/2+ESS_SE2_RoundingOffset),0],
        [0,(-ESS_SE2_Y/2+ESS_SE2_RoundingOffset)],
        [(ESS_SE2_X/2-ESS_SE2_RoundingOffset),0],
        [0,(ESS_SE2_Y/2-ESS_SE2_RoundingOffset)]]);
   
    // 3eme segment (terminaison de la queue)
    //
    translate([-ESS_SE3_X/2,-ESS_SE2_Z*cos(10),ESS_SE1_Z+ESS_SE2_Z*sin(10)])      
    rotate([0,90,])
    rotate_extrude()
    rotate([0,0,-90])
    translate([-ESS_SE3_X/2,0])
    difference(){
        offset(r=ESS_SE3_RoundingOffset)
        polygon(points=[
            [(-ESS_SE3_X/2+ESS_SE3_RoundingOffset),0],
            [0,(-ESS_SE3_Y/2+ESS_SE3_RoundingOffset)],
            [(ESS_SE3_X/2-ESS_SE3_RoundingOffset),0],
            [0,(ESS_SE3_Y/2-ESS_SE3_RoundingOffset)]]);
        translate([-ESS_SE3_X/2,0])
    square([ESS_SE3_X,ESS_SE3_Y]);
    }

    //  tige
    //
    rotate([180,0,0])
    cylinder(h=ESS_TIG_LON,d1=ESS_TIG_DIA,d2=ESS_TIG_DIA);
    translate([0,0,-ESS_TIG_LON])
    sphere(d=ESS_TIG_DIA);
}
}

/*demo*/
ESS(1);