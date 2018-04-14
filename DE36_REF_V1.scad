
//
//  *************************************************
//  *         Canon de 36 livres modèle 1780        *
//  *              DONNEES DE REFERENCE             *
//  *************************************************
//
// DE36_REF_V1.scad
//
// Michel RIVIERE 2018 03 13
// V1

//  *************************************************
//  *         DONNEES TRANSVERSES                   *
//  *************************************************
// echelle de la prise de cote = 1/24 sauf exceptions
// source le vaisseau de 74 canons, T2 p162

EchelleDeRestitution = 48;    /* impression au 1/48e*/
EchelleDeCote = 24; 
Echelle = EchelleDeRestitution/EchelleDeCote;
Fn_sphere=90;  // à augmenter pour génération des stl
Fn_spheremin = 30; // pour parties non visibles après assemblage
PR3D_Flag = 1; // 0=screen rendering only ou 1=3D printing

//  *************************************************
//  *         DONNEES D'IMPRESSION 3D               *
//  *************************************************
//  Référence Shapeways 
//  Frosted Extreme Details
//  Données directes en mm
//
MinSupportedWallThickness = 0.3;
MinUnsupportedWallThickness = 0.6;
MinSupportedWire = 0.6;
MinUnsupportedWire = 0.8;
MinEmbossedDetail = 0.1;
MinEngravedDetail = 0.1;
MinEscapeWall = 4.0; // trou pour évacuation du support en cire à la fonte
MinClearance = 0.05; //espace entre deux pièces ne se touchant pas


//  *************************************************
//  *         FRO - FRONT                           *
//  *************************************************

//  FRO_TOU - Tourillon de positionnement sur les flasques

FRO_TOU_DIA = 3.1/Echelle;            // diametre du tourillon. Son logement est margé sur FLA
FRO_TOU_OFFSETZ = 8.8/Echelle + FRO_TOU_DIA/2;
FRO_TOU_OFFSETY = 0.8/ Echelle;                 //dépassement du Tourillon (plot d'assemblage)
FRO_HAU = 15.4/ Echelle;                        // 15.4 au droit 
FRO_DEMILON = (22.3/2)/Echelle;
FRO_LAR = 6.3 / Echelle;
FRO_OFFSETX = 5.9 / Echelle ; // Offset pris au bas du front


// FLA_BL1TOU Trou pour tourillon d'assemblage du front
// 
FLA_BL1TOU_OFFSETX = (8.6/Echelle)+ FRO_TOU_DIA/2; // Position du CENTRE du tourillon


// Angle d'inclinaison du Front
//
FRO_AngleTang = ((7.6/Echelle)-FRO_OFFSETX)/FRO_HAU;


//  *************************************************
//  *         FLA - FLASQUE                         *
//  *************************************************

//  FLA regroupe les données communes aux flasques gauche (FLG) et droit (FLD)
//  pour les parties basses (blocs 0 et 1) et hautes (blocs 2,3,4)

FLA_LAR = 6.3/Echelle; // Epaisseur des flasques
FLA_Chanfreins = 0.2/Echelle ; // Profondeur des Chanfreins (aux grandes Echelles)

//  Eléments de détermination de l'angle du Flasque : 
//  Ecarts entre flasques (cotés internes) à l'origine et au bout / longueur 0 = Tang

FLA_AnglePTL = 20.8/Echelle;
FLA_AngleTang = ((27.0 - 20.8)/2)/ 73.0 ;
FLA_Angle = atan(FLA_AngleTang);
//echo (FLA_Angle));

//  FLA_BLx Blocs de Base
//

//  FLA_BL0 Bloc 0 : le plus bas
//
FLA_BL0_LON = 73.0/Echelle;  
FLA_BL0_HAU = 9.8/Echelle;  

//  FLA_BL0 Bloc 1 : données hors adents
//
FLA_BL1_LON = 62.2/Echelle;  
FLA_BL1_HAU = 4.9/Echelle;  

