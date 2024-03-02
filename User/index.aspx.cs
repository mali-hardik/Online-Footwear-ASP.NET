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
            string s = Session["umobileno"].ToString(); 
       
      //          Response.Redirect("index.aspx");

            
        }
        catch (Exception ex)
        {
            Response.Redirect("Home.aspx");
        }
    }
}