<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="App_Jquery_0908.Reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            displayData();
        });

        function clear(tbldis) {
            tbldis = JSON.parse(tbldis);
            $("#textName").val() = "";
            $("#textEmail").val() = "";
            $("#textPass").val() = "";
            $("#btn_submit").val() = "Submit";
        }

        function displayData() {
            $.ajax({
                url: 'Reg.aspx/Get',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: '',
                success: function (pp) {
                    pp = JSON.parse(pp.d);
                    $("#tbldis").find("tr:gt(0)").remove();
                    for (var i = 0; i < pp.length; i++) {
                        $("#tbldis").append('<tr> <td>' + pp[i].u_name + '</td> <td>' + pp[i].u_email + '</td> <td>' + pp[i].u_password + '</td> <td><input type="button" id="btn_delete" value="Delete" onclick="deleteData(' + pp[i].u_id + ')" /></td> <td><input type="button" id="btn_Edit" value="Edit" onclick="editData(' + pp[i].u_id + ')" /></td>  </tr>');
                    }
                },
                error: function () {
                    alert("Something went Wrong");
                }
            });
        }

        
        function SaveData() {
            if ($("#btn_submit").val() == "Submit") {
                $.ajax({
                    url: 'Reg.aspx/Insert',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    data: "{A : '" + $("#textName").val() + "',B:'" + $("#textEmail").val() + "',C: '" + $("#textPass").val() + "'}",
                    dataType: 'json',
                    success: function () {
                        displayData();
                        clear();
                    },
                    error: function () {
                        alert("Something went Wrong");
                    }
                });
            }
            else
            {
                $.ajax({
                    url: 'Reg.aspx/Update',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    data: "{A : '" + $("#textName").val() + "',B:'" + $("#textEmail").val() + "',C: '" + $("#textPass").val() + "',D: '" + idd + "'}",
                    dataType: 'json',
                    success: function () {
                        displayData();
                        clear();
                    },
                    error: function () {
                        alert("Something went Wrong");
                    }
                });
            }
        }
        
        function deleteData(id) {
            $.ajax({
                url: 'Reg.aspx/Delete',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                data: "{A : '" + id + "'}",
                dataType: 'json',
                success: function () {
                    displayData();
                },
                error: function () {
                    alert("Something went Wrong");
                }
            });
        }

        function editData(id) {
            $.ajax({
                url: 'Reg.aspx/Edit',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                data: "{A : '" + id + "'}",
                dataType: 'json',
                success: function (tbldis) {
                    tbldis = JSON.parse(tbldis.d);
                    $("#textName").val(tbldis[0].u_name);
                    $("#textEmail").val(tbldis[0].u_email);
                    $("#textPass").val(tbldis[0].u_password);
                    $("#btn_submit").val("Update");
                    idd = id;
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
                    <th></th>
                    <th></th>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
