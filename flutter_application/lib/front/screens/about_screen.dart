import 'package:flutter/material.dart';

class TrangThongTin extends StatelessWidget {
  const TrangThongTin({Key? khoa}) : super(key: khoa);

  @override
  Widget build(BuildContext nguCanh) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _taoThanhDieuHuong(),
            const SizedBox(height: 80),
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
            const SizedBox(height: 48),
            _taoBieuMau(),
            const SizedBox(height: 80),
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
                  _taoNutLienKet('Products', xam: true),
                  _taoNutLienKet('Solutions', xam: false),
                  _taoNutLienKet('Community', xam: false),
                  _taoNutLienKet('Resources', xam: false),
                  _taoNutLienKet('Pricing', xam: false),
                  _taoNutLienKet('Contact', xam: false),
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

  Widget _taoNutLienKet(String tieuDe, {required bool xam}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: xam ? const Color(0xFFF1F3F5) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          tieuDe,
          style: const TextStyle(
            color: Color(0xFF212529),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _taoBieuMau() {
    return Container(
      width: 480,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDEE2E6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _taoTruongNhap(tieuDe: 'Name', goiY: 'Value'),
          const SizedBox(height: 24),
          _taoTruongNhap(tieuDe: 'Surname', goiY: 'Value'),
          const SizedBox(height: 24),
          _taoTruongNhap(tieuDe: 'Email', goiY: 'Value'),
          const SizedBox(height: 24),
          _taoTruongNhap(tieuDe: 'Message', goiY: 'Value', soDong: 5),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF343A40),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _taoTruongNhap({
    required String tieuDe,
    required String goiY,
    int soDong = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tieuDe,
          style: const TextStyle(
            color: Color(0xFF212529),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: soDong,
          decoration: InputDecoration(
            hintText: goiY,
            hintStyle: const TextStyle(color: Color(0xFFADB5BD)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFDEE2E6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF495057)),
            ),
          ),
        ),
      ],
    );
  }
}