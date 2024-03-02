<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>Gallary Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
              <asp:ScriptManager ID="ScriptManager1" runat="server">
              </asp:ScriptManager>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <%--<div class="form-group">
              <label class="control-label">Category</label>
                <asp:DropDownList ID="ddl_men" runat="server" class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                            ng-model="model.name" AutoPostBack="True" 
                     DataSourceID="SqlDataSource5" DataTextField="proname" DataValueField="proid">
                </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:constr %>" 
                     
                    SelectCommand="SELECT DISTINCT [category] FROM [product] WHERE ([category] = @category)">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="ddl_men" Name="category" 
                             PropertyName="SelectedValue" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </div>--%>
          <div class="form-group">
              <label class="control-label">Category Name</label>
              <asp:DropDownList ID="ddl_cat" runat="server" 
                  class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                  ng-model="model.name" AutoPostBack="True" DataSourceID="SqlDataSource3" 
                  DataTextField="cname" DataValueField="cid">
              </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:constr %>" 
                  SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
          </div>
           <div class="form-group">
              <label class="control-label">Sub Category Name</label>
              <asp:DropDownList ID="ddl_subcat" runat="server" class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                  ng-model="model.name" AutoPostBack="True" DataSourceID="SqlDataSource4" 
                   DataTextField="subcatname" DataValueField="subcatid">
              </asp:DropDownList>
               <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:constr %>" 
                   SelectCommand="SELECT * FROM [subcategory] WHERE ([catid] = @catid)">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="ddl_cat" Name="catid" 
                           PropertyName="SelectedValue" Type="Int32" />
                   </SelectParameters>
               </asp:SqlDataSource>
          </div>
       
            <div class="form-group">
              <label class="control-label">Product Name</label>
                <asp:DropDownList ID="drp_proid" runat="server" class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                            ng-model="model.name" DataSourceID="SqlDataSource1" 
                    DataTextField="proname" DataValueField="proid" AutoPostBack="True">
                </asp:DropDownList>
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    SelectCommand="SELECT * FROM [product]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_subcat" Name="subcatid" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
         
                </ContentTemplate>
              </asp:UpdatePanel>
            
            
            
            <div class="form-group">
              <label class="control-label">Product Gallary Image</label>
                <%--<asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default"/>--%>
                    <div class="form-group">
                        <%-- <button type="submit" class="btn btn-primary">Submit</button>--%><%-- <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_add_Click"/>--%>
                        <asp:FileUpload ID="fup_front" runat="server" 
                            class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                            ng-model="model.name"/>
                    </div>
            </div>

            <div class="form-group">
              <label class="control-label">Product Gallary Image</label>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                    <div class="form-group">
                        <%--<asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default"/>--%><%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                        <asp:FileUpload ID="fup_back" runat="server" 
                            class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                            ng-model="model.name"/>
                    </div>
            </div>

            <div class="form-group">
              <label class="control-label">Product Gallary Image</label>
                <%-- <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_add_Click"/>--%>
                    <div class="form-group">
                        <%--<button type="reset" class="btn btn-default">Reset</button>--%><%--<asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default"/>--%>
                        <asp:FileUpload ID="fup_right" runat="server" 
                            class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                            ng-model="model.name"/>
                    </div>
            </div>

            <div class="form-group">
              <label class="control-label">Product Gallary Image</label>
                <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                    <div class="form-group">
                        <%-- <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_add_Click"/>--%>                        <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                        <asp:FileUpload ID="fup_left" runat="server" 
                            class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                            ng-model="model.name"/>
                    </div>
            </div>
            
              <%--<asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default"/>--%>
            

            <div class="form-group">
                <asp:Label ID="lbl_message_front" runat="server"></asp:Label>
          &nbsp;<asp:Label ID="lbl_message_back" runat="server"></asp:Label>
          &nbsp;<asp:Label ID="lbl_message_right" runat="server"></asp:Label>
          &nbsp;<asp:Label ID="lbl_message_left" runat="server"></asp:Label>
            </div>

            <div class="form-group">
             <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
               <%-- <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_add_Click"/>--%>
                <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary" 
                    onclick="btn_add_Click" />
               
              <%--<button type="reset" class="btn btn-default">Reset</button>--%>
                <%--<asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default"/>--%>
                <asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default" 
                    onclick="btn_res_Click"/>

                <br />

                <br />
                <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="gid" DataSourceID="SqlDataSource2" 
                    EmptyDataText="There are no data records to display." CssClass ="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="gid" HeaderText="Gallery Id" ReadOnly="True" 
                            SortExpression="gid" />
                        <asp:BoundField DataField="proid" HeaderText="Product Id" 
                            SortExpression="proid" />
                        
                        <asp:TemplateField HeaderText="Front Image">
                        <ItemTemplate>
                            <img src ='gallery/<%#Eval("gallfimg") %>' height="80px" width="80px" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="gallfimg" HeaderText="Gallery Front Image Name" 
                            SortExpression="gallfimg" />
                        
                        <asp:TemplateField HeaderText="Back Image">
                        <ItemTemplate>
                            <img src ='gallery/<%#Eval("gallbimg") %>' height="80px" width="80px" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="gallbimg" HeaderText="Gallery Back Image Name" 
                            SortExpression="gallbimg" />
                        
                        <asp:TemplateField HeaderText="Right Image">
                        <ItemTemplate>
                            <img src ='gallery/<%#Eval("gallrimg") %>' height="80px" width="80px" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="gallrimg" HeaderText="Gallery Right Image Name" 
                            SortExpression="gallrimg" />
                        
                        <asp:TemplateField HeaderText="Left Image">
                        <ItemTemplate>
                            <img src ='gallery/<%#Eval("galllimg") %>' height="80px" width="80px" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="galllimg" HeaderText="Gallery Left Image Name" 
                            SortExpression="galllimg" />
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:constr %>" 
                    DeleteCommand="DELETE FROM [gallery] WHERE [gid] = @gid" 
                    InsertCommand="INSERT INTO [gallery] ([proid], [gallfimg], [gallbimg], [gallrimg], [galllimg]) VALUES (@proid, @gallfimg, @gallbimg, @gallrimg, @galllimg)" 
                    SelectCommand="SELECT * FROM [gallery]" 
                    UpdateCommand="UPDATE [gallery] SET [proid] = @proid, [gallfimg] = @gallfimg, [gallbimg] = @gallbimg, [gallrimg] = @gallrimg, [galllimg] = @galllimg WHERE [gid] = @gid">
                    <DeleteParameters>
                        <asp:Parameter Name="gid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="proid" Type="Int32" />
                        <asp:Parameter Name="gallfimg" Type="String" />
                        <asp:Parameter Name="gallbimg" Type="String" />
                        <asp:Parameter Name="gallrimg" Type="String" />
                        <asp:Parameter Name="galllimg" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="proid" Type="Int32" />
                        <asp:Parameter Name="gallfimg" Type="String" />
                        <asp:Parameter Name="gallbimg" Type="String" />
                        <asp:Parameter Name="gallrimg" Type="String" />
                        <asp:Parameter Name="galllimg" Type="String" />
                        <asp:Parameter Name="gid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                
                
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

