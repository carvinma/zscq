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

        //���ݿ������ַ���
        public static readonly string SqlConnectionString = ConfigurationManager.ConnectionStrings["IHome020ConnectionString1"].ConnectionString;

        // Hashtable to store cached parameters,���ڱ��ֱ�����
        private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());
        /// <summary>
        /// ִ����ӣ��޸ģ�ɾ������
        /// </summary>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="commandType">ִ�е��Ǵ洢���̻���SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">�洢���̻�SQL�ı��еĲ���</param>
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
        /// ִ����ӣ��޸ģ�ɾ������
        /// </summary>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="commandType">ִ�е��Ǵ洢���̻���SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">�洢���̻�SQL�ı��еĲ���</param>
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
        /// ִ����ӣ��޸ģ�ɾ������
        /// </summary>
        /// <param name="conn">����Ϊ���Ӷ���</param>
        /// <param name="commandType">ִ�е��Ǵ洢���̻���SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">�洢���̻�SQL�ı��еĲ���</param>
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
        /// ִ����ӣ��޸ģ�ɾ������
        /// </summary>
        /// <param name="trans">���ݿ��������</param>
        /// <param name="commandType">ִ�е��Ǵ洢���̻���SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">�洢���̻�SQL�ı��еĲ���</param>
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
        /// ���߷�ʽ��ȡ����
        /// </summary>
        /// <param name="commandType">ִ�е��Ǵ洢���̻���SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">�洢���̻�SQL�ı��еĲ���</param>
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
        /// ���߷�ʽ��ȡ����
        /// </summary>
        /// <param name="connectionString">���������ַ���</param>
        /// <param name="commandType">ִ�е��Ǵ洢���̻���SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">�洢���̻�SQL�ı��еĲ���</param>
        /// <returns>����SqlDataReader����</returns>
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
        /// ���߷�ʽ��ȡ����
        /// </summary>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        /// <returns>����dataset����</returns>
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
        /// ���߷�ʽ��ȡ����
        /// </summary>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        /// <returns>����dataset</returns>
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
        /// ���ص�һ�е�һ�е�ֵ
        /// </summary>
        /// <param name="commandType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        /// <returns>����object����</returns>
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
        /// ���ص�һ�е�һ�е�ֵ
        /// </summary>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="commandType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        /// <returns>����object����</returns>
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
        /// ���ص�һ�е�һ�е�ֵ
        /// </summary>
        /// <param name="conn">�������Ӷ���</param>
        /// <param name="commandType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="commandText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        /// <returns>����object����</returns>
        public static object ExecuteScalar(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            return val;
        }

        /// <summary>
        /// ���������cache��
        /// </summary>
        /// <param name="cacheKey">����cache�Ĺؼ���</param>
        /// <param name="cmdParms">Ҫ�����ֵ</param>
        public static void CacheParameters(string cacheKey, params SqlParameter[] commandParameters)
        {
            parmCache[cacheKey] = commandParameters;
        }

        /// <summary>
        /// ��ȡcached����Ӧ�ؼ��ֵ�ֵ
        /// </summary>
        /// <param name="cacheKey">cache�еĹؼ���</param>
        /// <returns>����õĸùؼ����µ�ֵ</returns>
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
        /// Prepare a command for execution ��command�������׼��
        /// </summary>
        /// <param name="cmd">SqlCommand ����</param>
        /// <param name="conn">SqlConnection ����</param>
        /// <param name="trans">SqlTransaction ����</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="cmdParms">����</param>
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
        /// ��DropDownList
        /// </summary>
        /// <param name="myDropList">DropDownList����</param>
        /// <param name="strTextField">�����ݿ�������ʾ���ı�һ����string����</param>
        /// <param name="strValueField">�����ݿ��еļ�ֵ��һ����int����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindDropDownList(DropDownList myDropList, string strTextField, string strValueField, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(connectionString, cmdType, cmdText, commandParameters);
            myDropList.DataSource = dr;
            myDropList.DataTextField = strTextField;
            myDropList.DataValueField = strValueField;
            myDropList.DataBind();
        }


        
        /// <summary>
        /// ��DropDownList
        /// </summary>
        /// <param name="myDropList">DropDownList����</param>
        /// <param name="strTextField">�����ݿ�������ʾ���ı�һ����string����</param>
        /// <param name="strValueField">�����ݿ��еļ�ֵ��һ����int����</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindDropDownList(DropDownList myDropList,string strTextField, string strValueField, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(SqlConnectionString, cmdType, cmdText, commandParameters);
            myDropList.DataSource = dr;
            myDropList.DataTextField = strTextField;
            myDropList.DataValueField = strValueField;
            myDropList.DataBind();
        }

        /// <summary>
        /// ��GridView
        /// </summary>
        /// <param name="myGridView">GridView����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindGridView(GridView myGridView, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(connectionString, cmdType, cmdText, commandParameters);

            myGridView.DataSource = ds;
            myGridView.DataBind();
        }

        /// <summary>
        /// ��GridView
        /// </summary>
        /// <param name="myGridView">GridView����</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindGridView(GridView myGridView, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(SqlConnectionString, cmdType, cmdText, commandParameters);

            myGridView.DataSource = ds;
            myGridView.DataBind();
        }
        
        /// <summary>
        /// ����strValue�ڵ�ֵ��DropDownList�ڲ�����ͬ��ֵ
        /// </summary>
        /// <param name="DropDL">DropDownList����</param>
        /// <param name="strValue">���ҵ�ֵ</param>
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
        /// ��HtmlSelect�ؼ�
        /// </summary>
        /// <param name="myHtmlSelect">HtmlSelect����</param>
        /// <param name="strTextField">�����ݿ�������ʾ���ı�һ����string����</param>
        /// <param name="strValueField">�����ݿ��еļ�ֵ��һ����int����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindHtmlSelect(HtmlSelect myHtmlSelect, string strTextField, string strValueField, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(connectionString, cmdType, cmdText, commandParameters);
            myHtmlSelect.DataSource = dr;
            myHtmlSelect.DataTextField = strTextField;
            myHtmlSelect.DataValueField = strValueField;
            myHtmlSelect.DataBind();
        }

        /// <summary>
        /// ��CheckBoxList
        /// </summary>
        /// <param name="myCheckBoxList">CheckBoxList����</param>
        /// <param name="strTextField">�����ݿ�������ʾ���ı�һ����string����</param>
        /// <param name="strValueField">�����ݿ��еļ�ֵ��һ����int����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindCheckBoxList(CheckBoxList myCheckBoxList, string strTextField, string strValueField, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(connectionString, cmdType, cmdText, commandParameters);
            myCheckBoxList.DataSource = dr;
            myCheckBoxList.DataTextField = strTextField;
            myCheckBoxList.DataValueField = strValueField;
            myCheckBoxList.DataBind();
        }


        /// <summary>
        /// ��CheckBoxList
        /// </summary>
        /// <param name="myCheckBoxList">CheckBoxList����</param>
        /// <param name="strTextField">�����ݿ�������ʾ���ı�һ����string����</param>
        /// <param name="strValueField">�����ݿ��еļ�ֵ��һ����int����</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindCheckBoxList(CheckBoxList myCheckBoxList, string strTextField, string strValueField, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlDataReader dr = ExecuteReader(SqlConnectionString, cmdType, cmdText, commandParameters);
            myCheckBoxList.DataSource = dr;
            myCheckBoxList.DataTextField = strTextField;
            myCheckBoxList.DataValueField = strValueField;
            myCheckBoxList.DataBind();
        }

        /// <summary>
        /// ��DataList
        /// </summary>
        /// <param name="myDataList">DataList����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindDataList(DataList myDataList, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(connectionString, cmdType, cmdText, commandParameters);
            myDataList.DataSource = ds;
            myDataList.DataBind();
        }


        /// <summary>
        /// ��DataList
        /// </summary>
        /// <param name="myDataList">DataList����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindDataList(DataList myDataList, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(SqlConnectionString, cmdType, cmdText, commandParameters);
            myDataList.DataSource = ds;
            myDataList.DataBind();
        }

        /// <summary>
        /// ��Repeater
        /// </summary>
        /// <param name="myRepeater">Repeater����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindRepeater(Repeater myRepeater, string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(connectionString, cmdType, cmdText, commandParameters);
            myRepeater.DataSource = ds;
            myRepeater.DataBind();
        }

        /// <summary>
        /// ��Repeater
        /// </summary>
        /// <param name="myRepeater">Repeater����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
        public static void BindRepeater(Repeater myRepeater, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            DataSet ds = ExecuteDataSet(SqlConnectionString, cmdType, cmdText, commandParameters);
            myRepeater.DataSource = ds;
            myRepeater.DataBind();
        }
        ///<summary>
        ///��ҳ��Datalist
        ///<summary>
        /// <param name="myRepeater">Datalist����</param>
        /// <param name="connectionString">���ݿ������ַ���</param>
        /// <param name="cmdType">ִ�д洢���̻�SQL�ı�</param>
        /// <param name="cmdText">�洢�������ƻ�SQL�ı�</param>
        /// <param name="commandParameters">����</param>
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
