using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_login : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void btnlog_Click(object sender, EventArgs e)
    {
        cn.Open();
        qry = "select * from registration where email_id = '" + txtemail.Text + "' and password = '" + txtpwd.Text + "'";
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            Session["first_name"] = dr["first_name"];
            Session["profile_pic"] = dr["profile_pic"];

            Response.Redirect("~/Admin/dashboard.aspx");
        }
        else
        {
            lbl1.Text = "Invalid Data..";
        }

        cn.Close();
    }
}