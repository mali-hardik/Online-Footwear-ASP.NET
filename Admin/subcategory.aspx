<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="subcategory.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>SubCategory Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
            <div class="form-group">
              <label class="control-label">Category Name</label>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" 
                    DataSourceID="SqlDataSource1" DataTextField="cname" DataValueField="cid" >
                    
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
            </div>
            <div class="form-group">
              <label class="control-label">SubCategory Name</label>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:TextBox ID="txtsubcatname" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Sub Category Description</label>
                <asp:TextBox ID="txtsubcatdesc" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name" TextMode="MultiLine"></asp:TextBox>
            </div>
              <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
            <div class="form-group filled">
              <label class="control-label">Status</label>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:DropDownList ID="ddlstatus" runat="server"  
                    class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" 
                    required="">
                    <asp:ListItem Enabled="true" Text="On" Value="1" ></asp:ListItem>
                    <asp:ListItem  Text="Off" Value="0" ></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
             <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_add_Click"/>
               
              <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default" 
                    onclick="btn_res_Click"/>
            </div>
            <br />
            <div class="table-responsive">
              <asp:GridView ID="GridView1" runat="server" 
                    CssClass="table table-striped table-bordered table-hover" 
                    AutoGenerateColumns="False" DataKeyNames="subcatid"
                  DataSourceID="SqlDataSource2" 
                    EmptyDataText="There are no data records to display." Width="100%" 
                    AllowPaging="True">
                  <Columns>
                      <asp:BoundField DataField="subcatid" HeaderText="Sub Category Id" 
                          ReadOnly="True" SortExpression="subcatid" />
                      <asp:BoundField DataField="catid" HeaderText="Category Id" 
                          SortExpression="catid" />
                      <asp:BoundField DataField="subcatname" HeaderText="Sub Category Name" 
                          SortExpression="subcatname" />
                      <asp:BoundField DataField="subdec" HeaderText="Sub Category Description" 
                          SortExpression="subdec" />
                      <asp:BoundField DataField="status" HeaderText="Status" 
                          SortExpression="status" />
                      <asp:CommandField HeaderText="Update" ShowEditButton="True" />
                      <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                  </Columns>
              </asp:GridView>
              </div>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                  DeleteCommand="DELETE FROM [subcategory] WHERE [subcatid] = @subcatid" InsertCommand="INSERT INTO [subcategory] ([catid], [subcatname], [subdec], [status]) VALUES (@catid, @subcatname, @subdec, @status)"
                  ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [subcatid], [catid], [subcatname], [subdec], [status] FROM [subcategory]"
                  UpdateCommand="UPDATE [subcategory] SET [catid] = @catid, [subcatname] = @subcatname, [subdec] = @subdec, [status] = @status WHERE [subcatid] = @subcatid">
                  <DeleteParameters>
                      <asp:Parameter Name="subcatid" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="catid" Type="Int32" />
                      <asp:Parameter Name="subcatname" Type="String" />
                      <asp:Parameter Name="subdec" Type="String" />
                      <asp:Parameter Name="status" Type="Int32" />
                  </InsertParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="catid" Type="Int32" />
                      <asp:Parameter Name="subcatname" Type="String" />
                      <asp:Parameter Name="subdec" Type="String" />
                      <asp:Parameter Name="status" Type="Int32" />
                      <asp:Parameter Name="subcatid" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>
              <br />

          </fieldset>
        </form>
      </div>
    </div>
    <div class="copy_layout">
      <p>Copyright &copy; 2019, smart shop. All Rights Reserved <%--| Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> --%></p>
   </div>
   </div>


</asp:Content>

