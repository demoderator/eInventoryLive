﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Globalization;
using IMSCommon.Util;

namespace IMS
{
    public partial class AddStock : System.Web.UI.Page
    {
        public static SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["IMSConnectionString"].ToString());
        public static DataSet ProductSet;
        public static DataTable ProductTable;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductSet = new DataSet();
                ProductTable = new DataTable();

                #region Populating Product List
                try
                {
                    connection.Open();
                    /*SqlCommand command = new SqlCommand("Select ProductID, Product_Name From tbl_ProductMaster Where tbl_ProductMaster.Product_Id_Org LIKE '444%' AND Status = 1", connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter sA = new SqlDataAdapter(command);
                    sA.Fill(ds);
                    ProductSet = ds;
                    if (SelectProduct != null)
                    {
                    }*/
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    connection.Close();
                }
                #endregion

                #region Populating System Types
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("Select * From tbl_System", connection); // needs to be completed
                    DataSet ds = new DataSet();
                    SqlDataAdapter sA = new SqlDataAdapter(command);
                    sA.Fill(ds);
                    StockAt.DataSource = ds.Tables[0];
                    StockAt.DataTextField = "SystemName";
                    StockAt.DataValueField = "SystemID";
                    StockAt.DataBind();
                    if (StockAt != null)
                    {
                        StockAt.Items.Insert(0, "Select System");
                        StockAt.SelectedIndex = 0;
                    }
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    connection.Close();
                }
                #endregion
            }

            //if( Session["SelectProduct"].Equals(null))
            //{
            //}
        }

        protected void btnCreateProduct_Click(object sender, EventArgs e)
        {
            if (StockAt.SelectedIndex > 0 && ProductList.SelectedIndex > 0)
            {
                #region BarCode Generation

                DateTime dateValue = (Convert.ToDateTime(DateTextBox.Text.ToString()));

                string p1;
                long BarCode = 0;
                String mm ;//= dateValue.Month.ToString();
                if (dateValue.Month < 10)
                {
                    mm = dateValue.Month.ToString().PadLeft(2, '0');

                }
                else
                {
                    mm = dateValue.Month.ToString();
                }
                String yy = dateValue.ToString("yy", DateTimeFormatInfo.InvariantInfo);
                p1 = BarCodeSerial.Text + mm + yy;

                if (long.TryParse(p1, out BarCode))
                {
                }
                else
                {
                    //post error message 
                }


                #endregion

                #region Adding Stock
                int x = 0;
                String errorMessage = "";
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("sp_AddStock", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@p_ProductID", Int32.Parse(ProductList.SelectedValue.ToString()));
                    command.Parameters.AddWithValue("@p_Quantity", Decimal.Parse(Quantity.Text.ToString()));
                    command.Parameters.AddWithValue("@p_Status", "1");
                    command.Parameters.AddWithValue("@p_UserRoleID", Int32.Parse(StockAt.SelectedValue.ToString()));
                    command.Parameters.AddWithValue("@p_BarCode", BarCode);
                    command.Parameters.AddWithValue("@p_Expiry", DateTextBox.Text); // Calender Date or DateTime Picker Date
                    command.Parameters.AddWithValue("@p_Cost", Math.Round(float.Parse(ProductCost.Text.ToString()),2));
                    command.Parameters.AddWithValue("@p_Sales", Math.Round(float.Parse(ProductSale.Text.ToString()), 2));
                    x = command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    errorMessage = ex.Message;
                }
                finally
                {
                    connection.Close();
                }

                if (x == 1)
                {
                    WebMessageBoxUtil.Show("Record Inserted Successfully");
                    SelectProduct.Text = "";
                    Quantity.Text = "";
                    ProductName.Text = "";
                    DateTextBox.Text = "";
                    BarCodeSerial.Text = "";
                    ProductCost.Text = "";
                    ProductSale.Text = "";
                }
                else
                {
                    WebMessageBoxUtil.Show(errorMessage);
                }
                #endregion
            }
            else
            {
                WebMessageBoxUtil.Show("Please provide a System and the Product Name from the dropdowns");
            }
        }

        protected void btnDeleteProduct_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelProduct_Click(object sender, EventArgs e)
        {
            SelectProduct.Text = "";
            ProductList.SelectedIndex = 0;
            BarCodeSerial.Text = string.Empty;
            ProductName.Text = string.Empty;
            Quantity.Text = string.Empty;
            DateTextBox.Text = string.Empty;
            //StockAt.Items.Clear();
            StockAt.Enabled = true;
            ProductCost.Text = string.Empty;
            ProductSale.Text = string.Empty;
            btnCreateProduct.Enabled = false;
        }

        protected void SelectProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();

            #region Getting Product Details
            try
            {
                DataView dv = new DataView();
                dv = ProductSet.Tables[0].DefaultView;
                dv.RowFilter = "ProductID = '" + SelectProduct.Text.ToString() + "'";
                dt = dv.ToTable();

                BarCodeSerial.Text = dt.Rows[0]["Product_Id_Org"].ToString();
                ProductName.Text = dt.Rows[0]["Product_Name"].ToString();
                ProductCost.Text = dt.Rows[0]["UnitCost"].ToString();
                ProductSale.Text = dt.Rows[0]["SP"].ToString();
                btnCreateProduct.Enabled = true;
            }
            catch (Exception ex)
            {
            }
            finally
            {
                connection.Close();
            }
            #endregion
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageStocks.aspx", false);
        }

        protected void StockAt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(StockAt.SelectedIndex!=-1)
            {
                StockAt.Enabled = false;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        public void PopulateSearchProductText()
        {
            SelectProduct.Text = "";
            SelectProduct.Text = Session["SelectProduct"].ToString();
        }
        
        protected void btnDirectSearch_Click(object sender, EventArgs e)
        {

        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();

           
                #region Getting Product Details
                try
                {
                    DataView dv = new DataView();
                    dv = ProductSet.Tables[0].DefaultView;
                    dv.RowFilter = "ProductID = '" + ProductList.SelectedValue.ToString() + "'";
                    dt = dv.ToTable();

                    BarCodeSerial.Text = dt.Rows[0]["Product_Id_Org"].ToString();
                    ProductName.Text = dt.Rows[0]["Product_Name"].ToString();
                    ProductCost.Text = dt.Rows[0]["UnitCost"].ToString();
                    ProductSale.Text = dt.Rows[0]["SP"].ToString();
                    btnCreateProduct.Enabled = true;
                }
                catch (Exception ex)
                {
                }
                finally
                {
                    connection.Close();
                }
                #endregion
           
        }

        protected void btnSearchProduct_Click(object sender, ImageClickEventArgs e)
        {
            if (SelectProduct.Text.Length >= 3)
            {
                PopulateDropDown(SelectProduct.Text);
                ProductList.Visible = true;
            }
        }

        public void PopulateDropDown(String Text)
        {
            #region Populating Product Name Dropdown

            try
            {
                connection.Open();

                Text = Text + "%";
                SqlCommand command = new SqlCommand("SELECT * From tbl_ProductMaster Where tbl_ProductMaster.Product_Name LIKE '" + Text + "' AND Status = 1", connection);
                DataSet ds = new DataSet();
                SqlDataAdapter sA = new SqlDataAdapter(command);
                sA.Fill(ds);
                if (ProductList.DataSource != null)
                {
                    ProductList.DataSource = null;
                }

                ProductSet = null;
                ProductSet = ds;
                //ds.Tables[0].Columns.Add("ProductInfo", typeof(string), "Product_Name+ ' '+itemStrength+' '+itemPackSize+' '+itemForm");
                ProductList.DataSource = ds.Tables[0];
                ProductList.DataTextField = "Description";
                ProductList.DataValueField = "ProductID";
                ProductList.DataBind();
                if (ProductList != null)
                {
                    ProductList.Items.Insert(0, "Select Product");
                    ProductList.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            #endregion
        }

    }
}