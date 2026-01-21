ALTER TABLE cards ENABLE ROW LEVEL SECURITY;

-- Admin : accès complet
CREATE POLICY cards_admin_all
ON cards
FOR ALL
USING (auth.role() = 'admin');

-- Customer : ses cartes
CREATE POLICY cards_customer_owner
ON cards
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

-- Customer service : blocage carte
CREATE POLICY cards_support_updt
ON cards
FOR UPDATE
USING (auth.role() = 'customer_service');
