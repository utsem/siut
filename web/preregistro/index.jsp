<%@page import="control.candidateControl"%>
<%@page import="control.aes"%>
<%
    String vertion = "jqwidgets-ver4.0.0";
    if(session.getAttribute("logueadoCandidate") == null){
        if(request.getParameter("ac") != null){
            aes sec = new aes();
            sec.addKey("2015");
            String ligaDescript = sec.desencriptar(request.getParameter("ac").replace(" ", "+"));
            String userName = null;
            String mail = null;
            String password = null;
            if(!ligaDescript.equals("")){
                String[] numerosComoArray = ligaDescript.split("&");
                for (int i = 0; i < numerosComoArray.length; i++) {
                    String data = numerosComoArray[i].toString();
                    String[] numberAsArray = data.split("=");
                    for(int x = 0; x < numberAsArray.length; x++){
                        if(numberAsArray[x].equals("userName")){
                            userName = numberAsArray[x+1];
                        }
                        if(numberAsArray[x].equals("mail")){
                            mail = numberAsArray[x+1];
                        }
                        if(numberAsArray[x].equals("password")){
                            password = numberAsArray[x+1];
                        }
                    }
                }
                if(new candidateControl().SelectUserStatusAcount(userName, password)==0){
                    if(new candidateControl().ActivateAcount(userName, mail, password).equals("Actived")){
                        %>
                            <html xmlns="http://www.w3.org/1999/xhtml">
                                <head>
                                <title>Activaci�n de cuenta</title>
                                    <meta name="viewport" content="width=device-width"/>
                                    <meta charset="UTF-8"/>
                                    <meta name="viewport" content="width=device-width, initial-scale=1">
                                    <link title="SIUT" rel="icon" type="image/png" href="../../content/pictures-system/favicon.png" />
                                    <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.base.css" />
                                    <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.greenUtsem.css" />
                                    <script type="text/javascript" src="../content/files-jq/jquery-2.0.2.min.js"></script>
                                    <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxcore.js"></script>
                                    <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxwindow.js"></script> 
                                    <script type="text/javascript">
                                        $(document).ready(function (){
                                            $("#mainDemoContainer").height($(document).height()-130);
                                            $("#jqxwindow").jqxWindow({
                                                height: 130,
                                                width: 350,
                                                theme: 'greenUtsem',
                                                autoOpen: true,
                                                isModal: true,
                                                showCloseButton: false,
                                                resizable: false,
                                                position: "center"
                                            });

                                        });
                                    </script>
                                </head>
                                <body class='default'>
                                    <div style="width: 100%;" id="mainDemoContainer">
                                        <div id='jqxwindow'>
                                            <div>Activaci�n de la cuenta</div>
                                            <div style="padding: 20px">
                                                La cuenta fue activada con �xito, ahora puedes iniciar sesi�n para ello da click a <a href="http://148.223.215.19/preregistro/">aqu�</a>.
                                            </div>
                                        </div>
                                    </div>
                                </body>
                            </html>
                        <%
                    }else{
                        %>
                            <html xmlns="http://www.w3.org/1999/xhtml">
                                <head>
                                <title>Activaci�n de cuenta</title>
                                    <meta name="viewport" content="width=device-width"/>
                                    <meta charset="UTF-8"/>
                                    <meta name="viewport" content="width=device-width, initial-scale=1">
                                    <link title="SIUT" rel="icon" type="image/png" href="../../content/pictures-system/favicon.png" />
                                    <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.base.css" />
                                    <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.greenUtsem.css" />
                                    <script type="text/javascript" src="../content/files-jq/jquery-2.0.2.min.js"></script>
                                    <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxcore.js"></script>
                                    <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxwindow.js"></script> 
                                    <script type="text/javascript">
                                        $(document).ready(function (){
                                            $("#mainDemoContainer").height($(document).height()-130);
                                            $("#jqxwindow").jqxWindow({
                                                height: 130,
                                                width: 350,
                                                theme: 'greenUtsem',
                                                autoOpen: true,
                                                isModal: true,
                                                showCloseButton: true,
                                                resizable: false,
                                                position: "center"
                                            });

                                        });
                                    </script>
                                </head>
                                <body class='default'>
                                    <div style="width: 100%;" id="mainDemoContainer">
                                        <div id='jqxwindow'>
                                            <div>Activaci�n de la cuenta</div>
                                            <div style="padding: 20px">
                                                Ocurrio un problema intente de nuevo mas tarde... :/
                                            </div>
                                        </div>
                                    </div>
                                </body>
                            </html>
                        <%
                    }
                }else{
                    %>
                        <html xmlns="http://www.w3.org/1999/xhtml">
                            <head>
                            <title>Activaci�n de cuenta</title>
                                <meta name="viewport" content="width=device-width"/>
                                <meta charset="UTF-8"/>
                                <meta name="viewport" content="width=device-width, initial-scale=1">
                                <link title="SIUT" rel="icon" type="image/png" href="../../content/pictures-system/favicon.png" />
                                <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.base.css" />
                                <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.greenUtsem.css" />
                                <script type="text/javascript" src="../content/files-jq/jquery-2.0.2.min.js"></script>
                                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxcore.js"></script>
                                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxwindow.js"></script> 
                                <script type="text/javascript">
                                    $(document).ready(function (){
                                        $("#mainDemoContainer").height($(document).height()-130);
                                        $("#jqxwindow").jqxWindow({
                                            height: 130,
                                            width: 350,
                                            theme: 'greenUtsem',
                                            autoOpen: true,
                                            isModal: true,
                                            showCloseButton: false,
                                            resizable: false,
                                            position: "center"
                                        });

                                    });
                                </script>
                            </head>
                            <body class='default'>
                                <div style="width: 100%;" id="mainDemoContainer">
                                    <div id='jqxwindow'>
                                        <div>Cuenta activada</div>
                                        <div style="padding: 20px">
                                            Esta cuenta ya fue activada anterior mente por a hora inicia sesi�n desde <a href="http://148.223.215.19/preregistro/">aqu�...</a>.
                                        </div>
                                    </div>
                                </div>
                            </body>
                        </html>
                    <%
                }                
            }else{
                //response.sendRedirect("http://148.223.215.19/preregistro");
            }
        }else{%>
            <!DOCTYPE html>
            <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                <title>Login SIUT</title>
                    <meta name="viewport" content="width=device-width"/>
                    <meta charset="UTF-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <link title="SIUT" rel="icon" type="image/png" href="../../content/pictures-system/favicon.png" />
                    <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.base.css" />
                    <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.greenUtsem.css" />
                    <link rel="stylesheet" href="../content/files-css/main-login.css" type="text/css"/>     
                </head>
                <body>
                    <div style="width: 100%;" id="mainDemoContainer">
                        <div id='jqxwindow'>
                            <div>Mensaje</div>
                            <div style="padding: 20px">
                                <span id="message"></span>
                                <br>
                                <div style="text-align: center">
                                    <input type="button" id="ok" value="Aceptar" style="margin-right: 10px" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <center class="login">  
                        <div id="stage" style="display: block">
                            <div style="display: none" id="windowBlock">
                                <div id="WindowLoad"></div>
                                <div id="loadingPicture"></div>
                            </div>
                            <span id="loginText" style="font-size: 35px; line-height: normal;">LOGIN PRE-REGISTRO</span><br>
                            <span id="MessageError" style="display: none; position:absolute; color: red; font-size: 18px; right: 20px; top: 100px">Error datos incorrectos</span>
                            <div id="intro" style="display: block;">
                                <section style="margin-top: 32px;">
                                    <form id="formLogin" method="post" >
                                        <input type="hidden" name="statusLogin" value="in"/>
                                        <div id="tmm-form-wizard" class="form-login substrate">
                                            <div style="position: relative; height: 60px;">
                                                <div class="label-row">
                                                    <label for="userName">Usuario</label>
                                                </div>
                                                <div class="input-row" style="padding-right: 125px;">
                                                    <input title="Ingresa tu usuario para poder ingresar" style="width: 164px" name="userName" type="text" id="userName" autofocus="" placeholder="usuario, email">
                                                </div>
                                            </div>
                                            <br>
                                            <div style="position: relative; height: 60px;">
                                                <div class="label-row">
                                                    <label for="password">Contrase�a</label>
                                                </div>
                                                <div class="input-row" style="padding-right: 110px;">
                                                    <input title="Ingresa tu contrase�a para poder ingresar" name="password" type="password" class="password" id="password" placeholder="Contrase�a">
                                                </div>
                                            </div>
                                            <br>
                                            <div class="description" id="nonFolio" style="cursor: pointer; text-decoration: underline">No tengo un folio utsem!</div>
                                            <div class="button-row">
                                                <input type="submit" id="buttonGetStarted" class="button" value="Ingresar" />
                                            </div>
                                        </div><br>
                                    </form><!--/ form-->                                    
                                </section><!--/ seccion-->
                                <a title="Informaci�n requerida" style="color: rgb(66, 79, 89); text-decoration: none; position: absolute; right: 20px; bottom: 2px;" href="../content/files-pdf/metadata-preregister.pdf" download="Documento piloto de metadato"><img src="../content/pictures-system/pdf.png"></a>
                            </div>
                        </div>                        
                    </center>
                    <center class="register" style="display: none">
                        <div id="stage">
                            <div style="display: none" id="windowBlockRegister">
                                <div id="WindowLoad"></div>
                                <div id="loadingPicture"></div>
                            </div>
                            <span id="loginText" style="font-size: 35px; line-height: normal;">NUEVA CUENTA</span><br>
                            <span id="MessageErrorRegister" style="display: none; position:absolute; color: red; font-size: 18px; right: 20px; top: 62px">Error datos incorrectos</span>
                            <div id="intro" style="display: block;">
                                <section style="margin-top: 16px;">
                                    <form id="formRegister" method="post" >
                                        <div id="tmm-form-wizard" class="form-login substrate">
                                            <div style="position: relative; height: 70px; padding-right: 85px;">
                                                <div class="label-row">
                                                    <label for="userNameRegister">Nombre de usuario</label>
                                                </div>
                                                <div class="input-row">
                                                    <input title="Ingresa tu nombre de usuario para poder ingresar" name="userNameRegister" style="width: 250px;" maxlength="20" type="text" id="userNameRegister" autofocus="" placeholder="Nombre de usuario">
                                                </div>
                                            </div>
                                            <div style="position: relative; height: 70px;">
                                                <div class="label-row">
                                                    <label for="password">Correo electronico</label>
                                                </div>
                                                <div class="input-row" style="padding-right: 30px;">
                                                    <input title="Ingresa tu correo para poder ingresar" name="email"  type="text" id="email" placeholder="Correo">
                                                </div>
                                            </div>
                                            <div style="position: relative; height: 70px;">
                                                <div class="label-row">
                                                    <label for="password">Contrase�a</label>
                                                </div>
                                                <div class="input-row" style="padding-right: 118px;">
                                                    <input title="Ingresa tu contrase�a para poder ingresar" name="password1" style="width: 160px;" type="password" class="password" id="password1" placeholder="Contrase�a">
                                                </div>
                                            </div>
                                            <div style="position: relative; height: 70px;">
                                                <div class="label-row" style="padding-right: 80px;">
                                                    <label for="password">Repita la contrase�a</label>
                                                </div>
                                                <div class="input-row" style="padding-right: 118px;">
                                                    <input title="Repita la la contrase�a para poder ingresar" name="password2" style="width: 160px;" type="password" class="password" id="password2" placeholder="Contrase�a">
                                                </div>
                                            </div>    
                                            <div class="description" id="back" style="cursor: pointer; text-decoration: underline">Regresar<<</div>
                                            <div class="button-row">
                                                <input type="submit" id="buttonGetStartedRegister" class="button" value="Registrar" />
                                            </div>
                                        </div><br>
                                    </form><!--/ form-->
                                </section><!--/ seccion-->
                            </div>
                        </div>
                    </center>  
                </body>
                <script type="text/javascript" src="../content/files-jq/jquery-2.0.2.min.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/localization.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxcore.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxpasswordinput.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxtooltip.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxinput.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxvalidator.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxwindow.js"></script>
                <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxbuttons.js"></script>
                <script type="text/javascript">
                    $(document).ready(function (){
                        window.location.hash="";
                        window.location.hash=""; //chrome
                        window.onhashchange=function(){window.location.hash="";};
                        //window.location.href.replace( /#.*/, "");
                        $(".password").jqxPasswordInput({width: '170px', showStrength: false, showStrengthPosition: "right" });
                        $(".password, #nameUser").focusin(function (){
                            $("#MessageError").fadeOut("slow");
                        });
                        $("#formLogin").jqxValidator({
                            hintType: 'label',
                            animationDuration: 0,
                            rules: [
                                        {
                                            input: "#userName", 
                                            message: "El campo requerido!", 
                                            action: 'keyup, blur', 
                                            rule: "required"
                                        },
                                        {   
                                            input: "#password", 
                                            message: "La contrase�a es necesaria!", 
                                            action: 'keyup, blur', 
                                            rule: 'required' 
                                        }
                                    ]
                        });
                        $("#buttonGetStarted").click(function (){
                            $('#formLogin').jqxValidator('validate');
                            return false;
                        });
                        $('#formLogin').submit(function (){
                            $('#formLogin').jqxValidator('validate');
                        });
                        $('#formLogin').on('validationSuccess', function (event) {
                            //en el evento submit del fomulario
                            var datos = $("#formLogin").serialize(); // los datos del 
                            $.ajax({
                                type: "POST",
                                async: false,
                                url: "../serviceCandidate?statusAcount",
                                data:datos,
                                beforeSend: function (xhr) {
                                    $("#windowBlock").fadeIn("slow");
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert("Error interno del servidor");
                                    $("#windowBlock").fadeOut("slow");
                                },
                                success: function (data, textStatus, jqXHR) {
                                    if(data==="1logeado"){
                                        setTimeout(function(){
                                            $("#windowBlock").fadeOut("slow");
                                            window.location = "/preregistro/";
                                        }, 2000);
                                    }else if(data==="0noLogeado"){
                                        $("#windowBlock").fadeOut("slow");
                                        $("#message").text("Para iniciar sesi�n es necesario activar tu cuenta para ello revisa el correo que te hemos mandado.");
                                        $("#jqxwindow").jqxWindow("open");
                                        $("#MessageError").text("Es necesario activar la cuenta");
                                        $("#MessageError").fadeIn("slow");
                                    }else if(data==="0notExit"){
                                        $("#windowBlock").fadeOut("slow");
                                        $("#MessageError").text("Error datos incorrectos");
                                        $("#MessageError").fadeIn("slow");
                                    }
                                }
                            });
                        });

                        $("#formRegister").jqxValidator({
                            hintType: 'label',
                            animationDuration: 0,
                            rules: [
                                        {
                                            input: "#userNameRegister", 
                                            message: "El nombre de usuario es requerido :/", 
                                            action: 'keyup, blur', 
                                            rule: "required"
                                        },
                                        {
                                            input: "#userNameRegister", 
                                            message: "No se permiten espacios :/", 
                                            action: 'keyup, blur', 
                                            rule: function (input, commit) {
                                                // call commit with false, when you are doing server validation and you want to display a validation error on this field. 
                                                if (!(/\s/.test(input.val()))) {
                                                    return true;
                                                }
                                                return false;
                                            } 
                                        },
                                        {
                                            input: "#userNameRegister", 
                                            message: "La longitud m�xima es de 15 caracteres!", 
                                            action: 'keyup, blur', 
                                            rule: function (input, commit) {
                                                // call commit with false, when you are doing server validation and you want to display a validation error on this field. 
                                                if (!(input.val().length>=16)) {
                                                    return true;
                                                }
                                                return false;
                                            } 
                                        },
                                        {
                                            input: "#userNameRegister", 
                                            message: "La longitud minima es de 5 caracteres!", 
                                            action: 'keyup, blur', 
                                            rule: function (input, commit) {
                                                // call commit with false, when you are doing server validation and you want to display a validation error on this field. 
                                                if (!(input.val().length<5)) {
                                                    return true;
                                                }
                                                return false;
                                            } 
                                        },
                                        {
                                            input: "#userNameRegister", 
                                            message: "El nombre de usuario no esta disponible:/", 
                                            action: 'blur', 
                                            rule: function (input, commit) {
                                                var validate = false;
                                                // call commit with false, when you are doing server validation and you want to display a validation error on this field. 
                                                $.ajax({
                                                    type: "POST",
                                                    async: false,
                                                    url: "../serviceCandidate?validateUserName",
                                                    data: {"dataUserName": input.val()},
                                                    beforeSend: function (xhr) {
                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        alert("Error interno del servidor");
                                                    },
                                                    success: function (data, textStatus, jqXHR) {
                                                        if(data==="true"){
                                                            validate=true;
                                                        }
                                                    }
                                                });
                                                return validate;
                                            } 
                                        },
                                        {
                                            input: "#email", 
                                            message: "El correo es requerido :/", 
                                            action: 'keyup, blur', 
                                            rule: "required"
                                        },
                                        {
                                            input: "#email", 
                                            message: "Contiene espacios >_<", 
                                            action: 'keyup, blur', 
                                            rule: function (input, commit) {
                                                // call commit with false, when you are doing server validation and you want to display a validation error on this field. 
                                                if (!(/\s/.test(input.val()))) {
                                                    return true;
                                                }
                                                return false;
                                            } 
                                        },
                                        { 
                                            input: '#email', 
                                            message: 'Correo en uso', 
                                            action: 'keyup', 
                                            rule: function (input, commit) {
                                               var validate = false;
                                                // call commit with false, when you are doing server validation and you want to display a validation error on this field. 
                                                $.ajax({
                                                    type: "POST",
                                                    async: false,
                                                    url: "../serviceCandidate?validateEmail",
                                                    data: {"dataEmail": input.val()},
                                                    beforeSend: function (xhr) {
                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        alert("Error interno del servidor");
                                                    },
                                                    success: function (data, textStatus, jqXHR) {
                                                        if(data==="true"){
                                                            validate=true;
                                                        }
                                                    }
                                                });
                                                return validate;
                                            }  
                                        },
                                        { 
                                            input: '#email', 
                                            message: 'Seleccione un correo correcto :(', 
                                            action: 'keyup', 
                                            rule: 'email' 
                                        },
                                        {   
                                            input: "#password1", 
                                            message: "La contrase�a es necesaria :/", 
                                            action: 'keyup, blur', 
                                            rule: 'required' 
                                        },
                                        {   
                                            input: "#password2", 
                                            message: "La contrase�a es necesaria :/", 
                                            action: 'keyup, blur', 
                                            rule: 'required' 
                                        },
                                        {   
                                            input: "#password2", 
                                            message: "Las contrase�as no concuerdan >_<", 
                                            action: 'keyup, focus', 
                                            rule: function (input, commit) {
                                                // call commit with false, when you are doing server validation and you want to display a validation error on this field. 
                                                if (input.val() === $('#password1').val()) {
                                                    return true;
                                                }
                                                return false;
                                            } 
                                        }
                                    ]
                        });
                        $("#buttonGetStartedRegister").click(function (){
                            $('#formRegister').jqxValidator('validate');
                            return false;
                        });
                        $('#formRegister').submit(function (){
                            $('#formRegister').jqxValidator('validate');
                        });
                        $('#formRegister').on('validationSuccess', function (event) {
                            //en el evento submit del fomulario
                            var datos = $("#formRegister").serialize(); // los datos del 
                            $.ajax({
                                type: "POST",
                                async: false,
                                url: "../serviceCandidate?insert",
                                data:datos,
                                beforeSend: function (xhr) {
                                    $("#windowBlockRegister").fadeIn("slow");
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert("Error interno del servidor");
                                    $("#windowBlock").fadeOut("slow");
                                },
                                success: function (data, textStatus, jqXHR) {
                                    if(!(data==="error")){
                                        $.ajax({
                                            type: "POST",
                                            async: true,
                                            url: "../serviceMail?welcome",
                                            data: {
                                                "email":  $("#email").val(),
                                                "userName": $("#userNameRegister").val(),
                                                "password": $("#password1").val() 
                                            },
                                            beforeSend: function (xhr) {
                                                $("#windowBlockRegister").fadeIn("slow");
                                            },
                                            error: function (jqXHR, textStatus, errorThrown) {
                                                alert("Error interno del servidor");
                                                $("#windowBlockRegister").fadeOut("slow");
                                            },
                                            success: function (data, textStatus, jqXHR) {
                                                if(data==="Success"){                                                    
                                                    $("#message").text("Revisa tu correo te hemos mandado un link para activar tu cuenta.");
                                                    $("#jqxwindow").jqxWindow("open");
                                                    $(".login").slideDown(2000);
                                                    $(".register").slideUp("slow");
                                                }else if("FailConnectionNetwork"){
                                                    $("#message").text("Registro creado correctamente pero no fue posible mandar los datos a tu correo!");
                                                    $("#jqxwindow").jqxWindow("open");
                                                    $("#windowBlockRegister").fadeOut("slow");
                                                }
                                            }
                                        });
                                    }else{
                                        $("#windowBlockRegister").fadeOut("slow");
                                        $("#MessageErrorRegister").fadeIn("slow");
                                    }
                                }
                            });
                        });
                        $("#nonFolio").click(function (){
                           $(".login").slideUp("slow");
                           $(".register").slideDown(2000);
                        });
                        $("#back").click(function (){
                           $(".login").slideDown(2000);
                           $(".register").slideUp("slow");
                        });
                        $("#jqxwindow").jqxWindow({
                            height: 130,
                            width: 350,
                            theme: 'greenUtsem',
                            autoOpen: false,
                            isModal: true,
                            showCloseButton: true,
                            resizable: false,
                            position: "center",
                            okButton: $('#ok'),
                            initContent: function () {
                                $('#ok').jqxButton({
                                    width: '65px',
                                    theme: 'greenUtsem'
                                });
                                $('#ok').focus();
                            }
                        });
                    });
                </script>
            </html>
    <%}
}else{%>
    <!DOCTYPE>
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Inicio</title>
            <link rel="stylesheet" href="../content/files-css/main-system.css" type="text/css"/>
            <link href="../content/files-css/smart_wizard_verticalt.css" rel="stylesheet" type="text/css"/>
            <link type="text/css" rel="Stylesheet" href="../content/files-jq/<%out.print(vertion);%>/jqwidgets/styles/jqx.base.css" /> 
            <link href="../content/files-bs/bootstrap-3.2.0-dist/css/bootstrap.min.css" rel="stylesheet"/>
        </head>
        <body data-bind="greenUtsem">
            <div id="load-data" style="display: none">
                <div>Cargando datos...</div>
                <div id="loadContent">
                    <img src="../content/pictures-system/load.GIF" width="60" style="margin-right: 20px" />
                    Precargando informaci�n...
                </div>
            </div>
            <div id="alert" style="display: none">
                <div id="titleMessage"></div>
                <div id="loadContent" style="padding: 10px">
                    <div style="float: left; padding-top: 10px; width: 70px; height: auto;">
                        <img id="pictureMessage" width="70" />
                    </div>
                    <div>
                        <span id="ContentMessage" style="float: right; width: 230px; height: 60px; padding: 5px"></span>
                    </div>   
                    <div style="float: right; position: relative; top: 20px;">
                        <input type="button" id="ok" value="OK" style="margin-right: 10px" />
                        <input type="button" id="cancel" value="Cancelar" />
                    </div>
                </div>
            </div>
            <div id="content-elements" style="display: none">
                <div id="culumna-top" style="background: #009031 none repeat scroll 0% 0%;">
                    <img src="../content/pictures-system/UTSEM.jpg" style="width: 480px; height: 95px; margin-left: 63px; margin-top: 3px;"/>
                    <span style="position: absolute; right: 175px; top: 15px" class="logoSiut">SIUT</span>
                    <br>  
                    <span style="color: rgb(255, 255, 255); position: fixed; right: 221px; top: 20px; font-size: 32px;">
                        Sistema Integral Utsem Pre-registro
                        <b style="font-size: 51px; margin-top: 16px; display: block; text-align: right;"> Bienvenid@</b>
                    </span>
                </div>    
                <div id="wizard" class="swMain" style="display: none">
                    <!-- Tabs -->
                    <ul>
                        <li>
                            <a href="#step-1">
                                <span class="stepNumber">1</span>
                                <span class="stepDesc">Datos personales<br/>
                                    <small>Son datos b�sicos</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#step-2">
                                <span class="stepNumber">2</span>
                                <span class="stepDesc">Datos de ubicaci�n<br/>
                                    <small>Referencia de ubicaci�n</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#step-3">
                                <span class="stepNumber">3</span>
                                <span class="stepDesc">Datos del padre, madre y tutor<br/>
                                   <small>Informaci�n del tutor</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#step-4">
                                <span class="stepNumber">4</span>
                                <span class="stepDesc">Situaci�n<br/>
                                    <small>Informaci�n econ�mica familiar del estudiante</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#step-5">
                                <span class="stepNumber">5</span>
                                <span class="stepDesc">Resumen de registro<br/>
                                    <small>Detalles y acuerdos</small>
                                </span>
                            </a>
                        </li>
                    </ul>

                    <div id="content-steps">
                        <div id="step-1">
                            <div id="form1" class="form">
                                <fieldset>
                                    <h2 class="StepTitle">Datos personales</h2> 
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_career">Indique la carrera a la cual desea inscribirse</label><br>
                                        <span class="add-on"><i class="icon-asterisk"></i></span>
                                        <div data-type-role="combo" data-field="true" name="fk_career"  id="fk_career"></div>
                                        <br>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_name">Nombre</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" id="fl_name" data-field="true"  name="fl_name" placeholder="Nombre" style="width: 260px"/>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_patern_name">Apellido paterno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" id="fl_patern_name" name="fl_patern_name" data-field="true" placeholder="Apellido paterno" style="width: 160px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_matern_name">Apellido materno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" id="fl_matern_name" data-field="true"  name="fl_matern_name" placeholder="Apellido materno" style="width: 160px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_date_born">Fecha de nacimiento</label><br>
                                        <span class="add-on"><i class="icon-calendar"></i></span>  
                                        <div data-type-role="text" class="calendarInput" data-field="true"  name="fl_date_born"  id="fl_date_born"></div>
                                        <br><span>AAAA-MM-DD</span>
                                    </div>                            
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_gender">Sexo</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" value="Hombre"  data-field="true"  name="fl_gender"/> Hombre</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" value="Mujer" data-field="true"  name="fl_gender"/> Mujer</label>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_maritial_status">Estado civil</label><br>
                                        <span class="add-on"><i class="icon-adjust"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_maritial_status" id="fl_maritial_status"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_working">Se encuentra trabajando</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" data-field="true" value="Si"  name="fl_working"/> Si</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" data-field="true" value="No"  name="fl_working"/> No</label>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_curp">CURP</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_curp" name="fl_curp" placeholder="CURP" style="width: 185px"/>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <h2 class="StepTitle">Datos de la preparatoria de procedencia</h2> 
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_entity">Entidad</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_entity"  id="fk_entity"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_municipality">Municipio</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_municipality"  id="fk_municipality"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_locality">Localidad</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_locality"  id="fk_locality"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_preparatory">Preparatoria de procedencia</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_preparatory"  id="fk_preparatory"></div>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_bacherol_type">Tipo de bachillerato</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_bacherol_type"  id="fl_bacherol_type"></div>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_school_type">Tipo de escuela</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_school_type"  id="fl_school_type"></div>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_above_average">Promedio anterior</label><br>
                                        <span class="add-on"><i class="icon-question-sign"></i></span>  
                                        <div data-type-role="text" data-field="true" name="fl_above_average"  id="fl_above_average"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_period_bacherol">Periodo en el que realiz� el bachillerato</label><br>
                                        <span class="add-on"><i class="icon-calendar"></i></span>  
                                        <input data-type-role="text" data-field="true" name="fl_period_bacherol"  id="fl_period_bacherol" style="height: 26px"/><br>
                                        <span style="margin-left: 20px; color: rgb(141, 141, 141)">(A�o inicio)-(A�o final)</span>
                                    </div>
                                </fieldset>
                            </div> 
                        </div> 
                        <div id="step-2">  
                            <div id="form2" class="form">
                                <fieldset>
                                    <h2 class="StepTitle">Registra tus datos de nacimiento</h2>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_born_entity">Entidad</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_born_entity"  id="fk_born_entity"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_born_municipality">Municipio</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_born_municipality"  id="fk_born_municipality"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_born_locality">Localidad</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_born_locality"  id="fk_born_locality"></div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <h2 class="StepTitle">Registra tus datos donde vives en la actualidad</h2>	
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_current_entity">Entidad</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_current_entity"  id="fk_current_entity"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_current_municipality">Municipio</label><br>
                                        <span class="add-on"><i class="icon-home"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_current_municipality"  id="fk_current_municipality"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_current_locality">Localidad</label><br>
                                        <span class="add-on"><i class="icon-home"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_current_locality"  id="fk_current_locality"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_current_colony">Colonia</label><br>
                                        <span class="add-on"><i class="icon-home"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_current_colony" name="fl_current_colony" placeholder="Colonia..." style="width: 360px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_name_street">Calle</label><br>
                                        <span class="add-on"><i class="icon-road"></i></span>  
                                        <input  data-type-role="text" data-field="true"  id="fl_name_street" name="fl_name_street" placeholder="Calle donde vive..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_external_number">N�mero exterior</label><br>
                                        <span class="add-on"><i class="icon-star"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_external_number" name="fl_external_number" placeholder="No." style="width: 40px"/>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_internal_number">N�mero interior</label><br>
                                        <span class="add-on"><i class="icon-star"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_internal_number" name="fl_internal_number" placeholder="No." style="width: 40px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_between_street1">Entre calle</label><br>
                                        <span class="add-on"><i class="icon-road"></i></span>  
                                        <input  data-type-role="text" data-field="true"  id="fl_between_street1" name="fl_between_street1" placeholder="Entre calle..." style="width: 260px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_between_street2">Y calle</label><br>
                                        <span class="add-on"><i class="icon-road"></i></span>  
                                        <input  data-type-role="text" data-field="true"  id="fl_between_street2" name="fl_between_street2" placeholder="Y calle..." style="width: 360px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_reference">Alguna referencia cerca</label><br>
                                        <span class="add-on"><i class="icon-eye-open"></i></span>  
                                        <input  data-type-role="text" data-field="true"  id="fl_reference" name="fl_reference" placeholder="Alguna referencia cerca..." style="width: 460px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_zip_code">C�digo postal</label><br>
                                        <span class="add-on"><i class="icon-lock"></i></span>  
                                        <div data-type-role="text" data-field="true"  class="zip-codeInput" id="fl_zip_code" name="fl_zip_code"></div>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_phone_home">Tel�fono de casa</label><br>
                                        <span class="add-on"><i class="icon-tag"></i></span>  
                                        <div data-type-role="text" data-field="true"  class="telephoneInput" id="fl_phone_home" name="fl_phone_home"></div>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_cell_phone">Celular</label><br>
                                        <span class="add-on"><i class="icon-tag"></i></span>  
                                        <div data-type-role="text" data-field="true"  class="telephoneInput" id="fl_cell_phone" name="fl_cell_phone"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_mail">Correo electr�nico</label><br>
                                        <span class="add-on"><i class="icon-envelope"></i></span>  
                                        <input data-type-role="text"  data-field="true"  id="fl_mail" name="fl_mail" placeholder="Correo electr�nico..." style="width: 300px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_facebook">Link de Facebook opcional</label><br>
                                        <span class="add-on"><i class="icon-thumbs-up"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_facebook" name="fl_facebook" placeholder="Link de facebook..." style="width: 260px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_twitter">Link de Twitter opcional</label><br>
                                        <span class="add-on"><i class="icon-thumbs-up"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_twitter" name="fl_twitter" placeholder="Link de twitter..." style="width: 360px"/>
                                    </div>
                                </fieldset>
                            </div> 
                        </div>                      
                        <div id="step-3">
                            <div id="form3" class="form">
                                <fieldset>
                                    <h2 class="StepTitle">Registra los datos del padre</h2>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_name_father">Nombre del padre</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_name_father" name="fl_name_father" placeholder="Nombre..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_patern_name_father">Apellido paterno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_patern_name_father" name="fl_patern_name_father" placeholder="Apellido paterno..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_matern_name_father">Apellido materno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_matern_name_father" name="fl_matern_name_father" placeholder="Apellido materno..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_born_date_father">Fecha de nacimiento</label><br>
                                        <span class="add-on"><i class="icon-calendar"></i></span>  
                                        <div data-type-role="text" class="calendarInput" data-field="true"  name="fl_born_date_father"  id="fl_born_date_father"></div>
                                        <br><span>AAAA-MM-DD</span>
                                    </div> 
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_maritial_state_father">Estado civil</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_maritial_state_father" id="fl_maritial_state_father"></div>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_level_education_father">Nivel de educaci�n</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_level_education_father" id="fl_level_education_father"></div>
                                    </div>
                                </fieldset>
                                 <fieldset>
                                    <h2 class="StepTitle">Registra los datos de la madre</h2>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_name_mother">Nombre de la madre</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_name_mother" name="fl_name_mother" placeholder="Nombre..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_patern_name_mother">Apellido paterno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_patern_name_mother" name="fl_patern_name_mother" placeholder="Apellido paterno..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_matern_name_mother">Apellido materno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_matern_name_mother" name="fl_matern_name_mother" placeholder="Apellido materno..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_born_date_mother">Fecha de nacimiento</label><br>
                                        <span class="add-on"><i class="icon-calendar"></i></span>  
                                        <div data-type-role="text" class="calendarInput" data-field="true"  name="fl_born_date_mother"  id="fl_born_date_mother"></div>
                                        <br><span>AAAA-MM-DD</span>
                                    </div> 
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_maritial_state_mother">Estado civil</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_maritial_state_mother" id="fl_maritial_state_mother"></div>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_level_education_mother">Nivel de educaci�n</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_level_education_mother" id="fl_level_education_mother"></div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <h2 class="StepTitle">Registra los datos de nacimiento del tutor</h2>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_born_entity_tutor">Entidad</label><br>
                                        <span class="add-on"><i class="icon-book"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_born_entity_tutor"  id="fk_born_entity_tutor"></div>
                                    </div>                                        
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_born_municipality_tutor">Municipio</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_born_municipality_tutor"  id="fk_born_municipality_tutor"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_born_locality_tutor">Localidad</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_born_locality_tutor"  id="fk_born_locality_tutor"></div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <h2 class="StepTitle">Registra los datos del tutor donde vive en la actualidad</h2>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_current_entity_tutor">Entidad</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_current_entity_tutor"  id="fk_current_entity_tutor"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_current_municipality_tutor">Municipio</label><br>
                                        <span class="add-on"><i class="icon-home"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_current_municipality_tutor"  id="fk_current_municipality_tutor"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fk_current_locality_tutor">Localidad</label><br>
                                        <span class="add-on"><i class="icon-home"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fk_current_locality_tutor"  id="fk_current_locality_tutor"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_colony_tutor">Colonia</label><br>
                                        <span class="add-on"><i class="icon-home"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_colony_tutor" name="fl_colony_tutor" placeholder="Colonia..." style="width: 360px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_street_name_tutor">Calle donde vive</label><br>
                                        <span class="add-on"><i class="icon-road"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_street_name_tutor" name="fl_street_name_tutor" placeholder="Calle donde vive..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_external_number_tutor">N�mero exterior</label><br>
                                        <span class="add-on"><i class="icon-star"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_external_number_tutor" name="fl_external_number_tutor" placeholder="No." style="width: 40px"/>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_internal_number_tutor">N�mero interior</label><br>
                                        <span class="add-on"><i class="icon-star"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_internal_number_tutor" name="fl_internal_number_tutor" placeholder="No." style="width: 40px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_between_street1_tutor">Entre calle</label><br>
                                        <span class="add-on"><i class="icon-road"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_between_street1_tutor" name="fl_between_street1_tutor" placeholder="Entre calle..." style="width: 260px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_between_street2_tutor">Y calle</label><br>
                                        <span class="add-on"><i class="icon-road"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_between_street2_tutor" name="fl_between_street2_tutor" placeholder="Y calle..." style="width: 360px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_reference_tutor">Alguna referencia cerca</label><br>
                                        <span class="add-on"><i class="icon-eye-open"></i></span>  
                                        <input data-type-role="text" data-field="true"  id="fl_reference_tutor" name="fl_reference_tutor" placeholder="Alguna referencia cerca..." style="width: 460px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_zip_code_tutor">C�digo postal</label><br>
                                        <span class="add-on"><i class="icon-lock"></i></span>  
                                        <div data-type-role="text" data-field="true" class="zip-codeInput" name="fl_zip_code_tutor" id="fl_zip_code_tutor"></div>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_phone_home_tutor">Tel�fono de casa</label><br>
                                        <span class="add-on"><i class="icon-tag"></i></span>  
                                        <div data-type-role="text" data-field="true" class="telephoneInput" name="fl_phone_home_tutor" id="fl_phone_home_tutor"></div>
                                    </div>
                                    <div class="div-row2 input-prepend">
                                        <label class="label-row" for="fl_cell_phone_tutor">Celular</label><br>
                                        <span class="add-on"><i class="icon-tag"></i></span>  
                                        <div data-type-role="text" data-field="true" class="telephoneInput" name="fl_cell_phone_tutor" id="fl_cell_phone_tutor"></div>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_emergency_phone1">Tel�fono de emergencia 1</label><br>
                                        <span class="add-on"><i class="icon-tag"></i></span>  
                                        <div data-type-role="text" data-field="true" class="telephoneInput" name="fl_emergency_phone1" id="fl_emergency_phone1"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_emergency_phone2">Tel�fono de emergencia 2</label><br>
                                        <span class="add-on"><i class="icon-tag"></i></span>  
                                        <div data-type-role="text" data-field="true" class="telephoneInput" name="fl_emergency_phone2" id="fl_emergency_phone2"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_mail_tutor">Correo electr�nico</label><br>
                                        <span class="add-on"><i class="icon-envelope"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_mail_tutor" name="fl_mail_tutor" placeholder="Correo electr�nico..." style="width: 300px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_facebook_tutor">Link de Facebook opcional</label><br>
                                        <span class="add-on"><i class="icon-thumbs-up"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_facebook_tutor" name="fl_facebook_tutor" placeholder="Link de facebook..." style="width: 260px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_twitter_tutor">Link de Twitter opcional</label><br>
                                        <span class="add-on"><i class="icon-thumbs-up"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_twitter_tutor" name="fl_twitter_tutor" placeholder="Link de twitter..." style="width: 360px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_tutor_relationship">Parentesco con el tutor</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_tutor_relationship"  id="fl_tutor_relationship"></div>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_name_tutor">Nombre del tutor</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_name_tutor" name="fl_name_tutor" placeholder="Nombre..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_patern_name_tutor">Apellido paterno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_patern_name_tutor" name="fl_patern_name_tutor" placeholder="Apellido paterno..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_matern_name_tutor">Apellido materno</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" id="fl_matern_name_tutor" name="fl_matern_name_tutor" placeholder="Apellido materno..." style="width: 240px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_born_date_tutor">Fecha de nacimiento</label><br>
                                        <span class="add-on"><i class="icon-calendar"></i></span>  
                                        <div data-type-role="text" class="calendarInput" data-field="true"  name="fl_born_date_tutor"  id="fl_born_date_tutor"></div>
                                        <br><span>AAAA-MM-DD</span>
                                    </div> 
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_gender_tutor">Sexo</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" value="Hombre"  data-field="true"  name="fl_gender_tutor"/> Hombre</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" value="Mujer" data-field="true"  name="fl_gender_tutor"/> Mujer</label>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_maritial_state_tutor">Estado civil</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_maritial_state_tutor" id="fl_maritial_state_tutor"></div>
                                    </div>
                                    <div class="div-row1 input-prepend">
                                        <label class="label-row" for="fl_level_education">Nivel de educaci�n</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_level_education" id="fl_level_education"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_occupation_tutor">Ocupaci�n</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>   
                                        <input data-type-role="text" data-field="true" name="fl_occupation_tutor" placeholder="Ocupaci�n..." style="width: 285px"/>
                                    </div>
                                </fieldset>
                            </div> 
                        </div>
                        <div id="step-4">
                            <div id="form4" class="form">
                                <fieldset>
                                    <h2 class="StepTitle">Situaci�n econ�mica familiar del estudiante</h2>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_house_status">�Actualmente cuenta con casa...?</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_house_status" id="fl_house_status"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_wall_material">�Cu�l es el material con el que est�n hechas las paredes?</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_wall_material" id="fl_wall_material"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_roof_material">�De qu� material est� construido el techo?</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>  
                                        <div data-type-role="combo" data-field="true" name="fl_roof_material" id="fl_roof_material"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_floor_material">�Tipo de material es el piso?</label><br>
                                        <span class="add-on"><i class="icon-list"></i></span>
                                        <div data-type-role="combo" data-field="true" name="fl_floor_material" id="fl_floor_material"></div>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 15px;">
                                        <label class="label-row">�La vivienda donde vive cuenta con...?</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_room" id="fl_room"/>   
                                        <label class="checkbox-inline label-row" for="fl_room" style="margin-left: 10px; display: inline;">Sala</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_dining_room" id="fl_dining_room"/>    
                                        <label class="checkbox-inline label-row" for="fl_dining_room" style="margin-left: 10px; display: inline;">Comedor</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_kitchen" id="fl_kitchen"/>    
                                        <label class="checkbox-inline label-row" for="fl_kitchen" style="margin-left: 10px; display: inline;">Cocina</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_toilet" id="fl_toilet"/>
                                        <label class="checkbox-inline label-row" for="fl_toilet" style="margin-left: 10px; display: inline;">Ba�o</label><br>                                     
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 15px;">
                                        <label class="label-row" for="total_rooms">Seleccione con cuales de los siguientes aparatos electrodom�sticos cuenta en casa</label><br>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_television" id="fl_television"/>   
                                        <label class="checkbox-inline label-row" for="fl_television" style="margin-left: 10px; display: inline;">Televisi�n</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_stereo" id="fl_stereo"/>   
                                        <label class="checkbox-inline label-row" for="fl_stereo" style="margin-left: 10px; display: inline;">Sonido est�reo</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_dvd" id="fl_dvd"/>   
                                        <label class="checkbox-inline label-row" for="fl_dvd" style="margin-left: 10px; display: inline;">Video (dvd)</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_computer" id="fl_computer"/>   
                                        <label class="checkbox-inline label-row" for="fl_computer" style="margin-left: 10px; display: inline;">Computadora</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_laptop" id="fl_laptop"/>   
                                        <label class="checkbox-inline label-row" for="fl_laptop" style="margin-left: 10px; display: inline;">Laptop</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 15px;">
                                        <label class="label-row" for="total_rooms">Seleccione con cuales de los siguientes aparatos de l�nea blanca cuenta en casa</label><br>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_refrigerator" id="fl_refrigerator"/>   
                                        <label class="checkbox-inline label-row" for="fl_refrigerator" style="margin-left: 10px; display: inline;">Refrigerador</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_washer" id="fl_washer"/>   
                                        <label class="checkbox-inline label-row" for="fl_washer" style="margin-left: 10px; display: inline;">Lavadora</label>
                                    </div>
                                    <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                        <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_stove" id="fl_stove"/>   
                                        <label class="checkbox-inline label-row" for="fl_stove" style="margin-left: 10px; display: inline;">Estufa</label>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_number_members_famly">�Cu�ntos miembros son el la familia que actualmente est�n en casa?</label><br>
                                        <span class="add-on"><i class="icon-question-sign"></i></span>  
                                        <div data-type-role="text" data-field="true" name="fl_number_members_famly"  id="fl_number_members_famly"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_family_monthly_income">Calcule aproximadamente el ingreso mensual familiar</label><br>
                                        <span class="add-on"><i class="icon-question-sign"></i></span>  
                                        <div data-type-role="text" data-field="true" class="numberInputMoney" name="fl_family_monthly_income" id="fl_family_monthly_income"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_family_monthly_discharge">Calcule aproximadamente el egreso mensual familiar</label><br>
                                        <span class="add-on"><i class="icon-question-sign"></i></span>  
                                        <div data-type-role="text" data-field="true" class="numberInputMoney" name="fl_family_monthly_discharge" id="fl_family_monthly_discharge"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_student_montgly_income">�Cu�nto es el total de tu ingreso mensual "que te aportan tus pap�s o tutor" incluyendo tu salario si es que trabajas?</label><br>
                                        <span class="add-on"><i class="icon-question-sign"></i></span>  
                                        <div data-type-role="text" data-field="true" class="numberInputMoney" name="fl_student_montgly_income" id="fl_student_montgly_income"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_student_montgly_discharge">�Cu�l es tu egreso mensual?</label><br>
                                        <span class="add-on"><i class="icon-question-sign"></i></span>  
                                        <div data-type-role="text" data-field="true" class="numberInputMoney" name="fl_student_montgly_discharge" id="fl_student_montgly_discharge"></div>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_physical_disability">Presenta alguna discapacidad</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" data-field="true" value="Si" name="fl_physical_disability"/> Si</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" data-field="true" value="No" name="fl_physical_disability"/> No</label>    
                                    </div>
                                    <div class="div-row input-prepend" id="disability_name_div">
                                        <label class="label-row" for="fl_disability_name">�Cu�l?</label><br>
                                        <span class="add-on"><i class=" icon-eye-close"></i></span>  
                                        <input data-type-role="text" id="fl_disability_name" data-field="true" name="fl_disability_name" placeholder="Cu�l..." style="width: 160px"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_indigenous_group">Pertenece a un grupo ind�gena</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" data-field="true" value="Si" name="fl_indigenous_group"/> Si</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input data-type-role="radio" type="radio" data-field="true" value="No" name="fl_indigenous_group"/> No</label>
                                    </div>
                                    <div class="div-row input-prepend" id="indigenous_group_name_div">
                                        <label class="label-row" for="fl_indigenous_group_name">�Cu�l?</label><br>
                                        <span class="add-on"><i class="icon-question-sign"></i></span>  
                                        <input data-type-role="text" id="fl_indigenous_group_name" data-field="true" name="fl_indigenous_group_name" placeholder="Cu�l..." style="width: 160px"/>
                                    </div>

                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_secutity_medical">�Cuenta con seguro m�dico o de salud?</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input type="radio" data-type-role="radio" data-field="true" value="Si" name="fl_secutity_medical"/> Si</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input type="radio" data-type-role="radio" data-field="true" value="No" name="fl_secutity_medical"/> No</label>
                                    </div>
                                    <div id="fl_number_security_medical_div" style="display: none">
                                        <div class="div-row input-prepend">
                                            <label class="label-row" for="fl_security_name">�Cu�l?</label><br>
                                            <span class="add-on"><i class="icon-text-width"></i></span>      
                                            <input data-type-role="text" data-field="true" name="fl_security_name" placeholder="Nombre..." style="width: 285px"/>
                                        </div>
                                        <div class="div-row input-prepend">
                                            <label class="label-row" for="fl_number_security_medical">N�mero de su seguro m�dico</label><br>
                                            <span class="add-on"><i class="icon-text-width"></i></span>  
                                            <input data-type-role="text" data-field="true" name="fl_number_security_medical" placeholder="No."/>
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <h2 class="StepTitle">Dependiente econ�mico</h2>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_whom_depend">�De qui�n dependes econ�micamente?</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>  
                                        <input data-type-role="text" data-field="true" name="fl_whom_depend" placeholder="Parentesco"/>
                                    </div>
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_depend_economically_work">�De qui�n dependes econ�micamente trabaja?</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input type="radio" data-type-role="radio" data-field="true" value="Si" name="fl_depend_economically_work"/> Si</label><br>
                                        <label style="font-size: 16px; line-height: 32px;"><input type="radio" data-type-role="radio" data-field="true" value="No" name="fl_depend_economically_work"/> No</label>
                                    </div>
                                    <div id="fl_what_work_div" style="display: none">
                                        <div class="div-row input-prepend">
                                            <label class="label-row" for="fl_where_work">�D�nde?</label><br>
                                            <span class="add-on"><i class="icon-text-width"></i></span>      
                                            <input data-type-role="text" data-field="true" name="fl_where_work" placeholder="Lugar.." style="width: 285px"/>
                                        </div>
                                        <div class="div-row input-prepend">
                                            <label class="label-row" for="fl_what_work">�En qu� trabaja?</label><br>
                                            <span class="add-on"><i class="icon-text-width"></i></span>  
                                            <input data-type-role="text" data-field="true" name="fl_what_work" placeholder="Puesto de desempe�o"/>
                                        </div>
                                    </div>                                    
                                </fieldset>
                            </div>
                        </div>
                        <div id="step-5">
                            <h2 class="StepTitle">Resumen del registro</h2>
                            <div id="summary-content"></div>
                            <div id="form5" class="form">
                                <h2 class="StepTitle">Difusi�n</h2><br>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 15px;">
                                    <label class="label-row" for="total_rooms">Seleccione el medio de difusi�n por el cual se enter� de la comunidad de estudios en la UTsem.</label><br>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_call" id="fl_diffusion_call"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_call" style="margin-left: 10px; display: inline;">Convocatoria</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_cartel" id="fl_diffusion_cartel"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_cartel" style="margin-left: 10px; display: inline;">Cartel</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_plantel_talks" id="fl_diffusion_plantel_talks"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_plantel_talks" style="margin-left: 10px; display: inline;">Pl�ticas en el plantel</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_personal_ut" id="fl_diffusion_personal_ut"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_personal_ut" style="margin-left: 10px; display: inline;">Personal del UT</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_graduates" id="fl_diffusion_graduates"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_graduates" style="margin-left: 10px; display: inline;">Egresados(as) de la UT</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_family_friends" id="fl_diffusion_family_friends"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_family_friends" style="margin-left: 10px; display: inline;">Familiares y amigos</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_directlt_ut" id="fl_diffusion_directlt_ut"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_directlt_ut" style="margin-left: 10px; display: inline;">Directamente en la UT</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_brochure" id="fl_diffusion_brochure"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_brochure" style="margin-left: 10px; display: inline;">Folleto</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_newspaper" id="fl_diffusion_newspaper"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_newspaper" style="margin-left: 10px; display: inline;">Peri�dico</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_students_ut" id="fl_diffusion_students_ut"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_students_ut" style="margin-left: 10px; display: inline;">Estudiantes de la UT</label>
                                </div>   
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_manta" id="fl_diffusion_manta"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_manta" style="margin-left: 10px; display: inline;">Manta</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_triptych" id="fl_diffusion_triptych"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_triptych" style="margin-left: 10px; display: inline;">Tr�ptico</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_guided_visits" id="fl_diffusion_guided_visits"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_guided_visits" style="margin-left: 10px; display: inline;">Visitas guiadas</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox" value="Si" name="fl_diffusion_exhibitions" id="fl_diffusion_exhibitions"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_exhibitions" style="margin-left: 10px; display: inline;">Exposiciones</label>
                                </div>
                                <div class="div-row input-prepend" style="min-height: 0px; margin-bottom: 0px;">
                                    <input data-type-role="checkbox" data-field="true" type="checkbox"  value="Si" name="fl_diffusion_other" id="fl_diffusion_other"/>   
                                    <label class="checkbox-inline label-row" for="fl_diffusion_other" style="margin-left: 10px; display: inline;">Otro</label>
                                </div>
                                <div id="fl_diffusion_other_div" style="display: none">
                                    <div class="div-row input-prepend">
                                        <label class="label-row" for="fl_diffusion_other_name">�Cu�l?</label><br>
                                        <span class="add-on"><i class="icon-text-width"></i></span>      
                                        <input data-type-role="text" data-field="true" name="fl_diffusion_other_name" placeholder="Nombre..." style="width: 285px"/>
                                    </div>
                                </div>
                                <div class="div-row input-prepend">
                                    <label class="label-row" for="fl_option_utsem_study">�Qu� opci�n es para ti la UTsem para la continuidad de Estudios?</label><br>
                                    <span class="add-on"><i class="icon-list"></i></span>
                                    <div data-type-role="combo" data-field="true" name="fl_option_utsem_study" id="fl_option_utsem_study"></div>
                                </div>
                                <form action="../servicePdf" target="_blank" method="POST" id="exportToPdf"></form>    
                            </div>
                        </div>
                    </div>
                </div>
                <div id="culumna-bottom" style="background: #009031 none repeat scroll 0% 0%;">
                    <p>Distribuci�n siut� 2015 Versi�n 1.10.15 - Universidad Tecnol�gica Del Sur Del Estado de M�xico</p>
                </div>
            </div>
        <!-- End SmartWizard Content -->  		
        </body>    
        <script type="text/javascript" src="../content/files-jq/jquery-2.0.2.min.js"></script>
        <script type="text/javascript" src="../content/files-js/js-wizard/jquery.smartWizard.js"></script>
        <script type="text/javascript" src="../content/files-bs/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>    
        <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/scripts/get-theme.js"></script>
        <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqxcore.js"></script>
        <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/globalization/globalize.js"></script> 
        <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/globalization/globalize.cultures.js"></script> 
        <script type="text/javascript" src="../content/files-jq/<%out.print(vertion);%>/jqwidgets/jqx-all.js"></script>
        <script type="text/javascript" src="../content/files-js/make-combo.js"  charset="UTF-8"></script>
        <script type="text/javascript" src="../content/files-js/make-list.js"  charset="UTF-8"></script>
        <script type="text/javascript" src="../content/files-js/make-input.js"  charset="UTF-8"></script>
        <script type="text/javascript" src="../content/files-jq/jquery.cookie.js"  charset="UTF-8"></script>
        <script type="text/javascript" charset="UTF-8">
            $(document).ready(function(){
                window.location.hash="";
                window.location.hash=""; //chrome
                window.onhashchange=function(){window.location.hash="";};
                window.onload = function() {
                    loadWisard();
                };
                function loadWisard(){
                    $("input[type=radio]").removeAttr("class");
                    var itemActive;
                    var selectedItem = $.cookie('itemActive');
                    if(selectedItem!==undefined){
                        itemActive = selectedItem;
                    }else{
                        itemActive=0;
                    }
                    $('#wizard').smartWizard({
                        transitionEffect:'slide',
                        onLeaveStep:leaveAStepCallback,
                        onFinish:onFinishCallback,
                        onShowStep: onShowStep,
                        selected: itemActive,
                        enableAllSteps: true,
                        enableFinishButton:true,
                        keyNavigation:false,
                        progressBar:true
                    });
                    $('#wizard').fadeIn("slow");

                    function leaveAStepCallback(obj){  
                        var step_num= obj.attr('rel');
                        return validateSteps(step_num);
                    }
                    function onShowStep(obj){ 
                        var step_num= obj.attr('rel');
                        if(step_num==="5"){
                            $(".buttonFinish").show();
                            var contentFieldset="";
                            var form="<form>";
                            var nodo=0;
                            $("#summary-content").html("");
                            $("fieldset").each(function (){
                                var fieldset="<fieldset>";
                                fieldset=fieldset+"<h2 class='StepTitle'>"+$(this).children(".StepTitle").text()+"</h2><br>";
                                $("fieldset:eq("+nodo+") .input-prepend").each(function (){
                                    var attr_for=$(this).children(".label-row").attr("for");
                                    var data_type=$("[name="+attr_for+"]").attr("data-type-role");
                                    if(data_type==="text"){
                                        if(attr_for==="fl_disability_name" && $("input[name=fl_physical_disability]:checked").val()==="No"){
                                        }else if(attr_for==="fl_number_security_medical" && $("input[name=fl_secutity_medical]:checked").val()==="No"){
                                        }else if(attr_for==="fl_security_name" && $("input[name=fl_secutity_medical]:checked").val()==="No"){
                                        }else if(attr_for==="fl_indigenous_group_name" && $("input[name=fl_indigenous_group]:checked").val()==="No"){
                                        }else if(attr_for==="fl_where_work" && $("input[name=fl_depend_economically_work]:checked").val()==="No"){
                                        }else if(attr_for==="fl_what_work" && $("input[name=fl_depend_economically_work]:checked").val()==="No"){
                                        }else{
                                            fieldset=fieldset+"<div class='"+$(this).attr("class")+"'><label>"+$(this).children(".label-row").text()+"</label><br><label style='text-decoration: underline;'>"+$("input[name="+attr_for+"]").val()+"</label></div>";
                                        }
                                    }
                                    if(data_type==="radio"){
                                        fieldset=fieldset+"<div class='"+$(this).attr("class")+"'><label>"+$(this).children(".label-row").text()+"</label><br><label style='text-decoration: underline;'>"+$("input[name="+attr_for+"]:checked").val()+"</label></div>";
                                    }
                                    if(data_type==undefined){
                                        fieldset=fieldset+"<div style='margin-bottom: 15px;'><label>"+$(this).children(".label-row").text()+"</label><br></div>";
                                    }
                                    if(data_type==="checkbox"){
                                        if($("input[name="+attr_for+"]").prop('checked')){
                                           fieldset=fieldset+"<div style='margin-bottom: 15px;'><label style='text-decoration: underline;'>"+$(this).children(".label-row").text()+"</label><br></div>"; 
                                        }
                                    }
                                    if(data_type==="combo"){
                                        var item=$('#'+attr_for).jqxDropDownList('getSelectedItem');
                                        if(item!==null){
                                            fieldset=fieldset+"<div class='"+$(this).attr("class")+"'><label>"+$(this).children(".label-row").text()+"</label><br><label style='text-decoration: underline;'>"+item.label+"</label></div>";
                                        }else{
                                            fieldset=fieldset+"<div class='"+$(this).attr("class")+"'><label>"+$(this).children(".label-row").text()+"</label><br><label style='text-decoration: underline; color:#FB3500;'>SELECCIONAR</label></div>";
                                        }
                                    }
                                });
                                fieldset=fieldset+"</fieldset>";
                                contentFieldset=contentFieldset+fieldset;
                                nodo++;
                            });
                            form=form+contentFieldset+"</form>";
                            $("#summary-content").html(form);
                            $.cookie('itemActive',3);
                            if(validateSteps("5")){
                                $(".buttonFinish").text("Salir");
                            }
                        }else{
                            $(".buttonFinish").hide();
                            itemActive=step_num-1;
                            $.cookie('itemActive',itemActive);
                        }
                    }
                    function onFinishCallback(){
                        if($('#wizard').smartWizard('currentStep')!==5){
                            $('#wizard').smartWizard('goToStep',5);
                        }else{
                            $("#content-steps").scrollTop(0);
                            if(validateSteps("5")){
                                $(".buttonFinish").text("Salir");
                                if($(".buttonFinish").attr("role")==="close"){
                                    location="../serviceCandidate?statusLogin=out&&statusAcount";
                                }else{
                                    $.ajax({
                                        type: "POST",
                                        url: "../serviceMail",
                                        data: {"mail" : $("#fl_mail").val(), "name" : $("#fl_name").val()+" "+$("#fl_patern_name").val()+" "+$("#fl_matern_name").val()},
                                        beforeSend: function (xhr) {
                                            $("#pictureMessage").attr("src","../content/pictures-system/load.GIF");
                                            $('#titleMessage').text('Generando ficha...');
                                            $("#ContentMessage").html("Estamos trabajando...<br>Para terminar con este proceso es necesario acudir al departamento de servicios escolares de la UTSEM.");
                                            $("#ok").hide();
                                            $("#cancel").hide();
                                            $("#alert").jqxWindow('open');   
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            alert("Error interno del servidor");
                                        },
                                        success: function (data, textStatus, jqXHR) {
                                            $(".buttonFinish").attr("role","close");
                                            $(".buttonFinish").text("Cerrar Sesi�n");
                                            $("#pictureMessage").attr("src","../content/pictures-system/ok.png");
                                            $('#titleMessage').text('Pre-registro exitoso');
                                            $("#ContentMessage").html("Por ahora hemos terminado.<br><b>Debe de imprimir el documento!<b>");
                                            $("#ok").css("width","125px");
                                            $("#ok").val("Exportar a PDF");
                                            $("#ok").show();
                                            $("#cancel").hide();
                                            $("#alert").jqxWindow('open');
                                            $("#ok").click(function (){
                                                $("#exportToPdf").submit();
                                            });
                                        }                                    
                                    });
                                }                                    
                            }else{
                                $(".buttonFinish").text("Terminar");
                                $("#content-steps").scrollTop(10000);
                            }
                        }
                    }
                }

                var itemEntity=0;
                var itemMunicipality=0;
                var itemLocality=0;
                var itemPreparatory=0;
                var dataExternal;
                var theme=getDemoTheme();   
                $("#load-data").jqxWindow({
                    theme:theme,
                    width: 370, 
                    height: 100,
                    showCloseButton: false,    
                    position: { x: (($(document).width()/2)-(370/2)), y: (($(document).height()/2)-100) },
                    resizable: false,  
                    draggable: false,
                    isModal: true, 
                    autoOpen: false, 
                    modalOpacity: 0.3           
                });
                $("#alert").jqxWindow({
                    theme:theme,
                    width: 370, 
                    height: 160,
                    showCloseButton: false,    
                    position: { x: (($(document).width()/2-100)), y: (($(document).height()/2)-100) },
                    resizable: false,  
                    draggable: false,
                    isModal: true, 
                    autoOpen: false, 
                    modalOpacity: 0.1,
                    okButton: $('#ok'),
                    cancelButton: $('#cancel'),
                    initContent: function () {
                        $('#ok').jqxButton({
                            width: '126px',
                            theme: 'energyblue'
                        });
                        $('#cancel').jqxButton({
                            width: '65px',
                            theme: 'energyblue'
                        });
                        $('#ok').focus();
                    }
                });
                $("[name=fl_physical_disability]").change(function (){
                    if($(this).val()==="Si"){
                        $("#disability_name_div").fadeIn();
                    }else{
                        $("input[name=fl_disability_name]").val("");
                        $("#disability_name_div").fadeOut();
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_disability_name","field_value":""},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                    }
                });
                $("[name=fl_indigenous_group]").change(function (){
                    if($(this).val()==="Si"){
                        $("#indigenous_group_name_div").fadeIn();
                    }else{
                        $("input[name=fl_indigenous_group_name]").val("");
                        $("#indigenous_group_name_div").fadeOut();
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_indigenous_group_name","field_value":""},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                    }
                });
                $("[name=fl_secutity_medical]").change(function (){
                    if($(this).val()==="Si"){
                        $("#fl_number_security_medical_div").fadeIn();
                    }else{
                        $("input[name=fl_security_name]").val("");
                        $("input[name=fl_number_security_medical]").val("");
                        $("#fl_number_security_medical_div").fadeOut();
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_security_name","field_value":""},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_number_security_medical","field_value":""},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                    }
                });
                $("[name=fl_depend_economically_work]").change(function (){
                    if($(this).val()==="Si"){
                        $("#fl_what_work_div").fadeIn();
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_depend_economically_work","field_value":$(this).val()},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                    }else{
                        $("input[name=fl_where_work]").val("");
                        $("input[name=fl_what_work]").val("");
                        $("#fl_what_work_div").fadeOut();
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_where_work","field_value":""},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_what_work","field_value":""},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                    }
                });
                $("[name=fl_diffusion_other]").change(function (){
                    if($(this).prop("checked")){
                        $("#fl_diffusion_other_div").fadeIn();
                    }else{
                        $("input[name=fl_diffusion_other_name]").val("");
                        $("#fl_diffusion_other_div").fadeOut();
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name":"fl_diffusion_other_name","field_value":""},
                            beforeSend: function (xhr) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                            }
                        });
                    }
                });
                $("[name=fl_mail]").jqxInput({disabled: true});
                $("#fl_period_bacherol").jqxMaskedInput({width: '130px', height: '26px', mask:'(####) - (####)', value: 20152016});
                createDropDownCareerPreregistro("#fk_career",false);
                createDropDownEntity("#fk_entity",'null',false);
                $("#fk_entity").jqxDropDownList({placeHolder: "SELECCIONAR", disabled:false,filterable:true, filterPlaceHolder: "Buscar",autoDropDownHeight: false, dropDownHeight: 300});
                itemEntity = $('#fk_entity').jqxDropDownList('getSelectedItem');
                createDropDownMunicipality(itemEntity.value, 'null', "#fk_municipality",false);
                $("#fk_municipality").jqxDropDownList({disabled:false, autoDropDownHeight: false, width: 300, placeHolder: "Seleccionar", dropDownHeight: 300});
                itemMunicipality=$('#fk_municipality').jqxDropDownList('getSelectedItem');
                createDropDownLocality(itemMunicipality.value,'byPk', "#fk_locality",false);
                $("#fk_locality").jqxDropDownList({disabled:false,autoDropDownHeight: false,width: 360, placeHolder: "Seleccionar",dropDownHeight: 300});
                itemLocality=$('#fk_locality').jqxDropDownList('getSelectedItem');
                createDropDownPreparatory(itemLocality.value, "#fk_preparatory", false);
                $("#fk_preparatory").jqxDropDownList({disabled:false,autoDropDownHeight: false, placeHolder: "Seleccionar"});

                // prepare the data                    
                $('#fk_entity').on('select',function (event){
                    var args = event.args;
                    if (args) {
                        itemEntity = args.item;
                    }
                    createDropDownMunicipality(itemEntity.value,'null', "#fk_municipality",true);
                });
                $('#fk_municipality').on('select',function (event){  
                    var args = event.args;
                    if (args) {
                        itemMunicipality = args.item;
                    }
                    createDropDownLocality(itemMunicipality.value, 'byPk', "#fk_locality",true);
                });
                $('#fk_locality').on('select',function (event){  
                    var args = event.args;
                    if (args) {
                        itemLocality = args.item;
                    }
                    createDropDownPreparatory(itemLocality.value, "#fk_preparatory", true);
                });

                createDropDownEntity("#fk_born_entity",'inegi',false);
                itemEntity = $('#fk_born_entity').jqxDropDownList('getSelectedItem');
                createDropDownMunicipality(itemEntity.value, 'byPkInegi', "#fk_born_municipality",false);
                itemMunicipality=$('#fk_born_municipality').jqxDropDownList('getSelectedItem');
                createDropDownLocality(itemMunicipality.value,'byPkInegi', "#fk_born_locality",false);

                $('#fk_born_entity').on('select',function (event){
                    var args = event.args;
                    if (args) {
                        itemEntity = args.item;
                    }
                    createDropDownMunicipality(itemEntity.value,'byPkInegi', "#fk_born_municipality",true);
                });
                $('#fk_born_municipality').on('select',function (event){  
                    var args = event.args;
                    if(args){
                        itemMunicipality = args.item;
                    }
                    createDropDownLocality(itemMunicipality.value, 'byPkInegi', "#fk_born_locality",true);
                });
                $('#fk_born_locality').on('select',function (event){  
                    var args = event.args;
                    if (args) {
                        itemLocality = args.item;
                    }
                });
                createDropDownEntity("#fk_current_entity",'inegi',false);
                itemEntity = $('#fk_current_entity').jqxDropDownList('getSelectedItem');
                createDropDownMunicipality(itemEntity.value, 'byPkInegi', "#fk_current_municipality",false);
                itemMunicipality=$('#fk_current_municipality').jqxDropDownList('getSelectedItem');
                createDropDownLocality(itemMunicipality.value,'byPkInegi', "#fk_current_locality",false);
                $('#fk_current_entity').on('select',function (event){
                    var args = event.args;
                    if (args) {
                        itemEntity = args.item;
                    }
                    createDropDownMunicipality(itemEntity.value,'byPkInegi', "#fk_current_municipality",true);
                });
                $('#fk_current_municipality').on('select',function (event){  
                    var args = event.args;
                    if(args){
                        itemMunicipality = args.item;
                    }
                    createDropDownLocality(itemMunicipality.value, 'byPkInegi', "#fk_current_locality",true);
                });
                $('#fk_current_locality').on('select',function (event){  
                    var args = event.args;
                    if (args) {
                        itemLocality = args.item;
                    }
                });

                createDropDownEntity("#fk_born_entity_tutor",'inegi',false);
                itemEntity = $('#fk_born_entity_tutor').jqxDropDownList('getSelectedItem');
                createDropDownMunicipality(itemEntity.value, 'byPkInegi', "#fk_born_municipality_tutor",false);
                itemMunicipality=$('#fk_born_municipality_tutor').jqxDropDownList('getSelectedItem');
                createDropDownLocality(itemMunicipality.value,'byPkInegi', "#fk_born_locality_tutor",false);

                $('#fk_born_entity_tutor').on('select',function (event){
                    var args = event.args;
                    if (args) {
                        itemEntity = args.item;
                    }
                    createDropDownMunicipality(itemEntity.value,'byPkInegi', "#fk_born_municipality_tutor",true);
                });

                $('#fk_born_municipality_tutor').on('select',function (event){  
                    var args = event.args;
                    if(args){
                        itemMunicipality = args.item;
                    }
                    createDropDownLocality(itemMunicipality.value, 'byPkInegi', "#fk_born_locality_tutor",true);
                });
                $('#fk_born_locality_tutor').on('select',function (event){  
                    var args = event.args;
                    if (args) {
                        itemLocality = args.item;
                    }
                });
                createDropDownEntity("#fk_current_entity_tutor",'inegi',false);
                itemEntity = $('#fk_current_entity_tutor').jqxDropDownList('getSelectedItem');
                createDropDownMunicipality(itemEntity.value, 'byPkInegi', "#fk_current_municipality_tutor",false);
                itemMunicipality=$('#fk_current_municipality_tutor').jqxDropDownList('getSelectedItem');
                createDropDownLocality(itemMunicipality.value,'byPkInegi', "#fk_current_locality_tutor",false);

                $('#fk_current_entity_tutor').on('select',function (event){
                    var args = event.args;
                    if (args) {
                        itemEntity = args.item;
                    }
                    createDropDownMunicipality(itemEntity.value,'byPkInegi', "#fk_current_municipality_tutor",true);
                });
                $('#fk_current_municipality_tutor').on('select',function (event){  
                    var args = event.args;
                    if(args){
                        itemMunicipality = args.item;
                    }
                    createDropDownLocality(itemMunicipality.value, 'byPkInegi', "#fk_current_locality_tutor",true);
                });
                $('#fk_current_locality_tutor').on('select',function (event){  
                    var args = event.args;
                    if (args) {
                        itemLocality = args.item;
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "../serviceCandidate?selectCandidateByPkCandidate",
                    beforeSend: function (xhr) {
                        $("#load-data").jqxWindow('open');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("Error interno del servidor");
                    },
                    success: function (data, textStatus, jqXHR) {
                        dataExternal=data;
                        var name_data_fiel;
                        var data_rol;
                        $("[data-field=true]").each(function (){
                            name_data_fiel= $(this).attr("name");
                            data_rol = $(this).attr("data-type-role");
                            if(data_rol==="text"){
                                $(this).val(data[name_data_fiel]);
                            }
                            if(data_rol==="radio"){
                                if($(this).attr("value")==data[name_data_fiel]){
                                    $("input[name="+name_data_fiel+"][value="+data[name_data_fiel]+"]").prop('checked',true);
                                }
                                if("fl_physical_disability"===name_data_fiel){
                                    if($("[name=fl_physical_disability]").prop('checked')){
                                        $("#disability_name_div").fadeIn();
                                    }else{
                                        $("#fl_disability_name").val("");
                                        $("#disability_name_div").fadeOut();
                                    }
                                }
                                if("fl_indigenous_group"===name_data_fiel){
                                    if($("[name=fl_indigenous_group]").prop('checked')){
                                        $("#indigenous_group_name_div").fadeIn();
                                    }else{
                                        $("#fl_indigenous_group_name").val("");
                                        $("#indigenous_group_name_div").fadeOut();
                                    }
                                }
                                if("fl_secutity_medical"===name_data_fiel){
                                    if($("[name=fl_secutity_medical]").prop('checked')){
                                        $("#fl_number_security_medical_div").fadeIn();
                                    }else{
                                        $("#fl_number_security_medical").val("");
                                        $("#fl_number_security_medical_div").fadeOut();
                                    }
                                }
                                if("fl_depend_economically_work"===name_data_fiel){
                                    if($("[name=fl_depend_economically_work]").prop('checked')){
                                        $("#fl_what_work_div").fadeIn();
                                    }else{
                                        $("#fl_what_work_div").fadeOut();
                                    }
                                }
                            }
                            if(data_rol==="combo"){    
                                itemEntity = $("#"+name_data_fiel).jqxDropDownList('getItemByValue', data[name_data_fiel]);
                                $("#"+name_data_fiel).jqxDropDownList('selectItem', itemEntity);
                            }
                            if(data_rol==="checkbox"){    
                                if("fl_diffusion_other"===name_data_fiel){
                                    if($("[name=fl_diffusion_other]").prop('checked')){
                                        $("#fl_diffusion_other_div").fadeIn();
                                    }else{
                                        $("#fl_diffusion_other_name").val("");
                                        $("#fl_diffusion_other_div").fadeOut();
                                    }
                                }
                                if($(this).attr("value")==data[name_data_fiel]){
                                    $("input[name="+name_data_fiel+"][value="+data[name_data_fiel]+"]").prop('checked',true);
                                }else{
                                    $("input[name="+name_data_fiel+"][value="+data[name_data_fiel]+"]").prop('checked',false);
                                }
                            }
                        });
                    }
                }).done(function (){
                    $("#content-elements").show("slow");
                    $("#load-data").jqxWindow('close');
                    $('#titleMessage').text('Instrucciones');
                    $("#pictureMessage").attr("src","../content/pictures-system/info.png");
                    $("#ContentMessage").text("A continuaci�n registre su informaci�n, los cambios ser�n guardados al momento de ser cambiados y leer los mensajes indicadores en la barra de estado!");
                    $("#ok").text("Ok");
                    $("#cancel").hide();
                    if($.cookie('intruccions')===undefined){
                        $("#alert").jqxWindow('open');
                        $.cookie('intruccions',0);
                    }                        
                });
                var old_field_value;
                var field_value;
                var old_field_name;
                var field_name;
                $('.calendarInput').on('textchanged', function (event) {
                    old_field_name= $(this).attr("name");
                }); 
                $("[data-field=true]").focusin(function (){
                    old_field_name= $(this).attr("name");
                    var data_rol = $(this).attr("data-type-role");
                    if(data_rol==="text"){
                        old_field_value = $(this).val();
                    }
                    if(data_rol==="radio"){
                        old_field_value=$("input[name="+old_field_name+"]:checked").val();
                    }
                    if(data_rol==="checkbox"){
                        old_field_value=$("input[name="+old_field_name+"]:checked").val();
                        if(old_field_value==undefined){
                            old_field_value="No";
                        }
                    }
                });
                $("[data-field=true]").change(function (){
                    field_name= $(this).attr("name");
                    var data_rol = $(this).attr("data-type-role");
                    var flag=false;
                    if(data_rol==="text"){
                        flag=true;
                        field_value = $(this).val();
                    }
                    if(data_rol==="combo"){ 
                        flag=false;
                        field_value = undefined;
                    }
                    if(data_rol==="radio"){
                        flag=true;
                        field_value=$("input[name="+field_name+"]:checked").val();
                    }
                    if(data_rol==="checkbox"){
                        flag=true;
                        field_value=$("input[name="+field_name+"]:checked").val();
                        if(field_value==undefined){
                            field_value="No";
                        }
                    }
                    if(old_field_name===field_name&&old_field_value!==field_value){
                        if(flag){
                            $.ajax({
                                type: "POST",
                                async: false,
                                url: "../serviceCandidate?updateField",
                                data: {"field_name":field_name,"field_value":field_value},
                                beforeSend: function (xhr) {
                                    $(".loader").fadeIn("slow");
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert("Error interno del servidor");
                                },
                                success: function (data, textStatus, jqXHR) {
                                    $(".loader").fadeOut("slow");
                                    flag=false;
                                }
                            });
                        }
                    }
                });
                $("[data-field=true]").select(function (){
                    field_name= $(this).attr("name");
                    var data_rol = $(this).attr("data-type-role");
                    if(data_rol==="combo"){  
                        field_value = $(this).val();
                        if(old_field_name===field_name&&old_field_value!==field_value){
                            $.ajax({
                                type: "POST",
                                async: false,
                                url: "../serviceCandidate?updateField",
                                data: {"field_name":field_name,"field_value":field_value},
                                beforeSend: function (xhr) {
                                    $(".loader").fadeIn("slow");
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    alert("Error interno del servidor");
                                },
                                success: function (data, textStatus, jqXHR) {
                                    $(".loader").fadeOut("slow");
                                }
                            });
                        }
                    }
                });
                $("div[data-type-role='text']").css("display","inline-table");
                $("input").jqxInput({theme: theme,height: '26px' });
                $("#fl_above_average").jqxNumberInput({theme: theme, width: '60px',height: '26px',spinButtons: true,groupSize: 0,decimalDigits: 1,digits:2,max:10,min:0});
                $("#fl_number_members_famly").jqxNumberInput({theme: theme, width: '50px',height: '26px',spinButtons: true,groupSize: 0,decimalDigits: 0,digits:2,max:20,min:0});
                $(".numberInputMoney").jqxNumberInput({theme: theme, width: '110px', height: '26px',spinButtons: true, decimalDigits: 2,digits:5, min: 0, max: 100000, symbol: '$'});
                $(".zip-codeInput").jqxMaskedInput({theme: theme, mask: '#####', width: '70px', height: '26px'  });
                $(".telephoneInput").jqxMaskedInput({theme: theme, mask: '(###)###-####', width: '150px', height: '26px'  });
                $('.calendarInput').jqxDateTimeInput({culture: 'es-MX',formatString: "yyyy/MM/dd", theme: theme, width: '120px', height: '26px'});

                //Make combo since sourse
                var source = ["GENERAL","UNIVERSITARIO", "TECNOL�GICO"];
                $("#fl_bacherol_type").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["P�BLICA","PRIVADA"];
                $("#fl_school_type").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["CASADO(A)","SOLTERO(A)", "VIUDO(A)","DIVORCIADO(A)", "UNI�N LIBRE"];
                $("#fl_maritial_status").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["PADRE","MADRE","HERMANO(A)","ABUELO(A)","TIO(A)","OTRO"];
                $("#fl_tutor_relationship").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["CASADO(A)","SOLTERO(A)", "VIUDO(A)","DIVORCIADO(A)","UNI�N LIBRE"];
                $("#fl_maritial_state_tutor").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");
                
                var source = ["CASADO(A)","SOLTERO(A)", "VIUDO(A)","DIVORCIADO(A)","UNI�N LIBRE"];
                $("#fl_maritial_state_father").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["CASADO(A)","SOLTERO(A)", "VIUDO(A)","DIVORCIADO(A)","UNI�N LIBRE"];
                $("#fl_maritial_state_mother").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["PRIMARIA","SECUNDARIA", "PREPARATORIA", "UNIVERSIDAD", "MAESTRIA", "DOCTORADO", "NINGUNO"];
                $("#fl_level_education").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '150px', height: '26px' }).css("display","inline-block");
                
                var source = ["PRIMARIA","SECUNDARIA", "PREPARATORIA", "UNIVERSIDAD", "MAESTRIA", "DOCTORADO", "NINGUNO"];
                $("#fl_level_education_father").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '150px', height: '26px' }).css("display","inline-block");

                var source = ["PRIMARIA","SECUNDARIA", "PREPARATORIA", "UNIVERSIDAD", "MAESTRIA", "DOCTORADO", "NINGUNO"];
                $("#fl_level_education_mother").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '150px', height: '26px' }).css("display","inline-block");

                var source = ["PROPIA", "PRESTADA", "RENTADA"];
                $("#fl_house_status").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["MADERA", "TRIPLAY", "TABICON","BLOCK","LADRILLO", "ADOBE","TABLA ROCA", "CARTON"];
                $("#fl_wall_material").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '130px', height: '26px' }).css("display","inline-block");

                var source = ["TEJAS", "MADERA", "MADERA Y TEJAS", "LAMINAS", "CONCRETO", "ADOBE"];
                $("#fl_roof_material").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '130px', height: '26px' }).css("display","inline-block");

                var source = ["TIERRA", "PISO FIRME", "CONCRETO","LOSETA", "MADERA"];
                $("#fl_floor_material").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                var source = ["PRIMERA", "SEGUNDA", "TERCERA","CUARTA", "QUINTA"];
                $("#fl_option_utsem_study").jqxDropDownList({theme: theme, placeHolder: "SELECCIONAR", selectedIndex: -1, autoDropDownHeight:80, source: source, width: '120px', height: '26px' }).css("display","inline-block");

                $("#form1").jqxValidator({
                    hintType : 'label',
                    animationDuration: 0,
                    rules: [
                                { input: "#fl_name", message: "Este campo es requerido", action: 'keyup, blur',  rule: "required"},
                                { input: "#fl_patern_name", message: "Este campo es requerido", action: 'keyup, blur',  rule: "required"},
                                { input: "#fl_matern_name", message: "Este campo es requerido", action: 'keyup, blur',  rule: "required"},
                                { input: "#fl_curp", message: "Este campo es requerido", action: 'keyup, blur',  rule: "required"}
                            ]
                });  
