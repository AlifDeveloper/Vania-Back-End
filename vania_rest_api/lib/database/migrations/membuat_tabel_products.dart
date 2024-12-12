import 'package:vania/vania.dart';

class MembuatTabelProducts extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('membuat_tabel_products', () {
      id();
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('membuat_tabel_products');
  }
}
