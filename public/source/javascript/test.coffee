events = require "events"
obj = new events()
obj.on "dring", ->
  console.log "Ca sonne !!!!"

obj.emit("dring")
