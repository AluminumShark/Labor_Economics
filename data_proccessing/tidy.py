import numpy as np
import pandas as pd
from sklearn.preprocessing import LabelEncoder

#定義常用函數

label = LabelEncoder()

def residence(col):
    if col == "鄉村":
        col = 0
    elif col == "城鎮":
        col = 1
    elif col == "都市":
        col = 2
    else:
        col = None
    return col

def YN(col):
    if col == "沒有":
        col = 0
    elif col == "有":
        col = 1
    else:
        col = None
    return col

def freqency(col):
    if col == "從來沒有":
        col = 0
    elif col == "偶爾有":
        col = 1
    elif col == "有時有":
        col = 2
    elif col == "經常有":
        col = 3
    else:
        col = None
    return col

def grade(col):
    if col == "沒有特別要求":
        col = 0
    elif col == "要有班上的平均水準":
        col = 1
    elif col == "至少中上":
        col = 2
    elif col == "至少班上前五名":
        col = 3
    else:
        col = None
    return col

def degree(col):
    if col == "高中職/五專畢業":
        col = 0
    elif col == "技術學院或科大畢業":
        col = 1
    elif col == "一般大學畢業":
        col = 2
    elif col == "碩士學位":
        col = 3
    elif col == "博士學位":
        col = 4
    else:
        col = None
    return col

def econ_stat(col):
    if col == "生活相當困難":
        col = 0
    elif col == "生活有些困難":
        col = 1
    elif col == "生活小康":
        col = 2
    elif col == "生活很不錯":
        col = 3
    else:
        col = None
    return col

def degree2(col):
    if col == "國中或以下":
        col = 0
    elif col == "高職":
        col = 1
    elif col == "高中":
        col = 2
    elif col == "專科(二、三、五專)、技術學院或科技大學":
        col = 3
    elif col == "一般大學":
        col = 4
    elif col == "研究所(碩博士)":
        col = 5
    else:
        col = None
    return col

def sex(col):
    if col == "女性":
        col = 0
    elif col == "男性":
        col = 1
    else:
        col = None
    return col

def collage(col):
    if col == "09 私立技職學院":
        col = 0
    elif col == "04 公立技職學院":
        col = 1
    elif col == "10 私立專科學校":
        col = 2
    elif col == "08 私立科技大學":
        col = 3
    elif col == "03 公立科技大學":
        col = 4
    elif col == "07 私立一般學院":
        col = 5
    elif col == "02 公立一般學院":
        col = 6
    elif col == "06 私立一般大學":
        col = 7
    elif col == "01 公立一般大學":
        col = 8
    else:
        col = None
    return col

def department(col):
    if col == "01 教育領域":
        col = 0
    elif col == "02 人文及藝術領域":
        col = 1
    elif col == "03 社會科學、商業及法律領域":
        col = 2
    elif col == "04 科學領域":
        col = 3
    elif col == "05 工程、製造及營造領域":
        col = 4
    elif col == "06 農學領域":
        col = 5
    elif col == "07 醫藥衛生及社福領域":
        col = 6
    elif col == "08 服務領域":
        col = 7
    elif col == "09 其他領域":
        col = 8
    else:
        col = None
    return col

def income(col):
    if col == "沒有收入":
        col = 0
    elif col == "不到1萬":
        col = 5
    elif col == "1萬以上，不到1萬5":
        col = 12.5
    elif col == "1萬5以上，不到2萬":
        col = 17.5
    elif col == "2萬以上，不到2萬5":
        col = 22.5
    elif col == "2萬5以上，不到3萬":
        col = 27.5
    elif col == "3萬以上，不到3萬5":
        col = 32.5
    elif col == "3萬5以上，不到4萬":
        col = 37.5
    elif col == "4萬以上，不到4萬5":
        col = 42.5
    elif col == "4萬5以上，不到5萬":
        col = 47.5
    elif col == "5萬以上，不到5萬5":
        col = 52.5
    elif col == "5萬5以上，不到6萬":
        col = 57.5
    elif col == "6萬以上，不到6萬5":
        col = 62.5
    elif col == "6萬5以上，不到7萬":
        col = 67.5
    elif col == "7萬以上，不到7萬5":
        col = 72.5
    elif col == "7萬5以上，不到8萬":
        col = 77.5
    elif col == "8萬元以上，____":
        col = 80
    else:
        col = None
    return col

#寫入資料

stu2007 = pd.read_csv("stu_2007_cpnp.csv", encoding="big5")

parent2007 = pd.read_csv("parent_2007_cpnp.csv", encoding="big5")

np2013 = pd.read_csv("np2013.csv", encoding="utf-8")

datalist = [stu2007, parent2007, np2013]

for i in datalist:
    i.replace("未填答", None)
    i.replace("不合理值", None)
    i.replace("不知道、不清楚", None)
    i.replace("沒想過/不知道", None)
    i.replace("拒答", None)
    i.replace("跳答", None)
    i.replace("遺漏值", None)
    i.replace("不適用/不清楚", None)

#2007年學生資料

