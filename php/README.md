### String

strtoupper() - convertir un string en mayusculas

strtolower() - convertir un string en minusculas

ucwords() - convierte a mayuscula la primera letra de cada palabra de un string.

ucfirst() - convierte la primera letra a mayuscula.

strlen() - obtiene la longitud de un string

Quitar los caracteres raros para mostrar el string en HTML. 
```php
preg_replace('~[\r\n]+~', '', nl2br($str));
```

### Array

Convertir un array en un string separado por comas

```php
$resultado = implode (",", $arr);
```

Inserta uno o mas elementos al final de un array

```php
array_push($arr, $item);
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

$str = file_get_contents($ruta_archivo); // Regresa el contenido de un archivo como string
```
