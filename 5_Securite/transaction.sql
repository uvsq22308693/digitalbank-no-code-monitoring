ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

-- Admin : accès complet
CREATE POLICY transactions_admin_full
ON transactions
FOR ALL
USING (auth.role() = 'admin');

-- Analyst : lecture seule + fraude
CREATE POLICY transactions_analyst_select
ON transactions
FOR SELECT
USING (auth.role() = 'analyst');

-- Customer : ses transactions uniquement
CREATE POLICY transactions_customer_owner
ON transactions
FOR SELECT
USING (
    account_id IN (
        SELECT account_id FROM accounts
        WHERE customer_id IN (
            SELECT customer_id FROM customers
            WHERE supabase_id = auth.uid()
        )
    )
);
