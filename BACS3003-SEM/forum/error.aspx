<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="BACS3003_SEM.forum.error" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login to continue</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    <div class="min-w-screen min-h-screen bg-gray-600 flex items-center p-5 lg:p-20 overflow-hidden relative">
        <div class="flex-1 min-h-full min-w-full rounded-3xl bg-white shadow-xl p-10 lg:p-20 text-gray-800 relative md:flex items-center text-center md:text-left">
            <div class="w-full md:w-1/2">
                <div class="mb-10 lg:mb-20">
                    <a href="index.aspx" class="text-gray-700 hover:text-gray-600 transition ease-in-out duration-300 flex items-center text-2xl justify-center md:justify-start font-black tracking-tight uppercase">
                        <span class="ml-2">Badcaps.net Forum</span>
                    </a>
                </div>
                <div class="mb-10 text-gray-600 font-normal">
                    <h1 class="font-bold uppercase text-5xl lg:text-5xl text-gray-400 mb-5 md:mb-2">Oops! </h1>
                    <h1 class="font-bold uppercase text-3xl lg:text-4xl text-gray-600 mb-5 md:mb-10">An error has occurred.</h1>
                    <p>The page you're looking for isn't available.</p>
                </div>
                <div class="mb-20 md:mb-0">
                    <a href="index.aspx" class="text-gray-500 flex flex-row md:justify-start justify-center items-center mt-10 hover:opacity-80 transition ease-in-out duration-300 text-md">
                        <svg class="w-6 h-6"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="1.5"
                                d="M7 16l-4-4m0 0l4-4m-4 4h18">
                            </path>
                        </svg>
                        <span class="mx-1 font-title">Back to homepage</span>
                    </a>
                </div>
            </div>
            <div class="w-full md:w-1/2 text-center">
                <img src="../Illustrations/loginerror.svg" alt="illustration_1" class="w-full max-w-lg lg:max-w-full mx-auto">
            </div>
        </div>
        <div class="w-64 md:w-96 h-96 md:h-full bg-gray-200 bg-opacity-20 absolute -top-64 md:-top-96 right-20 md:right-32 rounded-full pointer-events-none -rotate-45 transform"></div>
        <div class="w-96 h-full bg-gray-200 bg-opacity-20 absolute -bottom-96 right-64 rounded-full pointer-events-none -rotate-45 transform"></div>
    </div>
</body>
</html>
