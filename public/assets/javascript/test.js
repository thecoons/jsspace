var events, obj;

events = require("events");

obj = new events();

obj.on("dring", function() {
  return console.log("Ca sonne !!!!");
});

obj.emit("dring");
