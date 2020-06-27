import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/widgets/mine_block.dart';
import 'package:flutter/cupertino.dart';

class MineBlockProvider with ChangeNotifier{
  final MinePoint pointData;

  MineBlockProvider(this.pointData);

  bool opened = false;
  bool tabbed = false;


  String get blockAsset{
    // TODO: Block asset will be here
  }

  void clicked(){

  }

  void openBlock(){
    notifyListeners();
  }
}
