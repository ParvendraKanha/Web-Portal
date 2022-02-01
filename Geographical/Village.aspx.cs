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

public partial class Geographical_Village : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    Village objcs = new Village();
    clsDBOperations getdata = new clsDBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblmsg.Visible = false;
            lbltxtVillageCode.Visible = false;
            lbltxtVillageNm.Visible = false;
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
    protected void txtVillageCode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtVillageCode.Text = "";

        if (txtVillageCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblVillage where VillageId=" + txtVillageCode.Text , System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtVillageCode.Visible = true;
            lbltxtVillageCode.Text = "State Code Alreade Exists";
        }
    }

    protected void txtVillageNm_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtVillageNm.Text = "";

        if (txtVillageCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblVillage where VillageName='" + txtVillageNm.Text + "'" + " and StateCode = " + state.Text + " and DistrictId = " + district.Text + " and SubDistrictId = " + subdistrict.Text, System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtVillageNm.Visible = true;
            lbltxtVillageNm.Text = "State Code Alreade Exists";
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {
        
           


            hstparameters.Add("p_StateCode", state.Text);
            hstparameters.Add("p_DistrictId", district.Text);
            hstparameters.Add("p_SubDistrictId", subdistrict.Text);
            hstparameters.Add("p_VillageId", txtVillageCode.Text);
            hstparameters.Add("p_VillageName", txtVillageNm.Text);


            objcs.HstParameters = hstparameters;
            int result = objcs.Insert();
            if ((int)result > 0)
            {
                
                txtVillageCode.Text = "";
                txtVillageNm.Text = "";

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

}
