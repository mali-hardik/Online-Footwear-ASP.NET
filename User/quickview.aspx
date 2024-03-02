<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.master" AutoEventWireup="true" CodeFile="quickview.aspx.cs" Inherits="User_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html>
<head>
<title>Footwear</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Smart Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- single -->
<script src="js/imagezoom.js"></script>
<script src="js/jquery.flexslider.js"></script>
<!-- single -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>

<%--<!--panel-->
    <script type="text/javascript" language="javascript">
        function ShowPopUp() {
            document.getElementById('<%=.Panel1 %>').style.display = "block";
        }
    </script>
<!--//panel-->--%>

<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: #282828;
  padding: 13px 40px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  
  margin: 0px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
  height:"5px";
}

.Button1 {
    background-color: #F7F7F7;
    border: none;
    border-radius: 0;
}

.Button1:hover {
  background-color: #FDA30E;
  color: white;
}


.Button2 {
    background-color: #F7F7F7;
    border: none;
    border-radius: 0;
}

.Button2:hover {
  background-color: #FDA30E;
  color: white;
}


.Button3 {
    background-color: #FDA30E;
    border: none;
    border-radius: 0;
}

.starempty
        {
            background-image: url(stars/starempty.png);
            width: 20px;
            height: 20px;
        }
.starfilled
        {
            background-image: url(stars/starfilled.png);
            width: 20px;
            height: 20px;
        }
.starwaiting
        {
            background-image: url(stars/starwaiting.png);
            width: 20px;
            height: 20px;
        }
        
    .style1
    {
        width: 100%;
    }
        
    .style2
    {
        width: 72px;
    }
    .style3
    {
        width: 13px;
    }
        
    .style4
    {
        width: 96px;
    }
        
</style>

</head>
<body>
<!-- banner -->
<div class="page-head">
	<div class="container">
		<h3>Quick View</h3>
	</div>
</div>
<!-- //banner -->
<!-- single -->

