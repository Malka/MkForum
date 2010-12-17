Factory.define :forum do |forum|
  forum.name "Test Forum"
  forum.description "Test description"
end

Factory.sequence :forum_name do |n|
  "Forum-#{n}"
end

Factory.define :thread do |thread|
  thread.name   "Thread-name"
end

Factory.sequence :thread_name do |n|
  "thread-#{n}"
end