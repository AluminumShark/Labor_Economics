cls

clear

set more off

import delimited "/Users/liwei/Desktop/勞經專題/term_paper/趕火車/finale.csv", encoding(ISO-8859-2)

drop w4s1134 w4s1135 w4s1144 w4s1145 tepsb_sex



logit edu teps_sex w4urban3 w4p503 deg_ask grade_ask cram w4faedu w4moedu w4pgrm w4priv w4all3p w4cf3p w4m3p w4s121-w4s126 if np13v32v33_ud == 0 | np13v32v33_ud == 2, r

estimates store model1



logit libart teps_sex w4urban3 w4p503 deg_ask grade_ask cram w4faedu w4moedu w4pgrm w4priv w4all3p w4cf3p w4m3p w4s121-w4s126 if np13v32v33_ud == 1 | np13v32v33_ud == 2, r

estimates store model2



logit sci teps_sex w4urban3 w4p503 deg_ask grade_ask cram w4faedu w4moedu w4pgrm w4priv w4all3p w4cf3p w4m3p w4s121-w4s126 if np13v32v33_ud == 3 | np13v32v33_ud == 2, r

estimates store model3

logit enger teps_sex w4urban3 w4p503 deg_ask grade_ask cram w4faedu w4moedu w4pgrm w4priv w4all3p w4cf3p w4m3p w4s121-w4s126 if np13v32v33_ud == 4 | np13v32v33_ud == 2, r

estimates store model4



logit agri teps_sex w4urban3 w4p503 deg_ask grade_ask cram w4faedu w4moedu w4pgrm w4priv w4all3p w4cf3p w4m3p w4s121-w4s126 if np13v32v33_ud == 5 | np13v32v33_ud == 2, r

estimates store model5



logit med teps_sex w4urban3 w4p503 deg_ask grade_ask cram w4faedu w4moedu w4pgrm w4priv w4all3p w4cf3p w4m3p w4s121-w4s126 if np13v32v33_ud == 6 | np13v32v33_ud == 2, r

estimates store model6



logit serv teps_sex w4urban3 w4p503 deg_ask grade_ask cram w4faedu w4moedu w4pgrm w4priv w4all3p w4cf3p w4m3p w4s121-w4s126 if np13v32v33_ud == 7 | np13v32v33_ud == 2, r

estimates store model7



esttab model1 model2 model3 model4 model5 model6 model7 using result_choice.tex, replace




reg np13v52 edu libart sci enger agri med serv else teps_sex, r

estimates store modela

reg np13v52 edu libart sci enger agri med serv else w4urban3, r

estimates store modelb

reg np13v52 edu libart sci enger agri med serv else w4p503, r

estimates store modelc

reg np13v52 edu libart sci enger agri med serv else w4urban3 w4pgrm w4priv, r

estimates store modeld

reg np13v52 edu libart sci enger agri med serv else cram w4faedu w4moedu grade_ask deg_ask, r

estimates store modele

pdslasso np13v52 edu libart sci enger agri med serv else (w4pgrm-np13v32v33_u), r

estimates store modelf


esttab modela modelb modelc modeld modele modelf using result_income.tex, replace
