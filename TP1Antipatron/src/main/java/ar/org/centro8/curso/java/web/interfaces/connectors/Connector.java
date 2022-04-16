package ar.org.centro8.curso.java.web.interfaces.connectors;
import java.sql.Connection;
import java.sql.DriverManager;
public class Connector {
    
    // MariaDB localhost
    private static String driver="org.mariadb.jdbc.Driver";
    private static String vendor="mariadb";
    private static String server="localhost";
    private static String port="3305";
    private static String bd="negocioWeb";
    private static String params="?serverTimezone=UTC";
    private static String user="root";
    private static String pass="";
    
    // MariaDB db4free
//    private static String driver="org.mariadb.jdbc.Driver";
//    private static String vendor="mariadb";
//    private static String server="db4free.net";
//    private static String port="3306";
//    private static String bd="negociowebcfp8";
//    private static String params="";
//    private static String user="centro_8";
//    private static String pass="centro_8";
    
    // Postgre elephantSQL
//    private static String driver="org.postgresql.Driver";
//    private static String vendor="postgresql";
//    private static String server="kesavan.db.elephantsql.com";
//    private static String port="5432";
//    private static String bd="kwugovfe";
//    private static String params="";
//    private static String user="kwugovfe";
//    private static String pass="e3SF33nVwgZkZjAOzjT4Bs8MHuWcyfD6";
    
    private static String url="jdbc:"+vendor+"://"+server+":"+port+"/"+bd+params;
    
    private static Connection conn=null;
    
    private Connector(){}
    
    public synchronized static Connection getConnection(){
        try {
            if(conn==null || conn.isClosed()){
                Class.forName(driver);
                conn=DriverManager.getConnection(url, user, pass);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    } 

}
