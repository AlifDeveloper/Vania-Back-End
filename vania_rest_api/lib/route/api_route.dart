import 'package:vania/vania.dart';
// Memanggil controller:
import 'package:vania_rest_api/app/http/controllers/customers_controller.dart';
import 'package:vania_rest_api/app/http/controllers/orders_controller.dart';
import 'package:vania_rest_api/app/http/controllers/orderitems_controller.dart';
import 'package:vania_rest_api/app/http/controllers/products_controller.dart';
import 'package:vania_rest_api/app/http/controllers/vendors_controller.dart';
import 'package:vania_rest_api/app/http/controllers/productnotes_controller.dart';

import 'package:vania_rest_api/app/http/controllers/tes_controller.dart';



class ApiRoute implements Route {
  @override
  void register() {
    Router.basePrefix('api');

    Router.post('/tes', TesController().tambah);

// tabel customers
    Router.post('/customers', CustomerController().tambah);
    Router.get('/customers', CustomerController().lihat);
    Router.put('/customers', CustomerController().edit);
    Router.delete('/customers/{id}', CustomerController().hapus);
    
// tabel orders
    Router.post('/orders', OrdersController().tambah);
    Router.get('/orders', OrdersController().lihat);
    Router.put('/orders', OrdersController().edit);
    Router.delete('/orders/{id}', OrdersController().hapus);

// tabel products
    Router.post('/products', ProductController().tambah);
    Router.get('/products', ProductController().lihat);
    Router.put('/products', ProductController().edit);
    Router.delete('/products/{id}', ProductController().hapus);

// tabel orderitems
    Router.post('/orderitems', OrderitemsController().tambah);
    Router.get('/orderitems', OrderitemsController().lihat);
    Router.put('/orderitems', OrderitemsController().edit);
    Router.delete('/orderitems/{id}', OrderitemsController().hapus);

// tabel vendors
    Router.post('/vendors', VendorsController().tambah);
    Router.get('/vendors', VendorsController().lihat);
    Router.put('/vendors', VendorsController().edit);
    Router.delete('/vendors/{id}', VendorsController().hapus);

// tabel productnotes
    Router.post('/productnotes', ProductnotesController().tambah);
    Router.get('/productnotes', ProductnotesController().lihat);
    Router.put('/productnotes/', ProductnotesController().edit);
    Router.delete('/productnotes/{id}', ProductnotesController().hapus);

  }
}

