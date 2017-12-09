### JSON

JSON.parse() para convertir texto en un objeto JavaScript
```javascript
var obj = JSON.parse('{ "name":"John", "age":30, "city":"New York"}');
```

### HTTPS

Enviar a https si la solicitud no lo es.
```javascript
if(window.location.protocol != 'https:') {
       location.href =   location.href.replace("http://", "https://");
    }
```