//  FLA_BL0 Bloc 2 : données yc adents
//
FLA_BL2_LON = 54.9/Echelle;  
FLA_BL2_HAU = 4.9/Echelle; 
FLA_BL2ADE_HAU = 1.4/Echelle;     // Hauteur des adents
FLA_BL2ADE_LON = FLA_BL2_LON/3 ;  // longueur des adents
FLA_BL2ADE_LAR = 0.25 / Echelle ; // Profondeur et largeurs de la gorge simulant les adents

//  FLA_BL0 Bloc 3 
//
FLA_BL3_LON = 47.6/Echelle;  
FLA_BL3_HAU = 4.9/Echelle;  

//  FLA_BL0 Bloc 4 
//
FLA_BL4_LON = 41.0/Echelle;  //espace pour arrondi inclus
FLA_BL4_HAU = 4.9/Echelle;    
FLA_BL4ARR_Decrochement  = 0.6/Echelle; //Abaissement de l'arrondi du Flasque Bloc4

FLA_TOC_DIA = 7.0/Echelle;  //Diametre du tourillon du canon
FLA_TOC_OFFSETX = (9.7+FLA_TOC_DIA/2)/Echelle ; //Position du centre du Tourillon
FLA_TOC_OFFSETY = (FLA_TOC_DIA/2)/3; 
// Le logement du tourillon est abaissé d'un tiers du rayon du tourillon

  
// FLA_BL0ARC Cintre du bloc 0
//    
FLA_BL0ARC_LAR = 19.1/Echelle;
FLA_BL0ARC_Pied = 3.2/Echelle;
FLA_BL0ARC_OFFSETX = 32.2/Echelle; // Position du CENTRE de cet arc p/r au bord de reference
// Calcul du Rayon du Cintre ;
FLA_BL0ARC_Rayon = FLA_BL0ARC_Pied/2 + pow(FLA_BL0ARC_LAR,2)*0.125/FLA_BL0ARC_Pied;

// FLA_BL0BAN bandelette de métal du bloc 0
//
FLA_BL0BAN_OFFSETX = 0.6/Echelle; // Mesure depuis le bord de la queue de flasque
   
// FLA_BL0ENT Entretoise du bloc0 (entièrement visible)
//  
FLA_BL0ENT_DIA = 1.4/Echelle; //Diamètre de la tige d'entretoise


//Position du centre de l'entretoise (sur flasque virtuel à Y=0 sans angle)
// MESURE X A CORRIGER -CORRECTION D ANGLE
FLA_BL0ENT_OFFSETX = 40.8/Echelle; 
FLA_BL0ENT_OFFSETZ = 7.9/ Echelle;
 

 
// FLA_BL1BRA Trou de Brague du bloc 1
// le trou de brague est positionné a mi-hauteur du bloc donc pas d'offsetZ à mesurer
// 
FLA_BL1BRA_DIA = 3.6/Echelle; // Diamètre du trou de brague
FLA_BL1BRA_OFFSETX = (25.4+FLA_BL1BRA_DIA/2)/Echelle; // position du CENTRE du trou de brague 


//  *************************************************
//  *         EAR - ESSIEU ARRIERE                  *
//  *************************************************

//  EAR_PCC Essieu arriere, partie centrale carrée
//  
EAR_PCC_LAR = 11.8/Echelle;
EAR_PCC_HAU = 9.0/Echelle;
EAR_PCC_LON = 41.4/Echelle;

//  EAR_AXE Essieu arriere, axe des roulettes

EAR_AXE_DIA = 6.8/Echelle;
EAR_AXE_LON = 10.5/Echelle; /* longueur de la partie circulaire sur un coté hors museau */

// EAR_AXEMUS Museau de l'axe - longueurs en débord de l'axe

EAR_AXEMUS_LON = 1.3/Echelle;
EAR_AXEMUS_DIA = 5.2/Echelle;
EAR_AXEMUS_Bord = 0.35/Echelle;

// EAR - POSITIONNEMENT POUR LES ASSEMBLAGES 
//

