class lol {
    public static void main(String[] args) {
        System.out.println(new huh().wut(49));
    }
}

class huh
{
    public int wut(int x)
    {
        int ans;

        if(x<=0) 
        {
            ans=x;
        }
        else 
        {
            ans=x+(this.wut(x-1));
        }

        return ans;
    }
}
