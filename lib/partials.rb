def raw_partial(path)
  path = "source/#{path}"
  result = File.read(File.expand_path(path, root))
  result.strip
end
