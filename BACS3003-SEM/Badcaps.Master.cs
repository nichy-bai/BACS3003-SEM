using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace BACS3003_SEM
{
    public partial class Badcaps : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
        string userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                userID = Session["UserID"].ToString();
                linkBtnLogin.Visible = false;
                linkBtnRegister.Visible = false;
                linkBtnLogout.Visible = true;
                post_user_img.Visible = true;
            }
            else
            {
                linkBtnLogin.Visible = true;
                linkBtnRegister.Visible = true;
                linkBtnLogout.Visible = false;
                post_user_img.Visible = false;
            }

            //string path = HttpContext.Current.Request.Url.AbsolutePath;

            //if (path.Contains("member/"))
            //{
            //    nav_profile_btn.CssClass = nav_profile_btn.CssClass.Replace("border-transparent", "border-indigo-500");
            //}

            SqlCommand cmd = new SqlCommand("SELECT profilePicture FROM [User] WHERE userID='" + userID + "'", con);
            con.Open();

            object obj = cmd.ExecuteScalar();

            if (obj != null && DBNull.Value != obj)
            {
                post_user_img.ImageUrl = obj.ToString();
            }

            con.Close();
        }

        protected void linkBtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../forum/login.aspx");
        }

        protected void post_btn_Command(object sender, CommandEventArgs e)
        {
            string postID = e.CommandArgument.ToString();
            //Response.Redirect("DiscussionPost.aspx?p=" + postID);
            Response.Redirect("showthread.aspx?p=" + postID.Substring(2, postID.Length - 2));
        }

        protected void topic_btn_Command(object sender, CommandEventArgs e)
        {
            //string topicID = e.CommandArgument.ToString();
            //Response.Redirect("../Explore/TrendingTopic.aspx?topic=" + topicID.Substring(2, topicID.Length - 2));
        }

        protected void linkBtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("../forum/register.aspx");
        }

        protected void linkBtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You have been successfully logged out!');window.location ='../forum/index.aspx';", true);
        }
    }
}