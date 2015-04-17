﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderPurchaseManual.aspx.cs" Inherits="IMS.OrderPurchaseManual" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <h3>Manual Purchase Order(s)</h3>
    <br />
    <br />
    <div class="row">
     
    
    <div class="form-group">
            <%--<asp:Label runat="server"  AssociatedControlID="RequestTo" CssClass="col-md-2 control-label">Select Vendor</asp:Label>--%>
            <div class="col-md-10">
                <%--<asp:TextBox runat="server" ID="txtVendor" CssClass="form-control product"/>
                <asp:ImageButton ID="btnSearchVendor" runat="server" OnClick="btnSearchVendor_Click" Height="35px" ImageUrl="~/Images/search-icon-512.png" Width="45px" />
                <br />
                <asp:DropDownList runat="server" ID="RequestTo" CssClass="form-control" Width="29%" AutoPostBack="true" OnSelectedIndexChanged="RequestTo_SelectedIndexChanged" Visible="false" >
                <%--class="chzn-select"   <asp:ListItem Text="" Value=""></asp:ListItem>
                  <asp:ListItem Value=''> ------------------- Select ------------------ </asp:ListItem>--%>
                 <%--</asp:DropDownList>--%>
                <br />
            </div>
       <%--  <script src="Scripts/jquery.min.js" type="text/javascript"></script>
         <script src="Scripts/chosen.jquery.js" type="text/javascript"></script>
         <script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>--%>
    </div>
   <table cellspacing="5" cellpadding="5" border="0" width="100%">

       <tr>
           <td><asp:Label runat="server"  AssociatedControlID="RequestTo" CssClass="control-label">Select Vendor</asp:Label></td>
           <td>

                <asp:TextBox runat="server" ID="txtVendor" CssClass="form-control product"/>
                <asp:ImageButton ID="btnSearchVendor" runat="server" OnClick="btnSearchVendor_Click" Height="30px" ImageUrl="~/Images/search-icon-512.png" Width="45px" />
                <br />
                <asp:DropDownList runat="server" ID="RequestTo" CssClass="form-control" Width="280" AutoPostBack="true" OnSelectedIndexChanged="RequestTo_SelectedIndexChanged" Visible="false" >
                
                    <%--class="chzn-select"   <asp:ListItem Text="" Value=""></asp:ListItem>
                  <asp:ListItem Value=''> ------------------- Select ------------------ </asp:ListItem>--%>
                    
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="RequestTo" CssClass="text-danger" ErrorMessage="The Vendor field is required." ValidationGroup="ExSave"/>
                
                
           </td>
       
            <td><asp:Label runat="server" AssociatedControlID="txtProduct" CssClass="control-label">Select Product</asp:Label></td>
            <td><asp:TextBox runat="server" ID="txtProduct" CssClass="form-control product"/>
                <asp:ImageButton ID="btnSearchProduct" runat="server" OnClick="btnSearchProduct_Click"  Height="30px" ImageUrl="~/Images/search-icon-512.png" Width="45px" />
                
                <asp:DropDownList runat="server" ID="SelectProduct" Visible="false" CssClass="form-control" Width="280" AutoPostBack="True" OnSelectedIndexChanged="SelectProduct_SelectedIndexChanged"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="SelectProduct" CssClass="text-danger" ErrorMessage="The Product field is required." ValidationGroup="ExSave"/>
                 
               </td>
           </tr>
        <tr>
            <td><asp:Label runat="server" AssociatedControlID="SelectQuantity" CssClass="control-label">Enter Quantity</asp:Label></td>
            <td><asp:TextBox runat="server" ID="SelectQuantity" CssClass="form-control" autocomplete="off" /></td>
       
           <td><asp:Label runat="server" AssociatedControlID="SelectPrice" CssClass="control-label">Enter Bonus Quantity</asp:Label></td>
           <td><asp:TextBox runat="server" ID="SelectPrice" CssClass="form-control" autocomplete="off" /></td>
           
       </tr>
       <tr>
           <td></td>
           <td colspan="100%">
               <asp:Button ID="btnCreateOrder" runat="server" OnClick="btnCreateOrder_Click" Text="ADD" CssClass="btn btn-primary" ValidationGroup="ExSave"/>
                <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="REFRESH" CssClass="btn btn-default" Visible="False" />
                <asp:Button ID="btnCancelOrder" runat="server" OnClick="btnCancelOrder_Click" Text="GO BACK" CssClass="btn btn-default btn-large" />

           </td>
       </tr>
    </table>
    <div class="form-group">
            <%--<asp:Label runat="server" AssociatedControlID="txtProduct" CssClass="col-md-2 control-label">Select Product</asp:Label>--%>
            <div class="col-md-10">
                <%--<asp:TextBox runat="server" ID="txtProduct" CssClass="form-control product"/>
                <asp:ImageButton ID="btnSearchProduct" runat="server" OnClick="btnSearchProduct_Click"  Height="35px" ImageUrl="~/Images/search-icon-512.png" Width="45px" />
                <br />
                <asp:DropDownList runat="server" ID="SelectProduct" Visible="false" CssClass="form-control" Width="29%" AutoPostBack="True" OnSelectedIndexChanged="SelectProduct_SelectedIndexChanged"/>
                <br/>--%>
            </div>
    </div>

    <div class="form-group">
            <%--<asp:Label runat="server" AssociatedControlID="SelectQuantity" CssClass="col-md-2 control-label">Enter Quantity</asp:Label>--%>
            <div class="col-md-10">
                <%--<asp:TextBox runat="server" ID="SelectQuantity" CssClass="form-control" autocomplete="off" />--%>
                <br />
            </div>
    </div>

    <div class="form-group">
            <%--<asp:Label runat="server" AssociatedControlID="SelectPrice" CssClass="col-md-2 control-label">Enter Bonus Quantity</asp:Label>--%>
            <div class="col-md-10">
                <%--<asp:TextBox runat="server" ID="SelectPrice" CssClass="form-control" autocomplete="off" />--%>
                <br />
            </div>
    </div>

    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <%--<asp:Button ID="btnCreateOrder" runat="server" OnClick="btnCreateOrder_Click" Text="ADD" CssClass="btn btn-default" />
                <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="REFRESH" CssClass="btn btn-default" Visible="False" />
                <asp:Button ID="btnCancelOrder" runat="server" OnClick="btnCancelOrder_Click" Text="GO BACK" CssClass="btn btn-primary btn-large" />--%>
            </div>
        </div>
    </div>
    
    <br />
    <br />

    <div class="form-horizontal">
    <div class="form-group">
        <asp:GridView ID="StockDisplayGrid" CssClass="table table-striped table-bordered table-condensed"  Visible="true" runat="server" AllowPaging="True" PageSize="10" 
                AutoGenerateColumns="false" OnPageIndexChanging="StockDisplayGrid_PageIndexChanging"   onrowcancelingedit="StockDisplayGrid_RowCancelingEdit" 
                onrowcommand="StockDisplayGrid_RowCommand"  onrowdeleting="StockDisplayGrid_RowDeleting" onrowediting="StockDisplayGrid_RowEditing" OnRowDataBound="StockDisplayGrid_RowDataBound" >
                 <Columns>
                     <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="OrderDetailNo" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("OrderDetailID") %>' ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="1px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="From" Visible="false" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="RequestedFrom" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("FromPlace") %>' Width="100px" ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>

                    </asp:TemplateField>
                     
                     <asp:TemplateField HeaderText="To" Visible="false" HeaderStyle-Width ="150px">
                        <ItemTemplate>
                            <asp:Label ID="RequestedTo" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("ToPlace") %>'  Width="140px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="150px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Action" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-default" ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" />
                            <span onclick="return confirm('Are you sure you want to delete this record?')">
                                <asp:Button CssClass="btn btn-default" ID="btnDelete" Text="Delete" runat="server" CommandName="Delete"/>
                            </span>
                        </ItemTemplate>
                          
                        <EditItemTemplate>

                            <asp:LinkButton CssClass="btn btn-default" ID="btnUpdate" Text="Update" runat="server" CommandName="UpdateStock" />
                            <br />
                            <asp:LinkButton CssClass="btn btn-default" ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                        </EditItemTemplate>
                         
                         <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Product Description" Visible="true" HeaderStyle-Width ="330px">
                        <ItemTemplate>
                            <asp:Label ID="ProductName" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("Description") %>'  Width="330px" ></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="330px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                    
                      <asp:TemplateField HeaderText="Strength" Visible="false" HeaderStyle-Width ="150px">
                        <ItemTemplate>
                            <asp:Label ID="ProductStrength" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("strength") %>'  Width="150px" ></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="160px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Dosage Form" Visible="false" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="dosage" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("dosageForm") %>'  Width="100px" ></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Package Size" Visible="false" HeaderStyle-Width ="160px">
                        <ItemTemplate>
                            <asp:Label ID="packSize" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("PackageSize") %>'  Width="150px" ></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="160px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Quantity"  HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblQuantity" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("Qauntity") %>' ></asp:Label>
                        </ItemTemplate>
                        
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQuantity" CssClass="form-control" runat="server" Text='<%#Eval("Qauntity") %>' ></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuantity" CssClass="text-danger" ErrorMessage="The product quantity field is required." />
                        </EditItemTemplate>
                          <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Bonus Quantity"  HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblBonusQuantity" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("Bonus") %>' ></asp:Label>
                        </ItemTemplate>
                        
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBonusQuantity" CssClass="form-control" runat="server" Text='<%#Eval("Bonus") %>' ></asp:TextBox>
                            </EditItemTemplate>
                          <ItemStyle  Width="90px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Order Status" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("Status") %>'  Width="100px"></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                    
                 </Columns>
             </asp:GridView>
        <br />
         <asp:Button ID="btnAccept" runat="server" OnClick="btnAccept_Click" Text="GENERATE ORDER" CssClass="btn btn-large" Visible="false"/>
         <asp:Button ID="btnDecline" runat="server" OnClick="btnDecline_Click" Text="DELETE ORDER" CssClass="btn btn-large" Visible="false" />
    </div>
    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
               
            </div>
        </div>
    </div>
      
</asp:Content>
