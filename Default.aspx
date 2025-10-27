<%@ Page Title="Home" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row text-center">

            <div style="
                display:flex; 
                justify-content:space-between;  
                align-items:flex-start; 
                gap:40px; 
                flex-wrap:nowrap;
                width: 95vw;
                max-width: 1800px;
                padding: 20px 20px;
                margin: 0 auto;
                box-sizing: border-box;
            ">

                <div style="
                    flex: 0 0 40%;
                    min-width:350px;
                    background-color:#ffffff; 
                    padding:30px 40px; 
                    border-radius:16px; 
                    box-shadow:0 8px 30px rgba(0,0,0,0.12); 
                    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
                    text-align:center;
                ">
                    <div style="
                        background-color:#f8f9fa; 
                        border-left:6px solid #031269; 
                        padding:20px 25px; 
                        margin-bottom:25px; 
                        text-align:left;
                        font-size:13px;
                        line-height:1.5;
                        color:#333;
                        border-radius:8px;
                    ">
                        <strong style="color:#031269;">Exercise 1</strong><br />
                        Write some code that will accept an amount and convert it to the appropriate string representation.
                        <br /><br />
                        <em>Example:</em> Convert <strong>2523.04</strong> to <strong>"Two thousand five hundred twenty-three and 04/100 dollars"</strong>
                    </div>

                    <h2 style="
                        margin-bottom:25px; 
                        font-size:26px; 
                        font-weight:600; 
                        color:#111;
                    ">
                        Convert Number to Words
                    </h2>

                    <div style="width:100%; margin:0 auto;">
                        <asp:TextBox ID="txtAmount" runat="server" placeholder="Enter amount (e.g., 2523.04)" 
                            oninput="formatAmountInput(this)"
                            style="
                                width:100%; 
                                padding:14px 16px; 
                                margin-bottom:15px; 
                                font-size:13px; 
                                border:1px solid #ccc; 
                                border-radius:8px; 
                                box-sizing:border-box;
                                transition:border-color 0.3s;
                            "
                            onfocus="this.style.borderColor='#007bff';" 
                            onblur="this.style.borderColor='#ccc';"
                        ></asp:TextBox>

                        <asp:Button ID="btnConvert" runat="server" Text="Convert" OnClick="Convert_Click"
                            style="
                                width:100%; 
                                padding:14px 16px; 
                                font-size:16px; 
                                font-weight:500;
                                background-color:#031269; 
                                color:white; 
                                border:none; 
                                border-radius:8px; 
                                cursor:pointer; 
                                transition:background-color 0.3s;
                                margin-bottom:20px;
                            "
                            onmouseover="this.style.backgroundColor='#0053ba';"
                            onmouseout="this.style.backgroundColor='#031269';"
                        />
                    </div>

                    <asp:Label ID="lblResult" runat="server" 
                        style="
                            display:block; 
                            font-size:16px; 
                            font-weight:500; 
                            line-height:1.6;
                        ">
                    </asp:Label>
                </div>

                <div style="
                    flex: 0 0 58%;
                    min-width:350px;
                    background-color:#ffffff;  
                    padding:30px 40px;         
                    border-radius:16px;        
                    box-shadow:0 8px 30px rgba(0,0,0,0.12); 
                    text-align:left;
                    font-size:13px;
                    line-height:1.6;
                    color:#333;
                    overflow-x: auto; 
                ">
                    <div style="
                        background-color:#f8f9fa; 
                        border-left:6px solid #031269; 
                        padding:20px 25px; 
                        margin-bottom:25px; 
                        text-align:left;
                        font-size:13px;
                        line-height:1.5;
                        color:#333;
                        border-radius:8px;
                    ">
                        <strong style="color:#031269;">Exercise 3</strong><br />
                        Write some code that accepts an integer and prints the integers from 0 to that input integer in a spiral format.
                        For example, if I supplied <strong>24</strong> the output would be:<br />
                        20 21 22 23 24<br />
                        19 6 7 8 9<br />
                        18 5 0 1 10<br />
                        17 4 3 2 11<br />
                        16 15 14 13 12
                    </div>

                    <h2 style="
                        margin-bottom:25px; 
                        font-size:26px; 
                        font-weight:600; 
                        color:#111;
                    ">
                        Spiral Number Grid
                    </h2>
                    <p style="font-size:15px;" class="lead">
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
                            OnClick="btnGenerate_Click"
                            style="background-color:#031269; border:none;"
                            onmouseover="this.style.backgroundColor='#0053ba';"
                            onmouseout="this.style.backgroundColor='#031269';" />
                    </div>

                    <div class="mt-3">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
                    </div>

                    <div class="mt-4" style="display:flex; justify-content:center; overflow-x:auto;">
                        <asp:Literal ID="litResult" runat="server" />
                    </div>
                </div>

            </div>

        </section>
    </main>

    <style>
        table.spiral {
            border-collapse: collapse; 
            margin: 20px auto;
            font-family: Arial, sans-serif;
            border-spacing: 0;
            max-width: 100%; 
            overflow-x: auto; 
            display: block; 
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

        @media screen and (max-width: 900px) {
            div[style*="flex-wrap:nowrap"] {
                flex-wrap: wrap;
            }
        }
    </style>

    <script>
        function validateIntegerInput(input) {
            input.value = input.value.replace(/[^0-9]/g, '');
        }

        function formatAmountInput(input) {
            let value = input.value;
            value = value.replace(/[^0-9.]/g, '');
            const parts = value.split('.');
            let integerPart = parts[0];
            let decimalPart = parts[1] || '';
            if (parts.length > 2) {
                decimalPart = parts[1];
            }
            if (decimalPart.length > 2) {
                decimalPart = decimalPart.substring(0, 2);
            }
            integerPart = integerPart.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            input.value = integerPart + (value.includes('.') ? '.' + decimalPart : '');
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

        Protected Sub Convert_Click(sender As Object, e As EventArgs)
            Dim amount As Decimal

            If Decimal.TryParse(txtAmount.Text, amount) Then
                amount = Math.Round(amount, 2)

                If amount < 0 OrElse amount > 999999999.99D Then
                    lblResult.Text = "⚠ The amount must be between 0 and 999,999,999.99."
                    lblResult.ForeColor = System.Drawing.Color.Red
                    Exit Sub
                End If

                lblResult.Text = SpiralNumberGridSolution.NumberToWords.ConvertAmountToWords(amount)
                lblResult.ForeColor = System.Drawing.Color.Green
            Else
                lblResult.Text = "⚠ Invalid amount. Please enter a valid number (e.g., 2523.04)."
                lblResult.ForeColor = System.Drawing.Color.Red
            End If
        End Sub
    </script>

</asp:Content>
