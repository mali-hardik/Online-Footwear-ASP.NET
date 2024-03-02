using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    gallaryDataContext x = new gallaryDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        //FileUpload Front
        if (fup_front.HasFile)
        {
            string fileextension = System.IO.Path.GetExtension(fup_front.FileName);
            if (fileextension.ToLower() != ".jpg" && fileextension.ToLower() != ".jpeg" && fileextension.ToLower() != ".png")
            {
                lbl_message_front.Text = "only jpg or jpeg file uploaded on front Image...";
                lbl_message_front.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                int filesize = fup_front.PostedFile.ContentLength;
                if (filesize > 2097152)
                {
                    lbl_message_front.Text = "Front file size to large...";
                    lbl_message_front.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    fup_front.SaveAs(Server.MapPath("~/Admin/gallery/" + fup_front.FileName));
                    lbl_message_front.Text = "file uploaded Frontend...";
                    lbl_message_front.ForeColor = System.Drawing.Color.Green;
                }
            }
        }
        else
        {
            lbl_message_front.Text = "select the Front file...";
            lbl_message_front.ForeColor = System.Drawing.Color.Red;
        }

        //FileUpload Back
        if (fup_back.HasFile)
        {
            string fileextension = System.IO.Path.GetExtension(fup_back.FileName);
            if (fileextension.ToLower() != ".jpg" && fileextension.ToLower() != ".jpeg" && fileextension.ToLower() != ".png")
            {
                lbl_message_back.Text = "only jpg or jpeg file uploaded on Back Image...";
                lbl_message_back.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                int filesize = fup_back.PostedFile.ContentLength;
                if (filesize > 2097152)
                {
                    lbl_message_back.Text = "Back file size to large...";
                    lbl_message_back.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    fup_back.SaveAs(Server.MapPath("~/Admin/gallery/" + fup_back.FileName));
                    lbl_message_back.Text = "file uploaded Backend...";
                    lbl_message_back.ForeColor = System.Drawing.Color.Green;
                }
            }
        }
        else
        {
            lbl_message_back.Text = "select the Back file...";
            lbl_message_back.ForeColor = System.Drawing.Color.Red;
        }

        //FileUpload Right
        if (fup_right.HasFile)
        {
            string fileextension = System.IO.Path.GetExtension(fup_right.FileName);
            if (fileextension.ToLower() != ".jpg" && fileextension.ToLower() != ".jpeg" && fileextension.ToLower() != ".png")
            {
                lbl_message_right.Text = "only jpg or jpeg file uploaded on Right Image...";
                lbl_message_right.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                int filesize = fup_right.PostedFile.ContentLength;
                if (filesize > 2097152)
                {
                    lbl_message_right.Text = "Right file size to large...";
                    lbl_message_right.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    fup_right.SaveAs(Server.MapPath("~/Admin/gallery/" + fup_right.FileName));
                    lbl_message_right.Text = "file uploaded Rightend...";
                    lbl_message_right.ForeColor = System.Drawing.Color.Green;
                }
            }
        }
        else
        {
            lbl_message_right.Text = "select the Right file...";
            lbl_message_right.ForeColor = System.Drawing.Color.Red;
        }

        //FileUpload Left
        if (fup_left.HasFile)
        {
            string fileextension = System.IO.Path.GetExtension(fup_left.FileName);
            if (fileextension.ToLower() != ".jpg" && fileextension.ToLower() != ".jpeg" && fileextension.ToLower() != ".png")
            {
                lbl_message_left.Text = "only jpg or jpeg file uploaded on left Image...";
                lbl_message_left.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                int filesize = fup_left.PostedFile.ContentLength;
                if (filesize > 2097152)
                {
                    lbl_message_left.Text = "Left file size to large...";
                    lbl_message_left.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    fup_left.SaveAs(Server.MapPath("~/Admin/gallery/" + fup_left.FileName));
                    lbl_message_left.Text = "file uploaded Leftend...";
                    lbl_message_left.ForeColor = System.Drawing.Color.Green;
                }
            }
        }
        else
        {
            lbl_message_left.Text = "select the Left file...";
            lbl_message_left.ForeColor = System.Drawing.Color.Red;
        }

        gallery g = new gallery
        {
            proid = Convert.ToInt32(drp_proid.Text),
            gallfimg = fup_front.FileName,
            gallbimg = fup_back.FileName,
            gallrimg = fup_right.FileName,
            galllimg = fup_left.FileName,
        };
        x.galleries.InsertOnSubmit(g)   ;
        x.SubmitChanges();

        Response.Redirect ("gallery.aspx");
        //lbl_message_front.Text = "";
        //lbl_message_back.Text = "";
        //lbl_message_right.Text = "";
        //lbl_message_left.Text = "";
    }
    protected void btn_res_Click(object sender, EventArgs e)
    {
        
    }
}