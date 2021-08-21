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
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="h-screen max-w-full mx-auto md:py-24 px-6 bg-gray-500">
            <div class="max-w-sm mx-auto px-6">
                <div class="relative flex flex-wrap">
                    <div class="w-full relative">
                        <div class="md:mt-6">
                            <div class="text-center text-4xl font-medium text-gray-100">
                                Forgot Password
                            </div>
                            <div class="mx-auto max-w-lg ">
                                <div class="mb-6">
                                    <span class="px-1 text-lg font-normal text-white">Username</span>
                                    <asp:TextBox ID="txtUserID" runat="server" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Username is required." ControlToValidate="txtUserID" ForeColor="Red" ValidationGroup="ResetPass"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="mb-6">
                                    <span class="px-1 text-lg font-normal text-white">New Password</span>
                                    <asp:TextBox ID="txtNewPassword" runat="server" type="password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="">
                                        <div class="absolute">
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required." ControlToValidate="txtNewPassword" ForeColor="Red" ValidationGroup="ResetPass"></asp:RequiredFieldValidator></div>
                                        <div class="absolute">
                                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Must between 6 to 20 characters." ControlToValidate="txtNewPassword" ForeColor="Red" ValidationExpression="^.{6,20}$"></asp:RegularExpressionValidator></div>
                                    </div>
                                </div>
                                <div class="mb-6">
                                    <span class="px-1 text-lg font-normal text-white">Confirm Password</span>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" type="password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="Confirm Password is required." ControlToValidate="txtConfirmPassword" ForeColor="Red" ValidationGroup="ResetPass"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="absolute">
                                        <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Password not matched." ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                </div>
                                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                <div class="flex flex-row space-x-6">
                                    <div class="">
                                        <span class="px-1 text-lg font-normal text-white">Verification Code</span>
                                        <asp:TextBox ID="txtVerificationCode" runat="server" TextMode="Password" CssClass="txt text-md text-white block px-3 py-2 rounded-lg w-full bg-gray-700 border border-gray-300 placeholder-gray-600 shadow-xl focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-600"></asp:TextBox>
                                    </div>
                                    <div class="<%--absolute -mt-10 p-1--%> mt-7 right-0">
                                        <asp:Button ID="btnGetCode" runat="server" ViewStateMode="Enabled" ClientIDMode="Static" Text="Get Code" CssClass="bg-green-500 border-2 border-green-500 text-white px-3 sm:px-6 py-2 font-bold rounded-lg text-sm font-thin cursor-pointer hover:bg-green-400 hover:text-white hover:shadow-md transition ease-in-out duration-300 disabled:bg-red-500" OnClick="btnGetCode_Click" />
                                    </div>
                                </div>
                                <div class="mb-4 w-full">
                                    <asp:Label ID="lblGetCode" runat="server" Text="" CssClass="mb-2 text-green-400"></asp:Label>

                                   
                                            <asp:Label ID="lblWait" runat="server" Text="" Visible="false" ForeColor="Red">If the email is not received, please wait </asp:Label>
                                            <asp:Label ID="lblTime" runat="server" Text="" Visible="false" ForeColor="DarkRed">60</asp:Label>
                                            <asp:Label ID="lblSeconds" runat="server" Text="Label" Visible="false" ForeColor="Red"> seconds to get code again.</asp:Label>
                                            <asp:Timer ID="TimerClock" runat="server" Enabled="false" Interval="1000" OnTick="TimerClock_Tick"></asp:Timer>
                                       
                                    <div><asp:RequiredFieldValidator ID="rfvGetCode" ValidationGroup="ResetPass" runat="server" ControlToValidate="txtVerificationCode" ErrorMessage="Verification Code is required." ForeColor="Red"></asp:RequiredFieldValidator></div>
                                </div>
                                    </ContentTemplate>
                                    </asp:UpdatePanel>
                                <div class="mb-4 w-full">
                                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="cursor-pointer mt-3 text-lg font-semibold bg-green-500 w-full text-white rounded-lg px-6 py-3 block shadow-xl hover:text-white hover:bg-green-400" OnClick="btnChangePassword_Click" ValidationGroup="ResetPass"/>
                                </div>
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
