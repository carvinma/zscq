using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public static class PredicateExtensions
    {
        public static Expression<Func<T, bool>> True<T>()
        {
            return f => true;
        }
        public static Expression<Func<T, bool>> False<T>()
        {
            return f => false;
        }
        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> expression1, Expression<Func<T, bool>> expression2)
        {
            var invokedExpression = Expression.Invoke(expression2, expression1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>(Expression.Or(expression1.Body, invokedExpression), expression1.Parameters);
        }
        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> expression1, Expression<Func<T, bool>> expression2)
        {
            var invokedExpression = Expression.Invoke(expression2, expression1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>(Expression.And(expression1.Body, invokedExpression), expression1.Parameters);            
        }
        /// <summary>
        /// 通过变通方法实现IN查询。
        /// </summary>
        /// <typeparam name="T">数据集合中的对象。</typeparam>
        /// <typeparam name="V">值类型。</typeparam>
        /// <param name="propertySelector">表达式。</param>
        /// <param name="values">值范围数组。</param>
        /// <returns>IN筛选表达式。</returns>
        public static Expression<Func<T, bool>> BuildWhereInExpression<T, V>(Expression<Func<T, V>> propertySelector, IEnumerable<V> values)
        {
            ParameterExpression p = propertySelector.Parameters.Single();

            if (!values.Any())
            {
                return e => false;
            }

            var equals = values.Select(value => (Expression)Expression.Equal(propertySelector.Body, Expression.Constant(value, typeof(V))));
            var body = equals.Aggregate<Expression>((accumulate, equal) => Expression.Or(accumulate, equal));

            return Expression.Lambda<Func<T, bool>>(body, p);
        }        
    }    
}
