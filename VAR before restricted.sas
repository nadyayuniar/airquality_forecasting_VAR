proc import datafile='/home/u48757152/terakhir amin/DATA SAS.xlsx'
	dbms=xlsx replace
	out=datav;
	getnames=yes;
run;

proc varmax data=datav;
model CO PM10 NO2 / p=1
lagmax=60 noint minic=(p=60) method=ls
print=(corry parcoef pcorr pcancorr roots diagnose);
output lead=1488 out=resi;
run;
proc export data=resi
	outfile='/home/u48757152/terakhir amin/Residual VAR subset awal banget mboh.xlsx'
	dbms=xlsx replace;
run;