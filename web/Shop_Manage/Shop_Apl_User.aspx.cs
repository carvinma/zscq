using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Aspose.Cells;
using zscq.Model;
using zscq.DAL;
using System.Text;
public partial class Shop_Manage_Shop_Apl_Patent : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(11, 0);
    public bool pageadd = Manager.GetManagerQX(11, 1);
    public bool pagedaoru = Manager.GetManagerQX(11, 4);
    DataZscqDataContext dzdc = new DataZscqDataContext();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    public int MaxOrderBy = 0,usertype=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (Request["type"] != null)
        {
            usertype =Convert.ToInt32(Request["type"]);
        }
        div_a.InnerHtml = "";
        if (!pageadd)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.ful_price.HasFile)
        {
            string fileExt = System.IO.Path.GetExtension(ful_price.FileName);
            if (fileExt == ".xlsx" || fileExt == ".xls")
            {
                string fileadress = Server.MapPath("FileLoad") + "\\" + "shop_apl_user_" + DateTime.Now.ToString("yyMMddHHmmss") + fileExt;
                this.ful_price.SaveAs(fileadress);
                Cells cells;
                Workbook wb = new Workbook();
                wb.Open(fileadress);
                cells = wb.Worksheets[0].Cells;
                try
                {
                    if (cells.MaxDataRow > 0)
                    {
                        if (Request["type"] != null && Request["type"].ToString() == "1")
                        {
                            #region 专利客户
                            int ok = 0;
                            for (int i = 3; i < cells.MaxDataRow + 1; i++)
                            {
                                #region
                                t_Member model = new t_Member();
                                model.nvc_Name = cells[i, 1].StringValue;//登陆名
                                model.nvc_PassWord = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(cells[i, 2].StringValue, "MD5");
                                model.i_UserTypeId = Convert.ToInt32(cells[i, 3].StringValue);//类型
                                model.nvc_RealName = cells[i, 4].StringValue;
                                model.nvc_EnglishName = cells[i, 5].StringValue;
                                model.i_GuoJiId = DALN.Nationality_Select_Name(cells[i, 6].StringValue, "cn").i_Id;//所属国家
                                model.nvc_Address = cells[i, 7].StringValue;
                                model.nvc_ZipCode = cells[i, 8].StringValue;
                                model.nvc_EnAddress = cells[i, 9].StringValue;
                                model.nvc_CompanyHomePage = cells[i, 10].StringValue;
                                model.nvc_LinkName = cells[i, 11].StringValue;
                                model.i_IsSend = cells[i, 12].StringValue == "是" ? 1 : 0;//短信到期提醒

                                model.nvc_IDCard = cells[i, 13].StringValue;
                                model.nvc_MobilePhone = cells[i, 14].StringValue;
                                model.nvc_LinkManFax = cells[i, 15].StringValue;
                                model.nvc_TelPhone = cells[i, 16].StringValue;

                                model.nvc_Email = cells[i, 17].StringValue;
                                model.nt_BYEmail = cells[i, 18].StringValue;
                                model.nvc_LinkManQQ = cells[i, 19].StringValue;
                                model.nvc_LinkManSKYPE = cells[i, 20].StringValue;
                                model.nvc_LinkManMSN = cells[i, 21].StringValue;
                                model.i_Sex = cells[i, 22].StringValue == "男" ? 1 : 0;

                                model.i_MemberType = 1;//专利客户

                                model.nvc_UserNum = DALM.SetMemberNumber(model.i_MemberType, Convert.ToInt32(model.i_UserTypeId), Convert.ToInt32(model.i_GuoJiId));
                                model.nvc_Flag = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile("yghdnet.com" + model.nvc_UserNum, "MD5") + "-" + Guid.NewGuid();
                                if (DALM.Member_Add(model) == 1)
                                {
                                    ok++;
                                }
                                #endregion
                            }
                            Manager.AddLog(0, "客户管理", "批量导入客户");
                            div_a.InnerHtml = "<script>alert('操作成功！成功导入" + (ok) + "条数据')</script>";
                            #endregion
                        }
                        else if (Request["type"] != null && Request["type"].ToString() == "2")
                        {
                            #region 商标客户
                            int ok = 0;
                            for (int i = 3; i < cells.MaxDataRow + 1; i++)
                            {
                                #region
                                t_Member model = new t_Member();
                                model.nvc_Name = cells[i, 1].StringValue;//登陆名
                                model.nvc_PassWord = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(cells[i, 2].StringValue, "MD5");
                                model.i_UserTypeId = Convert.ToInt32(cells[i, 3].StringValue);//类型

                                model.nvc_Company = cells[i, 4].StringValue;//公司名称
                                model.nvc_DaiLiName=cells[i, 5].StringValue;//代理机构名称

                                model.nvc_RealName = cells[i, 6].StringValue;
                                model.nvc_EnglishName = cells[i, 7].StringValue;
                                model.i_GuoJiId = DALN.Nationality_Select_Name(cells[i, 8].StringValue, "cn").i_Id;//所属国家
                                model.nvc_Address = cells[i, 9].StringValue;
                                model.nvc_ZipCode = cells[i, 10].StringValue;
                                model.nvc_Address = cells[i, 11].StringValue;
                                model.nvc_CompanyHomePage = cells[i, 12].StringValue;
                                model.nvc_LinkName = cells[i, 13].StringValue;
                                model.i_IsSend = cells[i, 14].StringValue == "是" ? 1 : 0;//短信到期提醒

                                model.nvc_IDCard = cells[i, 15].StringValue;
                                model.nvc_MobilePhone = cells[i, 16].StringValue;
                                model.nvc_LinkManFax = cells[i, 17].StringValue;
                                model.nvc_TelPhone = cells[i, 18].StringValue;

                                model.nvc_Email = cells[i, 19].StringValue;
                                model.nt_BYEmail = cells[i, 20].StringValue;
                                model.nvc_LinkManQQ = cells[i, 21].StringValue;
                                model.nvc_LinkManSKYPE = cells[i, 22].StringValue;
                                model.nvc_LinkManMSN = cells[i, 23].StringValue;
                                model.i_Sex = cells[i, 24].StringValue == "男" ? 1 : 0;

                                model.i_MemberType = 2;//专利客户


                                model.nvc_UserNum = DALM.SetMemberNumber(model.i_MemberType, Convert.ToInt32(model.i_UserTypeId), Convert.ToInt32(model.i_GuoJiId));
                                model.nvc_Flag = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile("yghdnet.com" + model.nvc_UserNum, "MD5") + "-" + Guid.NewGuid();
                                if (DALM.Member_Add(model) == 1)
                                {
                                    ok++;
                                }
                                #endregion
                            }
                            Manager.AddLog(0, "客户管理", "批量导入客户");
                            div_a.InnerHtml = "<script>alert('操作成功！成功导入" + (ok) + "条数据')</script>";
                            #endregion
                        }
                    }
                    else
                    {
                        div_a.InnerHtml = "<script>alert('没有数据！')</script>";
                    }
                }
                catch (Exception ex)
                {
                    div_a.InnerHtml = "<script>alert('" + ex.Message + "')</script>";
                }
            }
            else
            {
                div_a.InnerHtml = "<script>alert('请上传Excel表格！')</script>";
            }
        }
    }
}