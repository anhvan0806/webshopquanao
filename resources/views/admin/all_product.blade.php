@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê sản phẩm
    </div>
   
    <div class="table-responsive">
                      <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>
      <table class="table table-striped b-t b-light"">
        <thead>
          <tr>
            
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Giá khuyến mãi</th>
            <th>Miêu tả</th>
            <th>Hình sản phẩm</th>
 
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>

          @foreach($all_product as $key => $pro)
          <tr>
          
            <td>{{ $pro->name_products}}</td>
            <td>{{ $pro->unit_price }}</td>
            <td>{{ $pro->promotion_price}}</td>
            <td style="height=20px;">{{ $pro->description_products}}</td>
            <td><img src="source/image/product/{{ $pro->image_products }}" height="100" width="100"></td>

            <td>
            <a href="{{URL::to('/edit-product/'.$pro->id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-pencil-square-o text-success text-active"></i></a>
              <a onclick="return confirm('Bạn có chắc là muốn xóa sản phẩm này ko?')" href="{{URL::to('/delete-product/'.$pro->id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i>
              </a>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">
        
        <div class="col-sm-5 text-center">
          <small class="text-muted inline m-t-sm m-b-sm">showing 20-30 of 50 items</small>
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li><a href=""><i class="fa fa-chevron-left"></i></a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href=""><i class="fa fa-chevron-right"></i></a></li>
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection