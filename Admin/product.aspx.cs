using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    string qry;
    SqlDataReader dr;

    productDataContext x = new productDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        //try
        //{
            if (FileUpload1.HasFile)
            {
                string fileextension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileextension.ToLower() != ".jpg" && fileextension.ToLower() != ".jpeg" && fileextension.ToLower() != ".png")
                {
                    lbl_message.Text = "only jpg or jpeg file uploaded on front Image...";
                    lbl_message.ForeColor = System.Drawing.Color.Red;

                }
                else
                {
                    int filesize = FileUpload1.PostedFile.ContentLength;
                    if (filesize > 2097152)
                    {
                        lbl_message.Text = "Front file size to large...";
                        lbl_message.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Admin/upload/" + FileUpload1.FileName));
                        lbl_message.Text = "file uploaded Frontend...";
                        lbl_message.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            else
            {
                lbl_message.Text = "select the Front file...";
                lbl_message.ForeColor = System.Drawing.Color.Red;
            }

            if (fileupload_backend.HasFile)
            {
                string fileextension = System.IO.Path.GetExtension(fileupload_backend.FileName);
                if (fileextension.ToLower() != ".jpg" && fileextension.ToLower() != ".jpeg" && fileextension.ToLower() != ".png")
                {
                    lbl_message_backend.Text = "only jpg or jpeg file uploaded on Backend Image...";
                    lbl_message_backend.ForeColor = System.Drawing.Color.Red;

                }
                else
                {
                    int filesize = fileupload_backend.PostedFile.ContentLength;
                    if (filesize > 2097152)
                    {
                        lbl_message_backend.Text = "Backend file size to large...";
                        lbl_message_backend.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        fileupload_backend.SaveAs(Server.MapPath("~/Admin/upload/" + fileupload_backend.FileName));
                        lbl_message_backend.Text = "file uploaded Backend...";
                        lbl_message_backend.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            else
            {
                lbl_message_backend.Text = "select the Backend file...";
                lbl_message.ForeColor = System.Drawing.Color.Red;
            }

            
            //cn.Open();
            //qry = "select * from category where proname ='" + txtproname.Text + "'";
            //cmd = new SqlCommand(qry, cn);
            //dr = cmd.ExecuteReader();

            //if (dr.HasRows)
            //{
            //    Response.Write("<script>alert('Product Has Been Already Added..')</script>");
            //    txtproname.Text = "";
            //}
            //else
            //{
                product pr = new product
                {
                    subcatid = Convert.ToInt32(ddl_subcat.Text),
                    proname = txtproname.Text,
                    prodec = txtprodesc.Text,
                    // proimg = txtproimg.Text ,
                    proimg = FileUpload1.FileName,
                    probimg = fileupload_backend.FileName,
                    proprice = Convert.ToInt32(txtproprice.Text),
                    proofferprice = Convert.ToInt32(txtprooffrprice.Text),
                    status = Convert.ToInt32(ddlstatus.SelectedItem.Value),
                    category = Convert.ToInt32(ddlcat.SelectedItem.Value)
                };
                x.products.InsertOnSubmit(pr);
                x.SubmitChanges();

                Response.Redirect("product.aspx");
        ////    }

        ////}
        ////catch(Exception ex)
        ////{
        //    Response.Write("<script>alert('Invalid Product..')</script>");
        //}
       
       
    }
    protected void btn_res_Click(object sender, EventArgs e)
    {
        txtproname.Text = "";
        txtprodesc.Text = "";
        txtproprice.Text = "";
        txtprooffrprice.Text = "";

    }
}