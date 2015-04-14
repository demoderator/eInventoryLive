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


namespace IMS
{
    public partial class ViewPackingList : System.Web.UI.Page
    {
        public static SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["IMSConnectionString"].ToString());
        public static DataSet ProductSet;
        public static DataSet systemSet;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadData(Session["RequestedNO"].ToString());
                #region RequestTo&FROM Population
                DataSet dsTo = GetSystems(Convert.ToInt32(Session["RequestedFromID"].ToString()));
                DataSet dsFROM = GetSystems(Convert.ToInt32(Session["UserSys"].ToString()));
                SendDate.Text = "Send Date : " + System.DateTime.Now.ToShortDateString();
                From.Text = dsFROM.Tables[0].Rows[0]["SystemName"].ToString();
                FromAddress.Text = dsFROM.Tables[0].Rows[0]["SystemAddress"].ToString();
                To.Text = dsTo.Tables[0].Rows[0]["SystemName"].ToString();
                ToAddress.Text = dsTo.Tables[0].Rows[0]["SystemAddress"].ToString();
                #endregion
            }
        }

        public DataSet GetSystems(int ID)
        {
            DataSet ds = new DataSet();
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("Sp_GetSystem_ByID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@p_SystemID", ID);

                

                SqlDataAdapter sA = new SqlDataAdapter(command);
                sA.Fill(ds);
                ProductSet = ds;
                
            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return ds;
        }
        public void LoadData(String OrderID)
        {
            #region Display Requests
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("sp_GetGenOrderDetails_OrdID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@p_OrderID", OrderID);

                DataSet ds = new DataSet();

                SqlDataAdapter sA = new SqlDataAdapter(command);
                sA.Fill(ds);
                ProductSet = ds;
                StockDisplayGrid.DataSource = null;
                StockDisplayGrid.DataSource = ds.Tables[0];
                StockDisplayGrid.DataBind();
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
        protected void StockDisplayGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void StockDisplayGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void StockDisplayGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void StockDisplayGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void StockDisplayGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void StockDisplayGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Retrieve the underlying data item. In this example
                // the underlying data item is a DataRowView object.
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                
               // e.Row.Cells["OrderDetailID"].Text
                // Retrieve the key value for the current row. Here it is an int.
             //   int myDataKey = rowView["OrderDetailID"];

                Label OrderDetailID = (Label)e.Row.FindControl("OrderDetailID");
                GridView Details = (GridView)e.Row.FindControl("StockDetailDisplayGrid");

                #region Display Requests
                try
                {
                    if(connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
                    connection.Open();
                    SqlCommand command = new SqlCommand("sp_GetpackingList", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@p_OrderDetID", Convert.ToInt32(OrderDetailID.Text));

                    DataSet ds = new DataSet();

                    SqlDataAdapter sA = new SqlDataAdapter(command);
                    sA.Fill(ds);
                    ProductSet = ds;
                    Details.DataSource = null;
                    Details.DataSource = ds.Tables[0];
                    Details.DataBind();
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    connection.Close();
                }
            }
            #endregion
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("PackingListGeneration.aspx");
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
    }
}