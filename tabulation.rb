class Tabulation
  def nthSuperUglyNumber(n, primes)
    # Init variables
    size = primes.size
    ugly, $dpt, index, ugly_nums = 1, [1], [0] * size, [1] * size
    for i in 1..n # All prime elements
      for j in 0..size
        if ugly_nums[j] == ugly # Operation of primes
          ugly_nums[j] = $dpt[index[j]] * primes[j].to_i
          index[j] += 1
        end
      end
      ugly = ugly_nums.min # Get min value
      $dpt.push(ugly)
    end
    $t1t = Time.now # Finish procedure
  end

  def time_diff_milli(finish, start) # Elapsed time
    puts "Elapsed time tabulation: #{(finish - start) * 1000.0} ms"
  end
end
