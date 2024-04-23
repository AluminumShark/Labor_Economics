library(tidyverse)

library(readr)

library(stringr)

library(haven)

stu_2007 <- read_csv("Desktop/勞經專題/term_paper/raw_data/stu_2007_cpnp.csv", 
                          locale = locale(encoding = "BIG5")) %>% as_tibble()

grade_2007 <- read_csv("Desktop/勞經專題/term_paper/raw_data/grade_2007_cpnp.csv", 
                          locale = locale(encoding = "BIG5")) %>% as_tibble()

parent_2007 <- read_csv("Desktop/勞經專題/term_paper/raw_data/parent_2007_cpnp.csv", 
               
                                         locale = locale(encoding = "BIG5")) %>% as_tibble()
the_2009 <- read_csv("/Users/liwei/Desktop/勞經專題/term_paper/raw_data/raw_raw_data/2009_大學在讀中/cp2009.csv")

the_2013 <- read_csv("/Users/liwei/Desktop/勞經專題/term_paper/raw_data/raw_raw_data/2013_第一次職場/cp2013.csv")

the_2014 <- read_csv("/Users/liwei/Desktop/勞經專題/term_paper/raw_data/raw_raw_data/2014_第一次職場/cpn2014.csv")

the_2019 <- read_csv("/Users/liwei/Desktop/勞經專題/term_paper/raw_data/raw_raw_data/2019_老人/cp2019.csv")

#stu_2007_cp$stud_id <- stu_2007_cp$stud_id %>% as.numeric()

stu_2007_cpnp$stud_id <- stu_2007_cpnp$stud_id %>% as.numeric()

stu_2007 <- stu_2007_cpnp
#stu_2007 <- merge(stu_2007_cp, stu_2007_cpnp)

stu_2007 <- stu_2007 %>% select(stud_id, w4pgrm, w4priv, w4urban3,
                                w4nright, w4cfree, w4math, w1s502,
                                w4s1081, w4s1082, w4s1083, w4s1084,
                                w4s1085, w4s1086, w4s1134, w4s1135,
                                w4s1136, w4s1144, w4s1145, w4s1146,
                                w4s1151, w4s1152, w4s1153, w4s1154,
                                w4s1155, w4s1156, w4s120, w4s121,
                                w4s122, w4s123, w4s124, w4s125, w4s126, w4s127,
                                w4s1281, w4s1282, w4s1283, w4s1284, w4s1285,
                                w4s1286, w4s1291, w4s1292,w4s1293, w4s1294,
                                w4s1295, w4s1301, w4s1302, w4s1303, w4s1304,
                                w4s1305, w4s1306, w4s409, 
                                w4s410 , w4s411, w4s415, w4s416,
                                w4s417, w4s418
                                )

stu_2007 <- stu_2007 %>% mutate(w4pgrm_1 = 0) %>% mutate(w4pgrm_2 = 0) %>% mutate(w4pgrm_3 = 0) %>% mutate(w4pgrm_4 = 0)

stu_2007$w4pgrm_1 <- if_else(stu_2007$w4pgrm == "普通學程", 1, 0)  

stu_2007$w4pgrm_2 <- if_else(stu_2007$w4pgrm == "綜合學程", 1, 0)

stu_2007$w4pgrm_3 <- if_else(stu_2007$w4pgrm == "高職", 1, 0)

stu_2007$w4pgrm_4 <- if_else(stu_2007$w4pgrm == "五專", 1, 0)

stu_2007$w1s502 <- if_else(stu_2007$w1s502 == "女", 0 ,1)

stu_2007$w4priv[stu_2007$w4priv == "公立"] <- 0

stu_2007$w4priv[stu_2007$w4priv == "私立"] <- 1

stu_2007$w4urban3[stu_2007$w4urban3 == "都市"] <- 1

stu_2007$w4urban3[stu_2007$w4urban3 == "城鎮"] <- 2

stu_2007$w4urban3[stu_2007$w4urban3 == "鄉村"] <- 3

varlist <- c("w4s1081", "w4s1082", "w4s1083", "w4s1084", "w4s1085", "w4s1086",
             "w4s1134", "w4s1135", "w4s1136", "w4s1144", "w4s1145", "w4s1146",
             "w4s1151", "w4s1152", "w4s1153", "w4s1154", "w4s1155", "w4s1156")


