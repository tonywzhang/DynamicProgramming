class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2}
    @frog_cache = {1=>[[1]], 2=>[[1,1],[2]], 3=>[[1, 1, 1], [1, 2], [2, 1],[3]]}
  end

  def blair_nums(n)
    cache = blair_cache_builder(n)
    cache[n]
  end

  def blair_cache_builder(n)
   cache = {1 => 1, 2 => 2}
   return cache if n <= 2
   i=3
   while i <= n
     next_blair = cache[i-1] + cache[i-2] + 2*i - 3
     cache[i] = next_blair
     i+=1
   end
   cache
  end

  def frog_hops_bottom_up(n)
    frog_hops_top_down(n)
  end

  def frog_cache_builder(n)
    cache = {
        1=>[[1]],
        2=>[[1,1],[2]],
        3=>[[1, 1, 1], [1, 2], [2, 1],[3]]
      }
    return cache if n <= 3
    (4..n).step do |idx|
      cache1 = cache[idx-1].map {|arr| arr + [1] }
      cache2 = cache[idx-2].map {|arr| arr + [2] }
      cache3 = cache[idx-3].map {|arr| arr + [3] }
      cache[idx] = cache1 + cache2 + cache3
    end
    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    cache1 = frog_hops_top_down(n-1).map {|arr| arr + [1] }
    cache2 = frog_hops_top_down(n-2).map {|arr| arr + [2] }
    cache3 = frog_hops_top_down(n-3).map {|arr| arr + [3] }
    @frog_cache[n] = cache1 + cache2 + cache3
    @frog_cache[n]
  end

  def super_frog_hops(n, k)
    return [[]] if n == 0
    return [[1]] if n == 1

    result = []

    (1..k).each do |i|
      break if i > n

      last = i == n ? [n] : super_frog_hops(i, k)[-1]
      next_jump = super_frog_hops(n-i, k)

      last.each do |el1|
        next_jump.each do |el2|
          result.push([el1] + el2)
        end
      end
    end

  	result
  end

  def knapsack(weights, values, capacity)
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
