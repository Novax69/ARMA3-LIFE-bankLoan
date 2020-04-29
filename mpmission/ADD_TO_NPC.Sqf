// Here is the code to add inside your NPC / Object to access the menu 

this enableSimulation false; 
this allowDamage false; 

// FRENCH :
this addAction["<t color='#ADFF2F'>Emprunt bancaire</t>",life_fnc_NovLoanMenu,"",0,FALSE,FALSE,"",' isNull objectParent player && player distance _target < 4 '];

// ENGLISH :
this addAction["<t color='#ADFF2F'>Bank Loan</t>",life_fnc_NovLoanMenu,"",0,FALSE,FALSE,"",' isNull objectParent player && player distance _target < 4 '];
