using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for ClsCompanyMst
/// </summary>
public class District
{
    Hashtable _hstParameters = new Hashtable();
    clsDBOperations ObjDBOper = new clsDBOperations();
    public District()
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
        int result= ObjDBOper.ExecuteNonQuery("sp_insert_tblDistrict", System.Data.CommandType.StoredProcedure, _hstParameters);
        return result;
    }

}