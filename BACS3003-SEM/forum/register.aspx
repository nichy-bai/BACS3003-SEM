<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="BACS3003_SEM.forum.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet" />
    <style>
        .txt:focus {
            background-color: #1F2937;
        }
    </style>
    <%--<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js"></script>--%>
    <title></title>
    
    <style>
        #message {
    display: none;
    background: #f1f1f1;
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
    color: green;
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
    var x = document.getElementById("txtPassword");
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
            var myInput = document.getElementById("txtPassword");
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

</head>
<body>
    <form id="form1" runat="server">
        <div class="h-screen max-w-full mx-auto md:py-24 px-6 bg-gray-500">
            <div class="max-w-sm mx-auto px-6">
                <div class="relative flex flex-wrap">
                    <div class="w-full relative">
                        <div class="md:mt-6">
                            <div class="text-center text-4xl font-medium text-gray-100">
                                Sign Up
                            </div>
                            <div class="mx-auto max-w-lg ">
                                <div class="mb-6">
                                    <span class="px-1 text-lg font-normal text-white">Name</span>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required." ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revNameChar" runat="server" ErrorMessage="Name cannot contain numbers or special characters." ControlToValidate="txtName" ForeColor="Red" ValidationExpression="([a-z]|[A-Z]|[ ])*"></asp:RegularExpressionValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name maximum length is 26 characters." ControlToValidate="txtName" ForeColor="Red" ValidationExpression="(\s|.){0,26}"></asp:RegularExpressionValidator></div>
                                </div>
                                <div class="mb-6">
                                    <span class="px-1 text-lg font-normal text-white">Username</span>
                                    <asp:TextBox ID="txtUserID" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvUserID" runat="server" ErrorMessage="Username is required." ControlToValidate="txtUserID" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revUserID" runat="server" ErrorMessage="Must between 3 to 12 characters." ControlToValidate="txtUserID" ForeColor="Red" ValidationExpression="(\s|.){3,12}"></asp:RegularExpressionValidator></div>
                                    <div class="absolute mt-6"><asp:RegularExpressionValidator ID="revUserChar" runat="server" ErrorMessage="Cannot contain whitespace." ControlToValidate="txtUserID" ForeColor="Red" ValidationExpression="^[A-Za-z0-9\[\]/!$%^&*()\-_+{};:'£@#.?]*$"></asp:RegularExpressionValidator></div>
                                    <div class="absolute"><asp:Label ID="lblSignUpStatus" runat="server" Text="" ForeColor="Red"></asp:Label></div>
                                </div>
                                <div class="mb-6">
                                    <span class="px-1 text-lg font-normal text-white">Email</span>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required." ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email format." ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator></div>
                                </div>
                                <div class="mb-6">
                                    <span class="px-1 text-lg font-normal text-white">Password</span>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}" onfocus="showblock()" onblur="showblock2()" onkeyup="showblock3()"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required." ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Must between 6 to 20 characters." ControlToValidate="txtPassword" ForeColor="Red" ValidationExpression="^.{6,20}$"></asp:RegularExpressionValidator></div>
                                </div>

                                <%--<div id="message">
                                <h4>Password must contain the following:</h4>
                                <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                <p id="number" class="invalid">A <b>number</b></p>
                                <p id="length" class="invalid">Minimum <b>8 characters</b> & Maximum <b>16 characters</b></p>
                                </div>--%>

                                <div class="mb-8">
                                    <span class="px-1 text-lg font-normal text-white">Confirm Password</span>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="Confirm Password is required." ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Password not matched." ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:CompareValidator></div>
                                    <%--<asp:CheckBox ID="CheckBox1" runat="server" onclick="myFunction()" Text="Show Password" CssClass="checkbox"/>--%>
                                </div>
                               <%-- --------------------------------------------------------------------------------------------------------------------%>
                                <%--<div class="flex justify-start mt-3 ml-4 p-1">
                                <ul>
                                    <li class="flex items-center py-1">
                                        <div :class="{'bg-green-200 text-green-700': password == password_confirm && password.length > 0, 'bg-red-200 text-red-700':password != password_confirm || password.length == 0}"
                                             class=" rounded-full p-1 fill-current ">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path x-show="password == password_confirm && password.length > 0" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M5 13l4 4L19 7"/>
                                                <path x-show="password != password_confirm || password.length == 0" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M6 18L18 6M6 6l12 12"/>

                                            </svg>
                                        </div>
                                        <span :class="{'text-green-700': password == password_confirm && password.length > 0, 'text-red-700':password != password_confirm || password.length == 0}"
                                              class="font-medium text-sm ml-3"
                                              x-text="password == password_confirm && password.length > 0 ? 'Passwords match' : 'Passwords do not match' "></span>
                                    </li>
                                    <li class="flex items-center py-1">
                                        <div :class="{'bg-green-200 text-green-700': password.length > 7, 'bg-red-200 text-red-700':password.length < 7 }"
                                             class=" rounded-full p-1 fill-current ">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path x-show="password.length > 7" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M5 13l4 4L19 7"/>
                                                <path x-show="password.length < 7" stroke-linecap="round"
                                                      stroke-linejoin="round" stroke-width="2"
                                                      d="M6 18L18 6M6 6l12 12"/>

                                            </svg>
                                        </div>
                                        <span :class="{'text-green-700': password.length > 7, 'text-red-700':password.length < 7 }"
                                              class="font-medium text-sm ml-3"
                                              x-text="password.length > 7 ? 'The minimum length is reached' : 'At least 8 characters required' "></span>
                                    </li>
                                </ul>
                            </div>--%>
                                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="cursor-pointer mt-3 text-lg font-semibold bg-green-500 w-full text-white rounded-lg px-6 py-3 block shadow-xl hover:text-white hover:bg-green-400" OnClick="btnSignUp_Click" />
                            </div>
                            <div class="flex justify-center border-t border-gray-400 mt-4 pt-2 text-white">
                                Already on Badcaps.net Forums?<span><a href="login.aspx" style="text-decoration: none" class="ml-1 text-green-500 font-bold hover:text-green-400 transition ease-in-out duration-300">Login</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
