import json

raw_data=open('history.json')

data=json.load(raw_data)

TypeList=list()
TypesList=list()
StationList=list()
StationsList=list()

print("Zug-Statistiken: ")

for dataset in data:    

    TypeList.append(dataset['type'])

for item in TypeList:
    if item not in TypesList:
        TypesList.append(item)

for searchfor in TypesList:
    
    print("Du bist",TypeList.count(searchfor),"mal mit ",searchfor, " gefahren")

print("Stations-Statistiken: ")

for dataset in data:    

    StationList.append(dataset['to_name'])

for item in StationList:
    if item not in StationsList:
        StationsList.append(item)

for searchfor in StationsList:
    
    print("Du bist",StationList.count(searchfor),"mal nach ",searchfor, " gefahren")
