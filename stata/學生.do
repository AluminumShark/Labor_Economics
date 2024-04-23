cls

clear

set more off

use "/Users/liwei/Desktop/勞經專題/term_paper/raw_data/stu_1.dta"

duplicates report stud_id

duplicates drop stud_id, force

foreach x of varlist w4pgrm - w4urban3{

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"

}

foreach x of varlist w4pgrm - w4urban3{

	encode `x', gen(`x'_2)
	drop `x'

}


foreach x of varlist w4s101 - w4s107{

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"

}

foreach x of varlist w4s101 - w4s107{

	encode `x', gen(`x'_2)
	drop `x'
	
}

foreach x of varlist w4s1081 - w4s1086{
	
	replace `x' = "." if `x' == "未填答"
	
	replace `x' = "0" if `x' == "沒有"
	
	replace `x' = "1" if `x' == "有"
	}
	


replace w4s109 = "." if w4s109 == "未填答" | w4s109 == "不合理值"

replace w4s109 = "1" if w4s109 == "不需要"

replace w4s109 = "2" if w4s109 == "非常不需要"

replace w4s109 = "3" if w4s109 == "不需要"

replace w4s109 = "4" if w4s109 == "需要"

replace w4s109 = "5" if w4s109 == "非常需要"


foreach x of varlist w4s110 w4s111 {

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"

	replace `x' = "1" if `x' == "非常沒有幫助"

	replace `x' = "2" if `x' == "沒有幫助"

	replace `x' = "3" if `x' == "有幫助"

	replace `x' = "4" if `x' == "非常有幫助"
	}



foreach x of varlist w4s1121 - w4s1156 {
	
	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"
	
	}
	

replace w4s116 = "." if w4s116 == "未填答" | w4s116 == "不合理值"

encode w4s116, gen(w4s116_2)

drop w4s116

	
	
foreach x of varlist w4s117 - w4s119{
	
	replace `x' = "." if `x' == "未填答"

}


foreach x of varlist w4s117 - w4s119{
	
	encode `x', generate(`x'_2)
	drop `x'
 
 }


foreach x of varlist w4s120 - w4s127{
	
	replace `x' = "." if `x' == "不合理值" | `x' == "未填答"
	
	replace `x' = "1" if `x' == "從來沒有"
	
	replace `x' = "2" if `x' == "偶爾有"
	
	replace `x' = "3" if `x' == "有時有"
	
	replace `x' = "3" if `x' == "經常有"

}


foreach x of varlist w4s1281 - w4s1306{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}


replace w4s131 = "." if w4s131 == "不合理值" | w4s131 == "未填答"

encode w4s131, gen(w4s131_2)

drop w4s131


foreach x of varlist w4s1321 - w4s1336{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"
	
}

foreach x of varlist w4s201 - w4s203{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}


foreach x of varlist w4s201 - w4s203{
	
	encode `x', gen(`x'_2)
	
	drop `x'

}


replace w4s205 = "." if w4s205 == "不合理值" | w4s205 == "未填答" | w4s205 == "不知道"

encode w4s205, gen(w4s205_2)

drop w4s205


foreach x of varlist w4s2041 - w4s2155{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}


foreach x of varlist w4s216 - w4s218{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}

foreach x of varlist w4s216 - w4s218{
	
	encode `x', gen(`x'_2)
	
	drop `x'

}


foreach x of varlist w4s301 - w4s305{

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"
	
	replace `x' = "1" if `x' == "沒辦專題演講" | `x' == "學校沒有辦" ///
	| `x' == "沒有實驗課或實作課程" | `x' == "很少上這類課程" | `x' == "沒有班際競賽"
	
	replace `x' = "2" if `x' == "沒參加/不知道"
	
	replace `x' = "3" if `x' == "非常不同意"
	
	replace `x' = "4" if `x' == "不同意"
	
	replace `x' = "5" if `x' == "同意"
	
	replace `x' = "6" if `x' == "非常同意"
	
}

foreach x of varlist w4s3061 - w4s3076{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}

foreach x of varlist w4s308 - w4s320{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}

