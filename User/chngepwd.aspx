<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chngepwd.aspx.cs" Inherits="User_chngepwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <center>
        
        <asp:Label ID="lblumobileno" style="font-family: Comic Sans MS; font-size: 20px; color:Orange;" runat="server" Text="Change Your Password :"></asp:Label>
        
        <br />
        <br />

            <asp:TextBox ID="txtopwd" style="border:2px solid #456879; border-radius:10px;	height: 22px; width: 230px;" 
            runat="server" placeholder="                Enter Old Password" TextMode="Password"></asp:TextBox><br/><br />
            
            <asp:TextBox ID="txtnpwd" style="border:2px solid #456879; border-radius:10px;	height: 22px; width: 230px;" 
            runat="server" placeholder="                Enter New Password" TextMode="Password"></asp:TextBox><br/><br />
            
            <asp:TextBox ID="txtncpwd" style="border:2px solid #456879; border-radius:10px;	height: 22px; width: 230px;" 
            runat="server" placeholder="         Enter New Confirm Password" TextMode="Password"></asp:TextBox><br/><br />
        <br />
       <asp:Button ID="btn_pwd" runat="server" Text="CHANGE" 
            style="background-color: orange; color: white; height:40px; border-radius:15px; cursor:pointer;" 
            onclick="btn_pwd_Click" />
        <br />
        <asp:Label ID="lblmsg" runat="server" ></asp:Label>
        <br />
      <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
       </asp:ScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
           <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="1000" 
               ontick="Timer1_Tick">
           </asp:Timer>
       </ContentTemplate>
       </asp:UpdatePanel>--%>
     </center>
    
    </div>
    </form>
</body>
</html>
