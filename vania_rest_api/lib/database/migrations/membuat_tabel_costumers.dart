import 'package:vania/vania.dart';

class MembuatTabelCostumers extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('membuat_tabel_costumers', () {
      char('cust_id', length: 5); 
      id();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('membuat_tabel_costumers');
  }
}
