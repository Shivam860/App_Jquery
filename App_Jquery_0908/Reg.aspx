<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="App_Jquery_0908.Reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: 'Reg.aspx/Get',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: '',
                success: function (pp) {
                    pp = JSON.parse(pp.d);
                    for (var i = 0; i < pp.length; i++) {
                        $("#tbldis").append('<tr> <td>' + pp[i].u_name + '</td> <td>' + pp[i].u_email + '</td> <td>' + pp[i].u_password + '</td> <td>' + pp[i].status + '</td> </tr>');
                    }
                },
                error: function () {
                    alert("Something went Wrong");
                }
            });
        });


        function SaveData() {
            $.ajax({
                url: 'Reg.aspx/Insert',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                data: "{A : '" + $("#textName").val() + "',B:'" + $("#textEmail").val() + "',C: '" + $("#textPass").val() + "'}",
                dataType: 'json',
                success: function () {
                    alert("Sussfully done");
                },
                error: function () {
                    alert("Something went Wrong");
                }
            });
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" id="textName" /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" id="textEmail" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" id="textPass" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" id="btn_submit" value="Submit" onclick="SaveData()" /></td>
                </tr>
            </table>

            <table id="tbldis" border="1" style="background-color:gray;color:white">
                <tr style="background-color:maroon">
                    <th>Name</th> 
                    <th>Email</th> 
                    <th>Password</th>

                </tr>
            </table>

        </div>
    </form>
</body>
</html>
