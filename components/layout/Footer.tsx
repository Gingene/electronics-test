import Link from 'next/link'

export function Footer() {
  const currentYear = new Date().getFullYear()

  return (
    <footer className="w-full border-t border-border/40 bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* About */}
          <div className="space-y-3">
            <h3 className="text-lg font-semibold">Nexus Vault</h3>
            <p className="text-sm text-muted-foreground">
              The ultimate marketplace for game virtual goods. Trade rare and legendary items from your favorite games.
            </p>
          </div>

          {/* Shop */}
          <div className="space-y-3">
            <h3 className="text-sm font-semibold">Shop</h3>
            <ul className="space-y-2 text-sm text-muted-foreground">
              <li>
                <Link href="/products?category=weapons" className="hover:text-primary transition-colors">
                  Weapons
                </Link>
              </li>
              <li>
                <Link href="/products?category=armor" className="hover:text-primary transition-colors">
                  Armor
                </Link>
              </li>
              <li>
                <Link href="/products?category=skins" className="hover:text-primary transition-colors">
                  Skins
                </Link>
              </li>
              <li>
                <Link href="/products?category=gems" className="hover:text-primary transition-colors">
                  Gems
                </Link>
              </li>
            </ul>
          </div>

          {/* Support */}
          <div className="space-y-3">
            <h3 className="text-sm font-semibold">Support</h3>
            <ul className="space-y-2 text-sm text-muted-foreground">
              <li>
                <Link href="/help" className="hover:text-primary transition-colors">
                  Help Center
                </Link>
              </li>
              <li>
                <Link href="/terms" className="hover:text-primary transition-colors">
                  Terms of Service
                </Link>
              </li>
              <li>
                <Link href="/privacy" className="hover:text-primary transition-colors">
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link href="/contact" className="hover:text-primary transition-colors">
                  Contact Us
                </Link>
              </li>
            </ul>
          </div>

          {/* Connect */}
          <div className="space-y-3">
            <h3 className="text-sm font-semibold">Connect</h3>
            <ul className="space-y-2 text-sm text-muted-foreground">
              <li>
                <a href="#" className="hover:text-primary transition-colors">
                  Discord
                </a>
              </li>
              <li>
                <a href="#" className="hover:text-primary transition-colors">
                  Twitter
                </a>
              </li>
              <li>
                <a href="#" className="hover:text-primary transition-colors">
                  GitHub
                </a>
              </li>
            </ul>
          </div>
        </div>

        {/* Bottom bar */}
        <div className="mt-8 pt-8 border-t border-border/40 flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-sm text-muted-foreground">
            © {currentYear} Nexus Vault. All rights reserved.
          </p>
          <p className="text-xs text-muted-foreground">
            Built with Next.js, Supabase, and Tailwind CSS
          </p>
        </div>
      </div>
    </footer>
  )
}
