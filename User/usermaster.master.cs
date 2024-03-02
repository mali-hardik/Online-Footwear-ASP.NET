using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Data;
using System.Collections.Specialized;

public partial class User_usermaster : System.Web.UI.MasterPage
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry;
    SqlDataReader dr;

    user_mstrDataContext x = new user_mstrDataContext(); 

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    public string EnryptString(string strEncrypted)
    {
        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
        string encrypted = Convert.ToBase64String(b);
        return encrypted;
    }


    protected void btn_signup_Click1(object sender, EventArgs e)
    {
        try
        {

        cn.Open();
        qry = "select * from user_mstr where umobileno ='" + txt_rmob.Text + "'";
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Write("<script>alert('You Are Already Registered..')</script>");
            txt_rmob.Text = "";
        }
        else
        {
            cn.Close();
            ViewState["var"] = EnryptString(txt_rpwd.Text);
            cn.Open();
            qry = "insert into user_mstr values ('" + txt_rmob.Text + "','" + ViewState["var"].ToString() + "')";
            cmd = new SqlCommand(qry, cn);
            cmd.ExecuteNonQuery();
            cn.Close();

            string destinationaddr = "91" + txt_rmob.Text;
            string message = " You Have Been Successfully Registered For smartshop.com Thanks!!";

            String message1 = HttpUtility.UrlEncode(message);
            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "	vUevv+/CNjc-uQemI4YbVubqn2gZZucyXeuTTQxwMV"},
                {"numbers" , destinationaddr},
                {"message" , message1},
                {"sender" , "TXTLCL"}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);
                //Label3.Text = "You Have Successfully Registered";

            }
            txt_rmob.Text = "";
            txt_rpwd.Text = "";
            txt_rcpwd.Text = "";
        }
        cn.Close();

        }
        catch
        {
            Response.Write("<script>alert('Invalid Sign Up Data..')</script>");
        }

    }
    protected void imgbtn_close_Click(object sender, ImageClickEventArgs e)
    {
        txt_lmob.Text = "";
        txt_lpwd.Text = "";
        txt_rmob.Text = "";
        txt_rpwd.Text = "";
       
    }
    protected void btn_signin_Click1(object sender, EventArgs e)
    {
        ViewState["var"] = EnryptString(txt_lpwd.Text);
        cn.Open();
        qry = "select * from user_mstr where umobileno ='" + txt_lmob.Text + "' and password ='" + ViewState["var"].ToString() + "'";
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();

            //Session["uname"] = dr["uname"];
            Session["umobileno"] = txt_lmob.Text;
            //Session["profile_pic"] = dr["profile_pic"];

            Response.Redirect("~/user/index.aspx");
        }
        else
        {
           // lbl1.Text = "Invalid Sign IN Data..";
            Response.Write("<script>alert('Invalid Sign In Data..')</script>");  
        }

        cn.Close();
       
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?catid=" + DropDownList1.SelectedValue);
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        qry = "select * from product where proname='" + txt_ser.Text + "'";
        cmd = new SqlCommand(qry,cn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Redirect("~/user/searchbox.aspx?proname=" + txt_ser.Text);
        }
        else
        {
            Response.Write("<script>alert('Invalid Searching Data..')</script>");
            txt_ser.Text = "";
        }
        cn.Close();
    }
}
