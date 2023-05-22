require 'haml'

def hamlInclude(filename, locals)
  contents = File.read(filename)
  Haml::Template.new { contents }.render(self, locals)
end
