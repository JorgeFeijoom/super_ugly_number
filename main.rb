class Main
  require_relative 'Memoization'
  require_relative 'Tabulation'

  $t2 = Time.now
  $n = ARGV[0].to_i # First command argument
  $time = false

  ARGV.each do|a| # -t argument for elapsed time
	if a == "-t"
	  $time = true
	end
  end

  line = File.open('data.txt') {|f| f.readline}
  $primes = Array.new(line.split(","))  # Saving data split
  $size = $primes.size

  m = Memoization.new #Run Memoization process
  m.nth_super_ugly_number($n, $primes,0)

  t = Tabulation.new #Run Tabulation process
  t.nthSuperUglyNumber($n, $primes)

  puts "\n--- Super Ugly Number ----\n\n"
  if $n > 0
	puts "# Memoization "
	puts "\nUgly number: #{$dpm[-2]}"

	if $time == true
	  m.time_diff_milli $t1m, $t2
	end

	puts "\n# Tabulation "
	puts "\nUgly number: #{$dpt[-2]}"

	if $time == true
	  t.time_diff_milli $t1t, $t2
	end
  else
	puts "Enter a correct position - command line"
  end
end