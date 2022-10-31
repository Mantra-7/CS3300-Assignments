package visitor;

enum LOC {
	CLASS, METHOD, ARG
}
public class varAttr {
    String name;
	String type;
	String cname;
	String mname;
	Integer offset;
	LOC loc;
	varAttr(String name, String type, String cname, String mname) {
		this.name = name;
		this.type = type;
		this.cname = cname;
		this.mname = mname;
	}
	varAttr(String name, String type, String cname, String mname, Integer offset, LOC loc) {
		this.name = name;
		this.type = type;
		this.cname = cname;
		this.mname = mname;
		this.offset = offset;
		this.loc = loc;
	}

	public varAttr copy()
	{
		return new varAttr(name, type, cname, mname, offset, loc);
	}
} 