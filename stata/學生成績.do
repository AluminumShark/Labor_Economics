clear

set more off

import delimited "/Users/liwei/Desktop/勞經專題/term_paper/raw_data/grade_1.csv", encoding(Big5) 

drop w4sumerr w4summis

/*刪除不清楚資料 */

replace w4td01 = "NA" if w4td01 == "不清楚"

replace w4td02 = "NA" if w4td02 == "不清楚"

replace w4td03 = "NA" if w4td03 == "不清楚"

replace w4td04 = "NA" if w4td04 == "不清楚"

replace w4td05 = "NA" if w4td05 == "不清楚"

replace w4td06 = "NA" if w4td06 == "不清楚"

replace w4td07 = "NA" if w4td07 == "不清楚"

replace w4td08 = "NA" if w4td08 == "不清楚"

/*w4td01 */

replace w4td01 = "1" if w4td01 == "特別差"

replace w4td01 = "2" if w4td01 == "比較差"

replace w4td01 = "3" if w4td01 == "差不多"

replace w4td01 = "4" if w4td01 == "比較好"

replace w4td01 = "5" if w4td01 == "特別好"

/*w4td02 */

replace w4td02 = "1" if w4td02 == "特別差"

replace w4td02 = "2" if w4td02 == "比較差"

replace w4td02 = "3" if w4td02 == "差不多"

replace w4td02 = "4" if w4td02 == "比較好"

replace w4td02 = "5" if w4td02 == "特別好"

/*w4td03 */

replace w4td03 = "1" if w4td03 == "特別差"

replace w4td03 = "2" if w4td03 == "比較差"

replace w4td03 = "3" if w4td03 == "差不多"

replace w4td03 = "4" if w4td03 == "比較好"

replace w4td03 = "5" if w4td03 == "特別好"

/*w4td04 */

replace w4td04 = "1" if w4td04 == "特別不樂意"

replace w4td04 = "2" if w4td04 == "比較不樂意"

replace w4td04 = "3" if w4td04 == "差不多"

replace w4td04 = "4" if w4td04 == "比較樂意"

replace w4td04 = "5" if w4td04 == "特別樂意"

/*w4td05 */

replace w4td05 = "1" if w4td05 == "特別弱"

replace w4td05 = "2" if w4td05 == "比較弱"

replace w4td05 = "3" if w4td05 == "差不多"

replace w4td05 = "4" if w4td05 == "比較強"

replace w4td05 = "5" if w4td05 == "特別強"

/*w4td06 */

replace w4td06 = "1" if w4td06 == "從不"

replace w4td06 = "2" if w4td06 == "偶而"

replace w4td06 = "3" if w4td06 == "有時"

replace w4td06 = "4" if w4td06 == "經常"

/*w4td07 */

replace w4td07 = "0" if w4td07 == "不會"

replace w4td07 = "1" if w4td07 == "會"

/*w4td08 */

replace w4td08 = "1" if w4td08 == "不太清楚"

replace w4td08 = "2" if w4td08 == "還算清楚"

replace w4td08 = "3" if w4td08 == "相當清楚"
