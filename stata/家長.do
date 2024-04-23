cls

clear

set more off

import delimited "/Users/liwei/Desktop/勞經專題/term_paper/raw_data/parent_1.csv", encoding(Big5) 

replace w4p101 = "." if w4p101 == "未填答"

replace w4p101 = "0" if w4p101 == "女性"

replace w4p101 = "1" if w4p101 == "男性"


foreach x of varlist w4p102 - w4p105{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}

foreach x of varlist w4p102 - w4p105{
	
	encode `x', gen(`x'_2)
	
	drop `x'

}

replace w4p106 = "." if w4p106 == "未填答"
	
replace w4p106 = "1" if w4p106 == "1天"
	
replace w4p106 = "2" if w4p106 == "2天"
	
replace w4p106 = "3" if w4p106 == "3天"
    
replace w4p106 = "4" if w4p106 == "4天"
    
replace w4p106 = "5" if w4p106 == "5天（含）以上"



replace w4p107 = "." if w4p106 == "未填答"
	
replace w4p107 = "1" if w4p106 == "不好，會影響日常作息"
	
replace w4p107 = "2" if w4p106 == "不好，不影響日常作息"
	
replace w4p107 = "3" if w4p106 == "普通"
    
replace w4p107 = "4" if w4p106 == "良好"
    

foreach x of varlist w4p108 - w4p109{

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"
	
	replace `x' = "1" if `x' == "從來沒有"

	replace `x' = "2" if `x' == "偶爾一兩次"
	
	replace `x' = "3" if `x' == "有時會"
    
	replace `x' = "4" if `x' == "經常會"


}


replace w4p110 = "." if w4p110 == "未填答" | w4p110 == "不合理值"

replace w4p110 = "0" if w4p110 == "沒有"
	
replace w4p110 = "1" if w4p110 == "有"


foreach x of varlist w4p111 - w4p112{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}


foreach x of varlist w4p111 - w4p112{
	
	encode `x', gen(`x'_2)
	
	drop `x'

}

foreach x of varlist w4p113 - w4p115{

	replace `x' = "." if `x' == "未填答" | `x' == "不適用)"
	
	replace `x' = "1" if `x' == "非常不滿意"

	replace `x' = "2" if `x' == "不太滿意"
	
	replace `x' = "3" if `x' == "還算滿意"
    
	replace `x' = "4" if `x' == "非常滿意"


}




