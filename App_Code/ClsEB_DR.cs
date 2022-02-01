using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;

/// <summary>
/// Summary description for ClsEB_DR
/// </summary>
public class ClsEB_DR
{
    Hashtable _hstParameters = new Hashtable();
    clsDBOperations ObjDBOper = new clsDBOperations();
    public ClsEB_DR()
    {
        //
        // TODO: Add constructor logic here
        //
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
    public DataTable GetDataDt()
    {
        DataSet DsEquip = new DataSet();
        DsEquip = ObjDBOper.GetDataset("EB_DR", CommandType.StoredProcedure, _hstParameters);
        return DsEquip.Tables[0];
    }
}