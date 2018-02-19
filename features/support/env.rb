def browser_name
  (ENV['BROWSER'] ||= firefox).downcase.to_sym
  (ENV['BROWSER'] ||= chrome).downcase.to_sym
  (ENV['BROWSER'] ||= ie).downcase.to_sym
end

def environment
  (ENV['ENVI'] ||= 'dev').downcase.to_sym
  (ENV['ENVI'] ||= 'stg').downcase.to_sym
  (ENV['ENVI'] ||= 'prod').downcase.to_sym
end