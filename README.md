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

# Tugas :nine:

## Pertanyaan
### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, bisa. 
Pengambilan data JSON tanpa model lebih fleksible, sehingga tidak mengikuti format tertentu. Ketika memasukkan data, pembuatan model tidak divalidasi, sehingga bisa apa saja. Namun karena kurangnya struktur, dapat menyebabkan kesulitan dalam memelihara kode.
Pengambilan data JSON dengan model akan memudahkan membaca dan memelihara kode, terutama dalam proyek besar. Dengan model, validasi data yang lebih ketat dan penanganan kesalahan yang lebih baik.

Untuk proyek skala kecil atau tugas yang sederhana, pengambilan data JSON tanpa model bisa lebih efisien. Untuk aplikasi yang lebih besar dan kompleks, model dapat memberikan struktur yang lebih baik dan memudahkan pemeliharaan.

### 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
*Fungsi Cookie:*
- Menyimpan informasi sesi.
- Memungkinkan pengguna tetap login saat mereka menggunakan aplikasi.
- Menyimpan preferensi pengguna, agar penggunaan aplikasi lebih personal.

*Kenapa instance CookieRequest harus dibagikan?*
-  Menjaga konsistensi cookie di seluruh aplikasi sangat penting untuk memastikan bahwa semua permintaan HTTP memiliki informasi sesi atau autentikasi yang sama.
- Berbagi satu instance memastikan bahwa penggunaan sumber daya dioptimalkan.
- Mengelola cookie di satu tempat membantu menerapkan praktik keamanan yang konsisten dan meminimalkan risiko kebocoran data.
- Lebih mudah memelihara karena semua operasi yang berkaitan dengan cookie dalam aplikasi diatur melalui satu mekanisme.

### 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Integrasi dengan Web Service
- Pertama, tambahkan paket http ke aplikasi Flutter. Ini memungkinkan aplikasi untuk melakukan permintaan HTTP.
- Import paket http di file Dart proyek.

2. Pengambilan Data
- Buat fungsi asinkron yang menggunakan paket http untuk mengirim permintaan GET ke server web.
Contoh: final response = await http.get(Uri.parse(url));

3. Deserialisasi Data JSON
- Setelah mendapatkan respons dari server, gunakan jsonDecode dari dart:convert untuk mengonversi string respons JSON menjadi objek Dart.
Contoh: Map<String, dynamic> data = jsonDecode(response.body);

4. Pemrosesan Data
- Proses data yang diterima untuk digunakan dalam aplikasi. Ini mungkin melibatkan penyimpanan data dalam variabel atau struktur data yang lebih kompleks.

5. Tampilan di Flutter
- Gunakan data yang telah diproses untuk membangun widget di Flutter. Data ini bisa digunakan untuk menampilkan teks, daftar, gambar, atau elemen UI lainnya.

6. Serialisasi Data JSON ke Objek Dart
- Untuk proyek yang lebih kecil, serialisasi bisa dilakukan secara manual. 
- Untuk proyek yang lebih besar, serialisasi bisa dilakukan secara otomatis dengan paket `json_serializable` untuk mengurangi kemungkinan kesalahan.

### 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Input data akun pengguna di Flutter. Pengguna login di aplikasi Flutter.
2. Setelah pengguna menekan tombol login, Flutter mengirimkan data tersebut ke server Django. Ini biasanya dilakukan dengan permintaan HTTP POST. Data dikirimkan dalam format yang dapat diterima oleh server Django, seperti JSON.
3. Server Django menerima data login dari request HTTP. Django menggunakan sistem autentikasi bawaan atau kustom untuk memverifikasi data login pengguna.
4. Setelah memverifikasi kredensial, Django mengirimkan respons kembali ke aplikasi Flutter. Untuk autentikasi yang berhasil, Django mungkin mengirimkan token autentikasi atau ID sesi yang akan digunakan untuk autentikasi berikutnya.
5. Jika login berhasil, aplikasi Flutter mengalihkan pengguna ke halaman homepage pengguna.
6. Setelah autentikasi, aplikasi Flutter menampilkan menu atau antarmuka pengguna yang sesuai.

### 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
*Drawer:* Widget ini digunakan untuk membuat menu drawer yang dapat ditarik dari sisi layar. Ini memberikan navigasi tambahan dalam aplikasi.

