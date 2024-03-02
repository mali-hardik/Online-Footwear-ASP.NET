<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="User_search" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Footwere</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Smart Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>

<%--<script type="text/javascript">    
    function btn_continue() {
        __doPostBack('OnClick', 'Button_ID');
    }
</script>--%>
</head>
<body>
  <form id ="form1" runat="server" method="post">
<!-- header -->
<div class="header">
	<div class="container">
		<ul>
			<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>Free and Fast Delivery</li>
			<li><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Free shipping On all orders</li>
			<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="">smartshop.com</a></li>
		</ul>
	</div>
</div>
<!-- //header -->
<!-- header-bot -->
<div class="header-bot">
	<div class="container">
		<div class="col-md-3 header-left">
			<h1><a href="#"><img src="images/logo3.jpg"></a></h1>
		</div>
		<div class="col-md-6 header-middle">
		    <form>
				<div class="search">
					<%--<input type="search" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}" required="">--%>
                    <asp:TextBox ID="txt_ser" runat="server" type="search" placeholder="Search"></asp:TextBox>
				</div>
				<div class="section_room">
					<%--<select id="country" onchange="change_country(this.value)" class="frm-field required">
						<option value="null">All categories</option>
						<option value="null">Electronics</option>     
						<option value="AX">kids Wear</option>
						<option value="AX">Men's Wear</option>
						<option value="AX">Women's Wear</option>
						<option value="AX">Watches</option>
					</select>--%>
                    <asp:DropDownList ID="ddl_ser" runat="server" style="cursor:pointer;" 
                        AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="cname" 
                        DataValueField="cid" onselectedindexchanged="ddl_ser_SelectedIndexChanged">
                    </asp:DropDownList>
				    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
				</div>
				<div class="sear-sub" style="height:50px;">
					<%--<input type="submit" value=" ">--%>
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/User/images/search1.png" style="height:50px;width:100%" 
                        onclick="ImageButton1_Click" />
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
		
		<div class="clearfix"></div>
	</div>
</div>
<!-- //header-bot -->
<!-- banner -->
<div class="ban-top">
	<div class="container">
		<div class="top_nav_left">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav menu__list">
					<li class=" menu__item "><a class="menu__link" href="index.aspx" >Home </a></li>
					<li class=" menu__item "><a class="menu__link" href="men.aspx?mid=1" >Men</a></li>
					<li class=" menu__item "><a class="menu__link" href="women.aspx?mid=2" >Women</a></li>
					<li class=" menu__item "><a class="menu__link" href="children.aspx?mid=3" >Children</a></li>
                    <li class=" menu__item "><a class="menu__link" href="orderdetails.aspx" >Order Details</a></li>
					<li class=" menu__item "><a class="menu__link" href="contact.aspx" >Contact</a></li>
				  </ul>
				</div>
			  </div>
			</nav>	
		</div>
		<div class="top_nav_right">
			<div class="cart box_1">
						<a href="addtocart.aspx">
							<h3> <div class="total">
								    <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								    <span><%--<asp:Label ID="lbl_tot_men" runat="server" Text=""></asp:Label>--%></span> (<span></span> items)
                                </div>
								
							</h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
			</div>	
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //banner-top -->
<!-- banner -->
<div class="">
	<div class="container">
		<h3></h3>
	</div>
