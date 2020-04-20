
<%@page import="java.sql.SQLException"%>
<%@page  import="java.sql.ResultSet,java.sql.Connection" %>
<%@page  import="java.sql.PreparedStatement,java.sql.DriverManager" %>
<%@page import="java.sql.*,java.util.*"%>

<%
            
           String name=request.getParameter("name");
           String email=request.getParameter("email");
           String password=request.getParameter("pass");
           out.println(password) ;
            
//            if(id.equals(""))
//            {
//                out.println("id is required");    
//            }
//            if(category.equals("select category"))
//            {
//            out.println("please select valid choice");    
//           }
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/tourism_user?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "secret");
//        out.println("Done");
        Statement st=con.createStatement();
        
        int i=st.executeUpdate("insert into user(name,email, password)values('"+name+"','"+email+"','"+password+"')");
        response.sendRedirect("travel_destination.jsp");
    }
    catch(Exception e){
        response.sendRedirect("signin/signin.html");
    }
//        out.println("Data is successfully inserted!");

//     try{
//         if(con != null)
//             con.close();
//             out.println("Connection closed !!");
//     } catch (SQLException e) {
//         e.printStackTrace();
//     }
        
// //        ps.executeUpdate();
       
//         response.sendRedirect("index.html");
%>