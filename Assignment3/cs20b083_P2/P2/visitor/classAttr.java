package visitor;

import java.util.*;

public class classAttr {
	String name;
    String parent;
	ArrayList<varAttr> varList;
	ArrayList<methAttr> methList;
	classAttr(String name, String parent) {
		this.name = name;
		this.parent = parent;
		varList = new ArrayList<varAttr>();
		methList = new ArrayList<methAttr>();
	}
	
}
