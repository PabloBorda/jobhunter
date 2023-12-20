require 'rubygems'
require 'mechanize'








class LevenshteinHash < Hash




  def levenshtein(first, second)
    matrix = [(0..first.length).to_a]
    (1..second.length).each do |j|
      matrix << [j] + [0] * (first.length)
    end
 
    (1..second.length).each do |i|
      (1..first.length).each do |j|
        if first[j-1] == second[i-1]
          matrix[i][j] = matrix[i-1][j-1]
        else
          matrix[i][j] = [
            matrix[i-1][j],
            matrix[i][j-1],
            matrix[i-1][j-1],
          ].min + 1
        end
      end
    end
    return matrix.last.last
  end





  def [](key)
    if self.keys.include?(key)
      super(key)
    else
      self.keys.each do |k|

      end
    end    
  end

  def []=(key, value)
    key.respond_to?(:upcase) ? super(key.upcase, value) : super(key, value)
  end
end


