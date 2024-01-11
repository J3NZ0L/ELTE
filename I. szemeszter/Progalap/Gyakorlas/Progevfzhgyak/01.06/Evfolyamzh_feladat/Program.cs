using System;
using System.Collections.Generic;
using System.Linq;

namespace Evfolyamzh_feladat
{
    internal class Program
    {
        public struct Ora
        {
            public string nev;
            public int tanarssz;
            public int oraszam;
            public string osztalyaz;
        }
        public static bool volte(List<string> lista, string oranev)
        {
            int i = 0;
            while (i<lista.Count && lista[i] != oranev)
            {
                i++;
            }
            return i<lista.Count;
        }
        static void Main(string[] args)
        {
            //Beolvasas
            //1. sor
            string[] elsosortomb = Console.ReadLine().Split(' ');;
            int N = int.Parse(elsosortomb[0]);
            int T = int.Parse((elsosortomb[1]));
            string OA = elsosortomb[2];
            //Tanarok
            string[] tanartomb = new string[T];
            for (int i = 0; i < T; i++) {
                tanartomb[i] = Console.ReadLine();
            }
            //Orak
            Ora[] oratomb = new Ora[N];
            for (int i = 0;i < N; i++)
            {
                oratomb[i].nev = Console.ReadLine();
                oratomb[i].tanarssz = int.Parse(Console.ReadLine());
                oratomb[i].oraszam = int.Parse(Console.ReadLine());
                oratomb[i].osztalyaz= Console.ReadLine();

            }
            //a. feladat: oszzegzesek
            Console.WriteLine();
            int sum;
            for(int i = 0; i < T; i++)
            {
                sum = 0;
                for (int j = 0; j < N; j++)
                {
                    if (oratomb[j].tanarssz == i+1)
                    {
                        sum += oratomb[j].oraszam;
                    }
                }
                Console.Write(sum+" ");
            }
            //b. feladat: maxkivalasztas
            int maxertek=0;
            int maxindex = 0;
            for (int i = 0; i < T; i++)
            {
                sum = 0;
                for (int j = 0; j < N; j++)
                {
                    if (oratomb[j].tanarssz == i + 1)
                    {
                        sum += oratomb[j].oraszam;
                    }
                }
                if (sum >= maxertek)
                {
                    maxertek = sum;
                    maxindex = i;
                }
            }
            Console.WriteLine();
            Console.WriteLine(tanartomb[maxindex]);
            //c. feladat: kivalogatas
            List<string> oralista= new List<string>();
            for (int i = 0; i < N; i++)
            {
                if (oratomb[i].osztalyaz == OA)
                {
                    oralista.Add(oratomb[i].nev);
                }
            }
            Console.Write(oralista.Count);
            if (oralista.Count > 0)
            {
                for (int i = 0; i < oralista.Count; i++)
                {
                    Console.Write("," + oralista[i]);
                }
            }
            Console.WriteLine();
            //d. feladat: kivalogatasban eldontes
            List<string> tanitottorak = new List<string>();
            for (int i=0; i<N; i++)
            {
                if (!volte(tanitottorak, oratomb[i].nev))
                {
                    tanitottorak.Add(oratomb[i].nev);
                }
            }
            Console.Write(tanitottorak.Count);
            if (tanitottorak.Count > 0)
            {
                for (int i = 0; i < tanitottorak.Count; i++)
                {
                    Console.Write("," + tanitottorak[i]);
                }
            }
            
        }
    }
}