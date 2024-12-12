import 'package:vania/vania.dart';

import 'package:vania_rest_api/app/models/productnotes.dart';

class ProductnotesController extends Controller {

  Future<Response> tambah(Request request) async {
    var input_productnotes = request.input();

    await Productnotes().query().insert(input_productnotes);

    return Response.json({
      'message':'data productnotes berhasil disimpan'
    });
  }

  Future<Response> lihat(Request request) async {
    final productnotes = await Productnotes().query().get();
    return Response.json({
      'messaage' : 'Menampilkan data productnotes',
      'data' : productnotes
    });
  }

    Future<Response> edit(Request req) async {
    final inputData = req.input();
    var id = inputData['note_id'];

     await Productnotes().query().where('note_id','=',id).update(inputData);

    return Response.json({
      'message':'data productnotes pada note_id=$id berhasil diperbarui'
    });
  }

    Future<Response> hapus(int id) async {
    await Productnotes().query().where('note_id','=',id).delete(); 

    return Response.json({
      'message' : 'data productnotes pada note_id=$id berhasil dihapus'
    });
  }

}