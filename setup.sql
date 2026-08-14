-- =========================================================
-- SETUP DATABASE UNTUK BLOG AMGPM RANTING BETHEL
-- =========================================================
-- Cara pakai:
-- 1. Buka project Supabase kamu → menu "SQL Editor"
-- 2. Klik "New query"
-- 3. Copy-paste SEMUA isi file ini
-- 4. Klik "Run"
-- =========================================================

-- 1. Buat tabel artikel
create table if not exists articles (
  slug text primary key,
  title text not null,
  excerpt text,
  content text not null,
  image text,
  published_at date not null default current_date,
  created_at timestamp with time zone default now()
);

-- 2. Aktifkan Row Level Security (keamanan tingkat baris)
alter table articles enable row level security;

-- 3. Semua orang (pengunjung blog) boleh MEMBACA artikel
create policy "Publik boleh membaca artikel"
on articles for select
using (true);

-- 4. Hanya admin yang sudah login yang boleh menambah artikel
create policy "Admin boleh menambah artikel"
on articles for insert
to authenticated
with check (true);

-- 5. Hanya admin yang sudah login yang boleh mengubah artikel
create policy "Admin boleh mengubah artikel"
on articles for update
to authenticated
using (true);

-- 6. Hanya admin yang sudah login yang boleh menghapus artikel
create policy "Admin boleh menghapus artikel"
on articles for delete
to authenticated
using (true);
