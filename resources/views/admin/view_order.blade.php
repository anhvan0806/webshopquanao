@extends('admin_layout')
@section('admin_content')
<br>
<div class="table-agile-info">
  
  <div class="panel panel-default">
    <div class="panel-heading">
     Thông tin khách hàng
    </div>
    
    <div class="table-responsive">
                      <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message',null);
                            }
                            ?>
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Tên khách hàng</th>
            <th>Số điện thoại</th>
            <th>Địa chỉ</th>
            <th>Ghi chú</th>
          </tr>
        </thead>
        <tbody>

          <tr>
            <td>{{$order_by_id->name}}</td>
            <td>{{$order_by_id->phone_number}}</td>
            <td>{{$order_by_id->address}}</td>
            <td>{{$order_by_id->note}}</td>

          </tr>
     
        </tbody>
      </table>

    </div>
   
  </div>
</div>


<div class="table-agile-info">
  
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê chi tiết đơn hàng
    </div>
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Thành tiền</th>
            
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
         
        @foreach($name_products as $vip)
          <tr>
            <td>{{ $vip->name_products}}</td>
            <td>{{ $vip->quantity }}</td>
            <td>{{ number_format($order_by_id->unit_price) }}</td>
            <td>{{ number_format(($order_by_id->unit_price)*$vip->quantity)}}</td>
          </tr>
          @endforeach
         
        </tbody>
        
      </table><br>

    
</div>
<div class="abcd"><b>Tổng tiền:</b> {{number_format($order_by_id->total)}}</div>
@endsection