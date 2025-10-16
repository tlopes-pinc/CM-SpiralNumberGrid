<%@ Page Title="Home" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row text-center">

            <div style="
                max-width:600px;
                margin:20px auto 40px auto;
                background-color:#f8f9fa; 
                border-left:5px solid #031269; 
                padding:20px 25px; 
                text-align:left;
                font-size:15px;
                line-height:1.6;
                color:#333;
                border-radius:8px;
            ">
                <strong>Exercise 3</strong><br />
                Write some code that accepts an integer and prints the integers from 0 to that input integer in a spiral format.
                For example, if I supplied <strong>24</strong> the output would be:<br />
                20 21 22 23 24<br />
                19 6 7 8 9<br />
                18 5 0 1 10<br />
                17 4 3 2 11<br />
                16 15 14 13 12
            </div>

            <h2 id="aspnetTitle">Spiral Number Grid</h2>
            <p class="lead">
                Enter an integer to generate a spiral of numbers starting from 0 and click on Generate.
            </p>

            <div class="d-flex justify-content-center align-items-center mt-4 gap-2">
                <asp:TextBox 
                    ID="txtNumber" 
                    runat="server" 
                    CssClass="form-control text-center" 
                    Style="width:120px;" 
                    Text="24"
                    oninput="validateIntegerInput(this)" />
                <asp:Button 
                    ID="btnGenerate" 
                    runat="server" 
                    CssClass="btn btn-primary" 
                    Text="Generate" 
                    OnClick="btnGenerate_Click" />
            </div>

            <div class="mt-3">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" />
            </div>

            <div class="mt-4">
                <asp:Literal ID="litResult" runat="server" />
            </div>
        </section>
    </main>

    <style>
        table.spiral {
            border-collapse: collapse; 
            margin: 20px auto;
            font-family: Arial, sans-serif;
            border-spacing: 0;
        }

        table.spiral td {
            border: 1px solid #ccc;
            width: 50px;
            height: 50px;
            text-align: center;
            vertical-align: middle;
            font-size: 18px;
            font-weight: normal;
        }

        table.spiral td.center {
            background-color: #ff9933;
            font-weight: bold;
            color: white;
        }

        table.spiral td:hover {
            background-color: #e0f0ff;
            color: inherit;
        }

        table.spiral td.center:hover {
            background-color: #0056b3;
            color: white;
        }

        table.spiral td.empty {
            background-color: #f8f9fa;
        }        

        .row.text-center {
            justify-content: center;
            align-items: center;
        }

        .form-control {
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            padding: 6px 16px;
            font-weight: 600;
        }

        main {
            padding-top: 20px;
        }
    </style>

    <script>
        function validateIntegerInput(input) {
            input.value = input.value.replace(/[^0-9]/g, '');
        }
    </script>

    <script runat="server">
        Protected Sub btnGenerate_Click(sender As Object, e As EventArgs)
            lblError.Text = ""
            litResult.Text = ""

            Dim n As Integer
            If Not Integer.TryParse(txtNumber.Text, n) OrElse n < 0 OrElse n > 1088 Then
                lblError.Text = "⚠ Please enter a valid integer between 0 and 1088."
                Exit Sub
            End If

            Try
                Dim matrix = SpiralNumberGridSolution.NumberSpiral.Generate(n)
                litResult.Text = SpiralNumberGridSolution.NumberSpiral.RenderHtml(matrix)
            Catch ex As Exception
                lblError.Text = ex.Message
            End Try
        End Sub
    </script>

</asp:Content>
