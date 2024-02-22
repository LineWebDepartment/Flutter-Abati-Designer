import 'package:abati_new/Helper/Pref.dart';

extension Currency on num {
  String get p => '${toStringAsFixed(0)} ${Mypref.getCurrency().shortName}'?? this??'-';
}