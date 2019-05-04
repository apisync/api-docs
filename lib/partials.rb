def raw_partial(path, variables = {})
  path = "source/#{path}"
  result = File.read(File.expand_path(path, root))
  variables.each do |variable, value|
    result = result.gsub("%{#{variable}}", value)
  end
  result = result.gsub(/%{.*}/, '')

  result.strip
end
