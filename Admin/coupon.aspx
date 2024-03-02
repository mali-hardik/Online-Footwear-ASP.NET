<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="coupon.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="col-md-12 graphs">
    <div class="xs">
  	    <h3>Coupon Page</h3>
  	    <div class="well1 white">
        <form id="Form1" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()" runat="server">
          <fieldset>
            <div class="form-group">
              <label class="control-label">Coupon Code</label>
                <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:TextBox ID="txtc_code" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Discount</label>
                <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:TextBox ID="txt_dis" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Max Discount</label>
                <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:TextBox ID="txt_maxdis" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label class="control-label">Coupon Date</label>
                <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                <asp:TextBox ID="txt_cdate" runat="server" type="text" 
                    class="form-control1 ng-invalid ng-invalid-required ng-touched" 
                    ng-model="model.name"></asp:TextBox>
            </div>
              <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
            <div class="form-group filled">
              <label class="control-label">Status</label>          
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
                <asp:Button ID="btn_res" runat="server" Text="Reset" class="btn btn-default" />
            </div>
            <br />
               <div class="table-responsive">

                   
                   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                       AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="SqlDataSource1" 
                       EmptyDataText="There are no data records to display."  CssClass="table table-striped table-bordered table-hover" Width="100%">
                       <Columns>
                           <asp:BoundField DataField="cid" HeaderText="cid" ReadOnly="True" 
                               SortExpression="cid" />
                           <asp:BoundField DataField="c_code" HeaderText="c_code" 
                               SortExpression="c_code" />
                           <asp:BoundField DataField="discount" HeaderText="discount" 
                               SortExpression="discount" />
                           <asp:BoundField DataField="max_discount" HeaderText="max_discount" 
                               SortExpression="max_discount" />
                           <asp:BoundField DataField="last_date" HeaderText="last_date" 
                               SortExpression="last_date" />
                           <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                           <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                       </Columns>
                   </asp:GridView>
                   </div>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:constr %>" 
                       DeleteCommand="DELETE FROM [coupon] WHERE [cid] = @cid" 
                       InsertCommand="INSERT INTO [coupon] ([c_code], [discount], [max_discount], [last_date]) VALUES (@c_code, @discount, @max_discount, @last_date)" 
                       SelectCommand="SELECT [cid], [c_code], [discount], [max_discount], [last_date] FROM [coupon]" 
                       UpdateCommand="UPDATE [coupon] SET [c_code] = @c_code, [discount] = @discount, [max_discount] = @max_discount, [last_date] = @last_date WHERE [cid] = @cid">
                       <DeleteParameters>
                           <asp:Parameter Name="cid" Type="Int32" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="c_code" Type="String" />
                           <asp:Parameter Name="discount" Type="Int32" />
                           <asp:Parameter Name="max_discount" Type="Int32" />
                           <asp:Parameter Name="last_date" Type="String" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="c_code" Type="String" />
                           <asp:Parameter Name="discount" Type="Int32" />
                           <asp:Parameter Name="max_discount" Type="Int32" />
                           <asp:Parameter Name="last_date" Type="String" />
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

