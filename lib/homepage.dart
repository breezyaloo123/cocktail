import 'dart:convert';
import 'package:cocktail/drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'drink_detail.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res =await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Cocktail App"),
        elevation: 0.0,
      ),
      body: Center(
        child:res !=null 
        ? ListView.builder(
          itemCount: drinks.length,
          itemBuilder: (context, index){
            var drink = drinks[index];
            return ListTile(
              leading: Hero(
                  tag: drink["idDrink"],
                  child: CircleAvatar(
                  backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                ),
              ),
              title: Text("${drink["strDrink"]}", 
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
              ),
              subtitle: Text("${drink["idDrink"]}", 
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
              ),
              onTap: (){
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => DrinkDetail(drink: drink,),
                ),
                );
              },
            );
          },
        )
        :CircularProgressIndicator(backgroundColor: Colors.white),
      ),
    );
  }
}