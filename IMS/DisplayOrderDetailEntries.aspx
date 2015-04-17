﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayOrderDetailEntries.aspx.cs" Inherits="IMS.DisplayOrderDetailEntries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <%--<script src="Scripts/jquery.js"  type="text/javascript"></script>
          <script src="Scripts/jquery-ui.js" type="text/javascript"></script>
          <link rel="stylesheet" href="Style/jquery-ui.css" />
          <script>
              $(function () { $("#<%= txtExpDate.ClientID %>").datepicker(); });

          </script>--%>
      <h3> Order Detail Entries</h3> 
    <table Width="100%">
        <tr>
            <td><b>Product Name</b></td>
            <td><asp:Label ID="ProdName" runat="server" CssClass="form-control"></asp:Label></td>
            
        </tr>
         <tr>
            <td><b>Ordered Quantity</b></td>
            <td><asp:Label runat="server" ID="Label1" CssClass="form-control" /></td>
            <td><b>Received Quantity</b></td>
            <td> <asp:Label runat="server" ID="Label2" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td><b>Returned Quantity</b></td>
            <td><asp:Label runat="server" ID="retQuantity" CssClass="form-control" /></td>
            <td><b>Expired Quantity</b></td>
            <td> <asp:Label runat="server" ID="expQuantity" CssClass="form-control" /></td>
        </tr>
    </table>
   
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="retQuantity"  CssClass="col-md-2 control-label">Returned Quantity</asp:Label>
            <div class="col-md-10">
                
                 <br />
            </div>
            
    </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="expQuantity"  CssClass="col-md-2 control-label">Expired Quantity</asp:Label>
            <div class="col-md-10">
                
                 <br />
            </div>
            
    </div>
        <asp:Label runat="server" Visible="false" ID="lblOMISD" CssClass="form-control" />
        <asp:Label runat="server" Visible="false" ID="lblPO" CssClass="form-control" />
        <asp:Label runat="server" Visible="false" ID="lblBarSerial" CssClass="form-control" />
        <asp:Label runat="server" Visible="false" ID="lblOrderDetID" CssClass="form-control" />
        <asp:Label runat="server" Visible="false" ID="lblProdID" CssClass="form-control" />
     <%--<div class="form-group">
        <asp:Label runat="server" AssociatedControlID="OrderStatus" CssClass="col-md-2 control-label">Order Status </asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="OrderStatus" CssClass="form-control" Width="29%" AutoPostBack="True" OnSelectedIndexChanged="OrderStatus_SelectedIndexChanged"/>
                <br/>
            </div>
    </div>--%>

    
   
     <br />
    <div class="form-horizontal">
    <div class="form-group">
        <asp:GridView ID="StockDisplayGrid" CssClass="table table-striped table-bordered table-condensed"  Visible="true" runat="server" AllowPaging="True" PageSize="10" 
                AutoGenerateColumns="false" OnPageIndexChanging="StockDisplayGrid_PageIndexChanging" OnRowCancelingEdit="StockDisplayGrid_RowCancelingEdit" OnRowCommand="StockDisplayGrid_RowCommand"
             OnRowDataBound="StockDisplayGrid_RowDataBound" OnRowEditing="StockDisplayGrid_RowEditing" ShowFooter="true" OnRowDeleting="StockDisplayGrid_RowDeleting">
                 <Columns>
                      <asp:TemplateField HeaderText="Action" HeaderStyle-Width ="150px">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-default" ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" />
                             <asp:Button CssClass="btn btn-default" ID="btnDelete" Text="Delete" runat="server" CommandName="Delete" />
                             <%--CommandArgument='<%# Container.DisplayIndex  %>'--%>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:LinkButton ID="btnUpdate" Text="Update" runat="server" CommandName="UpdateStock" />
                            <br />
                            <asp:LinkButton  ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                        </EditItemTemplate>
                          <FooterTemplate>
                            <asp:Button ID="btnAddRecord" CssClass="btn btn-default"  runat="server" Text="Add" CommandName="AddRec"></asp:Button>
                        </FooterTemplate>
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText="Accepted Quantity" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblRecQuan" runat="server" Text=' <%#Eval("ReceivedQuantity")==DBNull.Value?0:int.Parse( Eval("ReceivedQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox ID="RecQuanVal"  runat="server" Text=' <%#Eval("ReceivedQuantity")==DBNull.Value?0:int.Parse( Eval("ReceivedQuantity").ToString())  %>' Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                         <FooterTemplate>
                            <asp:TextBox ID="txtAddRecQuan" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                  
                     <asp:TemplateField HeaderText="Expired Quantity" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblExpQuan" runat="server" Text=' <%#Eval("ExpiredQuantity")==DBNull.Value?0:int.Parse( Eval("ExpiredQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox ID="ExpQuanVal"  runat="server" Text=' <%#Eval("ExpiredQuantity")==DBNull.Value?0:int.Parse( Eval("ExpiredQuantity").ToString())  %>' Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                          <FooterTemplate>
                            <asp:TextBox ID="txtAddExpQuan" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     
                      <asp:TemplateField HeaderText="Defected Quantity" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblDefQuan" runat="server" Text=' <%#Eval("DefectedQuantity")==DBNull.Value?0:int.Parse( Eval("DefectedQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox ID="defQuanVal"  runat="server" Text=' <%#Eval("DefectedQuantity")==DBNull.Value?0:int.Parse( Eval("DefectedQuantity").ToString())  %> ' Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                           <FooterTemplate>
                            <asp:TextBox ID="txtAddDefQuan" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Returned Quantity" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblRetQuan" runat="server" Text=' <%#Eval("ReturnedQuantity")==DBNull.Value?0:int.Parse( Eval("ReturnedQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox ID="retQuanVal"  runat="server" Text=' <%#Eval("ReturnedQuantity")==DBNull.Value?0:int.Parse( Eval("ReturnedQuantity").ToString())  %>' Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                          <FooterTemplate>
                            <asp:TextBox ID="txtAddRetQuan" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Bonus Quantity" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblBonus" runat="server" Text=' <%#Eval("BonusQuantity")==DBNull.Value?0:int.Parse( Eval("BonusQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                             <asp:TextBox ID="txtBonus" runat="server" Text=' <%#Eval("BonusQuantity")==DBNull.Value?0:int.Parse( Eval("BonusQuantity").ToString())  %>' Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                           <FooterTemplate>
                            <asp:TextBox ID="txtAddBonus" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Cost Price" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblCP"  runat="server" Text='<%# Eval("CostPrice") %>'></asp:Label>
                        </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="retCP"  runat="server" Text=' <%#Eval("CostPrice")==DBNull.Value?0:float.Parse( Eval("CostPrice").ToString())  %>' Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                          <FooterTemplate>
                            <asp:TextBox ID="txtAddCP" runat="server"></asp:TextBox>
                        </FooterTemplate>
                         <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Sale Price" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblSP"  runat="server" Text='<%# Eval("SalePrice") %>'></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                             <asp:TextBox ID="retSP"  runat="server" Text=' <%#Eval("SalePrice")==DBNull.Value?0:float.Parse( Eval("SalePrice").ToString())  %>' Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                          <FooterTemplate>
                            <asp:TextBox ID="txtAddSP" runat="server"></asp:TextBox>
                        </FooterTemplate>
                         <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Discount Percentage" >
                        <ItemTemplate>
                            <asp:Label ID="lblDisc" Text='<%# Eval("DiscountPercentage") %>' runat="server" ></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                             <asp:TextBox ID="txtDisc" Text='<%# Eval("DiscountPercentage") %>'  runat="server" Width="60px"></asp:TextBox>
                         </EditItemTemplate>
                          <FooterTemplate>
                            <asp:TextBox ID="txtAddDisPer" runat="server"></asp:TextBox>
                        </FooterTemplate>
                         <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Expiry Date" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblExpDate" runat="server" Text='<%# Eval("ExpiryDate")==DBNull.Value?"":Convert.ToDateTime( Eval("ExpiryDate")).ToString("MMM dd ,yyyy") %>'></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                             <asp:TextBox ID="txtExpDate"  runat="server" Text='<%# Eval("ExpiryDate")==DBNull.Value?"":Convert.ToDateTime( Eval("ExpiryDate")).ToString("MMM dd ,yyyy") %>' Width="90px"></asp:TextBox>
                         </EditItemTemplate>
                          <FooterTemplate>
                            <asp:TextBox ID="txtAddExpDate" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Batch Number" HeaderStyle-Width ="60px">
                        <ItemTemplate>
                            <asp:Label ID="lblBatch" runat="server" Text='<%# Eval("BatchNumber") %>' ></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                             <asp:TextBox ID="txtBatch"  runat="server" Text='<%# Eval("BatchNumber") %>' Width="80px"></asp:TextBox>
                         </EditItemTemplate>
                          <FooterTemplate>
                            <asp:TextBox ID="txtAddBatch" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle  Width="60px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     
                   
                   
                     <%-- Hidden Fields --%>
                     
                     <asp:TemplateField HeaderText="BarCode" Visible="false" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblbarCode" runat="server" Text='<%# Eval("Barcode") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Order Detail ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblOrdDet_id" runat="server" Text='<%# Eval("orderDetailID") %>'></asp:Label>
                            </ItemTemplate>
                      </asp:TemplateField>
                     <asp:TemplateField Visible="false">
                         <ItemTemplate>
                            <asp:Label ID="lblentryID" runat="server" Text=' <%#Eval("entryID")==DBNull.Value?0:int.Parse( Eval("entryID").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                     </asp:TemplateField>
                       <asp:TemplateField HeaderText="Expiry Date" Visible="false" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblExpOrg" runat="server" Text='<%# Eval("ExpiryDate")==DBNull.Value?"":Convert.ToDateTime( Eval("ExpiryDate")).ToString("MMM dd ,yyyy") %>'></asp:Label>
                        </ItemTemplate>
                         
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Bonus Quantity Org" Visible="false" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblBonusOrg" runat="server" Text=' <%#Eval("BonusQuantity")==DBNull.Value?0:int.Parse( Eval("BonusQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                         
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField Visible="false" HeaderText="Accepted Quantity org" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblRecQuanOrg" runat="server" Text=' <%#Eval("ReceivedQuantity")==DBNull.Value?0:int.Parse( Eval("ReceivedQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                       
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                  
                     <asp:TemplateField Visible="false" HeaderText="Expired Quantity Org" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblExpQuanOrg" runat="server" Text=' <%#Eval("ExpiredQuantity")==DBNull.Value?0:int.Parse( Eval("ExpiredQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                        
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>
                     
                      <asp:TemplateField Visible="false" HeaderText="Defected Quantity Org" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblDefQuanOrg" runat="server" Text=' <%#Eval("DefectedQuantity")==DBNull.Value?0:int.Parse( Eval("DefectedQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                        
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                     <asp:TemplateField Visible="false" HeaderText="Returned Quantity Org" HeaderStyle-Width ="110px">
                        <ItemTemplate>
                            <asp:Label ID="lblRetQuanOrg" runat="server" Text=' <%#Eval("ReturnedQuantity")==DBNull.Value?0:int.Parse( Eval("ReturnedQuantity").ToString())  %>'></asp:Label>
                        </ItemTemplate>
                       
                        <ItemStyle  Width="110px" HorizontalAlign="Left"/>
                    </asp:TemplateField>

                 </Columns>
             </asp:GridView>
             <br />
            
             <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="BACK" CssClass="btn btn-large" Visible="true" />
    </div>

    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
               
            </div>
        </div>
    </div>
</asp:Content>
