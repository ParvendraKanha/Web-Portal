using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for ClsCompanyMst
/// </summary>
public class PlantMaster
{
    Hashtable _hstParameters = new Hashtable();
    clsDBOperations ObjDBOper = new clsDBOperations();
    public PlantMaster()
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
        int result;
        result = ObjDBOper.ExecuteNonQuery("sp_insert_tblPlant", System.Data.CommandType.StoredProcedure, _hstParameters);
        //result =ObjDBOper.ExecuteNonQuery("RMRD_Master_Plant_Active", System.Data.CommandType.StoredProcedure, _hstParameters);
        return result;
    }

}