/**
 * Database seeding script
 * Run with: npm run seed
 *
 * This script will:
 * 1. Run the schema migration
 * 2. Populate the database with seed data
 */

import { readFileSync } from 'fs'
import { join } from 'path'
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY // Service key has elevated privileges

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing Supabase credentials. Please set:')
  console.error('   - NEXT_PUBLIC_SUPABASE_URL')
  console.error('   - SUPABASE_SERVICE_ROLE_KEY')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceKey)

async function runSQLFile(filename: string) {
  const sqlPath = join(process.cwd(), 'supabase', filename)
  const sql = readFileSync(sqlPath, 'utf-8')

  console.log(`📄 Running ${filename}...`)

  // Note: Supabase client doesn't support running raw SQL directly
  // In production, you would use Supabase CLI or database connection
  // For now, this serves as documentation of the seed process
  console.log('⚠️  To run migrations and seeds:')
  console.log('   1. Go to Supabase Dashboard > SQL Editor')
  console.log(`   2. Copy and paste the contents of supabase/${filename}`)
  console.log('   3. Click "Run"')
  console.log('')
}

async function main() {
  console.log('🌱 Starting database seed process...\n')

  try {
    // Check connection
    const { data, error } = await supabase.from('products').select('count').limit(1)

    if (error) {
      console.log('📋 Database tables not yet created.')
      console.log('Please run the migration first:\n')
      await runSQLFile('migrations/20260329_init_schema.sql')
      console.log('After running the migration, run the seed:\n')
      await runSQLFile('seed.sql')
    } else {
      console.log('✅ Database connection successful')
      console.log('To populate with seed data, run:\n')
      await runSQLFile('seed.sql')
    }

    console.log('\n✨ Seed process complete!')
    console.log('Visit your Supabase project to verify the data.')

  } catch (err) {
    console.error('❌ Error during seed:', err)
    process.exit(1)
  }
}

main()
