ALTER TABLE login_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

-- Admin uniquement
CREATE POLICY login_attempts_only_admin
ON login_attempts
FOR ALL
USING (auth.role() = 'admin');

CREATE POLICY audit_logs_only_admin
ON audit_logs
FOR ALL
USING (auth.role() = 'admin');
