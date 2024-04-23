cls

clear

set more off

import delimited "/Users/liwei/Desktop/勞經專題/term_paper/raw_data/finale.csv", encoding(ISO-8859-2) 


*sum salary1, detail

*replace salary1 = 16 if salary1 >= 21

*export delimited using "/Users/liwei/Desktop/勞經專題/term_paper/raw_data/finale2.csv", replace
