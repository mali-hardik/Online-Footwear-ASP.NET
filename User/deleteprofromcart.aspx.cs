using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class User_Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    String q;
    string cartid;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        cartid = Request.QueryString.Get("cartid");
        cn.Open();
        q = "Delete from cart where cartid=" + cartid + "";
        cmd = new SqlCommand(q, cn);
        cmd.ExecuteNonQuery();

        Response.Redirect("addtocart.aspx");


        cn.Close();
    }
}