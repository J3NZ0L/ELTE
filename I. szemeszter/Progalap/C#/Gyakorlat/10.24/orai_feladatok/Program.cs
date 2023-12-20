internal class Program
{
    public static void vec_inc(int[] x){
       for (int i=0;i<x.Length;i++){
            x[i]=x[i]+1;
        }; 
    }
    
    public static void array_flip(int[] x){
        int a;
        for(int i=0; i<(x.Length)/2; i++){
            a=x[i];
            x[i]=x[(x.Length)-1-i];
            x[(x.Length)-1-i]=a;
        }
    }

    public struct vektor{
        public int x,y;
    }

    public static int scalar_product(vektor v1, vektor v2){
            return v1.x*v2.x+v1.y*v2.y;
    }

    public static void tokeletes_szamok(int n){
        
        for (int j=1; j<=n;j++){
            int s=0;
            //Console.WriteLine(j+": ");
            for (int i=1; i<=j/2; i++){
                if (j%i==0){
                    s+=i;
                }
            }
            //Console.WriteLine("s"+j+": "+s);
            if (s==j){
                Console.WriteLine(j);
            }
        }
    }

public static void tomb_lepteto(int[] T, int length){
    for (int i=0; i<length-1; i++){
        T[i]=T[i+1];
    }
    T[length-1]=0;
}


    private static void Main(string[] args)
    {
        int[] N= {0, 1, 2, 3};
        //vec_inc(N);
        //array_flip(N);
        //Console.WriteLine(N[0]);   
        vektor A;
        vektor B;
        A.x=2;
        A.y=3;
        B.x=4;
        B.y=5;
        //Console.WriteLine(scalar_product(A,B));
        //tokeletes_szamok(10000);
        tomb_lepteto(N,4);
        Console.WriteLine(N[0]+", "+N[3]);
    }
}