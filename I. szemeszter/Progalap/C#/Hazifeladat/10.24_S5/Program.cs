internal class Program
{
    private static void Main(string[] args)
    {
        int[] napszamok = {31,28,31,30,31,30,31,31,30,31,30,31};
        Console.WriteLine("Irjon be egy datumot szokozokkel elvalasztva:");
        string datum = Console.ReadLine();
        int ho=int.Parse(datum.Split(' ')[1]);
        int nap=int.Parse(datum.Split(' ')[2]);
        int s=nap;
        for (int i=0;i<ho-1;i++){
            s+=napszamok[i];
        }
        Console.WriteLine("Az adott nap az ev "+s+". napja.");

    }
}