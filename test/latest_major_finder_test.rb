require_relative "../latest_majors_finder"

sorted_rails_52 = %w(5.2.0.beta1 5.2.0.beta2 5.2.0.rc1 5.2.0.rc2 5.2.0 5.2.1.rc1)

result = LatestMajorsFinder.new(sorted_rails_52).call

if result != ["5.2.0"]
  abort "FAILED: Latest major given 5.2.x data should be 5.2.0."
else
  puts "TEST PASSED"
end

sorted_rails_51 = %w(
  5.1.0.beta1
  5.1.0.rc1
  5.1.0.rc2
  5.1.0
  5.1.1
  5.1.2.rc1
  5.1.2
  5.1.3.rc1
  5.1.3.rc2
  5.1.3.rc3
  5.1.3
  5.1.4.rc1
  5.1.4
  5.1.5.rc1
  5.1.5
  5.1.6
)

result = LatestMajorsFinder.new(sorted_rails_51).call

if result != ["5.1.6"]
  abort "FAILED: Latest major given 5.1.x data should be 5.1.6."
else
  puts "TEST PASSED"
end
