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