EAR_OFFSETZ = 1.2/Echelle;  //Hauteur de l'encoche
EAR_OFFSETX = 53.5/Echelle + EAR_PCC_LAR/2; // Mesure au bord de l'essieu et centrage sur l'axe



//  *************************************************
//  *         EAV - ESSIEU AVANT                   *
//  ************************************************

//  EAV_PCC Essieu avant, partie centrale carrée
//  
EAV_PCC_LAR =  9.0/Echelle;
EAV_PCC_HAU = 11.8/Echelle;
EAV_PCC_LON = 38.9/Echelle;

//  EAV_AXE Essieu avant, axe des roulettes

EAV_AXE_DIA = 6.8/Echelle;
EAV_AXE_LON = 11.0/Echelle; /* longueur de la partie circulaire sur un coté hors museau */

// EAV_AXEMUS Museau de l'axe - longueurs en débord de l'axe

EAV_AXEMUS_LON = 1.3/Echelle;
EAV_AXEMUS_DIA = 5.2/Echelle;
EAV_AXEMUS_Bord = 0.35/Echelle;

// EAV - POSITIONNEMENT POUR LES ASSEMBLAGES 
// 

EAV_OFFSETZ = 2.6/Echelle;  //Hauteur de l'encoche
EAV_OFFSETX = 5.5/Echelle + EAV_PCC_LAR/2; 
// OFFSET X = Position de l'axe de l'essieu P/R au bord de référence


//  *************************************************
//  *         SOL - SOLE (SEMELLE)                  *
//  *************************************************

//  SOL_BAS épaisseur de la sole
//
SOL_HAU = 3.6/Echelle;

//  SOL_BAS polyhedre de base de la semelle
//
SOL_BAS_GrandeLargeur = 12.2/Echelle;
SOL_BAS_PetiteLargeur = 10.2/Echelle;
SOL_BAS_LON = 58.3/Echelle;

//  SOL_BAS polyhedre de base de la semelle
//  Rayon = Pied/2 + Corde^2 /8Pied
//
SOL_ARC_Pied = 1.5/Echelle;
SOL_ARC_Rayon = SOL_ARC_Pied/2 + pow(SOL_BAS_GrandeLargeur,2)*0.125/SOL_ARC_Pied;

// SOL - POSITIONNEMENT POUR LES ASSEMBLAGES 

SOL_OFFSETX = 12.7/Echelle; //offset en axe X depuis le bord (0,0) du flasque


//  **********************************************
//  *         ROU - ROULETTE                     *
//  **********************************************

// ROU - Dimensions de base de la roulette
//
ROU_EXT_DIA = 18.9/Echelle;
ROU_INT_DIA = 7.0/Echelle;
ROU_LAR= 5.7/Echelle;

// ROUMUS - Museau de la roulette
//
ROUMUS_LAR = 0.9/Echelle;
ROUMUS_DIA = 17.5/Echelle;
ROUMUS_Bord = 0.25/Echelle;

// ROU - Largeur Hors Tout
//
ROU_LHT = ROU_LAR + ROUMUS_LAR + ROUMUS_Bord;


//  **************************************************
//  *       ESS - ESSE (Goupille de roulette)        *
//  **************************************************
//
// Nota : prise de cote au 1/12 (2x prise de cote standard)

    
//  ESS_SE1 Esse, Segment1 (base verticale)
//  
    
  
ESS_SE1_RoundingOffset =(0.3/2)/Echelle;    //rayon de l'offset d'arrondi 
ESS_SE1_X = (5.44/2)/Echelle;    // losange intérieur (avant extension par offset)
ESS_SE1_Y = (2.00/2)/Echelle;    // losange intérieur (avant extension par offset)
ESS_SE1_Z = (5.1/2)/Echelle;     // hauteur du segment 1
ESS_SE1_Xt = (3.32/2)/Echelle;   // losange intérieur (avant extension), mesure au sommet

ReductionSE1 = ESS_SE1_Xt/ESS_SE1_X;    //facteur de réduction  du Segment1

//  ESS_SE2 Esse, Segment2 (queue horizontale)
//  

