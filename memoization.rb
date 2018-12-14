class Memoization
  $size = 0

  line = File.open('data.txt') {|f| f.readline}
  $primes = Array.new(line.split(","))  # Saving data split
  $size = $primes.size

  $ugly, $dpm, $index, $ugly_nums, $elem = 1, [1], [0] * $size, [1] * $size, 0 #Creating structure

  def nth_super_ugly_number(n, primes, count)
    if count < n
      for j in 0..$size #All the prime factors
        if $ugly_nums[j] == $ugly
          $ugly_nums[j] = $dpm[$index[j]] * primes[j].to_i #
          $index[j] += 1
        end
      end
      $ugly = $ugly_nums.min # Get min value
      $dpm.push($ugly) # Update list
      nth_super_ugly_number(n, primes, count + 1) # Recursive ++
    end
    $t1m = Time.now
  end

  def time_diff_milli(finish, start) # Elapsed time
    puts "Elapsed time memoization: #{(finish - start) * 1000.0} ms"
  end
end

