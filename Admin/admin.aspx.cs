using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    registrationDataContext x = new registrationDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string EnryptString(string strEncrypted)
    {
        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
        string encrypted = Convert.ToBase64String(b);
        return encrypted;
    }

    protected void btn_add_Click(object sender, EventArgs e)
    {
            
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

        registration rg = new registration
        {
            first_name = txtfnm.Text,
            email_id = txtemail.Text,
            password = txtpwd.Text,
            profile_pic = FileUpload1.FileName
        };
        x.registrations.InsertOnSubmit(rg);
        x.SubmitChanges();

        Response.Redirect("admin.aspx");
    }
}