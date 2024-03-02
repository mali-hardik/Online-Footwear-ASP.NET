<%@ Page Title="" Language="C#" MasterPageFile="~/User/after_usr.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="User_Default" %>

<%@ Register src="../MyCaptcha.ascx" tagname="MyCaptcha" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html>
<head>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 
</head>
<body>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<i class="fa fa-check" aria-hidden="true"></i>   
<div class="header-bot">
	<div class="container">

        <!--1. LOGIN-->
         <div class="well">
             <table class="nav-justified">
                 <tr>
                     <td style="width: 26px;">
                         <asp:Label ID="lbl_no1" runat="server" Text="1" ForeColor="#003399"></asp:Label>    
                     </td>
                     <td style="width: 26px;">
                         <asp:Label ID="lbl_log" runat="server" Text="LOGIN" ForeColor="Gray" ></asp:Label> 
                         <img src="images/Tick_Mark_Dark-512.png" height="20px">   
                     </td>
                     <td>  
                     </td>
                 </tr>
                 <tr>
                     <td style="width: 31px">
                         &nbsp;</td>
                     <td style="width: 100px">
                         <asp:Label ID="lbl_91" runat="server" Text="+91" ForeColor="#666666"></asp:Label><asp:Label ID="lbl_umobileno" runat="server" ForeColor="#666666"></asp:Label>
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
         </div>
         <!--1. // LOGIN-->

         <!--2. DELEVIRY ADDRESS-->
         <div class="well">
          <%--   <asp:ScriptManager ID="ScriptManager2" runat="server">
             </asp:ScriptManager>--%>
             <table class="nav-justified">
               <tr>
                     <td style="width: 26px;">
                         <asp:Label ID="lbl_no_2" runat="server" Text="2" ForeColor="#003399"></asp:Label>    
                     </td>
                     <td style="width: 200px;">
                        <asp:Label ID="lbl_dele_addd" runat="server" Text="DELIVERY ADDRESS" ForeColor="#666666" ></asp:Label> 
                     </td>
                     <td>
                         <%--<img src="http://localhost:64492/Footwere/User/images/Tick_Mark_Dark-512.png" height="20px">--%>
                         <asp:Image ID="img_del" runat="server" 
                             ImageUrl="~/User/images/Tick_Mark_Dark-512.png" Height="20px" Visible="False" />
                     </td>
                     <td>
                         <%--<asp:Button ID="btn_edit" runat="server" Text="Edit" onclick="btn_edit_Click" style=" float: right;"
                             Visible="False" />                        --%>
                             <asp:Button ID="btn_edit" runat="server" Text="Edit" 
                             OnClick="btn_edit_Click" style=" float:right; width:100px; cursor:pointer;" Visible="False" />
                     </td>
                 </tr>
            </table>
            <br />
             <asp:Panel ID="pnl_del" runat="server">
             <div class="contact-form2">
					<%--<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">--%>
                     <asp:TextBox ID="txt_uname" runat="server" placeholder="Name"  ForeColor="Black" BackColor="White" required=""></asp:TextBox>
					<%--<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">--%>
                     <asp:TextBox ID="txt_umobileno" runat="server" placeholder="Mobile No" ForeColor="Black" BackColor="White" required=""></asp:TextBox>
				<br />
                <br />
                    <%--<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">--%>
                    <asp:TextBox ID="txt_pincode" runat="server" placeholder="Pincode" ForeColor="Black" BackColor="White" required=""></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rev_pin" runat="server" ValidationExpression="^([3]{1})([0-9]{5})$" ErrorMessage="Pincode Is Invalid" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txt_pincode"></asp:RegularExpressionValidator>
					<%--<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">--%>
                    <asp:TextBox ID="txt_locality" runat="server" placeholder="Locality" ForeColor="Black" BackColor="White" required=""></asp:TextBox>
			
                <br />
                    <%--<textarea type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>--%>
                    <asp:TextBox ID="txt_add" runat="server" TextMode="MultiLine" placeholder="Address"  ForeColor="Black" BackColor="White" style="height:10px;" required=""></asp:TextBox>
                <br />             
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             
                 <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddl_state" runat="server" DataSourceID="SqlDataSource2" 
                        DataTextField="sname" DataValueField="sid" 
                        style="display: block;width: 200px;height: 34px; padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;cursor:pointer;" 
                        AutoPostBack="True"></asp:DropDownList>    
                <br />
                <asp:DropDownList ID="ddl_city" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="cname" DataValueField="cid" class="form-control" 
                        style="width: 200px;cursor:pointer;" AutoPostBack="True"></asp:DropDownList>
                    </ContentTemplate>
                 </asp:UpdatePanel>
                
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [state]"></asp:SqlDataSource>
                        
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:constr %>" 
                        SelectCommand="SELECT * FROM [city] WHERE ([sid] = @sid)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_state" Name="sid" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                
                   
                <br />
                <br />
					<%--<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">--%>
                    <asp:TextBox ID="txt_landmark" runat="server" placeholder="Landmark" ForeColor="Black" BackColor="White" required=""></asp:TextBox>
					<%--<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">--%>
                    <asp:TextBox ID="txt_altumobileno" runat="server" placeholder="Alternate Mobile No" ForeColor="Black" BackColor="White" required=""></asp:TextBox>
				<br />
                <br />
                <asp:Label ID="lbl_addtype" runat="server" Text="DELIVERY ADDRESS" ForeColor="Gray" Font-Size="13px"></asp:Label>
                <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rd_btn_home" runat="server" GroupName="rd_btn"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_home" runat="server" Text="Home (All Day Delivery)"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rd_btn_work" runat="server" GroupName="rd_btn" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_work" runat="server" Text="Work (Delivery Between 10 AM - 5 PM)"></asp:Label>
                <br />
                <br />
                    <%--<input type="submit" value="Submit" >--%>
             <asp:Button ID="btn_save" runat="server" Text="SAVE AND DELIVERY HERE" width="220px" 
                        onclick="btn_save_Click"/>
             <asp:Button ID="btn_cancle" runat="server" Text="Cancle" style="background:none;" 
                        ForeColor="#0033CC" onclick="btn_cancle_Click" />
				    
                    <asp:RegularExpressionValidator ID="rev_umobileno" runat="server" ValidationExpression="^([6-9]{1})([0-9]{9})$" ErrorMessage="mob number starting with 6 and only 10 digit num is valid for Mobile No" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txt_umobileno"></asp:RegularExpressionValidator>
                     <asp:RegularExpressionValidator ID="rev_altumobileno" runat="server" ValidationExpression="^([6-9]{1})([0-9]{9})$" ErrorMessage="mob number starting with 6 and only 10 digit num is valid for Alternate Mobile No" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txt_altumobileno"></asp:RegularExpressionValidator>
                </div>

                </asp:Panel>
         </div>
         <!--2. // DELEVIRY ADDRESS-->

         <!--3. ORDER SUMMARY -->
         <div class="well">
             <table class="nav-justified">
               <tr>
                     <td style="width: 26px;">
                         <asp:Label ID="lbl_no_3" runat="server" Text="3" ForeColor="#003399"></asp:Label>    
                     </td>
                     <td style="width: 200px;">
                        <asp:Label ID="lbl_ord" runat="server" Text="ORDER SUMMARY" ForeColor="666666" ></asp:Label> 
                     </td>
                     <td> 
                         <asp:Image ID="img_ord" runat="server" Height="20px" 
                             ImageUrl="~/User/images/Tick_Mark_Dark-512.png" Visible="False" />                                               
                     </td>
                 </tr>
            </table>
            <br />
           <asp:Panel ID="pnl_ord" runat="server" Visible="False" >
             <div class="contact-form2">
               <table class="flex-viewport">
                <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource3">
                     <ItemTemplate>
                         <table class="flex-viewport">
                             <tr>
                                 <td rowspan="2">
                                     <%--<asp:Image ID="Image1" runat="server" />--%>
                                         <img src='../Admin/upload/<%#Eval ("cart_img") %>' class="img-responsive" height="100px" Width="100px" />
                                 </td>
                                 <td class="invert">
                                     &nbsp;</td>
                                 <td class="invert">
                                     &nbsp;</td>
                                 <td class="invert">
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Label ID="lblproname" runat="server" Text='<%#Eval("cart_itemdetail") %>'></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td class="invert">
                                     &nbsp;</td>
                                 <td class="invert">
                                     &nbsp;</td>
                                 <td class="invert">
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Label ID="lblproprice" runat="server" 
                                         Text='<%#  "₹ " + Eval("cart_price")%>'></asp:Label>
                                 </td>
                             </tr>
                         </table>
                     </ItemTemplate>
                 </asp:DataList>

                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:constr %>" 
                     SelectCommand="SELECT * FROM [cart] WHERE ([umobileno] = @umobileno)">
                     <SelectParameters>
                         <asp:SessionParameter Name="umobileno" SessionField="umobileno" 
                             Type="Decimal" />
                     </SelectParameters>
                 </asp:SqlDataSource>
                 </td>
                 
                </tr>
               </table>
                 
			     
			 </div>
           </asp:Panel>
             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate >
               <div class="contact-form2">
          <table>
           <tr>
            <td>
            <%--<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">--%>
               <br />
                     Your Net Total : <asp:Label ID="lbl_net" runat="server" Text=""></asp:Label>
                 <br />
                     <asp:Label ID="lbl_email" runat="server" Text="Order Confirmation email will be sent to " ForeColor="Black" ></asp:Label>
					<%--<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">--%>
                     <asp:TextBox ID="txt_email" runat="server" 
                    placeholder="Enter your email id" style="border:none; width:200px;" 
                    ForeColor="Black" ontextchanged="txt_email_TextChanged" 
                     AutoPostBack="True" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rev_email" runat="server" 
                    ErrorMessage="Invalid Email Id" ControlToValidate="txt_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            <td>
                 <asp:Label ID="lbl_nettot" runat="server" Text=""></asp:Label>
			</td>
            <td><br />
                 <asp:Button ID="btn_email" runat="server" Text="CONTINUE" OnClick="btn_email_Click" style=" float:right; width:100px; cursor:pointer;" enabled="false"/>    
            </td>
            </tr>
            </table>
          </div>
          </ContentTemplate>
         </asp:UpdatePanel>
        
         </div>
         <!--3. // ORDER SUMMARY-->

         <!--4. PAYMENT-->
         <div class="well">
             <table class="nav-justified">
               <tr>
                     <td style="width: 26px;">
                         <asp:Label ID="lbl_no_4" runat="server" Text="4" ForeColor="#003399"></asp:Label>    
                     </td>
                     <td style="width: 200px;">
                        <asp:Label ID="lbl_payment" runat="server" Text="PAYMENT" ForeColor="666666" ></asp:Label> 
                     </td>
                     <td>                                                
                     </td>
                 </tr>
            </table>
            <br />

             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
           <asp:Panel ID="pnl_rd_cash" runat="server" Visible="False">
             <div class="contact-form2">
                 <asp:RadioButton ID="rd_btn_cash" runat="server" GroupName="rd_btn_pay" 
                     oncheckedchanged="rd_btn_cash_CheckedChanged" AutoPostBack="True"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_cash" runat="server" Text="Cash on Delivery"></asp:Label>
                 <br />
                 <br />
                 <asp:Panel ID="pnl_cash" runat="server" Visible="False">
                     <table class="flex-viewport">
                         <tr>
                             <td>
                                 &nbsp;</td>
                            <td>
                                 &nbsp;</td>
                            <td rowspan="3">
                                 <uc1:MyCaptcha ID="MyCaptcha1" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="btn_confirm" runat="server" Text="CONFIRM" 
                                    style="width:150px; float:right;" onclick="btn_confirm_Click"/>
                            </td>
                        </tr>
                        <tr>
                            <asp:Label ID="lbl_cap" runat="server" Text=""></asp:Label>
                        </tr>

                 </table>
                </asp:Panel>
             </div>
           </asp:Panel>
            
            
           <asp:Panel ID="pnl_rd_pay" runat="server" Visible="False">
             <div class="contact-form2">
                 <asp:RadioButton ID="rd_btn_paytm" runat="server" GroupName="rd_btn_pay" 
                     oncheckedchanged="rd_btn_paytm_CheckedChanged" AutoPostBack="True"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_paytm" runat="server" Text="Paytm"></asp:Label>
                <br />
                <br />
                 <asp:Panel ID="pnl_pay" runat="server" Visible="False">
                      <table class="flex-viewport">
                         <tr>
                             <td>
                                 &nbsp;</td>
                            <td>
                                 &nbsp;</td>
                            <td rowspan="3">
                                  <%-- <a href="https://securegw.paytm.in/link/81129/LL_3486051" target='_blank' rel='im-checkout' data-behaviour='remote' data-style='light' data-text="Pay with Paytm" style="border-radius: 2px;display: inline-block;border: 1px solid #e6ebf3;padding: 0 40px;color: #182233;font-size: 14px;text-decoration: none;font-family: 'Nunito Sans', sans-serif;height: 48px;line-height: 48px;background: #00b9f5;color: #ffffff;border: 1px solid #00b9f5;">
                                   <span>Pay  with</span>
                                   <img style="margin-left: 6px;vertical-align:sub;width: 62px; height: 19px;" src="https://static1.paytm.in/1.4/plogo/paytmlogo-white.png" /></a>--%>
                              
                            </td>
                        </tr>

                 </table>
                 </asp:Panel>
                   <%--<asp:Button ID="Button1" runat="server" Text="Pay With Paytm" 
                                      onclick="Button1_Click" />--%>
                 
             </div>
           </asp:Panel>
           <asp:Button ID="Button1" runat="server" Text="Button" 
                     onclick="Button1_Click1" />
           </ContentTemplate>
           </asp:UpdatePanel>
         </div>
         <!--4. // PAYMENT-->

    </div>
</div>
</body>
</html>
</asp:Content>

