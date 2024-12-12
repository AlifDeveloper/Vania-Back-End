import 'package:vania/vania.dart';

import 'package:vania_rest_api/app/models/vendors.dart';

class VendorsController extends Controller
{
  
  Future<Response> tambah(Request request) async {
    var input_vendors = request.input();


    await Vendors().query().insert(input_vendors);

    return Response.json({
      'message':'data vendors berhasil disimpan'
    });
  }

  Future<Response> lihat(Request request) async {
    final vendors = await Vendors().query().get();
    return Response.json({
      'messaage' : 'Menampilkan data vendors',
      'data' : vendors
    });
  }
 
 Future<Response> edit(Request req) async {
    final inputData = req.input();
    var id = inputData['vend_id'];

     await Vendors().query().where('vend_id','=',id).update(inputData);

    return Response.json({
      'message':'data vendors pada vend_id=$id berhasil diperbarui'
    });
  }

  Future<Response> hapus(String id) async {
    await Vendors().query().where('vend_id','=',id).delete(); 

    return Response.json({
      'message' : 'data vendors pada vend_id=$id berhasil dihapus'
    });
  }
    
}

