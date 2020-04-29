/*
    File: loan.hpp
    Author: Novax
   	github : https://github.com/Novax69 <== Find my other scripts for arma here
    Date : 28/04/2020

    Description:
    GUI Menu
*/

class Life_loan_management {
    idd = 690100;
    name= "life_loan_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 690101;
			text = "Emprunt Bancaire";
			x = 0.31625 * safezoneW + safezoneX;
			y = 0.2312 * safezoneH + safezoneY;
			w = 0.328125 * safezoneW;
			h = 0.028 * safezoneH;

        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.31625 * safezoneW + safezoneX;
			y = 0.26284 * safezoneH + safezoneY;
			w = 0.328125 * safezoneW;
			h = 0.294 * safezoneH;
        };
    };

    class controls {

		
		class atmAccount: Life_RscStructuredText
		{
			idc = 690102;
			x = 0.329375 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.112 * safezoneH;
		};
		class moneyEdit: Life_RscEdit
		{
			idc = 690103;
			text = "1"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.416 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class loanMenu: Life_RscStructuredText
		{
			idc = 690104;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.112 * safezoneH;
		};
		class buttonBorrow: Life_RscButtonMenu
		{
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 690105;
			text = "Emprunter";
			onButtonClick = "[] call life_fnc_NovBorrowLoan";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class buttonRepay: Life_RscButtonMenu
		{
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 690106;
			text = "Rembourser";
			onButtonClick = "[] call life_fnc_NovRepayLoan";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.5056 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class infoText: Life_RscStructuredText
		{
			idc = 690107;
			text = ""; 
			x = 0.329375 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.112 * safezoneH;
		};

        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
			x = 0.31625 * safezoneW + safezoneX;
			y = 0.5616 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.028 * safezoneH;
        };


    };
};