using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Image1.ImageUrl = "~/Admin/images/" + Session["profile_pic"].ToString();
            lbl1.Text = Session["first_name"].ToString();
        }
        catch(Exception ex)
        {
            Response.Redirect("../login.aspx");
        }
    }
}
