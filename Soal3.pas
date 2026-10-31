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
  
  { 3. METODE PENGERJAAN: Bubble Sort Teroptimasi (Early Exit) }
  for i := 1 to n - 1 do
  begin
    tertukar := false;
    
    for j := 1 to n - i do
    begin
      if nilai[j] > nilai[j + 1] then
      begin
        { Penukaran aritmatika tanpa variabel temp }
        nilai[j]     := nilai[j] + nilai[j + 1];
        nilai[j + 1] := nilai[j] - nilai[j + 1];
        nilai[j]     := nilai[j] - nilai[j + 1];
        
        tertukar := true; { Tandai bahwa terjadi penukaran }
      end;
    end;
    
    { Jika tidak ada posisi yang ditukar, hentikan perulangan lebih awal }
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
