import 'package:vania/vania.dart';

import 'package:vania_rest_api/app/models/products.dart';

class ProductController extends Controller
{
  
  Future<Response> tambah(Request request) async {
    var input = request.input();

    var prod_id = input['prod_id'];
    var vend_id = input['vend_id'];
    var prod_name = input['prod_name'];
    var prod_price = input['prod_price'];
    var prod_desc = input['prod_desc'];

    await Products().query().insert({
      'prod_id':prod_id,
      'vend_id':vend_id,
      'prod_name':prod_name,
      'prod_price':prod_price,
      'prod_desc':prod_desc
    });

    return Response.json({
      'message':'data produk berhasil disimpan'
    });
  }

  Future<Response> lihat(Request request) async {
    final product = await Products().query().get();
    return Response.json({
      'messaage' : 'Menampilkan data produk',
      'data' : product
    });
  }
 
  Future<Response> edit(Request req) async {
    final inputData = req.input();
    var id = inputData['prod_id'];

     await Products().query().where('prod_id','=',id).update(inputData);


    return Response.json({
      'message':'data products pada prod_id=$id berhasil diperbarui'
      });
  }

  Future<Response> hapus(int id) async {
    await Products().query().where('prod_id','=',id).delete(); 

    return Response.json({
      'message' : 'data products pada prod_id=$id berhasil dihapus'
    });
  }
    
}

