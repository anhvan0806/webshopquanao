<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Cart;
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
session_start();

class AdminController extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('admin')->send();
        }
    }
    public function index(){
    	return view('admin_login');
    }
    public function show_dashboard(){
        $this->AuthLogin();
    	return view('admin.dashboard');
    }
    public function dashboard(Request $request){
    	$admin_email = $request->admin_email;
    	$admin_password = md5($request->admin_password);

    	$result = DB::table('tbl_admin')->where('admin_email',$admin_email)->where('admin_password',$admin_password)->first();
    	if($result){
            Session::put('admin_name',$result->admin_name);
            Session::put('admin_id',$result->admin_id);
            return Redirect::to('/dashboard');
        }else{
            Session::put('message','Mật khẩu hoặc tài khoản bị sai.Làm ơn nhập lại');
            return Redirect::to('/admin');
        }

    }
    public function logout(){
        $this->AuthLogin();
        Session::put('admin_name',null);
        Session::put('admin_id',null);
        return Redirect::to('/admin');
    }

    public function view_order($id){
        $this->AuthLogin();
        $order_by_id = DB::table('bills')
        ->join('customer','bills.id_customer','=','customer.id')
        ->join('bill_detail','bills.id','=','bill_detail.id_bill')
        ->where('bills.id','=',$id)->get()->first();
        //dd($order_by_id);

        
        $name_products=DB::table('bill_detail')
        ->join('products','bill_detail.id_product','=','products.id')
        ->join('bills','bills.id','=','bill_detail.id_bill')
        ->where('bills.id','=',$id)
        ->get();
        //dd($name_products);

        $tongtien = DB::table('bills')->select('bills.total')->where('bills.id','=',$id)->get();
        //dd($tongtien);

        // $total = DB::bills('unit_price')->sum();
        // dd($total);

        $manager_order_by_id  = view('admin.view_order')
        ->with('order_by_id',$order_by_id)->with('name_products',$name_products)
        ->with('tongtien',$tongtien);

        return view('admin_layout')->with('admin.view_order', $manager_order_by_id);
        
    }
    
    public function manage_order(){
        
        $this->AuthLogin();
        $all_order = DB::table('bills')
        ->join('customer','bills.id_customer','=','customer.id')
        ->select('bills.*','customer.name', 'customer.phone_number', 'customer.note', 'customer.address')
        ->orderby('bills.id','desc')
        ->get();
        //dd($all_order);
        $manager_order  = view('admin.manage_order')->with('all_order',$all_order);
        return view('admin_layout')->with('admin.manage_order', $manager_order);
    }

    public function unactive_order($id){
    $this->AuthLogin();
       DB::table('bills')->where('id',$id)->update(['order_status'=>1]);
       Session::put('message','Không chấp nhận đơn hàng');
       return Redirect::to('manage-order');

   }
   public function active_order($id){
        $this->AuthLogin();
       DB::table('bills')->where('id',$id)->update(['order_status'=>0]);
       Session::put('message','Chấp nhận đơn hàng');
       return Redirect::to('manage-order');
   }

    public function delete_order($id){
        $this->AuthLogin();
        DB::table('bills')->where('id',$id)->delete();
        Session::put('message','Xóa sản phẩm thành công');
        return Redirect::to('manage-order');
    }

    public function all_user(){
        $this->AuthLogin();
    	$all_user = DB::table('users')
        ->select('users.*')
        ->orderby('users.id','asc')->get();

        //dd($all_user);
    	$manager_user  = view('admin.all_user')->with('all_user',$all_user);
    	return view('admin_layout')->with('admin.all_user', $manager_user);

    }

    public function delete_user($id){
        $this->AuthLogin();
        DB::table('users')->where('id',$id)->delete();
        Session::put('message','Xóa User thành công');
        return Redirect::to('all-user');
    }

}
