ALTER TABLE accounts ENABLE ROW LEVEL SECURITY;

-- Admin : accès complet
CREATE POLICY accounts_admin_full
ON accounts
FOR ALL
USING (auth.role() = 'admin');

-- Customer : ses propres comptes
CREATE POLICY accounts_customer_owner
ON accounts
FOR SELECT
USING (
    customer_id IN (
        SELECT customer_id FROM customers WHERE supabase_id = auth.uid()
    )
);

-- Customer service : lecture + modification limitée
CREATE POLICY accounts_support_read
ON accounts
FOR SELECT
USING (auth.role() = 'customer_service');

CREATE POLICY accounts_support_updt
ON accounts
FOR UPDATE
USING (auth.role() = 'customer_service');
