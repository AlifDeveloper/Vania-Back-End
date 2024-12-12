import 'package:vania/vania.dart';

import 'package:vania_rest_api/app/models/orders.dart';

class OrdersController extends Controller {

  Future<Response> tambah(Request request) async {
    var input_orders = request.input();

    await Orders().query().insert(input_orders);

    return Response.json({
      'message':'data orders berhasil disimpan'
    });
  }

  Future<Response> lihat(Request request) async {
    final orders = await Orders().query().get();
    return Response.json({
      'messaage' : 'Menampilkan data orders',
      'data' : orders
    });
  }

  Future<Response> edit(Request req) async {
    final inputData = req.input();
    var id = inputData['order_num'];

     await Orders().query().where('order_num','=',id).update(inputData);

    return Response.json({
      'message':'data orders pada order_num=$id berhasil diperbarui'
    });
  }

  Future<Response> hapus(int id) async {
    await Orders().query().where('order_num','=',id).delete(); 

    return Response.json({
      'message' : 'data orders pada order_num=$id berhasil dihapus'
    });
  }

}