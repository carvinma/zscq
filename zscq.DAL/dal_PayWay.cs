using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_PayWay
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 修改支付方式
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PayWay_Update(t_PayWay model)
        {
            try
            {
                t_PayWay PW = dsdc.t_PayWay.SingleOrDefault(a => a.i_id == model.i_id);
                if (PW != null)
                {
                    PW.nvc_Name = model.nvc_Name;
                    PW.nt_Explain = model.nt_Explain;
                    PW.i_OrderbyNumber = model.i_OrderbyNumber;
                    dsdc.SubmitChanges();
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取全部支付方式
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PayWay> PayWay_Select_All()
        {
            var iquery = from i in dsdc.t_PayWay orderby i.i_OrderbyNumber ascending, i.i_id descending select i;
            return iquery;
        }
        /// <summary>
        /// 根据表id获取某个支付方式
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public t_PayWay PayWay_Select_Id(int Pid)
        {
            try
            {
                t_PayWay PW = dsdc.t_PayWay.SingleOrDefault(a => a.i_id == Pid);
                return PW;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据表Name获取某个支付方式
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public t_PayWay PayWay_Select_Name(string PName)
        {
            try
            {
                t_PayWay PW = dsdc.t_PayWay.SingleOrDefault(a => a.nvc_Name == PName);
                return PW;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 返回支付银行的缩写
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string Set_PayStyle(object obj)
        {
            if (!String.IsNullOrEmpty(obj.ToString()))
            {
                if (obj.ToString() == "1")
                    return "alipay_1";
                else if (obj.ToString() == "2")
                    return "ICBC_OUT";
                else if (obj.ToString() == "3")
                    return "CMB_OUT";
                else if (obj.ToString() == "4")
                    return "CCB_OUT";
                else if (obj.ToString() == "5")
                    return "BOC_OUT";
                else if (obj.ToString() == "6")
                    return "ABC_OUT";
                else if (obj.ToString() == "7")
                    return "COMM_OUT";
                else if (obj.ToString() == "8")
                    return "SPDB_OUT";
                else if (obj.ToString() == "9")
                    return "GDB_OUT";
                else if (obj.ToString() == "10")
                    return "CITIC_OUT";
                else if (obj.ToString() == "11")
                    return "CEB_OUT";
                else if (obj.ToString() == "12")
                    return "CIB_OUT";
                else if (obj.ToString() == "13")
                    return "SDB_OUT";
                else if (obj.ToString() == "14")
                    return "CMBC_OUT";
                else if (obj.ToString() == "15")
                    return "HZCB_OUT";
                else if (obj.ToString() == "16")
                    return "SHBANK_OUT";
                else if (obj.ToString() == "17")
                    return "NBBANK_OUT";
                else if (obj.ToString() == "18")
                    return "SPABANK_OUT";
                else if (obj.ToString() == "19")
                    return "BJRCB_OUT";
                else if (obj.ToString() == "20")
                    return "ENV_ICBC_OUT";
                else if (obj.ToString() == "21")
                    return "ENV_CCB_OUT";
                else if (obj.ToString() == "22")
                    return "ENV_SPDB_OUT";
                else if (obj.ToString() == "23")
                    return "ENV_ABC_OUT";
                else if (obj.ToString() == "24")
                    return "FDB_OUT";
                else
                    return "未知状态";
            }
            else
                return "未知状态";
        }
        /// <summary>
        /// 返回支付方式汉字
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string Set_银行名称(object obj)
        {
            if (!String.IsNullOrEmpty(obj.ToString()))
            {
                if (obj.ToString() == "1")
                    return "支付宝";
                else if (obj.ToString() == "2")
                    return "工商银行";
                else if (obj.ToString() == "3")
                    return "招商银行";
                else if (obj.ToString() == "4")
                    return "建设银行";
                else if (obj.ToString() == "5")
                    return "中国银行";
                else if (obj.ToString() == "6")
                    return "中国农业银行";
                else if (obj.ToString() == "7")
                    return "交通银行";
                else if (obj.ToString() == "8")
                    return "浦发银行";
                else if (obj.ToString() == "9")
                    return "广发银行";
                else if (obj.ToString() == "10")
                    return "中信银行";
                else if (obj.ToString() == "11")
                    return "广大银行";
                else if (obj.ToString() == "12")
                    return "兴业银行";
                else if (obj.ToString() == "13")
                    return "深圳发展银行";
                else if (obj.ToString() == "14")
                    return "民生银行";
                else if (obj.ToString() == "15")
                    return "杭州银行";
                else if (obj.ToString() == "16")
                    return "上海银行";
                else if (obj.ToString() == "17")
                    return "宁波银行";
                else if (obj.ToString() == "18")
                    return "平安银行";
                else if (obj.ToString() == "19")
                    return "北京农村商业银行";
                else if (obj.ToString() == "20")
                    return "工商银行(企业)";
                else if (obj.ToString() == "21")
                    return "建设银行(企业)";
                else if (obj.ToString() == "22")
                    return "浦发银行(企业)";
                else if (obj.ToString() == "23")
                    return "农业银行(企业)";
                else if (obj.ToString() == "24")
                    return "富滇银行";
                else
                    return "未知";
            }
            else
                return "未知";
        }
    }
}
