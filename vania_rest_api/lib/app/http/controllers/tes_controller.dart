import 'package:vania/vania.dart';

import 'package:vania_rest_api/app/models/tes.dart';


class TesController extends Controller
{
  
  Future<Response> tambah(Request request) async {
    var tes_tambah = request.input();

    await Tes().query().insert(tes_tambah);

    return Response.json({
      'data':tes_tambah
    });
  }

  Future<Response> lihat(Request request) async {
    return Response.json({
    });
  }
 
 Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> hapus(int id) async {
    return Response.json({});
  }
    
}

