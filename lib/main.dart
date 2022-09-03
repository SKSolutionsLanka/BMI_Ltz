import 'package:flutter/material.dart';
import 'package:bmiNew/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Container(
              height: 200,
              width: 100,
              color:  Colors.yellow,
        ),
      ),
    );
  }
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int currentindex = 0;
   String result = "";
   double height = 0;
   double weight = 0;
   String state = "";
   String imgPath = "";
   Color txtColor = Color.fromARGB(255, 31, 29, 29);

   TextEditingController heightController = TextEditingController();
   TextEditingController weightController = TextEditingController();

  @override

   Widget build(BuildContext context) {
     return Container(
       decoration: const BoxDecoration(
         image: DecorationImage(image: AssetImage("assets/cat2.jpg"),
         fit:BoxFit.cover),
       ),
       
       child: Scaffold(
         backgroundColor: Colors.transparent,
         appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,

            title: Text(
             "BMI Calculator",
             style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize: 22,
               ),
           ),
           elevation: 0.0,
           backgroundColor: Color.fromARGB(255, 194, 243, 33),
           toolbarHeight: 35,
         ),
         body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(30.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               
                 SizedBox(
                   height: 80.0,
                 ),
                 Container(
                   padding: const EdgeInsets.all(4.0),
                   child: Text(
                    
                    "  Your  Height :   ",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 7, 7, 7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 194, 243, 33),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  

                 ),
                 
                 SizedBox(
                   height: 8.0,
                 ),
                 TextField(
                   keyboardType: TextInputType.number,
                   controller: heightController,
                   textAlign: TextAlign.center,
                   
                   decoration: InputDecoration(
                     hintText: "Your height in cm",
                     filled: true,
                     fillColor: Colors.grey[200],
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25.0),
                       borderSide: BorderSide.none,
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 60.0,
                 ),

                Container(
                   padding: const EdgeInsets.all(4.0),
                   child: Text(
                   "  Your  Weight :  ",
                   style: TextStyle(
                     fontSize: 18.0,
                     color: Color.fromARGB(255, 7, 7, 7),
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 194, 243, 33),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                
                 SizedBox(
                   height: 8.0,
                 ),
                 TextField(
                   keyboardType: TextInputType.number,
                   controller: weightController,
                   textAlign: TextAlign.center,
                   decoration: InputDecoration(
                     hintText: "Your weight in kg",
                     filled: true,
                     fillColor: Colors.grey[200],
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25.0),
                       borderSide: BorderSide.none,
                     ),
                   ),
                 ),
                 SizedBox(height: 100.0,),
                 Container(
                   width: double.infinity,
                   height: 60.0,
                   child: FlatButton(
                     onPressed: () {
                       setState(() {
                         height = double.parse(heightController.value.text);
                         weight = double.parse(weightController.value.text);
                       });
                       
                       calculateBMI(height, weight);
                       clearText();

                       showDialog(
                         context: context,
                         builder: (BuildContext context){
                           return AlertDialog(
                              content: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    
                                    children: [
                                      Positioned(
                                        right: 20.0,
                                        top: -5.0,
                                        child: InkResponse(
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            // child: Icon(Icons.close),
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          )
                                        ),
                                      ),
                                      SizedBox(height: 20.0,),
                                      Container(
                                        width: double.infinity,
                                        
                                        child: Text(
                                        "Your BMI  :  " +  "$result",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 28.0,
                                            color: Color.fromARGB(255, 31, 29, 29),
                                            fontWeight: FontWeight.bold,
                                            // height: 4,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Container(
                                        width: double.infinity,
                                        child: Text(
                                        "$state" + "\n",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 40.0,
                                            color: txtColor,
                                            fontWeight: FontWeight.bold,
                                            // height: 4,
                                          ),
                                        ),
                                      ),

                                    
                                  
                                    Container(
                                      padding:EdgeInsets.all(10.0),
                                      child:Image.asset(imgPath),
                                      alignment: Alignment.bottomCenter,
                                      // height:50.0
                                      ),
                                  
                                        ],),),
                           ),
                        );
                         },
                      );
                      
                     },
                     
                     child: Text("Calculate",
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color:  Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                   ),
                   decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 194, 243, 33),
                    borderRadius: BorderRadius.circular(30),
                  ),
                 ),
                 SizedBox(
                   height: 50.0,
                 ),
               ],
             ),
           )
         )
       ),
     );
  } 

  void calculateBMI(double height, double weight) {
    double finalresult = weight / (height * height / 10000);

    if(finalresult < 18.50){
      state = "Underweight"; 
      imgPath = "assets/images/p1.jpg";
      txtColor = Color.fromARGB(255, 23, 172, 230);
    }else if(finalresult >= 18.50 && finalresult <= 24.90 ){
      state = "Normal";
      imgPath = "assets/images/p2.jpg";
      txtColor = Color.fromARGB(255, 35, 176, 40);
    }else if(finalresult >= 25.00 && finalresult <= 29.90 ){
      state = "Overweight";
      imgPath = "assets/images/p3.jpg";
      txtColor = Color.fromARGB(255, 221, 87, 30);
    }else{
      state = "Obese";
      imgPath = "assets/images/p4.jpg";
      txtColor = Color.fromARGB(255, 208, 11, 11);
    }

    String bmi = finalresult.toStringAsFixed(2);

     setState(() {
       result = bmi;
     });
  }

  void changeIndex(int index) {
     setState((){
       currentindex = index;
     });
  }

  void clearText() {
    setState((){
       heightController.clear();
       weightController.clear();
     });
    
  }

}
