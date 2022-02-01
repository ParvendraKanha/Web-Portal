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


public partial class UserManagement_UserMaster : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    UserMaster objcs = new UserMaster();
    clsDBOperations getdata = new clsDBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            //ObjGen.fillcmbOthersAll(ddlStateNm, "StateName", "StateId", "tblState", "StateName", "");
            ObjGen.fillcmbOthersAll(ddlPlantNm, "plantName", "plantId", "tblPlant", "plantName", "");
            ObjGen.fillcmbOthersAll(ddlMccNm, "mccName", "mccId", "tblMCC", "mccName", "");
            ObjGen.fillcmbOthersAll(ddlBmcNm, "cntName", "cntCode", "tblMstCenter", "cntName", "");
            //ObjGen.fillcmbOthersAll(route, "RtName", "RtCode", "tblRouteDetails", "RtName", "");
            lblmsg.Visible = false;
            //lbltxtMppCode.Visible = false;
            //lbltxtMppNm.Visible = false;

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int result;


        //SqlConnection con = new SqlConnection(dc.Con);

        try
        {


            hstparameters.Clear();

            // hstparameters.Add("DT", DateTime.Now.ToString());
            //hstparameters.Add("p_plantId", selectplant.Text);
            ////hstparameters.Add("p_MccCode", selectmcc.Text);
            //hstparameters.Add("p_CntCode", bmc.Text.Trim());
            //hstparameters.Add("p_RtCode", txtRouteCode.Text.Trim());
            //hstparameters.Add("p_RtName", txtRouteNm.Text.Trim());
            //hstparameters.Add("p_RtKMM", txtdistance.Value.Trim());


            objcs.HstParameters = hstparameters;
            result = objcs.Insert();
            if ((int)result > 0)
            {

                //txtRouteCode.Text = "";
                //txtRouteNm.Text = "";
                //txtdistance.Value = "";
                //Label1.Visible = true;
                //Label1.BackColor = System.Drawing.Color.Green;
                //Label1.Text = "Record Inserted Successfully";
            }
            else
            {
                //Label1.Visible = true;
                //Label1.BackColor = System.Drawing.Color.Red;
                //Label1.Text = "Something Went wrong";
            }

        }
        catch (Exception ex)
        {
        }




    }

    protected void Cancle_Click(object sender, EventArgs e)
    {

        Response.Redirect("Default.aspx");
    }

    protected void txtLoginId_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        
        if (txtLoginId.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblUser where UsrName='" + txtLoginId.Text+"'", System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oops!', 'User Already Exists!', 'error');", true);
            txtLoginId.Focus();
            //lbltxtRouteCode.Text = "Alreade Exists";
        }
    }





    protected void ddlPlantNm_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPlantNm.Text.Trim() != "")
        {
            ObjGen.fillcmbOthersAll(ddlMccNm, "mccName", "mccId", "tblMCC", "mccName", " where PlantId=" + ddlPlantNm.Text.Trim());
            //ObjGen.fillcmbOthersAll(ddlBmcNm, "cntName", "cntCode", "tblMstCenter", "cntName", "");
            //ObjGen.fillcmbOthersAll(District, "dstName", "dstCode", "tblDistrict", "dstName", " where StateCode=" + state.Text.Trim());
        }
    }

    protected void ddlMccNm_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMccNm.Text.Trim() != "")
        {
           
            ObjGen.fillcmbOthersAll(ddlBmcNm, "cntName", "cntCode", "tblMstCenter", "cntName", "where Mcc=" + ddlMccNm.Text.Trim());
            //ObjGen.fillcmbOthersAll(District, "dstName", "dstCode", "tblDistrict", "dstName", " where StateCode=" + state.Text.Trim());
        }
    }
}