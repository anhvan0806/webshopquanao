
@extends('master')
@section('content')

<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Liên hệ</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="">Home</a> / <span>Liên hệ</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="beta-map">
		
		<div class="abs-fullwidth beta-map wow flipInX"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.640728967673!2d108.21992701433626!3d16.0322072446887!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219ee598df9c5%3A0xaadb53409be7c909!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBLaeG6v24gVHLDumMgxJDDoCBO4bq1bmc!5e0!3m2!1svi!2s!4v1586586152918!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
					<h2>Điền mẫu liên hệ</h2>
					<div class="space20">&nbsp;</div>
					<form action="" method="post" class="contact-form">	
						<input type= hidden name="_token" value="{!! csrf_token() !!}">
						<div class="form-block">
							<input name="name" type="text" placeholder="Họ và tên">
						</div>
						<div class="form-block">
							<input name="email" type="email" placeholder="Email">
						</div>
						<div class="form-block">
							<input name="subject" type="text" placeholder="Tiêu đề">
						</div>
						<div class="form-block">
							<textarea name="message" placeholder="Nội dung"></textarea>
						</div>
						<div class="form-block">
							<button type="submit" class="beta-btn primary">Gửi tin nhắn <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4">
					<h2>Thông tin liên lạc</h2>
					<div class="space20">&nbsp;</div>

					<h6 class="contact-title">Địa chỉ</h6>
					<p>
						566 Núi Thành, Quận Hải Châu, TP Đà Nẵng
					</p>
					<div class="space20">&nbsp;</div>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Việc làm</h6>
					<br>
					<p class="abc">
						Chúng tôi đang tìm kiếm những cộng sự có năng lực để tham gia vào nhóm chúng tôi. <br>
						<a href="https://mail.google.com/">DH-KienTruc@gmail.com</a>
					</p>
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection
