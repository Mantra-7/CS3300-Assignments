import java.util.*;

public class gen {
    String[] types={"NOOP", "ERROR", "CJUMP", "JUMP", "MOVE",
                    "HSTORE", "HLOAD", "PRINT"};
    Map<String, Integer> numTemp = new HashMap<String,Integer>();
    
    public static void main(String[] args)
    {
        Set<Integer> notSpilled = new HashSet<Integer>();
        for(int i=0; i<16; i++)
            notSpilled.add(i);

        Set<Integer> spilled = new HashSet<Integer>();
        for(int i=16; i<32; i++)
            spilled.add(i);

        print("MAIN [0]");
        print("BEGIN");
        for(int i=16; i<32; i++)
            print("MOVE TEMP "+i+" "+i);
        for(int i=0; i<16; i++)
            print("MOVE TEMP "+i+" "+i);

        //MOVE
        print("MOVE TEMP 16 TEMP 17");
        print("MOVE TEMP 16 TEMP 1");
        print("MOVE TEMP 1 TEMP 17");
        print("MOVE TEMP 1 TEMP 2");
        print("MOVE TEMP 1 TEMP 1");
        print("MOVE TEMP 16 TEMP 16");

        //HALLOCATE
        print("MOVE TEMP 18 HALLOCATE 4");
        print("MOVE TEMP 3 HALLOCATE 4");
        print("MOVE TEMP 3 HALLOCATE TEMP 8");
        print("MOVE TEMP 19 HALLOCATE TEMP 12");
        print("MOVE TEMP 3 HALLOCATE TEMP 20");
        print("MOVE TEMP 18 HALLOCATE TEMP 20");
        print("MOVE TEMP 20 HALLOCATE TEMP 20");
        print("MOVE TEMP 8 HALLOCATE TEMP 8");

        //binop
        print("MOVE TEMP 21 PLUS TEMP 1 1");

            // nsp nsp nsp
            print("MOVE TEMP 5 PLUS TEMP 1 TEMP 2");
            print("MOVE TEMP 5 MINUS TEMP 1 TEMP 2");
            print("MOVE TEMP 5 TIMES TEMP 1 TEMP 2");
            print("MOVE TEMP 5 DIV TEMP 1 TEMP 2");
            print("MOVE TEMP 5 LE TEMP 1 TEMP 2");
            print("MOVE TEMP 5 NE TEMP 1 TEMP 2");
            print("MOVE TEMP 5 PLUS TEMP 1 TEMP 1");
            print("MOVE TEMP 1 PLUS TEMP 5 TEMP 1");
            print("MOVE TEMP 1 PLUS TEMP 1 TEMP 5");
            print("MOVE TEMP 1 PLUS TEMP 1 TEMP 1");

            // sp nsp nsp
            print("MOVE TEMP 21 PLUS TEMP 1 TEMP 2");
            print("MOVE TEMP 21 MINUS TEMP 1 TEMP 2");
            print("MOVE TEMP 21 TIMES TEMP 1 TEMP 2");
            print("MOVE TEMP 21 DIV TEMP 1 TEMP 2");
            print("MOVE TEMP 21 LE TEMP 1 TEMP 2");
            print("MOVE TEMP 21 NE TEMP 1 TEMP 2");
            print("MOVE TEMP 21 PLUS TEMP 1 TEMP 1");

            // nsp sp nsp
            print("MOVE TEMP 5 PLUS TEMP 21 TEMP 2");
            print("MOVE TEMP 5 MINUS TEMP 21 TEMP 2");
            print("MOVE TEMP 5 TIMES TEMP 21 TEMP 2");
            print("MOVE TEMP 5 DIV TEMP 21 TEMP 2");
            print("MOVE TEMP 5 LE TEMP 21 TEMP 2");
            print("MOVE TEMP 5 NE TEMP 21 TEMP 2");
            print("MOVE TEMP 5 PLUS TEMP 21 TEMP 1");

            // nsp nsp sp
            print("MOVE TEMP 5 PLUS TEMP 1 TEMP 21");
            print("MOVE TEMP 5 MINUS TEMP 1 TEMP 21");
            print("MOVE TEMP 5 TIMES TEMP 1 TEMP 21");
            print("MOVE TEMP 5 DIV TEMP 1 TEMP 21");
            print("MOVE TEMP 5 LE TEMP 1 TEMP 21");
            print("MOVE TEMP 5 NE TEMP 1 TEMP 21");
            print("MOVE TEMP 5 PLUS TEMP 5 TEMP 22");

            // sp sp sp
            print("MOVE TEMP 21 PLUS TEMP 22 TEMP 23");
            print("MOVE TEMP 21 MINUS TEMP 22 TEMP 23");
            print("MOVE TEMP 21 TIMES TEMP 22 TEMP 23");
            print("MOVE TEMP 21 DIV TEMP 22 TEMP 23");
            print("MOVE TEMP 21 LE TEMP 22 TEMP 23");
            print("MOVE TEMP 21 NE TEMP 22 TEMP 23");
            print("MOVE TEMP 22 PLUS TEMP 21 TEMP 21");
            print("MOVE TEMP 21 PLUS TEMP 22 TEMP 21");
            print("MOVE TEMP 21 PLUS TEMP 21 TEMP 22");
            print("MOVE TEMP 21 PLUS TEMP 21 TEMP 21");

            // sp sp nsp
            print("MOVE TEMP 21 PLUS TEMP 22 TEMP 2");
            print("MOVE TEMP 21 MINUS TEMP 22 TEMP 2");
            print("MOVE TEMP 21 TIMES TEMP 22 TEMP 2");
            print("MOVE TEMP 21 DIV TEMP 22 TEMP 2");
            print("MOVE TEMP 21 LE TEMP 22 TEMP 2");
            print("MOVE TEMP 21 NE TEMP 22 TEMP 2");
            print("MOVE TEMP 22 PLUS TEMP 22 TEMP 4");

            // sp nsp sp
            print("MOVE TEMP 21 PLUS TEMP 1 TEMP 22");
            print("MOVE TEMP 21 MINUS TEMP 1 TEMP 22");
            print("MOVE TEMP 21 TIMES TEMP 1 TEMP 22");
            print("MOVE TEMP 21 DIV TEMP 1 TEMP 22");
            print("MOVE TEMP 21 LE TEMP 1 TEMP 22");
            print("MOVE TEMP 21 NE TEMP 1 TEMP 21");

            // nsp sp sp
            print("MOVE TEMP 1 PLUS TEMP 21 TEMP 22");
            print("MOVE TEMP 1 MINUS TEMP 21 TEMP 22");
            print("MOVE TEMP 1 TIMES TEMP 21 TEMP 22");
            print("MOVE TEMP 1 DIV TEMP 21 TEMP 22");
            print("MOVE TEMP 1 LE TEMP 21 TEMP 22");
            print("MOVE TEMP 1 NE TEMP 21 TEMP 21");

        //heap is 3, 8, 18, 19, 20
        //hstore
        print("HSTORE TEMP 3 0 TEMP 1");
        print("HSTORE TEMP 3 4 TEMP 25");
        print("HSTORE TEMP 3 4 TEMP 8");
        print("HSTORE TEMP 3 4 TEMP 20");
        print("HSTORE TEMP 18 0 TEMP 1");
        print("HSTORE TEMP 18 4 TEMP 3");
        print("HSTORE TEMP 18 4 TEMP 20");
        print("HSTORE TEMP 18 4 TEMP 25");
        print("HSTORE TEMP 19 0 TEMP 19");
        print("HSTORE TEMP 8 0 TEMP 8");

        //hload
        print("HLOAD TEMP 1 TEMP 3 0");
        print("HLOAD TEMP 1 TEMP 3 4");
        print("HLOAD TEMP 16 TEMP 3 0");
        print("HLOAD TEMP 16 TEMP 3 4");
        print("HLOAD TEMP 1 TEMP 19 0");
        print("HLOAD TEMP 1 TEMP 19 4");
        print("HLOAD TEMP 16 TEMP 19 0");
        print("HLOAD TEMP 16 TEMP 19 4");
        print("HLOAD TEMP 19 TEMP 19 0");
        print("HLOAD TEMP 19 TEMP 19 0");
        print("HLOAD TEMP 8 TEMP 8 0");
        print("HLOAD TEMP 8 TEMP 8 0");

        for(int i=0; i<16; i++)
            print("PRINT TEMP "+i);
        for(int i=16; i<32; i++)
            print("PRINT TEMP "+i);
        print("END");
    }

    static void print(String s)
    {
        System.out.println(s);
    }
}
