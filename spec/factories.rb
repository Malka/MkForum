Factory.define :forum do |forum|
  forum.name "Test Forum"
  forum.description "Test description"
end

Factory.sequence :forum_name do |n|
  "Forum-#{n}"
end

Factory.define :topic do |thread|
  thread.title   "Thread-name"
end

Factory.sequence :thread_name do |n|
  "thread-#{n}"
end