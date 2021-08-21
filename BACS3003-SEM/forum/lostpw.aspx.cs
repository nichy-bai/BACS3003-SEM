using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;
using System.Threading.Tasks;

namespace BACS3003_SEM.forum
{
    public partial class lostpw : System.Web.UI.Page
    {
        static string verificationCode;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetCode_Click(object sender, EventArgs e)
        {
            string email;
            con.Open();
            SqlCommand cmdEmail = new SqlCommand("Select emailAddress FROM [dbo].[User] WHERE UserID = @Username;", con);
            cmdEmail.Parameters.AddWithValue("@Username", txtUserID.Text);
            SqlDataReader dtrUser = cmdEmail.ExecuteReader();

            if (dtrUser.HasRows && txtNewPassword.Text == txtConfirmPassword.Text)
            {
                con.Close();
                con.Open();
                SqlCommand cmd = new SqlCommand("Select emailAddress FROM [dbo].[User] WHERE UserID = @Username;", con);


                cmd.Parameters.AddWithValue("@Username", txtUserID.Text);
                email = Convert.ToString(cmdEmail.ExecuteScalar());
                con.Close();

                if (txtUserID.Text != "")
                {
                    lblGetCode.Visible = false;

                    MailMessage mailMessage = new MailMessage();
                    mailMessage.IsBodyHtml = true;
                    mailMessage.From = new MailAddress("badcapsforum2021@gmail.com", "Badcaps Forums");
                    mailMessage.To.Add(new MailAddress(email));

                    Random rnd = new Random();
                    int code = rnd.Next(100000, 999999);
                    verificationCode = code.ToString();

                    mailMessage.Subject = "Verification Code";
                    mailMessage.Body = "Your verification code to reset password is " + verificationCode; ;
                    mailMessage.BodyEncoding = Encoding.UTF8;
                    mailMessage.IsBodyHtml = true;
                    SmtpClient smtpClient = new SmtpClient();
                    try
                    {
                        smtpClient.Send(mailMessage);
                        lblGetCode.Visible = true;
                        lblGetCode.Text = "We have sent you a verification code, please check your email.";
                    }

                    catch (Exception ex)
                    {
                        throw ex;
                    }

                    if (lblTime.Text == "0")
                    {
                        lblTime.Text = "60";
                    }

                    lblWait.Visible = true;
                    lblSeconds.Visible = true;
                    lblTime.Visible = true;
                    TimerClock.Enabled = true;
                }

            }
            else if (dtrUser.HasRows == false)
            {
                lblGetCode.Text = "Username does not exist.";
            }


        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string inputVerificationCode = txtVerificationCode.Text;

            if (inputVerificationCode.CompareTo(verificationCode) == 0)
            {
                string selectUser = "Select * from [dbo].[User] where userID = @Username";
                SqlCommand cmdSelectUser = new SqlCommand(selectUser, con);
                cmdSelectUser.Parameters.AddWithValue("@Username", txtUserID.Text);

                string updatePassword = "Update [dbo].[User] Set userPassword = @UserPassword Where userID = @Username";
                SqlCommand cmdUpdatePassword = new SqlCommand(updatePassword, con);
                cmdUpdatePassword.Parameters.AddWithValue("@Username", txtUserID.Text);
                cmdUpdatePassword.Parameters.AddWithValue("@UserPassword", Encryptdata(txtNewPassword.Text));
                con.Open();
                cmdSelectUser.ExecuteNonQuery();
                cmdUpdatePassword.ExecuteNonQuery();
                con.Close();

                verificationCode = "";
                //System.Text.StringBuilder javaScript = new System.Text.StringBuilder();
                //string scriptKey = "SuccessMessage";
                //javaScript.Append("var userConfirmation = window.confirm('" + "Password successfully updated!" + "');\n");
                //javaScript.Append("window.location='login.aspx';");

                //ClientScript.RegisterStartupScript(this.GetType(), scriptKey, javaScript.ToString(), true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password successfully updated!');window.location ='login.aspx';", true);

            }
            else
            {
                Response.Write("<script> alert('Invalid verification code.') </script>");

            }
        }

        private string Encryptdata(string password)
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            strmsg = Convert.ToBase64String(encode);
            return strmsg;
        }

        protected void TimerClock_Tick(object sender, EventArgs e)
        {
            int seconds = int.Parse(lblTime.Text);

            if (seconds > 0)
            {
                lblTime.Text = (seconds - 1).ToString();
                btnGetCode.Enabled = false;
            }
            else
            {
                TimerClock.Enabled = false;
                btnGetCode.Enabled = true;
                lblWait.Visible = false;
                lblSeconds.Visible = false;
                lblTime.Visible = false;
            }
        }
    }
}