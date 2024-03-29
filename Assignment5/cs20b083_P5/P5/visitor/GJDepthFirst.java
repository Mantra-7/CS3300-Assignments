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
public class GJDepthFirst<R,A> implements GJVisitor<String,String> {
   //
   // Auto class visitors--probably don't need to be overridden.
   //
	
	boolean printLabel;

   void print(String s)
   {
      System.out.println(s);
   }

   void declare(String name)
   {
      print("\n\t.text");
      print("\t.globl "+name);
   }

   void method_enter(String name, Integer maxStackSpace)
   {
      declare(name);
      print(name+":");
      print("\t\tsw $fp, 0($sp)");
      print("\t\tsw $ra, -4($sp)");
      print("\t\tmove $fp, $sp");
      print("\t\tsubu $sp, $sp, "+(4*maxStackSpace+8));
   }

   void method_exit(Integer maxStackSpace)
   {
      print("\t\tlw $ra, -4($fp)");
      print("\t\tlw $fp, 0($fp)");
      print("\t\taddu $sp, $sp, "+(4*maxStackSpace+8));
      print("\t\tj $ra");
   }

   void basic_methods()
   {
      declare("_halloc");
      print("_halloc:");
      print("\t\tli $v0, 9");
      print("\t\tsyscall");
      print("\t\tj $ra");
      declare("_print");
      print("_print:");
      print("\t\tli $v0, 1");
      print("\t\tsyscall");
      print("\t\tla $a0, newl");
      print("\t\tli $v0, 4");
      print("\t\tsyscall");
      print("\t\tj $ra\n");
      print("\t\t.data");
      print("\t\t.align 0");
      print("newl:\t.asciiz \"\\n\"");
      print("\n\t.data");
      print("\t.align   0");
      print("str_er:  .asciiz \" ERROR: abnormal termination\\n\" ");
   }
	
   void move(String reg, String val)
   {
      String type = val.substring(0,3);
      String value = val.substring(3);
      if(type.equals("reg")) print("\t\tmove "+reg+", "+value);
      else if(type.equals("int")) print("\t\tli "+reg+", "+value);
      else print("\t\tla "+reg+", "+value);
   }

