namespace Előrejelzések_maximuma_legnagyobb
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //System.Console.WriteLine("Bemenet");
            string sor = System.Console.ReadLine();
            int telepulesszam = int.Parse(sor.Split(' ')[0]);
            int napokszama = int.Parse(sor.Split(' ')[1]);
            int homersekletkorlat = int.Parse(sor.Split(' ')[2]);
            int[,] Elorejelzesek = new int[telepulesszam,napokszama];
            int maxi = 0;
            int maxj = 0;
            for (int i = 0; i < telepulesszam; i++)
            {
                sor = System.Console.ReadLine();
                for (int j = 0; j < napokszama; j++)
                {
                    Elorejelzesek[i, j] = int.Parse(sor.Split(' ')[j]);
                    if (Elorejelzesek[i, j] > Elorejelzesek[maxi,maxj])
                    {
                        maxi= i;
                        maxj= j;
                    } 
                }
            }
            System.Console.WriteLine(maxi+1);
        }
    }
}