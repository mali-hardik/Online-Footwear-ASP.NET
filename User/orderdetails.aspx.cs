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
        try
        {
            if (Session["umobileno"] == null)
            {
               Response.Write("<script>alert('You Are Not Login');window.open('home.aspx','_SELF');</script>");
            }
        }
        catch(Exception ex)
        {
            Response.Redirect("orderdetails.aspx"); 
        }
       
    }
}