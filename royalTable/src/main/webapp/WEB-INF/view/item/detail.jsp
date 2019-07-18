<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>��ǰ������</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<style>
	body, h1, h2, h3, h4, h5, h6 {font-family: "Karma", sans-serif}
	.w3-bar-block .w3-bar-item {padding: 20px}
	.mySlides{display: none;}
	
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<script type="text/javascript">
$(function(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var price = $('#price').text();
	var num = parseInt(stat,10);
	num--;


	if(num<=0){
	alert('���̻� ���ϼ� �����ϴ�.');
	num =1;
	}
	var price2 = price*num;
	$('#totprice').text(price2);
	$('#numberUpDown').text(num);
	});
	
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var price = parseInt($('#price').text(),10);
	var num = parseInt(stat,10);
	num++;
	
	if(num>5){
	alert('���̻� �ø��� �����ϴ�.');
	num=5;
	}
	
	var price2 = price*num;
	$('#totprice').text(price2);
	
	$('#numberUpDown').text(num);
	});
	
	$('#increaseMain').click(function(e){
		e.preventDefault();
		var stat = $('#numberMainUpDown').text();
		var price = parseInt($('#price').text(),10);
		var num = parseInt(stat,10);
		num++;
		
		if(num>5){
		alert('���̻� �ø��� �����ϴ�.');
		num=5;
		}
		
		var price2 = price*num;
		
		$('#numberMainUpDown').text(num);
		});
	
	
	
	$('#decreaseMain').click(function(e){
		e.preventDefault();
		var stat = $('#numberMainUpDown').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
		alert('���̻� ���ϼ� �����ϴ�.');
		num =1;
		}
		$('#numberMainUpDown').text(num);
		});
	
	
	
	
	$('[name="increasePartMain"]').click(function(e){
		e.preventDefault();
		var stat = $('[name="numberPartUpDown"]').text();
		var num = parseInt(stat,10);
		num++;

		if(num>5){
		alert('���̻� �ø��� �����ϴ�.');
		num=5;
		}
		$('[name="numberPartUpDown"]').text(num);
		});
	$('[name="decreasePartMain"]').click(function(e){
		e.preventDefault();
		var stat = $('[name="numberPartUpDown"]').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
		alert('���̻� ���ϼ� �����ϴ�.');
		num =1;
		}
		$('[name="numberPartUpDown"]').text(num);
		});
	
	
	});
</script>	
</head>
<body>
 <div class="w3-row w3-padding-64" id="about">
    <div class="w3-col m6 w3-padding-large w3-hide-small">
     <img src="/royalTable/item/���屹.jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="100%" height="100%">
    </div>
    <div class="w3-col m6 w3-padding-large">
      <h1 class="w3-center">�̿���</h1><br>
       <span class="w3-center" style="font-size: 40px; margin-left:5%;">�١١١١�</span>
       <span class="w3-center" style="margin-left:5%;font-size: 20px;">����  4.5<span style="font-size: 10px;" >(���ı� : 3��)</span></span>
    <div class="w3-container">
		  <table class="w3-table w3-bordered" >
		    <tr>
		      <th class="w3-center">�ǸŰ���</th>
		      <td class="w3-center"><span id="price">2900</span></td>
		    </tr>
		    <tr>
		      <th class="w3-center">category</th>
		      <td class="w3-center" >��Ÿ</td>
		    </tr>
		    <tr>
		      <th class="w3-center"><h4>�޴� ����</h4></th>
		      <td class="w3-center" >
		      	<div class="number">
		      	  <button type="button" class="btn btn-light" id="decreaseQuantity">-</button>
					<span id="numberUpDown">1</span>
				<button type="button" class="btn btn-light" id="increaseQuantity">+</button>
			</div>
			</td>
		    </tr>
		    <tr>
		      <th class="w3-center">�̿�</th>
		       <td class="w3-center">   	<div class="number">
		      	  <button type="button" class="btn btn-light" id="decreaseMain">-</button>
					<span id="numberMainUpDown">1</span>
				<button type="button" class="btn btn-light" id="increaseMain">+</button>
			</div></td>
		    </tr>
		    <tr>
		      <th class="w3-center" colspan="2">
		        <select class="form-control" id="sel1" name="sellist1">
        			<option>1</option>
       				<option>2</option>
        			<option>3</option>
        			<option>4</option>
      			</select>
		      </th>
		    </tr>
		    <tr>
		      	<th class="w3-center">����</th>
		      	 <td class="w3-center"><div class="number">
		      	  <button type="button" class="btn btn-light" name="decreasePartMain">-</button>
					<span name="numberPartUpDown">1</span>
				<button type="button" class="btn btn-light" name="increasePartMain">+</button>
			</div></td>
		    </tr>
		    <tr>
		      	<th class="w3-center">�Ұ��</th>
		      	 <td class="w3-center">3</td>
		    </tr>
		    <tr>
				<th class="w3-center">�� �Ǹűݾ�</th>
				<td class="w3-center"> <span id="totprice" style="font-size:25px;"></span></td>
		    </tr>
		    <tr>
		     	<th class="w3-center" colspan="2">
		     	  <a href="#"><button class="w3-btn w3-white w3-border w3-border-red w3-round-large">
		     	��ٱ���</button></a>
		     	 <a href="#"><button class="w3-btn w3-white w3-border w3-border-blue w3-round-large">
		     	�����ϱ�</button></a>
		     	</th>
		    </tr>
		  </table>
		</div>
    </div>
 </div>
  <hr>
    
   	<div class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin-top: 100px">
		  
      <h3>��õ��ǰ</h3>
	 <a href="#" style="float:right;"><button class="w3-btn w3-white w3-border w3-border-white w3-round-large">
		     	������ + </button></a>
		<div class="w3-row-padding w3-padding-16 w3-center" id="food">
			<div class="w3-quarter">
				<img src="/royalTable/item/�����Ұ��.jpg" alt="�����Ұ��" style="width: 100%">
				<h3>�����Ұ��</h3>
				<p>5900��</p>
			</div>
			<div class="w3-quarter">
				<img src="/royalTable/item/�����Ұ��.jpg" alt="�����Ұ��" style="width: 100%;">
					<h3>�����Ұ��</h3>
				<p>5900��</p>
			</div>
			<div class="w3-quarter">
				<img src="/royalTable/item/�����Ұ��.jpg" alt="Cherries" style="width: 100%">
					<h3>�����Ұ��</h3>
				<p>5900��</p>
			</div>
			<div class="w3-quarter">
				<img src="/royalTable/item/�����Ұ��.jpg" alt="Pasta and Wine"
					style="width: 100%">
					<h3>�����Ұ��</h3>
				<p>5900��</p>
			</div>
		</div>
		<hr>
	</div>

