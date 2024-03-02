using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading;
using AjaxControlToolkit;

public partial class User_Default : System.Web.UI.Page
{

    SqlCommand cmd = new SqlCommand();

    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlDataAdapter adp = new SqlDataAdapter();
    string str;
    DataSet ds = new DataSet();
    SqlDataReader dr;
    String q;
    String proid;
    String proname;
    String proprice;
    String proimg;
    String umobno;
    int prototal;
    string q1;
    int q2;
    int cartid;
    int carttotal;
    SqlCommand cmd1 = new SqlCommand();
    SqlCommand cmd2 = new SqlCommand();
    SqlConnection cn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlConnection cn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    ratingDataContext x = new ratingDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        proid = Request.QueryString.Get("proid");
        cn.Open();
        q = "Select * from product where proid ='" + proid + "'";
        cmd = new SqlCommand(q, cn);
        SqlDataReader dr1 = cmd.ExecuteReader();
        if (dr1.HasRows)
        {
            while (dr1.Read())
            {
                Session["proid"] = dr1[0].ToString();
                proname = dr1[2].ToString();
                proprice = dr1["proprice"].ToString();
                proimg = dr1["proimg"].ToString();

            }
        }
        cn.Close();
        if (!IsPostBack)
        {
            fillcat();
        }

    }

    void fillcat()
    {
        //   TreeNode tn1 = new TreeNode();
        //  TreeView1.CssClass = "AspNet-TreeView";
        ////  TreeView1.Nodes.Add(tn1);
        //  TreeView1.NodeStyle.CssClass = "AspNet-TreeView-Root AspNet-TreeView-Leaf";
        //  TreeView1.RootNodeStyle.CssClass = "AspNet-TreeView-Root";
        //  TreeView1.LeafNodeStyle.CssClass = "AspNet-TreeView-Leaf";

        //  //TreeView1.Nodes.Add(tn1);

        //  cn.Open();
        //  str = "select category_name from category where category_status=0";
        //  adp = new SqlDataAdapter(str, cn);
        //  adp.Fill(ds);
        //  for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //  {
        //      TreeNode tn = new TreeNode(ds.Tables[0].Rows[i][0].ToString());
        //      tn.Value = ds.Tables[0].Rows[i][0].ToString();
        //      TreeView1.Nodes.Add(tn);
        //      //TreeView1.CssClass = "panel-heading";
        //      //TreeView1.CssClass = "panel-title";
        //      // TreeView1.CssClass = "panel panel-default";
        //  }
        //  cn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        pnl_rating.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        pnl_rating.Visible = false;
    }

    protected void btn_cart_Click(object sender, EventArgs e)
    {
        int rate = Rating1.CurrentRating;
       
        try
        {
            //if (Session["umobileno"] == null)
            //{
            //   Response.Redirect("home.aspx");
            //}

            umobno = Session["umobileno"].ToString();

            cn.Open();
            q = "Select * from cart where umobileno=" + umobno + "and cart_itemdetail='" + proname + "'";
            cmd = new SqlCommand(q, cn);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.HasRows)
            {
                   while (dr1.Read())
                   {
                        cartid = Convert.ToInt32(dr1[0]);
                        q2 = Convert.ToInt32(dr1[7]) + Convert.ToInt32(ddl_qty.SelectedValue);
                        carttotal = Convert.ToInt32(proprice) * (q2);
                   }
                //txtcatname.Text  = "Cakkes";
               
                //cart
                if(q2 <= 5)
                {
                    cn1.Open();
                    q1 = "Update cart Set cart_qty=" + q2 + ",cart_total=" + carttotal + " where cartid=" + cartid + "";
                    cmd1 = new SqlCommand(q1, cn1);
                    cmd1.ExecuteNonQuery();
                    cn1.Close();
                }

                //rating
                cn1.Open();
                q = "select * from rating where umobileno ='" + Session["umobileno"].ToString() + "' and proname ='" + proname + "'";
                cmd = new SqlCommand(q, cn1);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write("<script>alert('You already gave a rating..');window.open('addtocart.aspx','_SELF');</script>");
                }
                else
                {
                    cn2.Open();
                    q1 = "insert into rating values('" + umobno + "','0','0','"+ proname + "','" + rate + "','0')";
                    cmd1 = new SqlCommand(q1, cn2);
                    cmd1.ExecuteNonQuery();
                    cn2.Close();
                }
                cn1.Close();

            }

            else
            {
                
                prototal = Convert.ToInt32(proprice) * Convert.ToInt32(ddl_qty.SelectedValue);
                cn1.Open();
                q1 = "insert into cart Values(" + proid + "," + umobno + ",'" + proimg + "','" + proname + "'," + proprice + "," + ddl_size.SelectedValue + "," + ddl_qty.SelectedValue + "," + prototal + ",'0','0')";
                cmd1 = new SqlCommand(q1, cn1);
                cmd1.ExecuteNonQuery();
                cn1.Close();
                
                
                //Rating 
                //cn.Close();
                cn1.Open();
                q = "select * from rating where umobileno ='" + Session["umobileno"].ToString() + "' and proname ='" + proname + "'";
                cmd = new SqlCommand(q, cn1);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write("<script>alert('You already gave a rating..');window.open('addtocart.aspx','_SELF');</script>");
                }
                else
                {
                    cn2.Open();
                    q1 = "insert into rating values('" + umobno + "','0','0','" + proname + "','" + rate + "','0')";
                    cmd1 = new SqlCommand(q1, cn2);
                    cmd1.ExecuteNonQuery();
                    cn2.Close();
                }
                cn1.Close();
            }
            cn.Close();

            Response.Redirect("addtocart.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('You Are Not Login');window.open('home.aspx','_SELF');</script>");
        }

    }
    protected void btn_send_Click(object sender, EventArgs e)
    {
        try
        {
            umobno = Session["umobileno"].ToString();

            cn.Open();
            q = "update rating set name='" + txtname.Text + "', eid='" + txtemail.Text + "', rmsg='" + txtmsg.Text + "' where umobileno ='" + umobno + "' and proname ='" + proname + "'";
            cmd = new SqlCommand(q, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('You Are Not Login');window.open('quickview.aspx','_SELF');</script>");
        }
        
    }
    protected void btn_pin_Click(object sender, EventArgs e)
    {
       
    }
    protected void btn_pin_Click1(object sender, EventArgs e)
    {
        pnl_pin.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        pnl_rating.Visible = true;
    }
}