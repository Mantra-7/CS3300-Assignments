package visitor;

import java.util.*;

public class methAttr {
	String cname;
    String name;
	String code;
	String retType;
	Integer offset;
	ArrayList<varAttr> varList;
	ArrayList<varAttr> argList;
	methAttr(String name,String retType, String cname) {
		this.name = name;
		this.retType = retType;
		this.cname = cname;
		varList = new ArrayList<varAttr>();
		argList = new ArrayList<varAttr>();
	}

	public methAttr copy()
	{
		methAttr m = new methAttr(name, retType, cname);
		m.code = code;
		m.offset = offset;
		m.varList = new ArrayList<varAttr>();
		m.argList = new ArrayList<varAttr>();
		for(varAttr v : varList)
		{
			m.varList.add(v.copy());
		}
		for(varAttr v : argList)
		{
			m.argList.add(v.copy());
		}
		return m;
	}
}
