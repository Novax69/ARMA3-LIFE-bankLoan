#include "..\..\script_macros.hpp"
/*
	File : fn_NovAutomaticRepay.sqf
	Author : Novax
	github : https://github.com/Novax69 <== Find my other scripts for arma here
	Date : 05/05/2020

	Description : 
		Force the player to repay his loan

*/

private["_time","_percent","_paySide","_aboveNb","_leftToPay"];

_time = LIFE_SETTINGS(getNumber,"paycheck_period");
_time = _time * 60; //convert minutes to seconds


switch(playerSide) do {
	case west: { _paySide = LIFE_SETTINGS(getNumber,"paycheck_cop");};
	case civilian: { _paySide = LIFE_SETTINGS(getNumber,"paycheck_cop");};
	case independent : { _paySide = LIFE_SETTINGS(getNumber,"paycheck_cop");};
};

_percent = (_paySide * 15 / 100);


while { LOAN > 0 } do {

	sleep _time; //What's defined inside config_master
	if(LOAN - _percent >= 0 ) then {
		BANK = BANK - _percent;
		LOAN = LOAN - _percent;
		systemChat format [local "STR_NOV_Loan_RepaidPaycheckNormal",[_percent] call life_fnc_numberText,[LOAN] call life_fncnumberText];
	} else {
		BANK = BANK - _percent;
		_aboveNb = _percent - LOAN;
		_leftToPay = LOAN;
		BANK = BANK + _aboveNb;
		LOAN = 0;
		systemChat format [local "STR_NOV_Loan_RepaidPaycheckFinished",[_leftToPay] call life_fnc_numberText];
	};
	[getPlayerUID player,LOAN] remoteExecCall ["DB_fnc_updateLoan",RSERV];
};
