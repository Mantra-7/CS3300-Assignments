package visitor;

import java.util.*;

public class SymbolTable {
    Map<String, funcAttr> funcTable;

    public SymbolTable() {
        funcTable = new HashMap<String, funcAttr>();
    }

    public void process()
    {
        for (Map.Entry<String, funcAttr> elem : funcTable.entrySet())
        {
            elem.getValue().processLabels();
            elem.getValue().blocks.get(elem.getValue().blocks.size()-1).succ.clear();
            elem.getValue().getInOut();
            elem.getValue().getLiveRange();
            elem.getValue().linearScan();
            elem.getValue().getNums();
        }
    }

    public void print()
    {
        for (String s : funcTable.keySet())
        {
            System.out.println(s+":");
            funcTable.get(s).print("\t");
        }
    }
}
