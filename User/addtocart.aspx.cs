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
    SqlCommand cmd = new SqlCommand();

    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlDataAdapter adp = new SqlDataAdapter();
    String q;
    String umobno;
    int total;
    String q2;
    SqlConnection cn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            //if (Session["umobileno"] == null)
            //{

            //    Response.Redirect("home.aspx");


            //}
            umobno = Session["umobileno"].ToString();
            cn.Open();
            q2 = "Select * from cart where umobileno='" + umobno + "'";
            cmd = new SqlCommand(q2, cn);
            SqlDataReader dr2 = cmd.ExecuteReader();

            if (dr2.HasRows)
            {
                while (dr2.Read())
                {
                    cn2.Open();
                    q = "Select SUM(cart_total) from cart where umobileno='" + umobno + "'";
                    cmd = new SqlCommand(q, cn2);
                    //txtcatname.Text  = "Cakkes";
                    total = Convert.ToInt32(cmd.ExecuteScalar());
                    ViewState["tot"] = total.ToString();
                    lbltotal.Text =  total.ToString();
                    lblnettot.Text = total.ToString();
                    Session["total"] = total.ToString();
                    cn2.Close();
                }
                
            }
            else
            {
                lblcart.Text = "Your Cart is Empty";
                Label1.Visible = false;
                btntotal.Visible = false;
            }
            cn.Close();
            cn.Open();
            q = "Select * from cart where umobileno='" + umobno + "'";

            cmd = new SqlCommand(q, cn);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["cartid"] = dr[1].ToString();
                }
            }

            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('You Are Not Login');window.open('home.aspx','_SELF');</script>");
        }
    }

    protected void btntotal_Click(object sender, EventArgs e)
    {
        cn.Open();
        q = "update cart set cart_disc='" + lbldis.Text + "', cart_nettot ='" + lblnettot.Text + "' where umobileno ='" + Session["umobileno"].ToString() + "'";
        cmd = new SqlCommand(q, cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        //Session[""].ToString() = lbl_nettot.Text;
        Response.Redirect("checkout.aspx?net=" + lblnettot.Text);
        //Session["net"] = lblnettot.Text;
           
    }


   
    //protected void img_btn_rem_Click(object sender, EventArgs e)
    //{
    //    cn3.Open();
    //    q3 = "Delete from cart where cartid ='" + cartid + "'";
    //    cmd = new SqlCommand(q3, cn3);
    //    cmd.ExecuteNonQuery();
    //    cn3.Close();

    //    Response.Redirect("addtocart.aspx");
    //}
    protected void lnkbtn_lbl_Click(object sender, EventArgs e)
    {
        pnl_ent_cup.Visible = true;
        pnl_chck.Visible = true;
        
    }
    protected void btn_apl_Click(object sender, EventArgs e)
    {
        int discount;
        int maxdiscount;
        Int64 finalprice;
        Int64 discountprice;
        Int64 grandtotal = Convert.ToInt64(lbltotal.Text);

        // String mycon = "Data Source=HP-PC\\SQLEXPRESS;Initial Catalog=jewelleryshop;Integrated Security=True";

        String myquery = "Select * from coupon where c_code='" + txt_ccode.Text + "'";

        SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = cn;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_cupapl.Text = "Coupon Code " + txt_ccode.Text + " Applied Successfully";

            discount = Convert.ToInt16(ds.Tables[0].Rows[0]["discount"].ToString());
            maxdiscount = Convert.ToInt16(ds.Tables[0].Rows[0]["max_discount"].ToString());
            discountprice = (grandtotal * discount) / 100;
            if (discountprice > maxdiscount)
            {
                discountprice = maxdiscount;
            }
            lbl_discnt.Text = discount.ToString();
            ViewState["dis"] = discountprice.ToString();
            lbl_grdtotal.Text = discountprice.ToString() + " ( " + discount + "% ) Maximum Upto Rs." + maxdiscount;
            finalprice = grandtotal - discountprice;
            ViewState["nettot"] = finalprice.ToString();
            lbl_totcup.Text =  finalprice.ToString();
            //Label6.Text = "Rs." + finalprice.ToString();
        }
        else
        {
            lbl_discnt.Text = "Invalid Coupon Code Applied : Not Exist";
            lbl_totcup.Text = "";
            lbl_grdtotal.Text = "";
         }
        cn.Close();
    }

    protected void btn_con_Click1(object sender, EventArgs e)
    {
        string a = lbl_totcup.Text;
            lblnettot.Text = a;
            
        //int nettot = Convert.ToInt32(lbltotal.Text) - Convert.ToInt32(lbldisc.Text);
        //lbl_nettot.Text = nettot.ToString();

            int tot = Convert.ToInt32(ViewState["tot"].ToString());
            int net = Convert.ToInt32(ViewState["nettot"].ToString());
            int dis = Convert.ToInt32(ViewState["dis"].ToString());
            //int dis = tot - net;
            //lbldisc.Text =dis.ToString();
            //int dis = tot - net;
             lblnettot.Text = net.ToString();
             lbldis.Text = dis.ToString();
    }
}