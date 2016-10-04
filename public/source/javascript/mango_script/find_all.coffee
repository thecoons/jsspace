db = connect "mydb"
projection =
  _id: 0

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
