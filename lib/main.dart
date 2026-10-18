import 'package:flutter/material.dart';

void main() {
  runApp(const FishingSpeciesApp());
}

class FishSpecies {
  final String name;
  final String scientificName;
  final String habitat;
  final double avgWeightKg;
  final String difficulty;
  final String description;
  final String imagePath;

  const FishSpecies({
    required this.name,
    required this.scientificName,
    required this.habitat,
    required this.avgWeightKg,
    required this.difficulty,
    required this.description,
    required this.imagePath,
  });
}

class FishingSpeciesApp extends StatelessWidget {
  const FishingSpeciesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freshwater Fish Species',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      home: const FishListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FishListScreen extends StatelessWidget {
  const FishListScreen({super.key});

  final List<FishSpecies> fishList = const [
    FishSpecies(
      name: 'ปลาช่อน',
      scientificName: 'Channa striata',
      habitat: 'แหล่งน้ำจืดทั่วไป แม่น้ำ หนอง คลอง บึง',
      avgWeightKg: 2.5,
      difficulty: 'ปานกลาง',
      description: 'ปลาเศรษฐกิจและปลาเกมยอดนิยม นักตกปลานิยมใช้เหยื่อปลอมประเภทกบยางหรือปลาปลอมในการตก',
      imagePath: 'assets/images/fish1.jpg',
    ),
    FishSpecies(
      name: 'ปลากราย',
      scientificName: 'Chitala ornata',
      habitat: 'แม่น้ำเจ้าพระยา และแม่น้ำสายใหญ่',
      avgWeightKg: 5.0,
      difficulty: 'ยาก',
      description: 'ปลาน้ำจืดขนาดใหญ่ มีเอกลักษณ์คือจุดสีดำขอบขาวบริเวณโคนหาง เนื้อเหนียวแน่นนิยมนำมาทำทอดมัน',
      imagePath: 'assets/images/fish2.jpg',
    ),
    FishSpecies(
      name: 'ปลาชะอม (ชะโด)',
      scientificName: 'Channa micropeltes',
      habitat: 'แม่น้ำลึก เขื่อนขนาดใหญ่ และอ่างเก็บน้ำ',
      avgWeightKg: 10.0,
      difficulty: 'ยากมาก',
      description: 'ปลาล่าเหยื่อขนาดใหญ่ที่สุดในวงศ์ปลาช่อน ดุร้ายและทรงพลัง เป็นที่ชื่นชอบของนักตกปลาล่าเหยื่อผิวน้ำ',
      imagePath: 'assets/images/fish3.jpg',
    ),
    FishSpecies(
      name: 'ปลาบึก',
      scientificName: 'Pangasianodon gigas',
      habitat: 'แม่น้ำโขง และบ่อตกปลาเชิงพาณิชย์',
      avgWeightKg: 80.0,
      difficulty: 'ยากมาก',
      description: 'ปลาน้ำจืดไร้เกล็ดขนาดใหญ่ที่สุดในโลก กินพืชเป็นอาหาร แรงดึงมหาศาล สถิติการตกปลาเกมที่ได้รับความนิยมสูง',
      imagePath: 'assets/images/fish4.jpg',
    ),
    FishSpecies(
      name: 'ปลานิล',
      scientificName: 'Oreochromis niloticus',
      habitat: 'แม่น้ำ คลอง และบ่อเลี้ยงปลาทั่วไป',
      avgWeightKg: 1.0,
      difficulty: 'ง่าย',
      description: 'ปลาเศรษฐกิจสำคัญที่นำเข้าจากต่างประเทศ เจริญเติบโตเร็ว เลี้ยงง่าย และตกได้ง่ายด้วยเหยื่อรำหรือขนมปัง',
      imagePath: 'assets/images/fish5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สปีชีส์ปลาและข้อมูลการตกปลา', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: fishList.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final fish = fishList[index];
          return Card(
            color: const Color(0xFF1E293B),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(fish.imagePath, width: 70, height: 70, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(width: 70, height: 70, color: Colors.grey, child: const Icon(Icons.image)),
                ),
              ),
              title: Text(fish.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text('ถิ่นที่อยู่: ${fish.habitat}\nความยาก: ${fish.difficulty}', style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.amber, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FishDetailScreen(fish: fish),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FishDetailScreen extends StatelessWidget {
  final FishSpecies fish;

  const FishDetailScreen({super.key, required this.fish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fish.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E293B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(fish.imagePath, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fish.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text('ชื่อวิทยาศาสตร์: ${fish.scientificName}', style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.cyanAccent)),
                  const Divider(color: Colors.grey, height: 30),
                  const Text('คุณสมบัติและรายละเอียด:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber)),
                  const SizedBox(height: 10),
                  _buildDetailRow(Icons.location_on, 'ถิ่นที่อยู่อาศัย', fish.habitat),
                  _buildDetailRow(Icons.monitor_weight, 'น้ำหนักเฉลี่ย', '${fish.avgWeightKg} กิโลกรัม'),
                  _buildDetailRow(Icons.local_fire_department, 'ระดับความยาก', fish.difficulty),
                  _buildDetailRow(Icons.info_outline, 'คำอธิบายเพิ่มเติม', fish.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.cyan, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}