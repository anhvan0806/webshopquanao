@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                           Cập nhật sản phẩm
                        </header>
                         <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>
                        <div class="panel-body">

                            <div class="position-center">
                      
                                @foreach($edit_product as $pro)
                                
                                <form role="form" action="{{URL::to('/update-product/'.$pro->id)}}" method="post" enctype="multipart/form-data">
                                    {{ csrf_field() }}
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tên sản phẩm</label>
                                    <input type="text" name="product_name" class="form-control" id="exampleInputEmail1" value="{{$pro->name_products}}">
                                </div>
                                 
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Giá sản phẩm</label>
                                    <input type="text" value="{{$pro->unit_price}}" name="product_price" class="form-control" id="exampleInputEmail1" >
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Giá sản phẩm khuyến mãi</label>
                                    <input type="text" value="{{$pro->promotion_price}}" name="product_price_km" class="form-control" id="exampleInputEmail1" >
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mô tả sản phẩm</label>
                                    <textarea style="resize: none" rows="8" class="form-control" name="product_desc" id="exampleInputPassword1"
                                    >{{$pro->description_products}}</textarea>
                                </div>
                             
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Danh mục sản phẩm</label>
                                      <select name="product_cate" class="form-control input-sm m-bot15">
                                        @foreach($cate_product as $cate)
                                            <option value="{{$cate->id_types}}">{{$cate->name}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Hình ảnh sản phẩm</label>
                                    <input type="file" name="product_image" class="form-control" id="exampleInputEmail1">
                                    <img src="{{URL::to('/source/image/product/'.$pro->image_products)}}" height="100" width="100">
                                </div>
                        

                                <button type="submit" name="add_product" class="btn btn-info">Cập nhật sản phẩm</button>
                                </form>
                                @endforeach
                                
                            </div>

                        </div>
                    </section>

            </div>
@endsection