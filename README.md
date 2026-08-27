# Verde

Aplicación Flutter de autenticación con pantallas de inicio de sesión y
registro, preparada para ejecutarse en web y adaptarse a ventanas estrechas.

## Implementación

- `Stack` para el fondo decorativo y los controles de contraseña.
- `Column` y `Row` para la composición vertical y los botones sociales.
- `Expanded` para repartir el ancho de los botones sociales.
- `Wrap` para el enlace inferior cuando el ancho es reducido.
- `SingleChildScrollView` y `ConstrainedBox` para evitar desbordamientos.
- Widgets extraídos para encabezados, formularios, campos y controles
  reutilizables.
- Tema y tokens de espaciado centralizados en `lib/ui/theme.dart`.

## Comprobación local

Desde la raíz del proyecto:

```text
flutter pub get
flutter analyze
flutter test
flutter build web
```

El último comando genera el artefacto desplegable en `build/web`.

## Evidencia de entrega

La comparación visual debe incluir la captura original junto a una captura de
la aplicación ejecutándose en web, idealmente con ambas al 50 % de opacidad
para comprobar la alineación de las cajas. La captura original no está
incluida en este repositorio; debe añadirse como material de la entrega cuando
se disponga de ella.

Para publicar el resultado, sirve `build/web` con GitHub Pages o Firebase
Hosting y añade aquí la URL pública correspondiente.
