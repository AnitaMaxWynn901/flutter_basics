import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Sky Borrow Book',
            style: TextStyle(
              color: Colors.amber[400],
            ),
          ),
          backgroundColor: Colors.blue[300],
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.red[300],
              onPressed: () {
                Navigator.pop(context);
                // Handle the button press here
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.blue[200],
          child: const TabBar(
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.menu_book), text: 'Status'),
              Tab(icon: Icon(Icons.history_edu), text: 'History'),
              Tab(icon: Icon(Icons.history_sharp), text: 'Return'),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          fillColor: Colors.amber[200],
                          filled: true,
                          labelText: '',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.keyboard_arrow_down),
                          filled: true,
                          fillColor: Colors.amber[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 2,
                            ),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'All',
                            child: Text('All',
                                style: TextStyle(color: Colors.black)),
                          ),
                          DropdownMenuItem(
                            value: 'Sci-fi',
                            child: Text('Sci-fi',
                                style: TextStyle(color: Colors.black)),
                          ),
                          DropdownMenuItem(
                            value: 'Academic',
                            child: Text('Academic',
                                style: TextStyle(color: Colors.black)),
                          ),
                          DropdownMenuItem(
                            value: 'Fantacy',
                            child: Text('Fantacy',
                                style: TextStyle(color: Colors.black)),
                          ),
                          DropdownMenuItem(
                            value: 'Horror',
                            child: Text('Horror',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          // Handle option selection here
                        },
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.amber[200],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.green[100],
                child: const Center(child: Text('Status')),
              ),
              Container(
                color: Colors.orange[100],
                child: const Center(child: Text('History')),
              ),
              Container(
                color: Colors.red[100],
                child: const Center(child: Text('Return')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}