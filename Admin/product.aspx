<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>Product Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <div class="form-group">
              <label class="control-label">Category Name</label>
              <asp:DropDownList ID="ddl_cat" runat="server" 
                  class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" 
                  AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="cname" 
                  DataValueField="cid" >
              </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:constr %>" 
                  SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
            </div>
            <div class="form-group">
              <label class="control-label">Sub Category Name</label>
                <asp:DropDownList ID="ddl_subcat" runat="server" 
                    class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" 
                    DataSourceID="SqlDataSource1" DataTextField="subcatname" 
                    DataValueField="subcatid" >

                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT * FROM [subcategory] WHERE ([catid] = @catid)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_cat" Name="catid" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            </ContentTemplate>
            </asp:UpdatePanel>
            <div class="form-group">
              <label class="control-label">Product Name</label>
                <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:TextBox ID="txtproname" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Product Description</label>
                <asp:TextBox ID="txtprodesc" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Product Front Image</label>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                    <div class="form-group">
                        <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control1 ng-invalid ng-invalid-required ng-touched" ng-model="model.name"/>
                    </div>
            </div>
            <div class="form-group">
              <label class="control-label">Product Backend Image</label>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                    <div class="form-group">
                        <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                        <asp:FileUpload ID="fileupload_backend" runat="server" class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"/>
                    </div>
            </div>
            <div class="form-group">
              <label class="control-label">Product Price</label>
                <asp:TextBox ID="txtproprice" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Product Offer Price</label>
                <asp:TextBox ID="txtprooffrprice" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
              <%--<button type="reset" class="btn btn-default">Reset</button>--%>
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
            <div class="form-group filled">
              <label class="control-label">Category</label>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:DropDownList ID="ddlcat" runat="server"  
                    class="form-control1 ng-invalid ng-invalid-required" ng-model="model.select" 
                    required="">
                    <asp:ListItem  Text="Men" Value="1" ></asp:ListItem>
                    <asp:ListItem  Text="Women" Value="2" ></asp:ListItem>
                    <asp:ListItem  Text="Children" Value="3" ></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lbl_message" runat="server" Text=""></asp:Label>&nbsp;
                <asp:Label ID="lbl_message_backend" runat="server" Text=""></asp:Label>&nbsp;
            </div>

            <div class="form-group">
             <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_add_Click"/>
               
              <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default" 
                    onclick="btn_res_Click"/>
                <br />
                <br />
                <br />
                <div class="table-responsive">
                
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="proid"
                        DataSourceID="SqlDataSource2" 
                        EmptyDataText="There are no data records to display." 
                        CssClass="table table-striped table-bordered table-hover" AllowPaging="True" >
                        <Columns>
                            <asp:BoundField DataField="proid" HeaderText="Product Id" ReadOnly="True" 
                                SortExpression="proid" />
                            <asp:BoundField DataField="subcatid" HeaderText="Sub Category Id" 
                                SortExpression="subcatid" />
                            <asp:BoundField DataField="proname" HeaderText="Product Name" 
                                SortExpression="proname" />
                            <asp:BoundField DataField="prodec" HeaderText="Product Description" 
                                SortExpression="prodec" />
                            
                            <asp:TemplateField HeaderText="Product Front Image">
                            <ItemTemplate>
                                <img src='upload/<%#Eval("proimg") %>' height="80px" width="80px" />
                            </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="proimg" HeaderText="Product Front Image Name" 
                                SortExpression="proimg" />
                            
                            <asp:TemplateField HeaderText="Product Back Image">
                            <ItemTemplate>
                                <img src ='upload/<%#Eval("probimg") %>' height="80px" width="80px" />
                            </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="probimg" HeaderText="Product Back Image Name" 
                                SortExpression="probimg" />
                            <asp:BoundField DataField="proprice" HeaderText="Product Price" 
                                SortExpression="proprice" />
                            <asp:BoundField DataField="proofferprice" HeaderText="Product Offer Price" 
                                SortExpression="proofferprice" />
                            <asp:BoundField DataField="status" HeaderText="Status" 
                                SortExpression="status" />
                            <asp:BoundField DataField="category" HeaderText="Category" 
                                SortExpression="category" />
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                   </div>
                
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [product] WHERE [proid] = @proid" InsertCommand="INSERT INTO [product] ([subcatid], [proname], [prodec], [proimg], [probimg], [proprice], [proofferprice], [status], [category]) VALUES (@subcatid, @proname, @prodec, @proimg, @probimg, @proprice, @proofferprice, @status, @category)"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [proid], [subcatid], [proname], [prodec], [proimg], [probimg], [proprice], [proofferprice], [status], [category] FROM [product]"
                        UpdateCommand="UPDATE [product] SET [subcatid] = @subcatid, [proname] = @proname, [prodec] = @prodec, [proimg] = @proimg, [probimg] = @probimg, [proprice] = @proprice, [proofferprice] = @proofferprice, [status] = @status, [category] = @category WHERE [proid] = @proid">
                        <DeleteParameters>
                            <asp:Parameter Name="proid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="subcatid" Type="Int32" />
                            <asp:Parameter Name="proname" Type="String" />
                            <asp:Parameter Name="prodec" Type="String" />
                            <asp:Parameter Name="proimg" Type="String" />
                            <asp:Parameter Name="probimg" Type="String" />
                            <asp:Parameter Name="proprice" Type="Int32" />
                            <asp:Parameter Name="proofferprice" Type="Int32" />
                            <asp:Parameter Name="status" Type="Int32" />
                            <asp:Parameter Name="category" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="subcatid" Type="Int32" />
                            <asp:Parameter Name="proname" Type="String" />
                            <asp:Parameter Name="prodec" Type="String" />
                            <asp:Parameter Name="proimg" Type="String" />
                            <asp:Parameter Name="probimg" Type="String" />
                            <asp:Parameter Name="proprice" Type="Int32" />
                            <asp:Parameter Name="proofferprice" Type="Int32" />
                            <asp:Parameter Name="status" Type="Int32" />
                            <asp:Parameter Name="category" Type="Int32" />
                            <asp:Parameter Name="proid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                 </div>
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

