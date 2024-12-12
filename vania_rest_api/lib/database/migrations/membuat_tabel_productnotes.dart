import 'package:vania/vania.dart';

class MembuatTabelProductnotes extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('membuat_tabel_productnotes', () {
      id();
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('membuat_tabel_productnotes');
  }
}
