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
        <div class="h-full max-w-full mx-auto md:py-3 px-6 bg-gray-600">
            <div class="max-w-sm mx-auto px-6">
                <div class="relative flex flex-wrap">
                    <div class="w-full relative">
                        <asp:Panel ID="rules_panel" runat="server" Visible="false" CssClass="fixed w-full h-full top-0 left-0 flex items-center justify-center">
                            <div class="absolute w-full h-full bg-gray-900 opacity-50 z-40"></div>
                            <div class="bg-white w-11/12 md:max-w-lg mx-auto rounded-md shadow-md z-50 h-5/6 overflow-y-auto">
                                <div class="p-10 flex items-center justify-center flex-col">
                                    <p class="font-bold">Badcaps.net Registration Agreement</p>
                                    <p class="text-center text-red-500 underline">READ AND COMPLETELY UNDERSTAND BEFORE AGREEING</p>
                                    <br />
                                    <br />
                                    <p class="text-justify font-medium text-sm">The Badcaps.net Forum covers issues dealing with electricity and electronics repair.  ELECTRICITY IS DANGEROUS!!!!  Servicing electronics can also possibly expose you to potentially harmful substances, such as lead and mercury!!  In no way is Badcaps.net or the contributors to the Badcaps.net Forum liable for any damage caused to your device as the result of any information presented on this forum!  Furthermore, Badcaps.net accepts NO RESPONSIBILITY for any personal injury or death resulting from any information contained in this forum!!  Use the information presented on this forum AT YOUR OWN RISK!!  If you are not trained in electronics and handling electricity/electronic devices, you might leave servicing to a qualified technician! </p>
                                    <br />
                                    <p class="text-justify font-medium text-sm">You also agree to upload any files & images directly to the forum using the forum attachment feature.  Free image/file hosts (such as photobucket) are not allowed, and most are blocked due to their horrible reliability.  This makes the images & files available for future users to assist in their repairs.  By uploading your images & files, you do not forfeit ownership.  You are however granting Badcaps.net irrevocable permission to host what you upload for an indefinite time period.</p>
                                    <br />
                                    <p class="text-justify font-medium text-sm">By checking the 'agree' box below and clicking the 'Register' button, which registers you on this forum, you have agreed FULLY to these terms and conditions.  If you do not agree to these conditions and would like to cancel the registration, click here to return to the forums index.</p>
                                    <br />
                                    <p class="text-justify font-medium text-sm">Although the administrators and moderators of Badcaps Forums will attempt to keep all objectionable messages off this forum, it is impossible for us to review all messages. All messages express the views of the author, and neither the owners of Badcaps Forums, nor vBulletin Solutions, Inc. (developers of vBulletin) will be held responsible for the content of any message.</p>
                                    <br />
                                    <p class="text-justify font-medium text-sm">By agreeing to these rules, you warrant that you will not post any messages that are obscene, vulgar, sexually-oriented, hateful, threatening, or otherwise violative of any laws.</p>
                                    <br />
                                    <p class="text-justify font-medium text-sm">The owners of Badcaps Forums reserve the right to remove, edit, move or close any thread for any reason.</p>
                                </div>
                                <div class="flex justify-center ">
                                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="cursor-pointer my-5 text-lg font-semibold bg-gray-600 text-white rounded-lg px-6 py-3 block shadow-xl hover:text-white hover:bg-gray-500" OnClick="btnClose_Click" />
                                </div>

                            </div>
                        </asp:Panel>
                        <div class="md:mt-0">
                            <div class="text-center text-2xl font-medium text-gray-300 mt-5 lg:mt-0">
                                Welcome to
                            </div>
                            <div class="text-center font-black text-3xl tracking-tight uppercase hover:text-gray-200 text-white mt-5 mb-5"><a href="index.aspx">Badcaps.net Forum</a> </div>
                            <div class="mx-auto max-w-lg ">
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">Name</div>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvName" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Name is required." ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revNameChar" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Name cannot contain numbers or special characters." ControlToValidate="txtName" ForeColor="Red" ValidationExpression="([a-z]|[A-Z]|[ ])*"></asp:RegularExpressionValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revName" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Name maximum length is 26 characters." ControlToValidate="txtName" ForeColor="Red" ValidationExpression="(\s|.){0,26}"></asp:RegularExpressionValidator></div>
                                </div>
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">Username</div>
                                    <asp:TextBox ID="txtUserID" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvUserID" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Username is required." ControlToValidate="txtUserID" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revUserID" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Must between 3 to 12 characters." ControlToValidate="txtUserID" ForeColor="Red" ValidationExpression="(\s|.){3,12}"></asp:RegularExpressionValidator></div>
                                    <div class="absolute mt-6"><asp:RegularExpressionValidator ID="revUserChar" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Cannot contain whitespace." ControlToValidate="txtUserID" ForeColor="Red" ValidationExpression="^[A-Za-z0-9\[\]/!$%^&*()\-_+{};:'£@#.?]*$"></asp:RegularExpressionValidator></div>
                                    <div class="absolute"><asp:Label ID="lblSignUpStatus" runat="server" Text="" ForeColor="Red"></asp:Label></div>
                                </div>
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">Email</div>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Email is required." ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Invalid email format." ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator></div>
                                </div>
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">Password</div>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}" onfocus="showblock()" onblur="showblock2()" onkeyup="showblock3()"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Password is required." ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:RegularExpressionValidator ID="revPassword" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Must between 6 to 20 characters." ControlToValidate="txtPassword" ForeColor="Red" ValidationExpression="^.{6,20}$"></asp:RegularExpressionValidator></div>
                                </div>

                                <div id="message">
                                <h4 class="text-white">Password must contain the following:</h4>
                                <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                <p id="number" class="invalid">A <b>number</b></p>
                                <p id="length" class="invalid">Min <b>8 </b> & Max <b>16 characters</b></p>
                                </div>

                                <div class="mb-8">
                                    <div class="px-1 text-md font-normal text-white mb-2">Confirm Password</div>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute"><asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Confirm Password is required." ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator></div>
                                    <div class="absolute"><asp:CompareValidator ID="cvPassword" runat="server" ValidationGroup="RegisterValidation" ErrorMessage="Password not matched." ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:CompareValidator></div>
                                </div>
                                <div><asp:CheckBox ID="CheckBox1" runat="server" onclick="myFunction()" Text=" Show Password" CssClass="checkbox text-white"/></div>
                                <div><asp:CheckBox ID="CheckBox2" runat="server" CssClass="checkbox" /><span class="cursor-default text-white"> I accept the</span> <asp:LinkButton ID="rules_btn" runat="server" OnClick="rules_btn_Click" CssClass="text-blue-300 text-md font-normal hover:underline"> Terms of Use & Privacy Notice</asp:LinkButton></div>
                                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="cursor-pointer mt-3 text-lg font-semibold bg-green-500 w-full text-white rounded-lg px-6 py-3 block shadow-xl hover:text-white hover:bg-green-400" OnClick="btnSignUp_Click" ValidationGroup="RegisterValidation" />
                            </div>
                            <div class="flex justify-center border-t border-gray-400 mt-4 pt-2 text-white">
                                <div>
                                    Already on Badcaps.net Forums?
                                </div>
                                <a href="login.aspx" class="ml-1 text-blue-300 text-md font-normal hover:underline">Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
