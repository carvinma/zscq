using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace zscq.App_Code
{
    
    public abstract class SqlHelper
    {

        //数据库链接字符串
        public static readonly string SqlConnectionString = ConfigurationManager.ConnectionStrings["IHome020ConnectionString1"].ConnectionString;

        // Hashtable to store cached parameters,用于保持变量的
        private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());
        /// <summary>
        /// 执行添加，修改，删除操作
        /// </summary>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="commandType">执行的是存储过程还是SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">存储过程或SQL文本中的参数</param>
        /// <returns>an int </returns>
        public static int ExecuteNonQuery(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(SqlConnectionString))
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                int val = -1;
                try
                {
                    val = cmd.ExecuteNonQuery();
                }
                catch
                {
                    return -1;
                }
                cmd.Parameters.Clear();
                return val;
            }
        }
        /// <summary>
        /// 执行添加，修改，删除操作
        /// </summary>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="commandType">执行的是存储过程还是SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">存储过程或SQL文本中的参数</param>
        /// <returns>an int </returns>
        public static int ExecuteNonQuery(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }
        /// <summary>
        /// 执行添加，修改，删除操作
        /// </summary>
        /// <param name="conn">数据为链接对象</param>
        /// <param name="commandType">执行的是存储过程还是SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">存储过程或SQL文本中的参数</param>
        /// <returns>an int</returns>
        public static int ExecuteNonQuery(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }

        /// <summary>
        /// 执行添加，修改，删除操作
        /// </summary>
        /// <param name="trans">数据库事务对象</param>
        /// <param name="commandType">执行的是存储过程还是SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">存储过程或SQL文本中的参数</param>
        /// <returns>an int representing the number of rows affected by the command</returns>
        public static int ExecuteNonQuery(SqlTransaction trans, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }
        /// <summary>
        /// 在线方式读取数据
        /// </summary>
        /// <param name="commandType">执行的是存储过程还是SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">存储过程或SQL文本中的参数</param>
        /// <returns>A SqlDataReader containing the results</returns>
        public static SqlDataReader ExecuteReader(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn = new SqlConnection(SqlConnectionString);

            // we use a try/catch here because if the method throws an exception we want to 
            // close the connection throw code, because no datareader will exist, hence the 
            // commandBehaviour.CloseConnection will not work
            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                return rdr;
            }
            catch
            {
                conn.Close();
                throw;
            }
        }
        /// <summary>
        /// 在线方式读取数据
        /// </summary>
        /// <param name="connectionString">数据连接字符串</param>
        /// <param name="commandType">执行的是存储过程还是SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">存储过程或SQL文本中的参数</param>
        /// <returns>返回SqlDataReader类型</returns>
        public static SqlDataReader ExecuteReader(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                return rdr;
            }
            catch
            {
                conn.Close();
                throw;
            }
        }

        
        /// <summary>
        /// 离线方式读取数据
        /// </summary>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        /// <returns>返回dataset类型</returns>
        public static DataSet ExecuteDataSet(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlConnection conn = new SqlConnection(SqlConnectionString);
            SqlCommand cmd = new SqlCommand();

            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);

                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();

                da.SelectCommand = cmd;
                da.Fill(ds);

                return ds;
            }
            catch
            {
                conn.Close();
                throw;
            }
        }
        /// <summary>
        /// 离线方式读取数据
        /// </summary>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        /// <returns>返回dataset</returns>
        public static DataSet ExecuteDataSet(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();

            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);

                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();

                da.SelectCommand = cmd;
                da.Fill(ds);

                return ds;
            }
            catch
            {
                conn.Close();
                throw;
            }
        }
        /// <summary>
        /// 返回第一行第一列的值
        /// </summary>
        /// <param name="commandType">执行存储过程或SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        /// <returns>返回object类型</returns>
        public static object ExecuteScalar(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection connection = new SqlConnection(SqlConnectionString))
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }
        }
        /// <summary>
        /// 返回第一行第一列的值
        /// </summary>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <param name="commandType">执行存储过程或SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        /// <returns>返回object类型</returns>
        public static object ExecuteScalar(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 返回第一行第一列的值
        /// </summary>
        /// <param name="conn">数据链接对象</param>
        /// <param name="commandType">执行存储过程或SQL文本</param>
        /// <param name="commandText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        /// <returns>返回object类型</returns>
        public static object ExecuteScalar(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            return val;
        }

        /// <summary>
        /// 保存参数到cache中
        /// </summary>
        /// <param name="cacheKey">保持cache的关键字</param>
        /// <param name="cmdParms">要保存的值</param>
        public static void CacheParameters(string cacheKey, params SqlParameter[] commandParameters)
        {
            parmCache[cacheKey] = commandParameters;
        }

        /// <summary>
        /// 获取cached中相应关键字的值
        /// </summary>
        /// <param name="cacheKey">cache中的关键字</param>
        /// <returns>所获得的该关键字下的值</returns>
        public static SqlParameter[] GetCachedParameters(string cacheKey)
        {
            SqlParameter[] cachedParms = (SqlParameter[])parmCache[cacheKey];

            if (cachedParms == null)
                return null;

            SqlParameter[] clonedParms = new SqlParameter[cachedParms.Length];

            for (int i = 0, j = cachedParms.Length; i < j; i++)
                clonedParms[i] = (SqlParameter)((ICloneable)cachedParms[i]).Clone();

            return clonedParms;
        }

        /// <summary>
        /// Prepare a command for execution 对command对象进行准备
        /// </summary>
        /// <param name="cmd">SqlCommand 对象</param>
        /// <param name="conn">SqlConnection 对象</param>
        /// <param name="trans">SqlTransaction 对象</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="cmdParms">参数</param>
        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {

            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }

        /// <summary>
        /// 绑定DropDownList
        /// </summary>
        /// <param name="myDropList">DropDownList对象</param>
        /// <param name="strTextField">绑定数据库用于显示的文本一般是string类型</param>
        /// <param name="strValueField">绑定数据库中的键值，一般是int类型</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindDropDownList(DropDownList myDropList, string strTextField, string strValueField, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(connectionString, cmdType, cmdText, commandParameters);
            myDropList.DataSource = dr;
            myDropList.DataTextField = strTextField;
            myDropList.DataValueField = strValueField;
            myDropList.DataBind();
        }


        
        /// <summary>
        /// 绑定DropDownList
        /// </summary>
        /// <param name="myDropList">DropDownList对象</param>
        /// <param name="strTextField">绑定数据库用于显示的文本一般是string类型</param>
        /// <param name="strValueField">绑定数据库中的键值，一般是int类型</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindDropDownList(DropDownList myDropList,string strTextField, string strValueField, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(SqlConnectionString, cmdType, cmdText, commandParameters);
            myDropList.DataSource = dr;
            myDropList.DataTextField = strTextField;
            myDropList.DataValueField = strValueField;
            myDropList.DataBind();
        }

        /// <summary>
        /// 绑定GridView
        /// </summary>
        /// <param name="myGridView">GridView对象</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindGridView(GridView myGridView, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(connectionString, cmdType, cmdText, commandParameters);

            myGridView.DataSource = ds;
            myGridView.DataBind();
        }

        /// <summary>
        /// 绑定GridView
        /// </summary>
        /// <param name="myGridView">GridView对象</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindGridView(GridView myGridView, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(SqlConnectionString, cmdType, cmdText, commandParameters);

            myGridView.DataSource = ds;
            myGridView.DataBind();
        }
        
        /// <summary>
        /// 根据strValue内的值在DropDownList内查找相同的值
        /// </summary>
        /// <param name="DropDL">DropDownList对象</param>
        /// <param name="strValue">查找的值</param>
        public static void GetDropDownListValue(DropDownList myDropDownList, string strValue)
        {
            myDropDownList.SelectedIndex = 0;

            for (int i = 0; i < myDropDownList.Items.Count; i++)
            {
                if (myDropDownList.Items[i].Value == strValue)
                {
                    myDropDownList.SelectedIndex = i;
                    return;
                }
            }
        }

        /// <summary>
        /// 绑定HtmlSelect控件
        /// </summary>
        /// <param name="myHtmlSelect">HtmlSelect对象</param>
        /// <param name="strTextField">绑定数据库用于显示的文本一般是string类型</param>
        /// <param name="strValueField">绑定数据库中的键值，一般是int类型</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindHtmlSelect(HtmlSelect myHtmlSelect, string strTextField, string strValueField, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(connectionString, cmdType, cmdText, commandParameters);
            myHtmlSelect.DataSource = dr;
            myHtmlSelect.DataTextField = strTextField;
            myHtmlSelect.DataValueField = strValueField;
            myHtmlSelect.DataBind();
        }

        /// <summary>
        /// 绑定CheckBoxList
        /// </summary>
        /// <param name="myCheckBoxList">CheckBoxList对象</param>
        /// <param name="strTextField">绑定数据库用于显示的文本一般是string类型</param>
        /// <param name="strValueField">绑定数据库中的键值，一般是int类型</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindCheckBoxList(CheckBoxList myCheckBoxList, string strTextField, string strValueField, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(connectionString, cmdType, cmdText, commandParameters);
            myCheckBoxList.DataSource = dr;
            myCheckBoxList.DataTextField = strTextField;
            myCheckBoxList.DataValueField = strValueField;
            myCheckBoxList.DataBind();
        }


        /// <summary>
        /// 绑定CheckBoxList
        /// </summary>
        /// <param name="myCheckBoxList">CheckBoxList对象</param>
        /// <param name="strTextField">绑定数据库用于显示的文本一般是string类型</param>
        /// <param name="strValueField">绑定数据库中的键值，一般是int类型</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindCheckBoxList(CheckBoxList myCheckBoxList, string strTextField, string strValueField, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(SqlConnectionString, cmdType, cmdText, commandParameters);
            myCheckBoxList.DataSource = dr;
            myCheckBoxList.DataTextField = strTextField;
            myCheckBoxList.DataValueField = strValueField;
            myCheckBoxList.DataBind();
        }

        /// <summary>
        /// 绑定DataList
        /// </summary>
        /// <param name="myDataList">DataList对象</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindDataList(DataList myDataList, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(connectionString, cmdType, cmdText, commandParameters);
            myDataList.DataSource = ds;
            myDataList.DataBind();
        }


        /// <summary>
        /// 绑定DataList
        /// </summary>
        /// <param name="myDataList">DataList对象</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindDataList(DataList myDataList, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(SqlConnectionString, cmdType, cmdText, commandParameters);
            myDataList.DataSource = ds;
            myDataList.DataBind();
        }

        /// <summary>
        /// 绑定Repeater
        /// </summary>
        /// <param name="myRepeater">Repeater对象</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindRepeater(Repeater myRepeater, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(connectionString, cmdType, cmdText, commandParameters);
            myRepeater.DataSource = ds;
            myRepeater.DataBind();
        }

        /// <summary>
        /// 绑定Repeater
        /// </summary>
        /// <param name="myRepeater">Repeater对象</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void BindRepeater(Repeater myRepeater, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(SqlConnectionString, cmdType, cmdText, commandParameters);
            myRepeater.DataSource = ds;
            myRepeater.DataBind();
        }
        ///<summary>
        ///分页绑定Datalist
        ///<summary>
        /// <param name="myRepeater">Datalist对象</param>
        /// <param name="connectionString">数据库链接字符串</param>
        /// <param name="cmdType">执行存储过程或SQL文本</param>
        /// <param name="cmdText">存储过程名称或SQL文本</param>
        /// <param name="commandParameters">参数</param>
        public static void PageBindDatalist(DataList myDataList, bool TF, int GE, Label DQ, Label ALL, LinkButton SY, LinkButton SYY, LinkButton XYY, LinkButton WY, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            PagedDataSource PDS = new PagedDataSource();
            PDS.DataSource = ExecuteDataSet(cmdType, cmdText, commandParameters).Tables[0].DefaultView; ;
            PDS.AllowPaging = TF;
            PDS.PageSize = GE;
            PDS.CurrentPageIndex = Convert.ToInt32(DQ.Text) - 1;
            ALL.Text = PDS.PageCount.ToString();
            SY.Enabled = true;
            SYY.Enabled = true;
            XYY.Enabled = true;
            WY.Enabled = true;
            if (PDS.IsFirstPage)
            {
                SY.Enabled = false;
                SYY.Enabled = false;
            }
            if (PDS.IsLastPage)
            {
                XYY.Enabled = false;
                WY.Enabled = false;
            }
            myDataList.DataSource = PDS;
            myDataList.DataBind();
        }
    }
}
