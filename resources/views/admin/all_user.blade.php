@extends('admin_layout')
@section('admin_content')
    <div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Tất cả tài khoản
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
            <th>Email</th>
            <th>Tên khách hàng</th>
            <th>Số điện thoại</th>
            <th>Địa chỉ</th>
            <th style="width:30px;">Xóa</th>
          </tr>
        </thead>
        <tbody>

          @foreach($all_user as $key => $pro)
          <tr>
            <td>{{ $pro->email }}</td>
            <td>{{ $pro->full_name}}</td>
            <td>{{ $pro->phone}}</td>
            <td>{{ $pro->address}}</td>
            
            <td>
              <a onclick="return confirm('Bạn có chắc là muốn xóa sản phẩm này ko?')" href="{{URL::to('/delete-user/'.$pro->id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i>
              </a>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
    
  </div>
</div>
@endsection