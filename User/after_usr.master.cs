using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Data;

public partial class User_after_usr : System.Web.UI.MasterPage
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //lbl_totl.Text= Session["total"].ToString();
            lbl_user.Text = Session["umobileno"].ToString();
        }
        catch (Exception ex)
        {
            //Response.Redirect("../home.aspx");
            Response.Write("<script>alert('You Are Not Login');window.open('home.aspx','_SELF');</script>");
        }

        
    }
    protected void imgbtn_close_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?catid=" + DropDownList1.SelectedValue);
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        qry = "select * from product where proname='" + txt_ser.Text + "'";
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Redirect("~/user/searchbox.aspx?proname=" + txt_ser.Text);
        }
        else
        {
            Response.Write("<script>alert('Invalid Searching Data..')</script>");
            txt_ser.Text = "";
        }
        cn.Close();
    }
}
