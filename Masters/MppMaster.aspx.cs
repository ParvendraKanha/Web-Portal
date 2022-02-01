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
public partial class Masters_MppMaster : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    MppMaster objcs = new MppMaster();
    clsDBOperations getdata = new clsDBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ObjGen.fillcmbOthersAll(state, "StateName", "StateId", "tblState", "StateName", "");
            ObjGen.fillcmbOthersAll(plant, "plantName", "plantId", "tblPlant", "plantName", "");

        ObjGen.fillcmbOthersAll(mcc, "mccName", "mccId", "tblMCC", "mccName", "");
        ObjGen.fillcmbOthersAll(bmc, "cntName", "cntCode", "tblMstCenter", "cntName", "");
            ObjGen.fillcmbOthersAll(route, "RtName", "RtCode", "tblRouteDetails", "RtName", "");
            lblmsg.Visible = false;
            lbltxtMppCode.Visible = false;
            lbltxtMppNm.Visible = false;
               
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {
            //hstparameters.Add("p_StateId", plant.Text);
            //hstparameters.Add("p_dstCode", mcc.Text);
            hstparameters.Add("p_CntCode", bmc.Text);
            hstparameters.Add("p_rtCode", route.Text);
            //hstparameters.Add("p_HamletId", txtAddress.Value);
            //hstparameters.Add("p_HamletName", txtcity.Value);
            hstparameters.Add("p_mobileno", txtmobileNo.Value);
            hstparameters.Add("p_CDate", txtdate.Value );
            hstparameters.Add("p_StateId", state.Text);
            hstparameters.Add("p_dstCode", District.Text);
            hstparameters.Add("p_SubDistrictId", Subdistrict.Text);
            hstparameters.Add("p_VillageId", Village.Text);
            hstparameters.Add("p_HamletId", Hamlet.Text);
            hstparameters.Add("p_SocCode", txtMppCode.Text);
            hstparameters.Add("p_socName", txtMppNm.Text);
            if (isactive.Checked)
                { 
            hstparameters.Add("p_IsLive", "1");
            }
            else
            {
                hstparameters.Add("p_IsLive", "0");
            }


            objcs.HstParameters = hstparameters;
            int result = objcs.Insert();
            if ((int)result > 0)
            {

                txtAddress.Value = "";
                txtcity.Value = "";
                txtmobileNo.Value = "";
                txtdate.Value = "dd-MM-yyyy";
                txtMppCode.Text = "";
                txtMppNm.Text = "";
                isactive.Checked =false;
                lblmsg.Visible = true;
                lblmsg.BackColor = System.Drawing.Color.Green;
                lblmsg.Text = "Record Inserted Successfully";
            }
            else
            {
                isactive.Checked = false;
                lblmsg.BackColor = System.Drawing.Color.LightGreen;
                lblmsg.Text = "Something Went Wrong";
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
        if (state.Text.Trim() != "")
        {
            ObjGen.fillcmbOthersAll(District, "dstName", "dstCode", "tblDistrict", "dstName", " where StateCode=" + state.Text.Trim());
        }
    }

    protected void District_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (District.Text.Trim() != "")
        {
            ObjGen.fillcmbOthersAll(Subdistrict, "SubDistrictName", "SubDistrictId", "tblSubDistrict", "SubDistrictName", " where DistrictId=" + District.Text.Trim());
        }
    }

    protected void Subdistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Subdistrict.Text.Trim() != "")
        {
            ObjGen.fillcmbOthersAll(Village, "VillageName", "VillageId", "tblVillage", "VillageName", " where SubDistrictId=" + Subdistrict.Text.Trim());
        }
    }

    

    protected void Hamlet_SelectedIndexChanged(object sender, EventArgs e)
    {
        

    }

    protected void Village_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Village.Text.Trim() != "")
        {
            ObjGen.fillcmbOthersAll(Hamlet, "HamletName", "HamletId", "tblHamlet", "HamletName", " where VillageId=" + Village.Text.Trim());
        }
    }

    protected void Hamlet_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}