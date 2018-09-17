Attribute VB_Name = "expense_error_handling"
Option Explicit

Sub main()
    Dim UpperLeftOfCheckReigion As Range
    Dim EmployeeID, DateOfCost, KindOfCost, DetailOfCost, ValueOfCost As Integer

    '�����s�ɐ��Z���ڂ��n��ꍇ�A���[�v���ă`�F�b�N���s���̂ŁA
    '���[�v�񐔂𐧌䂷�邽�߂ɁA�w��̃J�����̃Z������ɂ��Ă���
    Set UpperLeftOfCheckReigion = Range("A1")
    
    '�J�����ԍ��A�`�J���� = 1
    EmployeeID = 1
    DateOfCost = 2
    KindOfCost = 3
    DetailOfCost = 4
    ValueOfCost = 5
    
    Dim i As Integer
    
    For i = UpperLeftOfCheckReigion.Row To Cells(Rows.Count, UpperLeftOfCheckReigion.Columns).End(xlUp).Row
        If checkEmployeeID(Cells(i, EmployeeID)) = True Then
            MsgBox "Error: �Ј��ԍ�"
            Exit Sub
        End If
        If checkDateOfCost(Cells(i, DateOfCost)) = True Then
            MsgBox "Error: ������"
            Exit Sub
        End If
        If checkKindOfCost(Cells(i, KindOfCost)) = True Then
            MsgBox "Error: ���"
            Exit Sub
        End If
        If checkDetailOfCost(Cells(i, DetailOfCost)) = True Then
            MsgBox "Error: �ړI�n�^�i��"
            Exit Sub
        End If
        If checkValueOfCost(Cells(i, ValueOfCost)) = True Then
            MsgBox "Error: ���z"
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


