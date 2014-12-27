using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.BLL
{
    public class bll_Coupon
    {
        DataZscqDataContext dpdc = new DataZscqDataContext();
        DataMemberDataContext dmdc = new DataMemberDataContext();
        dal_Coupon DALC = new dal_Coupon();
        /// <summary>
        /// 添加现金券
        /// </summary>
        /// <param name="ExpireTime"></param>
        /// <param name="type"></param>
        /// <param name="referral"></param>
        /// <returns></returns>
        public int Coupon_Add(string ExpireTime, string type, string referral, int MemberId, string From)
        {
            var query = from q in dmdc.t_Coupon where q.nvc_Code == referral select q;
            if (query.Count() != 0)
            {
                return 0;
            }
            else
            {
                t_Coupon Coupon = new t_Coupon();
                Coupon.dt_AddTime = DateTime.Now;
                if (!string.IsNullOrEmpty(ExpireTime)) //当为空时，永久有效
                    Coupon.dt_ExpireTime = DateTime.Parse(ExpireTime);
                Coupon.i_State = 1;
                Coupon.i_Type = int.Parse(type);
                Coupon.i_MemberId = MemberId;
                Coupon.nvc_Code = referral;
                Coupon.nvc_From = From;
                return DALC.Coupon_Add(Coupon);
            }
        }
        /// <summary>
        /// 循环生成现金券
        /// </summary>
        /// <param name="Number"></param>
        /// <param name="ExpireTime"></param>
        /// <param name="TypeId"></param>
        /// <param name="MemberId"></param>
        public void Coupon_ForAdd(int Number, string ExpireTime, string TypeId, int MemberId, string From)
        {
            int len = Number;
            int shu = 0;
            string Referral = "";
            for (int i = 0; i < len; i++)
            {
                string rednum = RndNum(10);
                if (Referral.IndexOf(rednum) > 0)
                {
                    shu = shu + 1;
                }
                else
                {
                    Referral += "," + rednum;
                    if (Coupon_Add(ExpireTime, TypeId, rednum, MemberId, From) == 0)
                    {
                        shu = shu + 1;
                    }
                }
            }
            if (shu != 0)
            {
                Coupon_ForAdd(shu, ExpireTime, TypeId, MemberId, From);
            }
        }
        /// <summary>
        /// 生成随机的字母
        /// </summary>
        /// <param name="VcodeNum">生成字母的个数</param>
        /// <returns>string</returns>
        private string RndNum(int VcodeNum)
        {
            string Vchar = "1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,P,Q,R,S,T,U,V,W,X,Y,Z";
            string[] VcArray = Vchar.Split(',');
            string VNum = ""; //由于字符串很短，就不用StringBuilder了
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
}
