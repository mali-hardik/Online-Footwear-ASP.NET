using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using paytm;

public partial class User_Default : System.Web.UI.Page
{
    deliveryDataContext x = new deliveryDataContext();
    
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    SqlCommand cmd2 = new SqlCommand();
    string q;
    string qry;
    string qry1;
    string qry2;
    SqlDataAdapter dap = new SqlDataAdapter();
    DataSet ds = new DataSet(); 
    

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_umobileno.Text = Session["umobileno"].ToString();
        txt_umobileno.Text = Session["umobileno"].ToString();
        txt_umobileno.Enabled = false;
        lbl_net.Text = Request.QueryString.Get("net");
        Session["net"] = Request.QueryString.Get("net");
        //qry1 = "select * from cart where umobileno ='" + Session["umobileno"].ToString() + "'";
        //dap = new SqlDataAdapter(qry1,cn);
        //dap.Fill(ds);
        //for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++ )
        //{
        //    cn.Open();
        //    qry2 = "insert into delivery values('" + ds.Tables[0].Rows[i][10].ToString() + "','" +  ds.Tables[0].Rows[i][11].ToString() + "')";
        //    cmd = new SqlCommand(qry2,cn);
        //    cmd.ExecuteNonQuery();
        //    cn.Close();
        //}

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        pnl_del.Visible = false;
        pnl_ord.Visible = true;
        btn_edit.Visible = true;
        img_del.Visible = true; 
        
