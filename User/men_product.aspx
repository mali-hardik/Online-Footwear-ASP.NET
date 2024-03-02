<%@ Page Title="" Language="C#" MasterPageFile="~/User/men.master" AutoEventWireup="true" CodeFile="men_product.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- //banner -->
<div class="men-wear">
	<div class="container" style="width:auto;">
    <div class="col-md-4 products-left">
    </div>
    <div class="col-md-8 products-right" style="margin-bottom:2px;">
			<h5>Product Compare</h5>
			<div class="sort-grid">
				<div class="sorting">
					<h6>Sort By</h6>
					<%--<select id="country1" onchange="change_country(this.value)" class="frm-field required sect">
						<option value="null">Default</option>
						<option value="null">Name(A - Z)</option> 
						<option value="null" >Name(Z - A)</option>
						<option value="null">Price(High - Low)</option>
						<option value="null">Price(Low - High)</option>	
						<option value="null">Model(A - Z)</option>
						<option value="null">Model(Z - A)</option>					
					</select>--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                        AutoPostBack="True">
                        <asp:ListItem>Default</asp:ListItem>
                        <asp:ListItem>Name(A - Z)</asp:ListItem>
                        <asp:ListItem>Name(Z - A)</asp:ListItem>
                        <asp:ListItem>Price(High - Low)</asp:ListItem>
                        <asp:ListItem>Price(Low - High)</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sql_a_z" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [product] WHERE ([subcatid] = @subcatid) ORDER BY [proname]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="subcatid" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_z_a" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [product] WHERE ([subcatid] = @subcatid) ORDER BY [proname] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="subcatid" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_h_l" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [product] WHERE ([subcatid] = @subcatid) ORDER BY [proofferprice] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="subcatid" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_l_h" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [product] WHERE ([subcatid] = @subcatid) ORDER BY [proofferprice]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="subcatid" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sql_default" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [product] WHERE ([subcatid] = @subcatid) ORDER BY [proname]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="subcatid" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
				<%--<div  id="top" class="callbacks_container">
					<ul class="rslides" id="slider3">
						<li>
							<img class="img-responsive" src="images/men1.jpg" alt=" "/>
						</li>
						<li>
							<img class="img-responsive" src="images/men2.jpg" alt=" "/>
						</li>
						<li>
							<img class="img-responsive" src="images/men1.jpg" alt=" "/>
						</li>
						<li>
							<img class="img-responsive" src="images/men2.jpg" alt=" "/>
						</li>
					</ul>
				</div>--%>
				<div class="clearfix"></div>
			</div>
          
			
				
                <div class="clearfix"></div>

  <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
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
				<%--<ul class="resp-tabs-list">
					<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Latest Designs</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Special Offers</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Collections</span></li>
				</ul>--%>			  	 
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

</asp:Content>

