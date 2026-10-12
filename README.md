# EvaluacionFinal 📦

Aplicación móvil hecha en **Flutter** para la asignatura **Computación Móvil** de Ingeniería en Informática, Universidad Mayor.

Permite iniciar sesión / registrarse con Firebase Authentication y administrar un listado de productos (listar, crear, editar y eliminar) consumiendo una API REST.

## Funcionalidades

- Login y registro de usuarios (Firebase Auth REST API).
- Menú de inicio con acceso a Productos, Categorías y Proveedores (estas dos últimas en construcción).
- Listado de productos en tarjetas, con recarga al deslizar hacia abajo.
- Crear, editar y eliminar productos (con confirmación antes de eliminar).
- Vista previa de la imagen al escribir la URL.
- Validación de formularios y mensajes de error en español.

## Tecnologías

| | |
|---|---|
| Framework | Flutter (Dart 3.10+) |
| Estado | `provider` |
| HTTP | `http` |
| Fuente | Poppins (Google Fonts, licencia OFL) |

## Estructura

```
lib/
├── assets/        imágenes y fuentes
├── helpers/       funciones de apoyo (formato de precio)
├── models/        modelo Product / Listado
├── providers/     estado de los formularios
├── routes/        rutas de la app
├── screens/       pantallas (login, home, productos)
├── services/      conexión con Firebase y la API de productos
├── themes/        colores y tema
├── ui/            estilos de los inputs
└── widgets/       componentes reutilizables
```


## Autor

Christian Carmona Mendoza — Ingeniería en Informática, Universidad Mayor.
