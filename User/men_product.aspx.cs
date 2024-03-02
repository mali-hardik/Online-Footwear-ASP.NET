using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class User_Default : System.Web.UI.Page
{   
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    string qry;
    SqlDataAdapter dap = new SqlDataAdapter();
    DataSet ds = new DataSet();

    static int currentposition1 = 0;
    static int currentposition2 = 0;
    static int currentposition3 = 0;
    static int totalrows1 = 0;
    static int totalrows2 = 0;
    static int totalrows3 = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddata();
        }

    }

    private void binddata()
    {
        int id;
        int mid = Convert.ToInt32(Session["mid"].ToString());
        ViewState["mid"] = Convert.ToInt32(Session["mid"].ToString());
        id = Convert.ToInt32(Request.QueryString["id"].ToString());

        if(mid == 1)
        {
            cn.Open();
            qry = "select * from product where subcatid='" + id + "' and category=" + mid;
            dap = new SqlDataAdapter(qry, cn);
            dap.Fill(ds);
            DataList1.DataSource = ds.Tables[0];

            totalrows1 = ds.Tables[0].Rows.Count;
            DataTable dt = ds.Tables[0];
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition1;
            pg.PageSize = 6;
            //btn_frst.Enabled = !pg.IsFirstPage;
            btn_pre.Enabled = !pg.IsFirstPage;
            btn_nxt.Enabled = !pg.IsLastPage;
            //btn_lst.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
            DataList1.DataBind();
            cn.Close();
        }

        if (mid == 2)
        {
            cn.Open();
            qry = "select * from product where subcatid='" + id + "' and category=" + mid;
            dap = new SqlDataAdapter(qry, cn);
            dap.Fill(ds);
            DataList1.DataSource = ds.Tables[0];

            totalrows2 = ds.Tables[0].Rows.Count;
            DataTable dt = ds.Tables[0];
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition2;
            pg.PageSize = 6;
            //btn_frst.Enabled = !pg.IsFirstPage;
            btn_pre.Enabled = !pg.IsFirstPage;
            btn_nxt.Enabled = !pg.IsLastPage;
            //btn_lst.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
            DataList1.DataBind();
            cn.Close();
        }
        if (mid == 3)
        {
            cn.Open();
            qry = "select * from product where subcatid='" + id + "' and category=" + mid;
            dap = new SqlDataAdapter(qry, cn);
            dap.Fill(ds);
            DataList1.DataSource = ds.Tables[0];

            totalrows3 = ds.Tables[0].Rows.Count;
            DataTable dt = ds.Tables[0];
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition3;
            pg.PageSize = 6;
            //btn_frst.Enabled = !pg.IsFirstPage;
            btn_pre.Enabled = !pg.IsFirstPage;
            btn_nxt.Enabled = !pg.IsLastPage;
            //btn_lst.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
            DataList1.DataBind();
            cn.Close();
        }
    }
    /*
    protected void btn_frst_Click(object sender, EventArgs e)
    {
        currentposition = 0;
        binddata();
    }*/
    protected void btn_pre_Click(object sender, EventArgs e)
    {
        int mid = Convert.ToInt32(ViewState["mid"].ToString());
        if(mid == 1)
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
        if (mid == 2)
        {
            if (currentposition2 == 0)
            {

            }
            else
            {
                currentposition2 = currentposition2 - 1;
                binddata();
            }
        }
        if (mid == 3)
        {
            if (currentposition3 == 0)
            {

            }
            else
            {
                currentposition3 = currentposition3 - 1;
                binddata();
            }
        }
        
    }
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        int mid = Convert.ToInt32(ViewState["mid"].ToString());
        if(mid == 1)
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
        if (mid == 2)
        {
            if (currentposition2 == totalrows2 - 1)
            {

            }
            else
            {
                currentposition2 = currentposition2 + 1;
                binddata();
            }

        }
        if (mid == 3)
        {
            if (currentposition3 == totalrows3 - 1)
            {

            }
            else
            {
                currentposition3 = currentposition3 + 1;
                binddata();
            }

        }
       
    }
    /*
    protected void btn_lst_Click(object sender, EventArgs e)
    {
        currentposition = totalrows - 1;
        binddata();
    }*/
    protected void sql_a_z_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataList1.DataSourceID = null;

        if (DropDownList1.SelectedItem.Text == "Default")
        {
            DataList1.DataSource = sql_default;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Name(A - Z)")
        {
            DataList1.DataSource = sql_a_z;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Name(Z - A)")
        {
            DataList1.DataSource = sql_z_a;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Price(High - Low)")
        {
            DataList1.DataSource = sql_h_l;
            DataList1.DataBind();
        }
        if (DropDownList1.SelectedItem.Text == "Price(Low - High)")
        {
            DataList1.DataSource = sql_l_h;
            DataList1.DataBind();
        }
    }
}
