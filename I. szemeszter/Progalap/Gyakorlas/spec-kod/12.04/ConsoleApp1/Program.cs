using System.ComponentModel.DataAnnotations;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("
            List<int> felhasznalolista = new List<int>();
            felhasznalolista.Add(1);
            //felhasznalolista[0] = 2;
            felhasznalolista.Add(2);
            felhasznalolista.Add(1);
            //felhasznalolista[1] = 3;
            //felhasznalolista.Remove(1);
            felhasznalolista.RemoveRange(1, 1);
            for (int i = 0; i<felhasznalolista.Count ; i++) { 
                Console.WriteLine(felhasznalolista[i]);
            }
        }
    }
}