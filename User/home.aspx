<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="User_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- banner -->
<div class="banner-grid">
	<div id="visual">
			<div class="slide-visual">
				<!-- Slide Image Area (1000 x 424) -->
				<ul class="slide-group">
					<li><img class="img-responsive" src="discount/top_banner.jpg" alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="discount/mainslider_img_2.jpg" alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="discount/Men-Slider-Nike-Lunartempo2-17thfeb.jpg" alt="Dummy Image" /></li>
				</ul>

				<!-- Slide Description Image Area (316 x 328) -->
				<div class="script-wrap">
					<ul class="script-group">
						<li><div class="inner-script"><img class="img-responsive" src="discount/Men-Slider-Nike-Lunartempo2-17thfeb_small.jpg" alt="Dummy Image" /></div></li>
						<li><div class="inner-script"><img class="img-responsive" src="discount/top_banner_small.jpg" alt="Dummy Image" /></div></li>
						<li><div class="inner-script"><img class="img-responsive" src="discount/mainslider_img_2_small.jpg" alt="Dummy Image" /></div></li>
					</ul>
					<div class="slide-controller">
						<a href="#" class="btn-prev"><img src="images/btn_prev.png" alt="Prev Slide" /></a>
						<a href="#" class="btn-play"><img src="images/btn_play.png" alt="Start Slide" /></a>
						<a href="#" class="btn-pause"><img src="images/btn_pause.png" alt="Pause Slide" /></a>
						<a href="#" class="btn-next"><img src="images/btn_next.png" alt="Next Slide" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	<script type="text/javascript" src="js/pignose.layerslider.js"></script>
	<script type="text/javascript">
	//<![CDATA[
	    $(window).load(function () {
	        $('#visual').pignoseLayerSlider({
	            play: '.btn-play',
	            pause: '.btn-pause',
	            next: '.btn-next',
	            prev: '.btn-prev'
	        });
	    });
	//]]>
	</script>

</div>
<!-- //banner -->
<!-- content -->

<div class="new_arrivals">
	<div class="container">
		<h3><span>new </span>arrivals</h3>
		<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium</p>
		<div class="new_grids">
			<div class="col-md-4 new-gd-left">
				<img src="discount/h1.jpg" alt=" " />
				<div class="wed-brand simpleCart_shelfItem">
					<h5 style="color:White;padding-left:30px;">Flat 50% Discount</h5>
					<%--<p><i style="color:White;padding-left:10px;">₹ 999</i> <span class="item_price" style="color:White;">₹ 499</span>--%><%--<a class="item_add hvr-outline-out button2" href="#">add to cart </a>--%></p>
				</div>
			</div>
			<div class="col-md-4 new-gd-middle">
				<div class="new-levis">
					<div class="mid-img">
						<img src="discount/bata.jpg" alt=" " />
					</div>
					<div class="mid-text">
						<h4>up to 40% <span>off</span></h4>
						<%--<a class="hvr-outline-out button2" href="">Shop now </a>--%>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="new-levis">
					<div class="mid-text">
						<h4>up to 50% <span>off</span></h4>
						<%--<a class="hvr-outline-out button2" href="">Shop now </a>--%>
					</div>
					<div class="mid-img">
						<img src="discount/reebok-logo.png" alt=" " />
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-4 new-gd-left">
				<img src="discount/2.jpg"  alt=" " height="350px;"/>
				<div class="wed-brandtwo simpleCart_shelfItem">
					<h4 style="color: White;font-weight:800">Spring / Summer</h4>
					<p style="color: White;font-weight:500">Shop Men</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //content -->

<!-- content-bottom -->
<div class="content-bottom">
	<div class="col-md-7 content-lgrid">
		<div class="col-sm-6 content-img-left text-center">
			<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="discount/3.jpg" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
									<h4>MEN</h4>
									<span class="separator"></span>
									<p><span class="item_price"></span></p>
									<span class="separator"></span>
									<a class="hvr-outline-out button2" href="men.aspx?mid=1">Shop now </a>
						</div>
					</div>
			</div>
		</div>
		<div class="col-sm-6 content-img-right">
			<h3>Special Offers and 50%<span>Discount On</span></h3>
		</div>
		
		<div class="col-sm-6 content-img-right">
			<h3>Buy 3 get 1  free on <span> Branded</span> Bata</h3>
		</div>
		<div class="col-sm-6 content-img-left text-center">
			<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="discount/5.jpg" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
							<h4>CHILDREN</h4>
							<span class="separator"></span>
							<p><span class="item_price"></span></p>
							<span class="separator"></span>
							<a class="hvr-outline-out button2" href="children.aspx?mid=3">Shop now </a>
						</div>
					</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="col-md-5 content-rgrid text-center">
		<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="discount/4.jpg" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
									<h4>WOMEN</h4>
									<span class="separator"></span>
									<p><span class="item_price"></span></p>
									<span class="separator"></span>
									<a class="hvr-outline-out button2" href="women.aspx?mid=2">Shop now </a>
						</div>
					</div>
			</div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- //content-bottom -->
<br /><br />
<!-- Latest Design --> 

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
           <div class="product-easy">
	        <div class="container">
		
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
					<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li> 
					<%--<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li> --%>
				</ul>				  	 
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
        </HeaderTemplate>
        <ItemTemplate>
              <div class="col-md-3 product-men">
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
									<h4><a href=""><%#Eval("proname") %></a></h4>
									<div class="info-product-price">
										<span class="item_price"><%# "₹ " + Eval("proofferprice") %></span>
										<del><%# "₹ " + Eval("proprice")%></del>
									</div>
									<%--<a href="#" class="item_add single-item hvr-outline-out button2">Add to cart</a>--%>
								</div>
							</div>
                       </div>
        </ItemTemplate>
        <FooterTemplate>
                    </div>
                   </div>
                  </div>
                 </div>
               </div>
              </div>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:constr %>" 
        SelectCommand="SELECT TOP 4 * FROM [product]"></asp:SqlDataSource>

    
<!-- // Latest Design --> 
    <br />
</asp:Content>

