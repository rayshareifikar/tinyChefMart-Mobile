# tiny_chef_mart

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

--------------------------------------------------------------------------------------------------------------------
                                                    Tugas 7
--------------------------------------------------------------------------------------------------------------------

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
    - Stateless widget:
        Widget yang tidak memiliki state atau kondisi yang bisa berubah setelah widget tersebut pertama kali dibangun. Oleh karena sifatnya yang statis, stateless widget cocok digunakan untuk UI yang tidak membutuhkan perubahan atau interaksi dari pengguna. 
    - Stateful widget: 
        Widget yang bisa berubah-ubah kondisinya (dinamis) ketika ada interaksi pengguna atau data yang diperbarui.
    - Perbedaan:
        - Stateless widget:
            - Tidak memiliki state
            - Hanya dibangun sekali
            - Cocok untuk UI yang tidak berubah
        - Stateful widget: 
            - Memiliki state
            - Dapat dibangun ulang sesuai perubahan state
            - Cocok untuk UI yang interaktif atau dinamis


2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
    - Text: Untuk menampilkan teks statis
    - Icon: Untuk menampilkan ikon pada setiap item di ItemCard
    - Scaffold: Widget utama untuk membuat sebuah halaman pada flutter
    - SizedBox: Untuk menampilkan box
    - Row: Untuk menampilkan widget-widget secara horizontal

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
    - SetState() adalah metode dalam stateful widget yang digunakan untuk memperbarui UI setelah state atau data dalam widget berubah. Ketika setState() dipanggil, Flutter akan rebuild hanya widget yang terpengaruh perubahan tersebut, bukan keseluruhan aplikasi

    - Variabel yang terpengaruh:
        - Counter: 
            Pada aplikasi penghitung, nilai counter akan diperbarui di UI setiap kali setState() dipanggil.
        - Variabel yang menyimpan status input pengguna: 
            Seperti teks di TextField, pilihan dalam Dropdown, atau status Checkbox
        - Variabel yang mengatur tampilan elemen UI: 
            Boolean untuk menampilkan atau menyembunyikan widget tertentu (isVisible, isExpanded), atau mengganti warna/gaya suatu elemen

4. Jelaskan perbedaan antara const dengan final.
    - Const:
        Nilai variabel bersifat tetap dan tidak bisa diubah setelah kompilasi.
    - Final:
        Nilai variabel bersifat tetap setelah diberi nilai pertama kali, tetapi nilainya bisa dihasilkan saat runtime.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
    - Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
        - flutter create tiny_chef_mart
    - Membuat tiga tombol sederhana dengan ikon dan teks
        - Saya membuat daftar item ItemHomepage yang berisi tiga tombol
    - Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
        - Menggunakan List<Color> bernama cardColors, setiap tombol diberi warna yang berbeda. 
        - Dalam GridView.count, warna dari cardColors diberikan kepada masing-masing ItemCard berdasarkan indeks mereka.
    - Memunculkan Snackbar dengan tulisan:
        - Pada ItemCard, menggunakan widget InkWell untuk mendeteksi penekanan tombol. Ketika tombol ditekan, SnackBar akan muncul dengan pesan sesuai dengan tombol yang ditekan
        - ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            ); untuk menampilkan pesan

--------------------------------------------------------------------------------------------------------------------
                                                    Tugas 8
--------------------------------------------------------------------------------------------------------------------
1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
    - Const digunakan untuk menandai nilai atau widget yang bersifat immutable (tidak bisa diubah) pada waktu kompilasi. Nilai atau widget yang ditandai dengan const akan tetap sama dan hanya dihitung atau dibuat sekali saja saat kompilasi.
    
    - keuntungan menggunakan const:
        - Efisiensi Memori:
            - Dengan menggunakan const, Flutter akan menyimpan satu instance dari objek atau widget tersebut yang dapat digunakan kembali di berbagai tempat tanpa perlu membuat ulang objek yang sama sehingga membantu mengurangi konsumsi memori.
        - Optimalisasi Performa:
            - Objek atau widget const hanya perlu di-render sekali sehingga mengurangi beban kerja pada runtime. Hal ini meningkatkan performa aplikasi, terutama untuk aplikasi yang memiliki struktur widget kompleks atau banyak elemen statis.
        - Pencegahan error:
            - const memastikan bahwa suatu nilai tidak akan berubah sehingga dapat mencegah perubahan yang tidak disengaja. Hal ini membuat kode lebih aman dan meminimalisasi resiko bug akibat perubahan data secara tidak sengaja.
    
    - Kapan sebaiknya menggunakan const:
        - Widget yang bersifat statis atau tidak berubah
        - Mendefinisikan data konstan yang digunakan di seluruh aplikasi
    
    - Kapan sebaiknya tidak menggunakan const:
        - Widget atau objek yang bisa berubah atau sering diperbarui. 
        - Membutuhkan perhitungan ulang selama aplikasi berjalan
    
