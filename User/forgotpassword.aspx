<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="User_forgotpassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <center>
        
        <asp:Label ID="lblumobileno" style="font-family: Comic Sans MS; font-size: 20px; color:Orange;" runat="server" Text="Enter Your Registration Mobile No :"></asp:Label>
        
        <br />
        <br />
            <asp:TextBox ID="txtumobileno" style="border:2px solid #456879; border-radius:10px;	height: 22px; width: 230px;" 
            runat="server" ontextchanged="txtumobileno_TextChanged" ></asp:TextBox><br/>
        <br />
        <br />
            <%--<asp:Button ID="Butpwd" runat="server" style="background-color: orange; color: white; height:40px; border-radius:15px;" Text="Get Your Password"  onclick="Butpwd_Click" /><br/>--%>
       <asp:Button ID="btn_pwd" runat="server" Text="Get Your Password" 
            style="background-color: orange; color: white; height:40px; border-radius:15px; cursor:pointer;" 
            onclick="btn_pwd_Click"/>
        <br />
        <asp:Label ID="lblmsg" runat="server" ></asp:Label>
     </center>
    
    </div>
    </form>
</body>
</html>
