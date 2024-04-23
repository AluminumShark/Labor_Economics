import numpy as np
import pandas as pd
from sklearn.preprocessing import LabelEncoder

stu2007 = pd.read_csv("stu_2007_cpnp.csv", encoding="big5")

stulist = ["stud_id", "w4pgrm", "w4priv", "w4urban3",
           "w4nright", "w4all3p", "w4all3ps", "w4cfree", "w4cf3p", "w4cf3ps", "w4math",
           "w4m3p", "w4m3ps", "w3w4plus", "w3w4minus", "w4link", "w4illp",
           "w1s502",
           "w4s1081", "w4s1082", "w4s1083", "w4s1084",
           "w4s1085", "w4s1086", "w4s1134", "w4s1135",
           "w4s1136", "w4s1144", "w4s1145", "w4s1146",
           "w4s1151", "w4s1152", "w4s1153", "w4s1154",
           "w4s1155", "w4s1156", "w4s120", "w4s121",
           "w4s122", "w4s123", "w4s124", "w4s125", "w4s126", "w4s127",
           "w4s1281", "w4s1282", "w4s1283", "w4s1284", "w4s1285",
           "w4s1286", "w4s1291", "w4s1292","w4s1293", "w4s1294",
           "w4s1295", "w4s1301", "w4s1302", "w4s1303", "w4s1304",
           "w4s1305", "w4s1306", "w4s409", 
           "w4s410" , "w4s411", "w4s415", "w4s416",
           "w4s417", "w4s418"]

stu2007 = stu2007[stulist]

parent2007 = pd.read_csv("parent_2007_cpnp.csv", encoding="big5")

parentlist = ["stud_id", "w4p101", "w4p102", "w4p103",
              "w4p234", "w4p235", "w4p229", "w4p413", "w4p414", "w4p415",
              "w4faedu", "w4fahlth", "w4moedu", "w4mohlth"]

parent2007 = parent2007[parentlist]

grade2007 = pd.read_csv("grade_2007_cpnp.csv", encoding="big5")

gradelist = ["w4sumerr", "w4summis"]

grade2007 = grade2007.drop(gradelist, axis=1)

year2009 = pd.read_csv("cp2009.csv", encoding="big5")

year2013 = pd.read_csv("cp2013.csv", encoding="big5")

#year2014 = pd.read_csv("cp2014.csv", encoding="big5")

year2019 = pd.read_csv("cp2019.csv", encoding="big5")

datalist = [stu2007, parent2007, grade2007, year2009, year2013, year2019]

for i in datalist:
    i.replace("未填答", None)
    i.replace("不合理值", None)

label = LabelEncoder()

for i in stu2007.columns:
    stu2007[i] = label.fit_transform(stu2007[i])

for i in parent2007.columns:
    parent2007[i] = label.fit_transform(parent2007[i])

for i in grade2007.columns:
    grade2007[i] = label.fit_transform(grade2007[i])

year2007 = pd.merge(stu2007, grade2007)
year2007 = pd.merge(year2007, parent2007)

varlist2009 = ["stud_id", "cp09v08_u", "cp09v08_ud", "cp09v23"]

varlist2013 = ["stud_id", "cp13v32v33_u", "cp13v32v33_ud", "cp13v62"]

#varlist2014 = ["stud_id", ]

varlist2019 = ["stud_id", "cp19v33v34", "cp19v33v34_u", "cp19v33v34_ud", "cp19v33v34_u_x", "cp19v33v34_ud_x", "cp19v78", "cp19v78_x", "cp19v78_k_x",
               "cp19v66"]

year2009 = year2009[varlist2009]
year2013 = year2013[varlist2013]
year2019 = year2019[varlist2019]
    

def na_trans(col):
    if col in [96, 97, 98, 99]:
        col = None
    return col

for i in [year2009, year2013, year2019]:
    for j in i.columns:
        i[j] = i[j].apply(na_trans)

finale = pd.merge(year2007, year2009)
finale = pd.merge(finale, year2013)
finale = pd.merge(finale, year2019)

finale["collage"] = finale["cp19v33v34_u_x"].fillna(finale["cp19v33v34_u"])

finale["collage"] = finale["collage"].fillna(finale["cp13v32v33_u"])

finale["collage"] = finale["collage"].fillna(finale["cp09v08_u"])

finale["department"] = finale["cp19v33v34_ud_x"].fillna(finale["cp19v33v34_ud"])

finale["department"] = finale["department"].fillna(finale["cp13v32v33_ud"])

finale["department"] = finale["department"].fillna(finale["cp09v08_u"])

finale["salary1"] = finale["cp19v78"].fillna(finale["cp19v78_x"])

finale["salary1"] = finale["salary1"].fillna(finale["cp13v62"])

finale["salary1"] = finale["salary1"].fillna(finale["cp09v23"])

finale["salary1"] = finale["salary1"].fillna(finale["cp19v66"])

finale["salary2"] = finale["cp19v66"]

"""
def count_money(col):
    if col == 1:
        col = 0
    elif col == 2:
        col = 5000
    elif col == 3:
        col = 12500
    elif col == 4:
        col = 17500
    elif col == 5:
        col = 22500
    elif col == 6:
        col = 27500
    elif col == 7:
        col = 32500
    elif col == 8:
        col = 37500
    elif col == 9:
        col = 42500
    elif col == 10 :
        col = 47500
    elif col == 11:
        col = 52500
    elif col == 12:
        col = 57500
    elif col == 13:
        col = 62500
    elif col == 14:
        col = 67500
    elif col == 15:
        col = 72500
    elif col == 16:
        col = 77500
    elif col == 17:
        col = 82500
    elif col == 18:
        col = 87500
    elif col == 19:
        col = 92500
    elif col == 20:
        col = 97500
    elif col == 21:
        col = 120000
    else:
        col = None
    return col

finale["salary1"] = finale["salary1"].apply(count_money)

finale["salary2"] = finale["salary2"].apply(count_money)

"""

deplist = ['edu', 'libart', 'social', 'sci', 'enger', 'farm', 'med_sw', 'serv', 'els']

for col in deplist:
    finale[col] = 0

# Replace values with 1 based on 'department'
finale.loc[finale['department'] == 1, 'edu'] = 1
finale.loc[finale['department'] == 2, 'libart'] = 1
finale.loc[finale['department'] == 3, 'social'] = 1
finale.loc[finale['department'] == 4, 'sci'] = 1
finale.loc[finale['department'] == 5, 'enger'] = 1
finale.loc[finale['department'] == 6, 'farm'] = 1
finale.loc[finale['department'] == 7, 'med_sw'] = 1
finale.loc[finale['department'] == 8, 'serv'] = 1
finale.loc[finale['department'] == 9, 'els'] = 1

finale["stem"] = 0

finale.loc[finale['department'] == 4, 'stem'] = 1
finale.loc[finale['department'] == 5, 'stem'] = 1

finale['sex'] = finale['w1s502']

finale.to_csv("finale.csv", index=False)