        delivery dl = new delivery
        {
            uname = txt_uname.Text,
            umobileno = Convert.ToInt64(txt_umobileno.Text),
            pincode = Convert.ToInt64(txt_pincode.Text),
            locality = txt_locality.Text,
            address = txt_add.Text,
            city = ddl_city.SelectedItem.Value,
            state = ddl_state.SelectedItem.Value,
            landmark = txt_landmark.Text,
            altumobileno = Convert.ToInt64(txt_altumobileno.Text),
        };
        x.deliveries.InsertOnSubmit(dl);
        x.SubmitChanges();
        Session["uname"]= txt_uname.Text;
        Session["add"] = txt_add.Text;
        Session["mobile"] = txt_umobileno.Text;
        //lbl_net.Text = Session["net"].ToString();
    }
    protected void btn_edit_Click(object sender, EventArgs e)
    {
        pnl_del.Visible = true;
        pnl_ord.Visible = false;
        btn_edit.Visible = false;
    }
    protected void btn_email_Click(object sender, EventArgs e)
    {
        pnl_del.Visible = false;
        pnl_ord.Visible = false;
        pnl_rd_cash.Visible = true;
        pnl_rd_pay.Visible = true;
        txt_email.Enabled = false;
        img_ord.Visible = true;

        string q;
        cn.Open();
        q = "update delivery set uemail='" + txt_email.Text + "' where uname='" + txt_uname.Text + "'";
        cmd = new SqlCommand(q,cn );
        cmd.ExecuteNonQuery();
        cn.Close();
       Session["email"] = txt_email.Text;

       cn1.Open();
       qry = "select max(uid) from delivery";
       cmd = new SqlCommand(qry, cn1);
       int orderid = Convert.ToInt32(cmd.ExecuteScalar());
       cn1.Close();
       Session["orderid"] = orderid.ToString();
    }
    protected void rd_btn_cash_CheckedChanged(object sender, EventArgs e)
    {
        pnl_cash.Visible = true;
        pnl_del.Visible = false;
        pnl_ord.Visible = false;
        pnl_pay.Visible = false;
        
    }
    protected void rd_btn_paytm_CheckedChanged(object sender, EventArgs e)
    {
        pnl_cash.Visible = false;
        pnl_del.Visible = false;
        pnl_ord.Visible = false;
        pnl_pay.Visible = true;
        
    }
    protected void txt_email_TextChanged(object sender, EventArgs e)
    {
        if (txt_email.Text == "")
        {
            btn_email.Enabled = false;
        }

        else
        {
            btn_email.Enabled = true;
        }
    }
    protected void btn_cancle_Click(object sender, EventArgs e)
    {
        txt_uname.Text = "";
        txt_umobileno.Text = "";
        txt_pincode.Text = "";
        txt_locality.Text = "";
        txt_add.Text = "";
        txt_landmark.Text = "";
        txt_altumobileno.Text = "";
    }
    protected void btn_confirm_Click(object sender, EventArgs e)
    {
        string proid;
        string cart_img;
        string cart_itemdetail;
        string cart_price;
        string pro_size;
        string cart_qty;
        string cart_total;
        string cart_disc;
        string cart_nettot;

        if (MyCaptcha1.IsValid)
        {
            cn.Open();
            q = "select * from cart where umobileno ='" + Session["umobileno"].ToString() + "'";
            cmd = new SqlCommand(q,cn);

            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                while (dr.Read())
                {
                    //fetch cart details
                    proid = dr[1].ToString();
             long  umobileno = Convert.ToInt64(Session["umobileno"].ToString()); 
                    cart_img = dr[3].ToString();
                    cart_itemdetail = dr[4].ToString();
                    cart_price = dr[5].ToString();
                    pro_size = dr[6].ToString();
                    cart_qty = dr[7].ToString();
                    cart_total = dr[8].ToString();
                    cart_disc = dr[9].ToString();
                    cart_nettot = dr[10].ToString();
               
                    //insert order table
                    cn1.Open();
                    qry = "insert into order_detail values('" + umobileno + "','" + cart_img + "','" + cart_itemdetail + "','" + cart_price + "','" + pro_size + "','" + cart_qty + "','" + cart_total + "','" + cart_disc + "','" + cart_nettot + "')";
                    cmd = new SqlCommand(qry,cn1);
                    cmd.ExecuteNonQuery();
                    cn1.Close();

                   
                }
            }
            
            cn.Close();

            Response.Redirect("invoice.aspx");
        }
        else
        {
            lbl_cap.Text = "Invalid Captcha..";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }

    public void paytmpayment(string EMAIL, string MOBILE_NO, string CUST_ID, string ORDER_ID, string TXN_AMOUNT)
    {
        String merchantKey = "#8WZV0O&@j6rmhSg";
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("MID", "CiyDSy57205844069986");
        parameters.Add("CHANNEL_ID", "WEB");
        parameters.Add("INDUSTRY_TYPE_ID", "Retail");
        parameters.Add("WEBSITE", "WEBSTAGING");
        parameters.Add("EMAIL", EMAIL);
        parameters.Add("MOBILE_NO", MOBILE_NO);
        parameters.Add("CUST_ID", CUST_ID);
        parameters.Add("ORDER_ID", ORDER_ID);
        parameters.Add("TXN_AMOUNT", TXN_AMOUNT);
        // parameters.Add("CALLBACK_URL", CALLBACK_URL); //This parameter is not mandatory. Use this to pass the callback url dynamically.

        string checksum = CheckSum.generateCheckSum(merchantKey, parameters);

        string paytmURL = "https://securegw-stage.paytm.in/theia/processTransaction?orderid=" + ORDER_ID;
        
        string outputHTML = "<html>";
        outputHTML += "<head>";
        outputHTML += "<title>Merchant Check Out Page</title>";
        outputHTML += "</head>";
        outputHTML += "<body>";
        outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
        outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
        outputHTML += "<table border='1'>";
        outputHTML += "<tbody>";
        foreach (string key in parameters.Keys)
        {
            outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
        }
        outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
        outputHTML += "</tbody>";
        outputHTML += "</table>";
        outputHTML += "<script type='text/javascript'>";
        outputHTML += "document.f1.submit();";
        outputHTML += "</script>";
        outputHTML += "</form>";
        outputHTML += "</body>";
        outputHTML += "</html>";
        Response.Write(outputHTML);
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string s1 = Session["email"].ToString();
        string s2 = Session["umobileno"].ToString();
        string s3 = Session["uname"].ToString();
        string s4 = Session["orderid"].ToString();
        string s5 = Session["net"].ToString();
        paytmpayment(s1, s2, s3, s4, s5);
    }
}