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

public partial class Masters_PlantMaster : System.Web.UI.Page

{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    PlantMaster objcs = new PlantMaster();
    clsDBOperations getdata = new clsDBOperations();
    private object MessageBox;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblmsg.Visible = false;
            lbltxtPlantCode.Visible = false;
            lbltxtPlantNm.Visible = false;
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
            hstparameters.Add("Plant_Code", txtPlantCode.Text);
            hstparameters.Add("Plant_Name", txtPlantNm.Text);
            hstparameters.Add("Address_Line1", txtPlantAddress.Value);
            hstparameters.Add("City", txtCity.Value);
            hstparameters.Add("Other_Code", txtothercode.Text);
            hstparameters.Add("Action", "Insert_Plant");
            SqlDataReader reader = (SqlDataReader)getdata.GetDataReader("RMRD_Master_Plant", System.Data.CommandType.StoredProcedure, hstparameters);
            while (reader.Read())
            {
                lblmsg.Visible = true;
                lblmsg.BackColor = System.Drawing.Color.Green;
                lblmsg.Text = reader.GetFieldValue<string>(0);

            }

            reader.Close();

        //    objcs.HstParameters = hstparameters;

            //    result = objcs.Insert();
            //    if ((int)result > 0)
            //    {

            //        txtPlantCode.Text = "";
            //        txtPlantNm.Text = "";
            //        txtCity.Value = "";
            //        txtPlantAddress.Value = "";
            //        lblmsg.Visible = true;
            //        lblmsg.BackColor = System.Drawing.Color.Green;
            //        lblmsg.Text = "Record Inserted Successfully";
            //    }
            //    else
            //    {
            //        lblmsg.Visible = true;
            //        lblmsg.BackColor = System.Drawing.Color.Red;
            //        lblmsg.Text = "Something Went wrong";
            //    }

            }
        catch (Exception ex)
        {
        }








    }

    protected void txtPlantCode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtPlantCode.Text = "";
        if (txtPlantCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblPlant where plantCode=" + txtPlantCode.Text, System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtPlantCode.Visible = true;
            lbltxtPlantCode.Text = " Alreade Exists";
        }
    }

    protected void txtPlantNm_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtPlantNm.Text = "";
        if (txtPlantCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblPlant where PlantName='" + txtPlantNm.Text+"'", System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtPlantNm.Visible = true;
            lbltxtPlantNm.Text = " Alreade Exists";
        }
    }

    protected void Cancle_Click(object sender, EventArgs e)
    {

        Response.Redirect("Default.aspx");
    }
}



