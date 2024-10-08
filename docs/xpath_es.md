# ¿Qué es XPath?
XPath es una sintaxis utilizada en XSLT, XQuery y otros lenguages para navegar por documentos XML y generar "resultados". Por ejemplo, se puede usar para extraer subárboles, manipular datos o contar elementos.

# Tipos de nodos
- Nodo de documento (se accede con `/` para leer el documento)
- Nodo raíz (`TEI`)
- Nodos de elementos (`opener`, `closer`, `persName`)
- Nodos de atributos (`@ref`, `@type`)
- Nodos de texto (`text()`)

# Navegación en XPath
- Un paso de localización consta de una especificación de eje, la prueba del nodo y, posiblemente, un predicado: `//rs[@type='person']`

![Ejes de XPath](xpath-axis.gif)


# Navegación en XPath
- Navega por los ejes `child::` y `descendant::`
- Prueba los ejes `preceding` y `preceding-sibling`. (Existen equivalentes "following" para ambos)
- Aplica predicados como filtros booleanos usando `[. . .]`
- Observa las funciones de XPath:
    - `normalize-space()`
    - `count()`
    - `distinct-values()`
    - Diferentes estilos de escribir estas expresiones: anidación (XPath 2) vs. **simple-map**: `!` y operador de flecha: `=>` (XPath 3)
        - `//*/normalize-space()` (XPath 2) vs. `//* ! normalize-space()` (XPath 3) significan lo mismo.
        - Nodo `text()` vs. `//string()` y una discusión "profunda" sobre lo que hace `normalize-space()`
        - Operaciones básicas de matemáticas y aritmética

# Expresiones XPath para el taller

- ¿Qué XPath encontraría los párrafos en el archivo?
- ¿Qué XPath encontraría solo los párrafos dentro del cuerpo?
- ¿Qué XPath identifica solo el elemento \<persName\> dentro del \<closer\>?   
- ¿Qué XPath encontraría el nombre del remitente?

## Para cartas con nombres codificados
- ¿Qué XPath encontrará todos los nombres de personas codificados en la carta? 
- ¿Cuántos hay?
- ¿Qué XPath encontrará los valores del atributo @ref en los elementos \<persName\>?
- ¿Qué función encontrará los valores de atributos distintos?

## Para cartas con partes del discurso codificadas (Las siguientes preguntas solo aplican al documento **es_P54000-TEIP5.xml**):
Escribe expresiones XPath para aislar diferentes partes del discurso, trabajando cuidadosamente con expresiones de predicado. 
- ¿Qué XPath encontrará todos los sustantivos (pos='N')?
- ¿Cuántos hay?
- ¿Qué XPath encontrará todos los sustantivos que están precedidos directamente por un determinante (pos='D')?

## Enlaces

* [Funciones y Operadores de XPath y XQuery 3.1](https://www.w3.org/TR/xpath-functions-31/)
* Artículo de Wikipedia ["XPath"](https://es.wikipedia.org/wiki/XPath)
