require "csv" 

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

puts "操作を選択してください："
puts "1. 新規ファイルを作成する"
puts "2. 既存のファイルを編集する"

memo_type = gets.chomp.strip.to_i

case memo_type
when 1
  puts "拡張子を除いたファイル名を入力してください："
  file_name = gets.chomp.strip
  puts "新規ファイルを作成します。完了したらCtrl + Dを押してください。"

  data = $stdin.read.split("\n").map { |line| line.split(',') }

  CSV.open("#{file_name}.csv", "w") do |csv|
    data.each do |row|
      csv << row
    end
  end

  puts "#{file_name}.csv を作成しました。"
when 2
  puts "編集したいファイル名を入力してください："
  file_name = gets.chomp.strip

  if File.exist?("#{file_name}.csv")
    puts "#{file_name}.csv を編集します。完了したらCtrl + Dを押してください。"

    data = $stdin.read.split("\n").map { |line| line.split(',') }

    CSV.open("#{file_name}.csv", "w") do |csv|
      data.each do |row|
        csv << row
      end
    end

    puts "#{file_name}.csv を編集しました。"
  else
    puts "#{file_name}.csv は存在しません。"
  end
else
  puts "1か2を入力してください。"
end