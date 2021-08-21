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

        }

        protected void linkBtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../User/UserLogin.aspx");
        }

        protected void linkBtnLogin2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../User/UserLogin.aspx");
        }

        protected void post_btn_Command(object sender, CommandEventArgs e)
        {
            string postID = e.CommandArgument.ToString();
            //Response.Redirect("DiscussionPost.aspx?p=" + postID);
            Response.Redirect("../Discussion/DiscussionPost.aspx?p=" + postID.Substring(2, postID.Length - 2));
        }

        protected void topic_btn_Command(object sender, CommandEventArgs e)
        {
            string topicID = e.CommandArgument.ToString();
            Response.Redirect("../Explore/TrendingTopic.aspx?topic=" + topicID.Substring(2, topicID.Length - 2));
        }
    }
}