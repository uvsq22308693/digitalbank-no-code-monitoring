import { createClient } from '@supabase/supabase-js'

// URL et clé de ton projet Supabase
const supabaseUrl = 'https://ugyqyzerezxtnxutukcj.supabase.co'
const supabaseKey = 'psb_publishable_u1rm1pxjb4SqAkr2p2g-VA_4H_t4HtZ'
const supabase = createClient(supabaseUrl, supabaseKey)

async function testTransactions() {
  const { data, error } = await supabase
    .from('transactions')
    .select('*')
    .eq('account_id', 1) // Filtre pour un compte client
    .order('timestamp', { ascending: false })
    .limit(10)

  console.log('data:', data)
  console.log('error:', error)
}

testTransactions()
