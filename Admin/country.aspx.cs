using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry;
    SqlDataReader dr;

    countryDataContext x = new countryDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_sub_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "select * from country where cname ='" + txtcname.Text + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                Response.Write("<script>alert('Country Has Been Already Added..')</script>");
                txtcname.Text = "";
            }
            else
            {
                country c = new country
                {
                    cname = txtcname.Text,
                    status = ddlstatus.SelectedItem.Value
                };
                x.countries.InsertOnSubmit(c);
                x.SubmitChanges();

                Response.Redirect("country.aspx");
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('Invalid Country..')</script>");
        }
    }
    protected void btn_res_Click(object sender, EventArgs e)
    {
        txtcname.Text = "";

    }
}