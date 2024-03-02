<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="rating.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>Rating Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
               <div class="table-responsive">
                
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                       DataKeyNames="rid" DataSourceID="SqlDataSource1" 
                       EmptyDataText="There are no data records to display."
                      CssClass="table table-striped table-bordered table-hover" Width="100%" 
                       AllowPaging="True" >
                       <Columns>
                           <asp:BoundField DataField="rid" HeaderText="rid" ReadOnly="True" 
                               SortExpression="rid" />
                           <asp:BoundField DataField="umobileno" HeaderText="umobileno" 
                               SortExpression="umobileno" />
                           <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                           <asp:BoundField DataField="eid" HeaderText="eid" SortExpression="eid" />
                           <asp:BoundField DataField="proname" HeaderText="proname" 
                               SortExpression="proname" />
                           <asp:BoundField DataField="rate" HeaderText="rate" SortExpression="rate" />
                           <asp:BoundField DataField="rmsg" HeaderText="rmsg" SortExpression="rmsg" />
                           <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                       </Columns>
                   </asp:GridView>
                   </div>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:constr %>" 
                       DeleteCommand="DELETE FROM [rating] WHERE [rid] = @rid" 
                       InsertCommand="INSERT INTO [rating] ([umobileno], [name], [eid], [proname], [rate], [rmsg]) VALUES (@umobileno, @name, @eid, @proname, @rate, @rmsg)" 
                       SelectCommand="SELECT [rid], [umobileno], [name], [eid], [proname], [rate], [rmsg] FROM [rating]" 
                       
                   UpdateCommand="UPDATE [rating] SET [umobileno] = @umobileno, [name] = @name, [eid] = @eid, [proname] = @proname, [rate] = @rate, [rmsg] = @rmsg WHERE [rid] = @rid">
                       <DeleteParameters>
                           <asp:Parameter Name="rid" Type="Int32" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="umobileno" Type="Decimal" />
                           <asp:Parameter Name="name" Type="String" />
                           <asp:Parameter Name="eid" Type="String" />
                           <asp:Parameter Name="proname" Type="String" />
                           <asp:Parameter Name="rate" Type="String" />
                           <asp:Parameter Name="rmsg" Type="String" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="umobileno" Type="Decimal" />
                           <asp:Parameter Name="name" Type="String" />
                           <asp:Parameter Name="eid" Type="String" />
                           <asp:Parameter Name="proname" Type="String" />
                           <asp:Parameter Name="rate" Type="String" />
                           <asp:Parameter Name="rmsg" Type="String" />
                           <asp:Parameter Name="rid" Type="Int32" />
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

