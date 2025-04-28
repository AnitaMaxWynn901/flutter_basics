import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  String? selectedStatus = 'Available'; // Default value
  final List<String> statuses = ['Available', 'Borrow', 'Pending', 'Disable'];
  String NameBook = 'Harrypotter';
  String DetailBook = 'Harry Potter And\nThe Philosopher\'s Stone';
  String currentTitle = '';
  String currentDetail = '';
  String? selectedGenre;
  String? editedTitle;
  String? editedDetail;
  int currentIndex = 1;
  TextEditingController _controller = TextEditingController();
  final List books = [
    {
      'name': 'Harry Potter 5 (Harry Poter And The Order of The Phonemix)',
      'Borrower Name ': 'Jannie Kim',
      'loanDate': '22/10/2567',
      'returnDate': '27/10/2567',
      'image': 'harrypotter3.jpg',
      'status': 'return',
      'approvedby': 'Lalisa Manoban',
      'Asset back to': 'Kim Jisoo'
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Available':
        return Colors.green; // สีเขียว
      case 'Disable':
        return Colors.grey; // สีเทา
      case 'Pending':
        return Colors.amber; // สีเหลือง
      case 'Borrow':
        return Colors.red; // สีแดง
      default:
        return Colors.green; // ค่าเริ่มต้น
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
              Tab(icon: Icon(Icons.edit), text: 'Edit'),
              Tab(icon: Icon(Icons.dashboard), text: 'Dashboard'),
              Tab(icon: Icon(Icons.history_edu), text: 'History'),
              Tab(icon: Icon(Icons.history_sharp), text: 'Return'),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
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
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.amber,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedGenre,
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
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'All', child: Text('All')),
                              DropdownMenuItem(
                                  value: 'Sci-fi', child: Text('Sci-fi')),
                              DropdownMenuItem(
                                  value: 'Academic', child: Text('Academic')),
                              DropdownMenuItem(
                                  value: 'Fantasy', child: Text('Fantasy')),
                              DropdownMenuItem(
                                  value: 'Horror', child: Text('Horror')),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGenre = newValue;
                              });
                            },
                            dropdownColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(7, (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 16,
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
                            status: [
                              'available',
                              'pending',
                              'borrowed',
                              'available',
                              'pending',
                              'available',
                              'borrowed'
                            ][index],
                            imageUrl:
                                'assets/images/harrypotter${index + 1}.jpg',
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),





              // Edit Tab with Book Grid and Filters
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              fillColor: Colors.amber[200],
                              filled: true,
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        // DropdownButton with smaller padding
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                            value: selectedGenre,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              prefixIcon: const Icon(Icons.keyboard_arrow_down),
                              filled: true,
                              fillColor: Colors.amber[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'All', child: Text('All')),
                              DropdownMenuItem(
                                  value: 'Sci-fi', child: Text('Sci-fi')),
                              DropdownMenuItem(
                                  value: 'Academic', child: Text('Academic')),
                              DropdownMenuItem(
                                  value: 'Fantasy', child: Text('Fantasy')),
                              DropdownMenuItem(
                                  value: 'Horror', child: Text('Horror')),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGenre = newValue;
                              });
                            },
                            dropdownColor: Colors.white,
                            iconEnabledColor: Colors.amber[200],
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        // Add button with reduced padding
                        SizedBox(
                          height: 45, // Adjust to ensure it fits within the row
                          child: ElevatedButton(
                            onPressed: () {
                              // Add functionality for "Add" button here
                              _showAddBookDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Card(
                              color: Colors.blue[100],
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () => showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Edit Image Number'),
                                                  content: TextField(
                                                    controller: _controller,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Enter new number (1-7)"),
                                                    keyboardType: TextInputType
                                                        .number, // Only allow number input
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('OK'),
                                                      onPressed: () {
                                                        // Get the new number from the user input
                                                        int newIndex =
                                                            int.tryParse(
                                                                    _controller
                                                                        .text) ??
                                                                currentIndex;

                                                        // Update image logic can go here (ensure newIndex is within bounds)
                                                        if (newIndex >= 1 &&
                                                            newIndex <= 7) {
                                                          // Assuming 7 images
                                                          setState(() {
                                                            currentIndex =
                                                                newIndex; // Update the currentIndex
                                                          });
                                                        } else {
                                                          // Handle out of range number
                                                          print(
                                                              'Please enter a number between 1 and 7.');
                                                        }

                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            child: Image.asset(
                                              'assets/images/harrypotter$currentIndex.jpg', // Update based on index if needed
                                              height: 100,
                                              width: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 0, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Book ID',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.lightBlue),
                                              ),
                                              FilledButton(
                                                onPressed: () {
                                                  // Book ID button action
                                                },
                                                style: FilledButton.styleFrom(
                                                  backgroundColor: Colors.blue,
                                                ),
                                                child: Text('B00${index + 1}',
                                                    style: const TextStyle(
                                                        color: Colors.black)),
                                              ),
                                              FilledButton(
                                                onPressed: () {
                                                  // Detail button action
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Edit Book'),
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            TextField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                      labelText:
                                                                          'Book Title'),
                                                              onChanged:
                                                                  (value) {
                                                                NameBook =
                                                                    value; // อัปเดตชื่อหนังสือเมื่อมีการแก้ไข
                                                              },
                                                              controller:
                                                                  TextEditingController(
                                                                      text:
                                                                          currentTitle), // ตั้งค่าเริ่มต้น
                                                            ),
                                                            TextField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                      labelText:
                                                                          'Book Detail'),
                                                              onChanged:
                                                                  (value) {
                                                                DetailBook =
                                                                    value; // อัปเดตรายละเอียดเมื่อมีการแก้ไข
                                                              },
                                                              controller:
                                                                  TextEditingController(
                                                                      text:
                                                                          currentDetail), // ตั้งค่าเริ่มต้น
                                                            ),
                                                          ],
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                // อัปเดตข้อมูลตามที่ผู้ใช้กรอก
                                                                NameBook ==
                                                                    editedTitle; // อัปเดตชื่อหนังสือ
                                                                DetailBook ==
                                                                    editedDetail; // อัปเดตรายละเอียดหนังสือ
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // ปิด dialog
                                                            },
                                                            child: const Text(
                                                                'Save'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // ปิด dialog
                                                            },
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                style: FilledButton.styleFrom(
                                                  backgroundColor: Colors.grey,
                                                ),
                                                child: const Text('Detail',
                                                    style: TextStyle(
                                                        color: Colors.black)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        NameBook,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                      Text(
                                        DetailBook,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      // ปุ่มที่ใช้แสดง dialog
                                      FilledButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.blue[
                                                    200], // เปลี่ยนสีพื้นหลังของ dialog
                                                title:
                                                    const Text('Select Status'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children:
                                                        statuses.map((status) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedStatus =
                                                                status; // อัปเดตสถานะที่เลือก
                                                          });
                                                          Navigator.of(context)
                                                              .pop(); // ปิด dialog
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _getStatusColor(
                                                                  status), // Background color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0), // Rounded corners
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Text(
                                                                  status,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white, // สีตามสถานะ
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: FilledButton.styleFrom(
                                          backgroundColor: _getStatusColor(
                                              selectedStatus ??
                                                  'Available'), // ใช้สีที่ตรงตามสถานะที่เลือก
                                        ),
                                        child: Text(
                                          selectedStatus ??
                                              'Select Status', // แสดงสถานะที่เลือกหรือข้อความเริ่มต้น
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],     
                ),
              ),
              


              
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CurrentTimeDisplay(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.check_circle,
                              size: 50, color: Colors.black),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Available Books',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '20',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.import_export,
                              size: 50, color: Colors.black),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Borrowed Books',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '3',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.block, size: 50, color: Colors.black),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Returned Books',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '7',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
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
                                            '${books[index]['name']}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const Text(
                                            "Borrower's Name",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Jinnie Kim',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
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
                                            '${books[index]['loanDate']}',
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
                                            ' ${books[index]['returnDate']}',
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
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
                                                            'return'
                                                        ? const Color(
                                                            0xFF4CAF50)
                                                        : const Color.fromARGB(
                                                            255, 43, 49, 44),
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
                                          const Text(
                                            'Approved By:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            ' ${books[index]['approvedby']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.blue, // Set to black
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            'Asset back to:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Kim Jisoo',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors
                                                  .blue, // Set to black if needed
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

class CurrentTimeDisplay extends StatefulWidget {
  @override
  _CurrentTimeDisplayState createState() => _CurrentTimeDisplayState();
}

class _CurrentTimeDisplayState extends State<CurrentTimeDisplay> {
  late String currentTime; // Variable to hold the current time

  @override
  void initState() {
    super.initState();
    currentTime = _getCurrentTime(); // Initialize current time
    _startClock(); // Start the clock
  }

  String _getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  void _startClock() {
    // Update the current time every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = _getCurrentTime();
      });
    });
  }

  @override
  void dispose() {
    // Stop the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  late Timer timer; // Timer variable to control the periodic updates

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Update Today',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Add some space between the texts
              Text(
                currentTime,
                style: TextStyle(fontSize: 16), // Customize time text style
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showAddBookDialog(BuildContext context) {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.lightBlue[50], // Background color of the dialog
        title: const Text(
          'Add Book',
          style: TextStyle(color: Colors.blue), // Title color
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Book name',
                  labelStyle: TextStyle(color: Colors.blue), // Label color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent), // Focused border color
                  ),
                ),
              ),
              SizedBox(height: 16), // Spacing between fields
              TextField(
                controller: _authorController,
                decoration: InputDecoration(
                  labelText: 'Detail',
                  labelStyle: TextStyle(color: Colors.blue), // Label color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent), // Focused border color
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red, // Text color of the button
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('Add'),
            onPressed: () {
              // Add your logic to save the book information here
              String title = _titleController.text;
              String author = _authorController.text;

              // You can handle the book data here (e.g., save it to a list or database)

              // Close the dialog
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color of the button
              foregroundColor: Colors.white, // Text color of the button
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
            ),
          ),
        ],
      );
    },
  );
}

class BookCard extends StatelessWidget {
  final String bookId;
  final String title;
  final String subtitle;
  final String status;
  final String imageUrl;

  const BookCard({
    required this.bookId,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  Color getStatusColor() {
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
                    imageUrl,
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
                        bookId,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(title),
                            content: Text(subtitle),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Detail'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // ปุ่มสถานะจะกดได้แต่ไม่ทำงานเพิ่มเติม
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: getStatusColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                status,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
