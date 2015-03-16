using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;

/// <summary>
///Cookies购物车
/// </summary>
public class CookiesShopCart
{
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    dal_Member DALM = new dal_Member();
    dal_UserGrade DALG = new dal_UserGrade();
    public CookiesShopCart()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
    /// <summary>
    /// 计算当前购物车总积分
    /// </summary>
    /// <returns></returns>
    public int Set_ShopCartIntegral()
    {
        try
        {
            string[] ArrayPInfo = Set_ShopCart();
            if (ArrayPInfo.Length > 0)
            {
                int allPIntegral = 0;
                for (int i = 0; i < ArrayPInfo.Length; i++)
                {
                    if (ArrayPInfo[i] != "")
                    {
                        t_IntegralProduct ipmodel = DALIP.IntegralProduct_Select_Id(Convert.ToInt32(ArrayPInfo[i].Split(',')[0]));
                        if (ipmodel != null)
                        {
                            int ShopNumber = int.Parse(ArrayPInfo[i].Split(',')[1]);
                            int ShopIntegral = ipmodel.i_NeedIntegral;
                            allPIntegral += ShopNumber * ShopIntegral;
                        }
                    }
                }
                return allPIntegral;
            }
        }
        catch
        {
            return 0;
        }
        return 0;
    }
    /// <summary>
    /// 计算总当前购物车件数
    /// </summary>
    /// <returns></returns>
    public int Set_ShopCartNumber()
    {
        try
        {
            if (HttpContext.Current.Request.Cookies["hqhtshop"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString() != "")
            {
                string NewPInfo = System.Web.HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString();
                string[] ArrayPInfo = NewPInfo.Split('|');
                int Number = 0;
                for (int i = 0; i < ArrayPInfo.Length; i++)
                {
                    if (ArrayPInfo[i] != "")
                    {
                        Number += int.Parse(ArrayPInfo[i].Split(',')[1]);
                    }
                }
                return Number;
            }
        }
        catch
        {
            return 0;
        }
        return 0;
    }
    /// <summary>
    /// 返回字符串数组形式购物车
    /// </summary>
    /// <returns></returns>
    public string[] Set_ShopCart()
    {
        if (HttpContext.Current.Request.Cookies["hqhtshop"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString() != "")
        {
            return HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString().Split('|');
        }
        return null;
    }
    /// <summary>
    /// 加商品
    /// </summary>
    /// <param name="id">商品ID</param>
    /// <param name="number">添加数量</param>
    /// <returns>
    /// 0.发生错误    1.成功    2.保留    3.没有登录  4.参数错误  5.积分不足 
    /// 6.数量至少一 7.没有上架  8.没有找到商品    9.等级超过  10.等级商品只能购买一件 
    /// 11.跨等级    12.没有开通积分手机 13:没有绑定专利或商标用户
    /// </returns>
    public int Add_ShopCart(int pid, int number, ref int count, ref int price, ref int allcount, ref int allprice)
    {
        try
        {
            if (pid > 0 && number > 0)
            {
                
                var m_product = DALIP.IntegralProduct_vw_Select_Id(pid);
                
                var m_mobile = DALIM.IntegralMobile_SelectByMemberId(Get_UerId());
                int m_id = 0;
                if (m_mobile.i_sbuid > 0)
                {
                    m_id = m_mobile.i_sbuid;
                }
                else if (m_mobile.i_zluid > 0)
                {
                    m_id = m_mobile.i_zluid;
                }
                var m_member = DALM.Member_Select_Id(m_id);
  
                int ret = duihuan(m_member, m_mobile, m_product, number, ref count, ref price, ref allcount, ref allprice);
                if (ret != 1)
                {
                    return ret;
                }
            }
            else
            {
                return 4;
            }
        }
        catch(Exception ex)
        { return 0; }
        return 1;
    }
    /// <summary>
    /// 减商品
    /// </summary>
    /// <param name="pid"></param>
    /// <param name="number"></param>
    /// <returns>
    /// 0.发生错误    1.成功    2.保留    3.没有登录  4.参数错误  5.积分不足 
    /// 6.数量至少一 7.没有上架  8.没有找到商品    9.等级超过  10.等级商品只能购买一件 
    /// 11.跨等级    12.没有开通积分手机
    /// </returns>
    public int Sub_ShopCart(int pid, int number, ref int count, ref int price, ref int allcount, ref int allprice)
    {
        try
        {
            if (pid > 0 && number > 0)
            {
                var m_product = DALIP.IntegralProduct_vw_Select_Id(pid);

                var m_mobile = DALIM.IntegralMobile_SelectByMemberId(Get_UerId());
                int m_id = 0;
                if (m_mobile.i_sbuid > 0)
                {
                    m_id = m_mobile.i_sbuid;
                }
                else if (m_mobile.i_zluid > 0)
                {
                    m_id = m_mobile.i_zluid;
                }
                var m_member = DALM.Member_Select_Id(m_id);
                int ret = duihuan(m_member, m_mobile, m_product, -number, ref count, ref price, ref allcount, ref allprice);
                if (ret != 1)
                {
                    return ret;
                }
            }
            else
            {
                return 4;
            }
        }
        catch
        { return 0; }
        return 1;
    }
    /// <summary>
    /// 获取商城用户ID
    /// </summary>
    /// <returns></returns>
    public int Get_UerId()
    {
        try
        {
            if (HttpContext.Current.Request.Cookies["hqhtshop"] != null)
            {
                if (HttpContext.Current.Request.Cookies["hqhtshop"]["hqht_shop_uid"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["hqht_shop_uid"] != "")
                {
                    return int.Parse(HttpContext.Current.Request.Cookies["hqhtshop"]["hqht_shop_uid"]);
                }
            }
        }
        catch
        { }
        return 0;
    }
    /// <summary>
    /// 获取用户积分
    /// </summary>
    /// <param name="uid"></param>
    /// <returns></returns>
    public int Get_UserIntegral()
    {
        try
        {
            var model = DALM.Member_Select_Id(Get_UerId());
            if (model != null)
            {
                return model.i_Integral;
            }
        }
        catch
        {
            return -1;
        }
        return -1;
    }
    /// <summary>
    /// 删除商品
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public int Del_ShopCart(string id, string type)
    {
        try
        {
            if (int.Parse(id) > 0)
            {
                if (HttpContext.Current.Request.Cookies["hqhtshop"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString() != "")
                {
                    string NewPInfo = HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString();
                    string[] ArrayPInfo = NewPInfo.Split('|');

                    bool Newbool = false;
                    string NewNumber = "";
                    for (int i = 0; i < ArrayPInfo.Length; i++)
                    {
                        if (ArrayPInfo[i] != "" && ArrayPInfo[i].Split(',')[0] == id)
                        {
                            Newbool = true;
                            NewNumber = ArrayPInfo[i].Split(',')[1];
                        }
                    }
                    if (Newbool)
                    {
                        NewPInfo = ("|" + NewPInfo).Replace("|" + id + "," + NewNumber + "," + type, "");
                        NewPInfo = NewPInfo.Trim('|'); HttpCookie cookie = HttpContext.Current.Request.Cookies["hqhtshop"];
                        cookie.Values["PInfo"] = NewPInfo.Trim('|');
                        HttpContext.Current.Response.Cookies.Set(cookie);
                    }
                }
            }
        }
        catch
        {
            return 0;
        }
        return 1;
    }
    /// <summary>
    /// 清空购物车
    /// </summary>
    /// <returns></returns>
    public int Clear_ShopCart()
    {
        if (HttpContext.Current.Request.Cookies["hqhtshop"] != null)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["hqhtshop"];
            cookie.Values["PInfo"] = "";
            HttpContext.Current.Response.Cookies.Set(cookie);
        }
        return 1;
    }
    /// <summary>
    /// 获取某一条信息
    /// </summary>
    /// <param name="pid"></param>
    /// <returns></returns>
    public string Get_Info(string pid)
    {
        string info = "";
        if (HttpContext.Current.Request.Cookies["hqhtshop"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"] != "")
        {
            string PInfo = HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString();
            string[] ArrayPInfo = PInfo.Split('|');
            for (int i = 0; i < ArrayPInfo.Length; i++)
            {
                if (ArrayPInfo[i] != "" && ArrayPInfo[i].Split(',')[0] == pid)
                {
                    info = ArrayPInfo[i];
                }
            }
        }
        return info;

    }
    /// <summary>
    /// 积分商品兑换
    /// </summary>
    /// <param name="m_member"></param>
    /// <param name="m_mobile"></param>
    /// <param name="m_product"></param>
    /// <param name="number">正为加 负为减</param>
    /// <param name="count">此商品数量</param>
    /// <param name="price">此商品价格</param>
    /// <param name="AllCount">商品数量</param>
    /// <param name="AllPrice">商品总价</param>
    /// <returns>
    /// 0.发生错误    1.成功    2.保留    3.没有登录  4.参数错误  5.积分不足 
    /// 6.数量至少一 7.没有上架  8.没有找到商品    9.等级超过  10.等级商品只能购买一件 
    /// 11.跨等级    12.没有开通积分手机
    /// </returns>
    public int duihuan(t_Member m_member, t_IntegralMobile m_mobile, vw_IntegralProduct m_product, int number, ref int count, ref int price, ref int AllCount, ref int AllPrice)
    {
        try
        {
            if (m_product == null) { return 8; }
            if (m_product.i_Show == 0) { return 7; }
            //if (m_member == null) { return 3; }
            //if (m_mobile == null) { return 12; }
            if (m_mobile == null) { return 3; }  //machunhui
            if (m_product.i_Show == 0) { return 7; }
            int id = Get_UerId();
            if (id > 0 && (m_product.i_Type == 2 || m_product.i_Type == 3))
            {
                return 13;//说明是登录了，但不是商标或专利会员
            }

            count = 0;
            price = 0;
            AllCount = 0;
            AllPrice = 0;
            bool IsGrade = false;//是否存在等级商品
            int oldNumber = 0;//已存在数量  
            #region 修改购物车
            string PInfo = "";
            if (HttpContext.Current.Request.Cookies["hqhtshop"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"] != null && HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString() != "")
            {
                //获取购物车
                PInfo = HttpContext.Current.Request.Cookies["hqhtshop"]["PInfo"].ToString();
                string[] ArrayPInfo = PInfo.Split('|');
                bool IsNew = true;//是否不存在购物车中
                for (int i = 0; i < ArrayPInfo.Length; i++)
                {
                    if (int.Parse(ArrayPInfo[i].Split(',')[2]) == 3)
                    {
                        IsGrade = true;
                    }
                    if (ArrayPInfo[i] != "" && int.Parse(ArrayPInfo[i].Split(',')[0]) == m_product.i_Id)
                    {
                        IsNew = false;
                        oldNumber = int.Parse(ArrayPInfo[i].Split(',')[1]);
                    }
                }
                if (IsNew)
                {
                    PInfo += "|" + m_product.i_Id + "," + number + "," + m_product.i_Type;
                }
                else
                {
                    string oinfo = "|" + m_product.i_Id + "," + oldNumber + "," + m_product.i_Type;
                    string ninfo = "|" + m_product.i_Id + "," + (oldNumber + number) + "," + m_product.i_Type;
                    PInfo = ("|" + PInfo).Replace(oinfo, ninfo);
                }
            }
            else
            {
                PInfo = m_product.i_Id + "," + number + "," + m_product.i_Type;
            }
            #endregion
            #region 计算购物车
            count = oldNumber + number;
            price = m_product.i_NeedIntegral * count;
            AllCount = Set_ShopCartNumber() + number;
            AllPrice = Set_ShopCartIntegral() + m_product.i_NeedIntegral * number;
            #endregion
            #region 验证购物车
            if (count <= 0)
            {
                return 6;
            }
            if (AllPrice > m_mobile.i_Integral)
            {
                return 5;
            }
            var m_grade = DALG.UserGrade_Select_Id(m_member.i_Grade);
            if (m_product.i_Grade - m_grade.i_Grade <= 0)
            {
                return 9;
            }
            if (m_product.i_Grade - m_grade.i_Grade > 1)
            {
                return 11;
            }
            if (IsGrade && count > 1 && m_product.i_Type == 3)
            {
                return 10;
            }
            #endregion
            //验证通过 设置cookie
            HttpCookie cookie = HttpContext.Current.Request.Cookies["hqhtshop"];
            cookie.Values["PInfo"] = PInfo.Trim('|');
            HttpContext.Current.Response.Cookies.Set(cookie);

        }
        catch(Exception ex)
        {
            return 0;
        }
        return 1;
    }
}
