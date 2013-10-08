#for number extraction an override of the string class
class Parser
  def self.to_number(str)
  	if str == "0"
  	  return 0
  	end
  	dec = str.to_d
  	if dec == 0
	    number_words = {
	      "zero" => 0.0 ,
	      "one" => 1.0 ,
	      "two" => 2.0,
	      "three" => 3.0,
	      "four" => 4.0,
	      "five" => 5.0,
	      "six" => 6.0,
	      "seven" => 7.0,
	      "eight" => 8.0,
	      "nine" => 9.0,
	      "ten" => 10.0,
	      "eleven" => 11.0,
	      "twelve" => 12.0,
	      "thirteen" => 13.0,
	      "fourteen" => 14.0,
	      "fifteen" => 15.0,
	      "sixteen" => 16.0,
	      "seventeen" => 17.0,
	      "eighteen" => 18.0,
	      "nineteen" => 19.0,
	      "twenty" => 20.0,
	      "thirty" => 30.0,
	      "forty" => 40.0,
	      "fifty" => 50.0,
	      "sixty" => 60.0,
	      "seventy" => 70.0,
	      "eighty" => 80.0,
	      "ninety" => 90.0,
	      "hundred" => 100.0,
	      "thousand" => 1000.0,
	      "million" => 1000000.0,
	      "billion" => 1000000000.0,
	      "trillion" => 1000000000000.0,
	      "quadrillion" => 1000000000000000.0
	   }
       dec = number_words[str.downcase] || nil
    end
    dec
  end
end