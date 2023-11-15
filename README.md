# Coppel-App

El siguiente proyecto está destinado para simular algunos módulos de la aplicación de Coppel.

# Splash
Se realiza una validación en este punto para determinar si se inicia la app correctamente dado la versión de la aplicación
## Given
Se inicia la app
## WHEN
Se muestra el Splash de la app
## THEN
Se valida la versión de la app instalada con la de un servicio remoto que tendrá la versión actual
## AND
Si es la versión correcta se inicia correctamente, de lo contrario no deja iniciar y se queda en el Splash con una advertencia


# Log In
La pantalla del login utiliza el acceso vía Firebase Authentication para poder iniciar sesión en la aplicación y poder visualizar las opciones disponibles.
## GIVEN 
Tengo la app iniciada
## WHEN
Accedo al log in de la aplicación
## THEN
Veo los campos de email y contraseña, ingreso los datos correspondientes
## AND
Logro acceder al Home de la aplicación

# HomeView
La pantalla principal mopstrará componentes de las categorías, más vendidos y marcas disponibles en la venta de telefonía.
## GIVEN
Inicia la aplicación
## WHEN
Se cargan los componentes
## THEN
Se realiza una consulta a Fireabse para obtener los datos de las Categorias, Los más vendidos y Marcas, para posteriormente poder mostrar esa información en los componentes correspondientes
## AND
Se muestran las categorías disponibles, los teléfonos más vendidos y las marcas disponibles en la aplicación.
