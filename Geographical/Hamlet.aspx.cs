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

public partial class Geographical_Hamlet : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    Helmet objcs = new Helmet();
    clsDBOperations getdata = new clsDBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblmsg.Visible = false;
            lbltxtHamletCode.Visible = false;
            lbltxtHamleteNm.Visible = false;
            ObjGen.fillcmbOthersAll(state, "StateName", "StateId", "tblState", "StateName", "");


        }

    }

    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (state.Text.Trim() != "")
        {
            ObjGen.fillcmbOthersAll(district, "dstName", "dstCode", "tblDistrict", "dstName", " where StateCode=" + state.Text.Trim());
        }
    }

    protected void district_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (district.Text.Trim() != "")
        {
            ObjGen.fillcmbOthersAll(subdistrict, "SubDistrictName", "SubDistrictId", "tblSubDistrict", "SubDistrictName", " where DistrictId=" + district.Text.Trim());
        }
    }

    protected void subdistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (subdistrict.Text.Trim() != "")
        {
            if (subdistrict.Text.Trim() != "")
            {
                ObjGen.fillcmbOthersAll(Village, "VillageName", "VillageId", "tblVillage", "VillageName", " where SubDistrictId=" + subdistrict.Text.Trim());
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {
            //hstparameters.Add("p_StateCode", state.Text);
            //hstparameters.Add("p_DistrictId", district.Text);
            //hstparameters.Add("p_SubDistrictId", subdistrict.Text);
            hstparameters.Add("p_VillageId", Village.Text);
            hstparameters.Add("p_HamletId", txtHamletCode.Text);
            hstparameters.Add("p_HamletName", txtHamleteNm.Text);


            objcs.HstParameters = hstparameters;
            int result = objcs.Insert();
            if ((int)result > 0)
            {

                txtHamletCode.Text = "";
                txtHamleteNm.Text = "";

                lblmsg.Visible = true;
                lblmsg.BackColor = System.Drawing.Color.Green;
                lblmsg.Text = "Record Inserted Successfully";
            }
            else
            {
                lblmsg.Visible = true;
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




    protected void txtHamletCode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtHamletCode.Text = "";
        if (txtHamletCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblHamlet where HamletId=" + txtHamletCode.Text, System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtHamletCode.Visible = true;
            lbltxtHamletCode.Text = " Alreade Exists";
        }
    }

    //protected void village_selectedindexchanged(object sender, eventargs e)
    //{

    //    if (village.text.trim() != "")
    //    {
    //        objgen.fillcmbothersall(hamlet, "hamletname", "hamletid", "tblhamlet", "hamletname", " where hamletid=" + village.text.trim());
    //    }
    //}
}