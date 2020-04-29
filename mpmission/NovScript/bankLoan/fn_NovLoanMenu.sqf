#include "..\..\script_macros.hpp"
/*
	File : fn_NovLoanMenu.sqf
	Author : Novax
	github : https://github.com/Novax69 <== Find my other scripts for arma here
	Date : 28/04/2020

	Description : 
		Create a menu for loan burrow

*/


disableSerialization;

private["_btnBurrow","_interest","_useDonorLevel","_donorAmount","_donorLevel"];

_interest = LIFE_SETTINGS(getNumber,"nov_interestPercent");
_useDonorLevel = LIFE_SETTINGS(getNumber,"nov_useDonator");




if (!dialog) then {
    if (!(createDialog "Life_loan_management")) exitWith {};
};


_btnBurrow = CONTROL(690100,690105);
if(LOAN > 0) then {
	_btnBurrow ctrlEnable false;
} else {
	_btnBurrow ctrlEnable true; // just in case
};


CONTROL(690100,690102) ctrlSetStructuredText parseText format ["<img size='1.7' image='icons\ico_bank.paa'/> $%1<br/><img size='1.6' image='icons\ico_money.paa'/> $%2",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];

if(LOAN isEqualTo 0) then {
	CONTROL(690100,690104) ctrlSetStructuredText parseText format ["Vous n'avez pas de prêt en cours"];
} else {
	CONTROL(690100,690104) ctrlSetStructuredText parseText format ["Votre prêt restant s'élève à %1€",[LOAN] call life_fnc_numberText];
};

if(_useDonorLevel isEqualTo 1) then {
	_donorLevel = FETCH_CONST(life_donorlevel);
	_interest = _interest - (_donorLevel * 1);
};

CONTROL(690100,690107) ctrlSetStructuredText parseText format ["Le taux d'intérêt actuel s'élève à %1%2",[_interest] call life_fnc_numberText, "%"];

