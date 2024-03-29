﻿/*
  Készítette: Jeney Zoltán
  Neptun: DB7ZTC
  E-mail: jeneyzoltan2@gmail.com
  Feladat: Legkisebb ingadozású települések
*/

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
            int[] vec = new int[M];
            for (int j = 0; j < M; j++)
            {
                vec[j] = Matr[i, j];
            }
            int maxind, maxert, minert, minind;
            (maxind, maxert) = Max(vec, (a, b) => a > b);
            (minind, minert) = Min(vec, (a, b) => a < b);
            return (Math.Abs(minert - maxert));
        }
        public static int soringadozasmin(int N, int M, int[,] Matr)
        {
            int seged;
            int minert = soringadozas(0, M, Matr);
            for (int i = 0; i < N; i++)
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
            //bemeneti változó deklarálása
            int[,] elorejelzes;
            //kimenet deklarálása
            List<int> y = new List<int>();
            elorejelzes = bekeres();
            y = kivalogatas(elorejelzes);
            kiiratas(y);
        }

        static void kiiratas(List<int> y)
        {
            Console.Write(y.Count);
            Console.Write(' ');
            for (int i = 0; i < y.Count; i++)
            {
                Console.Write((y[i] + 1) + " ");
            }
        }
        static List<int> kivalogatas(int[,] matrix)
        {
            List<int> y = new List<int>();
            int vsoringadozasmin = soringadozasmin(matrix.GetLength(0), matrix.GetLength(1), matrix);
            bool T(int k)
            {
                return vsoringadozasmin == soringadozas(k, matrix.GetLength(1), matrix);
            }
            //Kivalogatas

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                if (T(i))
                {
                    y.Add(i);
                }
            }
            return y;
        }
        static int[,] bekeres()
        {
            {
                if (Console.IsInputRedirected)
                {
                    return bekeres_biro();
                }
                else
                {
                    return bekeres_kezi();
                }
            }
        }

        public static int[,] bekeres_biro()
        {
            string S = Console.ReadLine();
            int N;
            int M;
            M = int.Parse(S.Split(' ')[1]);
            N = int.Parse(S.Split(' ')[0]);
            string[] sorbaszamok = new string[M];
            int[,] elorejelzes = new int[N, M];
            for (int i = 0; i < N; i++)
            {
                sorbaszamok = (Console.ReadLine().Split(' '));
                for (int j = 0; j < M; j++)
                {
                    elorejelzes[i, j] = int.Parse(sorbaszamok[j]);
                }
            }
            return elorejelzes;
        }
        static int[,] bekeres_kezi() {
            Console.WriteLine("Irja be szokozzel elvalasztva, hany telepules es hany nap van!");
            string S = Console.ReadLine();
            int N;
            int M;
            while (!int.TryParse(S.Split(' ')[0], out N) || !int.TryParse(S.Split(' ')[1], out M))
            {
                Console.WriteLine("Hibas (nem szamertekkel biro) adat(ok), irja be ujra oket: ");
                S = Console.ReadLine();
            }

            while (N < 1 || N > 1000)
            {
                Console.WriteLine("Hibas telepules ertek (tartomanyon(1..1000) kivul eso adat), irja be ujra: ");
                N = int.Parse(Console.ReadLine());
            }

            while (M < 1 || M > 1000)
            {
                Console.WriteLine("Hibas nap ertek (tartomanyon(1..1000) kivul eso adat), irja be ujra: ");
                M = int.Parse(Console.ReadLine());
            }
            Console.WriteLine("Irja be sorrol sorra a telepulesek napi homersekleteit:");
            string[] sorbaszamok = new string[M];
            int[,] elorejelzes = new int[N, M];
            for (int i = 0; i < N; i++)
            {
                sorbaszamok = (Console.ReadLine().Split(' '));
                for (int j = 0; j < M; j++)
                {
                    elorejelzes[i, j] = int.Parse(sorbaszamok[j]);
                    if (elorejelzes[i, j] < -50 || elorejelzes[i, j] > 50)
                    {
                        Console.WriteLine("Hibas adat");
                    }
                }
            }
            return elorejelzes;
        }                 
    }
}
