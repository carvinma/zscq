using System;
using System.Text;
using System.Web;
namespace wxpayApp
{
	/// <summary>
	/// TenpayUtil ��ժҪ˵����
    /// �����ļ�
	/// </summary>
	public class TenpayUtil
	{
        public static string tenpay = "1";
        public static string partner = "1231596002";                   //�̻���
        public static string key = "dfgf5676uy2415hj6y4yhy64paw56y54";  //��Կ------���ʼ����Ҫ½�޻��ṩ
        public static string appid = "wx6b07c623fd540e16";//appid
        public static string appsecret = "3c07f8cd593425516c8d8a260b40570a";//appid
        public static string appkey = "dfgf5676uy2415hj6y4yhy64paw56y54";//paysignkey(��appkey) 
        public static string tenpay_notify = "http://www.hqht-online.com/wxpay/payNotifyUrl.aspx"; //֧����ɺ�Ļص�����ҳ��,*�滻��notify_url.aspx����·��
        public static string tenpay_call="http://www.hqht-online.com/wxpay/jsapi.aspx";
        public static string tenpay_process = "http://www.hqht-online.com/wxpay/process.aspx";
        public static string tenpay_process2 = "http://www.hqht-online.com/wxpay/process2.aspx"; 
        public TenpayUtil()
		{
          
		}
        public static string getNoncestr()
        {
            Random random = new Random();
            return MD5Util.GetMD5(random.Next(1000).ToString(), "GBK");
        }


        public static string getTimestamp()
        {
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return Convert.ToInt64(ts.TotalSeconds).ToString();
        }
      

		/** ���ַ�������URL���� */
		public static string UrlEncode(string instr, string charset)
		{
			//return instr;
			if(instr == null || instr.Trim() == "")
				return "";
			else
			{
				string res;
				
				try
				{
					res = HttpUtility.UrlEncode(instr,Encoding.GetEncoding(charset));

				}
				catch (Exception ex)
				{
					res = HttpUtility.UrlEncode(instr,Encoding.GetEncoding("GB2312"));
				}
				
		
				return res;
			}
		}

		/** ���ַ�������URL���� */
		public static string UrlDecode(string instr, string charset)
		{
			if(instr == null || instr.Trim() == "")
				return "";
			else
			{
				string res;
				
				try
				{
					res = HttpUtility.UrlDecode(instr,Encoding.GetEncoding(charset));

				}
				catch (Exception ex)
				{
					res = HttpUtility.UrlDecode(instr,Encoding.GetEncoding("GB2312"));
				}
				
		
				return res;

			}
		}
       

		/** ȡʱ��������漴��,�滻���׵����еĺ�10λ��ˮ�� */
		public static UInt32 UnixStamp()
		{
			TimeSpan ts = DateTime.Now - TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
			return Convert.ToUInt32(ts.TotalSeconds);
		}
		/** ȡ����� */
		public static string BuildRandomStr(int length) 
		{
			Random rand = new Random();

			int num = rand.Next();

			string str = num.ToString();

			if(str.Length > length)
			{
				str = str.Substring(0,length);
			}
			else if(str.Length < length)
			{
				int n = length - str.Length;
				while(n > 0)
				{
					str.Insert(0, "0");
					n--;
				}
			}
			
			return str;
		}



        //scope ��2��snsapi_base��snsapi_userinfo
        public static string CreateOauthUrlForCode(string scope)
        {
            StringBuilder sb=new StringBuilder();
            sb.Append("https://open.weixin.qq.com/connect/oauth2/authorize?");
            sb.Append("appid=").Append(appid).Append("&");
            sb.Append("redirect_uri=").Append(tenpay_process2).Append("&");            
            sb.Append("response_type=code&");
            sb.Append("scope=").Append(scope).Append("&");
            sb.Append("state=STATE#wechat_redirect");
            
            return sb.ToString();
        }

       
	
	}
}