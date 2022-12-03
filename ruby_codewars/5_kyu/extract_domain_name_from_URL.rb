# https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby

# Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. 

# For example:

# * url = "http://github.com/carbonfive/raygun" -> domain name = "github"
# * url = "http://www.zombie-bites.com"         -> domain name = "zombie-bites"
# * url = "https://www.cnet.com"                -> domain name = cnet"

# D/A
# irb(main):007:0> "http://www.zombie-bites.com".split(/\.|\//)
# => ["http:", "", "www", "zombie-bites", "com"]
# irb(main):008:0> "http://github.com/carbonfive/raygun".split(/\.|\//)
# => ["http:", "", "github", "com", "carbonfive", "raygun"]

# irb(main):011:1* arr.delete_if do |el|
#   irb(main):012:1*   el == "http:" ||
#   irb(main):013:1*   el == "https:" ||
#   irb(main):014:1*   el.empty? ||
#   irb(main):015:1*   el == "www"
#   irb(main):016:0> end
  
#   => ["github", "com", "carbonfive", "raygun"]
#   irb(main):018:0> arr[0]
#   => "github"

def domain_name(url)
  arr = url.split(/\.|\//)
  arr.delete_if do |el|
    el == "http:" ||
    el == "https:" ||
    el.empty? ||
    el == "www"
  end
  arr[0]
end

p domain_name("http://github.com/carbonfive/raygun")
p domain_name("http://www.zombie-bites.com")
p domain_name("https://www.cnet.com")

# codewars best practices pasted below for reference

# def domain_name(url)
#   URI.parse(url).host.split('.').last(2)[0]
# end

# def domain_name(url)
#   regex = /(http|https):\/\/(?:www\.)?(?<domain_name>.*?)\./
#   url.match(regex)[:domain_name]
# end
