# Taller de Lenguajes Formales y Compiladores

Implementación en Haskell de un intérprete para un lenguaje similar al Lenguaje Imperativo Simple con Input y Output visto en la materia.

## Diferencias con el lenguaje de la materia

### Los estados no son funciones totales. 

En vez de esto son funciones parciales y están implementados usando Maps de Haskell.

Debido a esto hacemos uso del built-in `error` cuando se hace referencia a una variable que no fue asignada:

```haskell
evalState :: State -> Syntax.Identifier -> Int
evalState state var = fromMaybe (error $ "Variable " ++ var ++ " not defined") $ Map.lookup var state

```

### No hay error handling

Al no haber manejo de errores, una vez que la evaluación de una expresión resulta en un error la ejecución termina.

## Cómo correr un programa de ejemplo:

Es necesario tener instalado Cabal para correr el programa en Main.hs, que ejecuta el intérprete sobre programa de prueba.

Para ejecutarlo, correr `cabal run` desde el root dir del repositorio.

El programa de prueba recibe un valor entero como input por consola y luego imprime ese número y todos los anteriores hasta llegar a 0.
