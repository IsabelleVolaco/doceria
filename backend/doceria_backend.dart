
import 'package:mysql1/mysql1.dart';
import 'dart:async';
void main() async{
  var settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'confeiteira',
    password: 'root',
    db: 'doceria1'
  );


  
  try{
    var conn = await MySqlConnection.connect(settings);
    print('banco conectou');

    await Future.delayed(Duration(seconds: 5));
    await conn.close();
    print('banco fechou');

  } catch (erro) {
    print('deu errado');
  }
}