for (i in seq_along(varlist)){

  col <- stu_2007[[varlist[i]]]
  col[col == "有"] <- 1
  col[col == "沒有"] <- 0
  col[col == "不合理值"] <- NA
  col[col == "未填答"] <- NA

  stu_2007[[varlist[i]]] <- col
}

varlist2 <- c("w4s120", "w4s121", "w4s122", "w4s123", "w4s124", "w4s125", 
              "w4s126", "w4s127")


for (i in seq_along(varlist2)){
  
  col <- stu_2007[varlist2[i]]
  col[col == "從來沒有"] <- "1"
  col[col == "偶爾有"] <- "2"
  col[col == "有時有"] <- "3"
  col[col == "經常有"] <- "4"
  col[col == "未填答"] <- "NA"
  col[col == "不合理值"] <- "NA"
  
  stu_2007[varlist2[i]] <- col
}

varlist3 <- c("w4s1281", "w4s1282", "w4s1283", "w4s1284", "w4s1285", "w4s1286",
              "w4s1291", "w4s1292", "w4s1293", "w4s1294", "w4s1295", "w4s1301",
              "w4s1302", "w4s1303", "w4s1304", "w4s1305", "w4s1306")

for (i in seq_along(varlist3)){
  
  col <- stu_2007[[varlist3[i]]]
  col[col == "有"] <- 1
  col[col == "沒有"] <- 0
  col[col == "不合理值"] <- NA
  col[col == "未填答"] <- NA
  
  stu_2007[[varlist3[i]]] <- col
}

varlist6 = c("w4s409", "w4s410", "w4s417")

for (i in seq_along(varlist6)){
  
  col <- stu_2007[varlist6[i]]
  col[col == "高中職(專科)畢業"] <- "1"
  col[col == "技術學院或科技大學畢業"] <- "2"
  col[col == "一般大學畢業"] <- "3"
  col[col == "碩士學位"] <- "4"
  col[col == "博士學位"] <- "5"
  col[col == "沒想過/不知道" | col == "未填答"] <- "NA"
  stu_2007[varlist6] <- col
  
}

stu_2007 <- stu_2007 %>% mutate(dummy = 1) %>% 
  pivot_wider(names_from = w4s411, values_from = dummy, values_fill = 0)

stu_2007 <- stu_2007 %>% select(-未填答, -不合理值)

stu_2007 <- stu_2007 %>% mutate(dummy = 1) %>% 
  pivot_wider(names_from = w4s415, values_from = dummy, values_fill = 0)

stu_2007 <- stu_2007 %>% select(-未填答)


col <- stu_2007$w4s418
col[which(col == "未填答" | col == "不清楚")] <- NA
col[which(col == "30,000元(含)以下")] <- 1
col[which(col == "30,001~50,000元")] <- 2
col[which(col == "50,001~100,000元")] <- 3
col[which(col == "100,001~150,000元")] <- 4
stu_2007$w4s418 <- col



stu_2007 <- lapply(stu_2007, as.numeric) %>% as.tibble()

#grade_2007 <- merge(grade_2007_cp, grade_2007_cpnp)

grade_2007 <- grade_2007_cpnp

grade_2007 <- grade_2007 %>% select(stud_id, w4td01, w4td02, w4td03, w4td04, w4td05, w4td06, w4td07)

varlist4 <- c("w4td01", "w4td02", "w4td03")

for (i in seq_along(varlist4)){
  
  col <- grade_2007[varlist4[i]]
  col[col == "特別差"] <- "1"
  col[col == "比較差"] <- "2"
  col[col == "差不多"] <- "3"
  col[col == "比較好"] <- "4"
  col[col == "特別好"] <- "5"
  col[col == "不清楚"] <- "NA"
  grade_2007[varlist4[i]] <- col
  
}

varlist5 = c("w4td04", "w4td05", "w4td06", "w4td07")


for (i in seq_along(varlist5)){
  
  col <- grade_2007[varlist5[i]]
  col[col == "特別不樂意" | col == "特別弱" | col == "從不" | col == "會"] <- "1"
  col[col == "比較不樂意" | col == "比較弱" | col == "偶而"] <- "2"
  col[col == "差不多" | col == "有時"] <- "3"
  col[col == "比較樂意" | col == "比較強" | col == "經常"] <- "4"
  col[col == "特別樂意" | col == "特別強"] <- "5"
  col[col == "不清楚"] <- "NA"
  col[col == "不會"] <- "0"
  grade_2007[varlist5[i]] <- "col"
  
}


