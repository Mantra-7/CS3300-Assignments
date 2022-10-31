import syntaxtree.*;
import visitor.*;

public class P4 {
   public static void main(String [] args) {
      try {
         Node root = new microIRParser(System.in).Goal();
         FirstPass fp = new FirstPass();
         root.accept(fp, null);
         GJDepthFirst gf = new GJDepthFirst();
         gf.st = fp.st;
         root.accept(gf, null);
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 



