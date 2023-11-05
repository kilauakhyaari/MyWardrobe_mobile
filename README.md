# :kimono: My Wardrobe for Mobile :coat:

by: Kilau Nisrina Akhyaari - 2206082051

# Tugas :seven:

## Pertanyaan
### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
- *Stateless widget*
Widget yang tidak memiliki _state_ sehingga tidak dapat mengubah tampilan atau perilakunya setelah dibuat. Stateless widget cocok untuk menampilkan tampilan statis seperti teks, gambar, ikon, tombol yang tidak berubah selama widget ditempatkan di layar.
- *Stateful widget*
Widget yang memiliki _state_, objek data yang parameternya dipertahankan pada saat pembuatan dan dapat berubah ketika digunakan dalam aplikasi. Stateful widget dapat digunakan untuk membuat formulir, list yang memiliki checkbox, animasi, dan semua komponen yang memerlukan adanya pembaruan tampilan yang dinamis sesuai dengan perubahan keadaan aplikasi.

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- *MyHomePage* (Stateless Widget)
    * Sebagai tampilan utama aplikasi.
    * Menggunakan `Scaffold` untuk membuat kerangka tampilan yang berisi AppBar dan body.
    * `SingleChildScrollView` agar konten di dalamnya dapat di-_scroll_.
    * `Column` untuk menempatkan widget-widget di dalamnya secara vertikal.
    * `Padding` agar ada area kosong disekitar elemen. 
    * `Text` untuk menampilkan tulisan pada aplikasi.
    * `GridView.count` membuat layout dengan jumlah _tiles_ tetap pada sumbu axis.

- *WardrobeItem* (Class)
    * Kelas yang digunakan untuk merepresentasikan item-item di daftar pakaian.
    * Kelas ini memiliki dua properti, yaitu _name_ dan _icon_.

- *WardrobeCard* (Stateless Widget)
    * Untuk menampilkan setiap item dalam bentuk cards.
    * `Material` sebagai tempat latar belakang untuk cards.
    * `InkWell` untuk menambahkan responsivitas terhadap sentuhan sehingga dapat menampilkan pesan SnackBar ketika card ditekan.
    * `Container` untuk menampilkan ikon dan teks untuk setiap item pakaian.

- *MyApp* (Stateless Widget)
    * Sebagai tampilan awal aplikasi yang menginisialisasi MyHomePage sebagai tampilan utama.
    * `MaterialApp`, root aplikasi. Berfungsi untuk mengatur tema aplikasi.

## Step-by-step
1. Pertama, saya membuat project Flutter bernama `mywardrobe_mobile` dengan perintah.
```
flutter create mywardrobe_mobile
```
2. Lalu dalam direktori `mywardrobe_mobile`, saya menjalankan `flutter run` pada terminal dan memilih menampilkannya di chrome.
3. Saya membuat file `menu.dart` pada direktori `lib`. Saya mengimport `'package:flutter/material.dart'`. 
4. Setelah itu, saya membuat class `WardrobeItem` dan `WardrobeCard` (yang merupakan stateless widget). Saya juga menerapkan bonus dengan membuat setiap WardrobeItem memiliki warna cards berbeda.
```dart
class  WardrobeItem {
  final String name;
  final IconData icon;
  final Color color;

  WardrobeItem(this.name, this.icon, this.color);
}
```
5. Saya juga membuat widget-widget yang sesuai dan melakukan styling pada warna dan ukuran font.
```dart
class WardrobeCard extends StatelessWidget {
  final WardrobeItem item;

  const WardrobeCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) { 
    ...
  }
}
```
6. Dalam class MyHomePage, saya membuatnya menjadi stateless widget dan menambahkan beberapa widget didalamnya.
```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<WardrobeItem> items = [
    WardrobeItem("Lihat Item", Icons.checkroom_rounded, Colors.red.shade200),
    WardrobeItem("Tambah Item", Icons.add_box_rounded,Colors.cyan.shade200),
    WardrobeItem("Logout", Icons.logout, Colors.lime.shade200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        ...
    )
  }
}
```
7. Pada `main.dart`, saya memodifikasi default templatenya agar menyesuaikan _clean architecture_.
```dart
import 'package:flutter/material.dart';
import 'package:mywardrobe_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Wardrobe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
8. Terakhir, saya membuat repositori github baru untuk menyimpan proyek mywardrobe_mobile ini. Tidak lupa, saya commit dan push ke repo tersebut.
