import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final String date;
  final String time;
  final String category;
  final String fullDescription;

  const EventDetailPage({
    required this.title,
    required this.image,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
    required this.fullDescription,
  });

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isInterested = false;
  bool isGoing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.image, fit: BoxFit.cover),
              SizedBox(height: 16),

              Text(
                widget.description,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),

              Text(
                widget.fullDescription,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 8),
                  Text(widget.date, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),

              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 8),
                  Text(widget.time, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),

              Row(
                children: [
                  Icon(Icons.category),
                  SizedBox(width: 8),
                  Text(widget.category, style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isInterested ? Colors.white : Colors.green,
                      backgroundColor: isInterested ? Colors.green : Colors.white,
                      side: BorderSide(color: Colors.green, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        isInterested = !isInterested;
                      });
                    },
                    child: Text('Interested'),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isGoing ? Colors.white : Colors.blue,
                      backgroundColor: isGoing ? Colors.blue : Colors.white,
                      side: BorderSide(color: Colors.blue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        isGoing = !isGoing;
                      });
                    },
                    child: Text('Going'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
