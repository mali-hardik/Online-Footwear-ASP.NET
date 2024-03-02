using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.Configuration;


public partial class User_forgotpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_pwd_Click(object sender, EventArgs e)
    {
        

        String mobile;
        String password;
        String myquery = "Select * from user_mstr where umobileno='" + txtumobileno.Text  + "'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            //Label3.Text = "Data Found";
            mobile = ds.Tables[0].Rows[0]["umobileno"].ToString();
            password = DecryptString( ds.Tables[0].Rows[0]["password"].ToString());
            sendpassword(mobile, password,  txtumobileno.Text);

        }
        else
        {
            lblmsg. Text = "Your Mobile No is Not Valid";
        }
        con.Close();
        Response.Write("<script>window.close();</script>");
    }
    private void sendpassword(String mobileno, String password1, String username)
    {

        string message = "Hi " + username + " , Your Password is " + password1 + " .(Smart Shop)";

        String message1 = HttpUtility.UrlEncode(message);
        using (var wb = new WebClient())
        {
            byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "vUevv+/CNjc-DfB2ooh2fMbmb2LdfoMy2KXEjDTDbE"},
                {"numbers" , mobileno},
                {"message" , message1},
                {"sender" , "TXTLCL"}
                });
            string result = System.Text.Encoding.UTF8.GetString(response);
            string mobilelast = "*******" + mobileno.Substring(8);
            lblmsg.Text = "Your Password Has Been Sent to Registered Mobile Number " + mobilelast;
        }
    }

    public string DecryptString(string encrString)
    {
        byte[] b;
        string decrypted;
        try
        {
            b = Convert.FromBase64String(encrString);
            decrypted = System.Text.ASCIIEncoding.ASCII.GetString(b);
        }
        catch (FormatException fe)
        {
            decrypted = "";
        }
        return decrypted;

    }


    protected void txtumobileno_TextChanged(object sender, EventArgs e)
    {

    }
}