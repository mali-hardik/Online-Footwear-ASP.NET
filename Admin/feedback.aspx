<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>Feedback Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
           <div class="table-responsive">
           
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                   DataKeyNames="cid" DataSourceID="SqlDataSource1" 
                   EmptyDataText="There are no data records to display."
                    CssClass="table table-striped table-bordered table-hover" Width="100%" 
                   AllowPaging="True" >
                   <Columns>
                       <asp:BoundField DataField="cid" HeaderText="cid" ReadOnly="True" 
                           SortExpression="cid" />
                       <asp:BoundField DataField="cname" HeaderText="cname" SortExpression="cname" />
                       <asp:BoundField DataField="cemail" HeaderText="cemail" 
                           SortExpression="cemail" />
                       <asp:BoundField DataField="cmsg" HeaderText="cmsg" SortExpression="cmsg" />
                   </Columns>
               </asp:GridView>
               </div>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:constr %>" 
                   DeleteCommand="DELETE FROM [contact] WHERE [cid] = @cid" 
                   InsertCommand="INSERT INTO [contact] ([cname], [cemail], [cmsg]) VALUES (@cname, @cemail, @cmsg)" 
                   SelectCommand="SELECT [cid], [cname], [cemail], [cmsg] FROM [contact]" 
                   
                  UpdateCommand="UPDATE [contact] SET [cname] = @cname, [cemail] = @cemail, [cmsg] = @cmsg WHERE [cid] = @cid">
                   <DeleteParameters>
                       <asp:Parameter Name="cid" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="cname" Type="String" />
                       <asp:Parameter Name="cemail" Type="String" />
                       <asp:Parameter Name="cmsg" Type="String" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="cname" Type="String" />
                       <asp:Parameter Name="cemail" Type="String" />
                       <asp:Parameter Name="cmsg" Type="String" />
                       <asp:Parameter Name="cid" Type="Int32" />
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

