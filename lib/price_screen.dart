import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'package:bitcointicker/getprice.dart';

String btc = "Loading";
String eth= "Loading";
String ltc= "Loading";



class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}


class _PriceScreenState extends State<PriceScreen> {
  
  String selectedcurrency = "AUD";
  Price p =Price();
  
  
  
  
  
  List<Text> getpickertimes() {
    List<Text> pickeritems = [];
    for (String currency in currenciesList) {
      pickeritems.add(Text(
        currency,
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
    }
    return pickeritems;
  }


  void call(String currency,String coin) async{

    var a = await p.getprices(currency,coin);

    if(coin == "BTC"){
      btc= a.toInt().toString();
    }
    else if(coin == "ETH"){
      eth= a.toInt().toString();
    }
    else if(coin == "LTC"){
      ltc= a.toInt().toString();
    }

    setState(() {
    });

  }
  
  @override
  void initState() {
    call("AUD","BTC");
    call("AUD","ETH");
    call("AUD","LTC");

    super.initState();
  }
  
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [


              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      "1 BTC = $btc $selectedcurrency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      "1 ETH = $eth $selectedcurrency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      "1 LTC = $ltc $selectedcurrency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),



            ],
          ),




          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlueAccent,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlueAccent,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedindex) {

                selectedcurrency = currenciesList[selectedindex];
                print(selectedcurrency);
                call(selectedcurrency,"BTC");
                call(selectedcurrency,"ETH");
                call(selectedcurrency,"LTC");



              },
              children: getpickertimes(),
            ),
          ),
        ],
      ),
    );
  }
}

// List<DropdownMenuItem<String>> getdropdownitems() {
//   List<DropdownMenuItem<String>> dropdownitems= [];
//   for (int i = 0; i < currenciesList.length; i++) {
//     String currency = currenciesList[i];
//
//     var newitem= DropdownMenuItem(
//       child: Text(currency),
//       value: currency,
//     );
//     dropdownitems.add(newitem);
//   }
//
//   return dropdownitems;
//
// }
// DropdownButton<String>(
// value: selectedcurrency,
// items: getdropdownitems(),
// onChanged: (value) {
// setState(() {
// selectedcurrency = value!;
// print(value);
// });
// }),
