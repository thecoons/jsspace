# MongoDB Cheatsheet
## Commande `mongo`
|Méthode|Commentaire|
|-------|-----------|
|`connect(DB_NAME)`|Connexion à DB_NAME|
|`db.NOM_COLLECTION.insert(doc)`|Insert dans la collection NOM_COLLECTION le JSON `doc`|
|`db.NOM_COLLECTION.find(query,projection)`|Recherche dans la colleciton NOM_COLLECTION wia la requête `query` sur la projection `projection`|

## Operateurs logique
|Opérateur|Commentaire|
|---------|-----------|
|$gt|Supérieur à `x`, `{ $gt: 5 }`|
|$lt|Inférieur à `x`, `{ $ls: 3 }`|
|$in|Inclut dans un ensemble `E`, `{ $in: [1,2,3] }`|
|$gte|Supérieur ou égale à `x`|
|$lte|Inférieur ou égale à `x`|
|$ne|Différent de `x`|
|$nin|Non inclus dans l'ensemble `E`|
|$or|Disjonction de l'ensemble `E1` à `En`, `{ $or: [ {x:true}, {y:false}...] }`|
|$and|Intersection de l'ensemble `E1` à `En`|

### Insert document dans une collection
```coffeescript
db = connect "mydb"
list_db = db.adminCommand "listDatabases"

print "Avant insertion du doc ... "
printjson list_db

client =
  nom: "LaPelle"
  prenom: "Jean"

db.client.insert client

dbs = db.adminCommand "listDatabases"

print "Après insertion du doc ..."
printjson list_db

```
### Rechercher un document
```coffeescript
db = connect "mydb"
###
Projection sur le résultat de la requête
  ici, on demande touts les champs sauf _id
###
projection =
  _id: 0
###
Requête envoyé à la collection
  ici, on demande nom="Java" OU prenom="Jean"
###
query =
  $or: [
    {
      nom: "Java"
    },
    {
      prenom: "Jean"
    }
  ]

clients = db.client.find query, projection
clients.forEach (client) ->
  printjson client
```
