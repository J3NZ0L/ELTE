using System;
using System.Collections.Generic;

namespace ConsoleApp1
{
    internal class Program
    {
        #region Maximum-, minimumkiválasztás
        #region Max:Intervallum
        public static (int maxind, H maxert) Max<H>(int e, int u, Func<int, H> f, Func<H, H, bool> isGreater = null)
        {

            bool _isGreater(H a, H b)
            {
                if (a is IComparable<H> aa)
                {
                    return aa.CompareTo(b) > 0;
                }
                else
                {
                    return isGreater != null ? isGreater(a, b) : false;
                }
            }

            H maxert = f(e);
            int maxind = e;
            for (int i = e + 1; i <= u; i++)
            {
                if (_isGreater(f(i), maxert))
                {
                    maxert = f(i);
                    maxind = i;
                }
            }
            return (maxind, maxert);
        }
        #endregion
        #region Max:Tömb transzformátumfüggvénnyel
        public static (int maxind, G maxert) Max<H, G>(H[] arr, Func<H, G> f, Func<G, G, bool> isGreater = null)
        {
            return Max(0, arr.Length - 1, i => f(arr[i]), isGreater);
        }
        #endregion
        #region Max:Tömb
        public static (int maxind, H maxert) Max<H>(H[] arr, Func<H, H, bool> isGreater = null)
        {
            return Max(arr, p => p, isGreater);
        }
        #endregion
        #region Min:Intervallum
        public static (int minind, H minert) Min<H>(int e, int u, Func<int, H> f, Func<H, H, bool> isSmaller = null)
        {

            bool _isSmaller(H a, H b)
            {
                if (a is IComparable<H> aa)
                {
                    return aa.CompareTo(b) < 0;
                }
                else
                {
                    return isSmaller != null ? isSmaller(a, b) : false;
                }
            }

            H minert = f(e);
            int minind = e;
            for (int i = e + 1; i <= u; i++)
            {
                if (_isSmaller(f(i), minert))
                {
                    minert = f(i);
                    minind = i;
                }
            }
            return (minind, minert);
        }

        #endregion
        #region Min:Tömb transzformátumfüggvénnyel
        public static (int minind, G minert) Min<H, G>(H[] arr, Func<H, G> f, Func<G, G, bool> isGreater = null)
        {
            return Min(0, arr.Length - 1, i => f(arr[i]), isGreater);
        }
        #endregion
        #region Min:Tömb
        public static (int minind, H minert) Min<H>(H[] arr, Func<H, H, bool> isGreater = null)
        {
            return Min(arr, p => p, isGreater);
        }
        #endregion
        #endregion
        public static int soringadozas(int i, int M, int[,] Matr)
        {
            int[] vec= new int[M];
            for (int j = 0; j<M; j++)
            {
                vec[j] = Matr[i, j];
            }
            int maxind, maxert,minert,minind;
            (maxind,maxert)=Max(vec, (a,b) => a>b);
            (minind, minert) = Min(vec, (a, b) => a<b);
            return (Math.Abs(minert - maxert));
        }
        public static int soringadozasmin(int N, int M, int[,] Matr)
        {
            int seged;
            int minert=soringadozas(0,M,Matr);
            for (int i=0; i<N; i++)
            {
                seged = soringadozas(i, M, Matr);
                if (minert > seged)
                {
                    minert = seged;
                }
            }
            return (minert);
        }
        static void Main(string[] args)
        {
            string S=Console.ReadLine();
            int N=int.Parse(S.Split(' ')[0]);
            int M = int.Parse(S.Split(' ')[1]);            
            int[,] elorejelzes=new int[N,M];
            string[] sorbaszamok = new string[M];
   
            for (int i=0; i<N; i++)
            {
                sorbaszamok= (Console.ReadLine().Split(' '));
                for (int j=0; j<M; j++)
                {
                    elorejelzes[i, j] = int.Parse(sorbaszamok[j]);
                }
            }
            int vsoringadozasmin=soringadozasmin(N,M,elorejelzes);
            bool T(int i)
            {
                return vsoringadozasmin == soringadozas(i, M, elorejelzes);
            }
            //Kivalogatas
            List<int> y=new List<int>();            
            for (int i=0; i<N; i++)
            {
                if (T(i))
                {
                    y.Add(i);
                }
            }
            //Kimenet
            Console.Write(y.Count);
            Console.Write(' ');
            for (int i=0; i<y.Count; i++)
            {
                Console.Write((y[i]+1) + " ");
            }
        }
    }
}