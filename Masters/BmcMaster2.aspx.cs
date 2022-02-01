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

public partial class Masters_BmcMaster2 : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    BmcMaster2 objcs = new BmcMaster2();
    clsDBOperations getdata = new clsDBOperations();
    private object MessageBox;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            {
            lbltxtBmcCode.Visible = false;
            lbltxtBmcNm.Visible = false;

            ObjGen.fillcmbOthersAll(tblPlant, "plantName", "plantId", "tblPlant", "plantName", "");
            ObjGen.fillcmbOthersAll(tblMcc, "mccName", "mccId", "tblMCC", "mccName", "");
            //ObjGen.slist(tblPlant, "plantName", "plantId", "tblPlant", "plantName");
        }

        
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        //int result;
        //string result1;
        hstparameters.Clear();

        //SqlConnection con = new SqlConnection(dc.Con);

        try
        {


            hstparameters.Clear();

           
            //hstparameters.Add("p_plantId", tblPlant.Text);
            //hstparameters.Add("p_MccCode", tblMcc.Text);
            //hstparameters.Add("p_cntCode", txtBmcCode.Text);
            //hstparameters.Add("p_cntName", txtBmcNm.Text);
            //hstparameters.Add("p_Add1", txtAddress.Value);
            //hstparameters.Add("p_City", txtCity.Value);

            hstparameters.Add("Plant_Id", tblPlant.Text);
            hstparameters.Add("MCC_Id", tblMcc.Text);
            hstparameters.Add("Other_Code", txtBmcCode.Text);
            hstparameters.Add("Center_Name", txtBmcNm.Text);
            hstparameters.Add("City", txtCity.Value);
            hstparameters.Add("Address", txtAddress.Value);
            hstparameters.Add("Comapny_Code", "4");
            hstparameters.Add("Country_Code","1");
            hstparameters.Add("Action", "Add_Center");
            SqlDataReader reader = (SqlDataReader)getdata.GetDataReader("RMRD_Master_Center", System.Data.CommandType.StoredProcedure, hstparameters);
            while (reader.Read())
            {
                Label1.Visible = true;
                Label1.BackColor = System.Drawing.Color.Green;
                //this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oops!',"+ reader.GetFieldValue<string>(0) + "'User Already Exists!', 'error');", true);
                Label1.Text = reader.GetFieldValue<string>(0);

            }

            reader.Close();
            //objcs.HstParameters = hstparameters;
            //result = objcs.Insert();
            //if ((int)result > 0)
            //{

               
            //    txtBmcCode.Text = "";
            //    txtBmcNm.Text = "";
            //    txtAddress.Value = "";
            //    txtCity.Value = "";
            //    Label1.BackColor = System.Drawing.Color.Green;
            //    Label1.Text = "Record Inserted Successfully";
            //}
            //else
            //{
            //    Label1.BackColor = System.Drawing.Color.Red;
            //    Label1.Text = "Something Went wrong";
            //}

        }
        catch (Exception ex)
        {
        }




    }


protected void Cancle_Click(object sender, EventArgs e)
    {

        Response.Redirect("Default.aspx");
    }

    protected void txtBmcCode_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtBmcCode.Text = "";
        if (txtBmcCode.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblMstCenter where cntCode=" + txtBmcCode.Text, System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtBmcCode.Visible = true;
            lbltxtBmcCode.Text = " Alreade Exists";
        }
    }

    protected void txtBmcNm_TextChanged(object sender, EventArgs e)
    {
        int result = 0;
        lbltxtBmcNm.Text = "";
        if (txtBmcNm.Text != "")
        {
            result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblMstCenter where cntName='" + txtBmcCode.Text+"'", System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            lbltxtBmcNm.Visible = true;
            lbltxtBmcNm.Text = " Alreade Exists";
        }
    }

   
}