//                $("#form2").jqxValidator({
//                    hintType : 'label',
//                    animationDuration: 0,
//                    rules: [
//                                { input: '#fl_mail', message: 'E-mail es Requerido!', action: 'keyup, blur', rule: 'required' },
//                                { input: '#fl_mail', message: 'E-mail invalido!', action: 'keyup', rule: 'email' }
//                            ]
//                });  
                $("#form3").jqxValidator({
                    hintType : 'label',
                    animationDuration: 0,
                    rules: [
                                { input: '#fl_mail_tutor', message: 'E-mail invalido!', action: 'keyup', rule: 'email' }
                            ]
                });  

                function validateSteps(step){
                    var isStepValid=true;       
                    if(step === "1"){
                        if(!$('#form1').jqxValidator('validate')){
                            isStepValid = false; 
                            $('#wizard').smartWizard('setError',{stepnum:1,iserror:true});                           
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:1,iserror:false});
                        }   
                        if($("[name=fl_gender]:checked").val()==undefined){
                            $('#wizard').smartWizard('setError',{stepnum:1,iserror:true});
                            $('#wizard').smartWizard('showMessage',"Selecciona el sexo");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:1,iserror:false});
                        }
                        
                        var fl_bacherol_type = $('#fl_bacherol_type').jqxDropDownList('getSelectedItem');        
                        if(fl_bacherol_type==null){
                            $('#wizard').smartWizard('setError',{stepnum:1, iserror:true});
                            $('#wizard').smartWizard('showMessage',"Selecciona el tipo de bachillerato");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:1, iserror: false});
                        }
                        var fl_maritial_status = $('#fl_maritial_status').jqxDropDownList('getSelectedItem'); 
                        if(fl_maritial_status==null){
                            $('#wizard').smartWizard('setError',{stepnum:1, iserror:true});
                            $('#wizard').smartWizard('showMessage',"Selecciona el estado civil");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:1, iserror: false});
                        }
                        var fk_career = $('#fk_career').jqxDropDownList('getSelectedItem');   
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "../serviceCandidate?updateField",
                            data: {"field_name": "fk_career","field_value": fk_career.value},
                            beforeSend: function (xhr) {
                                $(".loader").fadeIn("slow");
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");
                            },
                            success: function (data, textStatus, jqXHR) {
                                $(".loader").fadeOut("slow");
                            }
                        });
                    }
                    if(step === "2"){
//                        if($('#form2').jqxValidator('validate')){ 
//                            $('#wizard').smartWizard('setError',{stepnum:2,iserror: false}); 
//                        }else{
//                            isStepValid = false; 
//                            $('#wizard').smartWizard('setError',{stepnum:2,iserror:true}); 
//                        }
                    }
                    if(step === "3"){
                        var fl_tutor_relationship = $('#fl_tutor_relationship').jqxDropDownList('getSelectedItem'); 
                        if(fl_tutor_relationship==null){
                            $('#wizard').smartWizard('setError',{stepnum:3, iserror: true});
                            $('#wizard').smartWizard('showMessage',"Selecciona el parentesco");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:3,iserror:false});
                        }
                        var fl_maritial_state_tutor = $('#fl_maritial_state_tutor').jqxDropDownList('getSelectedItem'); 
                        if(fl_maritial_state_tutor==null){
                            $('#wizard').smartWizard('setError',{stepnum:3, iserror: true});
                            $('#wizard').smartWizard('showMessage',"Selecciona el estado civil");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:3,iserror:false});
                        }
                        var fl_level_education = $('#fl_level_education').jqxDropDownList('getSelectedItem'); 
                        if(fl_level_education==null){
                            $('#wizard').smartWizard('setError',{stepnum:3, iserror: true});
                            $('#wizard').smartWizard('showMessage',"Selecciona el nivel de educaci�n");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:3,iserror:false});
                        }
                    }
                    if(step === "4"){
                        var fl_house_status = $('#fl_house_status').jqxDropDownList('getSelectedItem'); 
                        if(fl_house_status==null){
                            $('#wizard').smartWizard('setError',{stepnum:4, iserror: true});
                            $('#wizard').smartWizard('showMessage',"Seleccionar cuenta con casa");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:4,iserror:false});
                        }
                        var fl_wall_material = $('#fl_wall_material').jqxDropDownList('getSelectedItem'); 
                        if(fl_wall_material==null){
                            $('#wizard').smartWizard('setError',{stepnum:4, iserror: true});
                            $('#wizard').smartWizard('showMessage',"Seleccionar el material de las paredes");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:4,iserror:false});
                        }
                        var fl_roof_material = $('#fl_roof_material').jqxDropDownList('getSelectedItem'); 
                        if(fl_roof_material==null){
                            $('#wizard').smartWizard('setError',{stepnum:4, iserror: true});
                            $('#wizard').smartWizard('showMessage',"Seleccionar el material del techo");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:4,iserror:false});
                        }
                        var fl_floor_material = $('#fl_floor_material').jqxDropDownList('getSelectedItem'); 
                        if(fl_floor_material==null){
                            $('#wizard').smartWizard('setError',{stepnum:4, iserror: true});
                            $('#wizard').smartWizard('showMessage',"Seleccionar el material del piso");
                            setTimeout(function (){
                                $(".msgBox").fadeOut();
                            },1000);
                            isStepValid=false;
                        }else{
                            $('#wizard').smartWizard('setError',{stepnum:4,iserror:false});
                        }
                    }
                    if(step === "5"){
                        $(".buttonFinish").text("Salir");
                        $('#wizard').smartWizard('hideMessage');
                        $('#wizard').smartWizard('setError',{stepnum:5,iserror:false});
                    }
                    return isStepValid;
                } 
                
            });
        </script>
    </html>
<%}%>
