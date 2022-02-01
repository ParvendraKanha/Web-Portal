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




#region Enums...
public enum Actions
{
    Select,
    Insert,
    Update,
    Delete
}
#endregion

/// <summary>
/// Summary description for clsDBOperations
/// </summary>
public class clsDBOperations : DbProviderFactory
{
    #region Private Variables
    String strConnection = "";
    String providerName = "";
    DbProviderFactory provider;
    //string sql = "";
    //FileInfo fi;
    //StreamReader sr;
    public static DbConnection conn;
    Hashtable hstParameters1;
    DbCommand command;
    #endregion

    #region Constractor Call
    public clsDBOperations()
    {
        try
        {
            hstParameters1 = new Hashtable();
            provider = GetProvider();
            funcon();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion Constractor Call

    #region Set ProviderName...

    /// <summary>
    /// Function to get the provider of the connection to the DB.
    /// </summary>
    /// <returns>Provider (Sql, Oracle)</returns>
    public DbProviderFactory GetProvider()
    {
        try
        {
            providerName = "System.Data.SqlClient";
            provider = DbProviderFactories.GetFactory(providerName);

            return provider;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    #endregion

    #region Set Connection String...

    
    /// <summary>
    /// Function to Create a connection with the database.
    /// </summary>
    /// <returns>Boolean value depending upon the state of the connection</returns>
    public bool funcon()
    {
        try
        {
            GetProvider();
            strConnection = ConfigurationManager.AppSettings["con"].ToString();
            //strConnection = ConfigurationManager.ConnectionStrings["con"].ToString();
            provider = GetProvider();
            conn = provider.CreateConnection();
            conn.ConnectionString = strConnection;

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                conn.Dispose();
            }
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            return (true);
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    public DbConnection NewConn()
    {
        #region Previous
        //try
        //{
        //    conn = provider.CreateConnection();
        //    conn.ConnectionString = strConnection;
        //    if (conn.State == ConnectionState.Open)
        //    {
        //        conn.Close();
        //        conn.Dispose();
        //    }
        //    if (conn.State == ConnectionState.Closed)
        //        conn.Open();
        //}
        //catch (Exception ex)
        //{
        //    throw new Exception(ex.Message);
        //}
        #endregion Previous
        try
        {
            DbConnection TmpNewConn;
            TmpNewConn = provider.CreateConnection();
            if (TmpNewConn.State != ConnectionState.Open)
                TmpNewConn.Open();
            return TmpNewConn;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion


    #region Utility Functions

    /// <summary>
    /// Function to Attach Parameters and their values to the command to be executed
    /// </summary>
    /// <param name="command">Command to be executed</param>
    /// <param name="parameterNames">Parameters to be attached to the command</param>
    /// <param name="parameterValues">Values of the parameters attached to the command</param>
    private void AttachParameters(DbCommand command, Hashtable hstParameters)
    {
        try
        {
            IEnumerator parameters = hstParameters.Keys.GetEnumerator();
            while (parameters.MoveNext())
            {
                DbParameter param = provider.CreateParameter();
                param.ParameterName = "@" + parameters.Current;
                param.Value = hstParameters[parameters.Current];
                command.Parameters.Add(param);
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    /// <summary>
    /// Function to Attach Parameters to be passed to the database with Dataadapters
    /// </summary>
    /// <param name="command">Command to be created</param>
    /// <param name="Parameters">Parameters to be attached</param>
    public DbCommand AttachParameters(DbCommand command, Hashtable Parameters, String strCommand)
    {
        try
        {
            IEnumerator ienumParams = Parameters.GetEnumerator();
            while (ienumParams.MoveNext())
            {
                DbParameter param = provider.CreateParameter();
                param.ParameterName = "@" + ienumParams.Current;
                param.SourceColumn = Parameters[ienumParams.Current].ToString();
                param.SourceVersion = DataRowVersion.Original;
                command.Parameters.Add(param);
            }
            return command;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    /// <summary>
    /// Function to Create DbCommands
    /// </summary>
    /// <param name="commandText">Query/ Stored Procedure to be executed</param>
    /// <param name="commandType">Type of Commands to be executed</param>
    public DbCommand CreateDbCommand(String commandText, CommandType commandType)
    {
        try
        {
            command = provider.CreateCommand();
            try
            {
                command.Connection = conn;
                command.CommandText = commandText;
                command.CommandType = commandType;
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write("Error : " + exception.Message + " </br> Source : " + exception.Source);
            }
            return command;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    /// <summary>
    /// Function to create DbCommand to be executed
    /// </summary>
    /// <param name="hstCommands">
    /// Commands to be executed
    /// ex. hstCommands("SelectCommand", "Command")
    /// </param>
    /// <param name="hstCommandTypes">
    /// Command Type of each of the commands
    /// ex. hstCommandTypes("SelectCommand", CommandType.StoredProcedure)
    /// </param>
    private void CreateDbCommand(Hashtable hstCommands, Hashtable hstCommandTypes)
    {
        try
        {
            Hashtable hstDbCommands = new Hashtable();
            IEnumerator ienum = hstCommands.Keys.GetEnumerator();
            while (ienum.MoveNext())
            {
                command = provider.CreateCommand();
                command.Connection = conn;
                command.CommandText = hstCommands[ienum.Current].ToString();
                command.CommandType = (CommandType)hstCommandTypes[ienum.Current];
                hstDbCommands.Add(ienum.Current, command);
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion Utility Functions

    #region Execute Dataset

    ///<Author></Author>
    /// <Date>02-07-09</Date>
    /// <summary>
    /// Function to get the required resultant into a dataset
    /// </summary>
    /// <returns>Dataset containing required resultant</returns>
    private DataSet GetDataSet(String commandText, CommandType commandType, Hashtable hstParameters, String tableName)
    {
        try
        {
            command = (DbCommand)CreateDbCommand(commandText, commandType);

            if (hstParameters != null)
            {
                if (hstParameters.Count > 0)
                    AttachParameters(command, hstParameters);
            }

            using (DataSet dataset = new DataSet())
            using (DbDataAdapter adapter = provider.CreateDataAdapter())
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                adapter.SelectCommand = command;
                if (tableName != "" && tableName != null)
                    adapter.Fill(dataset, tableName);
                else
                    adapter.Fill(dataset);
                return dataset;
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            DbConnectionClose();
        }
    }

    public void ExecuteDataset(ref DataSet dsResult, Hashtable hstCommands, Hashtable hstCommandTypes, Actions action, String tableName, Hashtable hstParameters)
    {

    }

    ///<Author></Author>
    /// <Date>02-07-09</Date>
    /// <summary>
    /// Function to get the resultant dataset after execution of Query/Stored Procedure
    /// </summary>
    /// <param name="CommandText">Query/ Stored Procedure to be executed</param>
    /// <param name="CommandType">Command Type(query/stored procedure</param>
    /// <returns>Dataset containing required resultant after execution of Query or Stored Procedure</returns>
    public DataSet GetDataset(String commandText, CommandType commandType)
    {
        try
        {
            return GetDataSet(commandText, commandType, null, null);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public DataSet GetDataset(String commandText, CommandType commandType, String tableName)
    {
        try
        {
            return GetDataSet(commandText, commandType, null, tableName);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    ///<Author></Author>
    /// <Date>02-07-09</Date>
    /// <summary>
    /// Overload of GetDataset function for execution of queries with parameters
    /// </summary>
    /// <returns>Dataset containing required result set</returns>
    public DataSet GetDataset(String commandText, CommandType commandType, Hashtable hstParameters)
    {
        try
        {
            return GetDataSet(commandText, commandType, hstParameters, null);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    /// <summary>
    /// Overloaded Function to fetch data from database
    /// </summary>
    /// <param name="commandText">Stored Procedure/Query to be executed</param>
    /// <param name="commandType">Command Type (Stroed Procedure / Query)</param>
    /// <param name="hstParameters">Parameters to be passed to the database</param>
    /// <param name="tableName">Name of the table into which data needs to be fetched</param>
    /// <returns>Dataset containing reuqired values</returns>
    public DataSet GetDataset(String commandText, CommandType commandType, Hashtable hstParameters, String tableName)
    {
        try
        {
            return GetDataSet(commandText, commandType, hstParameters, tableName);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    #endregion Execute Dataset

    #region ExecuteReader

    /// <summary>
    /// Function to Execute the query/ stored procedure and return a data reader 
    /// </summary>
    /// <param name="CommandText">Comand to be executed ( Query/ Stored Procedure)</param>
    /// <param name="CommandType">Command Type ( Query/Stored Procedure) </param>
    /// <param name="hstParameters">Parameters to be passed with the Query/Stored Procedure to be executed</param>
    /// <returns>DataReader</returns>
    public DbDataReader GetDataReader(String commandText, CommandType commandType, Hashtable hstParameters)
    {
        try
        {
            command = provider.CreateCommand();
            if (conn.State.ToString().Equals("Closed"))
                conn.Open();
            command.Connection = conn;
            command.CommandText = commandText;
            command.CommandType = commandType;
            if (hstParameters.Count != 0)
                AttachParameters(command, hstParameters);

           return command.ExecuteReader(CommandBehavior.CloseConnection);
            //return command.ExecuteReader();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    ///<author>Ashish Gupta</author>
    /// <date> 02-07-09 </date>
    /// <summary>
    /// Overloaded Function to fetch data from database
    /// </summary>
    /// <param name="commandText">Query to be executed</param>
    /// <param name="commandType">Command Type (Query)</param>
    /// <returns>DataReader</returns>
    public DbDataReader GetDataReader(String commandText, CommandType commandType)
    {
        try
        {
            command = provider.CreateCommand();
            if (conn.State.ToString().Equals("Closed"))
                conn.Open();

            command.Connection = conn;
            command.CommandText = commandText;
            command.CommandType = commandType;

            return command.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    #endregion ExecuteReader

    #region ExecuteNonQuery

    /// <summary>
    /// Function to Execute NonQuery
    /// </summary>
    /// <param name="commandText">Query or Stored Procedure to be executed</param>
    /// <param name="commandType">Query/Stored Procedure</param>
    /// <param name="parameters">parameters to be passed along with the Query/Stored Procedure to be executed</param>
    /// <returns>no. of rows affected</returns>
    public int ExecuteNonQuery(String commandText, CommandType commandType, Hashtable parameters)
    {
        int result;
        try
        {
            command = provider.CreateCommand();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            command.Connection = conn;
            command.CommandText = commandText;
            command.CommandType = commandType;
            if (parameters != null)
            {
                if (parameters.Count > 0)
                    AttachParameters(command, parameters);
            }
            result= command.ExecuteNonQuery();
            DbConnectionClose();
            return result;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }


   







    #endregion ExecuteNonQuery

    #region ExecuteScalar

    /// <summary>
    /// Function to Execute Scalar
    /// </summary>
    /// <param name="commandText">Query or Stored Procedure to be executed</param>
    /// <param name="commandType">Query/Stored Procedure</param>
    /// <param name="parameters">parameters to be passed along with the Query/Stored Procedure to be executed</param>
    /// <returns>The first column of the first row in the resultset returned by the Query</returns>
    public Object ExecuteScalar(String commandText, CommandType commandType, Hashtable parameters)
    {
        try
        {
            Object result;
            command = provider.CreateCommand();

            if (conn.State == ConnectionState.Closed)
                conn.Open();
            command.Connection = conn;
            command.CommandText = commandText;
            command.CommandType = commandType;
            if (parameters != null)
            {
                if (parameters.Count > 0)
                    AttachParameters(command, parameters);
            }
            result = command.ExecuteScalar();
           

            DbConnectionClose();
            return result;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    #endregion ExecuteScalar


    




    #region Create Adapter....

    public DbDataAdapter SetDataAdapter(String SelectCommand, String InsertCommand, String UpdateCommand, String DeleteCommand, Hashtable Parameters)
    {
        try
        {
            DbDataAdapter daResult = provider.CreateDataAdapter(); //new SqlDataAdapter(SelectCommand, conn);
            daResult.MissingSchemaAction = MissingSchemaAction.AddWithKey;

            daResult.SelectCommand = (DbCommand)AttachParameters(CreateDbCommand(SelectCommand, CommandType.Text), Parameters, "");
            daResult.InsertCommand = (DbCommand)AttachParameters(CreateDbCommand(InsertCommand, CommandType.Text), Parameters, "");
            daResult.UpdateCommand = (DbCommand)AttachParameters(CreateDbCommand(UpdateCommand, CommandType.Text), Parameters, "");
            daResult.DeleteCommand = (DbCommand)AttachParameters(CreateDbCommand(DeleteCommand, CommandType.Text), Parameters, "");

            return daResult;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public void CreateAdpt(DataSet ds, string qry, string tblMap)
    {
        try
        {
            DbDataAdapter adpt = provider.CreateDataAdapter();
            DbCommand cmd = provider.CreateCommand();
            DbCommandBuilder builder = provider.CreateCommandBuilder();

            if (conn.State == ConnectionState.Closed)
                conn.Open();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = qry;
            cmd.Connection = conn;

            adpt.MissingSchemaAction = MissingSchemaAction.AddWithKey;

            adpt.SelectCommand = cmd;

            builder.DataAdapter = adpt;
            adpt.InsertCommand = builder.GetInsertCommand();
            adpt.UpdateCommand = builder.GetUpdateCommand();
            adpt.DeleteCommand = builder.GetDeleteCommand();

            adpt.Update(ds, tblMap);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            DbConnectionClose();
        }

    }

    public DbDataAdapter ExecuteDataAdapter(DataSet ds, String qry, String qry_Type, Hashtable parameters, String TableName)
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();

            DbDataAdapter adapter = provider.CreateDataAdapter();
            DbCommand cmd = provider.CreateCommand();

            IEnumerator ienumParams = parameters.Keys.GetEnumerator();

            while (ienumParams.MoveNext())
            {
                if (providerName == "System.Data.SqlClient")
                {
                    DbParameter param1 = provider.CreateParameter();
                    param1.ParameterName = "@" + ienumParams.Current;
                    param1.Value = parameters[ienumParams.Current];
                    cmd.Parameters.Add(param1);
                }
                else { }
            }

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = qry;
            cmd.Connection = conn;

            adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;

            if (qry_Type == "Insert")
            {
                adapter.InsertCommand = (DbCommand)cmd.ExecuteScalar();
            }
            else if (qry_Type == "Update")
            {
                adapter.UpdateCommand = (DbCommand)cmd.ExecuteScalar();
            }
            else if (qry_Type == "Delete")
            {
                adapter.DeleteCommand = (DbCommand)cmd.ExecuteScalar();
            }
            else
            {
                adapter.SelectCommand = (DbCommand)cmd.ExecuteScalar();
            }

            adapter.Update(ds, TableName);

            DbDataAdapter DT = provider.CreateDataAdapter();
            DbConnectionClose();
            return DT;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    #endregion

    #region ConnectionClose...

    public void DbConnectionClose()   // Close DataBase Connection
    {
        try
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                //conn.Dispose();                
                SqlConnection.ClearAllPools();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    #endregion
}