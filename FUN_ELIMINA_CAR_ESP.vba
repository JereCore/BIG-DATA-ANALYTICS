Public Function LIMPIAR_TEXTO(ByVal vThisRange As Range)
Dim MiTexto As String
Dim i As Long
MiTexto = vThisRange.Value

'<<<<<LISTA ASCII PERMITIDA >>>>
'48 TO 57 SSon números del 0 al 9
'65 to 90 son letras del alfabeto anglosajón, en mayúsculas, A-Z
'97 to 122 son letras del alfabeto anflosajón, en minúsculas, a-z
'164 to 165 la letra Ñ en mayúscula y minúscula
'32 es el espacio
'<<<<<<<<<<<<<>>>>>>>>>>>>>>>>

For i = 1 To Len(MiTexto)
    Select Case Asc(Mid(MiTexto, i, 1)) 'Sacar código Ascii de cada carácter
        Case 48 To 57, 65 To 90, 97 To 122, 164 To 165, 32
            LIMPIAR_TEXTO = LIMPIAR_TEXTO & Mid(MiTexto, i, 1)
        Case Else
            'no hacemos nada, que lo ignore
    End Select
Next i

End Function
