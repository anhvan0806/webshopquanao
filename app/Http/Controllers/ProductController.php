<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();
class ProductController extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function add_product(){
        $this->AuthLogin();
        $cate_product = DB::table('type_products')->orderby('id_types','desc')->get(); 
        // $type_product = DB::table('tbl_brand')->orderby('brand_id','desc')->get(); 
        return view('admin.add_product')->with('cate_product', $cate_product);
    	

    }
    public function all_product(){
        $this->AuthLogin();
    	$all_product = DB::table('products')
        ->join('type_products','type_products.id_types','=','products.id_type')
        ->orderby('products.id','asc')->get();
    	$manager_product  = view('admin.all_product')->with('all_product',$all_product);
    	return view('admin_layout')->with('admin.all_product', $manager_product);

    }
    public function save_product(Request $request){
         $this->AuthLogin();
    	$data = array();
    	$data['name_products'] = $request->product_name;
        $data['unit_price'] = $request->product_price;
        $data['promotion_price'] = $request->product_price_km;
    	$data['description_products'] = $request->product_desc;
        $data['id_type'] = $request->product_cate;
        $data['image_products'] = $request->product_image;
        $get_image = $request->file('product_image');
      
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image =  $name_image.'.'.$get_image->getClientOriginalExtension();
            $get_image->move('source/image/product',$new_image);
            $data['image_products'] = $new_image;
            DB::table('products')->insert($data);
            Session::put('message','Thêm sản phẩm thành công');
            return Redirect::to('add-product');
        }
        $data['image_products'] = '';
    	DB::table('products')->insert($data);
    	Session::put('message','Thêm sản phẩm thành công');
    	return Redirect::to('all-product');
    }
    
    public function edit_product($id){
        $this->AuthLogin();
        $cate_product = DB::table('type_products')->orderby('id_types','asc')->get(); 

        $edit_product = DB::table('products')->where('id',$id)->get();

        // dd($edit_product);
        $manager_product  = view('admin.edit_product')->with('edit_product',$edit_product)->with('cate_product',$cate_product);
      

        return view('admin_layout')->with('admin.edit_product', $manager_product);
    }
    public function update_product(Request $request,$id){
        $this->AuthLogin();
    	$data = array();
    	$data['name_products'] = $request->product_name;
        $data['unit_price'] = $request->product_price;
        $data['promotion_price'] = $request->product_price_km;
    	$data['description_products'] = $request->product_desc;
        $data['id_type'] = $request->product_cate;
        $get_image = $request->file('product_image');
      
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image =  $name_image.'.'.$get_image->getClientOriginalExtension();
            $get_image->move('source/image/product',$new_image);
            $data['image_products'] = $new_image;
            DB::table('products')->where('id',$id)->update($data);
            Session::put('message','Cập nhật phẩm thành công');
            return Redirect::to('add-product');
        }
        $data['image_products'] = '';
    	DB::table('products')->where('id',$id)->update($data);
    	Session::put('message','Cập nhật sản phẩm thành công');
    	return Redirect::to('all-product');
    }
    public function delete_product($id){
        $this->AuthLogin();
        DB::table('products')->where('id',$id)->delete();
        Session::put('message','Xóa sản phẩm thành công');
        return Redirect::to('all-product');
    }
}