# codeChallengeYapeSwiftUI

## Descripción

codeChallengeYapeSwiftUI es una aplicación desarrollada en SwiftUI que utiliza Core Data como sistema de almacenamiento de datos y Combine como framework de persistencia. Esta aplicación está diseñada para Presnetar una lista de recetas las cuales se consumen desde un mock de un endpoint el cual se esta guardando en el viewmodel y este interactua con la vista segun las regals de mvvm.

![Ejemplo de MVVM en SwiftUI](https://blog.techchee.com/wp-content/uploads/2021/02/mvvm-swiftui-architecture.png)


## Características principales

- Utiliza SwiftUI para la interfaz de usuario.
- Gestiona los datos utilizando Core Data.
- Usa Combine para la persistencia de datos.

## Estructura del proyecto

El proyecto consta de varios archivos importantes que gestionan la lógica de la aplicación:

### DataLayer.swift

```swift
import Foundation
import Combine

class DataLayer {
    // Código relacionado con la capa de datos
}
```

### Uso de la aplicación
La aplicación consume datos de un servicio web mock proporcionado por la siguiente URL:

```swift
https://66340f2a9bb0df2359a0a1b3.mockapi.io/recetas
```
