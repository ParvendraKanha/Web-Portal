using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;

/// <summary>
/// Summary description for ClsDB
/// </summary>
public class ClsDB
{
    Hashtable _hstParameters = new Hashtable();
    clsDBOperations ObjDBOper = new clsDBOperations();
    public ClsDB()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DataTable GetData()
    {
        DataSet DsEReport = new DataSet();
        DsEReport = ObjDBOper.GetDataset("DashBoard", CommandType.StoredProcedure, _hstParameters);
        return DsEReport.Tables[0];

    }

    public Hashtable HstParameters
    {
        get
        {
            return _hstParameters;
        }

        set
        {
            _hstParameters = value;
        }

    }
}