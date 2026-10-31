uses crt;

var
  nilai: array[1..10] of real;
  n, i, j: integer;
  tertukar: boolean;

begin
  clrscr;
  
  { 1. Input dan validasi jumlah mahasiswa (1 <= n <= 10) }
  repeat
    write('Masukkan jumlah mahasiswa (1-10): ');
    readln(n);
    if (n < 1) or (n > 10) then
      writeln('>> Jumlah mahasiswa harus antara 1 sampai 10!');
  until (n >= 1) and (n <= 10);
  
  { 2. Input nilai UAS dengan validasi repeat..until }
  writeln;
  writeln('=== Input Nilai UAS ===');
  for i := 1 to n do
  begin
    repeat
      write('Nilai UAS Mahasiswa ke-', i, ': ');
      readln(nilai[i]);
      
      if (nilai[i] <= 0) or (nilai[i] > 100) then
        writeln('>> Nilai tidak valid! Harus lebih besar dari 0 dan maksimal 100.');
    until (nilai[i] > 0) and (nilai[i] <= 100);
  end;
  
  { ========================================================================= }
  { 3. METODE PENGERJAAN: Bubble Sort Teroptimasi (Early Exit)                }
  { ========================================================================= }
  
  { Loop Luar (i): Mengontrol jumlah pass/putaran pengurutan (maksimal n - 1 kali) }
  for i := 1 to n - 1 do
  begin
    { Reset flag tertukar menjadi false setiap kali memasuki putaran baru }
    tertukar := false;
    
    { Loop Dalam (j): Membandingkan elemen berpasangan (j dan j+1) dari awal hingga (n - i) }
    { Batas (n - i) digunakan karena di tiap akhir putaran i, nilai terbesar sudah bergeser ke kanan }
    for j := 1 to n - i do
    begin
      { Kondisi: Jika nilai sebelah kiri lebih besar dari nilai sebelah kanan, lakukan penukaran }
      if nilai[j] > nilai[j + 1] then
      begin
        { --- Penukaran Aritmatika Tanpa Variabel Temp --- }
        { Step 1: Simpan jumlah total kedua nilai ke elemen kiri }
        nilai[j]     := nilai[j] + nilai[j + 1];
        
        { Step 2: Ambil nilai awal elemen kiri untuk dimasukkan ke elemen kanan }
        nilai[j + 1] := nilai[j] - nilai[j + 1];
        
        { Step 3: Ambil nilai awal elemen kanan untuk dimasukkan ke elemen kiri }
        nilai[j]     := nilai[j] - nilai[j + 1];
        
        { Tandai bahwa terjadi penukaran posisi pada putaran ini }
        tertukar := true; 
      end;
    end;
    
    { OPTIMASI EARLY EXIT: Jika selama perulangan dalam tidak ada penukaran posisi (tertukar = false), }
    { artinya seluruh data sudah terurut sempurna, sehingga perulangan dihentikan lebih awal. }
    if not tertukar then
      break;
  end;
  
  { 4. Output nilai yang telah diurutkan (terendah ke tertinggi) }
  writeln;
  writeln('=== Hasil Pengurutan (Terendah ke Tertinggi) ===');
  for i := 1 to n do
  begin
    writeln('Urutan ke-', i, ': ', nilai[i]:0:2);
  end;
  
  readln;
end.