ESS_SE2_RoundingOffset = ESS_SE1_RoundingOffset*ReductionSE1; //rayon de l'offset d'arrondi 
ESS_SE2_X = ESS_SE1_X *ReductionSE1;   // losange intérieur (avant extension par offset)
ESS_SE2_Y= ESS_SE1_Y*ReductionSE1;     // losange intérieur (avant extension par offset)
ESS_SE2_Z = (1.9/2)/Echelle;           // longueur de la queue d'esse

ReductionSE2 = 0.5;                    //facteur de réduction  du Segment2

//  ESS_SE3 Esse, Segment3 (terminaison)
// 
ESS_SE3_RoundingOffset = ESS_SE2_RoundingOffset*ReductionSE2;    
ESS_SE3_X = ESS_SE2_X*ReductionSE2;    
ESS_SE3_Y = ESS_SE2_Y*ReductionSE2;

//  ESS_TIG Esse, Tige
// 
ESS_TIG_DIA=(1.4/2)/Echelle;
ESS_TIG_LON=(19.5/2)/Echelle;
ESS_TIG_Offset=(0.1)/Echelle;

//  **********************************************
//  *       ACCESSOIRES DU FLASQUE               *
//  **********************************************
//
//

// PO1 - Piton à Oeillet n°1 (situé sur la queue de flasque, juste au dessus de la bandelette)
// Assure la liaison entre chaque flasque et l'essieu arrière
//
PO1_DIA_EXT = 4.4/Echelle ;
PO1_DIA_INT = 3.1 / Echelle ;
PO1_TIG_LON = 19.4/Echelle ;
PO1_OFFSETX = FLA_BL0_LON - 7.0/Echelle ;
PO1_OFFSETZ = 0.2/Echelle ;
PO1_Angle1 = atan(4.7/18.3); //Inclinaison pour faire la liaison avec l'essieu EAR
PO1_Angle2 = 60;
PO1_RON_LAR = 0.5/ Echelle ;
PO1_RON_DIA = 3.8/ Echelle ;
PO1_ECR_LAR = 0.8/ Echelle ;

// PO2 - Piton à Oeillet n°2 (positionné horizontalement pour passage de cordage)
//
PO2_DIA_EXT = 5.2/Echelle ;
PO2_DIA_INT = 3.8 / Echelle ;
PO2_TIG_LON = FLA_LAR+(PO2_DIA_EXT-PO2_DIA_INT);
PO2_RON_LAR = 0.3/ Echelle ;
PO2_RON_DIA = 3.8/ Echelle ;
PO2_ECR_LAR = 0.8/ Echelle ;

PO2_OFFSETX = FLA_BL1_LON - 12.9/Echelle ;
PO2_OFFSETZ = 11.8/Echelle;
PO2_Angle1 = 20;

// PO3 - Piton à Oeillet n°3 (positionné horizontalement pour chainette de clef de susbande)
//
PO3_OFFSETZ = 20.3 / Echelle;
PO3_OFFSETX = 4.1 / Echelle;
PO3_DIA_EXT = 2.3 / Echelle;
PO3_DIA_INT = 1.7 / Echelle;
PO3_TIG_LON = FLA_LAR/2;

// CTR - Cheville à Tête Ronde (1 seule)
//
CTR_TET_DIA = 3.2/Echelle;
CTR_TET_HAU = 1.3/Echelle;
CTR_TIG_DIA = 1.2/Echelle;
CTR_OFFSETX = 30.8/Echelle;

// CLC - Clou Tête Carrée
//
CLC_Tete =   2.4/Echelle;
CLC_Epaisseur = 0.4/Echelle;

// COT - Cheville à Oeillet tête triangulaire
//
COT_OFFSETX = 3.72/ Echelle;

