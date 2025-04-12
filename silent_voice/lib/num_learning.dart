// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<Map<String, dynamic>> dataset = [];
  int currentIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkAndFetchData();
  }

  /// Check if cached data exists or fetch from Supabase
  Future<void> checkAndFetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cachedData = prefs.getString('number_cache');

    if (cachedData != null && cachedData.isNotEmpty) {
      try {
        final List<dynamic> decoded = jsonDecode(cachedData);
        if (decoded.isNotEmpty) {
          dataset = List<Map<String, dynamic>>.from(decoded);
          setState(() => isLoading = false);
          return;
        }
      } catch (e) {
        print('Cache decode error: \$e');
        // Fallback to fetch if cache is corrupt
      }
    }

    await fetchData();
  }

  /// Fetch data from Supabase
  Future<void> fetchData() async {
    try {
      setState(() => isLoading = true);
      final response = await supabase
          .from('num_learning')
          .select()
          .order('numbers', ascending: true);

      if (response.isNotEmpty) {
        dataset = response.map<Map<String, dynamic>>((item) {
          String? imageUrl = item['num_sign']?.toString().trim();
          imageUrl = imageUrl?.replaceAll(RegExp(r'%0D%0A|\s+'), '') ?? '';

          return {
            'num_sign': imageUrl,
            'number': item['numbers']?.toString().trim() ?? 'Unknown',
          };
        }).toList();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('number_cache', jsonEncode(dataset));
      }

      setState(() => isLoading = false);
    } catch (e) {
      print("Error fetching data: \$e");
      setState(() => isLoading = false);
    }
  }

  void showPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + dataset.length) % dataset.length;
    });
  }

  void showNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % dataset.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header
            Container(
              height: screenHeight * 0.08,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF97D8C4), Color(0xFF45B2E0)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Numbers',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('number_cache');
                        await fetchData();
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            if (isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (dataset.isEmpty)
              const Expanded(child: Center(child: Text("No data available.")))
            else
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_left, size: 50),
                            onPressed: showPrevious,
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: screenHeight * 0.02,
                              ),
                              width: screenWidth * 0.7,
                              height: screenHeight * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Image.network(
                                dataset[currentIndex]['num_sign'] ?? '',
                                fit: BoxFit.cover,
                                loadingBuilder: (
                                  context,
                                  child,
                                  loadingProgress,
                                ) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    size: 50,
                                  );
                                },
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_right, size: 50),
                            onPressed: showNext,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
