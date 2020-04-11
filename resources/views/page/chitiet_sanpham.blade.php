@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$sanpham->name_products}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Trang chủ</a> / <span>Thông tin chi tiết sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">
					<div class="row">
						<div class="col-sm-4">
							<img src="source/image/product/{{$sanpham->image_products}}" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								<p class="single-item-title"><h3>{{$sanpham->name}}</h3></p>
								<p class="single-item-price">
									@if ($sanpham->promotion_price==0)
										<span class="flash-sale">{{number_format($sanpham->unit_price)}} đồng</span>
									@else
										<span class="flash-del">{{number_format($sanpham->unit_price)}} </span>
										<span class="flash-sale">{{number_format($sanpham->promotion_price)}} đồng</span>
									@endif
								</p>
							</div>
							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<!-- <div class="single-item-desc">
								<p>{{$sanpham->description_products}}</p>
							</div> -->
							<div class="space20">&nbsp;</div>
							<p class="abcv"><h5>{{$sanpham->name}}</h5></p>

							<div class="single-item-options">

								<a href="{{route('themgiohang',$sanpham->id)}}" class="myButton">Thêm vào giỏ hàng</a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Mô tả</a></li>
						</ul>

						<div class="panel" id="tab-description">
							<p>{{$sanpham->description_products}}</p>
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Sản phẩm tương tự</h4>

						<div class="row">
							@foreach($sp_tuongtu as $sptt)
							<div class="col-sm-4">
								<div class="single-item">
									
									<div class="single-item-header">
										<a href="{{route('chitietsanpham',$sptt->id)}}"><img src="source/image/product/{{$sptt->image_products}}" alt=""></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$sptt->name_products}}</p>
										<p class="single-item-price" style="font-size:18px">
											@if ($sptt->promotion_price==0)
												<span class="flash-sale">{{number_format($sptt->unit_price)}} đồng</span>
											@else
												<span class="flash-del">{{number_format($sptt->unit_price)}} </span>
												<span class="flash-sale">{{number_format($sptt->promotion_price)}} đồng</span>
											@endif
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('themgiohang',$sptt->id)}}"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="">Chi tiết <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							@endforeach
							
							<div class="row">{{$sp_tuongtu->links()}}</div>
						</div>
					</div> <!-- .beta-products-list -->
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title">Sản phẩm khuyến mãi</h3>
						<div class="widget-body">
							@foreach($sanpham_khuyenmai as $spkm)
							<div class="beta-sales beta-lists">
								<div class="media beta-sales-item">
									<a class="pull-left" href="{{route('chitietsanpham',$spkm->id)}}"><img src="source/image/product/{{$spkm->image_products}}" alt=""height="75px"></a>
									<div class="media-body">
										{{$spkm->name_products}}
									</div>
								</div>
							</div>
							@endforeach
						</div>
					</div> <!-- best sellers widget -->

					<div class="widget">
						<h3 class="widget-title">Sản phẩm mới</h3>
						<div class="widget-body">
							@foreach($new_product as $new)
							<div class="beta-sales beta-lists">
								<div class="media beta-sales-item">
									<a class="pull-left" href="{{route('chitietsanpham',$new->id)}}"><img src="source/image/product/{{$new->image_products}}" alt=""height="75px"></a>
									<div class="media-body">
										{{$new->name_products}}
									</div>
								</div>
							</div>
							@endforeach
						</div>
					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection