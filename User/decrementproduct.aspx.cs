using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class User_Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlDataAdapter adp = new SqlDataAdapter();
    string str;
    String q;
    int cartid;
    SqlCommand cmd = new SqlCommand();
    int q2;
    int cart_total;
    int cart_price;

    protected void Page_Load(object sender, EventArgs e)
    {
        cartid = Convert.ToInt32(Request.QueryString.Get("cartid"));
        cn.Open();
        q = "Select * from cart where cartid='" + cartid + "'";
        cmd = new SqlCommand(q, cn);
        SqlDataReader dr1 = cmd.ExecuteReader();
        if (dr1.HasRows)
        {
            while (dr1.Read())
            {
                //cart_id = Convert.ToInt32(dr1[0]);
                q2 = Convert.ToInt32(dr1[7]) - 1;
                cart_price = Convert.ToInt32(dr1[5]);
                cart_total = Convert.ToInt32(cart_price) * (q2);

            }
        }
       
        cn.Close();
        if (q2 >= 1)
        {
            cn.Open();
            q = "Update cart Set cart_qty =" + q2 + ", cart_total =" + cart_total + " where cartid=" + cartid + "";
            cmd = new SqlCommand(q, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            Response.Redirect("addtocart.aspx");

        }
        else
        {
            Response.Redirect("addtocart.aspx");

        }
    }
}