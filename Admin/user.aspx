<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>User Registration Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
              <div class="table-responsive">             
              <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                  AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SqlDataSource1" 
                  EmptyDataText="There are no data records to display." CssClass="table table-striped table-bordered table-hover" BackColor="White" 
                       BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                       ForeColor="Black" GridLines="Vertical" Width="100%">
                  <Columns>
                      <asp:BoundField DataField="uid" HeaderText="User Id" ReadOnly="True" 
                          SortExpression="uid" />
                      <asp:BoundField DataField="umobileno" HeaderText="User Mobile No" 
                          SortExpression="umobileno" />
                      <asp:BoundField DataField="password" HeaderText="Password" 
                          SortExpression="password" />
                  </Columns>
              </asp:GridView>
              </div>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:constr %>" 
                  DeleteCommand="DELETE FROM [user_mstr] WHERE [uid] = @uid" 
                  InsertCommand="INSERT INTO [user_mstr] ([umobileno], [password]) VALUES (@umobileno, @password)" 
                  SelectCommand="SELECT [uid], [umobileno], [password] FROM [user_mstr]" 
                  UpdateCommand="UPDATE [user_mstr] SET [umobileno] = @umobileno, [password] = @password WHERE [uid] = @uid">
                  <DeleteParameters>
                      <asp:Parameter Name="uid" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="umobileno" Type="String" />
                      <asp:Parameter Name="password" Type="String" />
                  </InsertParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="umobileno" Type="String" />
                      <asp:Parameter Name="password" Type="String" />
                      <asp:Parameter Name="uid" Type="Int32" />
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