*ListView:* Widget ini digunakan untuk membuat daftar item yang dapat discroll. Dalam konteks ini, digunakan untuk menampilkan item-item dalam drawer.

*ListTile:* Widget ini digunakan untuk membuat item yang dapat diklik di dalam ListView. Dalam hal ini, digunakan untuk membuat item navigasi di drawer.

*Icon:* Widget ini digunakan untuk menampilkan ikon di samping teks dalam ListTile.

*Material:* Widget ini digunakan sebagai dasar untuk menampilkan komponen UI yang mengikuti Material Design. Di sini, digunakan untuk memberikan warna latar belakang pada card.

*FutureBuilder:* Widget ini digunakan untuk membangun UI berdasarkan hasil dari Future. Dalam kasus ini, digunakan untuk membangun UI setelah data dari fetchItem() diperoleh.

*Text:* Widget ini digunakan untuk menampilkan teks di layar.

*Padding:* Widget ini digunakan untuk memberikan padding di sekitar konten lainnya, dalam hal ini di sekitar kolom yang menampilkan detail produk.

*Column:* Widget ini digunakan untuk menata beberapa widget lainnya secara vertikal. Ini digunakan untuk menampilkan informasi detail produk.

## Step-by-step
1. Membuat halaman login pada proyek tugas Flutter.
Untuk membuat halaman login, saya membuat file `login.dart` pada folder `screens`. 
```dart
void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        ...
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        ...
    }
}
```
Lalu, pada `main.dart` material app saya ubah menjadi `home: LoginPage()` agar defaultnya ke login page jika user mengakses app.

2. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Pertama saya membuat django app `authentication` pada proyek django MyWardrobe saya. Lalu, menambahkannya ke installed apps di settings.py aplikasi. Setelah itu menjalankan `pip install django-cors-headers` pada terminal. Lalu, saya menambahkan `corsheaders.middleware.CorsMiddleware` di Middleware settings.py aplikasi dan menambahkan beberapa variable yang berkaitan dengan cookies. 
Lalu, saya juga membuat function untuk login di `authentication/views.py`, tidak lupa menambahkan path dan url yang sesuai.
Saya menginstal package `provider` dan `pbp_django_auth`, lalu mengubah main.dart agar mereturn objek Provider dengan CookieRequest. 
```dart
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            ...
        );
    }
}
```
3. Membuat model kustom sesuai dengan proyek aplikasi Django.
Saya mengubah data JSON menjadi model untuk aplikasi Dart dengan memasukkan data JSON dari proyek Django ke website *Quicktype*. Lalu code models yang diperoleh dimasukkan ke file baru bernama `product.dart` pada lib/models.

4. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
Saya membuat file `list_product.dart` pada lib/screens. Saya mengimport packages yang diperlukan.
```dart
class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    ...
}

@override
Widget build(BuildContext context) {
  ...
}
}
```
- Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.
Pada bagian widget build, saya menambahkan kode berikut:
```dart
ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (_, index) => Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 12),
        padding: const EdgeInsets.all(20.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
            "${snapshot.data![index].fields.name}",
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 10),
            Text("${snapshot.data![index].fields.amount}"),
            const SizedBox(height: 10),
            Text(
                "${snapshot.data![index].fields.description}")
        ],
      ),
    )
);
```

5. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
Saya membuat file baru pada screens dengan nama `detail_product.dart`.
Kemudian, untuk mengintegrasikannya, saya menambahkan Widget Inkwell pada `list_product.dart`. Inkwell akan mendirect ketika user menekan product ke page `detail_product.dart` dengan kode berikut:
```dart
class DetailProductPage extends StatelessWidget {
  final Product item;

  const DetailProductPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item.fields.name}'),
            Text('Amount: ${item.fields.amount}'),
            Text('Description: ${item.fields.description}'),
            Text('In Laundry? ${item.fields.inLaundry}'),
            Text('Date added:  ${item.fields.dateAdded}'),
          ],
        ),
      ),
    );
  }
}
```
Pada `list_product.dart`, saya menambahkan:
```dart
  itemBuilder: (_, index) {
    var item = snapshot.data![index];

    return InkWell(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) =>
            DetailProductPage(item: item),
          ),
        );
      },
    ....
    )}
```

