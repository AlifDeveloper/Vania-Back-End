import 'dart:io';

import 'package:vania/vania.dart';
import 'membuat_tabel_costumers.dart';
import 'membuat_tabel_orders.dart';
import 'membuat_tabel_orderitems.dart';
import 'membuat_tabel_products.dart';
import 'membuat_tabel_vendors.dart';
import 'membuat_tabel_productnotes.dart';

void main(List<String> args) async {
		await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await MembuatTabelCostumers().up();
		 await MembuatTabelOrders().up();
		 await MembuatTabelOrderitems().up();
		 await MembuatTabelProducts().up();
		 await MembuatTabelVendors().up();
		 await MembuatTabelProductnotes().up();
	}

  dropTables() async {
		 await MembuatTabelProductnotes().down();
		 await MembuatTabelVendors().down();
		 await MembuatTabelProducts().down();
		 await MembuatTabelOrderitems().down();
		 await MembuatTabelOrders().down();
		 await MembuatTabelCostumers().down();
	 }
}
