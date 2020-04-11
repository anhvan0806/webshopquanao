<div id="header">

<div class="topbar">
		<div class="container">
			<div>
				<div class="row">
					<div style="padding-right:15px;" class="col-sm-6 col-xs-6 col-lg-6 col-md-6 a-left">
						<span class ="fa fa-facebook" style="padding-right:20px;"> Facebook</span>
						<span class="fa fa-instagram"style="padding-right:20px;"> Instagram</span>
						<span class="fa fa-envelope-o"style="padding-right:20px;"> DH-KienTrucDaNang@gmail.com</span>
					</div>
				
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<ul class="list-inline f-right">
							
						@if(Auth::check())
						<li><a href="">Chào bạn {{Auth::user()->full_name}}</a></li>
						<li><a href="{{route('logout')}}">Đăng xuất</a></li>
					@else
						<li><a href="{{route('signin')}}">Đăng kí</a></li>
						<li><a href="{{route('login')}}">Đăng nhập</a></li>
					@endif
								
							<li class="hidden-xs" style><a href="{{route('lienhe')}}">Liên hệ</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>

<div class="header-top">
			<div class="container">
			
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-top -->
		<div class="header-body">
			<div class="container beta-relative">
				<div class="pull-left">
					<a href="{{route('trang-chu')}}" id="logo"><img src="source/assets/dest/images/logo2.png" width="120px" alt=""></a>
				</div>

				<div class="pull-right beta-components space-left ov">
					<div class="space10">&nbsp;</div>

					<div class="beta-comp">
						@if(Session::has('cart'))
						<div class="cart">
							<div class="beta-select"><i class="fa fa-shopping-cart" style="color:black;"></i>
							 Giỏ hàng 
								(@if(Session::has('cart')){{Session('cart')->totalQty}}
								@else Trống @endif) <i class="fa fa-chevron-down"></i></div>
							<div class="beta-dropdown cart-body">
							@foreach($product_cart as $product)
								<div class="cart-item">
									<a class="cart-item-deleta" href="{{route('xoagiohang',$product['item']['id'])}}"><i class="fa fa-times" style="float:right;"></i></a>
									<div class="media">
										<a class="pull-left" href="#"><img src="source/image/product/{{$product['item']['image_products']}}" alt=""></a>
										<div class="media-body">
											<span class="cart-item-title">{{$product['item']['name_products']}}</span>
											<span class="cart-item-amount">{{$product['qty']}}*<span>@if($product['item']['promotion_price']==0){{number_format($product['item']['unit_price'])}} @else {{number_format($product['item']['promotion_price'])}} @endif</span></span>
										</div>
									</div>
								</div>
								@endforeach
								<div class="cart-caption">
									<div class="cart-total text-right">Tổng tiền: <span class="cart-total-value">@if(Session::has('cart')){{number_format($totalPrice)}} @else 0 @endif đồng</span></div>
									<div class="clearfix"></div>

									<div class="center">
										<div class="space10">&nbsp;</div>
										<a href="{{route('dathang')}}" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
									</div>
								</div>

							</div>
						</div> <!-- .cart -->
						@endif
					</div>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-body -->
		<div class="header-bottom" style="background-color: black;">
			<div class="container">
				<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
				<div class="visible-xs clearfix"></div>
				<nav class="main-menu">
					<ul class="l-inline ov">
						<li><a href="{{route('trang-chu')}}">Trang chủ</a></li>
						<li><a> Loại sản phẩm </a>
							<ul class="sub-menu">
								@foreach($loai_sp as $loai)
								<li><a href="{{route('loaisanpham',$loai->id_types)}}">{{$loai->name}}</a></li>
								@endforeach
							</ul>
						</li>
						<li><a href="{{route('gioithieu')}}">Giới thiệu</a></li>
						<li><a href="{{route('lienhe')}}">Liên hệ</a></li>
						<div class="beta-comp">
						<form style="padding-left:328px;" role="search" method="get" id="searchform" action="{{route('search')}}">
					        <input type="text" value="" name="key" id="s" placeholder="Nhập từ khóa..." />
					        <button style="150px;" class="fa fa-search" type="submit" id="searchsubmit"></button>
						</form>
					</div>
					</ul>
					<div class="clearfix"></div>
				</nav>
			</div> <!-- .container -->
		</div> <!-- .header-bottom -->
	</div>
