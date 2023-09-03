# NPNJVC_Pokedex

Este proyecto es una aplicacion Pokedex, consume la API creada en [Mockable](https://pokeapi.co/)  y muestra una lista de pokemones de 1ra Generacion mediante un TableView. Se visualizara un componente de busqueda, se podra ingresar el nombre del pokemon en interes y se realizara la filtracion de la data de la tabla, cuándo es seleccionando un pokemon de la celda, se muestra un detalle con más información sobre el pokemon.


## Requisitos de ejecucion

-   Xcode 14.1 or later
-   iOS 14.0 or later
-   OS X v13.3.1 
-   Apple Swift Packages

Clonar o descargar el repositorio y realizar lo siguiente:

 ``` text 
1. Doble click a NPNJVC_Pokedex.xcodeproj
2. File >> Packages >> Resolve Package Versions
3. Run Proyecto

``` 

## Proyecto

Arquitectura y librerias que se utilizaron:

- Swift
- VIPER
- KingFisher
- UIImageColors
  
## JSON 
Response para consumir el REST/JSON

    {
      "count": 1281,
      "next": "https://pokeapi.co/",
      "previous": null,
      "results": [
        {
        "name": "pidgeot",
        "url": "https://pokeapi.co/"
        },
        {
        "name": "rattata",
        "url": "https://pokeapi.co/"
        },
        {
        "name": "raticate",
        "url": "https://pokeapi.co/"
        }
      ]
    }

## Imagenes  
  
<p align="center">      
 <img width="500" height="450" alt="challenge" src="https://drive.google.com/uc?export=view&id=15ZGgdFAyj1Lpq7M93vx-6QbG7KI6RJjt"/>
 </p>
