using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
///DelPhoto 的摘要说明
/// </summary>
public class DelPhoto
{
	public DelPhoto()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public static void GetUpdatePhotoDel(string path)
    {
        FileInfo fin = new FileInfo(path);
        fin.Delete();
    }
    /// <summary>
    /// 删除相应的文件
    /// </summary>
    /// <param name="file_path"></param>
    /// <returns></returns>
    public static bool DeleteFile(string file_path)
    {
        if (File.Exists(file_path))
        {
            try
            {
                File.Delete(file_path);
            }
            catch
            {
                return false;
            }
        }
        return true;
    }
}