// Mesures suivantes prises sur plan au 1/12e (x2)
COT_LAR = (2.9/Echelle)/2;         // Largeur de la tête triangle
COT_TIG_LON = (79.65/Echelle)/2;    // Longueur de la tige
COT_TIG_DIA = (1.8/Echelle)/2;      // Diamètre de la tige
COT_RoundingOffset = 0.1/Echelle;   // offset pour les arrondis d'extrusion
COT_BASE_LON = (6.25/Echelle)/2-COT_RoundingOffset;  // Base du triangle
COT_TOP_LON = (3.34/Echelle)/2-COT_RoundingOffset;   // longueur triangle au sommet
COT_HAU = (7.42/Echelle)/2-COT_RoundingOffset;       // Hauteur du triangle
COT_INT_LAR = (1.6/Echelle)/2;      // Largeur du creusement
COT_INT_HAU = (3.74/Echelle)/2;     // Hauteur du creusement
COT_Angle = 8 ; //8 degré d'inclinaison de la tige au montage



// CTD - Cheville à Tete Diamant sur Bloc 4
//
CTD_OFFSETX= 22.1/Echelle;
CTD_OFFSETZ=0.2/Echelle;  //surélévation par rapport au bloc 4
CTD_Angle=4.5;

// CTC - Cheville à Tete Carrée sur bloc 1
//
CTC_Tete = 2.4/Echelle;
CTC_Epaisseur = 0.4/Echelle;

//  BE1 - Boulon d'entretoise 1 (tenant le front à l'avant)
//
BE1_RON_DIA = 3.1/Echelle;       // Diamètre de la Rondelle
BE1_RON_LAR = 0.5 /Echelle;      // Epaisseur de la Rondelle
BE1_TIG_DIA= 1.4/ Echelle;       // Diamètre de la tige filetée
BE1_TIG_LAR= BE1_RON_LAR*1.5 ;   // Longueur de la tige filetée en dépassement
BE1_ECR_LON = 1.9/ Echelle;      // Coté de l'écrou carré
BE1_ECR_LAR = BE1_RON_LAR*1.25;  // Epaisseur de l'écrou carré
 
BE1_OFFSETX = 9.52/Echelle;
BE1_OFFSETZ = 7.9 /Echelle;

//  BE2 - Boulon d'entretoise 2 (apparente à l'arrière)
//
BE2_RON_DIA = 3.1/Echelle;       // Diamètre de la Rondelle
BE2_RON_LAR = 0.5 /Echelle;      // Epaisseur de la Rondelle
BE2_TIG_DIA= 1.4/ Echelle;       // Diamètre de la tige filetée
BE2_TIG_LAR= BE1_RON_LAR*1.5 ;   // Longueur de la tige filetée en dépassement
BE2_ECR_LON = 1.9/ Echelle;      // Coté de l'écrou carré
BE2_ECR_LAR = BE1_RON_LAR*1.25;  // Epaisseur de l'écrou carré
 
BE2_OFFSETX = 40.7/Echelle;
BE2_OFFSETZ = 7.9 /Echelle;

// SUS - SUSBANDE (relevé au 1/12e)
//
SUS_HAU =(1.24/2)/Echelle; // Epaisseur de susbande
SUS_CYLDIA = (3.0/2)/Echelle;            // Diamètre cylindre de bout
SUS_LON = (45.0/2)/Echelle-SUS_CYLDIA/2; // Longueur hors cylindre du bout
SUS_LAR = (10.0/2)/Echelle;              // Largeur de la susbande
SUS_ENCO_LAR = (4.0/2)/Echelle;          // Largeur de l'encoche coté Cheville tête diamant
SUS_ENCO_LON = (3.0/2)/Echelle;          // Longueur de l'encoche coté Cheville tête diamant   
SUS_CYL_OFFSETX = (14.0/2)/Echelle;      
// Position du bord du logement de tourillon p/r bord coté encoche
SUS_LCOT_LAR = (3.2/2)/Echelle;          // Largeur de la découpe pour Cheville triangle
SUS_LCOT_LON = (7.0/2)/Echelle;          // Longueur de la découpe pour Cheville triangle
SUS_LCOT_OFFSETX = (34.0/2)/Echelle; 
// Position de la découpe pour cheville triangle p/r bord coté encoche





