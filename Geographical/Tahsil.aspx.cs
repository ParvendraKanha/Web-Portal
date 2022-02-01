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
public partial class Geographical_Tahsil : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    Tahsil objcs = new Tahsil();
    clsDBOperations getdata = new clsDBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;

            ObjGen.fillcmbOthersAll(state, "StateName", "StateId", "tblState", "StateName", "");


        }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
       
        try
        {
            hstparameters.Add("p_StateCode", state.Text);
            hstparameters.Add("p_DistrictId", dstrict.Text);
            hstparameters.Add("p_SubDistrictId", txtTahsilCode.Text);
            hstparameters.Add("p_SubDistrictName", txtTahsilNm.Text);

            objcs.HstParameters = hstparameters;
            int result = objcs.Insert();
            if ((int)result > 0)
            {
                txtTahsilCode.Text = "";
                txtTahsilNm.Text = "";
                Label1.Visible = true;

                Label1.BackColor = System.Drawing.Color.Green;
                Label1.Text = "Record Inserted Successfully";
            }
            else
            {
                Label1.Visible = true;
                Label1.BackColor = System.Drawing.Color.Green;
                Label1.Text = "Something Went Wrong";
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }





    }



    protected void Cancel_Click(object sender, EventArgs e)
    {

        Response.Redirect("Default.aspx");
    }

    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (state.Text.Trim()!="")
        { 
        ObjGen.fillcmbOthersAll(dstrict, "dstName", "dstCode", "tblDistrict", "dstName", " where StateCode=" +state.Text.Trim());
        }
    }

    protected void txtTahsilCode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        Label3.Text = "";

        if (txtTahsilCode.Text!="")
        { 
        result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblSubDistrict where SubDistrictId=" + txtTahsilCode.Text, System.Data.CommandType.Text, hstparameters));
            }
        if (result != 0)
        {
            Label3.Visible = true;
            Label3.Text = "State Code Alreade Exists";
        }
    }

    protected void txtTahsilNm_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        Label1.Text = "";
        if(txtTahsilNm.Text!="")
        { 
         result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblSubDistrict where SubDistrictName='" + txtTahsilNm.Text+"'", System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            Label1.Visible = true;
            Label1.Text = "State Code Alreade Exists";
        }
        
       
    }
}