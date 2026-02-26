-- Enable RLS
alter table public.items enable row level security;

-- Owner-only read
create policy "items_select_own"
on public.items for select
using (user_id = auth.uid());

-- Owner-only insert
create policy "items_insert_own"
on public.items for insert
with check (user_id = auth.uid());

-- Owner-only update
create policy "items_update_own"
on public.items for update
using (user_id = auth.uid())
with check (user_id = auth.uid());

-- Owner-only delete
create policy "items_delete_own"
on public.items for delete
using (user_id = auth.uid());
