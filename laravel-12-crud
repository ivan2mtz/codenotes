## Rutas
```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EjemploController;
use App\Http\Controllers\ProductosController;
use App\Http\Controllers\ProductoController;
 
Route::get('/vista', [EjemploController::class, 'vista']);
Route::get('/texto', [EjemploController::class, 'texto']);
Route::get('/json', [EjemploController::class, 'json']);

Route::get('/productos', [ProductosController::class, 'index']);

Route::resource('producto', ProductoController::class);

Route::get('/busqueda', [ProductoController::class, 'busqueda']);
Route::post('/busqueda', [ProductoController::class, 'buscar']);

Route::get('/', function () {
    return view('hola');
});
```

## Modelo
```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $table = 'productos';
}
```

## Controller
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use App\Models\Producto;
use Illuminate\Support\Facades\DB;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $productos = Producto::all();
        // return view('producto.index', [
        //     'productos' => $productos
        // ]);

        return view('producto.index', [
            'productos' => DB::table('productos')->paginate(10)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('producto.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'sku' => 'required|unique:productos|max:50',
            'nombre' => 'required|max:250',
            'marca' => 'required|max:100',
            'precio' => 'required|decimal:0,2'
        ]);

        $obj = new Producto();
        $obj->sku = $request->input('sku');
        $obj->nombre = $request->input('nombre');
        $obj->marca = $request->input('marca');
        $obj->precio = $request->input('precio');
        $obj->save();
        return redirect('/producto')->with('status', 'Producto creado.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $obj = Producto::find($id);
        return view('producto.show', ['producto' => $obj]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $obj = Producto::find($id);
        return view('producto.edit', ['producto' => $obj]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
         $validated = $request->validate([
            'sku' => 'required|max:50',
            'nombre' => 'required|max:250',
            'marca' => 'required|max:100',
            'precio' => 'required|decimal:0,2'
        ]);

        $obj = Producto::find($id);
        $obj->sku = $request->input('sku');
        $obj->nombre = $request->input('nombre');
        $obj->marca = $request->input('marca');
        $obj->precio = $request->input('precio');
        $obj->save();
        return redirect('/producto')->with('status', 'Producto editado.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $obj = Producto::find($id);
        $obj->delete();
        return redirect('/producto')->with('status', 'Producto eliminado.');
    }

    public function busqueda()
    {
        return view('producto.busqueda');
    }

    public function buscar(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|min:2',
            'tipo' => 'required|int'
        ]);

        $tipo = intval( $request->input('tipo'));

        if($tipo == 1) {
            $productos =  DB::select("SELECT * FROM productos WHERE nombre LIKE :bus ", ['bus' => '%'.$request->input('nombre').'%']);
        } else {
            $productos =  DB::select("SELECT * FROM productos WHERE marca LIKE :bus ", ['bus' => '%'.$request->input('nombre').'%']);
        }

        return view('producto.busqueda', [
            'productos' => $productos
        ]);
    }
}

```

## Layout View
```php
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mi empresa - @yield('title')</title>
    <link href="{{ url('/css/bootstrap.min.css'); }}" rel="stylesheet" >
  </head>
  <body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Mi Empresa</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="{{ url('/') }}">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ url('/producto') }}">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ url('/busqueda') }}">Búsqueda</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                     @yield('content')
                </div>
            </div>
        </div>
    </main>

    <footer class="text-center py-3 mt-auto">
        <div class="container-fluid">
            <p>&copy; 2025 Mi Empresa. Todos los derechos reservados.</p>
        </div>
    </footer>
    
    <script src="{{ url('js/bootstrap.bundle.min.js'); }}"></script>
  </body>
</html>
```
### busqueda
```php
@extends('layouts.app')
 
@section('title', 'Curso Laravel')
 
@section('content')
    
<div class="card my-3">
    <div class="card-header">Búsqueda</div>
    <div class="card-body">
    
    <form action="{{ url('/busqueda') }}" method="POST">
    @csrf
        <table class="table table-bordered table-sm">
            <tbody>
                <tr>
                    <th class="text-end px-3">
                        <select class="form-select form-select-sm" name="tipo">
                            <option value="1">NOMBRE</option>
                            <option value="2">MARCA</option>
                        </select>
                    </th>
                    <td>
                        <input type="text" class="form-control form-control-sm @error('nombre') is-invalid @enderror" id="nombre" name="nombre" maxlength="250" value="{{ old('nombre') }}" required autocomplete="off" autofocus>
                    </td>
                    <td>
                        <button type="submit" class="btn btn-success btn-sm">Buscar</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>

    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    </div>
</div>

@if(isset($productos))
<div class="card">
    <div class="card-header">
        Resultados
    </div>
    <div class="card-body">
        <table class="table table-bordered table-sm">
            <thead>
                <tr>
                    <th class="text-center">SKU</th>
                    <th class="text-center">NOMBRE</th>
                    <th class="text-center">MARCA</th>
                    <th class="text-center">PRECIO</th>
                </tr>
            </thead>
            <tbody>
            @foreach ($productos as $item)
                <tr>
                    <td>{{ $item->sku }}</td>
                    <td>{{ $item->nombre }}</td>
                    <td>{{ $item->marca }}</td>
                    <td class="text-end">{{ number_format($item->precio,2) }}</td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>
@endif

@endsection
```

### create
```php
@extends('layouts.app')
 
@section('title', 'Vista')
 
@section('content')

