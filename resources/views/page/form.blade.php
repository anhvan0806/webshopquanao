

    <form role="form" action="{{URL::to('/front.fb/')}}" method="post" enctype="multipart/form-data">
                                    {{ csrf_field() }}
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tên sản phẩm</label>
                                    <input type="text" name="name" class="form-control" id="exampleInputEmail1">
                                </div>
                                 
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Giá sản phẩm</label>
                                    <input type="text" name="email" class="form-control" id="exampleInputEmail1" >
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Giá sản phẩm khuyến mãi</label>
                                    <input type="text"name="comment" class="form-control" id="exampleInputEmail1" >
                                </div>

                                
                                <button type="submit" name="send" class="btn btn-info">Cập nhật sản phẩm</button>   
                                </form>