db = connect "mydb"
list_db = db.adminCommand "listDatabases"

print "Avant insertion du doc ... "
printjson list_db

client1 =
  nom: "Rails"
  prenom: "Jean"

client2 =
  nom: "Node"
  prenom: "Marc"

client3 =
  nom: "Java"
  prenom: "Antoine"

db.client.insert client1
db.client.insert client2
db.client.insert client3

dbs = db.adminCommand "listDatabases"

print "Après insertion du doc ..."
printjson list_db
