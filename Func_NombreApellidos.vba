Function NombreApellidos(NombreCompuesto As String)
Dim aApellido() As String, N_Apellido As String

'separamos las partes de los apellidos
aApellido = Split(NombreCompuesto, " ")

'recorremos cada palabra...
For elto = 0 To UBound(aApellido)
    'homogeneizamos todo en minúscula
    Select Case LCase(aApellido(elto))
        Case "de", "del", "el", "la", "las", "los", "san", "y"
            N_Apellido = N_Apellido & aApellido(elto) & " "
        Case Else
            'si es la última parte del apellido
            If elto = UBound(aApellido) Then
                'no añadimos ningún separador al final.
                N_Apellido = N_Apellido & aApellido(elto)
            Else
                'en caso contrario añadimos una barra vertical |
                N_Apellido = N_Apellido & aApellido(elto) & "|"
        End If
    End Select
Next elto

'contamos partes del nombre
Dim nNombreCompleto() As String
Dim NombreFinal() As String
Dim partes As Integer, Apellido As String

'Obtenemos una matriz con las partes descompuestas
nNombreCompleto = Split(N_Apellido, "|")
'conteo de las partes del Nombre y Apellidos descompuesto
'debe ser mínimo 3 partes := Nombre + Apellido1 + Apellido2
'pero podría devolvernos 4 partes o más en caso de Nombre compuesto!
partes = UBound(nNombreCompleto) + 1

'Recomponemos Nombre y Apellidos
ReDim NombreFinal(0 To partes) As String
If partes > 3 Then  'esto nos indica que el Nombre es Compuesto!
    'Juntamos las dos primeras partes como un único elemento
    'Validar la posición del nombre a separar cambiar a 0 y 1 y si los nombres adelante o 2 y 3 si los nombres atras
    NombreFinal(0) = nNombreCompleto(2) & " " & nNombreCompleto(3)
    contador = 1
    'el resto los cargamos tal cual...
    For x = 0 To UBound(nNombreCompleto) - 1
        NombreFinal(contador) = nNombreCompleto(x)
        contador = contador + 1
    Next x
Else    'si el Nombre NO es compuesto
    'cargamos uno a uno las partes del nombre
    For x = 0 To UBound(nNombreCompleto)
        NombreFinal(contador) = nNombreCompleto(x)
        contador = contador + 1
    Next x
End If
'devolvemos el nombre completo a la funcion
'OJO!! EJECUTARLA MATRICIALMENTE PARA OBTENER EN CADA CELDA EL DATO CORRESPONDIENTE!!
NombreApellidos = NombreFinal
End Function
