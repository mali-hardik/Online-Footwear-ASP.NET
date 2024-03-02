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

    subcategoryDataContext x = new subcategoryDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "select * from subcategory where subcatname ='" + txtsubcatname.Text + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                Response.Write("<script>alert('Sub Category Has Been Already Added..')</script>");
                txtsubcatname.Text = "";
            }
            else
            {
                subcategory scg = new subcategory
                {
                    catid = Convert.ToInt32(DropDownList2.Text),
                    subcatname = txtsubcatname.Text,
                    subdec = txtsubcatdesc.Text,
                    status = Convert.ToInt32(ddlstatus.SelectedItem.Value)
                };
                x.subcategories.InsertOnSubmit(scg);
                x.SubmitChanges();

                Response.Redirect("subcategory.aspx");
            }
        }
        catch(Exception ex)
        {
             Response.Write("<script>alert('Invalid Sub Category..')</script>");
        }
        
    }
    protected void btn_res_Click(object sender, EventArgs e)
    {
        txtsubcatname.Text = "";
        txtsubcatdesc.Text = "";
    }
}