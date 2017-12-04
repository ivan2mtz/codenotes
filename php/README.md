### String

strtoupper() - convertir un string en mayusculas

strtolower() - convertir un string en minusculas

ucwords() - convierte a mayuscula la primera letra de cada palabra de un string.

ucfirst() - convierte la primera letra a mayuscula.

Quitar los caracteres raros para mostrar el string en HTML. 
```php
preg_replace('~[\r\n]+~', '', nl2br($str));
```

### Array

Convertir un array en un string separado por comas

```php
$resultado = implode (",", $arr);
```

### JSON

json_decode($str) y json_encode($arr)

### Files
```php
file_exists($dir)
mkdir($dir, 0755, true)
$fp = fopen($ruta_archivo, 'w+');
fwrite($fp, $str);
fclose($fp);
```
