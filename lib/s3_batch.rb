#!/Users/username/.rbenv/shims/ruby

SAVE_DIR = "/Users/username/s3_download"

File.foreach("/Users/username/content_id.txt") do |line|
  line = line.chomp
  cmd = "aws s3 cp s3://bucket_name/uploads/content/source/#{line} #{SAVE_DIR} --recursive" 
  system(cmd)
  sleep 1   
end
