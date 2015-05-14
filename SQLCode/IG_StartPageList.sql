USE VIVALDI
SET NOCOUNT ON

SELECT '|| Fund code || Fund Name || Vehicle || Head Of Desk || Last Modified || By ||'

SELECT 	CASE 
	WHEN FundCode IN ('UGEF', 'UITF') THEN 
		'| *' + FundCode + '*: see UPUF |' + FundName + 
		' | _' + VehicleName + '_' +
		' | {color:gray}' + HoDCode + '{color} | | |' 
	ELSE
		'| [*' + FundCode + '* | ' + FundCode + ' - IG]' +
		' | ' + FundName +
		' | _' + VehicleName + '_' +
		' | {color:gray}' + HoDCode + '{color}' +
		' | {page-info:modified-date|page=' + FundCode + 
			' - IG|dateFormat:dd-MMM-yy HHmm}' + 
		' | {page-info:modified-user|page=' + FundCode + 
			' - IG}' +
		' |'
	END

FROM	vw_FundsTypology

WHERE	IsAlive = 1
--	AND IsSkip = 0

ORDER BY	HoDCode
		, VehicleId

