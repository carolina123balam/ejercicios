/*Proyecto Programación Lógica */
package proyectojpl;

import jpl.Query;

public class ProyectoJPL {
    public static void main(String[] args) {
     String t1 = "consult('proyectojpl.pl')";
     Query q1 = new Query(t1);
     System.out.println(t1 + " " + (q1.hasSolution() ? "Conexion con PROLOG exitosa" : "fallo la conexion"));
     System.out.println("-------------------------------------------");
        
     String t2 = ("sintomas(Y).");    
     Query q2 = new Query(t2);
     System.out.println(t2 + " " + (q2.hasSolution() ? "No hay resultados en la base de datos"
             : "Todos los sintomas"));
     System.out.println("-------------------------------------------");
     
     String t3 = ("solucion(P).");
     Query q3 = new Query(t3);
     System.out.println(t3 + " " + (q3.hasSolution() ? "No hay resultados en la base de datos" 
             : "todas las soluciones"));
     System.out.println("-------------------------------------------");
     
     String t4 = ("solucion(procesador).");
     Query q4 = new Query(t4);
     System.out.println(t4 + " " + (q4.hasSolution() ? "No hay resultados en la base de datos" 
             : "Posibles soluciones o sintoma"));
     System.out.println("-------------------------------------------");
     
     String t5 = ("sintoma('eliminacion de archivos').");
     Query q5 = new Query(t5);
     System.out.println(t5 + " " + (q5.hasSolution() ? "No hay resultados en la base de datos" 
             : "Posibles soluciones o sintoma"));
     System.out.println("-------------------------------------------");
     
     String t6 = ("sintomas(fuente_poder).");
     Query q6 = new Query(t6);
     System.out.println(t6 + " " + (q6.hasSolution() ? "No hay resultados en la base de datos" 
             : "Posibles soluciones o sintoma"));
     System.out.println("-------------------------------------------");
     
     String t7 = ("solucion(virus).");
     Query q7 = new Query(t7);
     System.out.println(t7 + " " + (q7.hasSolution() ? "No hay resultados en la base de datos" 
             : "Posibles soluciones o sintoma"));
     System.out.println("-------------------------------------------");
}
}
