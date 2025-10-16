Imports System.Text

Public Class NumberSpiral
    Public Shared Function Generate(maxValue As Integer) As Integer(,)
        If maxValue < 0 Then Throw New ArgumentException("Value must be >= 0")

        Dim count As Integer = maxValue + 1
        Dim size As Integer = CInt(Math.Ceiling(Math.Sqrt(count)))
        If size Mod 2 = 0 Then size += 1

        Dim grid(size - 1, size - 1) As Integer
        For i = 0 To size - 1
            For j = 0 To size - 1
                grid(i, j) = -1
            Next
        Next

        Dim row As Integer = size \ 2
        Dim col As Integer = size \ 2
        grid(row, col) = 0

        Dim value As Integer = 0
        Dim direction As Integer = 0
        Dim stepLen As Integer = 1
        Dim directionRow() As Integer = {0, 1, 0, -1}
        Dim directionColumn() As Integer = {1, 0, -1, 0}

        While value < maxValue
            For leg As Integer = 1 To 2
                For s As Integer = 1 To stepLen
                    If value >= maxValue Then Exit While
                    row += directionRow(direction)
                    col += directionColumn(direction)
                    value += 1
                    grid(row, col) = value
                Next
                direction = (direction + 1) Mod 4
            Next
            stepLen += 1
        End While

        Return grid
    End Function

    Public Shared Function RenderHtml(grid As Integer(,)) As String
        Dim sb As New StringBuilder()
        sb.Append("<table class='spiral'>")

        For r As Integer = 0 To grid.GetLength(0) - 1
            sb.Append("<tr>")
            For c As Integer = 0 To grid.GetLength(1) - 1
                Dim v = grid(r, c)
                If v = -1 Then
                    sb.Append("<td class='empty'>&nbsp;</td>")
                ElseIf v = 0 Then
                    sb.Append("<td class='center'>0</td>")
                Else
                    sb.Append("<td>" & v.ToString() & "</td>")
                End If
            Next
            sb.Append("</tr>")
        Next

        sb.Append("</table>")
        Return sb.ToString()
    End Function
End Class
