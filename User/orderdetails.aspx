<%@ Page Title="" Language="C#" MasterPageFile="~/User/after_usr.master" AutoEventWireup="true" CodeFile="orderdetails.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="checkout">
	<div class="container">
		<h3>My Order Details</h3>
        <div class="table-responsive checkout-right animated wow slideInUp" data-wow-delay=".5s">
        <div class="table-responsive">
			<table class="timetable_sub">
				<thead>
					<tr>
						<th class="style1">Product</th>
						<th class="style1">Product Name</th>
						<th class="style1">Price</th>
                        <th class="style1">Size</th>
						<th class="style1">Qunty</th>
                        <th class="style1">Total</th>
                        <th class="style1">Discount</th>
                        <th class="style1">Net Total</th>
					</tr>
				</thead>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
                <EditItemTemplate>
                    <p>Your Cart is Empty!Please Add Some Products in Cart To Buy it.</p>
                </EditItemTemplate>
                <ItemTemplate>
                 
					<tr class="rem1">
						<td class="invert-image">
                            <%--<a href=""><asp:Image ID="imgproprice" runat="server" ImageUrl='<%# Eval("cart_img") %>' class="img-responsive" height="100" Width ="100"/></a>--%>
                            <img src='../Admin/upload/<%#Eval ("ord_img") %>' class="img-responsive" height="100" Width ="100" />
                        </td>
                		<td class="invert">
                            <asp:Label ID="lblproname" runat="server" Text='<%#Eval("ord_itemdetail") %>'></asp:Label>
                        </td>
						<td class="invert">
                            <asp:Label ID="lbl_size" runat="server" Text='<%#Eval("ord_price") %>'></asp:Label>
                        </td>
                        <td class="invert">
                            <asp:Label ID="lblproprice" runat="server" Text='<%# Eval("ord_size")%>'></asp:Label>
                        </td>
                        <td class="invert">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ord_qty")%>'></asp:Label>
                        </td>
                        <td class="invert">
                            <asp:Label ID="lbltotalprice" runat="server" Text='<%#  Eval("ord_total")%>'></asp:Label>       
                        </td>
                        <td class="invert">
                            <asp:Label ID="lbldis" runat="server" Text='<%#Eval("ord_disc")%>'></asp:Label>
                        </td>
                        <td class="invert">
                            <asp:Label ID="lblnettot" runat="server" Text='<%# Eval("ord_nettot")%>'></asp:Label>
                        </td>
					</tr>

                  </ItemTemplate>
                  </asp:ListView>
			    
			    
			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT * FROM [order_detail] WHERE ([umobileno] = @umobileno)">
                    <SelectParameters>
                        <asp:SessionParameter Name="umobileno" SessionField="umobileno" 
                            Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
			    
			    
			</table>
            </div>
		</div>
	</div>
</div></asp:Content>

