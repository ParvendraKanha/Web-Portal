using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.Common;
using System.IO;
using System.Collections;
using System.Data.OleDb;
using System.Data.SqlClient;
using Newtonsoft.Json;


public partial class Geographical_District : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    District objcs = new District();
    clsDBOperations getdata = new clsDBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {
            Label1.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;

            ObjGen.fillcmbOthersAll(state, "StateName", "StateId", "tblState", "StateName", "");

                
            }
        
    }






    protected void Button1_Click(object sender, EventArgs e)
    {
        int result;
        hstparameters.Clear();

        //SqlConnection con = new SqlConnection(dc.Con);

        try
        {


            hstparameters.Clear();

            hstparameters.Add("p_StateCode", state.Text);
            hstparameters.Add("p_dstCode", txtDistrictCode.Text);
            hstparameters.Add("p_dstName", txtDistrictNm.Text);



            objcs.HstParameters = hstparameters;
            result = objcs.Insert();
            if ((int)result > 0)
            {
                txtDistrictCode.Text = "";
                txtDistrictNm.Text = "";

                Label1.Visible = true;
                Label1.BackColor = System.Drawing.Color.Green;
                Label1.Text = "Record Inserted Successfully";
            }
            else
            {
                Label1.Visible = true;
                Label1.BackColor = System.Drawing.Color.Green;
                Label1.Text = "Something went wrong";
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }





    }




    protected void txtDistrictCode_TextChanged(object sender, EventArgs e)
    {
        int result=0;
        Label3.Text = "";
        if(txtDistrictCode.Text!="")
        { 
        result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblDistrict where dstCode=" + txtDistrictCode.Text, System.Data.CommandType.Text, hstparameters));
        }

        if (result != 0)
        {
            Label3.Visible = true;
            Label3.Text = "State Code Alreade Exists";
        }
    }

    protected void txtDistrictNm_TextChanged(object sender, EventArgs e)
    {
        int result=0;
        Label4.Text = "";
        if (txtDistrictNm.Text!="")
        { 
        result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblDistrict where dstName='" + txtDistrictNm.Text+"'", System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            Label4.Visible = true;
            Label4.Text = "State Code Alreade Exists";
        }
        }


    protected void Cancel_Click(object sender, EventArgs e)
    {

        Response.Redirect("Default.aspx");
    }
}








