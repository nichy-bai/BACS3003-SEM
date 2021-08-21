﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Badcaps.Master" AutoEventWireup="true" CodeBehind="newthread.aspx.cs" Inherits="BACS3003_SEM.forum.newthread" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header
        class="relative m-5 mt-0 px-5 py-4 bg-white rounded-lg flex flex-row shadow-md h-auto transition ease-in-out duration-1000">
        <div class="relative px-0 flex flex-row flex-grow">
            <div class="flex flex-col justify-center">
                <span class="block text-4xl font-bold mb-2 font-title text-gray-700">New Thread</span>
                <span class="block opacity-80">Start a new thread in this forum</span>
            </div>
        </div>
    </header>
    <div
        class="mt-0 m-5 p-5 bg-white rounded-lg flex flex-row flex-wrap justify-between shadow-md h-auto transition ease-in-out duration-1300">
        <div
            class="flex flex-row items-center justify-start text-gray-600 hover:text-gray-700 w-full md:w-auto h-auto rounded-lg cursor-pointer transition ease-in-out duration-300 mb-10 md:mb-0">
            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="topicName" DataValueField="topicName" ToolTip="Select a Topic" CssClass="h-12 w-auto sm:w-64 px-2 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" InitialValue="[Select a Topic]" ErrorMessage="*Required" ValidationGroup="CreateDiscussion" Display="Dynamic" CssClass="text-red-600 text-sm mx-2" />
        </div>
        <div
            class="flex flex-row items-center justify-start text-gray-600 hover:text-gray-700 w-full md:w-auto h-auto rounded-lg cursor-pointer transition ease-in-out duration-300">
            <asp:DropDownList ID="DropDownList2" runat="server" DataTextField="tagName" DataValueField="tagName" ToolTip="Select a Tag" CssClass="h-12 w-auto sm:w-64 px-2 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" InitialValue="[Select a Tag]" ErrorMessage="*Required" ValidationGroup="CreateDiscussion" Display="Dynamic" CssClass="text-red-600 text-sm mx-2" />
        </div>
    </div>
    <div
        class="mt-0 m-5 p-5 bg-white rounded-lg flex flex-col justify-between shadow-md h-auto transition ease-in-out duration-300">
        <div class="mb-5 relative">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Title" ToolTip="Title" onkeyup="countChar(this)" onkeydown="countChar(this)" CssClass="overflow-auto h-12 w-full px-2 pr-12 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300" autocomplete="off"></asp:TextBox>
            <div class="numberOfChar absolute top-1/4 right-3 text-gray-500"></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ValidationGroup="CreateDiscussion" Display="Dynamic" CssClass="text-red-600 text-sm m-2" />
        </div>
        <div>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Text (Optional)" TextMode="MultiLine" ToolTip="Text" CssClass="overflow-auto min-h-20 h-64 w-full p-2 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300"></asp:TextBox>
        </div>
    </div>
    <div
        class="mt-0 m-5 p-5 bg-white rounded-lg flex flex-row justify-end shadow-md h-auto transition ease-in-out duration-300">
        <asp:Button ID="Button1" runat="server" Text="Discard" CssClass="mr-5 h-12 w-24 sm:w-40 px-2 border-2 rounded-lg cursor-pointer bg-white hover:bg-gray-100 transition ease-in-out duration-300" OnClick="Button1_Click" OnClientClick="return confirm('Are you sure to discard the thread?')" />
        <asp:Button ID="Button2" runat="server" Text="Post" CssClass="h-12 w-24 sm:w-40 px-2 border-2 rounded-lg cursor-pointer bg-gray-800 hover:bg-gray-700 text-white transition ease-in-out duration-300" OnClick="Button2_Click" ValidationGroup="CreateDiscussion" />
    </div>

    <script src="https://cdn.tiny.cloud/1/8v1rs27oaejmu1jgnv4jujn5qmz0j9n9nrtfyd54f8whvy6l/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
        function countChar(val) {
            var len = val.value.length;
            if (len > 300) {
                val.value = val.value.substring(0, 300);
            } else {
                $('.numberOfChar').text(300 - len);
            }
        };
        tinymce.init({
            selector: 'textarea',
            menubar: 'file edit view insert format help',
            statusbar: false,
            plugins: 'wordcount insertdatetime help fullscreen emoticons link image autolink autoresize autosave charmap hr imagetools media paste preview searchreplace visualchars',
            toolbar: ['undo redo | styleselect | bold italic underline | alignleft aligncenter alignright alignjustify | wordcount fullscreen'],
            default_link_target: '_blank'
        });
    </script>
</asp:Content>
