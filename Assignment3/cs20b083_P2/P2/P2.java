import syntaxtree.*;
import visitor.*;
import java.util.*;

public class P2 {
   public static void main(String [] args) {
      try {
         Node root = new MiniJavaParser(System.in).Goal();
         ClassTable ct = new ClassTable();
         root.accept(ct, null); // Your assignment part is invoked here.
         GJDepthFirst df = new GJDepthFirst();
         df.classTable = ct.classTable;
         root.accept(df, null);
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
}
