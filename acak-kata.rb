fruits = Array["AIR","PISANG","JERUK", "MANGGA", "APEL"]

def generate_random(value)
  arr = Array[]
  chars = value.split('')
  chars.each { |c|
      arr.push(c)
  }

  arrRes = Array[]

  value.length.times do |xx|
    charset = Array(arr)
    res = charset.sample
    for index in 0..(arr.length()-1)
      if arr[index] == res
        arrRes.push(res)
        arr.delete_at(index)
        break
      end
    end
  end

  arrRes.join("-")

end

def random_if_not_same(value)
  first_random = generate_random(value)
  while first_random.split("-") == value
    first_random = generate_random(value)
  end
  return first_random
end

index_soal = 0
sisa_soal = fruits.length
isCorrect = false
puts
while sisa_soal > 0

  isCorrect = false
  random_result = random_if_not_same(fruits[index_soal])
  soal = "Tebak kata acak berikut: " + random_result
  puts soal
  while !isCorrect
    puts "Jawaban: "
    answer = gets.chomp().upcase
    if answer == fruits[index_soal]
      sisa_soal -= 1
      index_soal += 1
      poin = fruits.length - sisa_soal
      puts
      puts "BENAR, Poin anda adalah #{poin.to_s} "
      puts
      isCorrect = true
    else
      puts
      puts "SALAH"
      puts soal
      isCorrect = false
    end
  end

end
