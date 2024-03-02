using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class User_men : System.Web.UI.MasterPage
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry;
    SqlDataAdapter dap = new SqlDataAdapter();
    DataSet ds = new DataSet(); 
    string ct;
    SqlDataReader dr;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            fillcat();
        }
    }

    void fillcat()
    {

        cn.Open();
        qry = "select cname from category where status=1";
        dap = new SqlDataAdapter(qry, cn);
        dap.Fill(ds);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            TreeNode tn = new TreeNode(ds.Tables[0].Rows[i][0].ToString());
            tn.Value = ds.Tables[0].Rows[i][0].ToString();
            tn.ImageUrl = "images/2.png";
            TreeView1.Nodes.Add(tn);
        }
        
    }

   
    //protected void imgbtn_close_Click(object sender, EventArgs e)
    //{
    //    txt_lmob.Text = "";
    //    txt_lpwd.Text = "";
    //    txt_rmob.Text = "";
    //    txt_rpwd.Text = "";
       

    //}

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string k = Convert.ToString(TreeView1 .SelectedValue );
        TreeView1.SelectedNode.ChildNodes.Clear();

        if(TreeView1 .SelectedNode .ChildNodes .Count == 0)
        {
            cn.Open();
            qry = "select subcatid,subcatname from subcategory where status=1 and catid=(select cid from category where cname='" + k + "')";
            dap = new SqlDataAdapter(qry, cn);
            dap.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                TreeNode ct = new TreeNode(ds.Tables[0].Rows[i][1].ToString());
                ct.Value = ds.Tables[0].Rows[i][0].ToString();
                ct.ImageUrl = "images/2.png";
                TreeView1.SelectedNode.ChildNodes.Add(ct);
                ct.NavigateUrl = "men_product.aspx?id=" + ct.Value;
            }
            cn.Close();
        }
    }

    //protected void btn_signin_Click(object sender, EventArgs e)
    //{
    //    cn.Open();
    //    qry = "select * from user_mstr where umobileno ='" + txt_lmob.Text + "' and password ='" + txt_lpwd.Text + "'";
    //    cmd = new SqlCommand(qry, cn);
    //    dr = cmd.ExecuteReader();

    //    if (dr.HasRows)
    //    {
    //        dr.Read();

    //        //Session["uname"] = dr["uname"];
    //        Session["umobileno"] = txt_lmob.Text;
    //        //Session["profile_pic"] = dr["profile_pic"];

    //        Response.Redirect("~/user/index.aspx");
    //    }
    //    else
    //    {
    //       // lbl1.Text = "Invalid Sign IN Data..";
    //        Response.Write("<script>alert('Invalid Sign In Data..')</script>");  
    //    }

    //    cn.Close();
    //}

    //protected void btn_signup_Click2(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        cn.Open();
    //        qry = "insert into user_mstr values ('" + txt_rmob.Text + "','" + txt_rpwd.Text + "')";
    //        cmd = new SqlCommand(qry, cn);
    //        cmd.ExecuteNonQuery();
    //        cn.Close();
    //        txt_rmob.Text = "";
    //        txt_rpwd.Text = "";
    //        txt_rcpwd.Text = "";
    //    }
    //    catch
    //    {
    //        //lbl1.Text = "Invalid Sign UP Data..";
    //        Response.Write("<script>alert('Invalid Sign Up Data..')</script>");
    //    }
    //}
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Response.Redirect("search.aspx?catid=" + DropDownList1.SelectedValue);
    //}
    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    cn.Open();
    //    qry = "select * from product where proname='" + txt_ser.Text + "'";
    //    cmd = new SqlCommand(qry, cn);
    //    dr = cmd.ExecuteReader();

    //    if (dr.HasRows)
    //    {
    //        Response.Redirect("~/user/searchbox.aspx?proname=" + txt_ser.Text);
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('Invalid Searching Data..')</script>");
    //        txt_ser.Text = "";
    //    }
    //    cn.Close();
    //}
}

