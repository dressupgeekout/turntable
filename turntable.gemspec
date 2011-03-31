Gem::Specification.new do |s|
  s.name    = 'turntable'
  s.version = '0.0.1'
  s.license = "2-clause BSD"

  s.homepage = 'http://christiank.github.com/turntable/'
  s.summary  = "The hip-hop Ruby database."

  s.description = <<-EOF
Turntable is a pure Ruby implementation of a relational database, similar in
spirit to SQLite. Unlike Sequel or any other object-relational mapper, Turntable
is built with Ruby from the ground up, and implements Rubyisms whenever
possible.
  EOF

  s.author = "Christian Koch"
  s.email  = "cfkoch@sdf.lonestar.org"

  s.require_path = %w[lib]
  s.files = %w[README TODO]
  s.files += Dir['lib/*.rb']
  s.files += Dir['lib/turntable/*.rb']
end
