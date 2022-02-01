using System;
using System.Data.Common;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Drawing;
using Newtonsoft.Json;

public class clsGenral
{
    #region Private Variables...

    //Hashtable hstParameters;

    #endregion

    #region Constuctor
    public clsGenral()
    {

    }
    #endregion Constuctor



    //public void fillDDList(DropDownList objddl, string sConField)
    //{
    //    try
    //    {
    //        DbDataReader dr;
    //        objDbOperation = new clsDBOperations();
    //        objddl.Items.Clear();
    //        hstParameters.Clear();
    //        hstParameters.Add("compid", Convert.ToInt64(HttpContext.Current.Session["CompId"]));
    //        hstParameters.Add("type", sConField);
    //        hstParameters.Add("Action", "Select_ListFill");

    //        dr = objDbOperation.GetDataReader("Cls_Gen_ListFill", CommandType.StoredProcedure, hstParameters);
    //        objddl.DataSource = dr;
    //        objddl.DataTextField = "vlstName";
    //        objddl.DataValueField = "did";
    //        objddl.DataBind();
    //        objddl.Items.Insert(0, new ListItem("Select One", "0"));
    //        if (dr.IsClosed == false)
    //        {
    //            dr.Close();
    //            dr.Dispose();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw new Exception(ex.Message);
    //    }
    //    finally
    //    {
    //        objDbOperation.DbConnectionClose();

    //    }
    //}

    //public void fillDDList1(DropDownList objddl, string sConField, string ActionName)
    //{
    //    try
    //    {
    //        DbDataReader dr;
    //        objddl.Items.Clear();

    //        hstParameters.Clear();
    //        hstParameters.Add("dcompid", Convert.ToInt64(HttpContext.Current.Session["gblCompanyId"]));
    //        hstParameters.Add("vtype", sConField);
    //        hstParameters.Add("Action", ActionName);

    //        dr = objDbOperation.GetDataReader("Cls_Gen_ListFill", CommandType.StoredProcedure, hstParameters);
    //        objddl.DataSource = dr;
    //        objddl.DataTextField = "vlstName";
    //        objddl.DataValueField = "did";
    //        objddl.DataBind();
    //        objddl.Items.Insert(0, new ListItem("Select One", "0"));
    //        if (dr.IsClosed == false)
    //        {
    //            dr.Close();
    //            dr.Dispose();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw new Exception(ex.Message);
    //    }
    //    finally
    //    {
    //        objDbOperation.DbConnectionClose();
    //    }
    //}
    clsDBOperations objDbOperation = new clsDBOperations();
    public void fillcmbOthers(DropDownList objddl, string sFieldText, string sFieldValue, string sTable, string sOrder)
    {
        clsDBOperations objDbOperation = new clsDBOperations();
        try
        {
            DbDataReader dr;
            string query;
            objddl.Items.Clear();

            query = "select " + sFieldText + "," + sFieldValue + "  from " + sTable + " order by " + sOrder;
            dr = objDbOperation.GetDataReader(query, CommandType.Text);
            objddl.Items.Clear();
            objddl.DataSource = dr;
            objddl.DataTextField = sFieldText;
            objddl.DataValueField = sFieldValue;
            objddl.DataBind();
            objddl.Items.Insert(0, new ListItem("Select One", "0"));
            if (dr.IsClosed == false)
            {
                dr.Close();
                dr.Dispose();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            objDbOperation.DbConnectionClose();
        }

    }

    public void fillcmbOthersAll(DropDownList objddl, string sFieldText, string sFieldValue, string sTable, string sOrder,string swhere)
    {
        clsDBOperations objDbOperation = new clsDBOperations();
        try
        {
            DbDataReader dr;
            string query;
            objddl.Items.Clear();
         
            query = "select " + sFieldText + "," + sFieldValue + "  from " + sTable  + swhere + " order by " + sOrder ;
            dr = objDbOperation.GetDataReader(query, CommandType.Text);
            objddl.Items.Clear();
            objddl.DataSource = dr;
            objddl.DataTextField = sFieldText;
            objddl.DataValueField = sFieldValue;
            objddl.DataBind();
            objddl.Items.Insert(0, new ListItem("All", "0"));
            if (dr.IsClosed == false)
            {
                dr.Close();
                dr.Dispose();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            objDbOperation.DbConnectionClose();
        }

    }

    public string slist(  HtmlSelect tblpalnt,string sFieldText, string sFieldValue, string sTable, string sOrder)
    {
        string opt="";
        clsDBOperations objDbOperation = new clsDBOperations();
        try
        {
            DbDataReader dr;
            string query;
            

            query = "select " + sFieldText + "," + sFieldValue + "  from " + sTable + " order by " + sOrder;
            dr = objDbOperation.GetDataReader(query, CommandType.Text);
            while (dr.Read())
            {
                //opt+="<option value="+ dr[sFieldText].ToString() +">"+ dr[sFieldValue].ToString() +"</option>";
                tblpalnt.Items.Add(dr[sFieldText].ToString());
                
               

               
            }
            if (dr.IsClosed == false)
            {
                dr.Close();
                dr.Dispose();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            objDbOperation.DbConnectionClose();
        }
        return opt;

    }



    public DataTable tbls(  HtmlSelect tblpalnt,string sFieldText, string sFieldValue, string sTable, string sOrder)
    {
        string opt="";
        clsDBOperations objDbOperation = new clsDBOperations();
        try
        {
            DbDataReader dr;
            DataSet dst = new DataSet();
            string query;
            DataTable dt = new DataTable();


            query = "select " + sFieldText + "," + sFieldValue + "  from " + sTable + " order by " + sOrder;
           
            dst=objDbOperation.GetDataset(query, CommandType.Text);
           
            //dst = objDbOperation.GetDataReader(query, CommandType.Text);
            dt = dst.Tables[0];


            return dt;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            objDbOperation.DbConnectionClose();
        }

        
    }







    public void fillListBox(DropDownList ddl, string sTable, string sFieldText, string sFieldValue, string sOrder, string sCondition)
    {
        try
        {
            DbDataReader dr;
            dr = objDbOperation.GetDataReader("select distinct(" + sFieldText + ")," + sFieldValue + "  from " + sTable + "  where " + sCondition + " order by " + sOrder, CommandType.Text);
            ddl.DataTextField = sFieldText;
            ddl.DataValueField = sFieldValue;
            ddl.DataSource = dr;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select One", "0"));
            if (dr.IsClosed == false)
            {
                dr.Close();
                dr.Dispose();

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            objDbOperation.DbConnectionClose();
        }
    }





    public void fillCheckBox(CheckBoxList chk, string sTable, string sFieldText, string sFieldValue, string sOrder, string sCondition)
    {
        try
        {
            DbDataReader dr;
            dr = objDbOperation.GetDataReader("select distinct(" + sFieldText + ")," + sFieldValue + "  from " + sTable + "  where " + sCondition + " order by " + sOrder, CommandType.Text);
            chk.DataTextField = sFieldText;
            chk.DataValueField = sFieldValue;
            chk.DataSource = dr;
            chk.DataBind();
            if (dr.IsClosed == false)
            {
                dr.Close();
                dr.Dispose();

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            objDbOperation.DbConnectionClose();
        }
    }





}