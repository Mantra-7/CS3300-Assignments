package visitor;
import java.util.*;

public class funcAttr {
    String name;
    int numArgs;
    int maxStackSpace;
    int maxArgs;
    int curStackPointer;
    Boolean hasCall;
    Map<String, Integer> labelMap;
    Map<Integer, String> succLabel;
    Map<Integer, tempAttr> tempMap;
    Map<Integer, String> regMap;
    ArrayList<blockAttr> blocks;
    Map<Integer, Integer> spilledTemps;
    Set<String> calledMethods;

    public funcAttr(String name) {
        this.name = name;
        numArgs = 0;
        maxStackSpace = 0;
        maxArgs = 0;
        curStackPointer = 0;
        hasCall = false;
        labelMap = new HashMap<String, Integer>();
        succLabel = new HashMap<Integer, String>();
        tempMap = new HashMap<Integer, tempAttr>();
        regMap = new HashMap<Integer, String>();
        blocks = new ArrayList<blockAttr>();
        spilledTemps = new HashMap<Integer, Integer>();
        calledMethods = new HashSet<String>();
    }

    public void processLabels()
    {
        for (Integer i : succLabel.keySet())
            blocks.get(i).succ.add(labelMap.get(succLabel.get(i)));
    }

    public void getInOut()
    {
        boolean run = true;
        while(run)
        {
            run = false;
            for(int i=blocks.size()-1;i>=0;i--)
            {
                blockAttr battr = blocks.get(i);
                
                Set<Integer> out_bef = new HashSet<Integer>(battr.out);
                Set<Integer> in_bef = new HashSet<Integer>(battr.in);
                Set<Integer> diff = new HashSet<Integer>(battr.out);
                diff.removeAll(battr.def);

                battr.in.clear();
                battr.in.addAll(diff);
                battr.in.addAll(battr.use);

                battr.out.clear();
                for(int j=0;j<battr.succ.size();j++)
                    battr.out.addAll(blocks.get(battr.succ.get(j)).in);
            
                if(!out_bef.equals(battr.out) || !in_bef.equals(battr.in))
                    run = true;
            }
        }
    }

    public void getLiveRange()
    {
        blockAttr battr = blocks.get(0);
        for(Integer i : battr.in)
            if(!tempMap.containsKey(i))
                tempMap.put(i, new tempAttr(0,0));
        
        for(int i=0;i<blocks.size();i++)
        {
            battr = blocks.get(i);
            for(Integer j : battr.out)
                if(!tempMap.containsKey(j))
                    tempMap.put(j, new tempAttr(i,i));

            for(Integer j : battr.in)
            {
                tempAttr tattr = tempMap.get(j);
                tattr.end = i;
            }
        }
    }

    public void linearScan()
    {
        Map<Integer, ArrayList<Integer>> start = new HashMap<Integer, ArrayList<Integer>>();
        Map<Integer, ArrayList<Integer>> end = new HashMap<Integer, ArrayList<Integer>>();

        for(Integer i : tempMap.keySet())
        {
            tempAttr tattr = tempMap.get(i);
            if(!start.containsKey(tattr.start))
                start.put(tattr.start, new ArrayList<Integer>());
            start.get(tattr.start).add(i);

            if(!end.containsKey(tattr.end))
                end.put(tattr.end, new ArrayList<Integer>());
            end.get(tattr.end).add(i);
        }

        SortedSet<Integer> critical = new TreeSet<Integer>();
        critical.addAll(start.keySet());
        critical.addAll(end.keySet());

        String[] regs = {"s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9" };
        SortedSet<String> freeRegs = new TreeSet<String>(Arrays.asList(regs));
        SortedSet<Integer> active = new TreeSet<Integer>(new Comparator<Integer>() {
            @Override
            public int compare(Integer t1, Integer t2) 
            {
                if(tempMap.get(t1).end < tempMap.get(t2).end)
                    return -1;
                else if (tempMap.get(t1).end > tempMap.get(t2).end)
                    return 1;
                else if (t1 != t2)
                    return 1;
                return 0;
            }
        });

        int index = 0;
        for(Integer i : critical)
        {
            if(end.containsKey(i))
                for(Integer j : end.get(i))
                {
                    active.remove(j);
                    if (regMap.containsKey(j)) freeRegs.add(regMap.get(j));
                }

            if(start.containsKey(i)) active.addAll(start.get(i));

            while(active.size() > regs.length)
            {
                Integer last = active.last();
                active.remove(last);
                spilledTemps.put(last, index++);
                if (regMap.containsKey(last))
                {
                    freeRegs.add(regMap.get(last));
                    regMap.remove(last);
                }
            }

            for(Integer j: active)
            {
                if(!regMap.containsKey(j))
                {
                    regMap.put(j, freeRegs.first());
                    freeRegs.remove(regMap.get(j));
                }
            }

            if(i==0)
            {
                if(end.containsKey(i))
                for(Integer j : end.get(i))
                {
                    active.remove(j);
                    if (regMap.containsKey(j)) freeRegs.add(regMap.get(j));
                }
            }
        }
    }

