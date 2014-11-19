using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class DALHelper
    {
        /// <summary>
        /// 备份数据库（完整备份）
        /// </summary>
        /// <param name="databaseName">数据库名称</param>
        /// <param name="filePath">要存放文件的路径</param>
        /// <param name="fileName">文件名</param>
        /// <returns></returns>
        public static bool BackUp(string databaseName, string filePath, string fileName) 
        {
            bool flag = false;
            DataZscqDataContext dc = new DataZscqDataContext();
            StringBuilder sbsql = new StringBuilder();
            sbsql.Append(string.Format("Backup Database {0} To disk='{1}\\{2}.bak'",databaseName,filePath,fileName));
            try
            {
                dc.ExecuteCommand(sbsql.ToString());
                flag = true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return flag;
        }
        /// <summary>
        /// 还原数据库
        /// </summary>
        /// <param name="databaseName">数据库名称</param>
        /// <param name="filePath">完整路径+文件名</param>
        /// <returns></returns>
        public static bool Restore(string databaseName, string filePath) 
        {
            bool flag = false;
            DataZscqDataContext dc = new DataZscqDataContext();
            StringBuilder sbsql = new StringBuilder();
            sbsql.Append(string.Format("restore database {0} from disk='{1}'", databaseName, filePath));
            try
            {
                dc.ExecuteCommand(sbsql.ToString());
                flag = true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return flag;
        }

    }
}