foreach x of varlist w4s308 - w4s320{
	
	encode `x', gen(`x'_2)
	
	drop `x'

}

foreach x of varlist w4s3211 - w4s3226{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}


foreach x of varlist w4s323 w4s325 w4s327 {

    replace `x' = "." if `x' == "未填答" | `x' == "不合理值"
	
    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "1位"
	
    replace `x' = "2" if `x' == "2位"
	
    replace `x' = "3" if `x' == "3位"
    
	replace `x' = "4" if `x' == "4位"
    
	replace `x' = "5" if `x' == "5位(含)以上"
}



foreach x of varlist w4s3241 - w4s3246{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}

foreach x of varlist w4s3261 - w4s3266{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}


foreach x of varlist w4s3281 - w4s3286{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}

replace w4s329 = "." if w4s329 == "不合理值" | w4s329 == "未填答"

encode w4s329, gen(w4s329_2)

drop w4s329


foreach x of varlist w4s3301 - w4s3336{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}

foreach x of varlist w4s334 - w4s336{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}

foreach x of varlist w4s334 - w4s336{
	
	encode `x', gen(`x'_2)
	
	drop `x'

}

foreach x of varlist w4s3371 - w4s3384{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}

replace w4s401 = "." if w4s401 == "不合理值" | w4s401 == "未填答"

encode w4s401, gen(w4s401_2)

drop w4s401

foreach x of varlist w4s402 - w4s404{

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"

    replace `x' = "1" if `x' == "從未"
	
    replace `x' = "2" if `x' == "偶爾"
	
	replace `x' = "3" if `x' == "有時"
	
    replace `x' = "4" if `x' == "經常"

}

foreach x of varlist w4s405 - w4s431{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}

foreach x of varlist w4s405 - w4s431{
	
	encode `x', gen(`x'_2)
	
	drop `x'

}

foreach x of varlist w4s432 - w4s442{

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"

    replace `x' = "1" if `x' == "非常不符合"
	
    replace `x' = "2" if `x' == "不符合"
	
	replace `x' = "3" if `x' == "符合"
	
    replace `x' = "4" if `x' == "非常符合"

}

foreach x of varlist w4s443 - w4s459{

	replace `x' = "." if `x' == "未填答" | `x' == "不合理值"

    replace `x' = "1" if `x' == "從來沒有"
	
    replace `x' = "2" if `x' == "偶爾有"
	
	replace `x' = "3" if `x' == "有時有"
	
    replace `x' = "4" if `x' == "經常有"

}


replace w4s460 = "." if w4s460  == "未填答" | w4s460  == "不合理值"

replace w4s460  = "1" if w4s460  == "非常不快樂"
	
replace w4s460  = "2" if w4s460  == "不太快樂"
	
replace w4s460  = "3" if w4s460  == "還算快樂"
	
replace w4s460  = "4" if w4s460  == "非常快樂"


foreach x of varlist w4s4611 - w4s4704{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}

replace w4s471 = "." if w4s471  == "未填答" | w4s471  == "不合理值"

replace w4s471  = "1" if w4s471  == "沒有過性行為"
	
replace w4s471  = "2" if w4s471  == "沒有"
	
replace w4s471  = "3" if w4s471  == "有"


foreach x of varlist w4sx01 - w4sx02{
	
	replace `x' = "." if `x' == "未填答" | `x' == "`不合理值'"

}


replace w4sx01 = "178" if w4sx01 == "178公分(含)以上"

replace w4sx01 = "153" if w4sx01 == "153公分(含)以下"


replace w4sx02 = "79" if w4sx02 == "79公斤(含)以上"

replace w4sx02 = "43" if w4sx02 == "43公斤(含)以下"


foreach x of varlist w4sx03 - w4sx05{

	replace `x' = "." if `x' == "未填答"

    replace `x' = "0" if `x' == "沒有"
	
    replace `x' = "1" if `x' == "有"

}


replace w4refuse = "." if w4refuse == "是"

replace w4refuse = "1" if w4refuse == "否"


foreach x of varlist w4log1 - w4log41{

	replace `x' = "." if `x' == "有錯誤"

	replace `x' = "1" if `x' == "沒有錯誤"
	
}

foreach x of varlist w4s1081 - w4s431_2{

	destring `x', replace

}

foreach x of varlist w1stwt1 - w4s431_2{

	drop if missing(`x')

}

foreach x of varlist w4log1 - w4log41{

	drop `x'

}
