# pp = 2
# ps = [pp]
# lim = raw_input("\nGenerate prime numbers up to what number? : ")
# while pp < int(lim):
#    pp += 1
#    for a in ps:
#       if pp%a==0:
#          break
#    else:
#       if pp not in ps:
#          ps.append(pp)
# print ps

# class Prime
#   def self.nth(num)
#     pp = 2
#     ps = [pp]
#     while ps.length < num
#       pp += 1
#       ps.each { |x|
#         if pp % x == 0
#           break
#         else
#           if !ps.include?(pp)
#             ps.push(pp)
#           end
#         end
#       }
#     end
#     ps
#   end
# end

#####################

# pp=2
# ps=[pp]
# pp+=1
# ps.append(pp)
# lim=raw_input("\nGenerate prime numbers up to what number? : ")
# while pp<int(lim):
#   pp+=2
#   test=True
#   for a in ps:
#     if pp%a==0:
#                              test=False
#                              break
#   if test: ps.append(pp)
# return ps

# class Prime
#   def self.nth(num)
#     pp = 2
#     if num == 1
#       return pp
#     end
#     ps = [pp]
#     pp += 1
#     ps.push(pp)
#     while ps.length < num
#       pp += 2
#       test = TRUE
#       ps.each { |x|
#         if pp % x == 0
#           test = FALSE
#           break
#         end
#       }
#       if test
#         ps.push(pp)
#       end
#     end
#     ps.last
#   end
# end

#########################

# pp=2
# ps=[pp]
# pp+=1
# ps.append(pp)
# lim=raw_input("\nGenerate prime numbers up to what number? : ")
# while pp<int(lim):
#   pp+=2
#   test=True
#   sqrtpp=sqrt(pp)
#   for a in ps:
#     if a>sqrtpp: break
#     if pp%a==0:
#                              test=False
#                              break
#   if test: ps.append(pp)
# return ps

class Prime
  def self.nth(num)
    pp = 2
    if num == 1
      return pp
    end
    ps = [pp]
    pp += 1
    ps.push(pp)
    while ps.length < num
      pp += 2
      test = TRUE
      sqrtpp = Math.sqrt(pp)
      ps.each { |x|
        if x > sqrtpp
          break
        end
        if pp % x == 0
          test = FALSE
          break
        end
      }
      if test
        ps.push(pp)
      end
    end
    ps.last
  end
end
puts Prime.nth(3)