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
              "w4p234", "w4p235", "w4p229", "w4p413", "w4p414", "w4p415", "w4p503",
              "w4faedu", "w4moedu"]

parent2007 = parent2007[parentlist]

grade2007 = pd.read_csv("grade_2007_cpnp.csv", encoding="big5")

gradelist_drop = ["w4sumerr", "w4summis"]

grade2007 = grade2007.drop(gradelist_drop, axis=1)
