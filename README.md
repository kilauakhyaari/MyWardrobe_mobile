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


# Tugas :eight:

## Pertanyaan
### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
- *Navigator.push()*
Digunakan untuk mendorong halaman baru ke atas stack navigator, sehingga mempertahankan halaman sebelumnya. User dapat kembali ke halaman sebelumnya dengan menggunakan tombol back atau jika secara eksplisit dipanggil Navigator.pop(). Metode ini berguna ketika ingin memungkinkan user untuk melakukan navigasi "back" melalui stack navigasi. 
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);
```
- *Navigator.pushReplacement()*
Menggantikan halaman saat ini di stack dengan halaman baru. Halaman sebelumnya akan dihapus dari stack sehingga user tidak bisa kembali ke halaman tersebut. Ini berguna saat mengganti layar, seperti navigasi dari layar login ke dashboard utama setelah berhasil login, di mana tidak ingin user kembali ke layar login.
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);
```

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
-  *GridView*
Membuat grid dua dimensi dari widget anak-anaknya.
Digunakan untuk menampilkan data dalam bentuk grid seperti galeri gambar atau keyboard virtual.
- *ListView*
Membuat list scrollable dari widget anak-anaknya.
Digunakan untuk membuat list yang panjang dan bisa discroll seperti daftar chat atau feed berita.
- *Column*
Mengatur anak-anaknya secara vertikal dalam sebuah kolom tunggal.
Digunakan untuk tampilan yang membutuhkan susunan vertikal seperti formulir atau list.
- *Row*
Mengatur anak-anaknya secara horizontal dalam sebuah baris tunggal.
Digunakan untuk layout yang membutuhkan susunan horizontal seperti toolbar atau status bar.
- *Stack*
Memungkinkan anak-anaknya ditumpuk satu di atas yang lain.
Digunakan untuk overlay, seperti menempatkan badge di atas ikon.
- *Container*
Widget yang menggabungkan common painting, positioning, dan sizing widgets.
Digunakan sebagai blok bangunan dasar untuk membuat bentuk, mengatur padding, margin, menambahkan background, dll.
- *Padding*
Memberikan padding pada widget anaknya.
Digunakan untuk memberi ruang tambahan di sekitar widget tertentu.
- *Align*
Menyamakan widget anaknya sesuai dengan parameter alignment yang diberikan.
Digunakan untuk menempatkan widget pada posisi tertentu dalam container yang lebih besar.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
- *TextFormField untuk "Clothing Item"*
Digunakan agar user bisa memasukkan nama item pakaian dengan tipe text biasa.
Validator digunakan untuk memastikan bahwa field tidak kosong.
- *TextFormField untuk "Amount"*
Digunakan agar user bisa memasukkan jumlah item pakaian dalam bentuk angka numerik.
Validator memeriksa apabila input kekosongan dan memastikan bahwa nilai yang dimasukkan adalah angka.
- *TextFormField untuk "Description"*
Digunakan untuk memasukkan deskripsi item pakaian berbentuk teks.
Validator digunakan untuk memastikan bahwa deskripsi tidak kosong.

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapan _Clean Architecture_ pada aplikasi Flutter melibatkan pemisahan kode menjadi lapisan yang berbeda dengan tanggung jawab yang jelas, meningkatkan maintainability dan testability.
Prinsip umum _Clean Architecture_ di Flutter:
1. Independent of Frameworks: logika bisnis aplikasi harus bersifat independen dan tidak terikat pada Flutter itu sendiri.
2. Testable: logika bisnis dapat diuji tanpa UI, database, server, atau tools eksternal lainnya.
3. Independent of UI: UI bisa berubah tanpa mempengaruhi lapisan lainnya. 
4. Independent of Database: database bisa diganti tanpa mengubah logika bisnis.
5. Independent of any external agency: logika bisnis tidak harus tahu tentang hal yang berada di luar seperti database atau Web API.

Dalam implementasi di tugas ini, saya memisahkan kode menjadi beberapa direktori, seperti `lib/screens` dan `lib/widgets`. Dengan demikian, memudahkan pengelolaan kode, pengujian, dan pemeliharaan jangka panjang aplikasi.

## Step-by-step
- Membuat halaman baru pada aplikasi: Saya membuat file `wardrobeitem_list_form.dart` pada direnktori `lib/screens`.

Elemen input yang saya buat adalah name, amount, dan description dengan TextFormField yang dibungkus Padding. 

Saya juga menambah tombol save untuk menyimpan input dari form.
```dart
child: const Text(
  "Save",
  style: TextStyle(color: Colors.white),
)
```

Setiap elemen input di formulir divalidasi agar tidak kosong dan sesuai data type modelnya.
```dart
validator: (String? value) { // validasi data type
  if (value == null || value.isEmpty) { // validasi input tidak kosong
    return "Error Message"; 
  }
  if (int.tryParse(value) == null) {
    return "Amount has to be a number!"; // Contoh validasi data type untuk integer
  }
  return null;
},
```

- Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Add New Item` pada halaman utama.
```dart
if (item.name == "Add New Item") {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => const WardrobeFormPage()));
}
```
Saya menggunakan navigator pust untuk navigasi ke page forms ketika card Add New Item ditekan.

- Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Ketika pengguna menekan tombol `Save`, aplikasi akan melakukan validasi dan jika semua data benar, aplikasi akan menampilkan dialog pop-up dengan data yang sesuai dengan apa yang telah diisi pengguna dalam form tersebut. Tombol `OK` ketika ditekan, akan menutup dialog dengan memanggil Navigator.pop(context), yang menghapus AlertDialog dari tampilan. Setelah dialog ditampilkan, `_formKey.currentState!.reset()` membersihkan form, sehingga formulir bersih dari data sebelumnya.
```dart
onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Produk berhasil tersimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text('Clothing Item: $_name'),
                Text('Amount: $_amount'),
                Text('Description: $_description')
              ],),),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },),],);},);
  _formKey.currentState!.reset(); }},
```

- Membuat sebuah drawer
Saya membuat file `left_drawer.dart` pada lib/widgets. 
Lalu, saya membuat 2 opsi untuk ke halaman utama dan tambah item dalam ListTile anak dari ListView.
Ketika salah satu opsi ditekan, `Navigator.pushReplacement` akan navigasi ke halaman yang sesuai.
```dart
Widget build(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        ...
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_box_rounded),
          title: const Text('Add New Item'),
          onTap: () {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WardrobeFormPage(),)); 
        },),],),);}
```

