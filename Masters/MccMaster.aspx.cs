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

public partial class Masters_MccMaster : System.Web.UI.Page
{
            clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    MccMaster objcs = new MccMaster();
    clsDBOperations getdata = new clsDBOperations();




    protected void Page_Load(object sender, EventArgs e)
    { if (!IsPostBack)
        {
            lbltxtMccCode.Visible = false;
            lbltxtMccNm.Visible = false;
            //Label1.Visible = false;
            lblothercode.Visible = false;


            ObjGen.fillcmbOthersAll(tblPlant, "plantName", "plantId", "tblPlant", "plantName", "");
            //ObjGen.slist(tblPlant, "plantName", "plantId", "tblPlant", "plantName");
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

            // hstparameters.Add("DT", DateTime.Now.ToString());
            hstparameters.Add("Plant_Id", tblPlant.Text);
            hstparameters.Add("MCC_Code", txtMccCode.Text);
            hstparameters.Add("MCC_Name", txtMccNm.Text);
            hstparameters.Add("Other_Code", txtOthrcode.Text);
            hstparameters.Add("Address_Line1", txtAddress.Value);
            hstparameters.Add("City", txtCity.Value);
            hstparameters.Add("Company_Code", "4");
            hstparameters.Add("Action", "Insert_MCC");
            SqlDataReader reader = (SqlDataReader)getdata.GetDataReader("RMRD_Master_MCC", System.Data.CommandType.StoredProcedure, hstparameters);
           
            while (reader.Read())
            {
                lblmsg.Visible = true;
                lblmsg.BackColor = System.Drawing.Color.Green;
                lblmsg.Text = reader.GetFieldValue<string>(0);

            }

            reader.Close();

            //objcs.HstParameters = hstparameters;
            //result = objcs.Insert();
            //if ((int)result > 0)
            //{


            //    txtMccCode.Text = "";
            //    txtMccNm.Text = "";
            //    txtAddress.Value = "";
            //    txtCity.Value = "";
            //    //Label1.Visible = true;
            //    //Label1.BackColor = System.Drawing.Color.Green;
            //    //Label1.Text = "Record Inserted Successfully";
            //}
            //else
            //{
            //    //Label1.Visible = true;
            //    //Label1.BackColor = System.Drawing.Color.Red;
            //    //Label1.Text = "Something Went wrong";
            //}

        }
        catch (Exception ex)
        {
        }


    }





    protected void txtMccCode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtMccCode.Text = "";
        if (txtMccCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblMCC where mccCode=" + txtMccCode.Text , System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtMccCode.Visible = true;
            lbltxtMccCode.Text = " Alreade Exists";
        }
    }

    protected void txtMccNm_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtMccNm.Text = "";
        if (txtMccNm.Text != "")
        {
            if (txtMccNm.Text != "")
                result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblMCC where mccName='" + txtMccCode.Text + "'", System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtMccNm.Visible = true;
            lbltxtMccNm.Text = " Alreade Exists";
        }
    } 
protected void Cancle_Click(object sender, EventArgs e)
{

    Response.Redirect("Default.aspx");
}

    protected void txtOthrcode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lblothercode.Text = "";
        if (txtMccNm.Text != "")
        {
            if (txtMccNm.Text != "")
                result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblMCC where otherCode=" + txtOthrcode.Text , System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lblothercode.Visible = true;
            lblothercode.Text = " Alreade Exists";
        }
    }
}
