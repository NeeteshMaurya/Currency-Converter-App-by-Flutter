import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentValue = 0;
  String fromCurrency = 'CAD';
  String toCurrency = 'INR';

  void getValue() async {
    String url =
        'https://free.currconv.com/api/v7/convert?q=${fromCurrency}_$toCurrency&compact=ultra&apiKey=1d4471e3c0b995cf34a9';
    var result = await http.get(url);
    var data = jsonDecode(result.body);
    setState(() {
      currentValue = data["${fromCurrency}_$toCurrency"];
    });

    print(currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.orange[900],
          title: Text('Currency Converter'),
        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 200,
          ),
          child: Column(
            children: [
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.blue[900],
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                currentValue.toString(),
                style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
              ),
                  )),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('From',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(width: 3,),
                  DropdownButton(
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    icon: Icon(Icons.monetization_on_outlined),
                    dropdownColor: Colors.blue,
                    value: fromCurrency,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'USD',
                          style: TextStyle(color: Colors.white,),
                        ),
                        value: 'USD',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'INR',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'INR',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'PHP',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'PHP',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'CAD',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'CAD',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'AUD',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'AUD',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'EUR',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'EUR',
                      ),
                      DropdownMenuItem(
                        child: Text('BRL', style: TextStyle(color: Colors.white),),value: 'BRL',),
                      DropdownMenuItem(
                        child: Text('PLN', style: TextStyle(color: Colors.white),),value: 'PLN',),
                      DropdownMenuItem(
                        child: Text('NZD', style: TextStyle(color: Colors.white),),value: 'NZD',),
                      DropdownMenuItem(
                        child: Text('CNY', style: TextStyle(color: Colors.white),),value: 'CNY',),
                      DropdownMenuItem(
                        child: Text('RON', style: TextStyle(color: Colors.white),),value: 'RON',),
                      DropdownMenuItem(
                        child: Text('JPY', style: TextStyle(color: Colors.white),),value: 'JPY',),
                      DropdownMenuItem(
                        child: Text('IDR', style: TextStyle(color: Colors.white),),value: 'IDR',),
                    ],
                    onChanged: (value) {
                      setState(() {
                        fromCurrency = value;
                      });
                    },
                  ),
                  SizedBox(width: 30,),
                  DropdownButton(
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    icon: Icon(Icons.monetization_on_outlined),
                    dropdownColor: Colors.blue,
                    value: toCurrency,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'USD',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'USD',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'INR',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'INR',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'PHP',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'PHP',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'CAD',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'CAD',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'AUD',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 'AUD',
                      ),
                      DropdownMenuItem(
                        child: Text('EUR', style: TextStyle(color: Colors.white),),value: 'EUR',),
                      DropdownMenuItem(
                        child: Text('BRL', style: TextStyle(color: Colors.white),),value: 'BRL',),
                      DropdownMenuItem(
                        child: Text('PLN', style: TextStyle(color: Colors.white),),value: 'PLN',),
                      DropdownMenuItem(
                        child: Text('NZD', style: TextStyle(color: Colors.white),),value: 'NZD',),
                      DropdownMenuItem(
                        child: Text('CNY', style: TextStyle(color: Colors.white),),value: 'CNY',),
                      DropdownMenuItem(
                        child: Text('RON', style: TextStyle(color: Colors.white),),value: 'RON',),
                      DropdownMenuItem(
                        child: Text('JPY', style: TextStyle(color: Colors.white),),value: 'JPY',),
                      DropdownMenuItem(
                        child: Text('IDR', style: TextStyle(color: Colors.white),),value: 'IDR',),


                    ],
                    onChanged: (value) {
                      setState(() {
                        toCurrency = value;
                      });
                    },
                  ),
                  SizedBox(width: 20,),
                  Text('To',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 20,),
              RaisedButton(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text('Convert',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                color: Colors.orange[900],
                onPressed: () {
                  getValue();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
