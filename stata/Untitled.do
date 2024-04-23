cls

clear

set more off

import delimited "/Users/liwei/Desktop/勞經專題/term_paper/raw_data/the_data.csv", encoding(UTF-8)

foreach x of varlist stud_id - cp19v78_k{
	
	tostring `x', replace


}

foreach x of varlist stud_id - cp19v78_k{
	
	replace `x' = "." if `x' == "NA"


}



foreach x of varlist stud_id - cp19v78_k{
	destring `x', replace


}
