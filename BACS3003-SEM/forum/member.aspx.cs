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
    public partial class usercp : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                DateRangeValidator.MinimumValue = DateTime.Now.AddYears(-100).ToShortDateString();
                DateRangeValidator.MaximumValue = DateTime.Now.Date.ToShortDateString();

                string getTopicPosted = "Select Count(*) from [Post] where userID = @currUserID and postStatus=1";
                SqlCommand cmdTopic = new SqlCommand(getTopicPosted, con);
                cmdTopic.Parameters.AddWithValue("@currUserID", Session["UserID"].ToString());
                con.Open();

                int TopicCount = Convert.ToInt32(cmdTopic.ExecuteScalar());
                lblTopicPosted.Text = TopicCount.ToString();
                con.Close();

                string getProfileData = "Select * from [User] where userID = @currUserID ";
                SqlCommand cmd = new SqlCommand(getProfileData, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@currUserID", Session["UserID"].ToString());
                con.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    object date = rdr["DOB"];
                    if (date != null && DBNull.Value != date)
                    {
                        lblDOB.Text = Convert.ToDateTime(date).ToString("dd/MM/yyyy");
                    }
                    else
                    {
                        lblDOB.Text = "-";
                    }

                    lblGender.Text = rdr["Gender"].ToString();

                    if (lblGender.Text == "M")
                    {
                        lblGender.Text = "Male";
                    }
                    else if (lblGender.Text == "F")
                    {
                        lblGender.Text = "Female";
                    }
                    else
                    {
                        lblGender.Text = "-";
                    }

                    imgProfilePic.ImageUrl = rdr["profilePicture"].ToString();
                    profilePicture.ImageUrl = rdr["profilePicture"].ToString();
                    lblName.Text = rdr["name"].ToString();
                    lblEmail.Text = rdr["emailAddress"].ToString();
                    lblProfileDesc.Text = rdr["profileDesc"].ToString();

                    if (lblProfileDesc.Text == null || lblProfileDesc.Text == "")
                    {
                        lblProfileDesc.Text = "(No Description)";
                    }

                }

                Repeater1.DataBind();
                if (Repeater1.Items.Count == 0)
                {
                    noPost_lbl.Visible = true;
                }
                else
                {
                    noPost_lbl.Visible = false;
                }
            }
            else
            {
                Response.Redirect("loginerror.aspx");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You must log in as a customer to access this feature.');window.location ='../User/UserLogin.aspx';", true);
            }
            if (!IsPostBack)
            {
                MultiViewProfile.ActiveViewIndex = 0;
            }
        }

        protected void post_btn_Command(object sender, CommandEventArgs e)
        {
            string postID = e.CommandArgument.ToString();
            //Response.Redirect("DiscussionPost.aspx?p=" + postID);
            Response.Redirect("showthread.aspx?p=" + postID.Substring(2, postID.Length - 2));
        }
        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            MultiViewProfile.ActiveViewIndex = 1;
            if (Session["UserID"] != null)
            {
                string getProfileData = "Select * from [User] where userID = @currUserID ";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
                SqlCommand cmd = new SqlCommand(getProfileData, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@currUserID", Session["UserID"].ToString());
                con.Open();
                rdr = cmd.ExecuteReader();
                
                while (rdr.Read())
                {
                    object date = rdr["DOB"];
                    if (date != null && DBNull.Value != date)
                    {
                        txtDOB.Text = Convert.ToDateTime(date).ToString("yyyy-MM-dd");

                    }

                    string gender = rdr["Gender"].ToString();
                    if (gender == "-")
                    {
                        ddlGender.Items.Insert(0, "[Select Gender]");
                        ddlGender.SelectedValue = "[Select Gender]";
                    }
                    txtName.Text = rdr["name"].ToString();
                    txtEmail.Text = rdr["emailAddress"].ToString();
                    txtProfileDesc.Text = rdr["profileDesc"].ToString();
                }
                con.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //MultiViewProfile.ActiveViewIndex = 0;
            Response.Redirect("~/forum/member.aspx");
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            String updateProfile = "UPDATE [dbo].[User] SET [User].[name] = @newName,[User].[Gender] = @newGender, [User].[DOB] = @newDOB, [User].[emailAddress] = @newEmail, [User].[profilePicture] = @ProfilePicture, [User].[profileDesc] = @Desc WHERE [User].[userID] = @UserID";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
            SqlCommand cmdEditProfile = new SqlCommand(updateProfile, con);

            //string UploadPhoto = "~/ProfileImages/" + FileUpload.FileName.ToString();

            if (ddlGender.SelectedItem.Text == "[Select Gender]")
            {
                ddlGender.Items.Insert(0, "-");
                ddlGender.SelectedValue = "-";
            }

            if (FileUpload.HasFile)
            {
                string UploadImg = "~/ProfileImages/" + FileUpload.FileName.ToString();
                if (String.IsNullOrEmpty(txtDOB.Text))
                {
                    cmdEditProfile.Parameters.AddWithValue("@newDOB", DBNull.Value);
                }
                else
                {
                    cmdEditProfile.Parameters.AddWithValue("@newDOB", txtDOB.Text);
                }
                FileUpload.SaveAs(Server.MapPath("~/ProfileImages/" + FileUpload.FileName));
                cmdEditProfile.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                cmdEditProfile.Parameters.AddWithValue("@newName", txtName.Text);
                cmdEditProfile.Parameters.AddWithValue("@newGender", ddlGender.SelectedValue);
                cmdEditProfile.Parameters.AddWithValue("@newEmail", txtEmail.Text);
                cmdEditProfile.Parameters.AddWithValue("@ProfilePicture", UploadImg);
                cmdEditProfile.Parameters.AddWithValue("@Desc", txtProfileDesc.Text);
                con.Open();
                cmdEditProfile.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                string getProfileData = "Select * from [User] where userID = @currUserID ";
                SqlCommand cmd = new SqlCommand(getProfileData, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@currUserID", Session["UserID"].ToString());
                con.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    imgProfilePic.ImageUrl = rdr["profilePicture"].ToString();
                    profilePicture.ImageUrl = rdr["profilePicture"].ToString();
                }
                con.Close();

                if (String.IsNullOrEmpty(txtDOB.Text))
                {
                    cmdEditProfile.Parameters.AddWithValue("@newDOB", DBNull.Value);
                }
                else
                {
                    cmdEditProfile.Parameters.AddWithValue("@newDOB", txtDOB.Text);
                }
                cmdEditProfile.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                cmdEditProfile.Parameters.AddWithValue("@newName", txtName.Text);
                cmdEditProfile.Parameters.AddWithValue("@newGender", ddlGender.SelectedValue);
                cmdEditProfile.Parameters.AddWithValue("@newEmail", txtEmail.Text);
                cmdEditProfile.Parameters.AddWithValue("@ProfilePicture", profilePicture.ImageUrl);
                cmdEditProfile.Parameters.AddWithValue("@Desc", txtProfileDesc.Text);
                con.Open();
                cmdEditProfile.ExecuteNonQuery();
                con.Close();
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile Successfully Updated!');window.location ='member.aspx';", true);
            //Response.Redirect("~/WebForms/User/UserProfile.aspx");
        }

        //protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (Repeater1.Items.Count < 1)
        //    {
        //        if (e.Item.ItemType == ListItemType.Footer)
        //        {
        //            Label lblFooter = (Label)e.Item.FindControl("noPost_lbl");
        //            lblFooter.Visible = true;
        //        }
        //    }
        //}

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You have been successfully logged out!');window.location ='../forum/index.aspx';", true);
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            
            String getUser = "Select count(*) from [dbo].[User] where userID = @Username AND userPassword = @Password";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
            SqlCommand cmdGetUser = new SqlCommand(getUser, con);
            cmdGetUser.Parameters.AddWithValue("@Username", Session["UserID"]);
            cmdGetUser.Parameters.AddWithValue("@Password", Encryptdata(txtOldPass.Text));
            con.Open();
            String output = cmdGetUser.ExecuteScalar().ToString();
            con.Close();
            if (output == "1")
            {
                String sql = "Update [dbo].[User] set userPassword = @newPassword where userID = @Username1";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Username1", Session["UserID"]);
                cmd.Parameters.AddWithValue("@newPassword", Encryptdata(txtNewPass.Text));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                //add success msg
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password successfully changed!');window.location ='../forum/member.aspx';", true);
            }
            else
            {
                lblError.Text = "Current password not matched.";
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

        protected void editPassBtn_Click(object sender, EventArgs e)
        {
            MultiViewProfile.ActiveViewIndex = 2;
        }

        protected void btnCancelPass_Click(object sender, EventArgs e)
        {
            MultiViewProfile.ActiveViewIndex = 1;
        }
    }
}