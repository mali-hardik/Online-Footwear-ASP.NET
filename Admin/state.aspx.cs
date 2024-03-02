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
    stateDataContext x = new stateDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "select * from state where sname ='" + txtsname.Text + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                Response.Write("<script>alert('State Has Been Already Added..')</script>");
                txtsname.Text = "";
            }
            else
            {
                state s = new state
                {
                    cid = Convert.ToInt32(DropDownList2.Text),
                    sname = txtsname.Text,
                    status = ddlstatus.SelectedItem.Value
                };
                x.states.InsertOnSubmit(s);
                x.SubmitChanges();

                Response.Redirect("state.aspx");
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('Invalid State..')</script>");
       
        }
       
    }
    protected void btn_res_Click(object sender, EventArgs e)
    {
        txtsname.Text = "";

    }
}