using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["mid"] = Request.QueryString.Get("mid");
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataList1.DataSourceID = null;
        if (DropDownList1.SelectedItem.Text == "Default")
        {
            DataList1.DataSource = sql_default;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Name(A - Z)")
        {
            DataList1.DataSource = sql_a_z;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Name(Z - A)")
        {
            DataList1.DataSource = sql_z_a;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Price(High - Low)")
        {
            DataList1.DataSource = sql_h_l;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Price(Low - High)")
        {
            DataList1.DataSource = sql_l_h;
            DataList1.DataBind();
        }
    }
}