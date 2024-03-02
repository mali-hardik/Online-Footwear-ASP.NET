<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Admin_login" %>

<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<title>Admin :: Log In Page</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Modish Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
	<script>
	    addEventListener("load", function () {
	        setTimeout(hideURLbar, 0);
	    }, false);

	    function hideURLbar() {
	        window.scrollTo(0, 1);
	    }
	</script>
	<!-- Meta tag Keywords -->
   
	<!-- css files -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->

	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Tangerine:400,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
	<!-- //web-fonts -->
</head>

<body>
	<!-- title -->
	<h1>
		<span>S</span>mart
		<span>S</span>hop
		<span>L</span>ogin
        <span>F</span>orm
	</h1>
	<!-- //title -->

	<!-- content -->
	<div class="sub-main-w3">
		<form class="login" action="#" method="post" runat="server">
			<p class="legend">Login Here<span class="fa fa-hand-o-down"></span></p>
		
            <div class="input">
				<%--<input type="email" placeholder="Email" name="email" required />--%>
                <asp:TextBox ID="txtemail" runat="server" type="email" placeholder="Email" name="email" required></asp:TextBox>
				<span class="fa fa-envelope"></span>
			</div>
			<div class="input">
				<%--<input type="password" placeholder="Password" name="password" required />--%>
                <asp:TextBox ID="txtpwd" runat="server" type="password" placeholder="Password" name="password" required></asp:TextBox>
				<span class="fa fa-unlock"></span>
			</div>
			
        <asp:Label ID="lbl1" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
            <%--<button type="submit" class="submit">
				<span class="fa fa-sign-in"></span>
			</button>--%>
        <asp:Button ID="btnlog" runat="server" Text="login" type="submit" class="submit" 
                onclick="btnlog_Click">
        </asp:Button >
      <%--  <asp:ImageButton ID="ImageButton1" runat="server" />--%>
        </form>
	</div>
	<!-- //content -->

	<!-- copyright -->
	<div class="footer">
		<h2>&copy; 2019 Footwere Login Form. All rights reserved <%--| Design by--%>
			<%--<a href="#">Footwere</a>--%>
		</h2>
	</div>
	<!-- //copyright -->

</body>

</html>