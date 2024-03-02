using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    couponDataContext x = new couponDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        coupon c = new coupon()
        {
            c_code = txtc_code.Text,
            discount = Convert.ToInt32(txt_dis .Text),
            max_discount = Convert.ToInt32(txt_maxdis.Text),
            last_date = txt_cdate.Text
        };
        x.coupons.InsertOnSubmit(c);
        x.SubmitChanges();

        Response.Redirect("coupon.aspx");
    }
}