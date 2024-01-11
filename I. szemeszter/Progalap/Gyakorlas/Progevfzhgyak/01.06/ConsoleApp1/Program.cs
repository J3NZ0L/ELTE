using System;
using System.Collections.Generic;
using System.Linq;

namespace ConsoleApp1
{
    internal class Program
    {
        public struct Bor
        {
            public int mennyiseg;
            public int ar;
        }
        public static int maxkiv (Bor[] tomb, int n){
            int max = tomb[0].mennyiseg;
            for (int i = 0; i<n; i++)
            {
                if (max< tomb[i].mennyiseg)
                {
                    max = tomb[i].mennyiseg;
                }
            }
            return max;
        }
        static void Main(string[] args)
        {
            //Beolvasás
            string sor = Console.ReadLine();
            int evekszama = int.Parse(sor.Split(' ')[0]);
            int K = int.Parse(sor.Split(' ')[1]);
            Bor[] bortomb = new Bor[evekszama];
            for (int i = 0; i < evekszama; i++)
            {
                sor = Console.ReadLine();
                bortomb[i].mennyiseg = int.Parse(sor.Split(' ')[0]);
                bortomb[i].ar = int.Parse(sor.Split(' ')[1]);
            }
            List<int> evek2000 = new List<int>();
            //1. feladat: Kiválogatás
            for (int i = 0; i < evekszama; i++)
            {
                if (bortomb[i].mennyiseg > 2000)
                {
                    evek2000.Add(i);
                }
            }
            evek2000.OrderBy(n => n);
            Console.Write(evek2000.Count+" ");
            if (evek2000.Count > 0)
            {
                for (int i = 0; i< evek2000.Count; i++)
                {
                    Console.Write(evek2000[i]+" ");
                }
            }
            Console.WriteLine();
            //2. feladat: 
            {
                bool volte = false;
                int egybedb = 0;

                int i = 1;
                while (!volte && i < bortomb.GetLength(0))
                {
                    if (bortomb[i].mennyiseg > bortomb[i - 1].mennyiseg)
                    {
                        egybedb++;
                    }
                    else
                    {
                        egybedb = 1;
                    }
                    if (egybedb == K)
                    {
                        volte = true;
                    }
                    i++;
                }

                if (volte)
                {
                    Console.WriteLine("IGEN");
                } else
                {
                    Console.WriteLine("NEM");
                }
            }
            //3. feladat: Kiválogatás
            {
                if (bortomb.GetLength(0) <= 1)
                {
                    Console.WriteLine(0);
                }
                else
                {
                    List<int> list = new List<int>();
                    for (int i = 1; i < bortomb.GetLength(0); i++)
                    {
                        if (maxkiv(bortomb, i) < bortomb[i].mennyiseg)
                        {
                            list.Add(i+1);
                        }
                    }
                    if (list.Count > 0)
                    {
                        Console.Write(list.Count + " ");
                        list.OrderBy(n => n);
                        for (int i = 0; i < list.Count; i++) { Console.Write(list[i] + " "); }
                    } else
                    {
                        Console.WriteLine(0);
                    }
                }
            }

        }
    }
}