2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
    - Column:
        - Column digunakan untuk menempatkan elemen-elemen dalam susunan vertikal
        - mainAxisAlignment: Mengatur posisi elemen secara vertikal
        - crossAxisAlignment: Mengatur posisi elemen secara horizontal
        - Implementasi:
            Column(
                mainAxisAlignment: MainAxisAlignment.center, // Pusatkan elemen secara vertikal
                crossAxisAlignment: CrossAxisAlignment.start, // Mulai dari kiri secara horizontal
                children: [
                    Text('Elemen 1'),
                    Text('Elemen 2'),
                    ElevatedButton(
                    onPressed: () {},
                    child: Text('Tombol'),
                    ),
                ],
            )

    - Row:
        - Row digunakan untuk menempatkan elemen-elemen dalam susunan horizontal
        - mainAxisAlignment: Mengatur posisi elemen secara horizontal
        - crossAxisAlignment: Mengatur posisi elemen secara vertikal
        - Implementasi:
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Sebar elemen secara merata
                crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan elemen secara vertikal
                children: [
                    Icon(Icons.star),
                    Text('Rating: 5'),
                    ElevatedButton(
                    onPressed: () {},
                    child: Text('Lihat Detail'),
                    ),
                ],
            )

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
    - Digunakan:
        - TextFormField: Untuk input nama produk, deskripsi, harga, kuantitas
        - ElevatedButton: Untuk tombol yang menyimpan data

    - Tidak digunakan:
        - Checkbox: Untuk opsi pilihan ya atau tidak
        - Radio: Untuk pilihan tunggal dari beberapa opsi
        - DropdownButton: Untuk pilihan dari daftar opsi yang lebih panjang. 

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
    - Menggunakan ThemeData di MaterialApp di main.dart. Dengan ThemeData, tema dapat diatur secara global sehingga temanya konsisten. 
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.brown,
          ).copyWith(secondary: Colors.brown[400]),
      ),

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
    - Menggunakan navigator.pop untuk kembali ke halaman sebelumnya 
        onPressed: () {
            Navigator.pop(context);
            _formKey.currentState!.reset();
        },
    - Menggunakan named routes 
        initialRoute: '/',
      routes: {
        '': (context) => MyHomePage(), // Halaman utama aplikasi
        'product-entry': (context) => ProductEntryFormPage(), // Rute ke halaman MoodEntryFormPage
      }, 
    - Menggunakan drawer di page left_drawer.dart

--------------------------------------------------------------------------------------------------------------------
                                                    Tugas 9
--------------------------------------------------------------------------------------------------------------------

1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
    - Membuat model dalam Flutter diperlukan untuk memetakan data JSON ke dalam objek Dart. Hal ini mempermudah manipulasi dan validasi data saat melakukan pengambilan atau pengiriman data ke web service. Tanpa model, kita harus bekerja langsung dengan tipe data dinamis (misalnya Map<String, dynamic>) yang rentan terhadap error karena kurangnya tipe data yang jelas.
    - Jika kita tidak membuat model terlebih dahulu, mungkin tidak langsung terjadi error. Namun, kesalahan seperti salah mengakses atribut JSON dapat lebih sering muncul, dan kode menjadi sulit dikelola serta tidak efisien.

2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
    - Library http digunakan untuk melakukan permintaan HTTP seperti GET, POST, PUT, atau DELETE ke web service. Dalam tutorial ini, library ini memungkinkan aplikasi Flutter untuk mengambil data dari API Django atau mengirimkan data ke server. Fungsionalitas seperti pengambilan data dengan metode http.get dan pengiriman data menggunakan http.post menjadi kunci dalam integrasi antara aplikasi Flutter dan Django.



3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    - CookieRequest adalah kelas yang dikelola oleh package pbp_django_auth untuk mengelola sesi autentikasi. Fungsi utamanya adalah menjaga status login pengguna dengan menyimpan cookie dari server.
    - Membagikan instance CookieRequest ke seluruh komponen aplikasi (dengan menggunakan Provider) penting karena memungkinkan semua halaman atau widget untuk mengakses informasi pengguna yang sedang login atau melakukan permintaan dengan sesi yang sama tanpa perlu membuat ulang koneksi.


4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    - Input Data di Flutter: Pengguna mengisi formulir (misalnya, menggunakan TextField) di aplikasi.
    - Pengiriman ke Server: Data dikirimkan ke API Django menggunakan CookieRequest.postJson() dalam bentuk JSON.
    - Pemrosesan di Django: Server memproses data yang diterima (misalnya, menyimpannya ke database).
    - Respon JSON ke Flutter: Django mengirimkan respons (status atau data baru) dalam bentuk JSON.
    - Konversi JSON di Flutter: Data JSON dari server dikonversi ke model Dart.
    - Tampilan di UI: Data yang telah dikonversi ditampilkan pada UI menggunakan widget seperti FutureBuilder.

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    - Login:
        - Input username dan password di Flutter.
        - Data dikirim ke endpoint login di Django.
        - Django memverifikasi kredensial menggunakan authenticate().
        - Jika berhasil, Django mengirimkan cookie sesi ke Flutter, yang disimpan oleh CookieRequest.
        - Flutter memuat tampilan menu utama.

    - Register:
        - Input data akun di Flutter.
        - Data dikirim ke endpoint register di Django.
        - Django memvalidasi dan membuat akun baru jika valid.
        - Django mengirimkan respons ke Flutter untuk menampilkan notifikasi.

    - Logout:
        - Flutter memanggil endpoint logout di Django.
        - Django menghapus sesi pengguna.
        - Flutter menghapus status login dan mengarahkan pengguna ke halaman login.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    -  Instal library http, provider, dan pbp_django_auth. Lalu ditambahkan depedensinya
    - Mengambil data dari json yang prjek django
    - Mengubahnya menjadi kode dart menggunakan quicktype
    - Menambahkan aplikasi authentication dan atur middleware CORS pada projek django, lalu membuat view untuk login, register, dan logout.
    - Konfigurasikan CookieRequest menggunakan Provider.
    - Buat halaman login, register, dan logout. Kemudian membuat juga halaman list produk dan detail produk
    - Gunakan FutureBuilder untuk menampilkan data setelah login.

