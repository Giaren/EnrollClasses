<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script> 
	function validate()
	{ 
     var SSN = document.form.SSN.value; 
 
     if (SSN==null || SSN=="")
     { 
     alert("Username cannot be blank"); 
     return false; 
     }
}
</script> 
    </head>
    <body>
    
        <form name = form method="post" action="LoginServlet" onsubmit="return validate()">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>SSN</td>
                        <td><input type="text" name="SSN" required/></td>
                    </tr>
                        <td colspan="2" align="center"><input type="submit" value="Login" />
                            &nbsp;&nbsp;
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>