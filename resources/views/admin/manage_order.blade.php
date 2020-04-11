@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê đơn hàng
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
            
            <th>Tên người đặt</th>
            <th>Số điện thoại</th>
            <th>Thanh toán</th>
            <th>Tổng giá tiền</th>
            <th>Duyệt đơn hàng</th>
            <th>Xem/Xóa</th>
            
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
          @foreach($all_order as $order)
          <tr>
            <td>{{ $order->name }}</td>
            <td>{{ $order->phone_number }}</td>
            

            <td>{{ $order->payment }}</td>
            <td>{{ number_format($order->total) }}</td>
            <td><span class="text-ellipsis">
              <?php
               if($order->order_status==0){
                ?>
                <a href="{{URL::to('/unactive-order/'.$order->id)}}"><span class="fa-thumb-styling fa fa-thumbs-up"></span></a>
                <?php
                 }else{
                ?>  
                 <a href="{{URL::to('/active-order/'.$order->id)}}"><span class="fa-thumb-styling fa fa-thumbs-down"></span></a>
                <?php
               }
              ?>
            </span></td>
           
            <td>
              <a href="{{URL::to('/view-order/'.$order->id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-eye text-success text-active"></i></a>
              <a onclick="return confirm('Bạn có chắc là muốn xóa đơn hàng không?')" href="{{URL::to('/delete-order/'.$order->id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i>
              </a>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
   
</div>
@endsection
