//
//  *************************************************
//  *         Canon de 36 livres modèle 1780        *
//  *              DONNEES DE REFERENCE             *
//  *************************************************
//
// DE36_REFTUBE_V1.scad
//
// Michel RIVIERE 2018 04 08
// V1

//  *************************************************
//  *         RELEVE A PLAT SUR PLAN MARITZ X2      *
//  *************************************************
include <bezier_curve.scad>;
include <bezier_smooth.scad>;

C36_Fn_MAX= 180;  // à augmenter pour génération des stl
C36_Fn_MIN = 30; // pour parties non visibles après assemblage

C36_Coefficient24 = 49.2299; //Correction pour revenir à un plan au 1/24e
C36_EchelleDeRestitution = 48;    /* impression au 1/48e*/
C36_EchelleDeCote = 24; 
C36_Echelle1 = C36_EchelleDeRestitution/C36_EchelleDeCote ;
C36_Echelle = C36_Echelle1 *C36_Coefficient24;
C36_Rescale = 1/C36_Echelle;


C36_OFFSETX=3040;
C36AME_DIA = 180*C36_Rescale;
offsetx=-C36_OFFSETX*C36_Rescale;    

//  *************************************************
//  *         DIMENSIONS DU TOURILLON               *
//  *         RELEVEES SUR PLAN BOUDRIOT 1/24       *
//  *************************************************
C36TOURILLON_DIA = 9/1.414/C36_Echelle1;
C36TOURILLON_LAR = 49/1.414/C36_Echelle1;
FLA_BL2_HAU = 4.9/C36_Echelle1; 

path_pts = [
[0,0],
[0,2],
[3,20],
[5,30],
[10,48],
[20,80],
[40,132],
[60,160],
[80,175],
[100,187],
[140,196],
[150,196],
[160,196],
[181,194],
[190,191],
[200,187],
[230,168],
[236,164],
[250,156],
[275,146],
[300,141],
[320,140],
[340,143],
[362,150],
[375,155],
[390,164],
[400,174],
[410,186],
[420,200],
[425,202],
[426,202],
[428,202],
[430,203],
[431,204],
[432,206],
[432,208],
[432,250],
[434,267],
[439,282],
[446,300],
[450,310],
[470,340],
[490,360],
[520,390],
[550,420],
[570,443],
[580,463],
[590,490],
[600,540],
[601,590],
[605,605],
[610,610],
[620,611],
[620,611],
[620,615],
[625,615],
[640,615],
[660,614],
[700,613],
[735,612],
[746,610],
[749,608],
[751,607],
[758,600],
[762,590],
[766,586],
[774,583],
[780,582],
[790,581],
[800,580],
[1000,577],
[1220,576],
[1225,577],
[1230,578],
[1239,584],
[1242,587],
[1250,591],
[1258,592],
[1265,591],
[1271,588],
[1275,584],
[1280,580],
[1290,572],
[1300,570],
[1350,568],
[1610,560],
[2120,550],
[2520,540],
[2521,549],
[2521,549],
[2528,549],
[2530,549],
[2640,546],
[2641,539],
[2647,538],
[2655,538],
[2660,537],
[2780,530],
[2860,527],
[2900,526],
[3210,500],
[3540,486],
[3550,486],
[3560,480],
[3570,470],
[3590,465],
[3620,462],
[3690,460],
[4030,450],
[4600,422],
[5000,400],
[5650,361],
[5651,363],
[5655,365],
[5670,366],
[5678,378],
[5681,382],
[5690,388],
[5700,388],
[5705,385],
[5710,378],
[5714,370],
[5718,366],
[5720,365],
[5730,364],
[5734,361],
[5762,360],
[5770,359],
[5775,359],
[5810,358],
[5860,358],
[5885,359],
[5950,364],
[6050,380],
[6134,400],
[6200,420],
[6280,450],
[6310,461],
[6320,465],
[6332,470],
[6335,470],
[6340,470],
[6355,466],
[6362,460],
[6378,441],
[6385,428],
[6392,416],
[6410,380],
[6415,373],
[6420,370],
[6425,364],
[6440,360],
[6440,360],
[6440,180],
[1140,180],
[1140,0],
[0,0],
];    

// REFERENCE POUR GRAVURE TOURILLONS
//
C36_MarquageDroit = "RV";
font = "DejaVu Serif:style=Condensed Bold";
sizefont = 2.2/C36_Echelle1;
proffont = 0.8/C36_Echelle1;   
C36_MD_OFFSETX = 2.3/C36_Echelle1;
C36_MD_OFFSETZ = 1.2/C36_Echelle1;

C36_MarquageGauche = "LR";
C36_MG_OFFSETX = -2.1/C36_Echelle1;
C36_MG_OFFSETZ = 1.2/C36_Echelle1;

// REFERENCE POUR GRAVURE CULASSE
//
/**
[620,611],
[620,611],
[620,615],
[625,615],
[640,615],
[660,614],
[700,613],
[735,612],
[746,610],
[749,608],*/

C36_GC_DIAEXT = 622*2/C36_Echelle;
proffont2 = 0.8/C36_Echelle1;  
sizefont2 = 1.6/C36_Echelle1;

