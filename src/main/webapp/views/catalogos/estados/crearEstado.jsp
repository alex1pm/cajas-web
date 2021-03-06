<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>Estados</title>


</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Cajas</b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<jsp:include page="/views/menu/logout.jsp"></jsp:include>
					</ul>
				</div>
			</nav>
		</header>

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<jsp:include page="/views/menu/menu.jsp"></jsp:include>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<span style="color: #798c9c"> </span>Estados
				</h1>
			</section>

			<!-- Main content Estados -->
			<section class="content">
				<!-- Main row -->
				<div id="div2" class="col-md-12">
				    <div class="box box-primary">
                        <div class="box-body">
                            <form id="form-estados">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputid" class="control-label">Clave del Estado</label> <input
                                            id="inputid" name="inputid" type="text" class="form-control"
                                            maxlength="02" placeholder="Clave del Estado(Clave del Estado)" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputabrev" class="control-label">Abreviacion del Estado</label> <input
                                            id="inputabrev" name="inputabrev" type="text" class="form-control"
                                            maxlength="5" placeholder="Abreviacion(Abreviacion)" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputnom"  class="control-label">Nombre del Estado</label> 
                                        <input  id="inputnom" name="inputnom" type="text" class="form-control"
                                            maxlength="15" placeholder="Nombre(Nombre)" required>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="box-footer clearfix">
                                <button id="cancel-btn" type="button"
                                    class="btn btn-default btn-lg pull-left">
                                    <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
                                    Cancelar
                                </button>
                                <button type="button" id="save-btn"
                                        class="btn btn-success btn-lg pull-right">
                                    <i class="fa fa-credit-card"></i> Guardar
                                </button>
                        </div>
				    </div>
				</div>
			</section>
			<!-- Fin contenido Alta Registro -->
		</div>
	</div>
	<!-- ./wrapper -->


	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.3.0
		</div>
		<strong>Derechos de autor &copy; 2016 <a href="------">--------------</a>.
		</strong> Todos los derechos reservados.
	</footer>

</body>




<!-- Scripts -->

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>

<!-- jQuery UI -->
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>

<!-- jQuery Form -->
<script
	src="${pageContext.request.contextPath}/resources/jquery-form/jquery.form.min.js" /></script>

<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<!-- Bootstrap WYSIHTML5 -->
<script
	src="${pageContext.request.contextPath}/resources/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/admin-lte/js/app.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/admin-lte/js/demo.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/formvalidation/js/formValidation.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/formvalidation/js/framework/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/formvalidation/js/language/es_ES.min.js"></script>

<!-- Fin scripts -->

<script>
$(document)
		.ready(
				function() {

					//Cancelar y dirige a la vista principal de los estados registrados
					$('#cancel-btn').click(
									function() {
										var urlUsuario ="${pageContext.request.contextPath}/views/WebContribuyentes/Estados.jsp";
										window.location = urlUsuario;
									});

					//Registra un estado
					$('#save-btn').click(function() {

										//Validaciones
										var formValidation = $('#form-estados').data('formValidation');

										formValidation.validate();

										console.log(formValidation.isValid());

										if (formValidation.isValid()) {


											var datos = {};
											var idEstado = $('#inputid');
											var abreviacion = $('#inputabrev');
											var nombre = $('#inputnom');
											
                                                                                        datos.idEstado = null;
											datos.abreviacionEstado = abreviacion.val();
											datos.estado = nombre.val();

											var formData = JSON.stringify(datos);

											console.log(formData);

											var urlPost = "${pageContext.request.contextPath}/cajas/estados";
											var urlUsuario = "${pageContext.request.contextPath}/views/WebContribuyentes/Estados.jsp";

											 $.ajax({
														type : 'POST',
														url : urlPost,
														data : formData,
														dataType : "json",
														contentType : 'application/json',
														success : function(
																data,
																textStatus,
																jQxhr) {
															swal(
																	{
																		title : "Estado Guardado",
																		type : "success",
																		closeOnCancel : false
																	},
																	function() {
																		window.location = urlUsuario;
																	});
														},
														error : function(
																jqXHR,
																textStatus,
																errorThrown) {
															console.log(textStatus+ " "+ errorThrown);
														}
													});
										}

									});

					//Validaciones
					$('#form-estados')
							.formValidation(
									{
										framework : 'bootstrap', //Indicamos el framework para validar, Bootstrap, Pure,Semantic,etc
										icon : {//Feedback Icons
											valid : 'glyphicon glyphicon-ok',
											invalid : 'glyphicon glyphicon-remove',
											validating : 'glyphicon glyphicon-refresh'
										},
										//live: 'enabled',
										//Lista de campos a validar y las reglas que aplican para cada uno de ellos
										fields : {
											'inputid': { //validación del campo
												trigger : 'blur', //Se especifica cuando se acciona la validación del campo
												validators : { //validaciones

													notEmpty : {
														message : 'La clave del estado es requerida'
													},
													stringLength : {
														min : 1,
														max : 2,
														message : 'La clave del estado debe contener 13 caracteres.'
													},
													
												}
											},
											'inputabrev' : { //validación del campo
												trigger : 'blur', //Se especifica cuando se acciona la validación del campo
												validators : { //validaciones

													notEmpty : {														
														message : 'La abreviacion del estado es requerida.'
													},
												}
											},
											'inputnom' : { //validación del campo
												trigger : 'blur', //Se especifica cuando se acciona la validación del campo
												validators : { //validaciones

													notEmpty : {
														message : 'El nombre del estado es requerido'
													},
													stringLength : {
														min :1,
														max : 15,
														message : 'El nombre del estado debe contener minimo 15 caracteres.'
													},
													
												}
											},
										}
									});							
						

					//Errores
					$.ajaxSetup({
						error : function(x, status, error) {
							if (x.status == 400) {
								var result = x.responseJSON;
									swal({
										title : "Error " + result.code,
										text : result.message,
										type : "error",
										closeOnCancel : false
									});
							} else if (x.status == 500) {
									swal({
									title : "Error 500",
									text : "Disculpe las molestias no podemos procesar su solicitud.",
									type : "error",
									closeOnCancel : false
								});
							}
					}
				});

				});
</script>
</html>