Attribute VB_Name = "Module1"
Sub alphabet08()


Dim ticker As String
Dim ticker_Change As String

Dim i As Long
Dim r As Long
Dim j As Long
Dim t As Integer
Dim o As Integer

Dim Tricker_1 As String
Dim Tricker_2 As String
Dim tricker_3 As String


Dim LastRow As Long
Dim LastRow_O As Long

Dim Opening_Price As Double

Dim closing_Price As Double
Dim yearly_change As Double

Dim OutputR As Variant
Dim c As Integer
Dim numrows As Integer
Dim Percentage_Change As Variant
Dim Greatest_Increase As Variant
Dim Greatest_Decrease As Variant
Dim Greatest_Volume As Variant


Dim Total_Stock_Volume As Variant

Dim theSheet As Worksheet
  
  numberSheets = ActiveWorkbook.Worksheets.Count
  
For i = 1 To numberSheets

Set theSheet = ActiveWorkbook.Worksheets(i)

theSheet.Cells(1, 10).Value = "Ticker"
theSheet.Cells(1, 11).Value = "Yearly Change"
theSheet.Cells(1, 12).Value = "Percentage Change"
theSheet.Cells(1, 13).Value = "Total Stock Volume"

theSheet.Cells(1, 17).Value = "Ticker"
theSheet.Cells(1, 18).Value = "Value"
theSheet.Cells(2, 16).Value = "Greatest % Increase"
theSheet.Cells(3, 16).Value = "Greatest % Decrease"
theSheet.Cells(4, 16).Value = "Greatest Total Volume"


LastRow = theSheet.Cells(Cells.Rows.Count, "A").End(xlUp).Row
OutputR = 2
j = 2
Total_Stock_Volume = 0
    For r = 2 To LastRow
    
    ticker = theSheet.Cells(r, 1).Value
    ticker_Change = theSheet.Cells(r + 1, 1).Value
    closing_Price = theSheet.Cells(r, 3).Value
    Opening_Price = theSheet.Cells(j, 3).Value
    yearly_change = closing_Price - Opening_Price
    
    If Opening_Price < 1 Then
    
    Opening_Price = 1
    
    End If
    
    Percentage_Change = yearly_change / Opening_Price
 
 
    Total_Stock_Volume = Total_Stock_Volume + theSheet.Cells(r, 7).Value
    
    
        If ticker <> ticker_Change Then
' Ticker update

        theSheet.Cells(OutputR, 10).Value = theSheet.Cells(r - 1, 1).Value
        
' Yearly change
        theSheet.Cells(OutputR, 11).Value = yearly_change
' Percentage change
        
        theSheet.Cells(OutputR, 12).Value = Percentage_Change
        
'Total stock volume

        
        theSheet.Cells(OutputR, 13).Value = Total_Stock_Volume
        
        OutputR = OutputR + 1
        j = r + 1
        Total_Stock_Volume = 0

 
 
        End If
    
    
    Next r


theSheet.Range("K:K").NumberFormat = "##0.00"        ' Fix column display

theSheet.Range("L:L").NumberFormat = "##0.00%"

LastRow_O = theSheet.Cells(Cells.Rows.Count, "M").End(xlUp).Row

For t = 2 To LastRow_O


    If theSheet.Cells(t, 11).Value > 0 Then

    theSheet.Cells(t, 11).Interior.ColorIndex = 4

    ElseIf theSheet.Cells(t, 11).Value < 0 Then

    theSheet.Cells(t, 11).Interior.ColorIndex = 3
    Else
    

End If

Next t

' output with greatest increase and decrease
Greatest_Increase = 0
Greatest_Decrease = 0

Greatest_Volume = 0

For o = 2 To LastRow_O

If Greatest_Increase < theSheet.Cells(o, 12).Value Then

Greatest_Increase = theSheet.Cells(o, 12).Value
Tricker_1 = theSheet.Cells(o, 10).Value

End If

If Greatest_Decrease > theSheet.Cells(o, 12).Value Then

Greatest_Decrease = theSheet.Cells(o, 12).Value
Tricker_2 = theSheet.Cells(o, 10).Value

End If

If Greatest_Volume < theSheet.Cells(o, 13).Value Then

Greatest_Volume = theSheet.Cells(o, 13).Value
tricker_3 = theSheet.Cells(o, 10).Value

End If

Next o
 
theSheet.Cells(2, 18).Value = Greatest_Increase
theSheet.Cells(3, 18).Value = Greatest_Decrease
theSheet.Cells(4, 18).Value = Greatest_Volume
theSheet.Cells(2, 17).Value = Tricker_1
theSheet.Cells(3, 17).Value = Tricker_2
theSheet.Cells(4, 17).Value = tricker_3

theSheet.Range("r2:r3").NumberFormat = "##0.00%"
Next i

End Sub
