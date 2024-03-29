﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BACS3003_SEM.forum
{
    public partial class viewmember : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BadcapsDB.mdf;Integrated Security=True;Timeout=60");
        string viewUserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            viewUserID = Request.QueryString["userid"];

            con.Open();
            SqlCommand status = new SqlCommand("Select * from [User] where userID = @currUserID ", con);
            status.Parameters.AddWithValue("@currUserID", viewUserID);
            bool userStatus;
            if (status.ExecuteScalar() != null)
            {
                userStatus = true;
            }
            else
            {
                userStatus = false;
            }
            con.Close();

            if (userStatus && viewUserID != null)
            {
                string getTopicPosted = "Select Count(*) from [Post] where userID = @currUserID";
                SqlCommand cmdTopic = new SqlCommand(getTopicPosted, con);
                cmdTopic.Parameters.AddWithValue("@currUserID", viewUserID);
                con.Open();

                int TopicCount = Convert.ToInt32(cmdTopic.ExecuteScalar());
                lblTopicPosted.Text = TopicCount.ToString();
                con.Close();

                string getProfileData = "Select * from [User] where userID = @currUserID ";
                SqlCommand cmd = new SqlCommand(getProfileData, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@currUserID", viewUserID);
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
                Response.Redirect("error.aspx");
            }
        }
        protected void post_btn_Command(object sender, CommandEventArgs e)
        {
            string postID = e.CommandArgument.ToString();
            Response.Redirect("/showthread.aspx?p=" + postID.Substring(2, postID.Length - 2));
        }
    }
}