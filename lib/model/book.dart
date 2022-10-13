// import 'dart:ui';
// import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';

// @HiveType(typeId: 0)
// class Book extends HiveObject {
//   @HiveField(0)
//   String judul;
//   @HiveField(1)
//   String gambar;
//   @HiveField(2)
//   String penulis;
//   @HiveField(3)
//   String genre;
//   @HiveField(4)
//   String tahunTerbit;
//   @HiveField(5)
//   String penerbit;
//   @HiveField(6)
//   Color warna;
//   @HiveField(7)
//   List<String> notes;

//   Book({
//     required this.judul,
//     required this.gambar,
//     required this.penulis,
//     required this.genre,
//     required this.penerbit,
//     required this.tahunTerbit,
//     required this.warna,
//     required this.notes,
//   });
// }

// List<Book> bookList = [
//   Book(
//       judul: "Goodbye, Things : Seni Hidup Minimalis",
//       gambar: "assets/images/seni hidup minimalis.png",
//       penulis: "Fumio Sasaki",
//       genre: "Self Improvement",
//       penerbit: "Gramedia Pustaka Utama",
//       tahunTerbit: "2018",
//       warna: Color(0xFFFCBD00),
//       notes: [
//         "Buang jauh-jauh pikiran bahwa kita tidak mampu membuang",
//         "Membuang barang membutuhkan keterampilan",
//         "Memiliki lebih sedikit barang tidak akan mengurangi rasa puas",
//         "Temukan tampilan khas kita sendiri",
//         "Tanpa banyak barang, kita menjadi lebih orisinal",
//         "Buang barang yang sudah lima kali dipertimbangkan",
//         "Jika keterampilan minimalisme sudah terbentuk, tahap 'samapi ketemu' bisa dilewatkan",
//         "Sedikit ketidaknyamanan membuat kita lebih bahagia",
//         "Buanglah, meskipun barang itu menimbulkan rasa senang",
//         "Minimalisme membawa kemerdekaan, semakin cepat dilakukan, semakin baik",
//         "Membuang barang mengurangi apa yang kita miliki, tapi bukan siapa diri kita",
//         "Pertanyaan cara-cara yang biasa digunakan untuk memanfaatkan barang",
//         "Jangan pikirkan. Buang!",
//         "Minimalisme bukan kompetisi. Tidak perlu sesumbar tentang betapa sedikit yang kita miliki. Tidak usah menghakimi orang lain yang memiliki lebih banyak barang.",
//         "Keinginan membuang dan memiliki adalah dua sisi mata uang yang sama",
//         "Temukan menimalisme sendiri",
//         "Minimalisme adalah metode dan awal mula",
//       ]),
//   Book(
//       judul: "Atomic Habits",
//       gambar: "assets/images/atomic habits.png",
//       penulis: "James Clear",
//       genre: "Self Improvement",
//       penerbit: "Gramedia Pustaka Utama",
//       tahunTerbit: "2019",
//       warna: Color(0xFFEDCC99),
//       notes: [
//         "Menjadi 1% lebih baik setiap ikut berperan dalam kemajuan besar jangka panjang",
//         "Kebiasaan bisa menguntungkan, dapat menjadi teman atau lawan",
//         "Jika menginginkan hasil yang lebih baik, jangan memungkinkan sasaran dahulu. Sebagai gantinya, berfokuslah pada sistem anda",
//         "Anda tidak mencapai level sasaran. Anda jatuh di level sistem",
//         "Cara paling efektif untuk mengubah kebiasaan Anda adalah berfokus bukan pada yang ingin anda capai, melainkan tipe orang yang anda inginkan",
//         "Identitas anda muncul anda kebiasaan-kebiasaan anda. setiap aksi sama seperti suara dukugan untuk tipe orang yang anda inginkan",
//         "Alasan utama kebiasaan itu penting bukan karena memberi anda hasil-hasil yang lebih baik (meskipun bisa), tetapi karena kebiasan dapat mengubah keyakinian tentang diri sendiri",
//         "Menjadi versi terbaik anda menuntut anda terus menerus mengedit keyakinan keyakinan anda, dan meningkatkan serta memperluas identitas anda",
//         "Proses pengubahan perilaku selalu dimulai dengan kesadaran. Anda perlu menyadari kebiasaan kebiasaan anda sebelum dapat mengubahnya",
//         "Kartu Nilai untuk kebiasaan adalah latihan sederhana untuk menjadi lebih sadar tentang perilaku anda"
//       ]),
//   Book(
//       judul: "Remember Me, I Will Remember You",
//       gambar: "assets/images/remember me, i will remember you.png",
//       penulis: "Wirda Mansur",
//       genre: "Self Improvement",
//       penerbit: "Kata Depan",
//       tahunTerbit: "April, 2019",
//       warna: Color(0xFFE0B9B4),
//       notes: [
//         "Allah SWT mengajarkan kita untuk tidak pernah hopeless, tidak pernah merasa tak ada harapan",
//         "Jika kita selalu dan melulu mengingat Allah, pastilah Allah akan hadir di setiap momen dalam hidup kita",
//         "Berdoa, mendoakan, dan minta didoakan itu pekerjaan mulia",
//         "Akhlak yang mulia. ketika dijatuhkan. kita malah meninggikan orang yang menjatuhkan :)",
//         "Ketika kata-kata tak lagi berarti, berdoalah. Biar Allah langsung yang negor",
//         "Sampai kapan pun nggak ada yang bisa menanding ilmu Allah",
//         "Sebaik-baiknya jiwa adalah hati yang bersih karena memancarkan semua hal dari diri kita",
//         "Dimana ada niat, disitu ada jalan. Dimana ada ikhtiar, disitu ada jalan keluar",
//         "Jangan putus asa. If you believe, you make it.",
//         "Kalau mau mencapai apa yang kamu inginkan, kamu harus berjuang untuk itu :)",
//         "Dzikir itu penting, buat perlindungan kita",
//         "Baca quran pagi sore siang malam, rezeki auto lancar",
//         "Coba lagi, prinsip the winner"
//       ]),
//   Book(
//       judul: "Unlimited You",
//       gambar: "assets/images/unlimited you.png",
//       penulis: "Wirda Mansur",
//       genre: "Self Improvement",
//       penerbit: "Kata Depan",
//       tahunTerbit: "Februari, 2020",
//       warna: Color(0xFFDE93A0),
//       notes: [
//         "Kalau kamu sakit, obatnya ya kamu",
//         "Dream big, prayer bigger",
//         "Bersyukur saat punya, biasa. Bersyukur saat tidak punya, luar biasa.",
//         "Mau banyak? Ya banyak dzikir",
//         "Semua akan indah bila dijalani bersama Allah",
//       ]),
//   Book(
//     judul: "Jika Kita Tak Pernah Jadi Apa Apa",
//     gambar: "assets/images/jika kita tak pernah jadi apa-apa.png",
//     penulis: "Alvi Syahrin",
//     genre: "Fiksi, Roman",
//     penerbit: "Gagas Media",
//     tahunTerbit: "2019",
//     warna: Color(0xFFFAD168),
//     notes: [
//       "Bergantung hanya ke Allah, jangan diam diam bergantung ke yg lain",
//       "Doa yg banyak, jika tak dikabulkan, itu bagian untuk di akhirat",
//       "Sedekah, investasi akhirat",
//     ],
//   ),
//   Book(
//     judul: "Sabar Paling Dalam",
//     gambar: "assets/images/sabar paling dalam.png",
//     penulis: "Fajar Sulaiman",
//     genre: "Fiksi, Roman",
//     penerbit: "Media Kita",
//     tahunTerbit: "2021",
//     warna: Color(0xFFFAD168),
//     notes: [
//       "Ada yang dekat, tapi bukan untuk dimiliki",
//       "Bahagia adalah ketika kita berpikir untuk bahagia tanpa membutuhkan alasan",
//       "Bukan ujiannya yang berat, tapi kita yang memandang itu berat dan tidak ingin memanjangkan kesabaran",
//       "Seseorang yang bisa merasakan senyum bebas, mungkin karena dia telah melewati tangisan yang paling deras",
//       "bahagia sesungguhnya adalah ketika kau tidak akan takut sesuatu pun akan direnggut, sebab kau yakin tidak ada yang benar benar bisa kau genggam kecuali dirimu sendiri",
//     ],
//   ),
//   Book(
//       judul: "What Happend With Your Life",
//       gambar: "assets/images/what happen with your life.png",
//       penulis: "Desy Rachmawati",
//       genre: "Self Improvement",
//       penerbit: "Penerbit Brilliant",
//       tahunTerbit: "2020",
//       warna: Color(0xFFF29D1C),
//       notes: [
//         "Jangan bergantung pada ekspektasi, karena ekspektasi tidak selalu menjadi realitas",
//         "Manusia harus menipu diri sendiri agar dianggap benar sesuai norma sosial",
//         "Jika ingin membantu, bantu saja. tapi jangan membantu hanya karena merasa tertekan atau berkewajiban membantu",
//         "Jangan lupa mencintai diri sendiri",
//         "Tujuan hidup bukanlah untuk bahagia, tapi bermanfaat, terhormat dan memiliki kasih sayang untuk orang lain",
//         "Dream big dreams",
//       ]),
//   Book(
//       judul: "Jangan Dulu Patah",
//       gambar: "assets/images/jangan-dulu-patah.png",
//       penulis: "Nurun Ala",
//       genre: "Puisi",
//       penerbit: "Azharologia Books",
//       tahunTerbit: "2019",
//       warna: Color(0xFF67D2DB),
//       notes: [
//         "Jangan berlebihan ketika menghadapi sesuatu. Apapun itu. Dunia ini seperti anak tangga, ada untuk dipijaki bukan dihuni terlalu lama.",
//         "Selagi ada kesempatan, ambil. Kalau tidak ada, ya dicari. Diciptakan.",
//         "Pemahaman butuh jeda.",
//         "Tuhan pasti akan memberi jawaban yang tepat di waktu yang tepat.",
//         "Tuhan menganugerahi manusia potensi yang berbeda-beda. Jangan berubah menjadi sesuatu agar terlihat keren. Tapi gunakan potensimu untuk merubah sesuatu agar terlihat keren. ",
//         "Berhenti membandingkan diri dengan orang lain, tidak akan ada habisnya. Karena garis waktu dan garis takdir yang kalian lalui berbeda",
//         "Trend itu tidak harus diikuti. Karens suatu hal yang baru belum tentu relevan.",
//         "Suatu hal yang baikpun bisa jadi menjerumuskan kita jika kita tidak memanfaatkannya dengan benar.",
//         "Teruslah berproses untuk melampaui dirimu yang kemarin, bukan untuk melampaui orang lain.",
//         "Gunakan uangmu untuk hal yang dibutuhkan bukan untuk hal yang diinginkan. Apa-apa yang tidak dibutuhkan hanya akan menjadi beban. ",
//         "Jangan terlalu percaya dengan ucapan orang lain. Jika memang perlu melakukan sesuatu, maka lakukan. Persetan omongan orang-orang. "
//       ]),
// ];
