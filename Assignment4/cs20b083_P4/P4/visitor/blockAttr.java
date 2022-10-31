package visitor;

import java.util.*;

public class blockAttr {
    Set<Integer> use;
    Set<Integer> def;
    Set<Integer> in;
    Set<Integer> out;
    ArrayList<Integer> succ; 

    public blockAttr() {
        use = new HashSet<Integer>();
        def = new HashSet<Integer>();
        in = new HashSet<Integer>();
        out = new HashSet<Integer>();
        succ = new ArrayList<Integer>();
    }

    public void add_use(String s)
    {
        use.add(Integer.parseInt(s));
    }

    public void add_def(String s)
    {
        def.add(Integer.parseInt(s));
    }

    public void print(String pref)
    {
        System.out.println(pref+"Use:"+use);
        System.out.println(pref+"Def:"+def);
        System.out.println(pref+"In:"+in);
        System.out.println(pref+"Out:"+out);
        System.out.println(pref+"Succ:"+succ);
    }
}