using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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
            Session["UserID"] = "nichy";
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

            }

            MultiViewProfile.ActiveViewIndex = 0;
        }
    }
}