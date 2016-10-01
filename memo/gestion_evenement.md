# Cheatsheet Node.js
Qui veux, peux !

## Gestion des evenements
En Node, tout est monothread. Du coup tout est question de gestion d'événement. C'est la classe `events.EventEmitter` qui s'en occupe.

```js
var events = require('events')
var obj = new events.EventEmitter()
console.log(obj)
```
```js
EventEmitter {
  domain: null,
  _events: {},
  _eventsCount: 0,
  _maxListeners: undefined }

```
