

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  //creamos una instancia de dio
  final _dio = Dio();

  //Creamos una funcion asincrona para hacer la peticion, la cual nos devolverá una instancia de nuestro modelo de datos.
  Future<Message> getAnswer() async{

    //hacemos la peticion y guardamos la respuesta en una variable, asi de facil
    final response = await _dio.get('https://yesno.wtf/api');

    //creamos una instancia de nuestro modelo de datos y le pasamos la respuesta de la peticion
    final YesNoModel yesNoModel = YesNoModel.fromJson(response.data);

    //retornamos una instancia de nuestra entidad Message
    return yesNoModel.toMessageEntity();
  }

}

//TODO 1 get instalar dio