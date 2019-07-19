<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Notice</title>
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="setfiles/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="setfiles/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="setfiles/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="setfiles/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="setfiles/dist/css/skins/skin-blue.css">

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  
  
  <%@ include file= "../common/header.jsp" %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <!-- _top.jspf -->
  <%@ include file="../common/_top.jspf" %>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="../common/_nav.jspf" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Common - Notice - ArticleDetail(글 상세보기)
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
<!-- ------------------------------------------------- -->    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        
        <!-- right column -->
        <div class="col-md-12">
          
          <!-- general form elements disabled -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">General Elements</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form">
                <!-- text input -->
                <div class="form-group">
                  <span>작성자:&nbsp;으엌이</span>
                  <span>작성일:&nbsp;2019.07.20</span>
                </div>
                
                <div class="form-group">
                  <label>Title</label>
                  <input type="text" class="form-control" disabled value="${title}" style="background-color: white;">
                </div>

                <!-- textarea -->
                <div class="form-group">
                  <label>The Body</label>
                  <textarea class="form-control" rows="3" disabled style="background-color: white;">
                    ${theBody}
                  </textarea>
                </div>

                <div class="form-group">
              <!-- test값 -->
                <c:set var="categoryOption" value="Board" />
              
                  <label>Category</label>
                  <select class="form-control selection" disabled>
                    <option>Notice</option>
                    <option>Board</option>
                  </select>
                </div>
                <div class="box-footer" style="padding-left: 0; padding-right:0;">
                  <button type="button" class="btn btn-default"><a href="#">목록으로</a></button>
                  <button type="button" class="btn btn-info pull-right" style="margin: 0 0 0 20px">
                    <a href="writearticle.jsp">수정</a>
                  </button>
                  <button type="button" class="btn btn-info pull-right">삭제</button>
                </div>
              </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
<!-- -------------------------------------------- -->    
  </div>
  <!-- /.content-wrapper -->
  <%@ include file = "../common/_bottom.jspf" %>

</div>
<!-- ./wrapper -->

<!-- jQuery 3.3.1 -->
<script src="setfiles/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="setfiles/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="setfiles/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- AdminLTE App : navbar 관련-->
<script src="setfiles/dist/js/adminlte.min.js"></script>

<script>
//오류발생.. 주석내에 el이나 tag형식 사용하지 말것..
$(function() {
	//jstl의 변수를 javascript로 바로 사용 불가. ' c:out value="jstl변수명" '을 사용할 것.
	//바로 el로 받을경우 not defined(?) 같은 오류로 인식되지 않는다.
	var articleCategory = '<c:out value="${categoryOption}" />';
	console.log(articleCategory);
	$('.selection option').val(articleCategory).attr('selected', true);
	
	//:contains() --> ()안에 변수 삽입불가. 변수명을 문자열로 인식함.
	//$('.selection option:contains(Board)').attr('selected', true);
});

</script>

</body>
</html>