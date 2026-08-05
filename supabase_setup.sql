-- Ejecuta este script completo en Supabase: SQL Editor -> New query -> pega esto -> Run

create table if not exists rental_app_state (
  id text primary key,
  tenants jsonb not null default '[]',
  expenses jsonb not null default '{}',
  irpf_reduccion numeric not null default 0.5,
  updated_at timestamptz not null default now()
);

-- Activa la seguridad a nivel de fila (obligatorio en Supabase)
alter table rental_app_state enable row level security;

-- Como elegiste "sin contraseña", estas políticas permiten leer y escribir
-- a cualquiera que tenga la URL de tu app. Si más adelante quieres añadir
-- una contraseña, dímelo y cambiamos estas políticas.
create policy "Permitir lectura pública" on rental_app_state
  for select using (true);

create policy "Permitir inserción pública" on rental_app_state
  for insert with check (true);

create policy "Permitir actualización pública" on rental_app_state
  for update using (true);

-- Fila inicial (la app también la crea sola la primera vez si no existe)
insert into rental_app_state (id, tenants, expenses, irpf_reduccion)
values ('main', '[]', '{}', 0.5)
on conflict (id) do nothing;
