<script>
    var v="xyz";
    var p="";
    
    hello=function (){
     console.log("hello function");
      p="6666";
      }	
   
    hello();
    
</script>



<% 

    String st="<script>document.writeln(v)</script>";
    out.println("value v="+st);
    
    String st1="<script>document.writeln(p)</script>";
    out.println("p  ="+st1);  
%>
