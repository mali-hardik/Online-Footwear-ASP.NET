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
    
    categoryDataContext x = new categoryDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_sub_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "select * from category where cname ='" + txtcatname.Text + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                Response.Write("<script>alert('Category Has Been Already Added..')</script>");
                txtcatname.Text = "";
            }
            else
            {
                category cg = new category
                {
                    cname = txtcatname.Text,
                    cdesc = txtcatdesc.Text,
                    status = Convert.ToInt32(ddlstatus.SelectedItem.Value)
                };
                x.categories.InsertOnSubmit(cg);
                x.SubmitChanges();
                Response.Redirect("category.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Invalid Category..')</script>");
        }
       
    }

    /*protected void btn_update_Click(object sender, EventArgs e)
    {
    }*/

    protected void btn_res_Click(object sender, EventArgs e)
    {
        txtcatname.Text = "";
        txtcatdesc.Text = "";

    }
}