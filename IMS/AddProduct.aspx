﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="IMS.AddProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="form-horizontal">
     <br />
             
     </div>
     <div class="form-horizontal">
     <asp:Label runat="server" AssociatedControlID="txtProduct" CssClass="col-md-2 control-label">Search Product </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtProduct" CssClass="form-control product"/>
                <asp:Button runat="server" ID="btnMasterSearch" CssClass ="btn btn-default" Text="Master Search" OnClick="btnMasterSearch_Click"/>
                <br />
            </div>
     </div>
     <br />
     <br />
     
         <br />
        <h4>Add Product</h4>
        <hr />
        

         <table cellspacing="5" cellpadding="5" border="0" width="100%" class="formTbl">
             <tr>
                 <td>
                <asp:Label runat="server" AssociatedControlID="BarCodeSerial" CssClass="control-label">BarCode Serial</asp:Label>
                 </td>
                 <td><asp:TextBox runat="server" ID="BarCodeSerial" CssClass="form-control" Enabled="false" />
                 </td>
                 <td><asp:Label runat="server" AssociatedControlID="GreenRainCode" CssClass="control-label">GreenRain Code</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="GreenRainCode" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td> <asp:Label runat="server" AssociatedControlID="ProductName" CssClass="control-label">Product Name</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="ProductName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductName" CssClass="text-danger" ErrorMessage="The product name field is required." ValidationGroup="exSave"/></td>
                <td> <asp:Label runat="server" AssociatedControlID="ProdcutDesc" CssClass=" control-label">Product Description</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="ProdcutDesc" CssClass="form-control" /></td>
             </tr>
             <tr>
             <td><asp:Label runat="server" AssociatedControlID="ProdcutBrand" CssClass=" control-label">Product Brand</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="ProdcutBrand" CssClass="form-control" /></td>
                 <td><asp:Label runat="server" AssociatedControlID="ProductType" CssClass="control-label">Product Type</asp:Label></td>
                 <td>        <asp:DropDownList runat="server" ID="ProductType" CssClass="form-control" Width="29%"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductType" CssClass="text-danger" ErrorMessage="The product type field is required." ValidationGroup="exSave"/></td>
              
             </tr>
             <tr>
                 <td><asp:Label runat="server" AssociatedControlID="ProductDept" CssClass="control-label">Product Department</asp:Label></td>
                 <td><asp:DropDownList runat="server" ID="ProductDept" CssClass="form-control" Width="29%" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ProductDept_SelectedIndexChanged"/></td>
            <td><asp:Label runat="server" AssociatedControlID="ProductCat" CssClass=" control-label">Product Category</asp:Label></td>
                 <td><asp:DropDownList runat="server" ID="ProductCat" CssClass="form-control" Width="29%" AutoPostBack="True" OnSelectedIndexChanged="ProductCat_SelectedIndexChanged" /></td>
                  </tr>
             <tr>
                 <td><asp:Label runat="server" AssociatedControlID="ProductSubCat" CssClass="control-label">Product SubCategory</asp:Label></td>
                 <td><asp:DropDownList runat="server" ID="ProductSubCat" CssClass="form-control" Width="29%"/></td>
                 <td><asp:Label runat="server" AssociatedControlID="ddlProductOrderType" CssClass=" control-label">Product Order Type</asp:Label></td>
                 <td><asp:DropDownList runat="server" ID="ddlProductOrderType" CssClass="form-control" Width="29%"/></td>
             </tr>
             <tr>
                 <td><asp:Label runat="server" AssociatedControlID="ProductCost" CssClass=" control-label">Unit Cost Price</asp:Label></td>
                 <td> <asp:TextBox runat="server" ID="ProductCost" CssClass="form-control" /></td>
                 <td><asp:Label runat="server" AssociatedControlID="ProductSale" CssClass=" control-label">Unit Sale Price</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="ProductSale" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td><asp:Label runat="server" AssociatedControlID="WholeSalePrice" CssClass=" control-label">WholeSale Price</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="WholeSalePrice" CssClass="form-control" /></td>
                 <td> <asp:Label runat="server" AssociatedControlID="ProductDiscount" CssClass=" control-label">Maximum Discount</asp:Label></td>
                 <td> <asp:TextBox runat="server" ID="ProductDiscount" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td><asp:Label runat="server" AssociatedControlID="ItemForm" CssClass="control-label">Product Form</asp:Label></td>
                 <td> <asp:TextBox runat="server" ID="ItemForm" CssClass="form-control" /></td>
                 <td><asp:Label runat="server" AssociatedControlID="ItemStrength" CssClass=" control-label">Product Strength</asp:Label></td>
                 <td> <asp:TextBox runat="server" ID="ItemStrength" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td><asp:Label runat="server" AssociatedControlID="PackType" CssClass=" control-label">Pack Type</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="PackType" CssClass="form-control" /></td>
                 <td><asp:Label runat="server" AssociatedControlID="PackSize" CssClass=" control-label">Pack Size</asp:Label></td>
                 <td>  <asp:TextBox runat="server" ID="PackSize" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td><asp:Label runat="server" AssociatedControlID="shelfNumber" CssClass=" control-label">Shelf Number</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="shelfNumber" CssClass="form-control" /></td>
                 <td><asp:Label runat="server" AssociatedControlID="rackNumber" CssClass=" control-label">Rack Number</asp:Label></td>
                 <td> <asp:TextBox runat="server" ID="rackNumber" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td> <asp:Label runat="server" AssociatedControlID="binNumber" CssClass=" control-label">Bin Number</asp:Label></td>
                 <td>   <asp:TextBox runat="server" ID="binNumber" CssClass="form-control" /></td>
                <td> <asp:Label runat="server" AssociatedControlID="bonus12" CssClass=" control-label">Bonus Quantity 12</asp:Label></td>
                 <td><asp:TextBox runat="server" ID="bonus12" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td>  <asp:Label runat="server" AssociatedControlID="bonus25" CssClass="control-label">Bonus Quantity 25</asp:Label></td>
                 <td> <asp:TextBox runat="server" ID="bonus25" CssClass="form-control" /></td>
                 <td><asp:Label runat="server" AssociatedControlID="bonus50" CssClass="control-label">Bonus Quantity 50</asp:Label></td>
                 <td> <asp:TextBox runat="server" ID="bonus50" CssClass="form-control" /></td>
             </tr>
             <tr>
                 <td></td>
                 <td colspan="100%"><asp:Button ID="btnCreateProduct" runat="server" OnClick="btnCreateProduct_Click"  Text="ADD" CssClass="btn btn-default" ValidationGroup="exSave"/>
                 <asp:Button ID="btnCancelProduct" runat="server" OnClick="btnCancelProduct_Click" Text="CANCEL" CssClass="btn btn-default" />
                 <asp:Button ID="btnGoBack" runat="server" CssClass="btn btn-primary btn-large" Text="Go Back" OnClick="btnGoBack_Click"/></td>
             </tr>
                </table>
</asp:Content>
