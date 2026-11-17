-- Paste this into Supabase: SQL Editor > New query > Run
create table if not exists public.picks (
  cert text primary key,
  name text not null check (name in ('Garrett','Russel','Alex','Andrew','Austin','Bin','Bedoya')),
  updated_at timestamptz not null default now()
);

grant select, insert, update, delete on public.picks to anon;

alter table public.picks enable row level security;

create policy "anyone can read picks"   on public.picks for select using (true);
create policy "anyone can add picks"    on public.picks for insert with check (true);
create policy "anyone can change picks" on public.picks for update using (true) with check (true);
create policy "anyone can clear picks"  on public.picks for delete using (true);
