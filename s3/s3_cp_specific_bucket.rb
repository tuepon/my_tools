require 'fileutils'

DIR_LIST = './dir_list.txt'
BUCKET_NAME = "your-bucket-name/uploads/content/source"
arr = []

File.foreach(DIR_LIST) do |f|
  f = f.chomp
  arr.push(f)
end


def s3_download(arg)
  cmd = "aws s3 cp s3://#{BUCKET_NAME}/#{arg} #{arg} --recursive"
  system(cmd)
end

arr.each do |arg|
  s3_download(arg)
end