<div class="container">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item" style="width:33.3%">
      <a class="nav-link active" data-toggle="tab" href="#home">��ǰ����</a>
    </li>
    <li class="nav-item" style="width:33.3%">
      <a class="nav-link" data-toggle="tab" href="#menu1">��ǰ�������</a>
    </li>
    <li class="nav-item" style="width:33.3%">
      <a class="nav-link" data-toggle="tab" href="#menu2">���ı�</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
  		<div class="container">
  		<table class="table">
    <thead>
      <tr>
        <td style="width:30%;" class="table-secondary w3-center">ǰ�����������ȣ</td>
        <td style="width:70%;">20090086449308</td>
      </tr>
    </thead>
    <tbody>
      <tr>
       <td class="table-secondary w3-center">Ư������</td>
        <td>�߰��13.9%, Ȳ��0.2%
</td>
      </tr>
     <tr>
       <td class="table-secondary w3-center">��ǰ�� ����</td>
        <td>�Ｎ������ǰ/�����Ͽ� �����ϴ� �õ���ǰ</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">������ �� ������</td>
        <td>(��)����ȨǪ�� �������/����Ư���� ��õ�� ���λ��� 280</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">������� �Ǵ� ǰ����������</td>
        <td>�����Ϸκ��� �õ� 180��</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">���뷮</td>
        <td>650 g</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">������ �� �Է�</td>
        <td>��ä����{��(������),����(������),
        �Ͼ��,�ٽø�,ǥ�����},
        ��(������),�߰��(������),
        ����,õ�Ͽ�,Ȳ��(�߱���),
        WǪ�帶���ڿ����ͽ�A,
        ����,L-�۷�Ž�곪Ʈ������{L-�۷�Ž�곪Ʈ��(���������),
        5'-������Ŭ����Ƽ���̳�Ʈ��},
        ���� *���,��,�߰��,���� ����</td>
      </tr>
         <tr>
       <td class="table-secondary w3-center">������</td>
        <td>���� �� ����</td>
      </tr>
         <tr>
       <td class="table-secondary w3-center">������� / ��޹��</td>
        <td>�õ�����(-18������)/�̹� �õ��� �� ������ �ص� �� ��õ���Ű�� ���ñ� �ٶ��ϴ�.</td>
      </tr>
         <tr>
       <td class="table-secondary w3-center">��������</td>
        <td>���:PP,����ʸ�:PE</td>
      </tr>
        <tr>
       <td class="table-secondary w3-center">�˷����� ��ǰ</td>
        <td>�� ��ǰ�� ����,����,�޹�,����,����,��,����,�������,������,�丶��,��Ȳ���,ȣ��,��¡��,�������� ����� ��ǰ�� ���� ���� �ü����� �����ϰ� �ֽ��ϴ�.</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">�Һ��ڻ�� ���� ��ȭ��ȣ</td>
        <td>1644-6844</td>
      </tr>
    </tbody>
  </table>
  		</div>
    </div>
   	 
   	 
   	 <div id="menu2" class="container tab-pane fade"><br>
      <div class="container">
     <span class="w3-center" style="font-size: 40px;">����� �� ����</span>
       <span class="w3-center" style="font-size: 40px; margin-left:5%;">�١١١١�</span>
       <span  class="w3-center" style="margin-left:5%;font-size: 20px;">����  4.5<span style="font-size: 10px;" >(���ı� : 3��)</span></span>
        <a href="#" style="float:right;"><button class="w3-btn w3-white w3-border w3-border-white w3-round-large">
		     	���ı��ۼ� </button></a>
      </div>
      <hr>
    <div class="w3-container">
       <span class="star-input">
		<span class="input">
			<input type="radio" name="star-input" value="1" id="p1">
			<label for="p1">1</label>
			<input type="radio" name="star-input" value="2" id="p2">
			<label for="p2">2</label>
			<input type="radio" name="star-input" value="3" id="p3">
			<label for="p3">3</label>
			<input type="radio" name="star-input" value="4" id="p4">
			<label for="p4">4</label>
			<input type="radio" name="star-input" value="5" id="p5">
			<label for="p5">5</label>
		</span>
		<output for="star-input">
			<b>1</b>
		</output>       
       </span>
       <script src="js/jquery-1.11.3.min.js"></script>
       <script src="js/star.js"></script>
       <span class="w3-center" style="margin-left:2%">�̴뼺 </span><span class="w3-center" style="margin-left:5%">2019.07.15</span>
       <br>
       <p style="font-size: 20px;">
       	�ȳ��ϼ���. �Ұ�Ⱑ �ʹ� ���ֽ��ϴ�.
       </p>
    </div>
  </div>
</div>	
</div>

</body>
</html>