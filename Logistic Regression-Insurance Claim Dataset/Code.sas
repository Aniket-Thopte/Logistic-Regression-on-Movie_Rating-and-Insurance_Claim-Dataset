proc import datafile="\\apporto.com\dfs\UNCC\Users\athopte_uncc\Downloads\Exam-2\insuranceclaim.csv"
DBMS=csv out=csm replace;

data logit;
set csm;
run;
proc print data=logit;
run;
proc logistic data=logit descending;
model insuranceclaim = age sex bmi children smoker region charges;
run;

*Dropping Variable sex region charge and running the model;

proc logistic data=logit descending;
model insuranceclaim = age bmi children smoker;
run;
