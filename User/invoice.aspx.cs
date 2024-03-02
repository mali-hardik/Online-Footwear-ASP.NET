using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Text;

public partial class User_Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlConnection cn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd1 = new SqlCommand();
    String q1;
    SqlCommand cmd = new SqlCommand();
    String umobno;
    String q;
    int pro_id;
    String cart_image;
    String cart_itemdetail;
    String cart_price;
    String cart_quantity;
    String cart_total;
    // String date1;
    // DateTime date1 = DateTime.Now.Date;
    // String date2 = Convert.ToString(date3);
    String rmobile_no;
    String smobile_no;
    String pm;
    String date5;
    String order_id;
    int grand_total;
    String email;
    String receivername;
    String Sendername;
    String receiveraddress;
    String status;
    String d3;
    DateTime da1 = DateTime.Today;
    String date1;
    String da2;

    protected void Page_Load(object sender, EventArgs e)
    {
        txtname.Text = Session["uname"].ToString();
        txtemail.Text = Session["email"].ToString();

        da2 = Convert.ToString(da1);
        date1 = da2.Substring(0, 10);

        email = Session["email"].ToString();
        umobno = Session["mobile"].ToString();
        // date5 = Session["delivery_date"].ToString();
        //date5 = d3.Substring(1, 10);
        // receivername = Session["receivername"].ToString();
        Sendername = Session["uname"].ToString();
        receiveraddress = Session["add"].ToString();
        DataTable dt = new DataTable();

        dt.Columns.AddRange(new DataColumn[3]{
		                    new DataColumn("Product Name"),
                            new DataColumn("Total Quntity"),
		                    new DataColumn("Total"),
                              
            });
        cn.Open();
        q = "Select * from cart where umobileno=" + umobno + "";
        cmd = new SqlCommand(q, cn);
        SqlDataReader dr2 = cmd.ExecuteReader();

        if (dr2.HasRows)
        {
            while (dr2.Read())
            {
                cn1.Open();
                q = "Select SUM(cart_total) from cart where umobileno=" + umobno + "";
                cmd = new SqlCommand(q, cn1);
                //txtcatname.Text  = "Cakkes";
                grand_total = Convert.ToInt32(cmd.ExecuteScalar());
                cn1.Close();
            }
        }

        cn.Close();
        cn.Open();
        q = "Select * from cart where umobileno=" + umobno + "";

        cmd = new SqlCommand(q, cn);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                // Session["cart_id"] = dr[1].ToString();
                pro_id = Convert.ToInt32(dr[1]);
                cart_image = dr[3].ToString();
                cart_price = dr[5].ToString();
                cart_itemdetail = dr[4].ToString();
                cart_quantity = dr[7].ToString();
                cart_total = dr[8].ToString();



                cn1.Open();
                //   date1 = DateTime.Today;
                //    rmobile_no = Session["rmobile_no"].ToString();
                smobile_no = Session["mobile"].ToString();
                pm = "paypal";
                status = "sucess";
                q1 = "insert into uorder Values('" + date1 + "'," + smobile_no + "," + umobno + "," + pro_id + ",'" + cart_image + "','" + cart_itemdetail + "'," + cart_price + "," + cart_quantity + "," + cart_total + ",'" + pm + "',1,'" + status + "')";
                cmd1 = new SqlCommand(q1, cn1);
                cmd1.ExecuteNonQuery();
                cn1.Close();

                dt.Rows.Add(cart_itemdetail, cart_quantity, cart_total);



            }

        }

        cn.Close();


        cn.Open();
        q = "Delete from cart where umobileno=" + umobno + "";
        cmd = new SqlCommand(q, cn);
        cmd.ExecuteNonQuery();

        cn.Close();


        //grand_total = Session["total"].ToString();
        cn.Open();
        q = "Select * from uorder where umobile_no=" + umobno + " AND pro_id=" + pro_id + " AND order_total=" + cart_total + " AND order_quantity=" + cart_quantity + " AND order_date='" + date1 + "'";
        //   q = "Select * from Uorder where umobile_no=" + umobno + "AND pro_id=" + Pro_id + "AND order_total=" + Cart_total + "AND order_quantity=" + Cart_quantity + "AND order_date='" + date1 + "'";AND delivery_date='" + date5 + "'";
        cmd = new SqlCommand(q, cn);
        SqlDataReader dr1 = cmd.ExecuteReader();

        if (dr1.HasRows)
        {
            while (dr1.Read())
            {
                order_id = dr1[0].ToString();
                SendPDFEmail(dt);
            }
        }
        cn.Close();
        // 
    }

    protected void BtnOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderHistory.aspx");
    }

    private void SendPDFEmail(DataTable dt)
    {
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                string companyName = "smartshop.com";
                int orderNo = Convert.ToInt32(order_id);
                StringBuilder sb = new StringBuilder();
                sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Retail Invoice/Bill</b></td></tr>");
                sb.Append("<tr><td><img src='C:/logo/lo.png' height='85' width='75' />&nbsp;" + "<font size='6' style='font-family:Times New Roman' color='#666362'>" + companyName + "</font>");
                // sb.Append("<td align='left'>");

                //sb.Append("<font size='6' style='font-family:Times New Roman' color='#666362'>"+ companyName + "</font>" );
                sb.Append("</td></tr> ");

                sb.Append("<tr><td colspan = '2'></td></tr>");

                sb.Append("<tr><td><b>Order No:</b>");

                sb.Append(orderNo);
                sb.Append("</td><td align='right'><b>Date: </b>");
                sb.Append(date1);
                sb.Append(" </td><td><b>Billing Address:</b> ");
                sb.Append("<br>" + Sendername + "<br>" + "<br>" + "Delivery Date:" + date5 + "<br>" + smobile_no + "<br>" + email);
                sb.Append(" </td><td align='right'><b>Shipping Address:</b> ");
                sb.Append("<br>" + receivername + "<br>" + receiveraddress + "<br>" + "<br>" + rmobile_no);
                sb.Append("</td></tr>");
                sb.Append("</table>");
                sb.Append("<br />");
                sb.Append("<table border = '1'>");
                sb.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    sb.Append("<th style = 'background-color: #FFA500;color:#ffffff'>");
                    sb.Append(column.ColumnName);
                    sb.Append("</th>");
                }
                sb.Append("</tr>");
                foreach (DataRow row in dt.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<td>");
                        sb.Append(row[column]);
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }
                sb.Append("</table>");
                sb.Append("<br />");

                sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");

                sb.Append("<tr><td align='right' colspan='2'> <b>Grand Total:</b></td></tr>");
                sb.Append("<tr><td align='right' colspan='2'>" + grand_total + "</td></tr>");

                sb.Append("</table>");

                StringReader sr = new StringReader(sb.ToString());

                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    byte[] bytes = memoryStream.ToArray();
                    memoryStream.Close();


                    MailMessage mail = new MailMessage();
                    string mailid = email;
                    mail.To.Add(mailid);
                    mail.From = new MailAddress("infotech.kakshi@gmail.com");
                    mail.Subject = "Invoice/Bill";
                    string Body = "Congratulations!Your Order has been registered and payment has been completed.!!The Order will Be delivered on the specified delivery date.Here is the invoice of Your order";
                    mail.Attachments.Add(new Attachment(new MemoryStream(bytes), "UserInvoice.pdf"));
                    mail.Body = Body;
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    //  smtp.Host = ConfigurationManager.AppSettings["SMTP"];
                    smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FROMMAIL"], ConfigurationManager.AppSettings["FROMPWD"]);
                    smtp.Host = "smtp.gmail.com";
                    smtp.Credentials = new System.Net.NetworkCredential("infotech.kakshi@gmail.com", "bhushan611");
                    smtp.Port = 587;  //465
                    smtp.EnableSsl = true;
                    smtp.Send(mail);

                }
            }
        }
    }

    protected void btn_send_Click(object sender, EventArgs e)
    {
        cn.Open();
        q = "insert into contact values('" + txtname.Text + "','" + txtemail.Text + "','" + txtmsg.Text + "')";
        cmd = new SqlCommand(q,cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        Response.Redirect("invoice.aspx");
    }
    protected void btn_ord_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderdetails.aspx");
    }
}