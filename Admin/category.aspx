<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>Category Page</h3>
  	    <div class="well1 white">
        <form class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
            <div class="form-group">
              <label class="control-label">Category Name</label>
                <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:TextBox ID="txtcatname" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Category Description</label>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:TextBox ID="txtcatdesc" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name" TextMode="MultiLine"></asp:TextBox>
            </div>
              <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
            <div class="form-group filled">
              <label class="control-label">Status</label>              <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:DropDownList ID="ddlstatus" runat="server"  
                    class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" 
                    required="">
                    <asp:ListItem Enabled="true" Text="On" Value="1" ></asp:ListItem>
                    <asp:ListItem  Text="Off" Value="0" ></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
             <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:Button ID="btn_sub" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_sub_Click"/>
            
             <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default" 
                    onclick="btn_res_Click"/>
            </div>
            <br />
               <div class="table-responsive">

                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cid"
                       DataSourceID="SqlDataSource1" 
                       EmptyDataText="There are no data records to display." 
                       CssClass="table table-striped table-bordered table-hover" Width="100%" 
                       AllowPaging="True">
                       <Columns>
                           <asp:BoundField DataField="cid" HeaderText="Category Id" ReadOnly="True" 
                               SortExpression="cid" />
                           <asp:BoundField DataField="cname" HeaderText="Category Name" 
                               SortExpression="cname" />
                           <asp:BoundField DataField="cdesc" HeaderText="Category Description" 
                               SortExpression="cdesc" />
                           <asp:BoundField DataField="status" HeaderText="Status" 
                               SortExpression="status" />
                           <asp:CommandField HeaderText="Update" ShowEditButton="True" />
                           <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                       </Columns>
                   </asp:GridView>
                   </div>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                       DeleteCommand="DELETE FROM [category] WHERE [cid] = @cid" InsertCommand="INSERT INTO [category] ([cname], [cdesc], [status]) VALUES (@cname, @cdesc, @status)"
                       ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [cid], [cname], [cdesc], [status] FROM [category]"
                       UpdateCommand="UPDATE [category] SET [cname] = @cname, [cdesc] = @cdesc, [status] = @status WHERE [cid] = @cid">
                       <DeleteParameters>
                           <asp:Parameter Name="cid" Type="Int32" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="cname" Type="String" />
                           <asp:Parameter Name="cdesc" Type="String" />
                           <asp:Parameter Name="status" Type="Int32" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="cname" Type="String" />
                           <asp:Parameter Name="cdesc" Type="String" />
                           <asp:Parameter Name="status" Type="Int32" />
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