    public void getNums()
    {
        curStackPointer = spilledTemps.size() + Math.max(0, numArgs-4);
        maxStackSpace = spilledTemps.size() + Math.max(0, numArgs-4);
        if(!name.equals("MAIN")) maxStackSpace += 8;
        if(hasCall) maxStackSpace += 10;
    }
    
    String getTemp(int i, String reg, int lc)
	{
        if(!tempMap.containsKey(i)) return "v1";

        if(tempMap.get(i).start>lc || tempMap.get(i).end<lc) return "v1";

		if(spilledTemps.containsKey(i))
			System.out.println("\tALOAD "+reg+" SPILLEDARG " + (Math.max(0, numArgs-4)+spilledTemps.get(i)));
		else if(regMap.containsKey(i)) reg = regMap.get(i);
        else reg="v1";

		return reg;
	}

    void store(String temp, String val, int lc)
    {
        Integer i = Integer.parseInt(temp);
        if(!tempMap.containsKey(i))  System.out.println("\tMOVE v1 " + val);
        else if(tempMap.get(i).start>lc || tempMap.get(i).end<lc)  System.out.println("\tMOVE v1 " + val);
        else if(spilledTemps.containsKey(i))
        {
            System.out.println("\tMOVE v0 "+val);
            System.out.println("\tASTORE SPILLEDARG " + (Math.max(0, numArgs-4)+spilledTemps.get(i)) +" v0");
        }
        else if(regMap.containsKey(i)) System.out.println("\tMOVE " + regMap.get(i) + " " + val);
    }

    void transfer_args(int lc)
    {		
        for(int i=0;i<Math.min(4,numArgs);i++)
            store(Integer.toString(i),"a"+i,lc);
        
        for(int i=4;i<numArgs;i++)
        {
            System.out.println("\tALOAD v0 SPILLEDARG " + (i-4));
            store(Integer.toString(i),"v0",lc);
        }
    }

    public void print(String pref)
    {
        System.out.println(pref+ numArgs + " " + maxStackSpace + " " + maxArgs);
        System.out.println(pref+"Labels:");
        for (String s : labelMap.keySet())
            System.out.println(pref+"\t"+s + " " + labelMap.get(s));
        System.out.println(pref+"Temps:");
        for (Integer i : tempMap.keySet())
            System.out.println(pref+"\t"+i + " " + tempMap.get(i).start + " " + tempMap.get(i).end);
        // System.out.println(pref+"Blocks:");
        // for (int i = 0; i < blocks.size(); i++)
        // {
        //     System.out.println(pref+"\tb"+i+":");
        //     blocks.get(i).print(pref+"\t\t");
        // }
        System.out.println(pref+"Register Allocation:");
        for (Integer i : regMap.keySet())
            System.out.println(pref+"\t"+i + " " + regMap.get(i));
        System.out.println(pref+"Spilled temps:");
        for (Integer i : spilledTemps.keySet())
            System.out.println(pref+"\t"+i + " " + spilledTemps.get(i));
        System.out.println(pref+"Called methods:");
        for (String s : calledMethods)
            System.out.println(pref+"\t"+s);
    }
}