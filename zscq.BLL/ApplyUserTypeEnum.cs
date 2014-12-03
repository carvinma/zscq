using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Reflection;

namespace zscq.BLL
{
    /// <summary>
    /// 申请人类别
    /// </summary>
    public enum ApplyUserTypeEnum
    {
        [Description("法人或其他组织")]
        CreateTradeAccount = 0,
        [Description("自然人")] 
        SubmitTradeAccount = 1,
    }
    public static class EnumManager
    { /// <summary>
        /// 返回指定枚举类型的指定值的描述
        /// </summary>
        /// <param name="t">枚举类型</param>
        /// <param name="v">枚举值</param>
        /// <returns></returns>
        public static string GetDescription(System.Type t, object v)
        {
            try
            {
                FieldInfo fi = t.GetField(GetName(t, v));
                DescriptionAttribute[] attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
                return (attributes.Length > 0) ? attributes[0].Description : GetName(t, v);
            }
            catch
            {
                return "UNKNOWN";
            }
        }

        private static string GetName(System.Type t, object v)
        {
            try
            {
                return System.Enum.GetName(t, v);
            }
            catch
            {
                return "UNKNOWN";
            }
        }
    }
}
