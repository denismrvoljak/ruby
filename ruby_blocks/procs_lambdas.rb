# === Procs & Lambdas in Ruby ===
#
# ✅ Covered:
#   - Proc.new — a block saved to a variable, lenient with arguments
#   - Lambda (-> syntax) — like a Proc but strict about argument count
#   - .call() — how to invoke Procs and Lambdas
#   - begin/rescue — catching errors (e.class, e.message)
#
# Key difference:
#   - Proc: ignores extra args, fills missing with nil
#   - Lambda: raises ArgumentError if wrong number of args
#
#
# ⏭ Next: Modules & Mixins
#

# --- Exercise 1: Proc — block saved to a variable ---

tripler = Proc.new { |n| n * 3 }
puts tripler.call(5)
# => 15

# --- Exercise 2: Lambda — strict about arguments ---

doubler = -> (n) { n * 2 }
puts doubler.call(5)
# => 10

# --- Exercise 3: Proc vs Lambda argument handling ---
# Proc ignores extra args:
puts tripler.call(1, 2, 3)
# => 3 (uses first arg, ignores rest)

# Lambda raises an error:
begin
  doubler.call(1, 2, 3)
rescue => e
  puts "#{e.class}: #{e.message}"
  # => ArgumentError: wrong number of arguments (given 3, expected 1)
end
