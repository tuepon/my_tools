#!/Users/username/.rbenv/shims/ruby

require 'yaml'

file_path = 'servers.yml'
key_path = '~/.ssh/'

input = ARGV[0]&.downcase

servers = YAML.load_file(file_path)

servers.each do | sv |
  if sv.has_value?(input)
    command = "ssh -i #{key_path}#{sv['key']}.pem #{sv['user']}@#{sv['host']}"
    exec(command)
  end
end

