-- ===============================================
-- Table: customers - RLS policies
-- ===============================================

-- Activer RLS
ALTER TABLE customers ENABLE ROW LEVEL SECURITY;

-- ---------------------------
-- Admin : accès complet
-- ---------------------------
CREATE POLICY customers_admin_full
ON customers
FOR ALL
USING (auth.role() = 'admin');

-- ---------------------------
-- Customer : lecture de son propre profil
-- ---------------------------
CREATE POLICY customers_own_read
ON customers
FOR SELECT
USING (supabase_id = auth.uid());

-- Customer : modification de son propre profil
CREATE POLICY customers_own_update
ON customers
FOR UPDATE
USING (supabase_id = auth.uid());

-- ---------------------------
-- Customer service : lecture seule
-- ---------------------------
CREATE POLICY customers_support_select
ON customers
FOR SELECT
USING (auth.role() = 'customer_service');