C36_GC_DIAINT = C36_GC_DIAEXT - proffont2;
C36_MarquageCulasse = "1769-7450-8";

C36_GC_OFFSETX = (C36_OFFSETX-640)/C36_Echelle;



module C36_EstampageCulasse(){
intersection(){
translate([-C36_GC_OFFSETX,3.8,0])
rotate([0,0,-90])    
linear_extrude(height = C36_GC_DIAEXT)
    text(text=C36_MarquageCulasse , font = font, size = sizefont2);
 
 difference (){
    translate ([-C36_GC_OFFSETX,0,C36AME_DIA/2])
    rotate ([0,90,0])
    cylinder (h=sizefont2,d1=C36_GC_DIAEXT,d2=C36_GC_DIAEXT,$fn=C36_Fn_MAX);

    translate ([-C36_GC_OFFSETX,0,C36AME_DIA/2])
    rotate ([0,90,0])
    cylinder (h=sizefont2,d1=C36_GC_DIAINT,d2=C36_GC_DIAINT,$fn=C36_Fn_MAX);
    }
 }
 }
 
/*render()
 color("red")
 translate([-1.2,0,0])
 C36_EstampageCulasse();
*/
//
// REFERENCE POUR LA PLATINE DE LUMIERE
// 
C36_LUM_LON = 5.0/C36_Echelle1;
C36_LUM_LAR = 2.2/C36_Echelle1;
C36_LUM_OFFSETZ = 594/C36_Echelle;
C36_LUM_OFFSETX = (C36_OFFSETX-755)/C36_Echelle;

//
// REFERENCE POUR LA LUMIERE (SILLON)
// 
C36_LUMS_LON = 5.0/C36_Echelle1;
C36_LUMS_LAR = 0.4/C36_Echelle1;
C36_LUMS_HAU = 0.5/C36_Echelle1; 
C36_LUMS_DIA = 0.8/C36_Echelle1; 
C36_LUM_OFFSETZ = 594/C36_Echelle;
C36_LUM_OFFSETX = (C36_OFFSETX-755)/C36_Echelle;

module lumiere() {
//
// creation un outil d'estampage de la lumiere
//
    
translate([-C36_LUM_OFFSETX,-C36_LUMS_LAR/2,C36AME_DIA/2+C36_LUM_OFFSETZ-C36_LUMS_HAU])
cube([C36_LUMS_LON,C36_LUMS_LAR,C36_LUMS_HAU]);


translate([-C36_LUM_OFFSETX+C36_LUMS_LON+C36_LUMS_DIA/2,0,C36AME_DIA/2+C36_LUM_OFFSETZ-C36_LUMS_HAU*4])
rotate([0,-15,0])
cylinder(h=C36_LUMS_HAU*5,d1=C36_LUMS_DIA,d2=C36_LUMS_DIA,$fn=C36_Fn_MAX); 
}


module DE36_modele1766(){
// round_d = 5;
// smoothed_path_pts = bezier_smooth(path_pts,round_d, closed = true);  
 
difference(){    
    
// Tournage du canon
//
color("grey")  
translate([offsetx,0,C36AME_DIA/2])
rotate([0,-90,0])
scale([C36_Rescale,C36_Rescale,C36_Rescale]) 
#rotate_extrude($fn=C36_Fn_MAX) 
//translate([1,0 ])     //la courbe de bezier peut pousser vers un x<0 !
rotate([0,0,-90])
//polygon(smoothed_path_pts);
polygon(path_pts);

// Gravure de la culasse
//
//C36_EstampageCulasse();
}
C36_EstampageCulasse();
// Positionnement de la platine de lumière
//
difference(){
union(){
translate([-C36_LUM_OFFSETX,-C36_LUM_LAR/2,C36AME_DIA/2])
cube([C36_LUM_LON,C36_LUM_LAR,C36_LUM_OFFSETZ]);

translate([-C36_LUM_OFFSETX+C36_LUM_LON,0,C36AME_DIA/2])
cylinder(h=C36_LUM_OFFSETZ,d1=C36_LUM_LAR,d2=C36_LUM_LAR,$fn=C36_Fn_MAX);
}
lumiere(); 
}
difference (){
// TOURILLONS (en un seul bloc)
//
translate([0,C36TOURILLON_LAR/2,0])
rotate([90,0,0])    
cylinder(h=C36TOURILLON_LAR,d1=C36TOURILLON_DIA,d2=C36TOURILLON_DIA,$fn=C36_Fn_MAX);    

// Gravure du tourillon, coté droit (marque de l'atelier)
//
translate([-C36_MD_OFFSETX,-C36TOURILLON_LAR/2+proffont,-C36_MD_OFFSETZ])
color("white")
rotate([90,0,0])    
linear_extrude(height = proffont)text(text=C36_MarquageDroit , font = font, size = sizefont);

// Gravure du tourillon, coté gauche (marque du fondeur)
//
translate([-C36_MG_OFFSETX,C36TOURILLON_LAR/2-proffont,-C36_MG_OFFSETZ])
color("white")
rotate([90,0,180])    
linear_extrude(height = proffont)text(text=C36_MarquageGauche , font = font, size = sizefont);


}
}   


//Demo 
DE36_modele1766();


