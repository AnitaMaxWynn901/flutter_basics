import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List books = [
    {
      'name': 'Harry Potter 7',
      'loanDate': '22/10/2567',
      'returnDate': '27/10/2567',
      'image': 'harrypotter1.jpg',
      'status': 'Approved'
    },
    {
      'name': 'Harry Potter 7',
      'loanDate': '22/10/2567',
      'returnDate': '27/10/2567',
      'image': 'harrypotter1.jpg',
      'status': 'Disapproved'
    },
  ];
  final List HistoryBooks = [
    {
      'name': 'Harry Potter 5 (Harry Poter And The Order of The Phonemix)',
      'loanDate': '22/10/2567',
      'returnDate': '27/10/2567',
      'image': 'harrypotter3.jpg',
      'status': 'Approve',
      'approvedby': 'Lalisa Manoban'
    },
  ];
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
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
                                  prefixIcon:
                                      const Icon(Icons.keyboard_arrow_down),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List.generate(7, (index) {
                              return SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 16,
                                child: BookCard(
                                  bookId: 'B00${index + 1}',
                                  title: 'Harry Potter ${index + 1}',
                                  subtitle: 'Harry Potter and the ${[
                                    "Philosopher\'s Stone",
                                    "Chamber of Secrets",
                                    "Prisoner of Azkaban",
                                    "Goblet of Fire",
                                    "Order of the Phoenix",
                                    "Half-Blood Prince",
                                    "Deathly Hallows"
                                  ][index]}',
                                  availability: 'available',
                                  imageUrl:
                                      'assets/images/harrypotter${index + 1}.jpg',
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                // color: Colors.green[100],
                // child: const Center(child: Text('Status')),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 223, 116),
                                borderRadius: BorderRadius.circular(45.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(19.0),
                                        child: Image.asset(
                                          'assets/images/${books[index]['image']}',
                                          height: 180,
                                          width: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 133, 215, 253),
                                          borderRadius:
                                              BorderRadius.circular(58.0),
                                        ),
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Book Name: ${books[index]['name']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Loan date: ${books[index]['loanDate']}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Returned date: ${books[index]['returnDate']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors
                                                    .black, // Set to black
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    'Status: ',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: books[index]
                                                                  ['status'] ==
                                                              'Approved'
                                                          ? Color(0xFF4CAF50)
                                                          : Color(0xFFF44336),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Text(
                                                      books[index]['status'],
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: HistoryBooks.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 177, 218, 236),
                                borderRadius: BorderRadius.circular(45.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top:
                                                  50.0), // Adjust the margin as needed
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(19.0),
                                            child: Image.asset(
                                              'assets/images/harrypotter3.jpg',
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 243, 243, 243),
                                          borderRadius:
                                              BorderRadius.circular(58.0),
                                        ),
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Book Name',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '${HistoryBooks[index]['name']}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const Text(
                                              'Loan date:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '${HistoryBooks[index]['loanDate']}',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              'Returned date:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              ' ${HistoryBooks[index]['returnDate']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Colors.blue, // Set to black
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    'Status: ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: HistoryBooks[index]
                                                                  ['status'] ==
                                                              'Approve'
                                                          ? const Color(
                                                              0xFF4CAF50)
                                                          : const Color
                                                              .fromARGB(
                                                              255, 43, 49, 44),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                    ),
                                                    child: Text(
                                                      HistoryBooks[index]
                                                          ['status'],
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            const Text(
                                              'Approved By:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              ' ${HistoryBooks[index]['approvedby']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Colors.blue, // Set to black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.yellow[200],
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "22/10/2567", // Example date (Thai Buddhist calendar)
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // Book cover image using asset
                              Container(
                                width: 125,
                                height: 175,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/harrypotter1.jpg'), // Local asset image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Book details section
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: 'Book Name: ',
                                          style: const TextStyle(fontSize: 16),
                                          children: [
                                            TextSpan(
                                              text: 'Harry Potter 7',
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Borrower's name: Jennie Kim",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Loan date: 22/10/2567",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Returned date: 27/10/2567",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                            ),
                                            onPressed: () {
                                              // Handle approve action
                                            },
                                            child: const Text(
                                              "Return",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookCard extends StatefulWidget {
  final String bookId;
  final String title;
  final String subtitle;
  final String availability;
  final String imageUrl;

  const BookCard({
    required this.bookId,
    required this.title,
    required this.subtitle,
    required this.availability,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  late String availabilityStatus;
  late Color buttonColor;

  @override
  void initState() {
    super.initState();
    availabilityStatus = widget.availability;
    buttonColor = getColorBasedOnStatus(availabilityStatus);
  }

  Color getColorBasedOnStatus(String status) {
    switch (status) {
      case 'available':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'borrowed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void handleReserve() {
    if (availabilityStatus == 'available') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
              'Reserved successfully. Please return the book within 1 week.'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  availabilityStatus = 'pending';
                  buttonColor = getColorBasedOnStatus(availabilityStatus);
                });
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  void showDetail() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.title),
        content: Text(widget.subtitle),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 120,
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Text(
                      'Book ID',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.bookId,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: showDetail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Text('Detail'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  widget.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: handleReserve,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  child: Text(availabilityStatus),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
