<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BACS3003_SEM.forum.login1" %>

<!DOCTYPE html>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
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
    <title></title>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.recaptcha.net/recaptcha/api.js?onload=onloadCallback&render=explicit" async="" defer=""></script>
        <script type="text/javascript">
            var onloadCallback = function () {
                grecaptcha.render('dvCaptcha', {
                    'sitekey': '<%=ReCaptcha_Key %>',
                    'callback': function (response) {
                        $.ajax({
                            type: "POST",
                            url: "login.aspx/VerifyCaptcha",
                            data: "{response: '" + response + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                var captchaResponse = jQuery.parseJSON(r.d);
                                if (captchaResponse.success) {
                                    $("[id*=txtCaptcha]").val(captchaResponse.success);
                                    $("[id*=rfvCaptcha]").hide();
                                } else {
                                    $("[id*=txtCaptcha]").val("");
                                    $("[id*=rfvCaptcha]").show();
                                    var error = captchaResponse["error-codes"][0];
                                    $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                                }
                            }
                        });
                    }
                });
            };
        </script>

        <div class="h-screen max-w-full mx-auto md:py-24 px-6 bg-gray-600">
            <div class="max-w-sm mx-auto px-6">
                <div class="relative flex flex-wrap">
                    <div class="w-full relative">
                        <div class="md:mt-0">
                            <div class="text-center text-2xl font-medium text-gray-300 mt-5 lg:mt-0">
                                Login to
                            </div>
                            <div class="text-center font-black text-3xl tracking-tight uppercase hover:text-gray-200 text-white mt-5 mb-10"><a href="index.aspx">Badcaps.net Forum</a> </div>
                            <div class="mx-auto max-w-lg ">
                                <div class="mb-6">
                                    <div class="px-1 text-md font-normal text-white mb-2">Username</div>
                                    <asp:TextBox ID="txtUserID" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:Label ID="lblLoginStatus" runat="server" Text="" ForeColor="Red" CssClass="mb-2"></asp:Label></div>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ErrorMessage="Username is required." ControlToValidate="txtUserID" ForeColor="Red" ValidationGroup="LoginValidation"></asp:RequiredFieldValidator></div>
                                    <div class="absolute">
                                        <asp:RegularExpressionValidator ID="revUserID" runat="server" ErrorMessage="Between 3 to 12 characters." ControlToValidate="txtUserID" ForeColor="Red" ValidationExpression="(\s|.){3,12}"></asp:RegularExpressionValidator></div>
                                </div>

                                <div class="mb-6">
                                    <div class="flex flex-row justify-between mb-2">
                                        <span class="px-1 text-md font-normal text-white">Password</span>
                                        <asp:LinkButton ID="btnForgotPassword" runat="server" CssClass="text-md text-blue-300 hover:underline" OnClick="btnForgotPassword_Click" Text="Forgot password?"></asp:LinkButton>
                                    </div>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-600 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required." ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="LoginValidation"></asp:RequiredFieldValidator></div>
                                </div>

                                <div id="dvCaptcha" class="reset-single1 flex justify-center mt-5 px-0">
                                </div>

                                <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                                <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ValidationGroup="LoginValidation" ControlToValidate="txtCaptcha" runat="server" ForeColor="Red" Display="Dynamic" />

                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="cursor-pointer mt-8 text-lg font-semibold bg-green-500 w-full text-white rounded-lg px-6 py-3 block shadow-xl hover:text-white hover:bg-green-400" OnClick="btnLogin_Click" ValidationGroup="LoginValidation" />
                            </div>
                            <div class="flex justify-center border-t border-gray-400 mt-4 pt-2 text-white">
                                <div>New to Badcaps.net Forums?</div>
                                <a href="register.aspx" class="ml-1 text-blue-300 text-md font-normal hover:underline">Sign Up</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
