<%@ Page Title="" Language="C#" MasterPageFile="~/User/after_usr.master" AutoEventWireup="true" CodeFile="addtocart.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<html>
<head>
    
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


    .style1
    {
        height: 38px;
    }


</style>
</head>

<!-- banner -->
<div class="page-head">
	<div class="container">
		<h3>Add To Cart</h3>
	</div>
</div>
<!-- //banner -->
<!-- check out -->
<div class="checkout">
	<div class="container">
		<h3>My Shopping Bag</h3>
		<div class="table-responsive checkout-right animated wow slideInUp" data-wow-delay=".5s">
			<table class="timetable_sub">
				<thead>
					<tr>
						<th class="style1">Remove</th>
						<th class="style1">Product</th>
						<th class="style1">Quantity</th>
						<th class="style1">Product Name</th>
                        <th class="style1">Size</th>
						<th class="style1">Price</th>
                        <th class="style1">Total</th>
					</tr>
				</thead>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    <p>Your Cart is Empty!Please Add Some Products in Cart To Buy it.</p>
                </EditItemTemplate>
                <ItemTemplate>
                 
					<tr class="rem1">
						<td class="invert-closeb">
							<div class="">
                                    <%--<asp:ImageButton ID="img_btn_rem" runat="server" ImageUrl="~/User/images/icon-close-512.png" Width="20px" Height="20px" onclick="img_btn_rem_Click"/>--%>
                                   <a href='<%# Eval("cartid","deleteprofromcart.aspx?cartid={0}") %>'><img src="images/close.png" Width="20px" Height="20px"/></a>
                           	</div>
							<%--<script> $(document).ready(function (c) {
							        $('.close1').on('click', function (c) {
							            $('.rem1').fadeOut('slow', function (c) {
							                $('.rem1').remove();
							            });
							        });
							    });
						   </script>--%>
						</td>
						<td class="invert-image">
                            <%--<a href=""><asp:Image ID="imgproprice" runat="server" ImageUrl='<%# Eval("cart_img") %>' class="img-responsive" height="100" Width ="100"/></a>--%>
                            <img src='../Admin/upload/<%#Eval ("cart_img") %>' class="img-responsive" height="100" Width ="100" />
                        </td>
                		<td class="invert">
							 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="">
                                        <a href='<%# Eval("cartid","decrementproduct.aspx?cartid={0}") %>' class="entry value-minus">  </a>                                       
                                  
                                          <asp:TextBox ID="txtqty" height="40px" Width ="40px" style="cursor:pointer; text-align:center;" runat="server" Text='<%#Eval("cart_qty") %>'></asp:TextBox>    
                                   
                                        <a href='<%# Eval("cartid","incrementproduct.aspx?cartid={0}") %>' class="entry value-plus ">  </a>
                                    </div>
								</div>
							</div>
						</td>
                		<td class="invert">
                            <asp:Label ID="lblproname" runat="server" Text='<%#Eval("cart_itemdetail") %>'></asp:Label>
                        </td>
						<td class="invert">
                            <asp:Label ID="lbl_size" runat="server" Text='<%#Eval("pro_size") %>'></asp:Label>
                        </td>
                        <td class="invert">
                            <asp:Label ID="lblproprice" runat="server" Text='<%# "₹ " + Eval("cart_price")%>'></asp:Label>
                        </td>
                        
                        <td class="invert">
                            <asp:Label ID="lbltotalprice" runat="server" Text='<%# "₹ " + Eval("cart_total")%>'></asp:Label>       
                        </td>
					</tr>

                  </ItemTemplate>
                  </asp:ListView>


				
                

				<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT * FROM [cart] WHERE ([umobileno] = @umobileno)">
                    <SelectParameters>
                        <asp:SessionParameter Name="umobileno" SessionField="umobileno" 
                            Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>


				
                

				<%--<tr class="rem4">
						<td class="invert-closeb">
                            <asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>
                        </td>
						<td class="invert-image">&nbsp;</td>
						<td class="invert">
							 &nbsp;</td>
						<td class="invert">&nbsp;</td>
                        <td class="invert">&nbsp;</td>
						<td class="invert">
                            <asp:Label ID="lbltotal" runat="server" Text=""></asp:Label></td>
						
					</tr>--%>
					
								<!--quantity-->
                <%--<script>
									    $('.value-plus').on('click', function () {
									        var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) + 1;
									        divUpd.text(newVal);
									    });

									    $('.value-minus').on('click', function () {
									        var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) - 1;
									        if (newVal >= 1) divUpd.text(newVal);
									    });
									</script>--%>
								<!--quantity-->
			</table>
		</div>

        <div class="checkout-left">	
				
				<div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
					<a href="index.aspx"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Back To Shopping</a>
				</div>
                
                 <!-- Coupon Offer-->
                
                  <asp:LinkButton ID="lnkbtn_lbl" runat="server" style="margin-left:225px;" 
                    onclick="lnkbtn_lbl_Click">Get Your Discount Is Here...</asp:LinkButton>
                   
                    <asp:Panel ID="pnl_ent_cup" runat="server" Visible="False" >
                        <table class="" style="margin-left:30%;width:40%;">
                            <tr>
                                <td colspan="3">
                                    Enter Coupon Code :  &nbsp;&nbsp;
                                    <asp:TextBox ID="txt_ccode" runat="server"></asp:TextBox>
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_apl" runat="server" Text="Apply"  class="button Button1" 
                                        style="width:100px;" onclick="btn_apl_Click"/>    
                                </td>
                                <td>
                                    &nbsp;</td>
                                </tr>
                        </table>    
                    </asp:Panel>
                <br />
                <asp:Panel ID="pnl_chck" runat="server" Visible="False" >
                    <table class="" style="margin-left:30%;width:41%;">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>&nbsp;
                                <asp:Label ID="lbl_cupapl" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Your Discount&nbsp;&nbsp;&nbsp; : </td>
                            <td>&nbsp;
                                <asp:Label ID="lbl_discnt" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                Your Final Price : </td>
                            <td colspan="2">&nbsp;
                               <strike> <asp:Label ID="lbl_grdtotal" runat="server" Text=""></asp:Label> </strike> 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
                                <asp:Label ID="lbl_totcup" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <table class="" style="margin-left:30%;width:41%;">
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_con" runat="server" Text="CONFIRM" class="button Button1" 
                                    style="width:130px;" onclick="btn_con_Click1"/>
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
                <!-- // Coupon Offer-->


				<div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
					<h4>Shopping basket</h4>
					<ul>
                      <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatLayout="Flow">
                      <ItemTemplate>
						<li><%# Eval("cart_itemdetail") %><i>-</i> <span><%# Eval("cart_total") %></span>
                      </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:constr %>" 
                            SelectCommand="SELECT * FROM [cart] WHERE ([umobileno] = @umobileno)">
                            <SelectParameters>
                                <asp:SessionParameter Name="umobileno" SessionField="umobileno" 
                                    Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
					
						<li>Total<asp:Label ID="Label1" runat="server" Text=""></asp:Label> <i>-</i> <span>
                            <asp:Label ID="lbltotal" runat="server" Text='<%# "$" + Eval("cart_total") %>' 
                                Height="16px"></asp:Label></span></li>
                        <li>Discount<asp:Label ID="Label2" runat="server" Text=""></asp:Label> <i>-</i> <span>
                            <asp:Label ID="lbldis" runat="server" Text="0" Height="16px"></asp:Label></span></li>
                        <li>Net Total<asp:Label ID="lbl_nettot" runat="server" Text=""></asp:Label> <i>-</i> <span>
                            <asp:Label ID="lblnettot" runat="server" Text='' Height="16px"></asp:Label></span></li>
                        
                        <li><asp:Button ID="btntotal" runat="server" Text="Check Out" 
                                class="button Button1" onclick="btntotal_Click" /></li>
                        <li></li>
                        <li><span><asp:Label ID="lblcart" runat="server" Text=""></asp:Label></span></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
            
			</div>
	</div>
</div>	
<!-- //check out -->
</html>
</asp:Content>

