using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry,tpro,tusr;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
        qry = "select count(*) from product";
        cmd = new SqlCommand(qry, cn);
        tpro  = cmd.ExecuteScalar().ToString();
        lblpro .Text = tpro;
        cn.Close();

        cn.Open();
        qry = "select count(*) from registration";
        cmd = new SqlCommand(qry, cn);
        tusr  = cmd.ExecuteScalar().ToString();
        lblusr .Text = tusr;
        cn.Close();
    }
   
}