import json

raw_data=open('history.json')

data=json.load(raw_data)

TypeListRaw=list()
TypeListSorted=list()
StationListRaw=list()
StationListSorted=list()

CommuteRouteStation1=""
CommuteRouteStation2=""

HomeStationList=[""]

homecounter=0
commutecounter=0

print("Zug-Statistiken: ")

for dataset in data:    
	
	TypeListRaw.append(dataset['type'])
	if dataset['to_name'] == CommuteRouteStation1 and dataset['from_name'] == CommuteRouteStation2:
		commutecounter = commutecounter + 1
	elif dataset['to_name'] == CommuteRouteStation2 and dataset['from_name'] == CommuteRouteStation1:
		commutecounter = commutecounter + 1

for item in TypeListRaw:
    if item not in TypeListSorted:
        TypeListSorted.append(item)

for searchfor in TypeListSorted:
    
    print("Du bist",TypeListRaw.count(searchfor),"mal mit ",searchfor, " gefahren")

print("Stations-Statistiken: ")

for dataset in data:    

    StationListRaw.append(dataset['to_name'])

for item in StationListRaw:
    if item not in StationListSorted:
        StationListSorted.append(item)

for searchfor in StationListSorted:
    
    print("Du bist",StationListRaw.count(searchfor),"mal nach ",searchfor, " gefahren")


for searchfor in StationListRaw:
	if searchfor in HomeStationList:
		homecounter=homecounter+1

print("Du bist",homecounter,"mal nach Hause gefahren")

print("Du bist",commutecounter,"mal deine Stammstrecke gefahren")