parent_2007 <- parent_2007_cpnp %>% select(stud_id, w4p101, w4p102, w4p103,
                                      w4p234,w4p235, w4p229, w4p413, w4p414, w4p415,
                                      w4faedu, w4fahlth, w4moedu, w4mohlth)

parent_2007_edit <- parent_2007 %>% filter(w4p102 == "爸爸或媽媽"
                                      | w4p102 == "養父或養母" |
                                        w4p102 == "繼父或繼母")


parent_2007_edit <- parent_2007_edit %>% pivot_wider(names_from = w4p101, values_from = w4p229)

parent_2007_edit <- parent_2007_edit %>% rename("female_1" = "女性") %>% rename("male_1" = "男性")

parent_2007_edit <- parent_2007_edit %>% select(-未填答)


parent_2007_edit <- merge(parent_2007_edit, parent_2007)

parent_2007_edit <- parent_2007_edit %>% pivot_wider(names_from = w4p101, values_from = w4p413)

parent_2007_edit <- parent_2007_edit %>% rename("male_2" = "女性") %>% rename("female_2" = "男性")

parent_2007_edit <- parent_2007_edit %>% select(-未填答, -w4p229)

parent_2007_edit <- parent_2007_edit %>% mutate(male = coalesce(male_1, male_2)) %>% 
  mutate(female = coalesce(female_1, female_2))

parent_2007_edit <- parent_2007_edit %>% select(-male_1, -male_2, -female_1, -female_2)



parent_2007_edit <- merge(parent_2007, parent_2007_edit)

parent_2007_edit <- parent_2007_edit %>% pivot_wider(names_from = w4p101, values_from = w4p234)

parent_2007_edit <- parent_2007_edit %>% rename("female_3" = "女性") %>% 
  rename("male_3" = "男性")

parent_2007_edit <- parent_2007_edit %>% select(-未填答, -w4p229, -w4p414)

parent_2007_edit <- merge(parent_2007_edit, parent_2007)

parent_2007_edit <- parent_2007_edit %>% pivot_wider(names_from = w4p101, values_from = w4p414)

parent_2007_edit <- parent_2007_edit %>% rename("male_4" = "女性") %>% 
  rename("female_4" = "男性")

parent_2007_edit <- parent_2007_edit %>% mutate(male2 = coalesce(male_3, male_4)) %>% 
  mutate(female2 = coalesce(female_3, female_4))

parent_2007_edit <- parent_2007_edit %>% 
  select(-未填答, -w4p229, -w4p234, -male_3, -male_4, -female_3, -female_4)

parent_2007_edit <- merge(parent_2007_edit, parent_2007)

parent_2007_edit <- parent_2007_edit %>% pivot_wider(names_from = w4p101, values_from = w4p235)

parent_2007_edit <- parent_2007_edit %>% rename("female_5" = "女性") %>% 
  rename("male_5" = "男性")

parent_2007_edit <- parent_2007_edit %>% select(-未填答, -w4p234, -w4p229, -w4p414)

parent_2007_edit <- merge(parent_2007_edit, parent_2007)

parent_2007_edit <- parent_2007_edit %>% pivot_wider(names_from = w4p101, values_from = w4p415)

parent_2007_edit <- parent_2007_edit %>% rename("male_6" = "女性") %>% 
  rename("female_6" = "男性")

parent_2007_edit <- parent_2007_edit %>% mutate(male3 = coalesce(male_5, male_6)) %>% 
  mutate(female3 = coalesce(female_5, female_6))

parent_2007_edit <- parent_2007_edit %>% 
  select(-未填答, -w4p229, -w4p234, -w4p414, -w4p235, -male_5, -male_6,
         -female_5, -female_6)

parent_2007_edit$w4p103 <- if_else(parent_2007_edit$w4p103 == "已婚", 1, 0)

parent_2007_edit2 <- parent_2007 %>% filter(w4p102 == "其他"
                                           | w4p102 == "兄姐" |
                                             w4p102 == "祖父母或外祖父母")

parent_2007_edit2$w4p103 <- NA

parent_2007_edit3 <- bind_rows(parent_2007_edit, parent_2007_edit2)

parent_2007_edit3 <- parent_2007_edit3 %>% select(-w4p101, -w4p229, -w4p413)


