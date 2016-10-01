# Cheatsheet Node.js
Courage mon petit, c'est en forgent qu'on devient forgeron.

## Import de module
### Require
Utilisation de `require()` pour l'import des modules.

```js
/* main.js */
var mod = require("./package")

mod.dosomething()
```

```js
/* package/index.js */
var a = require("./module_1.js")
var b = require("./module_2.js")
console.log("Tout les modules de package sont chargés.")
```
```js
/* module_1/2.js */
 console.log("module_x chargé...")
```

### Point d'entrée
Pour modifier la selection de `index.js` par défault, on creer le fichier `./package/package.json`, qui contient la référence du choix par défaut dans le paramêtre `main`.

```js
{
  main:'autrechosequeindex.js'
}
```
### Node module
Pour include les modules node on spécifie uniquement leurs noms

```js
require=("module_node")
```
### Exporter des fonctions de module
Pour exploiter les fonctions d'un module dans le script qui l'importe on va spécifier son exportation.
```js
/* module.js */
add = function(a,b){
  return a+b
}

module.exports.add = add
```

```js
/* index.js */
math = require('./module')
console.log(math.add(1,2))
// => 3

```
On peu définir une fonciton principal pour des facilité d'écriture. Mais attention il ne peu y avoir qu'une fonction principale par module !
```js
/* module.js */
add = function(a,b){
  return a+b
}

module.exports = add
```

```js
/* index.js */
math = require('./module')
console.log(math(1,2))
// => 3
```
### Structure module
Si on ajoute on examine la structure d'une instance de module on obtient

```js
/* module.js */
add = function(a,b){
  return a+b
}

module.exports = add

console.log(module)
```

```js
/* Structure de module.js*/
Module {
  id: '/home/thecoon/workspace/jsspace/public/assets/javascript/module.js',
  exports: { add: [Function] },
  parent:
   Module {
     id: '.',
     exports: {},
     parent: null,
     filename: '/home/thecoon/workspace/jsspace/public/assets/javascript/test.js',
     loaded: false,
     children: [ [Circular] ],
     paths:
      [ '/home/thecoon/workspace/jsspace/public/assets/javascript/node_modules',
        '/home/thecoon/workspace/jsspace/public/assets/node_modules',
        '/home/thecoon/workspace/jsspace/public/node_modules',
        '/home/thecoon/workspace/jsspace/node_modules',
        '/home/thecoon/workspace/node_modules',
        '/home/thecoon/node_modules',
        '/home/node_modules',
        '/node_modules' ] },
  filename: '/home/thecoon/workspace/jsspace/public/assets/javascript/module.js',
  loaded: false,
  children: [],
  paths:
   [ '/home/thecoon/workspace/jsspace/public/assets/javascript/node_modules',
     '/home/thecoon/workspace/jsspace/public/assets/node_modules',
     '/home/thecoon/workspace/jsspace/public/node_modules',
     '/home/thecoon/workspace/jsspace/node_modules',
     '/home/thecoon/workspace/node_modules',
     '/home/thecoon/node_modules',
     '/home/node_modules',
     '/node_modules' ] }
```

### Structure package.json


Le fichier `package.json` sert de configuration à l'application Node. Il permet une gestion des dépendences et leurs version. Un caractère `*` en version d'une dépendence prendra la plus récente.Ce fichier fait la passerelle pour `npm`.

```js
{
  "name": "jsspace",
  "version": "1.0.0",
  "description": "Workspace for training my javascript knowedge",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node ./public/assets/javascript/test.js"
  },
  "author": "ElCoon",
  "license": "ISC",
  "devDependencies": {
    "coffee-script": "^1.11.0",
    "colors": "^1.1.2",
    "gulp": "^3.9.1",
    "gulp-coffee": "^2.3.2",
    "gulp-util": "^3.0.7"
  }
}

```
