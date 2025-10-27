Public Class NumberToWords
    Private Shared ReadOnly ones As String() = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                                                 "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
                                                 "seventeen", "eighteen", "nineteen"}

    Private Shared ReadOnly tens As String() = {"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"}

    Private Shared ReadOnly scales As String() = {"", "thousand", "million", "billion"}

    Public Shared Function ConvertAmountToWords(amount As Decimal) As String
        Dim integerPart As Long = Math.Floor(amount)
        Dim decimalPart As Integer = CInt(Math.Round((amount - integerPart) * 100))

        Dim words As String = ConvertIntegerToWords(integerPart)

        If words.Length > 0 Then
            words = Char.ToUpper(words(0)) & words.Substring(1)
        End If

        Dim cents As String = decimalPart.ToString("00")

        Dim dollarWord As String
        If amount <= 1D Then
            dollarWord = "dollar"
        Else
            dollarWord = "dollars"
        End If

        Return $"{words} and {cents}/100 {dollarWord}"
    End Function

    Private Shared Function ConvertIntegerToWords(number As Long) As String
        If number = 0 Then Return "zero"

        Dim words As String = ""
        Dim scale As Integer = 0

        While number > 0
            Dim n As Integer = CInt(number Mod 1000)
            If n <> 0 Then
                Dim segment As String = ConvertHundredsToWords(n)
                If scales(scale) <> "" Then
                    segment &= " " & scales(scale)
                End If
                words = If(words = "", segment, segment & " " & words)
            End If
            number \= 1000
            scale += 1
        End While

        Return words
    End Function

    Private Shared Function ConvertHundredsToWords(number As Integer) As String
        Dim words As String = ""

        If number >= 100 Then
            words &= ones(number \ 100) & " hundred"
            number = number Mod 100
            If number > 0 Then words &= " "
        End If

        If number >= 20 Then
            words &= tens(number \ 10)
            number = number Mod 10
            If number > 0 Then words &= "-" & ones(number)
        ElseIf number > 0 Then
            words &= ones(number)
        End If

        Return words
    End Function
End Class
