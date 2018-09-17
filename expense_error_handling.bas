Attribute VB_Name = "expense_error_handling"
Option Explicit

Sub main()
    Dim UpperLeftOfCheckReigion As Range
    Dim EmployeeID, DateOfCost, KindOfCost, DetailOfCost, ValueOfCost As Integer

    '複数行に精算項目が渡る場合、ループしてチェックを行うので、
    'ループ回数を制御するために、指定のカラムのセルを基準にしている
    Set UpperLeftOfCheckReigion = Range("A1")
    
    'カラム番号、Ａカラム = 1
    EmployeeID = 1
    DateOfCost = 2
    KindOfCost = 3
    DetailOfCost = 4
    ValueOfCost = 5
    
    Dim i As Integer
    
    For i = UpperLeftOfCheckReigion.Row To Cells(Rows.Count, UpperLeftOfCheckReigion.Columns).End(xlUp).Row
        If checkEmployeeID(Cells(i, EmployeeID)) = True Then
            MsgBox "Error: 社員番号"
            Exit Sub
        End If
        If checkDateOfCost(Cells(i, DateOfCost)) = True Then
            MsgBox "Error: 発生日"
            Exit Sub
        End If
        If checkKindOfCost(Cells(i, KindOfCost)) = True Then
            MsgBox "Error: 種別"
            Exit Sub
        End If
        If checkDetailOfCost(Cells(i, DetailOfCost)) = True Then
            MsgBox "Error: 目的地／品目"
            Exit Sub
        End If
        If checkValueOfCost(Cells(i, ValueOfCost)) = True Then
            MsgBox "Error: 金額"
            Exit Sub
        End If
    Next
    
End Sub

Function checkEmployeeID(rng)

    Dim tn
    tn = TypeName(rng.Value)
    
    If Not tn = "Integer" _
    And Not tn = "Double" _
    And Not tn = "String" Then
        checkEmployeeID = True
    End If
    
End Function

Function checkDateOfCost(rng)

    If Not TypeName(rng.Value) = "Date" Then
        checkDateOfCost = True
    End If
    
End Function


Function checkKindOfCost(rng)

    If Not TypeName(rng.Value) = "String" Then
        checkKindOfCost = True
    End If
    
End Function

Function checkDetailOfCost(rng)

    If Not TypeName(rng.Value) = "String" Then
        checkDetailOfCost = True
    End If
    
End Function

Function checkValueOfCost(rng)

    If Not TypeName(rng.Value) = "Currency" Then
        checkValueOfCost = True
    End If
    
End Function