</div>
<!-- //banner -->
<!-- mens -->
<div class="men-wear">
	<div class="container">
		<div class="col-md-4 products-left">
			<div class="filter-price">
				<h3>Filter By Price</h3>
					<ul class="dropdown-menu6">
						<li>                
							<div id="slider-range"></div>							
							<input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />
						</li>			
					</ul>
							<!---->
							<script type='text/javascript'>//<![CDATA[
							    $(window).load(function () {
							        $("#slider-range").slider({
							            range: true,
							            min: 0,
							            max: 9000,
							            values: [1000, 7000],
							            slide: function (event, ui) {
							                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
							            }
							        });
							        $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

							    });//]]>  

							</script>
						<script type="text/javascript" src="js/jquery-ui.js"></script>
					 <!---->
			</div>
            <div class="css-treeview">
				<h4>Categories</h4>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <ul style="text-align:justify;margin-left:50px;">
                            <li><a href='search.aspx?pid=<%#Eval ("subcatid") %>&catid=<%#Eval ("catid") %>'><%#Eval ("subcatname") %></a></li>
						</ul>
                    </ItemTemplate>
                </asp:ListView>
		
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT * FROM [subcategory] WHERE ([catid] = @catid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="catid" QueryStringField="catid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
		
			</div>
           
			<div class="community-poll">
				<h4>Community Poll</h4>
				<div class="swit form">	
					<%--<form>--%>
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio" checked=""><i></i>More convenient for shipping and delivery</label> </div></div>
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Lower Price</label> </div></div>
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Track your item</label> </div></div>
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Bigger Choice</label> </div></div>
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>More colors to choose</label> </div></div>	
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Secured Payment</label> </div></div>
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Money back guaranteed</label> </div></div>	
					<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio"><i></i>Others</label> </div></div>		
					<input type="submit" value="SEND">
					<%--</form>--%>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="col-md-8 products-right">
			<h5>Product Compare(0)</h5>
			<div class="sort-grid">
				<div class="sorting">
					<h6>Sort By</h6>
					<select id="country1" onchange="change_country(this.value)" class="frm-field required sect">
						<option value="null">Default</option>
						<option value="null">Name(A - Z)</option> 
						<option value="null">Name(Z - A)</option>
						<option value="null">Price(High - Low)</option>
						<option value="null">Price(Low - High)</option>	
						<option value="null">Model(A - Z)</option>
						<option value="null">Model(Z - A)</option>					
					</select>
                    <%--<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Default</asp:ListItem>
                        <asp:ListItem>Name(A - Z)</asp:ListItem>
                        <asp:ListItem>Name(Z - A)</asp:ListItem>
                        <asp:ListItem>Price(High - Low)</asp:ListItem>
                        <asp:ListItem>Price(Low - High)</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sql_default" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_a_z" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_z_a" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_h_l" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_l_h" runat="server"></asp:SqlDataSource>--%>
					<div class="clearfix"></div>
				</div>
				<div class="sorting">
					<h6>Showing</h6>
					<select id="country2" onchange="change_country(this.value)" class="frm-field required sect">
						<option value="null">7</option>
						<option value="null">14</option> 
						<option value="null">28</option>					
						<option value="null">35</option>								
					</select>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="men-wear-top">
				<script src="js/responsiveslides.min.js"></script>
				<script>
				    // You can also use "$(window).load(function() {"
				    $(function () {
				        // Slideshow 4
				        $("#slider3").responsiveSlides({
				            auto: true,
				            pager: true,
				            nav: false,
				            speed: 500,
				            namespace: "callbacks",
				            before: function () {
				                $('.events').append("<li>before event fired.</li>");
				            },
				            after: function () {
				                $('.events').append("<li>after event fired.</li>");
				            }
				        });
				    });
				</script>
				
				<div class="clearfix"></div>
			</div>
          
  <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
    <HeaderTemplate>

        <div class="product-easy">
	      <div class="container" style=" width:auto;">

           <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
		        $(document).ready(function () {
		            $('#horizontalTab').easyResponsiveTabs({
		                type: 'default', //Types: default, vertical, accordion           
		                width: 'auto', //auto or any width like 600px
		                fit: true   // 100% fit in a container
		            });
		        });
							
		</script>
		<div class="sap_tabs">
			<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
					<%--<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li>--%>
				</ul>			  	 
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
    </HeaderTemplate>
    <ItemTemplate>
        <div style="width:auto;" class="col-md-3 product-men">
				<div class="men-pro-item simpleCart_shelfItem">
					<div class="men-thumb-item">
						<img src='../Admin/upload/<%#Eval("proimg") %>' alt="" class="pro-image-front" height="250px">
						<img src='../Admin/upload/<%#Eval("probimg") %>' alt="" class="pro-image-back" height="250px">
							<div class="men-cart-pro">
							    <div class="inner-men-cart-pro">
									<a href='quickview.aspx?proid=<%#Eval("proid") %>' class="link-product-add-cart">Quick View</a>
							    </div>
							</div>
									<span class="product-new-top">New</span>
										
							</div>
							<div class="item-info-product ">
									<h4><a href=""><%#Eval("proname")%></a></h4>
							<div class="info-product-price">
									<span class="item_price"><%# "₹ " + Eval("proofferprice")%></span>
									<del><%# "₹ " + Eval("proprice")%></del>
							</div>
						<%--<a href="#" class="item_add single-item hvr-outline-out button2">Add to cart</a>--%>
					</div>
				</div>
                <br />
             </div>
             <%--<div class="clearfix"></div>--%>
          
    </ItemTemplate>
    <FooterTemplate>
                </div>
               </div>
              </div>
             </div>
            </div>
           </div>
    </FooterTemplate>
    
    </asp:DataList>
				
                <div class="clearfix"></div>
			</div>
		</div>
	</div>

     <div class="pagination-grid text-right">
              <ul class="pagination paging">
				<%--<li><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>--%>
                  <%--<asp:Button ID="btn_frst" runat="server" Text="<<" onclick="btn_frst_Click" />--%>
                  <li><asp:Button ID="btn_pre" runat="server" Text="<" onclick="btn_pre_Click" BackColor="#FDA30E" style="cursor:pointer;"/></li>
                  <li><asp:Button ID="btn_nxt" runat="server" Text=">" onclick="btn_nxt_Click" BackColor="#FDA30E" style="cursor:pointer;"/></li>
                  <%--<asp:Button ID="btn_lst" runat="server" Text=">>" onclick="btn_lst_Click" />--%>
			  </ul>
           </div>			
<!-- //mens -->
<!-- //product-nav -->
<div class="coupons">
	<div class="container">
		<div class="coupons-grids text-center">
			<div class="col-md-3 coupons-gd">
				<h3>Buy your product in a simple way</h3>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<h4>LOGIN TO YOUR ACCOUNT</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
				<h4>SELECT YOUR ITEM</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
				<h4>MAKE PAYMENT</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-left">
			<h2><a href="index.html"><img src="images/logo3.jpg" alt=" " /></a></h2>
			<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur, adipisci velit, sed quia non 
			numquam eius modi tempora incidunt ut labore 
			et dolore magnam aliquam quaerat voluptatem.</p>
		</div>
		<div class="col-md-9 footer-right">
			<div class="col-sm-6 newsleft">
				<h3>SIGN UP FOR NEWSLETTER !</h3>
			</div>
		
			<div class="clearfix"></div>
			<div class="sign-grds">
				<div class="col-md-4 sign-gd">
					<h4>Information</h4>
					<ul>
						<li><a href="home.aspx">Home</a></li>
						<li><a href="men.aspx">Men</a></li>
						<li><a href="women.aspx">Women</a></li>
						<li><a href="children.aspx">Children</a></li>
						<li><a href="contact.aspx">Contact</a></li>
					</ul>
				</div>
				
				<div class="col-md-4 sign-gd-two">
					<h4>Store Information</h4>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Address : 12k Street, 45 Building Road <span>Newyork City.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : <a href="">smartshop.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone : +9099400550</li>
					</ul>
				</div>
			  <div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<p class="copy-right">Copyright &copy 2019, smart shop. All rights reserved <%--| Design by <a href="http://w3layouts.com/">W3layouts</a>--%></p>
	</div>
</div>
<!-- //footer -->
    </form>
  </body>
</html>


