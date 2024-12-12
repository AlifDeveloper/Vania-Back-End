import 'package:vania/vania.dart';

import 'package:vania_rest_api/app/models/customers.dart';

class CustomerController extends Controller {

  Future<Response> tambah(Request request) async {
    var input_costumers = request.input();

    await Customers().query().insert(input_costumers);

    return Response.json({
      'message':'data customer berhasil ditambahkan',
    });
  }

  Future<Response> lihat(Request request) async {
    final customers = await Customers().query().get();
    return Response.json({
      'messaage' : 'Menampilkan data customers',
      'data' : customers
    });
  }

  Future<Response> edit(Request req) async {
    final input_costumers = req.input();
    var idd = input_costumers['cust_id'];

    await Customers().query().where('cust_id', '=', idd).update(input_costumers);

    return Response.json({
      'messaage' : 'data costumers pada id = $idd berhasil diperbarui'
    });
  }
  
  Future<Response> hapus(int id) async {

    await Customers().query().where('cust_id','=',id).delete(); 

    return Response.json({
      'message' : 'data customers pada id = $id berhasil dihapus'
    });
  }

}

final CustomerController homeController = CustomerController();