varlist7 <- c("w4faedu", "w4moedu")

for (i in seq_along(varlist7)){
  
  col <- parent_2007_edit3[varlist7[i]]
  col[col == "未填答"] <- NA
  col[col == "國中或以下"] <- "1"
  col[col == "高職"] <- "2"
  col[col == "高中"] <- "3"
  col[col == "專科(二、三、五專)、技術學院或科技大學"] <- "4"
  col[col == "一般大學"] <- "5"
  col[col == "研究所(碩博士)"] <- "6"
  parent_2007_edit3[varlist7[i]] <- col
  
}

varlist8 <- c("w4fahlth", "w4mohlth")

for (i in seq_along(varlist8)){
  
  col <- parent_2007_edit3[varlist8[i]]
  col[col == "未填答"] <- NA
  col[col == "不好，會影響日常作息"] <- "1"
  col[col == "不好，但不影響日常作息"] <- "2"
  col[col == "普通"] <- "3"
  col[col == "良好"] <- "4"
  parent_2007_edit3[varlist8[i]] <- col
  
}

varlist9 <- c("male", "female")

for (i in seq_along(varlist9)){
  
  col <- parent_2007_edit3[varlist9[i]]
  col[col == "未填答" | col == "其他"] <- "NA"
  col[col == "沒有特別要求"] <- "1"
  col[col == "要有班上的平均水準"] <- "2"
  col[col == "至少中上"] <- "3"
  col[col == "至少班上前五名"] <- "4"
  parent_2007_edit3[varlist9[i]] <- col
  
}

parent_2007_edit3 <- parent_2007_edit3 %>% select(-w4p234, -w4p235, -w4p414, -w4p415)


varlist10 <- c("male2", "female2")

for (i in seq_along(varlist10)){
  
  col <- parent_2007_edit3[varlist10[i]]
  col[col == "未填答" | col == "沒想過/不知道" | col == "不合理值"] <- NA
  col[col == "沒有特別期待"] <- "1"
  col[col == "高中職/五專畢業"] <- "2"
  col[col == "技術學院或科大畢業"] <- "3"
  col[col == "一般大學畢業"] <- "4"
  col[col == "碩士學位"] <- "5"
  col[col == "博士學位"] <- "6"
  parent_2007_edit3[varlist10[i]] <- col
  
}

varlist11 <- c("male3", "female3")

for (i in seq_along(varlist11)){
  
  col <- parent_2007_edit3[[varlist11[i]]]
  col <- if_else(col == "未填答", as.character(NA),
                 if_else(col == "隨他自己的興趣", "0", "1"))
  parent_2007_edit3[[varlist11[i]]] <- col

}

the_2007 <- merge(merge(stu_2007, grade_2007), parent_2007_edit3)

the_2007 <- the_2007 %>% select(-w4pgrm, -w4p102)

the_2007 <- lapply(the_2007, as.numeric) %>% as.tibble()

remove(grade_2007, grade_2007_cp, grade_2007_cpnp, parent_2007, parent_2007_cp,
       parent_2007_cpnp, parent_2007_edit, parent_2007_edit2, parent_2007_edit3,
       stu_2007, stu_2007_cp, stu_2007_cpnp)

the_2009 <- the_2009 %>% select(stud_id, cp09v08_u, cp09v08_ud)

the_2013 <- the_2013 %>% select(stud_id, cp13v62, cp13v32v33_u, cp13v32v33_ud)

the_2014 <- the_2014 %>% select(stud_id, cpn14e13_1, cpn14b4f1_2_s10, cpn14b4g1)

the_2019 <- the_2019 %>% select(stud_id, cp19v78, cp19v78_k, cp19v66)

the_2009$stud_id <- the_2009$stud_id %>% as.numeric()

the_2013$stud_id <- the_2013$stud_id %>% as.numeric()

the_2014$stud_id <- the_2014$stud_id  %>% as.numeric()

the_2019$stud_id <- the_2019$stud_id %>% as.numeric()

the_data <- merge(the_2007, the_2009)

the_data <- merge(the_data, the_2013)

the_data <- merge(the_data, the_2014)

the_data <- merge(the_data, the_2019)


write.csv(the_data ,file = "/Users/liwei/Desktop/勞經專題/term_paper/raw_data/the_data.csv", row.names = FALSE)
