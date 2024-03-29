﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Badcaps.Master" AutoEventWireup="true" CodeFile="showthread.aspx.cs" Inherits="BACS3003_SEM.forum.showthread" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Share post modal box--%>
    <asp:Panel ID="share_panel" runat="server" Visible="false" CssClass="fixed w-full h-full top-0 left-0 flex items-center justify-center">
        <div class="absolute w-full h-full bg-gray-900 opacity-50 z-40"></div>
        <div class="bg-white w-11/12 md:max-w-md mx-auto rounded-lg shadow-md z-50 overflow-y-auto">
            <div class="py-5 text-left px-7">
                <!--Title-->
                <div class="flex justify-around items-center mb-5">
                    <asp:LinkButton ID="share_url_btn" runat="server" CssClass="text-md md:text-xl font-bold text-gray-800 px-1 pb-1 border-b-2 border-gray-700" Text="Thread URL" OnCommand="share_url_btn_Command" Enabled="false"></asp:LinkButton>
                </div>

                <!--Body-->
                <asp:Label ID="share_url_lbl" runat="server" CssClass="text-sm md:text-md text-gray-700" Text="Copy this unique URL and share it with your friends to start an asynchronous discussion!"></asp:Label>
                <asp:TextBox ID="post_url_txt" runat="server" TextMode="MultiLine" ReadOnly="true" Text="[postURL]" onFocus="this.select()" CssClass="border-2 my-5 px-5 py-4 w-full rounded-lg resize-none text-gray-800 focus:text-black text-sm"></asp:TextBox>

                <!--Footer-->
                <div class="flex justify-end">
                    <asp:Button ID="copy_btn" runat="server" Text="Copy URL" CssClass="px-4 bg-transparent p-3 rounded-lg text-gray-600 hover:bg-gray-100 mr-5 cursor-pointer" OnClientClick="copyURL()" OnClick="copy_btn_Click" />
                    <asp:Button ID="close_btn" runat="server" Text="Close" CssClass="px-4 bg-gray-600 p-3 rounded-lg text-white hover:bg-gray-500 cursor-pointer" OnCommand="close_btn_Command" />
                </div>
            </div>
        </div>
    </asp:Panel>

    <%--View count modal box--%>
    <asp:Panel ID="view_panel" runat="server" Visible="false" CssClass="fixed w-full h-full top-0 left-0 flex items-center justify-center">
        <div class="absolute w-full h-full bg-gray-900 opacity-50 z-40"></div>
        <div class="bg-white w-11/12 md:max-w-md mx-auto rounded-lg shadow-md z-50 overflow-y-auto">
            <div class="py-5 text-left px-7">
                <!--Title-->
                <div class="flex justify-around items-center mb-5">
                    <asp:LinkButton ID="view_global_btn" runat="server" CssClass="text-md md:text-xl font-bold text-gray-800 px-1 pb-1 border-b-2 border-gray-700" Text="Global View" OnCommand="view_global_btn_Command"></asp:LinkButton>
                    <asp:LinkButton ID="view_personal_btn" runat="server" CssClass="text-md md:text-xl font-bold text-gray-800 px-1 pb-1 border-b-2 border-transparent" Text="Personal View" OnCommand="view_personal_btn_Command"></asp:LinkButton>
                </div>

                <!--Body-->
                <div class="flex flex-col justify-center mb-5">
                    <table class="table-fixed border-collapse">
                        <tbody>
                            <tr class="border-b-2">
                                <td class="py-2 w-9/12">
                                    <asp:Label ID="view_lbl_1" runat="server" CssClass="text-sm md:text-md text-gray-700" Text="Number of people viewed this post"></asp:Label></td>
                                <td class="pr-2">: </td>
                                <td class="text-center">
                                    <asp:Label ID="count_lbl_1" runat="server" CssClass="text-md sm:text-lg text-gray-800 font-bold"></asp:Label></td>
                                <td class="text-center">
                                    <asp:Label ID="count_lbl_11" runat="server" Visible="false" CssClass="text-md sm:text-lg text-gray-800 font-bold"></asp:Label>
                                </td>
                                <td>
                                    <asp:Panel ID="count_up_panel" runat="server" CssClass="text-green-600 w-auto" ToolTip="You have viewed this post more than average." Visible="false">
                                        <svg
                                            class="w-5 h-5"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="1.5"
                                                d="M9 11l3-3m0 0l3 3m-3-3v8m0-13a9 9 0 110 18 9 9 0 010-18z">
                                            </path>
                                        </svg>
                                    </asp:Panel>
                                    <asp:Panel ID="count_down_panel" runat="server" CssClass="text-red-600 w-auto" ToolTip="The number of times you have viewed posts is below average." Visible="false">
                                        <svg
                                            class="w-5 h-5"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="1.5"
                                                d="M15 13l-3 3m0 0l-3-3m3 3V8m0 13a9 9 0 110-18 9 9 0 010 18z">
                                            </path>
                                        </svg>
                                    </asp:Panel>
                                    <asp:Panel ID="count_equal_panel" runat="server" CssClass="text-gray-400 w-auto rounded-full border-2 border-gray-400" ToolTip="The number of times you have viewed the thread is equal to the average." Visible="false">
                                        <svg
                                            class="w-3 h-3"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="1.5"
                                                d="M4 8h16M4 16h16">
                                            </path>
                                        </svg>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr class="border-b-2">
                                <td class="py-2 w-9/12">
                                    <asp:Label ID="view_lbl_2" runat="server" CssClass="text-sm md:text-md text-gray-700" Text="Total number of views of this thread"></asp:Label></td>
                                <td class="pr-2">: </td>
                                <td class="text-center">
                                    <asp:Label ID="count_lbl_2" runat="server" CssClass="text-md sm:text-lg text-gray-800 font-bold"></asp:Label></td>
                                <td class="text-center">
                                    <asp:Label ID="count_lbl_22" runat="server" Visible="false" CssClass="text-md sm:text-lg text-gray-800 font-bold"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="py-2 w-9/12">
                                    <asp:Label ID="view_lbl_3" runat="server" CssClass="text-sm md:text-md text-gray-700" Text="Average number of views per person"></asp:Label></td>
                                <td class="pr-2">: </td>
                                <td class="text-center">
                                    <asp:Label ID="count_lbl_3" runat="server" CssClass="text-md sm:text-lg text-gray-800 font-bold"></asp:Label></td>
                                <td class="text-center">
                                    <asp:Label ID="count_lbl_33" runat="server" Visible="false" CssClass="text-md sm:text-lg text-gray-800 font-bold"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!--Footer-->
                <div class="flex justify-end">
                    <asp:Button ID="close_view_btn" runat="server" Text="Close" CssClass="px-4 bg-gray-600 p-3 rounded-lg text-white hover:bg-gray-500 cursor-pointer" OnCommand="close_view_btn_Command" />
                </div>
            </div>
        </div>
    </asp:Panel>

    <div
        class="mt-0 m-5 p-5 px-6 bg-white rounded-lg flex flex-col shadow-md h-auto transition ease-in-out duration-1000">
        <div class="flex flex-row justify-between border-b-2 pb-2">
            <%--User detail--%>
            <div>
                <asp:LinkButton ID="userProfile_btn" runat="server" CssClass="flex flex-row" OnCommand="userProfile_btn_Command" CommandArgument='<%#Eval("userID") %>'>
                    <asp:Image ID="post_user_img" runat="server" ImageUrl="~/ProfileImages/Default.png" CssClass="w-12 h-12 rounded-full" />
                    <div class="flex flex-col px-4 justify-start items-start">
                        <div class="font-medium hover:underline">
                            <asp:Label ID="userID_lbl" runat="server" Text="[userID]"></asp:Label>
                        </div>
                        <div class="flex flex-wrap text-sm opacity-80 no-underline">
                            <asp:Label ID="postDate_lbl" runat="server" Text="[postDate]" CssClass="mr-2"></asp:Label>
                            <asp:Label ID="editDate_lbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </asp:LinkButton>
            </div>
            <%--Three dots--%>
            <div class="flex flex-row justify-center items-center relative">
                <a href="#" id="threedot_btn" class="hover:text-gray-600 transition ease-in-out duration-300" onclick="postDropdown()">
                    <svg
                        class="w-6 h-6"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="1.5"
                            d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z">
                        </path>
                    </svg>
                </a>
                <%--Dropdown--%>
                <div id="threedot_dropdown" class="hidden flex flex-col absolute top-10 right-0 w-40 bg-white border-2 rounded-xl shadow-md">
                    <div>
                        <asp:LinkButton runat="server" ID="threedot_dropdown_btn_1" CssClass="flex flex-row px-4 py-3 text-sm capitalize text-gray-700 hover:bg-gray-500 hover:text-white rounded-xl transition ease-in-out duration-300" OnClick="threedot_dropdown_btn_1_Click">
                            <svg
                                class="w-6 h-6"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z">
                                </path>
                            </svg>
                            <span class="pl-2">Share Thread</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="threedot_dropdown_btn_2" CssClass="flex flex-row px-4 py-3 text-sm capitalize text-gray-700 hover:bg-gray-500 hover:text-white rounded-xl transition ease-in-out duration-300" OnClick="threedot_dropdown_btn_2_Click">
                            <svg
                                class="w-6 h-6"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z">
                                </path>
                            </svg>
                            <span class="pl-2">Edit Thread</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="threedot_dropdown_btn_3" CssClass="flex flex-row px-4 py-3 text-sm capitalize text-gray-700 hover:bg-gray-500 hover:text-white rounded-xl transition ease-in-out duration-300" OnClick="threedot_dropdown_btn_3_Click" OnClientClick="return confirm('Are you sure to delete the thread?')">
                            <svg
                                class="w-6 h-6"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                                </path>
                            </svg>
                            <span class="pl-2">Delete Thread</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <%--Discussion title--%>
        <div class="my-5 break-words" style="max-width:100vh;">
            <asp:Label ID="postTitle_lbl" runat="server" Text="[postTitle]" CssClass="text-2xl font-medium py-2"></asp:Label>
        </div>
        <%--Discussion content--%>
        <div class="mb-5 break-words" style="max-width:100vh;">
            <asp:Label ID="postContent_lbl" runat="server" Text="[postContent]" CssClass="text-md py-2"></asp:Label>
        </div>
        <%--Discussion tag--%>
        <div class="flex flex-row my-2 items-center">
            <asp:LinkButton ID="topic_btn" runat="server" CssClass="mr-5" Enabled="false">
                <div runat="server" class="flex flex-row justify-center items-center text-sm md:text-md border-2 rounded-lg bg-gray-100 px-2 py-1 hover:bg-white transition ease-in-out duration-300">
                    <div class="mr-1">#</div>
                    <div>
                        <asp:Label ID="topicName_lbl" runat="server" Text="[#topicName]"></asp:Label>
                    </div>
                </div>
            </asp:LinkButton>
            <asp:LinkButton ID="tag_btn" runat="server" Enabled="false">
                <div runat="server" class="flex flex-row justify-center items-center text-sm md:text-md border-2 rounded-lg bg-gray-100 px-2 py-1 hover:bg-white transition ease-in-out duration-300">
                    <div class="mr-1">#</div>
                    <div>
                        <asp:Label ID="tagName_lbl" runat="server" Text="[#tagName]"></asp:Label>
                    </div>
                </div>
            </asp:LinkButton>
        </div>
        <%--Reaction--%>
        <div class="flex flex-row items-center flex-wrap">
            <%--Like--%>
            <div class="mr-4 mt-4">
                <asp:LinkButton ID="react_like_btn" runat="server" ToolTip="Like" CssClass="flex flex-row justify-start items-center hover:bg-gray-100 px-2 py-1 rounded-lg transition ease-in-out duration-300" OnCommand="react_like_btn_Command" CommandArgument='<%#Eval("postID") + "," + Eval("totalLike") %>'>
                    <svg
                        runat="server"
                        class="w-6 h-6"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="1.5"
                            d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z">
                        </path>
                    </svg>
                    <div class="px-1">
                        <asp:Label ID="postLike_lbl" runat="server" Text="[postLike]"></asp:Label>
                    </div>
                </asp:LinkButton>
            </div>
            <%--Comment--%>
            <div class="mr-4 mt-4">
                <asp:LinkButton ID="react_comment_btn" runat="server" ToolTip="Comment" CssClass="flex flex-row justify-start items-center hover:bg-gray-100 px-2 py-1 rounded-lg transition ease-in-out duration-300" OnCommand="react_comment_btn_Command">
                    <svg
                        runat="server"
                        class="w-6 h-6"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="1.5"
                            d="M17 8h2a2 2 0 012 2v6a2 2 0 01-2 2h-2v4l-4-4H9a1.994 1.994 0 01-1.414-.586m0 0L11 14h4a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2v4l.586-.586z">
                        </path>
                    </svg>
                    <div class="px-1">
                        <asp:Label ID="postComment_lbl" runat="server" Text="[postComment]"></asp:Label>
                    </div>
                </asp:LinkButton>
            </div>
            <%--Bookmark--%>
            <div class="mr-4 mt-4">
                <asp:LinkButton ID="react_bookmark_btn" runat="server" ToolTip="Subscribe" CssClass="flex flex-row justify-start items-center hover:bg-gray-100 px-2 py-1 rounded-lg transition ease-in-out duration-300" OnCommand="react_bookmark_btn_Command">
                    <svg
                        runat="server"
                        class="w-6 h-6"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="1.5"
                            d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z">
                        </path>
                    </svg>
                    <div class="px-1">
                        <asp:Label ID="postBookmark_lbl" runat="server" Text="[postBookmark]"></asp:Label>
                    </div>
                </asp:LinkButton>
            </div>
            <%--View--%>
            <div class="mr-4 mt-4">
                <asp:LinkButton ID="react_view_btn" runat="server" CssClass="flex flex-row justify-start items-center hover:bg-gray-100 px-2 py-1 rounded-lg transition ease-in-out duration-300" OnCommand="react_view_btn_Command">
                    <svg
                        runat="server"
                        class="w-6 h-6"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="1.5"
                            d="M15 12a3 3 0 11-6 0 3 3 0 016 0z">
                        </path>
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="1.5"
                            d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z">
                        </path>
                    </svg>
                    <div class="px-1">
                        <asp:Label ID="postView_lbl" runat="server" Text="[postView]"></asp:Label>
                    </div>
                </asp:LinkButton>
            </div>
        </div>
    </div>

    <%--Add comment--%>
    <div
        class="m-5 mt-0 px-5 py-4 bg-white rounded-lg flex flex-row shadow-md h-auto transition ease-in-out duration-1000">
        <div class="flex flex-row flex-grow justify-between items-start">
            <div class="flex-grow">
                <asp:TextBox ID="comment_txt" runat="server" placeholder="Comment" ToolTip="Comment" TextMode="MultiLine" CssClass="h-14 w-full px-2 py-3 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300 overflow-hidden" onkeyup="AutoExpand(this)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="comment_txt" ErrorMessage="*Required" ValidationGroup="AddComment" Display="Dynamic" CssClass="text-red-600 text-sm m-2" />
            </div>
            <div class="ml-5">
                <asp:LinkButton ID="comment_btn" runat="server" CssClass="w-auto flex flex-row justify-center items-center p-3 bg-gray-700 rounded-lg text-gray-100 hover:shadow-md hover:bg-gray-600 ease-in-out duration-300" OnCommand="comment_btn_Command" ValidationGroup="AddComment">
                    <svg
                    class="w-8 h-8"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg">
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="1.5"
                        d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z">
                    </path>
                </svg>
                <span class="ml-2 hidden sm:inline font-title">Comment</span>
                </asp:LinkButton>
            </div>
        </div>
    </div>

    <%--Sort comment--%>
    <asp:Panel ID="sort_panel" runat="server">

        <div class="mt-0 m-5 p-5 px-6 bg-white rounded-lg flex flex-row flex-wrap justify-center md:justify-end items-center shadow-md h-auto transition ease-in-out duration-1000">
            <div class="mr-2 text-gray-800 text-sm">Sort By :</div>
            <asp:LinkButton ID="old_comment_btn" runat="server" ToolTip="Sort comments from oldest to newest" CssClass="flex flex-row justify-center items-center w-24 text-gray-600 bg-gray-200 hover:bg-gray-100 p-2 rounded-lg transition ease-in-out duration-300" OnCommand="old_comment_btn_Command">
                <svg
                    runat="server"
                    class="w-6 h-6"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg">
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="1.5"
                        d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z">
                    </path>
                </svg>
                <div class="ml-2 font-title">
                    <asp:Label ID="old_comment_lbl" runat="server" Text="Old"></asp:Label>
                </div>
            </asp:LinkButton>
            <asp:LinkButton ID="new_comment_btn" runat="server" ToolTip="Sort comments from newest to oldest" CssClass="ml-5 flex flex-row justify-center items-center w-24 bg-white text-gray-800 hover:bg-gray-100 p-2 rounded-lg transition ease-in-out duration-300" OnCommand="new_comment_btn_Command">
                <svg
                    runat="server"
                    class="w-6 h-6"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg">
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="1.5"
                        d="M13 10V3L4 14h7v7l9-11h-7z">
                    </path>
                </svg>
                <div class="ml-2 font-title">
                    <asp:Label ID="new_comment_lbl" runat="server" Text="New"></asp:Label>
                </div>
            </asp:LinkButton>
        </div>
    </asp:Panel>

    <%--View comment--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DiscussionComment.commentID, DiscussionComment.commentContent, DiscussionComment.commentDate, DiscussionComment.postID, DiscussionComment.userID, DiscussionComment.commentStatus, [User].name, [User].profilePicture, DiscussionReply.replyContent, DiscussionReply.replyID, DiscussionReply.replyDate, DiscussionReply.commentID AS replyCommentID, DiscussionReply.userID AS replyUserID, DiscussionReply.replyStatus FROM DiscussionComment INNER JOIN DiscussionReply ON DiscussionComment.commentID = DiscussionReply.commentID INNER JOIN [User] ON DiscussionComment.userID = [User].userID WHERE (DiscussionComment.postID = @postID) AND (DiscussionComment.commentStatus = 1) ORDER BY DiscussionComment.commentDate"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DiscussionReply.replyID, DiscussionReply.replyContent, DiscussionReply.replyDate, DiscussionReply.commentID, DiscussionReply.userID, DiscussionReply.replyStatus, [User].userID AS replyUserID, [User].name, [User].profilePicture FROM DiscussionReply INNER JOIN [User] ON DiscussionReply.userID = [User].userID WHERE (DiscussionReply.commentID = @commentID) AND (DiscussionReply.replyStatus = 1) ORDER BY DiscussionReply.replyDate"></asp:SqlDataSource>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" EnableViewState="false">
        <ItemTemplate>
            <div
                class="mt-0 m-5 p-5 px-6 bg-white rounded-lg flex flex-col shadow-md h-auto transition ease-in-out duration-1000">

                <%--Comment header--%>
                <div class="flex flex-row justify-between items-center border-b-2 pb-2">
                    <%--User detail--%>
                    <div class="mr-auto">
                            <a href="#" class="flex flex-row">
                        <%--<asp:LinkButton ID="commentProfile_btn" runat="server" CssClass="flex flex-row" OnCommand="commentProfile_btn_Command" CommandArgument='<%#Eval("userID") %>'>--%>
                            <asp:Image ID="comment_user_img" runat="server" ImageUrl='<%#Eval("profilePicture").ToString().Length > 0 ? Eval("profilePicture") : "~/ProfileImages/Default.png" %>' CssClass="w-12 h-12 rounded-full" />
                            <div class="flex flex-col px-4 justify-start items-start">
                                <div class="font-medium">
                                    <abbr title="<%#Eval("name") %>" style="text-decoration: none;"><%#Eval("userID") %></abbr>
                                    <asp:Label ID="username_hidden_lbl" runat="server" Text='<%#Eval("userID") %>' Visible="false"></asp:Label>
                                </div>
                                <div class="text-sm opacity-80 no-underline">
                                    <abbr title="<%#DataBinder.Eval(Container.DataItem, "commentDate", "{0:dddd, dd/MM/yyyy h:mm:ss tt}") %>" style="text-decoration: none;"><%#DataBinder.Eval(Container.DataItem, "commentDate", "{0:d MMMM yyyy}") %></abbr>
                                </div>
                            </div>
                        <%--</asp:LinkButton>--%>
                            </a>
                    </div>

                    <%--Delete comment btn--%>
                    <div>
                        <asp:LinkButton ID="delete_comment_btn" runat="server" ToolTip="Delete Comment" Visible="false" CssClass="text-gray-500 hover:text-gray-600 transition ease-in-out duration-300" CommandArgument='<%#Eval("commentID") %>' OnCommand="delete_comment_btn_Command" OnClientClick="return confirm('Are you sure to delete the comment?')">
                            <svg
                                class="w-6 h-6"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M6 18L18 6M6 6l12 12">
                                </path>
                            </svg>
                        </asp:LinkButton>
                    </div>

                    <%--Reply comment btn--%>
                    <div>
                        <asp:LinkButton ID="reply_comment_btn" runat="server" ToolTip="Reply Comment" Visible="false" CssClass="text-gray-500 hover:text-gray-600 transition ease-in-out duration-300" CommandArgument='<%#Eval("commentID") %>' OnCommand="reply_comment_btn_Command">
                            <svg
                                class="w-5 h-5"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6">
                                </path>
                            </svg>
                        </asp:LinkButton>
                    </div>
                </div>

                <%--Discussion comment--%>
                <div class="mt-5 text-left break-words" style="max-width:100vh;">
                    <asp:Label ID="comment_id_hidden_lbl" runat="server" Text='<%#Eval("commentID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="comment_status_hidden_lbl" runat="server" Text='<%#Eval("commentStatus") %>' Visible="false"></asp:Label>
                    <asp:Label ID="comment_lbl" runat="server" Text='<%#Eval("commentContent") %>' CssClass="break-words"></asp:Label>
                </div>

                <%--Add reply--%>
                <asp:Panel ID="reply_panel" runat="server" Visible="false" CssClass="flex flex-row flex-grow justify-between items-start">
                    <div class="flex-grow">
                        <asp:TextBox ID="reply_txt" runat="server" placeholder="Reply" ToolTip="Reply" TextMode="MultiLine" CssClass="h-14 w-full px-2 py-3 mt-5 border-2 rounded-lg cursor-pointer hover:bg-gray-100 transition ease-in-out duration-300 overflow-hidden" onkeyup="AutoExpand(this)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="reply_txt" ErrorMessage="*Required" ValidationGroup="ReplyComment" Display="Dynamic" CssClass="text-red-600 text-sm m-2" />
                    </div>
                    <div class="ml-5">
                        <asp:LinkButton ID="reply_btn" runat="server" CssClass="w-auto flex flex-row justify-center items-center mt-5 p-3 bg-gray-700 rounded-lg text-gray-100 hover:shadow-md hover:bg-gray-600 ease-in-out duration-300" OnCommand="reply_btn_Command" ValidationGroup="ReplyComment" CommandArgument='<%#Eval("commentID") %>'>
                            <svg
                                class="w-8 h-8"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="1.5"
                                    d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z">
                                </path>
                            </svg>
                            <span class="ml-2 hidden sm:inline font-title">Reply</span>
                        </asp:LinkButton>
                    </div>
                </asp:Panel>

                <%--View reply--%>
                <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                    <ItemTemplate>
                        <div class="mb-0 my-5 p-5 px-6 bg-white rounded-lg flex flex-col border-2 h-auto bg-gray-50">
                            <%--Reply header--%>
                            <div class="flex flex-row justify-between items-center border-b-2 pb-2">
                                <%--User detail--%>
                                <div class="mr-auto">
                                        <a href="#" class="flex flex-row">
                                    <%--<asp:LinkButton ID="replyProfile_btn" runat="server" CssClass="flex flex-row" OnCommand="replyProfile_btn_Command" CommandArgument='<%#Eval("userID") %>'>--%>
                                        <asp:Image ID="reply_user_img" runat="server" ImageUrl='<%#Eval("profilePicture").ToString().Length > 0 ? Eval("profilePicture") : "~/ProfileImages/Default.png" %>' CssClass="w-12 h-12 rounded-full" />
                                        <div class="flex flex-col px-4 justify-start items-start">
                                            <div class="font-medium">
                                                <abbr title="<%#Eval("name") %>" style="text-decoration: none;"><%#Eval("userID") %></abbr>
                                                <asp:Label ID="reply_username_hidden_lbl" runat="server" Text='<%#Eval("userID") %>' Visible="false"></asp:Label>
                                            </div>
                                            <div class="text-sm opacity-80 no-underline">
                                                <abbr title="<%#DataBinder.Eval(Container.DataItem, "replyDate", "{0:dddd, dd/MM/yyyy h:mm:ss tt}") %>" style="text-decoration: none;"><%#DataBinder.Eval(Container.DataItem, "replyDate", "{0:d MMMM yyyy}") %></abbr>
                                            </div>
                                        </div>
                                    <%--</asp:LinkButton>--%>
                                        </a>
                                </div>

                                <%--Delete reply btn--%>
                                <div>
                                    <asp:LinkButton ID="delete_reply_btn" runat="server" ToolTip="Delete Reply" Visible="false" CssClass="text-gray-500 hover:text-gray-600 transition ease-in-out duration-300" CommandArgument='<%#Eval("replyID") %>' OnCommand="delete_reply_btn_Command" OnClientClick="return confirm('Are you sure to delete the reply?')">
                                        <svg
                                            class="w-6 h-6"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="1.5"
                                                d="M6 18L18 6M6 6l12 12">
                                            </path>
                                        </svg>
                                    </asp:LinkButton>
                                </div>
                            </div>

                            <%--Discussion reply--%>
                            <div class="mt-5">
                                <asp:Label ID="reply_status_hidden_lbl" runat="server" Text='<%#Eval("replyStatus") %>' Visible="false"></asp:Label>
                                <asp:Label ID="reply_lbl" runat="server" Text='<%#Eval("replyContent") %>' CssClass="break-words"></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </ItemTemplate>
        <FooterTemplate>
            <asp:Label ID="noComment_lbl" runat="server" CssClass="text-gray-400 text-center mt-10 mb-14" Text="No comment yet" Visible="false"></asp:Label>
            <asp:Label ID="footer_lbl" runat="server" CssClass="invisible text-gray-400 text-center mt-5" Text="There are no more comments to show."></asp:Label>
        </FooterTemplate>
    </asp:Repeater>

    <script type="text/javascript">
        function AutoExpand(txtbox) {
            txtbox.style.height = "1px";
            txtbox.style.height = (25 + txtbox.scrollHeight) + "px";
        }

        //Dropdown content
        function postDropdown() {
            document.getElementById("threedot_dropdown").classList.toggle('hidden');
            document.getElementById("threedot_btn").classList.toggle('text-blue-600');
        }

        //Copy URL to clipboard
        function copyURL() {
            var copyText = document.getElementById("ContentPlaceHolder1_post_url_txt");
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            document.execCommand("copy");
        }
    </script>

</asp:Content>