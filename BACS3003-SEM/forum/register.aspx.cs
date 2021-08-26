using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BACS3003_SEM.forum
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (CheckUsername(txtUserID.Text.Trim()))
            {
                //lblSignUpStatus.Visible = true;
                lblSignUpStatus.Text = "Username already exists.";
                //lblSignUpStatus.Visible = false;
            }
            else
            {
                if (CheckBox2.Checked)
                {
                    string defaultPicture = "~/ProfileImages/Default.png";
                    string encryptedPassword = Encryptdata(txtPassword.Text);
                    String saveUserData = "Insert into [dbo].[User] (userID, name, emailAddress, userPassword, profilePicture, Gender) VALUES (@UserID, @Name, @EmailAddress, @UserPassword, @ProfilePicture, @Gender)";
                    SqlCommand cmdSaveUser = new SqlCommand(saveUserData, con);
                    cmdSaveUser.Parameters.AddWithValue("@UserID", txtUserID.Text);
                    cmdSaveUser.Parameters.AddWithValue("@Name", txtName.Text);
                    cmdSaveUser.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
                    cmdSaveUser.Parameters.AddWithValue("@UserPassword", encryptedPassword);
                    cmdSaveUser.Parameters.AddWithValue("@ProfilePicture", defaultPicture);
                    cmdSaveUser.Parameters.AddWithValue("@Gender", "-");
                    con.Open();
                    cmdSaveUser.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You have signed up successfully!');window.location ='login.aspx';", true);
                }
                else
                {
                    //lblCheckBoxStatus.Visible = true;
                    lblCheckBoxStatus.Text = "Acceptance of terms is required.";
                    //lblCheckBoxStatus.Visible = false;
                }

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

        public bool CheckUsername(string username)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60";
                con.Open();
                using (SqlCommand cmd = new SqlCommand("Select * From [dbo].[User] Where UserID = @Username", con))
                {
                    cmd.Parameters.AddWithValue("@Username", txtUserID.Text);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        protected void rules_btn_Click(object sender, EventArgs e)
        {
            rules_panel.Visible = true;
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            rules_panel.Visible = false;
        }

    }
}