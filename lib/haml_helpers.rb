require 'haml'

def hamlInclude(filename, locals)
  contents = File.read(filename)
  Haml::Engine.new(contents).render(self, locals)
end
