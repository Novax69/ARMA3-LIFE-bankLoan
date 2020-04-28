#include "..\..\script_macros.hpp"
/*
    File: fn_NovBorrowLoan.sqf
    Author: Novax
   	github : https://github.com/Novax69 <== Find my other scripts for arma here
    Date : 26/04/2020

    Description:
	Ask to get money !

*/

private["_value","_percent","_borrowLimit","_aboveNb","_playerUID","_interest"];

_value = parseNumber(ctrlText 690103);
_playerUID = getPlayerUID player;
_borrowLimit = LIFE_SETTINGS(getNumber,"nov_loanAmmountLimit");
_interest = LIFE_SETTINGS(getNumber,"nov_interestPercent");

if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 0) exitWith {}; 
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if(_value > _borrowLimit) exitWith {
   _aboveNb = _value - _borrowLimit; // Dit de combien c'est dépassé
    hint format["La limite est de %1€, tu as demandé %2 € de trop",[_borrowLimit] call life_fnc_numberText,[_aboveNb] call life_fnc_numberText];

};



BANK = BANK + _value;

_percent = round(((_value) * _interest)/100);

_value = _value + _percent; //We add Interests of 2%


LOAN = LOAN + _value;

[_playerUID,LOAN] remoteExecCall ["DB_fnc_updateLoan",RSERV];

hint format["Votre prêt s'élève à %1 €",[_value] call life_fnc_numberText];

[] call life_fnc_NovLoanMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
