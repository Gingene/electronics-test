export default function HomePage() {
  return (
    <div className="flex min-h-[calc(100vh-8rem)] flex-col items-center justify-center p-8">
      <div className="z-10 max-w-5xl w-full items-center justify-center text-center space-y-6">
        <h1 className="text-6xl md:text-7xl font-bold mb-4 bg-gradient-to-r from-primary via-purple-400 to-pink-500 bg-clip-text text-transparent">
          Nexus Vault
        </h1>
        <p className="text-xl md:text-2xl text-muted-foreground max-w-2xl mx-auto">
          Discover and trade rare virtual goods from your favorite games
        </p>
        <div className="flex gap-4 justify-center mt-8">
          <a
            href="/products"
            className="px-8 py-3 bg-primary text-primary-foreground rounded-lg font-semibold hover:bg-primary/90 transition-colors"
          >
            Browse Products
          </a>
          <a
            href="/categories"
            className="px-8 py-3 border border-border rounded-lg font-semibold hover:bg-accent transition-colors"
          >
            View Categories
          </a>
        </div>
      </div>
    </div>
  )
}
