<%@ Page Title="" Language="C#" MasterPageFile="~/Badcaps.Master" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="BACS3003_SEM.forum.usercp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #message {
            display: none;
            background: white;
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
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=uploadImg.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height("auto");
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script>
        function myFunction() {
            var x = document.getElementById("<%=txtOldPass.ClientID%>");
            var y = document.getElementById("<%=txtNewPass.ClientID%>");
            var z = document.getElementById("<%=txtConfirmPass.ClientID%>");
            if (x.type === "password" && y.type === "password" && z.type === "password") {
                x.type = "text";
                y.type = "text";
                z.type = "text";
            } else {
                x.type = "password";
                y.type = "password";
                z.type = "password";
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
            var myInput = document.getElementById("<%=txtNewPass.ClientID%>");
            var letter = document.getElementById("<%=letter.ClientID%>");
            var capital = document.getElementById("<%=capital.ClientID%>");
            var number = document.getElementById("<%=number.ClientID%>");
            var length = document.getElementById("<%=length.ClientID%>");
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
        <asp:MultiView ID="MultiViewProfile" runat="server">
            <%--ProfileView--%>
            <asp:View ID="ProfileView" runat="server">
                <div
                    class="mt-0 m-5 p-5 px-6 bg-white rounded-lg flex flex-col shadow-md h-auto transition ease-in-out duration-1000">
                    <div class="relative px-0 flex flex-row flex-grow flex-wrap pb-20 md:pb-0">
                        <div class="items-start w-40 min-w-full sm:min-w-0 mt-0 md:mt-2 mr-5">
                            <div class="flex flex-row justify-center">
                                <div>
                                    <asp:Image ID="imgProfilePic" runat="server" class="rounded-full" />
                                    <%--<asp:ImageButton ID="profilePic" runat="server" CssClass="img-raised profileimg" ImageUrl="" data-toggle="modal" data-target="#modalForm" OnClientClick="return false;" BorderStyle="None" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="flex flex-row flex-wrap justify-center sm:justify-between">
                            <%--<div class="left-0 absolute sm:static">
                                    <asp:Label ID="lblName" runat="server" Text="" CssClass="absolute text-3xl ml-10 font-bold break-words sm:break-normal"></asp:Label>
                                </div>--%>
                            <div class="md:right-0 md:top-0 bottom-0 right-1 w-full md:w-auto absolute">
                                <asp:Button ID="btnEditProfile" runat="server" Text="Edit" OnClick="btnEditProfile_Click" CssClass="block text-md cursor-pointer px-6 py-2 rounded-md text-white hover:text-gray-600 bg-gray-600 font-bold hover:bg-white border-2 border-gray-600 transition ease-in-out duration-300" />
                            </div>
                        </div>
                        <div class="flex flex-col flex-1 text-gray-800 w-full">
                            <div class="flex flex-wrap break-all sm:break-normal justify-center md:justify-start border-b-2">
                                <asp:Label ID="lblName" runat="server" Text="" CssClass="text-3xl font-bold py-2 truncate"></asp:Label>
                            </div>
                            <div class="flex flex-row flex-wrap justify-start items-center my-5">
                                <div class="border-2 rounded-lg bg-gray-100 px-2 py-1 m-2">
                                    <asp:Label ID="lblGender" runat="server" Text="" CssClass="text-md font-normal text-center"></asp:Label>
                                </div>
                                <div class="border-2 rounded-lg bg-gray-100 px-2 py-1 m-2">
                                    <asp:Label ID="lblDOB" runat="server" Text="" CssClass="text-md font-normal text-center"></asp:Label>
                                </div>
                                <div class="border-2 rounded-lg bg-gray-100 px-2 py-1 m-2">
                                    <asp:Label ID="lblEmail" runat="server" Text="" CssClass="text-md font-normal text-center"></asp:Label>
                                </div>
                            </div>
                            <div class="m-2">
                                <asp:Label ID="lblProfileDesc" runat="server" Text="" CssClass="text-lg text-gray-700 font-normal w-full break-normal break-all"></asp:Label>
                                <%--<asp:TextBox ID="txtProfileViewDesc" Text="" Enabled="false" runat="server" BorderStyle="None" BackColor="Transparent" ReadOnly="true" CssClass="w-full break-all"></asp:TextBox>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div
                    class="mt-0 m-5 p-5 px-6 bg-white rounded-lg flex flex-col shadow-md h-auto transition ease-in-out duration-1000">
                    <div>
                        <div class="flex flex-row flex-nowrap justify-between items-center mb-5">
                            <div class="block text-3xl font-bold font-title text-gray-700">
                                Statistics
                            </div>
                            <div class="flex flex-row flex-wrap text-md text-gray-600">
                                <div>Total Posts: </div>
                                <asp:Label ID="lblTopicPosted" runat="server" Text="" CssClass="ml-1"></asp:Label>
                            </div>
                        </div>
                        <div class="flex flex-col h-96 overflow-auto">
                            <div>
                                <asp:Label ID="noPost_lbl" runat="server" CssClass="flex justify-center items-center text-gray-400 text-center mt-10 mb-14" Text="No activities yet" Visible="false"></asp:Label>
                            </div>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <div
                                        class="mt-0 m-5 bg-gray-100 rounded-lg flex flex-col shadow-md h-auto transition ease-in-out duration-1000">
                                        <asp:LinkButton ID="post_btn" runat="server" CssClass="flex flex-col cursor-pointer hover:shadow-md hover:text-gray-800 p-5 px-6 rounded-lg transition ease-in-out duration-500 border-r-4 border-b-4 border-transparent hover:border-blue-400" OnCommand="post_btn_Command" CommandArgument='<%#Eval("postID") %>' OnClientClick="window.document.forms[0].target='_blank';">
                                            <div class="flex flex-row justify-start border-b-2 pb-2">
                                                <%--User detail--%>
                                                <div>
                                                    <div class="flex flex-row items-center">
                                                        <asp:Image ID="post_user_img" runat="server" ImageUrl='<%#Eval("profilePicture").ToString().Length > 0 ? Eval("profilePicture") : "~/ProfileImages/Default.png" %>' CssClass="w-12 h-12 rounded-full" />
                                                        <div class="flex flex-col px-4 justify-start items-start">
                                                            <div class="font-medium">
                                                                <abbr title="<%#Eval("name") %>" style="text-decoration: none;"><%#Eval("userID") %></abbr>
                                                            </div>
                                                            <div class="text-sm opacity-80 no-underline">
                                                                <abbr class="mr-2" title="<%#DataBinder.Eval(Container.DataItem, "postDate", "{0:dddd, dd/MM/yyyy h:mm:ss tt}") %>" style="text-decoration: none;"><%#DataBinder.Eval(Container.DataItem, "postDate", "{0:d MMMM yyyy}") %></abbr>
                                                                <asp:Label ID="edit_date_lbl" runat="server" CssClass="no-underline" Visible='<%# DataBinder.Eval(Container.DataItem, "editDate", "{0:dddd, dd/MM/yyyy h:mm:ss tt}").ToString().Length > 0 ? true : false %>' ToolTip='<%# "Edited on " + DataBinder.Eval(Container.DataItem, "editDate", "{0:dddd, dd/MM/yyyy h:mm:ss tt}") %>' Text='<%# "(Edited on " + DataBinder.Eval(Container.DataItem, "editDate", "{0:d MMMM yyyy}") + ")" %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--Discussion title--%>
                                            <div class="mt-5">
                                                <asp:Label ID="postID_lbl" runat="server" Text='<%#Eval("postID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="postTitle_lbl" runat="server" Text='<%#Eval("postTitle") %>' CssClass="text-xl font-medium py-2"></asp:Label>
                                            </div>
                                            <div class="flex justify-end text-blue-400">
                                                View More
                                            </div>
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Post.postID, Post.postTitle, Post.postContent, Post.postDate, Post.postStatus, Post.editDate, Tag.tagID, Tag.tagName, Tag.tagDesc, Topic.topicID, Topic.topicName, Topic.topicDesc, [User].userID, [User].name, [User].profilePicture, (SELECT COUNT(*) AS Expr1 FROM DiscussionLike WHERE (postID = Post.postID) AND (likeStatus = 1)) AS totalLike, (SELECT COUNT(*) AS Expr1 FROM DiscussionComment WHERE (postID = Post.postID)) AS totalComment, (SELECT COUNT(*) AS Expr1 FROM Bookmark WHERE (postID = Post.postID) AND (bookmarkStatus = 1)) AS totalBookmark, (SELECT COUNT(*) AS Expr1 FROM DiscussionView WHERE (postID = Post.postID)) AS totalView FROM Post INNER JOIN Tag ON Post.tagID = Tag.tagID INNER JOIN Topic ON Post.topicID = Topic.topicID INNER JOIN [User] ON Post.userID = [User].userID WHERE (Post.postStatus = 1) AND ([User].userID = @UserID) ORDER BY totalComment DESC">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="UserID" Name="UserID"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                    <%--<div class="mt-0 m-5 p-5 px-6 flex justify-center sm:justify-end">
                        <div class="w-full sm:w-1/6">
                            <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="block text-md px-6 ml-2 py-2 rounded-md text-white hover:text-red-600 bg-red-600 font-bold mt-4 hover:bg-white border-2 border-red-600 transition ease-in-out duration-300" />
                        </div>
                    </div>--%>
            </asp:View>
            <%--EditProfileView--%>
            <asp:View ID="EditProfileView" runat="server">
                <div
                    class="mt-0 m-5 p-5 px-6 bg-white rounded-lg flex flex-col shadow-md h-auto transition ease-in-out duration-1000">
                    <div class="relative px-0 flex flex-row flex-grow flex-wrap">
                        <div class="items-start w-40 min-w-full sm:min-w-0">
                            <div class="flex flex-col justify-center items-center">
                                <div>
                                    <asp:Image ID="profilePicture" runat="server" class="profile-pic rounded-full" />
                                </div>
                            </div>
                        </div>
                        <div class="flex flex-col flex-1">
                            <%--<div class="flex text-xl ml-10 mt-10 font-bold">Topic Posted
                    <asp:Label ID="lblTopicPosted1" runat="server" Text="" CssClass="ml-5 text-lg font-medium"></asp:Label>
                         </div>--%>
                            <div>
                                <div>
                                    <asp:Button ID="editPassBtn" runat="server" Text="Edit Password" OnClick="editPassBtn_Click" CssClass="mt-4 sm:mt-0 mb-4 float-right block text-md cursor-pointer px-6 py-2 rounded-md text-white hover:text-gray-600 bg-gray-600 font-bold hover:bg-white border-2 border-gray-600 transition ease-in-out duration-300" />
                                </div>
                            </div>
                            <div class="flex ml-10 justify-between space-x-3">
                                <div class="text-xl font-bold w-1/5 text-gray-800">
                                    Name
                                </div>
                                <div class="w-4/5">
                                    <asp:TextBox ID="txtName" runat="server" placeholder="Name" ToolTip="Name" CssClass="w-full p-2 border-2 rounded-lg cursor-text hover:bg-gray-100 transition ease-in-out duration-300" ValidationGroup="ProfileValidation"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required." ControlToValidate="txtName" ForeColor="Red" ValidationGroup="ProfileValidation"></asp:RequiredFieldValidator></div>
                                    <div class="">
                                        <asp:RegularExpressionValidator ID="revNameChar" runat="server" ErrorMessage="Name cannot contain numbers or special characters." ControlToValidate="txtName" ForeColor="Red" ValidationExpression="([a-z]|[A-Z]|[ ])*" ValidationGroup="ProfileValidation"></asp:RegularExpressionValidator></div>
                                    <div class="">
                                        <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name maximum length is 26 characters." ControlToValidate="txtName" ForeColor="Red" ValidationExpression="(\s|.){0,26}" ValidationGroup="ProfileValidation"></asp:RegularExpressionValidator></div>
                                </div>
                            </div>
                            <div class="flex ml-10 mt-0 justify-between space-x-3">
                                <div class="text-xl font-bold w-1/5 text-gray-800">
                                    Profile Photo
                                </div>
                                <div class="w-4/5">
                                    <asp:FileUpload ID="FileUpload" runat="server" CssClass="w-full cursor-pointer inline-flex items-center px-4 py-2 bg-white rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest hover:text-gray-500 active:text-gray-800 active:bg-gray-50 transition ease-in-out duration-150 ml-2" onchange="ImagePreview(this);" />
                                    <asp:Image ID="uploadImg" runat="server" CssClass="border-2" />
                                </div>
                            </div>
                            <%--<div>
                                 <asp:Button ID="btnUpload" runat="server" Text="Upload Photo" CssClass="cursor-pointer inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-400 focus:shadow-outline-blue active:text-gray-800 active:bg-gray-50 transition ease-in-out duration-150 ml-2" OnClick="btnUpload_Click"/>
                             </div>--%>
                            <%--<div class="flex ml-10 justify-between space-x-6">
                             <div class="text-xl font-bold w-1/5">
                                 Profile Picture
                             </div>
                             <div class="w-4/5">
                                 <asp:TextBox ID="TextBox1" runat="server" placeholder="Name" ToolTip="Name" CssClass="w-full p-2 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300"></asp:TextBox>
                             </div>
                         </div>--%>
                            <div class="flex ml-10 mt-3 justify-between space-x-3">
                                <div class="text-xl font-bold w-1/5 text-gray-800">
                                    Gender
                                </div>
                                <div class="w-4/5">
                                    <asp:DropDownList ID="ddlGender" runat="server" ToolTip="Gender" CssClass="w-full p-2 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300">
                                        <%--<asp:ListItem Value="-">Select Gender</asp:ListItem>--%>
                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="flex ml-10 mt-12 justify-between space-x-3">
                                <div class="text-xl font-bold w-1/5 text-gray-800">
                                    D.O.B
                                </div>
                                <div class="w-4/5">
                                    <asp:TextBox ID="txtDOB" runat="server" placeholder="Date Of Birth" TextMode="Date" ToolTip="Date Of Birth" CssClass="w-full p-2 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300" ValidationGroup="ProfileValidation"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RangeValidator ID="DateRangeValidator" runat="server" ControlToValidate="txtDOB" ForeColor="red" ErrorMessage="DOB cannot greater than today's date." Type="Date" ValidationGroup="ProfileValidation"></asp:RangeValidator></div>
                                </div>
                            </div>
                            <div class="flex ml-10 mt-12 justify-between space-x-3">
                                <div class="text-xl font-bold w-1/5 text-gray-800">
                                    Email
                                </div>
                                <div class="w-4/5">
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" ToolTip="Email" CssClass="w-full p-2 border-2 rounded-lg cursor-text hover:bg-gray-100 transition ease-in-out duration-300" ValidationGroup="ProfileValidation"></asp:TextBox>
                                    <div class="absolute">
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required." ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="ProfileValidation"></asp:RequiredFieldValidator></div>
                                    <div class="absolute">
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email. Please enter email as name@email.com" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="ProfileValidation"></asp:RegularExpressionValidator></div>
                                </div>
                            </div>
                            <div class="flex text-xl ml-10 mt-6 font-bold justify-between text-gray-800">
                                Profile Description
                            </div>
                            <div class="ml-10 mt-2">
                                <asp:TextBox ID="txtProfileDesc" runat="server" placeholder="Profile Description (Optional)" TextMode="MultiLine" ToolTip="Profile Description" CssClass="overflow-auto min-h-20 h-64 w-full p-2 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300"></asp:TextBox>
                            </div>
                            <div class="flex flex-row justify-end mt-4 space-x-6">
                                <div>
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="mb-4 float-right block text-md cursor-pointer px-6 py-2 rounded-md text-white hover:text-red-500 bg-red-500 font-bold hover:bg-white border-2 border-red-500 transition ease-in-out duration-300" />
                                </div>
                                <div>
                                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="btnSaveChanges_Click" CssClass="mb-4 float-right block text-md cursor-pointer px-6 py-2 rounded-md text-white hover:text-green-500 bg-green-500 font-bold hover:bg-white border-2 border-green-500 transition ease-in-out duration-300" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
            <%--Edit Password View--%>
            <asp:View ID="EditPasswordView" runat="server">
                <div
                    class="mt-0 m-5 p-5 px-6 bg-white rounded-lg flex flex-col shadow-md h-auto transition ease-in-out duration-1000">
                    <div class="flex flex-col flex-1">
                        <span class="text-xl font-bold mb-2">Current Password</span><asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" placeholder="Current Password" ToolTip="Current Password" CssClass="w-full p-2 border-2 rounded-lg cursor-text hover:bg-gray-100 transition ease-in-out duration-300"></asp:TextBox>
                        <div class="flex flex-row mb-10">
                            <div class="absolute"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="resetpass" runat="server" ControlToValidate="txtOldPass" ErrorMessage="Current password is required." ForeColor="Red"></asp:RequiredFieldValidator></div>
                            <div class="absolute"><asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></div>
                        </div>

                        <span class="text-xl font-bold mb-2">New Password</span><asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" placeholder="New Password" ToolTip="New Password" CssClass="w-full p-2 border-2 rounded-lg cursor-text hover:bg-gray-100 transition ease-in-out duration-300" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}" onfocus="showblock()" onblur="showblock2()" onkeyup="showblock3()"></asp:TextBox>
                        <div class="flex flex-row mb-10">
                        <div class="absolute"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="resetpass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="New password is required." ForeColor="Red"></asp:RequiredFieldValidator></div>
                        </div>
                        <%--------------------------%>
                        <div id="message">
                            <h3>Password must contain the following:</h3>
                            <p id="letter" class="invalid" runat="server">A <b runat="server">lowercase</b> letter</p>
                            <p id="capital" class="invalid" runat="server">A <b runat="server">capital (uppercase)</b> letter</p>
                            <p id="number" class="invalid" runat="server">A <b runat="server">number</b></p>
                            <p id="length" class="invalid" runat="server">Minimum <b runat="server">8 characters</b> & Maximum <b runat="server">16 characters</b></p>
                        </div>
                        <%-- ------------------%>
                        <span class="text-xl font-bold mb-2">Confirm Password</span><asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" placeholder="Confirm Password" ToolTip="Confirm Password" CssClass="w-full p-2 border-2 rounded-lg cursor-text hover:bg-gray-100 transition ease-in-out duration-300"></asp:TextBox>
                        <div class="flex flex-row mb-6">
                            <div class="absolute"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="resetpass" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="Confirm password is required." ForeColor="Red"></asp:RequiredFieldValidator></div>
                            <div class="absolute"><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not match" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:CompareValidator></div>
                        </div>
                        <asp:CheckBox ID="CheckBox1" runat="server" onclick="myFunction()" Text=" Show Password" CssClass="checkbox" />

                        <div class="flex flex-row justify-end mt-4 space-x-6">
                            <div>
                                <asp:Button ID="btnCancelPass" runat="server" Text="Cancel" CssClass="mb-4 float-right block text-md cursor-pointer px-6 py-2 rounded-md text-white hover:text-red-500 bg-red-500 font-bold hover:bg-white border-2 border-red-500 transition ease-in-out duration-300" OnClick="btnCancelPass_Click"/>
                            </div>
                            <div>
                                <asp:Button ID="btnChangePass" runat="server" Text="Save Changes" CssClass="mb-4 float-right block text-md cursor-pointer px-6 py-2 rounded-md text-white hover:text-green-500 bg-green-500 font-bold hover:bg-white border-2 border-green-500 transition ease-in-out duration-300" OnClick="btnChangePass_Click" ValidationGroup="resetpass" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
</asp:Content>
