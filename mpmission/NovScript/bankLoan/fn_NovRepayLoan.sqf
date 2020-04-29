#include "..\..\script_macros.hpp"
/*
    File: fn_NovRepayLoan.sqf
    Author: Novax
   	github : https://github.com/Novax69 <== Find my other scripts for arma here
    Date : 26/04/2020

    Description:
	give those thief their money back !

*/

private["_value","_playerUID"];


_playerUID = getPlayerUID player;
_value = parseNumber(ctrlText 690103);

if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 0) exitWith {}; 
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if(_value > LOAN) exitWith {
    _aboveNb = _value - LOAN; // Dit de combien c'est dépassé
    hint format["Tu dois seulement remboursé %1€, tu as donné %2 € de trop",[LOAN] call life_fnc_numberText,[_aboveNb] call life_fnc_numberText];
};

BANK = BANK - _value;
LOAN = LOAN - _value;

[_playerUID,LOAN] remoteExecCall ["DB_fnc_updateLoan",RSERV];



hint format["Tu as remboursé ton prêt de %1 €",[_value] call life_fnc_numberText];

[] call life_fnc_NovLoanMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync