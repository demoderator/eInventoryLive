﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPlacedOrders.aspx.cs" Inherits="IMS.ViewPlacedOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%-- <script src="Scripts/jquery-ui.js" type="text/javascript"></script>
          <link rel="stylesheet" href="Style/jquery-ui.css" />
          <script>
              $(function () { $("#<%= DateTextBox.ClientID %>").datepicker(); });

          </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <h2> Placed Order(s)</h2> 
    <br />
     <script src="Scripts/jquery.js"  type="text/javascript"></script>
          <script src="Scripts/jquery-ui.js" type="text/javascript"></script>
          <link rel="stylesheet" href="Style/jquery-ui.css" />
          <script>
              $(function () { $("#<%= DateTextBox.ClientID %>").datepicker(); });

          </script>

   <table cellspacing="0" cellpadding="5" border="0" width="100%">
        <tr>
               <td>
                   <asp:Label runat="server" AssociatedControlID="StockAt" CssClass="control-label">Vendor Name </asp:Label>
               </td>

             <td>
                   <asp:TextBox runat="server" ID="SelectProduct" CssClass="form-control product"/>
                <asp:ImageButton ID="btnSearchProduct" runat="server" OnClick="btnSearchProduct_Click" Text="SearchProduct" Height="30px" ImageUrl="~/Images/search-icon-512.png" Width="45px" />
                
                <asp:DropDownList runat="server" ID="StockAt" CssClass="form-control" Width="29%" AutoPostBack="True" OnSelectedIndexChanged="StockAt_SelectedIndexChanged" Visible="false"/>
                
               </td>
        
               <td>
                   <asp:Label runat="server" AssociatedControlID="DateTextBox"  CssClass="control-label">Order Date</asp:Label>
               </td>

             <td>
                    <asp:TextBox runat="server" ID="DateTextBox" CssClass="form-control" />
                
               </td>
         </tr>

          <tr>
               <td>
                   <asp:Label runat="server" AssociatedControlID="txtOrderNO"  CssClass="control-label">Order Number</asp:Label>
               </td>

             <td>
                     <asp:TextBox runat="server" ID="txtOrderNO" CssClass="form-control" />
                
               </td>
       
               <td>
                   <asp:Label runat="server" AssociatedControlID="OrderStatus" CssClass="control-label">Order Status </asp:Label>
               </td>

             <td>
                     <asp:DropDownList runat="server" ID="OrderStatus" CssClass="form-control" Width="280" AutoPostBack="True" OnSelectedIndexChanged="OrderStatus_SelectedIndexChanged"/>
                
               </td>
         </tr>

         <tr>
             <td></td>
             <td colspan="100%" class="btnSpace">
                 
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Enabled="true" Text="SEARCH" CssClass="btn btn-primary"/>
                <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Enabled="true" Text="REFRESH" CssClass="btn btn-default"/>
            </td>
         </tr>

        </table>


    <%--<div class="form-horizontal">
     <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="StockAt" CssClass="col-md-2 control-label">Vendor Name </asp:Label>
            <div class="col-md-6">
                <asp:TextBox runat="server" ID="SelectProduct" CssClass="form-control product"/>
                <asp:ImageButton ID="btnSearchProduct" runat="server" OnClick="btnSearchProduct_Click" Text="SearchProduct" Height="35px" ImageUrl="~/Images/search-icon-512.png" Width="45px" />
                <br />
                <asp:DropDownList runat="server" ID="StockAt" CssClass="form-control" Width="29%" AutoPostBack="True" OnSelectedIndexChanged="StockAt_SelectedIndexChanged" Visible="false"/>
                <br/>
            </div>
    </div>

     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DateTextBox"  CssClass="col-md-2 control-label">Order Date</asp:Label>
            <div class="col-md-6">
                 <asp:TextBox runat="server" ID="DateTextBox" CssClass="form-control" />
                 <br />
            </div>
            
    </div>

     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtOrderNO"  CssClass="col-md-2 control-label">Order Number</asp:Label>
            <div class="col-md-6">
                 <asp:TextBox runat="server" ID="txtOrderNO" CssClass="form-control" />
                 <br />
            </div>
            
    </div>

     <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="OrderStatus" CssClass="col-md-2 control-label">Order Status </asp:Label>
            <div class="col-md-6">
                <asp:DropDownList runat="server" ID="OrderStatus" CssClass="form-control" Width="29%" AutoPostBack="True" OnSelectedIndexChanged="OrderStatus_SelectedIndexChanged"/>
                <br/>
            </div>
    </div>

     <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Enabled="true" Text="SEARCH" CssClass="btn btn-default"/>
                <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Enabled="true" Text="REFRESH" CssClass="btn btn-default"/>
            </div>
        </div>
    </div>--%>

    <div class="form-horizontal">
    <div class="form-group">
        <asp:GridView ID="StockDisplayGrid" CssClass="table table-striped table-bordered table-condensed"  Visible="true" runat="server" AllowPaging="True" PageSize="10" 
                AutoGenerateColumns="false" OnSelectedIndexChanged="StockDisplayGrid_SelectedIndexChanged" OnPageIndexChanging="StockDisplayGrid_PageIndexChanging"   onrowcancelingedit="StockDisplayGrid_RowCancelingEdit" 
                onrowcommand="StockDisplayGrid_RowCommand" onrowediting="StockDisplayGrid_RowEditing"  OnRowDataBound="StockDisplayGrid_RowDataBound" OnRowDeleting="StockDisplayGrid_RowDeleting">
                 <Columns>
                     <asp:TemplateField HeaderText="Action" HeaderStyle-Width ="150px">
                        <ItemTemplate>
                            
                            <asp:Button CssClass="btn btn-default edit-btn" ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" CommandArgument='<%# Container.DisplayIndex  %>'/>
                            <span onclick="return confirm('Are you sure you want to delete this record?')">
                                <asp:Button CssClass="btn btn-default del-btn" ID="btnDelete" Text="Delete" runat="server" CommandName="Delete" CommandArgument='<%# Container.DisplayIndex  %>'/>
                            </span>
                              </ItemTemplate>
                         <ItemStyle  Width="150px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order No." HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="OrderNo" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                            <%--<asp:Label ID="OrderNO" CssClass="control-label" runat="server" Text='<%# Eval("OrderID") %>' Width="100px" ></asp:Label>--%>
                        </ItemTemplate>
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>

                    </asp:TemplateField>
                     
                     <asp:TemplateField HeaderText="Order Date" HeaderStyle-Width ="150px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="OrderDate" Text='<%# Eval("OrderDate") %>'></asp:Label>
                            <%--<asp:Label ID="OrderDate" CssClass="control-label" runat="server" Text='<%# Eval("OrderDate") %>'  Width="180px"></asp:Label>--%>
                        </ItemTemplate>
                        <ItemStyle  Width="180px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Order To" HeaderStyle-Width ="200px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="OrderTo" Text='<%# Eval("Location") %>'></asp:Label>
                            <%--<asp:Label ID="OrderTo" CssClass="control-label" runat="server" Text='<%# Eval("Location") %>'  Width="300px" ></asp:Label>--%>
                        </ItemTemplate>
                         <ItemStyle  Width="300px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Order Status" HeaderStyle-Width ="130px">
                        <ItemTemplate>
                            <%--<asp:Literal runat="server" ID="OrderStatus" Text='<%# Eval("Status") %>'></asp:Literal>--%>
                            <asp:Label ID="OrderStatus" CssClass="control-label" runat="server" Text='<%# Eval("Status") %>' ></asp:Label>
                        </ItemTemplate>
                          <ItemStyle  Width="130px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                    
                     
                 </Columns>
             </asp:GridView>
    </div>
    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
               <!-- Back Button if needed-->
            </div>
        </div>
    </div>

    <div class="form-horizontal">
    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-primary btn-large" Text="Go Back" OnClick="btnBack_Click"/>
            </div>
     </div>
     </div>
</asp:Content>
