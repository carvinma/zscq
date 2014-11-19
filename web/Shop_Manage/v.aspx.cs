using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Shop_Manage_v : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetPageNoCache();
        CreateImage.DrawImage();
    }
    /**/
    /// <summary>
    /// 设置页面不被缓存
    /// </summary>
    private void SetPageNoCache()
    {
        Response.Buffer = true;
        Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);
        Response.Expires = 0;
        Response.CacheControl = "no-cache";
        Response.AppendHeader("Pragma", "No-Cache");
    }
}
public class CreateImage
{
    public CreateImage()
    {

    }
    public static string ImageString;
    public static void DrawImage()
    {
        CreateImage img = new CreateImage();
        CreateImage.ImageString = img.RndNum(4);
        string verifyCode = CreateImage.ImageString;
        HttpContext.Current.Session["Validate"] = verifyCode;
        img.CreateImages(verifyCode);
    }
    /// <summary>
    /// 生成验证图片
    /// </summary>
    /// <param name="checkCode">验证字符</param>
    private void CreateImages(string checkCode)
    {
        int iwidth = (int)(checkCode.Length * 13);//根据随即字符串的位数*13决定图片的长度
        System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth, 23);//创建1个图片，参数为（宽，高）
        Graphics g = Graphics.FromImage(image);//将此图片加入到GDI中
        g.Clear(Color.White);//将图片的背景色定义为白色
        //定义颜色库，可自定义添加
        Color[] c = { Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan, Color.Purple };
        //定义字体库，可自定义添加
        string[] font = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "宋体" };
        Random rand = new Random();//实例化随机器
        //随机输出噪点（矩形）
        for (int i = 0; i < 50; i++)//在图片上画50个小点点
        {
            int x = rand.Next(image.Width);//随即定义噪点的left坐标（在图片的宽度范围内）
            int y = rand.Next(image.Height);//随即定义噪点的top坐标（在图片的高度范围内）
            g.DrawRectangle(new Pen(Color.LightGray, 0), x, y, 1, 1);//将此噪点加入到图片中（颜色，left坐标，top坐标，宽度，高度）
        }
        //输出不同字体和颜色的验证码字符
        for (int i = 0; i < checkCode.Length; i++)
        {
            int cindex = rand.Next(7);//生成1个 颜色库长度 以内的数字,一会用于颜色库数组定位
            int findex = rand.Next(5);//生成1个 字体库长度 以内的数字,一会用于字体库数组定位
            Font f = new System.Drawing.Font(font[findex], 10, System.Drawing.FontStyle.Bold);//实例1个字体参数为（字体名，字体大小，字体样式）
            Brush b = new System.Drawing.SolidBrush(c[cindex]);//实例化1个Brush参数为（颜色名）
            int ii = 4;//定义字符串的top坐标为4
            if ((i + 1) % 2 == 0)//如果i+1是2的倍数，也就是偶数，定义字符串的top坐标为2
            {
                ii = 2;
            }
            g.DrawString(checkCode.Substring(i, 1), f, b, 3 + (i * 12), ii);//将1个字符串加入到图片中（字符串，字体，颜色，left坐标，top坐标）
            //这里的字符串已被截取为1个个字符，这里的left坐标是第1个字为3，最后一个为 图片的宽度-3，每个字中间都隔着12
        }
        //画一个边框
        g.DrawRectangle(new Pen(Color.Black, 0), 0, 0, image.Width - 1, image.Height - 1);
        //输出到浏览器
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        HttpContext.Current.Response.ClearContent();
        //Response.ClearContent();
        HttpContext.Current.Response.ContentType = "image/Jpeg";
        HttpContext.Current.Response.BinaryWrite(ms.ToArray());
        g.Dispose();//释放图片
        image.Dispose();//释放图片
    }
    /// <summary>
    /// 生成随机的字母
    /// </summary>
    /// <param name="VcodeNum">生成字母的个数</param>
    /// <returns>string</returns>
    private string RndNum(int VcodeNum)
    {
        string Vchar = "2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,J,K,M,N,P,Q,R,S,T,U,V,W,X,Y,Z";//去掉了0,1,i,o,l
        string[] VcArray = Vchar.Split(',');
        string VNum = "";//由于字符串很短，就不用StringBuilder了
        int temp = -1; //记录上次随机数值，尽量避免生产几个一样的随机数
        //采用一个简单的算法以保证生成随机数的不同
        Random rand = new Random();
        for (int i = 1; i < VcodeNum + 1; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(VcArray.Length);
            if (temp != -1 && temp == t)
            {
                return RndNum(VcodeNum);
            }
            temp = t;
            VNum += VcArray[t];
        }
        return VNum;
    }
}