<div class="card my-3">
    <div class="card-header">Crear producto</div>
    <div class="card-body">

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form action="{{ url('/producto') }}" method="POST">
    @csrf
  <div class="mb-3">
    <label for="sku" class="form-label">SKU</label>
    <input type="text" class="form-control @error('sku') is-invalid @enderror" id="sku" name="sku" maxlength="100" value="{{ old('sku') }}" required autocomplete="off">
  </div>
  <div class="mb-3">
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" class="form-control @error('nombre') is-invalid @enderror" id="nombre" name="nombre" maxlength="250" value="{{ old('nombre') }}" required autocomplete="off">
  </div>
  <div class="mb-3">
    <label for="marca" class="form-label">Marca</label>
    <input type="text" class="form-control @error('marca') is-invalid @enderror" id="marca" name="marca" maxlength="150" value="{{ old('marca') }}" required autocomplete="off">
  </div>
  <div class="mb-3">
    <label for="precio" class="form-label">Precio</label>
    <input type="number" class="form-control @error('precio') is-invalid @enderror" id="precio" name="precio" step="0.01" min="0" value="{{ old('precio') }}" required autocomplete="off">
  </div>
  <button type="submit" class="btn btn-primary">Guardar Producto</button>
</form>

</div>
</div>

@endsection
```

### edit
```php
@extends('layouts.app')
 
@section('title', 'Vista')
 
@section('content')
<div class="card my-3">
    <div class="card-header">Editar producto</div>
    <div class="card-body">

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form action="{{ url('/producto/'.$producto->id) }}" method="POST">
    @csrf
    @method('PUT')
    <input type="hidden" value="{{ $producto->id }}"></input autocomplete="off">
  <div class="mb-3">
    <label for="sku" class="form-label">SKU</label>
    <input type="text" class="form-control @error('sku') is-invalid @enderror" id="sku" name="sku" maxlength="100" value="{{ $producto->sku }}" required autocomplete="off">
  </div>
  <div class="mb-3">
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" class="form-control @error('nombre') is-invalid @enderror" id="nombre" name="nombre" maxlength="250" value="{{ $producto->nombre }}" required autocomplete="off">
  </div>
  <div class="mb-3">
    <label for="marca" class="form-label">Marca</label>
    <input type="text" class="form-control @error('marca') is-invalid @enderror" id="marca" name="marca" maxlength="150" value="{{ $producto->marca }}" required autocomplete="off">
  </div>
  <div class="mb-3">
    <label for="precio" class="form-label">Precio</label>
    <input type="number" class="form-control @error('precio') is-invalid @enderror" id="precio" name="precio" step="0.01" min="0" value="{{ $producto->precio }}" required autocomplete="off">
  </div>
  <button type="submit" class="btn btn-primary">Guardar Producto</button>
</form>

</div>
</div>

<div class="card my-3">
  <div class="card-header"><h5>¿Esta seguro de eliminar el registro?</h5></div>
  <div class="card-body">
    <form action="{{ url('/producto/'.$producto->id) }}" method="POST">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger">Eliminar</button>
    </form>
  </div>
</div>

@endsection
```

### index
```php
@extends('layouts.app')
 
@section('title', 'Lista de productos')
 
@section('content')
    
<div class="card my-3">
  <div class="card-header">

    <div class="d-flex justify-content-between align-items-center">
    <p class="mb-0">Productos</p>

    <a class="btn btn-sm btn-primary" href="{{ url('/producto/create');}}">Agregar</a>
</div>

  </div>
  <div class="card-body">
    
    
    @if (session('status'))
    <div class="alert alert-success">
        {{ session('status') }}
    </div>
    @endif
    <table class="table table-bordered table-sm">
        <thead>
            <tr>
                <th class="text-center">SKU</th>
                <th class="text-center">NOMBRE</th>
                <th class="text-center">MARCA</th>
                <th class="text-center">PRECIO</th>
                <th class="text-center">ACCIONES</th>
            </tr>
        </thead>
        <tbody>
        @foreach ($productos as $item)
            <tr>
                <td>{{ $item->sku }}</td>
                <td>{{ $item->nombre }}</td>
                <td>{{ $item->marca }}</td>
                <td class="text-end">{{ number_format($item->precio,2) }}</td>
                <td class="text-center">
                    <a class="btn btn-sm btn-secondary" href="{{ url('/producto/'.$item->id);}}">Ver</a>
                    <a class="btn btn-sm btn-warning" href="{{ url('/producto/'.$item->id.'/edit');}}">Editar</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>

    {{ $productos->links() }}

    </div>
</div>

@endsection
```

### show
```php
@extends('layouts.app')
 
@section('title', 'Vista')
 
@section('content')
    
<div class="card my-3">
  <div class="card-header">Mostrar registro</div>
  <div class="card-body">
    <table class="table">
      <tbody>
        <tr>
          <th scope="row">SKU</th>
          <td>{{  $producto->sku }}</td>
        </tr>
        <tr>
          <th scope="row">NOMBRE</th>
          <td>{{  $producto->nombre }}</td>
        </tr>
        <tr>
          <th scope="row">MARCA</th>
          <td>{{  $producto->marca }}</td>
        </tr>
        <tr>
          <th scope="row">PRECIO</th>
          <td>{{  $producto->precio }}</td>
        </tr>
      </tbody>
    </table>
    <a class="btn btn-primary" href="{{ url('/producto');}}">Regresar</a>

  </div>
</div>

@endsection
```


