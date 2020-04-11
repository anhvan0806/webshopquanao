<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class CategoryProduct extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function add_category_product(){
        $this->AuthLogin();
    	return view('admin.add_category_product');
    }
    public function all_category_product(){
        $this->AuthLogin();
    	$all_category_product = DB::table('type_products')->get();
    	$manager_category_product  = view('admin.all_category_product')->with('all_category_product',$all_category_product);
    	return view('admin_layout')->with('admin.all_category_product', $manager_category_product);


    }
    public function save_category_product(Request $request){
        $this->AuthLogin();
    	$data = array();
    	$data['name'] = $request->category_product_name;
        $data['description'] = $request->category_product_desc;
    	DB::table('type_products')->insert($data);
    	Session::put('message','Thêm danh mục sản phẩm thành công');
    	return Redirect::to('add-category-product');
    }
    
    public function edit_category_product($id_types){
        $this->AuthLogin();
        $edit_category_product = DB::table('type_products')->where('id_types',$id_types)->get();

        $manager_category_product  = view('admin.edit_category_product')->with('edit_category_product',$edit_category_product);

        return view('admin_layout')->with('admin.edit_category_product', $manager_category_product);
    }
    public function update_category_product(Request $request,$id){
        $this->AuthLogin();
        $data = array();
        $data['name'] = $request->category_product_name;
        $data['description'] = $request->category_product_desc;
        DB::table('type_products')->where('id',$id)->update($data);
        Session::put('message','Cập nhật danh mục sản phẩm thành công');
        return Redirect::to('all-category-product');
    }
    public function delete_category_product($id){
        $this->AuthLogin();
        DB::table('type_products')->where('id_types',$id)->delete();
        Session::put('message','Xóa danh mục sản phẩm thành công');
        return Redirect::to('all-category-product');
    }

    // //End Function Admin Page
    // public function show_category_home($slug_category_product){
    //     $category_by_id = DB::table('tbl_product')->join('type_products','tbl_product.id','=','type_products.id')->where('type_products.slug_category_product',$slug_category_product)->get();
        
    //     $category_name = DB::table('type_products')->where('type_products.slug_category_product',$slug_category_product)->limit(1)->get();

    //     return view('pages.category.show_category')->with('category',$cate_product)->with('brand',$brand_product)->with('category_by_id',$category_by_id)->with('category_name',$category_name);
    // }

}
