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

public partial class Geographical_State : System.Web.UI.Page
{
    clsGenral ObjGen = new clsGenral();
    Hashtable hstparameters = new Hashtable();
    State objcs = new State();
    clsDBOperations getdata = new clsDBOperations();

    private object MessageBox;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
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
            hstparameters.Add("p_StateId", txtStateCode.Text);
            hstparameters.Add("p_StateName", txtStateNm.Text);
            


            objcs.HstParameters = hstparameters;
            result = objcs.Insert();
            if ((int)result > 0)
            {
                txtStateCode.Text = "";
                txtStateNm.Text = "";

                Label4.Visible = true;
                Label4.BackColor = System.Drawing.Color.Green;
                Label4.Text = "Record Inserted Successfully";
            }
            else
            {
                Label4.Visible = true;
                Label4.BackColor = System.Drawing.Color.Green;
                Label4.Text = "Something went wrong";
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

    protected void txtStateCode_TextChanged(object sender, EventArgs e)
    { int result=0;
        Label1.Text = "";
        if(txtStateCode.Text!="")
        { 
         result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblState where StateId=" + txtStateCode.Text, System.Data.CommandType.Text, hstparameters));
        }
        if (result!=0)
        {
            Label1.Visible = true;
            Label1.Text = "State Code Alreade Exists";
        }

    }


  
    protected void txtStateNm_TextChanged1(object sender, EventArgs e)
    {
        int result = 0;
        Label2.Text = "";
        if(txtStateNm.Text!="")
        { 
        result = Convert.ToInt32(getdata.ExecuteScalar("select count(*) from tblState where StateName='" + txtStateNm.Text + "'", System.Data.CommandType.Text, hstparameters));
        }
        if (result != 0)
        {
            Label2.Visible = true;
            Label2.Text = "State Name  Alreade Exists";
        }
    }
}