<div class="single">
	<div class="container">
        <div class="col-md-6 single-right-left animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
            <div class="grid images_3_of_2">
				<div class="flexslider">
					<!-- FlexSlider -->
						<script>
						    // Can also be used with $(document).ready()
						    $(window).load(function () {
						        $('.flexslider').flexslider({
						            animation: "slide",
						            controlNav: "thumbnails"
						        });
						    });
						</script>
					<!-- //FlexSlider-->
					<ul class="slides">
						<li data-thumb='../Admin/gallery/<%#Eval("gallfimg") %>' style="height: 1000px; width: 150px">
							<div class="thumb-image"> <img src='../Admin/gallery/<%#Eval("gallfimg") %>' data-imagezoom="true" class="img-responsive" > </div>
						</li>
						<li data-thumb='../Admin/gallery/<%#Eval("gallbimg") %>' style="height: 1000px; width: 150px">
							<div class="thumb-image"> <img src='../Admin/gallery/<%#Eval("gallbimg") %>' data-imagezoom="true" class="img-responsive" > </div>
						</li>	
						<li data-thumb='../Admin/gallery/<%#Eval("gallrimg") %>' style="height: 1000px; width: 150px">
							<div class="thumb-image"> <img src='../Admin/gallery/<%#Eval("gallrimg") %>' data-imagezoom="true" class="img-responsive" > </div>
						</li>
						<li data-thumb='../Admin/gallery/<%#Eval("galllimg") %>' style="height: 1000px; width: 150px">
							<div class="thumb-image"> <img src='../Admin/gallery/<%#Eval("galllimg") %>' data-imagezoom="true" class="img-responsive" > </div>
						</li>	
					</ul>
				<%--<div class="clearfix"></div>--%>
				</div>	
			</div>
            </ItemTemplate>
          </asp:DataList>
		    
		    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:constr %>" 
                SelectCommand="SELECT * FROM [gallery] WHERE ([proid] = @proid)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="proid" QueryStringField="proid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
		    
		</div>
		<div class="col-md-6 single-right-left simpleCart_shelfItem animated wow slideInRight animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInRight;">
          <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                    <h3><%#Eval("proname") %></h3>
					<p><span class="item_price"><%# "₹ " + Eval("proofferprice")%></span> <del><%# "₹ " + Eval("proprice")%></del></p>
					
				</ItemTemplate>
            </asp:DataList>

            <div class="rating1">
						<span class="starRating">
					
                             <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Rating ID="Rating1" runat="server" CurrentRating ="1" MaxRating ="5" 
                                    AutoPostBack ="true" StarCssClass="starempty" FilledStarCssClass="starfilled" 
                                    WaitingStarCssClass="starwaiting" EmptyStarCssClass="starempty"  >
                                 </asp:Rating> 
                            </ContentTemplate>
                            </asp:UpdatePanel>
                             
						</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
					<div class="description">
						<h5>Check delivery, payment options and charges at your location</h5>
						<%--<input type="text" value="Enter pincode" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter pincode';}" required="">--%>
                        <asp:TextBox ID="txt_pin" runat="server" type="text" placeholder="Enter pincode"></asp:TextBox>
                        
						<%--<input type="submit" value="Check">--%>
                        <asp:Button ID="btn_pin" runat="server" Text="Check" type="submit" 
                            onclick="btn_pin_Click1" />

                        <asp:RegularExpressionValidator ID="rev_pin" runat="server" ValidationExpression="^([3]{1})([0-9]{5})$" ErrorMessage="Pincode Is Invalid" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txt_pin"></asp:RegularExpressionValidator>

                        <asp:Panel ID="pnl_pin" runat="server" Visible="False">
                            <p>Order now and expect this item to be delivered upto next 7 Days</p>
                            <p>This pin code is serviceable for payment by cash - up to Rs.10,000 </p>
                        </asp:Panel>

					</div>
					<%--<div class="color-quality">
						<div class="color-quality-right">--%>
							<h5>Size :</h5>
							<%--<select id="country1" onchange="change_country(this.value)" class="frm-field required sect">
								<option value="null">5 Qty</option>
								<option value="null">6 Qty</option> 
								<option value="null">7 Qty</option>					
								<option value="null">10 Qty</option>								
							</select>--%>
                     <asp:DropDownList ID="ddl_size" runat="server" class="form-control" style="width:80px;">
                                        <asp:ListItem Selected="True">5</asp:ListItem>
                                         <asp:ListItem>6</asp:ListItem>
                                         <asp:ListItem>7</asp:ListItem>
                                         <asp:ListItem>8</asp:ListItem>
                                         <asp:ListItem>9</asp:ListItem>
                                         <asp:ListItem>10</asp:ListItem>
                                         <asp:ListItem>11</asp:ListItem>
                     </asp:DropDownList>
                     <br />
                     <h5>Qunty :</h5>
                     <asp:DropDownList ID="ddl_qty" runat="server" class="form-control" >
                                         <asp:ListItem Selected="True">1</asp:ListItem>
                                         <asp:ListItem>2</asp:ListItem>
                                         <asp:ListItem>3</asp:ListItem>
                                         <asp:ListItem>4</asp:ListItem>
                                         <asp:ListItem>5</asp:ListItem>
                                         <asp:ListItem>6</asp:ListItem>
                                         <asp:ListItem>7</asp:ListItem>
                     </asp:DropDownList>
						<%--</div>
					</div>--%>
					<div class="occasional">
						<%--<h5>Types :</h5>
						<div class="colr ert">
							<label class="radio"><input type="radio" name="radio" checked=""><i></i>Casual Shoes</label>
						</div>
						<div class="colr">
							<label class="radio"><input type="radio" name="radio"><i></i>Sports Shoes</label>
						</div>
						<div class="colr">
							<label class="radio"><input type="radio" name="radio"><i></i>Formal Shoes</label>
						</div>--%>
						<div class="clearfix"> </div>
					</div>
					<div class="occasion-cart">
						<%--<a href="addtocart.aspx" class="item_add hvr-outline-out button2">Add to cart</a>--%>
                        <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/User/images/cart.png" onclick="ImageButton1_Click" />--%>
                        <asp:Button ID="btn_cart" runat="server" Text="Add To Cart" class="button Button3" onclick="btn_cart_Click"/>
					</div>
		    
		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:constr %>" 
                SelectCommand="SELECT * FROM [product] WHERE ([proid] = @proid)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="proid" QueryStringField="proid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
		    
		</div>

				<div class="clearfix"></div>

        <div class="bootstrap-tab animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <asp:Button ID="Button1" runat="server" Text="Coupon Code" 
                                    class="button Button1" onclick="Button1_Click"/>
                            </li>
                            <li role="presentation">
                                <asp:Button ID="Button2" runat="server" Text="Review" class="button Button2" 
                                    onclick="Button2_Click"/>
                            </li>
                            <li  role="presentation">
                                <asp:Button ID="Button3" runat="server" Text="View Rating" 
                                    class="button Button2" onclick="Button3_Click" />
                            </li>
                        </ul>
						<div id="myTabContent" class="tab-content">
						    <asp:Panel ID="Panel1" runat="server">
                              <div role="tabpanel" class="tab-pane fade in active bootstrap-tab-text" id="home" aria-labelledby="home-tab">
								<h5>Offer</h5>
                                <div>
                                    
                                    <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            <table class="style1">
                                                <tr style="border: thin dotted #996633">
                                                    <td class="style4">
                                                        <br />Use Code<br />
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("c_code") %>'></asp:Label>
                                                    </td>
                                                    <td class="style3" style="border-right-style: groove">
                                                     </td>
                                                    <td>
                                                        Flat
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("discount") %>'></asp:Label>
                                                        &nbsp;% Off On
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("max_discount") %>'></asp:Label>
                                                        &nbsp;&amp; Below</td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                    <td class="style3">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                                        SelectCommand="SELECT TOP 3 * FROM [coupon]"></asp:SqlDataSource>
                                    
                                </div>
							  </div>
                            </asp:Panel>

                            <asp:Panel ID="Panel2" runat="server" Visible="False">
                              <%--<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="profile" aria-labelledby="profile-tab">
								<div class="bootstrap-tab-text-grids">--%>
									<%--<div class="bootstrap-tab-text-grid">
										<div class="bootstrap-tab-text-grid-left">
											<img src="images/men3.jpg" alt=" " class="img-responsive">
										</div>
										<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li><a href="#">
                                                    <asp:Label ID="lblusr" runat="server" Text="Admin"></asp:Label></a>
                                                </li>
												<li><a href="#"><span class="glyphicon glyphicon-share" aria-hidden="true"></span>Reply</a></li>
											</ul>
											<p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis 
												suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem 
												vel eum iure reprehenderit.</p>
										</div>
										<div class="clearfix"> </div>
									</div>--%>
									
									<div class="add-review">
										<h4>add a review</h4>
										<%--<form>--%>
											<%--<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">--%>
                                                <asp:TextBox ID="txtname" runat="server" placeholder="Name"></asp:TextBox>
											<%--<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">--%>
                                                <asp:TextBox ID="txtemail" runat="server" placeholder="Email Id"></asp:TextBox>
											<%--<textarea type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>--%>
                                                <asp:TextBox ID="txtmsg" runat="server" TextMode="MultiLine" placeholder="Message"></asp:TextBox>
                                            <%--<input type="submit" value="SEND">--%>
                                                <asp:Button ID="btn_send" runat="server" Text="SEND" type="submit" 
                                            onclick="btn_send_Click"/>
										<%--</form>--%>
									</div>
								<%--</div>
							  </div>--%>
                           </asp:Panel>

                            <asp:Panel ID="pnl_rating" runat="server" Visible="False">
                                <p>dfghj</p>
                            </asp:Panel>


                            <%--<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="profile" aria-labelledby="profile-tab">
								<div class="bootstrap-tab-text-grids">
									<div class="bootstrap-tab-text-grid">
										<div class="bootstrap-tab-text-grid-left">
											<img src="images/men3.jpg" alt=" " class="img-responsive">
										</div>
										<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li><a href="#">Admin</a></li>
												<li><a href="#"><span class="glyphicon glyphicon-share" aria-hidden="true"></span>Reply</a></li>
											</ul>
											<p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis 
												suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem 
												vel eum iure reprehenderit.</p>
										</div>
										<div class="clearfix"> </div>
									</div>
									
									<div class="add-review">
										<h4>add a review</h4>
										<form>
											<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
											<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
											
											<textarea type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
											<input type="submit" value="SEND">
										</form>
									</div>
								</div>
							</div>--%>
							<%--<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown1" aria-labelledby="dropdown1-tab">
								<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
							</div>
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown2" aria-labelledby="dropdown2-tab">
								<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
							</div>--%>
						</div>
					</div>
				</div>
            </div>
   </div>
<!--single -->
</body>
</html>

    </div>

</asp:Content>

