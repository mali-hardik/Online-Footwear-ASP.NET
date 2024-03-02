using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Pagination;

public partial class User_search : System.Web.UI.Page
{

    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry;
    SqlDataAdapter dap = new SqlDataAdapter();
    DataSet ds = new DataSet();
    SqlDataReader dr;
    DataTable dt = new DataTable();

    static int currentposition1 = 0;
    static int totalrows1 = 0;

    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            binddata();
        }

    }

    private void binddata()
    {
        try
        {

            int catid;
            //   int subcatid = Convert.ToInt32(Session["subcatid"].ToString());
            int pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
            catid = Convert.ToInt32(Request.QueryString["catid"].ToString());

            qry = "select * from product where subcatid='" + pid + "'";
            dap = new SqlDataAdapter(qry, cn);
            ds.Clear();
            dap.Fill(ds);
            DataList1.DataSource = ds.Tables[0];

            totalrows1 = ds.Tables[0].Rows.Count;
            DataTable dt = ds.Tables[0];
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition1;
            pg.PageSize = 3;
            //btn_frst.Enabled = !pg.IsFirstPage;
            btn_pre.Enabled = !pg.IsFirstPage;
            btn_nxt.Enabled = !pg.IsLastPage;
            //btn_lst.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
            DataList1.DataBind();

        }
        catch (Exception ex)
        {
            ds.Clear();
            qry = "select TOP 6 * from product order by proname";
            dap = new SqlDataAdapter(qry, cn);
            dap.Fill(ds);
            DataList1.DataSource = ds.Tables[0];

            totalrows1 = ds.Tables[0].Rows.Count;
            DataTable dt = ds.Tables[0];
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition1;
            pg.PageSize = 3;
            //btn_frst.Enabled = !pg.IsFirstPage;
            btn_pre.Enabled = !pg.IsFirstPage;
            btn_nxt.Enabled = !pg.IsLastPage;
            //btn_lst.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
            DataList1.DataBind();

        }

    }

   
    protected void ddl_ser_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?catid=" + ddl_ser.SelectedValue);
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        qry = "select * from product where proname='" + txt_ser.Text + "'";
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Response.Redirect("~/user/searchbox.aspx?proname=" + txt_ser.Text);
        }
        else
        {
            Response.Write("<script>alert('Invalid Searching Data..')</script>");
        }
        cn.Close();
    }

    protected void btn_pre_Click(object sender, EventArgs e)
    {
        if (currentposition1 == 0)
        {

        }
        else
        {
            currentposition1 = currentposition1 - 1;
            binddata();
        }
    }
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        if (currentposition1 == totalrows1 - 1)
        {

        }
        else
        {
            currentposition1 = currentposition1 + 1;
            binddata();
        }
    }
}