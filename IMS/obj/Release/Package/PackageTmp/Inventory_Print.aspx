﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory_Print.aspx.cs" Inherits="IMS.Inventory_Print" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 273px;
        }

        .auto-style2 {
            font-size: large;
        }

        .auto-style3 {
            width: 916px;
        }

        .auto-style4 {
            width: 758px;
        }

        @media print {
            .no-print, .no-print * {
                display: none !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="form-horizontal">
        <div class="form-group">
             
            <table style="width: 100%;" align="center" border="0">
            <tr>
                <td class="auto-style2">
                   <h3><strong>Inventory List</strong></h3>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
               <td><strong>Date: </strong></td>
                <td> <%: DateTime.Now.Date %></td>
            </tr>
                </table>
            <br />
            <br />
        <asp:GridView ID="StockDisplayGrid" runat="server" CssClass="table table-striped table-bordered table-condensed" AllowPaging="false" 
                AutoGenerateColumns="false" OnRowDataBound="StockDisplayGrid_RowDataBound" >
                 <Columns>
                     <asp:TemplateField HeaderText="Serial" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="Serial" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("SerialNum") %>' Width="25px"></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="35px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product Description" HeaderStyle-Width="500" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="ProductName" padding-right="5px" runat="server" Text='<%# Eval("ProdDesc") %>'></asp:Label>
                           <!-- <asp:Label ID="Label1" padding-right="5px" runat="server" Text=" : "></asp:Label>
                            <asp:Label ID="ProductStrength2" padding-right="5px" runat="server" Text='<%# Eval("strength") %>'  ></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text=" : " padding-right="5px"></asp:Label>
                            <asp:Label ID="dosage2"  runat="server" Text='<%# Eval("dosageForm") %>' padding-right="5px" ></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text=" : " padding-right="5px"></asp:Label>
                            <asp:Label ID="packSize2" runat="server" Text='<%# Eval("PackageSize") %>' padding-right="5px" ></asp:Label>-->
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Strength" Visible="false" HeaderStyle-Width ="125px">
                        <ItemTemplate>
                            <asp:Label ID="ProductStrength" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("strength") %>'  Width="125px" ></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="125px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Dosage Form" Visible="false" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="dosage" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("dosageForm") %>'  Width="100px" ></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Package Size" Visible="false" HeaderStyle-Width ="160px">
                        <ItemTemplate>
                            <asp:Label ID="packSize" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("PackageSize") %>'  Width="170px" ></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="170px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                                        
                     <asp:TemplateField HeaderText="Expiry" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblExpiry" CssClass="col-md-2 control-label"  runat="server" Text='<%# Eval(("Expiry").ToString(), "{0:dd/MM/yyyy}")%>' Width="100px"></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="100px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Unit Cost" HeaderStyle-HorizontalAlign="Justify">
                        <ItemTemplate>
                            <asp:Label ID="lblUnitCostPrice" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("CostPrice") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Justify"/>
                       
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Quantity" HeaderStyle-HorizontalAlign="Justify">
                        <ItemTemplate>
                            <asp:Label ID="lblQuantity" CssClass="col-md-2 control-label" runat="server" Text='<%# Eval("Qauntity") %>' Width="40px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="50px" HorizontalAlign="Justify"/>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Label ID="lblEmp1" CssClass="col-md-2 control-label" runat="server" Text='' Width="50px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Justify"/>
                       
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Label ID="lblEmp2" CssClass="col-md-2 control-label" runat="server" Text='' Width="50px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Justify"/>
                       
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Label ID="lblEmp3" CssClass="col-md-2 control-label" runat="server" Text='' Width="50px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Justify"/>
                       
                    </asp:TemplateField>
                     <%-- org command argument CommandArgument='<%# Eval("BarCode") %>'--%>
                     
                 </Columns>
             </asp:GridView>
       
         <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-primary btn-large no-print" Text="Go Back" OnClick="btnBack_Click"/>
                <asp:Button ID="btnPrint" runat="server" OnClientClick="window.print();" Text="Confirm" CssClass="btn btn-large no-print" Visible="true" />
                <asp:Button ID="btnFax" runat="server" visible="false" Text="BACK" CssClass="btn btn-large no-print" />
                <asp:Button ID="btnEmail" runat="server"  Text="EMAIL" CssClass="btn btn-large no-print" Visible="false" />
            </div>
        </div>
    </div>
    </div>
</asp:Content>
