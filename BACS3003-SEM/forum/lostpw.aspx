<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lostpw.aspx.cs" Inherits="BACS3003_SEM.forum.lostpw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
    <style>
        .txt:focus {
            background-color: #1F2937;
        }

        #message {
            display: none;
            background: #1F2937;
            color: #000;
            position: relative;
            padding: 5px;
            /*margin-top: 10px;*/
            min-width: 200px;
            min-height: 200px;
        }

            #message p {
                padding: 3px 20px 3px 30px;
                font-size: 16px;
            }

        /* Add a green text color and a checkmark when the requirements are right */
        .valid {
            color: #34D399;
        }

            .valid:before {
                position: relative;
                left: -35px;
                content: "✔";
            }

        /* Add a red text color and an "x" icon when the requirements are wrong */
        .invalid {
            color: red;
        }

            .invalid:before {
                position: relative;
                left: -35px;
                content: "✖";
            }
    </style>
    <script>
        function myFunction() {
            var x = document.getElementById("txtNewPassword");
            var y = document.getElementById("txtConfirmPassword");
            if (x.type === "password" && y.type === "password") {
                x.type = "text";
                y.type = "text";
            } else {
                x.type = "password";
                y.type = "password";
            }
        }
    </script>

    <script type="text/javascript">

        // When the user clicks on the password field, show the message box
        /*myInput.onfocus = function () {*/
        function showblock() {
            document.getElementById("message").style.display = "block";
        }
        //function showblock() {
        //    document.getElementById("message").style.display = "block";
        //}

        // When the user clicks outside of the password field, hide the message box
        /*myInput.onblur = function () {*/
        function showblock2() {
            document.getElementById("message").style.display = "none";
        }

        // When the user starts to type something inside the password field
        /*myInput.onkeyup = function () {*/
        function showblock3() {
            // Validate lowercase letters
            var myInput = document.getElementById("txtNewPassword");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");
            var lowerCaseLetters = /[a-z]/g;
            if (myInput.value.match(lowerCaseLetters)) {
                letter.classList.remove("invalid");
                letter.classList.add("valid");
            } else {
                letter.classList.remove("valid");
                letter.classList.add("invalid");
            }

            // Validate capital letters
            var upperCaseLetters = /[A-Z]/g;
            if (myInput.value.match(upperCaseLetters)) {
                capital.classList.remove("invalid");
                capital.classList.add("valid");
            } else {
                capital.classList.remove("valid");
                capital.classList.add("invalid");
            }

            // Validate numbers
            var numbers = /[0-9]/g;
            if (myInput.value.match(numbers)) {
                number.classList.remove("invalid");
                number.classList.add("valid");
            } else {
                number.classList.remove("valid");
                number.classList.add("invalid");
            }

            // Validate length
            if (myInput.value.length >= 8 && myInput.value.length <= 16) {
                length.classList.remove("invalid");
                length.classList.add("valid");
            } else {
                length.classList.remove("valid");
                length.classList.add("invalid");
            }
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="h-full max-w-full mx-auto md:py-12 px-6 bg-gray-600">
            <div class="max-w-sm mx-auto px-6">
                <div class="relative flex flex-wrap">
                    <div class="w-full relative">
                        <div class="md:mt-0">
                            <div class="text-center text-2xl font-medium text-gray-300 mt-5 lg:mt-0">
                                Welcome Back to
                            </div>
                            <div class="text-center font-black text-3xl tracking-tight uppercase hover:text-gray-200 text-white mt-5 mb-5"><a href="index.aspx">Badcaps.net Forum</a> </div>
                            <div class="mx-auto max-w-lg ">
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">Username</div>
                                    <asp:TextBox ID="txtUserID" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Username is required." ControlToValidate="txtUserID" ForeColor="Red" ValidationGroup="GetCodeValidation"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">New Password</div>
                                    <asp:TextBox ID="txtNewPassword" runat="server" type="password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}" onfocus="showblock()" onblur="showblock2()" onkeyup="showblock3()"></asp:TextBox>
                                    <div class="">
                                        <div class="absolute">
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required." ControlToValidate="txtNewPassword" ForeColor="Red" ValidationGroup="ResetPass"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="absolute">
                                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Must between 6 to 20 characters." ControlToValidate="txtNewPassword" ForeColor="Red" ValidationExpression="^.{6,20}$"></asp:RegularExpressionValidator>
                                        </div>

                                        <div id="message">
                                        <h3>Password must contain the following:</h3>
                                        <p id="letter" class="invalid" runat="server">A <b runat="server">lowercase</b> letter</p>
                                        <p id="capital" class="invalid" runat="server">A <b runat="server">capital (uppercase)</b> letter</p>
                                        <p id="number" class="invalid" runat="server">A <b runat="server">number</b></p>
                                        <p id="length" class="invalid" runat="server">Minimum <b runat="server">8 characters</b> & Maximum <b runat="server">16 characters</b></p>
                                        </div>

                                    </div>
                                </div>
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">Confirm Password</div>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" type="password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="Confirm Password is required." ControlToValidate="txtConfirmPassword" ForeColor="Red" ValidationGroup="ResetPass"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="absolute">
                                        <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Password not matched." ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                  </div>

                                <div class="flex flex-col">
                                    <div class="flex flex-row space-x-6">
                                        <div class="w-8/12">
                                            <div class="px-1 text-md font-normal text-white mb-2">Verification Code</div>
                                            <asp:TextBox ID="txtVerificationCode" runat="server" TextMode="Password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                        </div>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <div class="w-4/12 mt-8 right-0">
                                                    <asp:Button ID="btnGetCode" runat="server" ViewStateMode="Enabled" ValidationGroup="GetCodeValidation" ClientIDMode="Static" Text="Get Code" CssClass="bg-green-500 border-2 border-green-500 text-white px-3 sm:px-6 py-2 font-bold rounded-lg text-sm font-thin cursor-pointer hover:bg-green-400 hover:text-white hover:shadow-md transition ease-in-out duration-300 disabled:bg-red-500" OnClick="btnGetCode_Click" />
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>


                                            <div class="mb-4 w-full">
                                                <asp:Label ID="lblGetCode" runat="server" Text="" CssClass="mb-2 text-green-400"></asp:Label>


                                                <asp:Label ID="lblWait" runat="server" Text="" Visible="false" ForeColor="Red">If the email is not received, please wait </asp:Label>
                                                <asp:Label ID="lblTime" runat="server" Text="" Visible="false" ForeColor="#F87171">60</asp:Label>
                                                <asp:Label ID="lblSeconds" runat="server" Text="Label" Visible="false" ForeColor="Red"> seconds to get code again.</asp:Label>
                                                <asp:Timer ID="TimerClock" runat="server" Enabled="false" Interval="1000" OnTick="TimerClock_Tick"></asp:Timer>

                                                <div>
                                                    <asp:RequiredFieldValidator ID="rfvGetCode" ValidationGroup="ResetPass" runat="server" ControlToValidate="txtVerificationCode" ErrorMessage="Verification Code is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>


                                    <div class="">
                                        <asp:CheckBox ID="CheckBox1" runat="server" onclick="myFunction()" Text=" Show Password" CssClass="checkbox text-white" />
                                    </div>
                                    <div class="mb-4 w-full">
                                        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="cursor-pointer mt-3 text-lg font-semibold bg-green-500 w-full text-white rounded-lg px-6 py-3 block shadow-xl hover:text-white hover:bg-green-400 transition ease-in-out duration-300" OnClick="btnChangePassword_Click" ValidationGroup="ResetPass" />
                                    </div>
                                    <div class="flex justify-center border-t border-gray-400 mt-4 pt-2 text-white">
                                        <div>Already on Badcaps.net Forums?</div>
                                        <a href="login.aspx" class="ml-1 text-blue-300 text-md font-normal hover:underline">Login</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
