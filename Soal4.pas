uses crt;

var 
  { 1. STRUKTUR DATA: Array 1D Paralel }
  { Mengalokasikan memori terpisah untuk tiap komponen nilai dan rata-rata hingga 5 mahasiswa }
  tugas, kuis, UTS, UAS, rata : array[1..5] of real;
  n, i, k : integer;

begin
  clrscr; 
  
  { 2. VALIDASI INPUT JUMLAH DATA }
  { Menerapkan perulangan repeat-until untuk membatasi input n hanya pada rentang 1-5 }
  repeat 
    write('Masukkan jumlah mahasiswa (1-5): '); readln(n);
    if (n < 1) or (n > 5) then writeln('Jumlah mahasiswa harus 1-5!');
  until (n >= 1) and (n <= 5);

  { 3. INPUT DATA MAHASISWA KE-i}
  { Memproses penginputan dan perhitungan nilai secara berurutan untuk n mahasiswa }
  for i := 1 to n do
  begin
    writeln;
    writeln('--- Data Mahasiswa ke-', i, ' ---');

    { 4. KONTROL SEKUENSIAL DENGAN CASE & VALIDASI NILAI }
    { Menggunakan loop k (1-4) dan struktur CASE untuk memvalidasi rentang nilai (0-100) per komponen }
    for k := 1 to 4 do
    begin
      case k of
        1: repeat
             write('Masukkan Nilai Tugas (0-100) : '); readln(tugas[i]);
             if (tugas[i] < 0) or (tugas[i] > 100) then writeln('Error: Nilai harus 0-100!');
           until (tugas[i] >= 0) and (tugas[i] <= 100);

        2: repeat
             write('Masukkan Nilai Kuis  (0-100) : '); readln(kuis[i]);
             if (kuis[i] < 0) or (kuis[i] > 100) then writeln('Error: Nilai harus 0-100!');
           until (kuis[i] >= 0) and (kuis[i] <= 100);

        3: repeat
             write('Masukkan Nilai UTS   (0-100) : '); readln(UTS[i]);
             if (UTS[i] < 0) or (UTS[i] > 100) then writeln('Error: Nilai harus 0-100!');
           until (UTS[i] >= 0) and (UTS[i] <= 100);

        4: repeat
             write('Masukkan Nilai UAS   (0-100) : '); readln(UAS[i]);
             if (UAS[i] < 0) or (UAS[i] > 100) then writeln('Error: Nilai harus 0-100!');
           until (UAS[i] >= 0) and (UAS[i] <= 100);
      end;
    end;

    { 5. KALKULASI ARITMATIKA }
    { Menghitung rerata dari 4 komponen nilai yang sudah tervalidasi }
    rata[i] := (tugas[i] + kuis[i] + UTS[i] + UAS[i]) / 4;
  end;

  { 6. TAMPILAN REKAPITULASI DAN SELEKSI KONDISI KELULUSAN }
  { Mencetak data tercatat dengan format 2 desimal (:0:2) serta menentukan status berdasarkan batas 70 }
  writeln;
  writeln('=============================================');
  writeln('          HASIL EVALUASI MAHASISWA           ');
  writeln('=============================================');

  for i := 1 to n do
  begin
    writeln('Mahasiswa ke-', i, ':');
    writeln('  Nilai Tugas : ', tugas[i]:0:2);
    writeln('  Nilai Kuis  : ', kuis[i]:0:2);
    writeln('  Nilai UTS   : ', UTS[i]:0:2);
    writeln('  Nilai UAS   : ', UAS[i]:0:2);
    writeln('  Rata-rata   : ', rata[i]:0:2);
    
    { Evaluasi batas kelulusan }
    if rata[i] >= 70 then
      writeln('  Keterangan  : LULUS')
    else
      writeln('  Keterangan  : TIDAK LULUS');
    writeln('---------------------------------------------');
  end;

end.
