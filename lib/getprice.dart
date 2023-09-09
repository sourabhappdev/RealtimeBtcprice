import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String curr= "USD";
const apikey= "CE0D2FC7-9A79-47F7-AAD5-3F659014D5A9";
const apikey2="7B9B012F-90BD-4FBF-AB15-113D27C2983A";
const apikey3= "33439588-EEE8-4E0D-8C62-0703A92D09A7";



class Price{


  Future<double> getprices(String currency,String coin) async{
    curr = currency;
    var url = "https://rest.coinapi.io/v1/exchangerate/$coin/$curr?apikey=$apikey3";
    final uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    if(response.statusCode==200){
      String data = response.body;

      var coindata = jsonDecode(data);
      // print(data);
      // print(coindata);
      print( coindata['rate']);
      return coindata['rate'];


    }

    else if(response.statusCode==429){

      print("TODAYS LIMIT REACHED");
      return 0;
    }
    else{
      print(response.statusCode);
      print("error");
      return 0;


    }

  }



}
