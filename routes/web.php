<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('index',[
	'as'=>'trang-chu',
	'uses'=>'PageController@getIndex'
]);


route::get('loai-sanpham/{type}',[
	'as' =>'loaisanpham',
	'uses' =>'PageController@getLoaiSp'
	]);

route::get('chi-tiet-san-pham/{product_id}',[
	'as' =>'chitietsanpham',
	'uses'=>'PageController@getChitiet'
	]);

route::get('lien-he',[
	'as' =>'lienhe',
	'uses'=>'PageController@getLienhe'
	]);

route::post('lien-he',[
	'as' =>'postlienhe',
	'uses'=>'PageController@postLienhe'
	]);

route::get('gioi-thieu',[
	'as' =>'gioithieu',
	'uses'=>'PageController@getGioithieu'
	]);

route::get('add-to-cart/{id}',[
	'as' =>'themgiohang',
	'uses'=>'PageController@getAddtoCart'
	]);

route::get('delete-cart/{id}',[
	'as' =>'xoagiohang',
	'uses'=>'PageController@getDelItemCart'
	]);

route::get('dat-hang',[
	'as' =>'dathang',
	'uses'=>'PageController@getCheckout'
	]);

route::post('dat-hang',[
	'as' =>'dathang',
	'uses'=>'PageController@postCheckout'
	]);

route::get('dang-nhap',[
	'as' =>'login',
	'uses'=>'PageController@getLogin'
	]);
Route::post('dang-nhap',[
	'as'=>'login',
	'uses'=>'PageController@postLogin'
]);

Route::get('dang-ki',[
	'as'=>'signin',
	'uses'=>'PageController@getSignin'
]);

Route::get('search',[
	'as'=>'search',
	'uses'=>'PageController@getSearch'
]);
Route::post('dang-ki',[
	'as'=>'signin',
	'uses'=>'PageController@postSignin'
]);

Route::get('dang-xuat',[
	'as'=>'logout',
	'uses'=>'PageController@postLogout'
]);

Route::get('/admin','AdminController@index');
Route::get('/dashboard','AdminController@show_dashboard');
Route::get('/logout','AdminController@logout');
Route::post('/admin-dashboard','AdminController@dashboard');

//Category Product
Route::get('/add-category-product','CategoryProduct@add_category_product');
Route::get('/edit-category-product/{id_types}','CategoryProduct@edit_category_product');
Route::get('/delete-category-product/{id_types}','CategoryProduct@delete_category_product');
Route::get('/all-category-product','CategoryProduct@all_category_product');


Route::post('/save-category-product','CategoryProduct@save_category_product');
Route::post('/update-category-product/{id}','CategoryProduct@update_category_product');

//Product
Route::get('/add-product','ProductController@add_product');
Route::get('/edit-product/{id}','ProductController@edit_product');
Route::get('/delete-product/{id}','ProductController@delete_product');
Route::get('/all-product','ProductController@all_product');

Route::post('/save-product','ProductController@save_product');
Route::post('/update-product/{id}','ProductController@update_product');

Route::get('/all-user','AdminController@all_user');
Route::get('/delete-user/{id}','AdminController@delete_user');




//Order
Route::get('/manage-order','AdminController@manage_order');
Route::get('/view-order/{id}','AdminController@view_order');
Route::get('/delete-order/{id}','AdminController@delete_order');
Route::get('/unactive-order/{id}','AdminController@unactive_order');
Route::get('/active-order/{id}','AdminController@active_order');









