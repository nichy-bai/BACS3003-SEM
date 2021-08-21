using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Data;
using Recaptcha;
using System.Security.Cryptography;
using System.Timers;
using System.Threading.Tasks;

namespace BACS3003_SEM.forum
{
    public partial class login1 : System.Web.UI.Page
    {
        protected static string ReCaptcha_Key = "6Lf0qpsaAAAAAI-YH5zd_MYyR-oxn_UHIiaOaDzY";
        protected static string ReCaptcha_Secret = "6Lf0qpsaAAAAALnm7UJlOQeqXUhAmsVIPrK0nKeB";

        [WebMethod]
        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            String getUser = "Select count(*) from [dbo].[User] where userID = @Username AND userPassword = @Password";
            SqlCommand cmdGetUser = new SqlCommand(getUser, con);
            cmdGetUser.Parameters.AddWithValue("@Username", txtUserID.Text);
            cmdGetUser.Parameters.AddWithValue("@Password", Encryptdata(txtPassword.Text));

            String output = cmdGetUser.ExecuteScalar().ToString();

            if (output == "1")
            {
                Session["UserID"] = txtUserID.Text;
                Response.Redirect("~/forum/index.aspx");
            }
            else
            {
                lblLoginStatus.Text = "Invalid Username or Password";
            }
            con.Close();
        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/forum/lostpw.aspx");
        }

        private string Encryptdata(string password)
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            strmsg = Convert.ToBase64String(encode);
            return strmsg;
        }
    }
}