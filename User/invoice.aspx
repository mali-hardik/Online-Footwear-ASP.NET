<%@ Page Title="" Language="C#" MasterPageFile="~/User/after_usr.master" AutoEventWireup="true" CodeFile="invoice.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html>
<head>

 <%--back btn off--%>
   <%--<script type="text/javascript">

     {

         function DisableBackButton() {

             window.history.forward()

         }

         DisableBackButton();

         window.onload = DisableBackButton;

         window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }

         window.onunload = function () { void (0) }

     }

</script> --%>

  

<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: #282828;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 0px 110px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
  height:"0px";
}

.Button1 {
    background-color: #FDA30E;
    border: none;
    border-radius: 0;
}

.btn_ord {
  background-color: #4CAF50; /* Green */
  border: none;
  color: #282828;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 0px 110px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
  height:"0px";
}

.btn_ord {
    background-color: #FDA30E;
    border: none;
    border-radius: 0;
}
</style>
</head>
 <body>
  <div class="well" align="center" style="margin:2px">
    <%--<form runat="server"  id="form1">--%>
        <font size="8">
            <asp:Image ID="imgproprice" runat="server" ImageUrl="~/User/images/tick.png" height="80" Width ="80"></asp:Image>&nbsp;Thank You !!</font> 
            <br />
        <font size="4">
            Your payment was Sucessful and your invoice has been Sent to your mail!
        </font> 
        <br /><br />
        <br /><br />
         <%--<asp:Button ID="btn_ord" runat="server" Text="View Order Detail" 
          type="submit" onclick="btn_ord_Click" style=" background-color: #FDA30E; border: none; border-radius: 2px;" />--%>
         <br /><br />
        <br /><br />

        <div style="background-color: #FFFFFF;margin-left:200px;margin-right:200px;height:450px;">
            <div class="add-review">
			    <br />
                <h4>FEEDBACK</h4>
				     <%--<form>--%>
				<%--<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">--%>
                     <asp:TextBox ID="txtname" runat="server" placeholder="Name" 
                    style="margin-right:200px;margin-left:170px;width:50%" Enabled="False"></asp:TextBox>
				<%--<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">--%>
                     <asp:TextBox ID="txtemail" runat="server" placeholder="Email Id" 
                    style="margin-right:200px;width:50%;margin-left:170px" Enabled="False"></asp:TextBox><br /><br />
			    <%--<textarea type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>--%>
                     <asp:TextBox ID="txtmsg" runat="server" placeholder="Message" style="margin-right:200px;width:50%;height:100px;margin-left:170px"></asp:TextBox><br /><br />
                <%--<input type="submit" value="SEND">--%>
                    <asp:Button ID="btn_send" runat="server" Text="SEND" type="submit" 
                    onclick="btn_send_Click"/>
			       <%--</form>--%>
			</div>
       </div>
  </div>
 </body>
</html>
</asp:Content>

