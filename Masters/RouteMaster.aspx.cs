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


public partial class Masters_RouteMaster : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    RouteMaster objcs = new RouteMaster();
    clsDBOperations getdata = new clsDBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbltxtRouteCode.Visible = false;
            lbltxtRouteNm.Visible = false;
            Label1.Visible = false;

            ObjGen.fillcmbOthersAll(selectplant, "plantName", "plantId", "tblPlant", "plantName", "");
            
            ObjGen.fillcmbOthersAll(selectmcc, "mccName", "mccId", "tblMCC", "mccName", "");
            ObjGen.fillcmbOthersAll(bmc, "cntName", "cntCode", "tblMstCenter", "cntName", "");
            //ObjGen.slist(tblPlant, "plantName", "plantId", "tblPlant", "plantName");
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
            //hstparameters.Add("p_MccCode", selectmcc.Text);
            hstparameters.Add("p_CntCode", bmc.Text.Trim());
            hstparameters.Add("p_RtCode",txtRouteCode.Text.Trim());
            hstparameters.Add("p_RtName", txtRouteNm.Text.Trim());
            hstparameters.Add("p_RtKMM", txtdistance.Value.Trim());
          

            objcs.HstParameters = hstparameters;
            result = objcs.Insert();
            if ((int)result > 0)
            {
                
                txtRouteCode.Text = "";
                txtRouteNm.Text = "";
                txtdistance.Value = "";
                Label1.Visible = true;
                Label1.BackColor = System.Drawing.Color.Green;
                Label1.Text = "Record Inserted Successfully";
            }
            else
            {
                Label1.Visible = true;
                Label1.BackColor = System.Drawing.Color.Red;
                Label1.Text = "Something Went wrong";
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

    protected void txtRouteCode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtRouteCode.Text = "";
        if (txtRouteCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblRouteDetails where RtCode=" + txtRouteCode.Text, System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtRouteCode.Text = "Alreade Exists";
        }
    }

    protected void txtRouteNm_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtRouteNm.Text = "";
        if (lbltxtRouteNm.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblRouteDetails where RtName=" + lbltxtRouteNm.Text, System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtRouteNm.Text =  "Alreade Exists";
        }
    }
}