3.times do |topic|
  Topic.create!(title: "topic #{topic}")
end

puts '3 topics created'
10.times do |blog|
  Blog.create!(
    title: "my blog post #{blog}",
    body: "Sed ut perspiciatis unde omnis iste natus error sit
        voluptatem accusantium doloremque laudantium, totam rem aperiam,
         eaque ipsa quae ab illo inventore veritatis et quasi architecto
          beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem
          quia voluptas sit aspernatur aut odit aut fugit, sed quia consequu
          ntur magni dolores eos qui ratione voluptatem sequi nesciunt.
          Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
          consectetur, adipisci velit, sed quia non numquam eius modi tempora
           incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
           Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis
           suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem
           l eum iure reprehenderit qui in ea voluptate velit esse quam nihil
           molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas
           nulla pariatur?",
    topic_id: Topic.last.id
  )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts '5 skills created'

8.times do |items|
  Portfolio.create!(
    title: "title #{items}",
    subtitle: 'ruby',
    body: "body #{items}",
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

1.times do |items|
  Portfolio.create!(
    title: "title #{items}",
    subtitle: 'angular',
    body: "body #{items}",
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

3.times do |tech|
  Portfolio.last.technologies.create!(name: "tech #{tech}")
end

puts '9 portfolio items created'
