proc import datafile="\\apporto.com\dfs\UNCC\Users\athopte_uncc\Downloads\Assign-1\CSM.xls"
DBMS=xls out=csm replace;
proc print data=csm;
run;

data logit;
set csm;
hits = (Ratings >=6.0);
run;
proc print data=logit;
run;

proc logistic data=logit descending;
model hits = Likes Comments Screens;
run;

*Dropping Variable Screens and running the model;

proc logistic data=logit descending;
model hits = Likes Comments ;
run;

