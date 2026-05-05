import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext nguCanh) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _taoThanhDieuHuong(),
            const SizedBox(height: 80),
            _taoTieuDeChinh(),
            const SizedBox(height: 48),
            _taoPhanHopCho(),
            const SizedBox(height: 80),
            _taoPhanDanhSachThe(),
            const SizedBox(height: 80),
            _taoPhanLuoiThe(),
            const SizedBox(height: 80),
            _taoChanTrang(),
          ],
        ),
      ),
    );
  }

  Widget _taoThanhDieuHuong() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFDEE2E6)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.pages, size: 36, color: Colors.black),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _taoNutLienKet('Products'),
                  _taoNutLienKet('Solutions'),
                  _taoNutLienKet('Community'),
                  _taoNutLienKet('Resources'),
                  _taoNutLienKet('Pricing'),
                  _taoNutLienKet('Contact'),
                ],
              ),
            ),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Color(0xFFCED4DA)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Sign in'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF343A40),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Register'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _taoNutLienKet(String tieuDe) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(foregroundColor: const Color(0xFF212529)),
        child: Text(
          tieuDe,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _taoTieuDeChinh() {
    return Column(
      children: [
        const Text(
          'Title',
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w800,
            color: Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Subtitle',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF495057),
          ),
        ),
      ],
    );
  }

  Widget _taoPhanHopCho() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(child: _taoHopIcon()),
          const SizedBox(width: 24),
          Expanded(child: _taoHopIcon()),
        ],
      ),
    );
  }

  Widget _taoHopIcon() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE9ECEF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDEE2E6)),
      ),
      child: const AspectRatio(
        aspectRatio: 2 / 1,
        child: Center(
          child: Icon(
            Icons.image_outlined,
            size: 64,
            color: Color(0xFFCED4DA),
          ),
        ),
      ),
    );
  }

  Widget _taoPhanDanhSachThe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Heading',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Subheading',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF495057),
            ),
          ),
          const SizedBox(height: 48),
          _taoTheNoiDungNgang(),
          const SizedBox(height: 24),
          _taoTheNoiDungNgang(),
          const SizedBox(height: 24),
          _taoTheNoiDungNgang(),
        ],
      ),
    );
  }

  Widget _taoTheNoiDungNgang() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDEE2E6)),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFE9ECEF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                size: 48,
                color: Color(0xFFCED4DA),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212529),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF495057),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF212529),
                    side: const BorderSide(color: Color(0xFFCED4DA)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _taoPhanLuoiThe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Heading',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Subheading',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF495057),
            ),
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(child: _taoTheLuoi()),
              const SizedBox(width: 24),
              Expanded(child: _taoTheLuoi()),
              const SizedBox(width: 24),
              Expanded(child: _taoTheLuoi()),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _taoTheLuoi()),
              const SizedBox(width: 24),
              Expanded(child: _taoTheLuoi()),
              const SizedBox(width: 24),
              Expanded(child: _taoTheLuoi()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _taoTheLuoi() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDEE2E6)),
      ),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFFE9ECEF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                size: 64,
                color: Color(0xFFCED4DA),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212529),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF495057),
                    height: 1.5,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _taoChanTrang() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      decoration: const BoxDecoration(
        color: Color(0xFFF8F9FA),
        border: Border(
          top: BorderSide(color: Color(0xFFDEE2E6)),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.pages, size: 36, color: Colors.black),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.video_library_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.work_outline)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: Color(0xFFDEE2E6)),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _taoCotLienKet('Use cases', ['UI design', 'UX design', 'Wireframing', 'Diagramming', 'Brainstorming', 'Online whiteboard', 'Team collaboration'])),
              const SizedBox(width: 24),
              Expanded(child: _taoCotLienKet('Explore', ['Design', 'Prototyping', 'Development features', 'Design systems', 'Collaboration features', 'Design process', 'FigJam'])),
              const SizedBox(width: 24),
              Expanded(child: _taoCotLienKet('Resources', ['Blog', 'Best practices', 'Colors', 'Color wheel', 'Support', 'Developers', 'Resource library'])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _taoCotLienKet(String tieuDe, List<String> lienKet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tieuDe,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 16),
        ...lienKet.map((chuoi) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            chuoi,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF495057),
            ),
          ),
        )).toList(),
      ],
    );
  }
}