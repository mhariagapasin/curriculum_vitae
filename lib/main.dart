import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) =>  HomeRoute(),
      '/first': (context) => const FirstRoute(),
      '/second': (context) => const SecondRoute(),
      '/third': (context) => const ThirdRoute(),
      '/fourth': (context) =>  FourthRoute(),
      '/fifth': (context) =>  FifthRoute(),
    },
  )); //MaterialApp
}

class HomeRoute extends StatelessWidget {
  HomeRoute({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[300],
        appBar: AppBar(
          backgroundColor: Colors.cyan[400]
          ,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/logo.png'),
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                  return "Enter your Email e.g flutter123@gmail.com";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if(value == null || value.isEmpty)
                                  return 'Password is required';
                              },
                            )),
                        SizedBox(height: 10.0),
                        FloatingActionButton.extended(
                          label: Text('Login'), // <-- Text
                          backgroundColor: Colors.lightBlue,
                          icon: Icon( // <-- Icon
                            Icons.login_outlined,
                            size: 24.0,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/first');
                              return;
                            }
                          },
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 18)
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/fourth');
                            },
                              child: const Text('Create Account'),
                            ),
                            SizedBox(width: 10.0),
                            TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 18)
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/fifth');
                              },
                              child: const Text('Forgot Password'),
                            )
                          ],

                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
          title: const Text('Curriculum Vitae'),
          backgroundColor: Colors.cyan[400],
        ), // AppBar
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                 radius: 50.0,
                 child: Image(
                   image: AssetImage('images/mharia.jpg'),
                  )),
              Text(
                'GAPASIN, MARY JOY J.',
                style: TextStyle(
                  fontFamily: 'Camacho',
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'BSIT',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
              ),
            ),

              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
              ),
            ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.green[800],
                  ),
                    title: Text(
                      '+639385744868',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                    ),
                  ),
                )),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.purpleAccent[700],
                ),
                  title: Text(
                    'mhariagapasin@gmail.com',
                    style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro'),
                ),
              ),
            ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.house,
                    color: Colors.red,
                ),
                  title: Text(
                    'Perfecto Abad St. , Bugallon ,Pangasinan',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro'),
                ),
              ),
            ),
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.purple[300], // foreground
                  ),
                    child: const Icon(Icons.school),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                  },
                ),
                  SizedBox(width: 30.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.cyan, // foreground
                  ),
                    child: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                  },
                ),
                  SizedBox(width: 30.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.teal[800], // foreground
                  ),
                    child: const Icon(Icons.login_outlined),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                  },
                ),
              ],
            ), // ElevatedButton
          ],
        ),
      ),
      ),
    ); // Scaffold
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: const Text("Education"),
        backgroundColor: Colors.cyan[400],
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.deepPurple,
                ),
                title: Text(
                  'Tertiary Education ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              subtitle: Text('Philippine College of Science and Technology'
              ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Bachelor of Science in Information Technology',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                    'Batch 2019-2023'),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.teal[800],
                ),
                title: Text(
                  'Senior High School',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman'),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Bugallon Integrated School',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                    'Batch 2016-2018'),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.lightGreen [900],
                ),
                title: Text(
                  'Secondary Education',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman'),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Bugallon Integrated School',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                    'Batch 2012-2016'),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.blue[800],
                ),
                title: Text(
                  'Primary Education',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Torres Bugallon Elementary School',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text('Batch 2006-2012'),
              ),
            ),
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: const Text("Professional Background"),
        backgroundColor: Colors.cyan[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.account_box_outlined,
                  color: Colors.lightGreen[900],
                ),
                title: Text(
                  "Professional Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                    "I'm freshly graduated out of college"),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.album,
                  color: Colors.red[800],
                ),
                title: Text(
                  'Skills and Abilities',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle:
                Text("Trustworthy, Multi-Tasking, Loyalty and Willingness"),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.web_rounded,
                  color: Colors.blue[800],
                ),
                title: Text(
                  'Web-Development',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                    "I have a experience to developing website using PHP and knowledge to front - end"),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school_outlined,
                  color: Colors.deepOrange[600],
                ),
                title: Text(
                  'Certificates',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                    "NCII holder in Computer System Servicing from PHILCST"),
              ),
            ),
          ],
        ),
      ),

      /// AppBar
    ); // Scaffold
  }
}
class FourthRoute extends StatelessWidget {
   FourthRoute({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[300],
        appBar: AppBar(
          backgroundColor: Colors.cyan[400]
          ,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'Enter Full Name',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$')
                                        .hasMatch(value)) {
                                  return "Name is Required";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                hintText: 'Enter Phone Number',
                                prefixIcon: Icon(Icons.contact_mail),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                        .hasMatch(value)) {
                                  return "Enter Numbers only";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Address',
                                hintText: 'Enter Address',
                                prefixIcon: Icon(Icons.house),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Address is required';
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                  return "Enter your Email e.g flutter123@gmail.com";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Password is required';
                              },
                            )),
                        SizedBox(height: 10.0),
                        FloatingActionButton.extended(
                          label: Text('Create'), // <-- Text
                          backgroundColor: Colors.lightBlue,
                          icon: Icon( // <-- Icon
                            Icons.login_outlined,
                            size: 24.0,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/first');
                              return;
                            }
                          },
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
    );
  }
}
class FifthRoute extends StatelessWidget {
   FifthRoute({Key? key}) : super(key: key);

   final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[300],
        appBar: AppBar(
          backgroundColor: Colors.cyan[400]
          ,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter Email',
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                  return "Enter your Email e.g flutter123@gmail.com";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Current Password',
                                hintText: 'Enter Current Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Password is required';
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                hintText: 'Enter New Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Password is required';
                              },
                            )),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Re-Enter New Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Password is required';
                              },
                            )),
                        SizedBox(height: 10.0),
                        FloatingActionButton.extended(
                          label: Text('Submit'), // <-- Text
                          backgroundColor: Colors.lightBlue,
                          icon: Icon( // <-- Icon
                            Icons.login_outlined,
                            size: 24.0,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/first');
                              return;
                            }
                          },
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
    );
  }
}