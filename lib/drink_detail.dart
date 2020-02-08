import'material.dart';

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({Key key, @required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(drink["strDrink"]),
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Colors.purple, Colors.orange
        ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                      tag: drink["idDrink"],
                      child: CircleAvatar(
                        radius: 100.0,
                      backgroundImage: NetworkImage(drink["strDrinkThumb"]) ?? "https://bitsofco.de/content/images/2018/12/broken-1.png",
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Text("ID: ${drink["idDrink"]}", 
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                ),
                SizedBox(height: 30.0,),
                Text("${drink["strDrink"]}", 
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  
}