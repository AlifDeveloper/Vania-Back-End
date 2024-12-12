import 'package:vania/vania.dart';

import 'package:vania_rest_api/app/models/orderitems.dart';

class OrderitemsController extends Controller {

  Future<Response> tambah(Request request) async {
    var input_orderitems = request.input();

    await Orderitems().query().insert(input_orderitems);

    return Response.json({
      'message':'data orderitems berhasil disimpan'
    });
  }

  Future<Response> lihat(Request request) async {
    final customers = await Orderitems().query().get();
    return Response.json({
      'messaage' : 'Menampilkan data orderitems',
      'data' : customers
    });
  }

  Future<Response> edit(Request req) async {
    final inputData = req.input();
    var id = inputData['order_item'];

    await Orderitems().query().where('order_item','=',id).update(inputData);

    return Response.json({
      'message':'data orderitems pada order_item=$id berhasil diperbarui'
    });
  }

  Future<Response> hapus(int id) async {

    await Orderitems().query().where('order_item','=',id).delete(); 

    return Response.json({
      'message' : 'data orderitems pada order_item=$id berhasil dihapus'
    });
  }

}