stulist = ["stud_id", "w4", "w4priv", "w4urban3",
           "w4all3p", "w4cf3p", "w4m3p", #學習表現
#           "w4s1081", "w4s1082", "w4s1083", "w4s1084", "w4s1085", "w4s1086", #補習意願
           "w4s1134", "w4s1135", #請家教
           "w4s1144", "w4s1145", #曾到外面補習
#           "w4s1151", "w4s1152", "w4s1153", "w4s1154", "w4s1155", "w4s1156", #讀過資優班
           "w4s120", "w4s121", "w4s122", "w4s126", #生活表現
#           "w4s1281", "w4s1282", "w4s1283", "w4s1284", "w4s1285", #讀書習慣
#           "w4s1291", "w4s1292","w4s1293", "w4s1294", #升學規劃
#           "w4s1301", "w4s1302", "w4s1303", "w4s1304", "w4s1305", #類組
           "w4s409", #夢想教育程度
#           "w4s410", #理想教育程度
#           "w4s411", #選組受誰影響
#           "w4s415", #對未來工作重視價值
#           "w4s416", #想做什麼工作
            ]

stu2007 = stu2007[stulist]

for i in ["w4", "w4priv"]:
    stu2007[i] = label.fit_transform(stu2007[i])

stu2007["w4urban3"] = stu2007["w4urban3"].apply(residence)

for i in ["w4s1134", "w4s1135", "w4s1144", "w4s1145"]:
    stu2007[i] = stu2007[i].apply(YN)

for i in ["w4s120", "w4s121", "w4s122", "w4s126"]:
    stu2007[i] = stu2007[i].apply(freqency)

stu2007["w4s409"] = stu2007["w4s409"].apply(degree)

stu2007["cram"] = stu2007["w4s1134"] + stu2007["w4s1135"] + stu2007["w4s1144"] + stu2007["w4s1145"]


#2007年父母資料

parentlist = ["stud_id", 
              "w4p229", "w4p413", #對學業成績的要求 
              "w4p234", "w4p414", #期待唸到什麼程度
#              "w4p235", "w4p415", #期待做什麼工作
#              "w4p236", "w4p416", #期待填什麼科系
              "w4p503", #家庭財富狀況
              "w4faedu", "w4moedu" #父母教育程度
              ]

parent2007 = parent2007[parentlist]

for i in ["w4p229", "w4p413"]:
    parent2007[i] = parent2007[i].apply(grade)

parent2007["grade_ask"] = parent2007["w4p229"] + parent2007["w4p413"]

for i in ["w4p234", "w4p414"]:
    parent2007[i] = parent2007[i].apply(degree)

parent2007["deg_ask"] = parent2007["w4p234"] + parent2007["w4p414"]

parent2007["w4p503"] = parent2007["w4p503"].apply(econ_stat)

for i in ["w4faedu", "w4moedu"]:
    parent2007[i] = parent2007[i].apply(degree2)


#後續追蹤資料

np2013list = ["stud_id", "teps_sex", "tepsb_sex", "np13v32v33_u", "np13v32v33_ud", "np13v52"]

np2013 = np2013[np2013list]

for i in ["teps_sex", "tepsb_sex"]:
    np2013[i] = np2013[i].apply(sex)

np2013["np13v32v33_u"] = np2013["np13v32v33_u"].apply(collage)

np2013["np13v32v33_ud"] = np2013["np13v32v33_ud"].apply(department)

departlist = ["edu", "libart", "sbl", "sci", "enger", "agri", "med", "serv", "else"]

for i in departlist:
    np2013[i] = 0

np2013.loc[np2013["np13v32v33_ud"] == 0, 'edu'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'libart'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 2, 'sbl'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 3, 'sci'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 4, 'enger'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 5, 'agri'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 6, 'med'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 7, 'serv'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 8, 'else'] = 1

departcomplist = ["educ", "sblc", "scic", "engerc", "agric", "medc", "servc", "elsec"]

for i in departcomplist:
    np2013[i] = None

np2013.loc[np2013["np13v32v33_ud"] == 0, 'educ'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'educ'] = 0

np2013.loc[np2013["np13v32v33_ud"] == 2, 'sblc'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'sblc'] = 0

np2013.loc[np2013["np13v32v33_ud"] == 3, 'scic'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'scic'] = 0

np2013.loc[np2013["np13v32v33_ud"] == 4, 'engerc'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'engerc'] = 0


np2013.loc[np2013["np13v32v33_ud"] == 5, 'agric'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'agric'] = 0

np2013.loc[np2013["np13v32v33_ud"] == 6, 'medc'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'medc'] = 0

np2013.loc[np2013["np13v32v33_ud"] == 7, 'servc'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'servc'] = 0

np2013.loc[np2013["np13v32v33_ud"] == 8, 'elsec'] = 1
np2013.loc[np2013["np13v32v33_ud"] == 1, 'elsec'] = 0


np2013["np13v52"] = np2013["np13v52"].apply(income)


#merge dataframe

finale = pd.merge(stu2007, parent2007)

finale = pd.merge(finale, np2013)

finale.to_csv("finale.csv", index=False)