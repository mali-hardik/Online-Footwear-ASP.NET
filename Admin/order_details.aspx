<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="order_details.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>User Registration Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
              <div class="table-responsive">             
              
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                      AutoGenerateColumns="False" DataKeyNames="order_id" 
                      DataSourceID="SqlDataSource1" 
                      EmptyDataText="There are no data records to display." CssClass="table table-striped table-bordered table-hover">
                      <Columns>
                          <asp:BoundField DataField="order_date" HeaderText="Order Date" 
                              SortExpression="order_date" />
                          <asp:BoundField DataField="umobile_no" HeaderText="User Mobile No" 
                              SortExpression="umobile_no" />
                          <asp:BoundField DataField="pro_image" HeaderText="Product Image" 
                              SortExpression="pro_image" />
                          <asp:BoundField DataField="pro_price" HeaderText="Product Price" 
                              SortExpression="pro_price" />
                          <asp:BoundField DataField="order_quantity" HeaderText="Order Quntity" 
                              SortExpression="order_quantity" />
                          <asp:BoundField DataField="order_total" HeaderText="Order Total" 
                              SortExpression="order_total" />
                          <asp:BoundField DataField="payment_mode" HeaderText="Payment Mode" 
                              SortExpression="payment_mode" />
                          <asp:BoundField DataField="paymen_status" HeaderText="Paymen Status" 
                              SortExpression="paymen_status" />
                          <asp:BoundField DataField="Order_Status" HeaderText="Order Status" 
                              SortExpression="Order_Status" />
                      </Columns>
                  </asp:GridView>
                  </div>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:constr %>" 
                      DeleteCommand="DELETE FROM [uorder] WHERE [order_id] = @order_id" 
                      InsertCommand="INSERT INTO [uorder] ([order_date], [smobile_no], [umobile_no], [pro_id], [pro_image], [pro_description], [pro_price], [order_quantity], [order_total], [payment_mode], [paymen_status], [Order_Status]) VALUES (@order_date, @smobile_no, @umobile_no, @pro_id, @pro_image, @pro_description, @pro_price, @order_quantity, @order_total, @payment_mode, @paymen_status, @Order_Status)" 
                      SelectCommand="SELECT [order_id], [order_date], [smobile_no], [umobile_no], [pro_id], [pro_image], [pro_description], [pro_price], [order_quantity], [order_total], [payment_mode], [paymen_status], [Order_Status] FROM [uorder]" 
                      
                  UpdateCommand="UPDATE [uorder] SET [order_date] = @order_date, [smobile_no] = @smobile_no, [umobile_no] = @umobile_no, [pro_id] = @pro_id, [pro_image] = @pro_image, [pro_description] = @pro_description, [pro_price] = @pro_price, [order_quantity] = @order_quantity, [order_total] = @order_total, [payment_mode] = @payment_mode, [paymen_status] = @paymen_status, [Order_Status] = @Order_Status WHERE [order_id] = @order_id">
                      <DeleteParameters>
                          <asp:Parameter Name="order_id" Type="Int32" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:Parameter Name="order_date" Type="String" />
                          <asp:Parameter Name="smobile_no" Type="Decimal" />
                          <asp:Parameter Name="umobile_no" Type="Decimal" />
                          <asp:Parameter Name="pro_id" Type="Int32" />
                          <asp:Parameter Name="pro_image" Type="String" />
                          <asp:Parameter Name="pro_description" Type="String" />
                          <asp:Parameter Name="pro_price" Type="Int32" />
                          <asp:Parameter Name="order_quantity" Type="Int32" />
                          <asp:Parameter Name="order_total" Type="Int32" />
                          <asp:Parameter Name="payment_mode" Type="String" />
                          <asp:Parameter Name="paymen_status" Type="Int32" />
                          <asp:Parameter Name="Order_Status" Type="String" />
                      </InsertParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="order_date" Type="String" />
                          <asp:Parameter Name="smobile_no" Type="Decimal" />
                          <asp:Parameter Name="umobile_no" Type="Decimal" />
                          <asp:Parameter Name="pro_id" Type="Int32" />
                          <asp:Parameter Name="pro_image" Type="String" />
                          <asp:Parameter Name="pro_description" Type="String" />
                          <asp:Parameter Name="pro_price" Type="Int32" />
                          <asp:Parameter Name="order_quantity" Type="Int32" />
                          <asp:Parameter Name="order_total" Type="Int32" />
                          <asp:Parameter Name="payment_mode" Type="String" />
                          <asp:Parameter Name="paymen_status" Type="Int32" />
                          <asp:Parameter Name="Order_Status" Type="String" />
                          <asp:Parameter Name="order_id" Type="Int32" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
                           
          </fieldset>
        </form>
      </div>
    </div>
    <div class="copy_layout">
      <p>Copyright &copy; 2019, smart shop. All Rights Reserved <%--| Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> --%></p>
   </div>
   </div>

</asp:Content>

