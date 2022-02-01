using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for ClsCompanyMst
/// </summary>
public class MccMaster
{
    Hashtable _hstParameters = new Hashtable();
    clsDBOperations ObjDBOper = new clsDBOperations();
    public MccMaster()
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

    public int Insert()
    {
        //int result= ObjDBOper.ExecuteNonQuery("sp_insert_tblMCC", System.Data.CommandType.StoredProcedure, _hstParameters);
        int result = ObjDBOper.ExecuteNonQuery("RMRD_Master_MCC", System.Data.CommandType.StoredProcedure, _hstParameters);
        return result;
    }

}