//
// Generated by JTB 1.3.2
//

package visitor;
import syntaxtree.*;
import java.util.*;

/**
 * Provides default methods which visit each node in the tree in depth-first
 * order.  Your visitors may extend this class.
 */
public class FirstPass<R,A> implements GJVisitor<R,A> {
//
// Auto class visitors--probably don't need to be overridden.
//

	public SymbolTable st = new SymbolTable();
	Integer lc;
	funcAttr curFunc;
	blockAttr curBlock;
	Integer arg_cnt;
		
	public R visit(NodeList n, A argu) {
		R _ret=null;
		int _count=0;
		for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
			e.nextElement().accept(this,argu);
			_count++;
		}
		return _ret;
	}

	public R visit(NodeListOptional n, A argu) {
		if ( n.present() ) {
			R _ret=null;
			int _count=0;
			for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
				e.nextElement().accept(this,argu);
				_count++;
			}
			return _ret;
		}
		else
			return null;
	}

	public R visit(NodeOptional n, A argu) {
		if ( n.present() )
		{
			return n.node.accept(this,argu);
		}
		return null;
	}

	public R visit(NodeSequence n, A argu) {
		R _ret=null;
		int _count=0;
		for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
			e.nextElement().accept(this,argu);
			_count++;
		}
		return _ret;
	}
	
	public R visit(NodeToken n, A argu) { return (R)n.tokenImage; }
	
	//
	// User-generated visitor methods below
	//

		
	/** >Goal ::= MAIN StmtList() END ( Procedure() )* <EOF>
		* f0 -> "MAIN"
		* f1 -> StmtList()
		* f2 -> "END"
		* f3 -> ( Procedure() )*
		* f4 -> <EOF>
		*/
	public R visit(Goal n, A argu) 
	{
		lc = 0;
		curFunc = new funcAttr("MAIN");
		st.funcTable.put("MAIN",curFunc);
		curFunc.numArgs = 0;
		n.f1.accept(this, null);
		n.f3.accept(this, null);
		st.process();
		return null;
	}

	/** >Procedure
		* f0 -> Label()
		* f1 -> "["
		* f2 -> IntegerLiteral()
		* f3 -> "]"
		* f4 -> StmtExp()
		*/
	public R visit(Procedure n, A argu) 
	{
		lc = 0;
		curFunc = new funcAttr(n.f0.f0.tokenImage);
		st.funcTable.put(n.f0.f0.tokenImage, curFunc);
		curFunc.numArgs = Integer.parseInt((String)n.f2.accept(this, null));
		n.f4.accept(this, null);
		return null;
	}
	
	/** >StmtList ::= ( ( Label() )? Stmt() )*
	 * f0 -> ( ( Label() )? Stmt() )*
	 */
	public R visit(StmtList n, A argu) 
	{
		return n.f0.accept(this, (A)"add");
	}
	
	/** >Stmt
		* f0 -> NoOpStmt()
		*       | ErrorStmt()
		*       | CJumpStmt()
		*       | JumpStmt()
		*       | HStoreStmt()
		*       | HLoadStmt()
		*       | MoveStmt()
		*       | PrintStmt()
		*/
	public R visit(Stmt n, A argu) 
	{
		blockAttr battr = new blockAttr();
		curBlock = battr;
		battr.succ.add(lc+1);
		curFunc.blocks.add(curBlock);
		n.f0.accept(this, null);
		lc++;
		return null;
	}

	/** >NoOpStmt ::= NOOP
		* f0 -> "NOOP"
		*/
	public R visit(NoOpStmt n, A argu) 
	{
		return n.f0.accept(this, null);
	}

	/** >ErrorStmt ::= ERROR
		* f0 -> "ERROR"
		*/
	public R visit(ErrorStmt n, A argu) 
	{
		return n.f0.accept(this, null);
	}

	/** >CJumpStmt ::= CJUMP Temp() Label()
		* f0 -> "CJUMP"
		* f1 -> Temp()
		* f2 -> Label()
		*/
	public R visit(CJumpStmt n, A argu) 
	{
		n.f1.accept(this, (A)"use");
		curFunc.succLabel.put(lc, n.f2.f0.tokenImage);
		return null;
	}

	/** >JumpStmt ::= JUMP Label()
		* f0 -> "JUMP"
		* f1 -> Label()
		*/
	public R visit(JumpStmt n, A argu) 
	{
		n.f1.accept(this, null);
		curBlock.succ.remove(curBlock.succ.size()-1);
		curFunc.succLabel.put(lc, n.f1.f0.tokenImage);
		return null;
	}

	/** >HStoreStmt ::= HSTORE Temp() IntegerLiteral() Temp()
		* f0 -> "HSTORE"
		* f1 -> Temp()
		* f2 -> IntegerLiteral()
		* f3 -> Temp()
		*/
	public R visit(HStoreStmt n, A argu) 
	{
		n.f1.accept(this, (A)"use");
		n.f3.accept(this, (A)"use");
		return null;
	}

	/** >HLoadStmt ::= HLOAD Temp() Temp() IntegerLiteral()
		* f0 -> "HLOAD"
		* f1 -> Temp()
		* f2 -> Temp()
		* f3 -> IntegerLiteral()
		*/
	public R visit(HLoadStmt n, A argu) 
	{
		n.f1.accept(this, (A)"def");
		n.f2.accept(this, (A)"use");
		return null;
	}

	/** >MoveStmt ::= MOVE Temp() Exp()
		* f0 -> "MOVE"
		* f1 -> Temp()
		* f2 -> Exp()
		*/
	public R visit(MoveStmt n, A argu) 
	{
		n.f1.accept(this, (A)"def");
		n.f2.accept(this, null);
		return null;
	}

	/** >PrintStmt ::= PRINT SimpleExp()
		* f0 -> "PRINT"
		* f1 -> SimpleExp()
		*/
	public R visit(PrintStmt n, A argu) 
	{
		return n.f1.accept(this, null);
	}

	/** >Exp
		* f0 -> Call()
		*       | HAllocate()
		*       | BinOp()
		*       | SimpleExp()
		*/
	public R visit(Exp n, A argu) 
	{
		return n.f0.accept(this, null);
	}

	/** >StmtExp
		* f0 -> "BEGIN"
		* f1 -> StmtList()
		* f2 -> "RETURN"
		* f3 -> SimpleExp()
		* f4 -> "END"
		*/
	public R visit(StmtExp n, A argu) 
	{
		n.f1.accept(this, null);
		blockAttr battr = new blockAttr();
		curBlock = battr;
		curFunc.blocks.add(curBlock);
		n.f3.accept(this, null);
		return null;
	}

	/** >Call
		* f0 -> "CALL"
		* f1 -> SimpleExp()
		* f2 -> "("
		* f3 -> ( Temp() )*
		* f4 -> ")"
		*/
	public R visit(Call n, A argu) 
	{
		arg_cnt = 0;
		n.f1.accept(this, null);
		n.f3.accept(this, (A)"arg");
		curFunc.maxArgs = Math.max(curFunc.maxArgs, arg_cnt);
		curFunc.hasCall = true;
		return null;
	}

	/** >HAllocate ::= HALLOCATE SimpleExp()
		* f0 -> "HALLOCATE"
		* f1 -> SimpleExp()
		*/
	public R visit(HAllocate n, A argu) 
	{
		return n.f1.accept(this, null);
	}

	/** >BinOp ::= Operator Temp() SimpleExp()
		* f0 -> Operator()
		* f1 -> Temp()
		* f2 -> SimpleExp()
		*/
	public R visit(BinOp n, A argu) 
	{
		n.f1.accept(this, (A)"use");
		n.f2.accept(this, null);
		return null;
	}

	/** >Operator ::= LE|NE|PLUS|MINUS|TIMES|DIVIDE
		* f0 -> "LE"
		*       | "NE"
		*       | "PLUS"
		*       | "MINUS"
		*       | "TIMES"
		*       | "DIV"
		*/
	public R visit(Operator n, A argu) 
	{
		return null;
	}

	/** >SimpleExp() ::= Temp() | IntegerLiteral() | Label()
		* f0 -> Temp()
		*       | IntegerLiteral()
		*       | Label()
		*/
	public R visit(SimpleExp n, A argu) 
	{
		if (n.f0.which == 0) n.f0.accept(this, (A)"use");
		return null;
	}

	/** >Temp() ::= "TEMP" IntegerLiteral()
		* f0 -> "TEMP"
		* f1 -> IntegerLiteral()
		*/
	public R visit(Temp n, A argu) 
	{
		String arg = (String)argu;
		
		if(arg=="use") curBlock.add_use(n.f1.f0.tokenImage);
		else if(arg=="def") curBlock.add_def(n.f1.f0.tokenImage);
		else if(arg=="arg")
		{
			curBlock.add_use(n.f1.f0.tokenImage);
			arg_cnt++;
		}
		return null;
	}

	/** >IntegerLiteral() ::= <INTEGER_LITERAL>
		* f0 -> <INTEGER_LITERAL>
		*/
	public R visit(IntegerLiteral n, A argu) 
	{
		return (R)n.f0.tokenImage;
	}

	/** >Label() ::= <IDENTIFIER>
		* f0 -> <IDENTIFIER>
		*/
	public R visit(Label n, A argu) 
	{
		if(argu!=null)
		{
			String lab = (String)n.f0.tokenImage;
			curFunc.labelMap.put(lab, lc);
		}
		return (R)n.f0.tokenImage;
	}

}