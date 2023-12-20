using System.ComponentModel.Design;

namespace Gyakorlas
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Melyik pozitiv egesz szamra gondolt?");

            int x;
            x= int.Parse(Console.ReadLine());
            if (x>0) {
                Console.WriteLine(x); }
            else
            {
                Console.WriteLine("Ez nem egy pozitiv egesz szam.");
            }
        }
    }
}