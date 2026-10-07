

import 'dart:io';

void main(){
    var mulai = true;
    var ceklogin = true;
    var user = 'Fedrick01';
    var password = '01102007';
    var saldo = 2000000;

    Map<String, int> katalog = {
        'Buku' : 15000,
        'Pulpen' : 5000,
        'Kaus Kaki' : 20000,
        'Casing Hp' : 50000,
        'Sisir Gajah' : 40000,
        'Kalkulator Scientific' : 120000,
        'Sabun Cuci Muka' : 56000,
        'Powerbank 10000 mAh' : 240000,
        'Sepatu Badminton' : 350000,
        'Jam Tangan Arloji' : 200000,
    };

    List<Map<String, dynamic>> keranjang = [];

    void tampilkan_katalog(){
        print('==========================');
        print('       Daftar Produk      ');
        print('==========================');
        int no = 1;
        katalog.forEach((nama, harga){
            print('$no. $nama : Rp.$harga');
            no++;
        });
      
        print('==========================');
    }

    void login(){
        print('=============================');
        print('    E-commerce Serba ada    ');
        print('=============================');
        stdout.write('Masukkan User : ');
        var u = stdin.readLineSync()!;
        if (u == user) {
          stdout.write('Masukkan Password : ');
          var p = stdin.readLineSync()!;
            if (p == password) {
              ceklogin = false;
            } else {
                print('Password yang anda masukkan salah!');
            }
        } else {
            print('User yang anda masukkan salah!');
        }
    }

    void ceksaldo(){
        print('Saldo anda saat ini adalah : $saldo ');
    }
    
    void masukkan_keranjang(){
        tampilkan_katalog();
        var pilih_katalog = katalog.keys.toList();

        stdout.write('Pilih Nomor Barang yang ingin anda masukkan : ');
        var k = stdin.readLineSync()!;
        var input_k = int.tryParse(k);

        if (input_k == null || input_k < 1 || input_k > katalog.length) {
          print('Silahkan memilih ulang!');
          return;
        }
       
       var pilih_k = pilih_katalog[input_k - 1];

       stdout.write('Masukkan Jumlah yang anda inginkan : ');
       var jumlah_barang = int.tryParse(stdin.readLineSync()!);

       if (jumlah_barang == null || jumlah_barang < 1) {
         print('Masukkan Jumlah yang Valid!');
         return;
       }


        // keranjang.add();
    }

    void topup(){
        stdout.write('Berapa nominal yang ingin anda isi : ');
        var t = stdin.readLineSync()!;
        var isi_topup = int.parse(t);
        saldo = saldo + isi_topup;
        print('Top Up anda berhasil!');
        print('Saldo anda sekarang : $saldo');
    }

    void menu(){
        print('=============================');
        print('1. Cek Saldo');
        print('2. Masukkan ke keranjang barang');
        print('3. Top Up Saldo');
        print('4. Check Out Barang');
        print('5. Keluar App');
        print('=============================');
    }

    void keluar(){
        exit(0);
    }


    while (mulai == true) {
        if (ceklogin == true) {
          login();
        } else {
            menu();
            stdout.write('Pilih Menu (1/2/3/4/5) : ');
            var input_m = stdin.readLineSync()!;
            var pilih_menu = int.parse(input_m);
            switch (pilih_menu) {
              case 1:
                ceksaldo();
                break;
              case 2:
                masukkan_keranjang();
                break;
              case 3:
                topup();
                break;
              case 4:

                break;
              case 5:
                keluar();
                break;
              default:
            }

        }
     
    }
}