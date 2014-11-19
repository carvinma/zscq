using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using zscq.DAL;
using zscq.Model;
/// <summary>
///StringHelper 的摘要说明
/// </summary>
public static class StringHelper
{
    /// <summary>
    /// 替换html标签
    /// </summary>
    /// <param name="Htmlstring"></param>
    /// <returns></returns>
    public static string ExecRepaceHTML(this string Htmlstring)
    {
        Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"<!--.*\n", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&#(\d+);", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"\s", ""); Htmlstring.Replace("<", ""); Htmlstring.Replace(">", "");
        Htmlstring.Replace("\r\n", "");
        Htmlstring = HttpContext.Current.Server.HtmlEncode(Htmlstring).Trim();
        return Htmlstring;
    }
    /// <summary>
    /// 移除html标签
    /// </summary>
    /// <param name="Htmlstring"></param>
    /// <returns></returns>
    public static string ExecRemoveHTML(this string Htmlstring)
    {
        Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"<!--.*\n", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"\\", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"/", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"&", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @"<", "", RegexOptions.IgnoreCase);
        Htmlstring = Regex.Replace(Htmlstring, @">", "", RegexOptions.IgnoreCase);
        Htmlstring.Replace("\r\n", "");
        Htmlstring = HttpContext.Current.Server.HtmlEncode(Htmlstring).Trim();
        return Htmlstring;
    }
    /// <summary>
    /// 判断字符串是否为空
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static bool IsNull(this string str)
    {
        return string.IsNullOrWhiteSpace(str);
    }
    /// <summary>
    /// 字符串清理
    /// </summary>
    /// <param name="inputString"></param>
    /// <param name="maxLength">字符串截取长度</param>
    /// <returns></returns>
    public static string RemoveUnSafe(this string inputString, int maxLength)
    {
        StringBuilder retVal = new StringBuilder();

        // 检查是否为空
        if ((inputString != null) && (inputString != String.Empty))
        {
            inputString = inputString.Trim();

            //检查长度
            if (inputString.Length > maxLength)
                inputString = inputString.Substring(0, maxLength);

            //替换危险字符
            for (int i = 0; i < inputString.Length; i++)
            {
                switch (inputString[i])
                {
                    case '"':
                        retVal.Append("&quot;");
                        break;
                    case '<':
                        retVal.Append("&lt;");
                        break;
                    case '>':
                        retVal.Append("&gt;");
                        break;
                    default:
                        retVal.Append(inputString[i]);
                        break;
                }
            }
            retVal.Replace("'", " ");// 替换单引号
        }
        return retVal.ToString();

    }
    public static string RemoveUnSafe(this string inputString)
    {
        StringBuilder retVal = new StringBuilder();

        // 检查是否为空
        if ((inputString != null) && (inputString != String.Empty))
        {
            inputString = inputString.Trim();

            //替换危险字符
            for (int i = 0; i < inputString.Length; i++)
            {
                switch (inputString[i])
                {
                    case '"':
                        retVal.Append("&quot;");
                        break;
                    case '<':
                        retVal.Append("&lt;");
                        break;
                    case '>':
                        retVal.Append("&gt;");
                        break;
                    default:
                        retVal.Append(inputString[i]);
                        break;
                }
            }
            retVal.Replace("'", " ");// 替换单引号
        }
        return retVal.ToString();

    }
    public static string CutString(this string inputString, int maxLength)
    {
        //检查长度
        if (inputString.Length > maxLength)
            inputString = inputString.Substring(0, maxLength);
        return inputString;
    }
    /// <summary>
    /// 截取字符串
    /// </summary>
    /// <param name="source"></param>
    /// <param name="len"></param>
    /// <param name="isAddDot"></param>
    /// <returns></returns>
    public static string CutString(string source, int len, bool isAddDot)
    {
        if (source.Length <= len)
        {
            return source;
        }
        string strTemp = "";
        int intTemp = 0;
        int intPos = 0;
        while ((intTemp < len * 2) && (intPos < source.Length))
        {
            if (((int)source[intPos]) < 128)
            {
                //单字节
                strTemp += source[intPos].ToString();
                intTemp++;
            }
            else if (intTemp == (len * 2 - 1))
            {
                //双字节
                break;
            }
            else
            {
                strTemp += source[intPos].ToString();
                intTemp += 2;
            }

            intPos++;
        }
        if (isAddDot)
        {
            strTemp += "...";
        }
        return strTemp;
    }
    /// <summary>
    /// 过滤SQL关键字   
    /// </summary>
    /// <param name="sWord"></param>
    /// <returns></returns>
    public static bool CheckSqlKeyWord(string sWord)
    {
        //关键字
        string StrKeyWord = @"[select|insert|delete|from|count\(|drop table|update|truncate|asc\(|mid\(|char\(|xp_cmdshell|exec master|netlocalgroup administrators|:|net user|""|or|and|chr|declare|SiteName|add|exec master.dbo.xp_cmdshell]\s{1,}";
        //关键字符
        string StrRegex = @"[-|;|,|/|\(|\)|\[|\]|}|{|%|\@|*|!|']";
        if (Regex.IsMatch(sWord, StrKeyWord, RegexOptions.IgnoreCase) || Regex.IsMatch(sWord, StrRegex))
            return true;
        return false;
    }
    /// <summary>
    /// 过滤Js和Html关键字   
    /// </summary>
    /// <param name="html"></param>
    /// <returns></returns>
    public static bool CheckJsAndHtmlKeyWord(string sWord)
    {
        //Js关键字
        string StrKeyWord = @"<script[\s\S]+</script *>";
        //Html关键字符
        string StrRegex = @"href *= *[\s\S]*script *:|on[\s\S]*=|<iframe[\s\S]+</iframe *>|<frameset[\s\S]+</frameset *>|\<img[^\>]+\>|<p>|</p>|<strong>|</strong>|.asp|.aspx|.exe|.jsp|.js|.css";
        //string StrHtml = @"/<\s*(\S+)(\s[^>]*)?>[\s\S]*<\s*\/\1\s*>/";//匹配HTML标记
        if (Regex.IsMatch(sWord, StrKeyWord, RegexOptions.IgnoreCase) || Regex.IsMatch(sWord, StrRegex, RegexOptions.IgnoreCase))
            return true;
        //if (Regex.IsMatch(sWord, StrHtml, RegexOptions.IgnoreCase))
        //{
        //    return true;
        //}
        return false;
    }
    #region 生成单据号
    /// <summary> 
    /// 生成单据号 
    /// </summary> 
    /// <param name="formcode"></param> 
    /// <returns></returns> 
    public static string CreateCode(string formcode)
    {

        formcode += DateTime.Now.Year.ToString();
        formcode += DateTime.Now.Month.ToString().Length == 1 ? "0" + DateTime.Now.Month.ToString() : DateTime.Now.Month.ToString();
        formcode += DateTime.Now.Day.ToString().Length == 1 ? "0" + DateTime.Now.Day.ToString() : DateTime.Now.Day.ToString();
        formcode += DateTime.Now.Hour.ToString().Length == 1 ? "0" + DateTime.Now.Hour.ToString() : DateTime.Now.Hour.ToString();
        formcode += DateTime.Now.Minute.ToString().Length == 1 ? "0" + DateTime.Now.Minute.ToString() : DateTime.Now.Minute.ToString();
        formcode += DateTime.Now.Second.ToString().Length == 1 ? "0" + DateTime.Now.Second.ToString() : DateTime.Now.Second.ToString();
        if (DateTime.Now.Millisecond.ToString().Length == 1)
        {
            formcode += "00" + DateTime.Now.Millisecond.ToString();
        }
        else if (DateTime.Now.Millisecond.ToString().Length == 2)
        {
            formcode += "0" + DateTime.Now.Millisecond.ToString();
        }
        else
        {
            formcode += DateTime.Now.Millisecond.ToString();
        }
        return formcode;
    }
    public static string SetNumber(string s)
    {
        return s + ((DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000).ToString();
    }
    #endregion
    /// <summary>
    /// 转化成int
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static int GetInt(this string str)
    {
        int order = 0;
        int.TryParse(str, out order);
        return order;
    }
    /// <summary>
    /// 得到一个id
    /// </summary>
    /// <param name="str">起作为前缀</param>
    /// <returns></returns>
    public static string GetNewIdPre(this string str)
    {
        return str + System.DateTime.Now.ToString("yyyyMMddHHmmssffff" + new Random(DateTime.Now.GetHashCode()).Next(100, 999));
    }
    /// <summary>
    /// 得到一个id
    /// </summary>
    /// <param name="str">起作为后缀</param>
    /// <returns></returns>
    public static string GetNewIdNext(this string str)
    {
        return System.DateTime.Now.ToString("yyyyMMddHHmmssffff" + new Random(DateTime.Now.GetHashCode()).Next(100, 999)) + str;
    }
    /// <summary>
    /// 加密
    /// </summary>
    /// <param name="Text"></param>
    /// <returns></returns>
    public static string DESEncrypt(this string Text)
    {
        return DESEncrypt(Text, "www.yghdnet.com");
    }
    /// <summary> 
    /// 加密数据 
    /// </summary> 
    /// <param name="Text"></param> 
    /// <param name="sKey"></param> 
    /// <returns></returns> 
    public static string DESEncrypt(this string Text, string sKey)
    {
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        byte[] inputByteArray;
        inputByteArray = Encoding.Default.GetBytes(Text);
        des.Key = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5"));
        des.IV = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5"));
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        StringBuilder ret = new StringBuilder();
        foreach (byte b in ms.ToArray())
        {
            ret.AppendFormat("{0:X2}", b);
        }
        return ret.ToString();
    }
    /// <summary>
    /// 解密
    /// </summary>
    /// <param name="Text"></param>
    /// <returns></returns>
    public static string DESDecrypt(this string Text)
    {
        return DESDecrypt(Text, "www.yghdnet.com");
    }
    /// <summary> 
    /// 解密数据 
    /// </summary> 
    /// <param name="Text"></param> 
    /// <param name="sKey"></param> 
    /// <returns></returns> 
    public static string DESDecrypt(this string Text, string sKey)
    {
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        int len;
        len = Text.Length / 2;
        byte[] inputByteArray = new byte[len];
        int x, i;
        for (x = 0; x < len; x++)
        {
            i = Convert.ToInt32(Text.Substring(x * 2, 2), 16);
            inputByteArray[x] = (byte)i;
        }
        des.Key = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5"));
        des.IV = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5"));
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        return Encoding.Default.GetString(ms.ToArray());
    }
    public static string Md5Encrypt(this string Text)
    {
        return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Text, "MD5");
    }

    public static string AddressGId_Pid_Cid_Aid(int gid, int pid, int cid, int aid)
    {
        dal_Address DALA = new dal_Address();
        return DALA.Set_AddressName_Gid_PId_CId_AId(gid, pid, cid, aid);
    }
    public static string EmailReplaceX(this string str)
    {
        //270678985@qq.com
        string q = "";//前部分
        string h = "";//后部分 
        if (str.Contains("@"))
        {
            q = str.Substring(0, str.LastIndexOf("@"));
            h = str.Substring(str.LastIndexOf("@"));
        }
        if (q.Length > 3)
        {
            q = q.Substring(0, 2);
        }
        return q + "******" + h;
    }
    public static string MobilePhoneReplaceX(this string str)
    {
        //13511097976
        string s = "";
        for (int i = 0; i < str.Length; i++)
        {
            if (i < 2)
            {
                s += str.Substring(i, 1);
            }
            else if (i > 2 && i < str.Length - 2)
            {
                s += "*";
            }
            else
            {
                s += str.Substring(i, 1);
            }
        }
        return s;
    }
}