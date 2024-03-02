using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class User_chngepwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["c"] = 0;

    }

    public string EnryptString(string strEncrypted)
    {
        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
        string encrypted = Convert.ToBase64String(b);
        return encrypted;
    }
   
    protected void btn_pwd_Click(object sender, EventArgs e)
    {
        ViewState["opwd"] = EnryptString(txtopwd.Text);
        ViewState["npwd"] = EnryptString(txtnpwd.Text);
        ViewState["cpwd"] = EnryptString(txtncpwd.Text);

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        //SqlCommand cmd = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter("select password from user_mstr where password='" + ViewState["opwd"].ToString() + "'", cn);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        
        if (dt.Rows.Count.ToString() == "1")
        {
            if (txtnpwd.Text == txtncpwd.Text)
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("Update user_mstr set password ='" + ViewState["npwd"].ToString() + "'where password ='" + ViewState["opwd"].ToString() + "'", cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                lblmsg.Text = "successfully updated";
                Response.Write("<script>window.close();</script>");
            }
            else
            {
                lblmsg.Text = "New password and confirm password shou";
            }
        }
        else
        {
            lblmsg.Text = "please check your old password..";
        }
        txtopwd.Text = "";
        txtnpwd.Text = "";
        txtncpwd.Text = "";

        //Timer1.Enabled = true;
    }
    /*protected void Timer1_Tick(object sender, EventArgs e)
    {
        ViewState["c"] = Convert.ToInt32(ViewState["c"].ToString()) + 1;
        if (Convert.ToInt32(ViewState["c"].ToString()) > 5)
        {
            Response.Redirect("~/User/logout.aspx");
        }

    }*/
}