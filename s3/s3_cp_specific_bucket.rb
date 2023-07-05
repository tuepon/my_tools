require 'fileutils'

BUCKET_LIST = './bucket_list.txt'
S3_BUCKET = "your-bucket-name/uploads/content/source"
arr = []

File.foreach(BUCKET_LIST) do |f|
  f = f.chomp
  arr.push(f)
end


def s3_download(arg)
  cmd = "aws s3 cp s3://#{S3_BUCKET}/#{arg} #{arg} --recursive"
  system(cmd)
end

arr.each do |arg|
  s3_download(arg)
end