   public String visit(NodeList n, String argu) {
      String _ret=null;
      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
         e.nextElement().accept(this,argu);
      }
      return _ret;
   }

   public String visit(NodeListOptional n, String argu) {
      if ( n.present() ) {
         String _ret=null;
         for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
            e.nextElement().accept(this,argu);
         }
         return _ret;
      }
      else
         return null;
   }

   public String visit(NodeOptional n, String argu) {
      if ( n.present() )
         return n.node.accept(this,argu);
      else
         return null;
   }

   public String visit(NodeSequence n, String argu) {
      String _ret=null;
      for ( Enumeration<Node> e = n.elements(); e.hasMoreElements(); ) {
         e.nextElement().accept(this,argu);
      }
      return _ret;
   }

   public String visit(NodeToken n, String argu) { return n.tokenImage; }

   //
   // User-generated visitor methods below
   //

   /**
    * f0 -> "MAIN"
    * f1 -> "["
    * f2 -> IntegerLiteral()
    * f3 -> "]"
    * f4 -> "["
    * f5 -> IntegerLiteral()
    * f6 -> "]"
    * f7 -> "["
    * f8 -> IntegerLiteral()
    * f9 -> "]"
    * f10 -> StmtList()
    * f11 -> "END"
    * f12 -> ( SpillInfo() )?
    * f13 -> ( Procedure() )*
    * f14 -> <EOF>
    */
   public String visit(Goal n, String argu) 
   {
      Integer maxStackSpace = Integer.parseInt(n.f5.accept(this, null));

      method_enter("main", maxStackSpace);
      n.f10.accept(this, null);
      method_exit(maxStackSpace);

      n.f13.accept(this, null);

      basic_methods();

      return null;
   }

   /**
    * f0 -> Label()
    * f1 -> "["
    * f2 -> IntegerLiteral()
    * f3 -> "]"
    * f4 -> "["
    * f5 -> IntegerLiteral()
    * f6 -> "]"
    * f7 -> "["
    * f8 -> IntegerLiteral()
    * f9 -> "]"
    * f10 -> StmtList()
    * f11 -> "END"
    * f12 -> ( SpillInfo() )?
    */
   public String visit(Procedure n, String argu) 
   {
      String mname = (String)n.f0.accept(this, null);
      Integer maxStackSpace = Integer.parseInt(n.f5.accept(this, null));

      method_enter(mname, maxStackSpace);
      n.f10.accept(this, null);
      method_exit(maxStackSpace);

      return null;
   }

   /**
    * f0 -> ( ( Label() )? Stmt() )*
    */
   public String visit(StmtList n, String argu) 
   {
      printLabel = true;
      n.f0.accept(this, null);
      printLabel = false;
      return null;
   }

   /**
    * f0 -> NoOpStmt()
    *       | ErrorStmt()
    *       | CJumpStmt()
    *       | JumpStmt()
    *       | HStoreStmt()
    *       | HLoadStmt()
    *       | MoveStmt()
    *       | PrintStmt()
    *       | ALoadStmt()
    *       | AStoreStmt()
    *       | PassArgStmt()
    *       | CallStmt()
    */
   public String visit(Stmt n, String argu) 
   {
      printLabel = false;
      n.f0.accept(this, null);
      printLabel = true;
      return null;
   }

   /**
    * f0 -> "NOOP"
    */
   public String visit(NoOpStmt n, String argu) 
   {
      print("\t\tnop");
      return null;
   }

   /**
    * f0 -> "ERROR"
    */
   public String visit(ErrorStmt n, String argu) 
   {
      print("\t\tla $a0, str_er");
      print("\t\tsyscall");
      print("\t\tli $v0, 10");
      print("\t\tsyscall");
      return null;
   }

   /**
    * f0 -> "CJUMP"
    * f1 -> Reg()
    * f2 -> Label()
    */
   public String visit(CJumpStmt n, String argu) 
   {
      String reg = n.f1.accept(this, null);
      String lab = n.f2.accept(this, null);
      print("\t\tbeqz "+reg+", "+lab);
      return null;
   }

   /**
    * f0 -> "JUMP"
    * f1 -> Label()
    */
   public String visit(JumpStmt n, String argu) 
   {
      String lab = n.f1.accept(this, null);
      print("\t\tb "+lab);
      return null;
   }

   /**
    * f0 -> "HSTORE"
    * f1 -> Reg()
    * f2 -> IntegerLiteral()
    * f3 -> Reg()
    */
   public String visit(HStoreStmt n, String argu) 
   {
      String r1 = n.f1.accept(this, null);
      Integer offset = Integer.parseInt(n.f2.accept(this, null));
      String r2 = n.f3.accept(this, null);
      print("\t\tsw "+r2+", "+offset+"("+r1+")");
      return null;
   }

   /**
    * f0 -> "HLOAD"
    * f1 -> Reg()
    * f2 -> Reg()
    * f3 -> IntegerLiteral()
    */
   public String visit(HLoadStmt n, String argu) 
   {
      String r1 = n.f1.accept(this, null);
      String r2 = n.f2.accept(this, null);
      Integer offset = Integer.parseInt(n.f3.accept(this, null));
      print("\t\tlw "+r1+", "+offset+"("+r2+")");
      return null;
   }

   /**
    * f0 -> "MOVE"
    * f1 -> Reg()
    * f2 -> Exp()
    */
   public String visit(MoveStmt n, String argu) 
   {
      String r1 = n.f1.accept(this, null);
      String val = n.f2.accept(this, r1);
      if(n.f2.f0.which!=1) move(r1, val);
      return null;
   }

   /**
    * f0 -> "PRINT"
    * f1 -> SimpleExp()
    */
   public String visit(PrintStmt n, String argu) 
   {
      String val = n.f1.accept(this, null);
      move("$a0", val);
      print("\t\tjal _print");
      return null;
   }

   /**
    * f0 -> "ALOAD"
    * f1 -> Reg()
    * f2 -> SpilledArg()
    */
   public String visit(ALoadStmt n, String argu) 
   {
      String reg = n.f1.accept(this, null);
      Integer offset = Integer.parseInt(n.f2.accept(this, null));
      print("\t\tlw "+reg+", -"+(8+4*offset)+"($fp)");
      return null;
   }

   /**
    * f0 -> "ASTORE"
    * f1 -> SpilledArg()
    * f2 -> Reg()
    */
   public String visit(AStoreStmt n, String argu) 
   {
      Integer offset = Integer.parseInt(n.f1.accept(this, null));
      String reg = n.f2.accept(this, null);
      print("\t\tsw "+reg+", -"+(8+4*offset)+"($fp)");
      return null;
   }

   /**
    * f0 -> "PASSARG"
    * f1 -> IntegerLiteral()
    * f2 -> Reg()
    */
   public String visit(PassArgStmt n, String argu) 
   {
      Integer offset = Integer.parseInt(n.f1.accept(this, null));
      String reg = n.f2.accept(this, null);
      print("\t\tsw "+reg+", -"+(4+4*offset)+"($sp)");
      return null;
   }

   /**
    * f0 -> "CALL"
    * f1 -> SimpleExp()
    */
   public String visit(CallStmt n, String argu) 
   {
      String method = n.f1.accept(this, null);
      move("$v0",method);
      print("\t\tjalr $v0");
      return null;
   }

   /**
    * f0 -> HAllocate()
    *       | BinOp()
    *       | SimpleExp()
    */
   public String visit(Exp n, String argu) 
   {
      return n.f0.accept(this, argu);
   }

   /**
    * f0 -> "HALLOCATE"
    * f1 -> SimpleExp()
    */
   public String visit(HAllocate n, String argu) 
   {
      String size = n.f1.accept(this, null);
      move("$a0",size);
      print("\t\tjal _halloc");
      return "reg$v0";
   }

   /**
    * f0 -> Operator()
    * f1 -> Reg()
    * f2 -> SimpleExp()
    */
   public String visit(BinOp n, String argu) 
   {
      String rs = argu;
      String op = n.f0.accept(this, null);
      String r1 = n.f1.accept(this, null);
      String r2 = n.f2.accept(this, null).substring(3);

      if(op == "LE") op = "sle";
      else if(op == "NE") op = "sne";
      else if(op == "PLUS") op = "add";
      else if(op == "MINUS") op = "sub";
      else if(op == "TIMES") op = "mul";
      else if(op == "DIV") op = "div";

      print("\t\t"+op+" "+rs+", "+r1+", "+r2);
      return null;
   }

   /**
    * f0 -> "LE"
    *       | "NE"
    *       | "PLUS"
    *       | "MINUS"
    *       | "TIMES"
    *       | "DIV"
    */
   public String visit(Operator n, String argu) 
   {
      return n.f0.accept(this, null);
   }

   /**
    * f0 -> "SPILLEDARG"
    * f1 -> IntegerLiteral()
    */
   public String visit(SpilledArg n, String argu) 
   {
      return n.f1.accept(this, null);
   }

   /**
    * f0 -> Reg()
    *       | IntegerLiteral()
    *       | Label()
    */
   public String visit(SimpleExp n, String argu) 
   {
      if(n.f0.which==0) return "reg"+n.f0.accept(this, null);
      else if(n.f0.which==1) return "int"+n.f0.accept(this, null);
      return "lab"+n.f0.accept(this, null);
   }

   /**
    * f0 -> "a0"
    *       | "a1"
    *       | "a2"
    *       | "a3"
    *       | "t0"
    *       | "t1"
    *       | "t2"
    *       | "t3"
    *       | "t4"
    *       | "t5"
    *       | "t6"
    *       | "t7"
    *       | "s0"
    *       | "s1"
    *       | "s2"
    *       | "s3"
    *       | "s4"
    *       | "s5"
    *       | "s6"
    *       | "s7"
    *       | "t8"
    *       | "t9"
    *       | "v0"
    *       | "v1"
    */
   public String visit(Reg n, String argu) 
   {
      return "$"+n.f0.accept(this, null);
   }

   /**
    * f0 -> <INTEGER_LITERAL>
    */
   public String visit(IntegerLiteral n, String argu) 
   {
      return n.f0.tokenImage;
   }

   /**
    * f0 -> <IDENTIFIER>
    */
   public String visit(Label n, String argu) 
   {
      if(printLabel) print(n.f0.tokenImage+":");
      return n.f0.tokenImage;
   }

   /**
    * f0 -> "//"
    * f1 -> SpillStatus()
    */
   public String visit(SpillInfo n, String argu) 
   {
      return null;
   }

   /**
    * f0 -> <SPILLED>
    *       | <NOTSPILLED>
    */
   public String visit(SpillStatus n, String argu) 
   {
      return null;
   }
}