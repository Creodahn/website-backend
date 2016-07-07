# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
image = Image.create(file_name: 'me.jpg', url: 'http://justindrew.net/imgs/me.jpg')
person = Person.create(first_name: 'Justin', last_name: 'Drew', title: 'Web Developer', birth_date: DateTime.strptime('12/28/1986', '%m/%d/%Y'), description: 'I am a web developer who is familiar with all aspects of the web application stack, from the front end to database design. I have worked both in teams and independently, and can work effectively and efficiently in either situation.', email: 'justin@justindrew.net', location: 'Rhinebeck, NY', profile_picture_id: image.id, password: "testTEST", password_confirmation: "testTEST")
image.imagable_type = 'Person'
image.imagable_id = person.id
image.save
Education.create([{school_name: 'Lycoming College', started: DateTime.strptime('9/1/2005', '%m/%d/%Y'), graduated: DateTime.strptime('6/1/2009', '%m/%d/%Y'), description: '<p>Lycoming\'s computer science program mainly focused on C++, but also touched on web programming technologies, as well as database development and assembly language</p><p>While at Lycoming, I was the president of the college\'s ACM chapter from August 2007 to May 2009. I also participated in the ACM ICPC competitions from 2006 to 2008, and I was on our CCSCNE competition team in 2006 and 2009.</p>', person_id: person.id},
  {school_name: 'Rhinebeck Junior/Senior High School', started: DateTime.strptime('10/1/2001', '%m/%d/%Y'), graduated: DateTime.strptime('7/1/2005', '%m/%d/%Y'), description: '<p>In high school, I took most of the available advanced classes, including AP English. I also took a C++ programming class, which was my first experience with programming.</p>', person_id: person.id}])
Skill.create([
  {
    name: 'T-SQL',
    years: 4.5,
    color: '#8b0000',
    hover_color: '#bf0000',
    description: '',
    person_id: person.id
  }, {
    name: 'HTML5',
    years: 4.25,
    color: '#ff4500',
    hover_color: '#ff8500',
    description: '',
    person_id: person.id
  }, {
    name: 'Javascript',
    years: 4.2,
    color: '#ffc500',
    hover_color: '#fff500',
    description: '',
    person_id: person.id
  }, {
    name: 'CSS3',
    years: 4,
    color: '#003aff',
    hover_color: '#007aff',
    description: '',
    person_id: person.id
  }, {
    name: 'JQuery',
    years: 4,
    color: '#7361ff',
    hover_color: '#7381ff',
    description: '',
    person_id: person.id
  }, {
    name: 'Git',
    years: 3,
    color: '#ff2500',
    hover_color: '#ff6500',
    description: '',
    person_id: person.id
  }, {
    name: 'Node.js',
    years: 2.25,
    color: '#32cd32',
    hover_color: '#62fd62',
    description: '',
    person_id: person.id
  }, {
    name: 'Ember',
    years: 1,
    color: '#d32828',
    hover_color: '#f35858',
    description: '',
    person_id: person.id
  }, {
    name: 'Ember-CLI',
    years: 1,
    color: '#a22818',
    hover_color: '#d25848',
    description: '',
    person_id: person.id
  }, {
    name: 'Bootstrap',
    years: 1,
    color: '#6f5499',
    hover_color: '#a28ec1',
    description: '',
    person_id: person.id
  }, {
    name: 'SASS/SCSS',
    years: 0.75,
    color: '#ff0aff',
    hover_color: '#ff5fff',
    description: '',
    person_id: person.id
  }, {
    name: 'Ruby on Rails',
    years: 0.5,
    color: '#8b0000',
    hover_color: '#bf0000',
    description: '',
    person_id: person.id
  }, {
    name: 'JSONAPI',
    years: 0.5,
    color: '#00008b',
    hover_color: '#0000bf',
    description: '',
    person_id: person.id
  }, {
    name: 'Chart.js',
    years: 0.5,
    color: '#20b2aa',
    hover_color: '#50e2aa',
    description: '',
    person_id: person.id
  }, {
    name: 'C#',
    years: 0.5,
    color: '#800080',
    hover_color: '#884488',
    description: '',
    person_id: person.id
  }
])

experiences = WorkExperience.create([
  {
    company: 'Software Consulting Associates',
    description: '<p>The company specializes in municipal software, especially software for building departments. As a result, I have handled and managed large amounts of data, including converting data from new customers\' old products into our database structure.</p><p>Since the company is very small (fewer than 20 people), everyone does a bit of everything, so our days will often include customer phone calls, fixing bugs for existing software, and working on new features or software.</p><p>I also created Municity Help, which acts as an internal ticket tracking and customer relationship management tool. It includes a customer portal for our users to report issues and ask questions. For more information about Municity Help, see the Projects section below.</p>',
    person_id: person.id,
    started: DateTime.strptime('2/10/2012', '%m/%d/%Y'),
    title: 'Software Developer',
    url: 'http://www.municitysoftware.com'
  },
  {
    company: 'Lycoming College',
    description: '<p>I tutored students for the Computer Science Department in several different classes, as well as helping them prep for tests. The classes that I tutored for included:</p><ul><li>Intro to Programming</li><li>Advanced Programming Techniques</li><li>Data Structures</li><li>Computer Graphics</li></ul>',
    ended: DateTime.strptime('5/1/2009', '%m/%d/%Y'),
    person_id: person.id,
    started: DateTime.strptime('8/1/2006', '%m/%d/%Y'),
    title: 'Tutor',
    url: 'http://www.lycoming.edu'
  }
])

projects = Project.create([
  {
    work_experience_id: experiences.first.id,
    description: '<p>Municity Connect is an all-purpose portal for municipal constituents to interact with their government. Whether it\'s applying for a permit, submitting a FOIL (Freedom of Information Law) request, or reporting a pothole, Municity Connect provides a connection that has always been lacking between citizens and municipal workers.</p><p>',
    #ended: DateTime.strptime('', '%m/%d/%Y'),
    name: 'Municity Connect',
    person_id: person.id,
    started: DateTime.strptime('12/1/2015', '%m/%d/%Y'),
    url: 'https://connect.municity5.com'
  }, {
    work_experience_id: experiences.first.id,
    description: '<p>Municity Help Customer Portal is the external piece of SCA\'s ticket tracking and CRM software. It allows users to submit tickets and questions over the internet, rather than requiring them to call into the office for assistance. It also allows them to access the company\'s forums, track the status of their submitted tickets, and view product documentation.</p>',
    ended: DateTime.strptime('11/30/2015', '%m/%d/%Y'),
    name: 'Municity Help Customer Portal',
    person_id: person.id,
    started: DateTime.strptime('3/1/2015', '%m/%d/%Y'),
    url: ''
  }, {
    work_experience_id: experiences.first.id,
    description: '<p>Municity Help is the internal piece of the ticket tracking and CRM software that I created for Software Consulting Associates, Inc. It allows us to more easily respond to customer inquiries and issues by cutting down on phone traffic. It also allows the President of the company to more easily track customer invoices and development projects by consolidating all of our customer data into a single location.</p><p>The software uses a HTML5/CSS3 front end and communicates with a Node.js server that authenticates all requests, logs them, and sends them to the custom MSSQL 2014 database, listens for a response, and sends the result back to the client.</p>',
    ended: DateTime.strptime('11/30/2015', '%m/%d/%Y'),
    name: 'Municity Help',
    person_id: person.id,
    started: DateTime.strptime('6/1/2014', '%m/%d/%Y'),
    url: ''
  }
])

Image.create([
  {
    file_name: 'connect_map.png',
    url: 'http://justindrew.net/imgs/connect_map.png',
    description: '',
    person_id: person.id,
    imagable_type: 'Project',
    imagable_id: projects.first.id
  }, {
    file_name: 'connect_app.png',
    url: 'http://justindrew.net/imgs/connect_app.png',
    description: '',
    person_id: person.id,
    imagable_type: 'Project',
    imagable_id: projects.first.id
  }, {
    file_name: 'connect_reviews.png',
    url: 'http://justindrew.net/imgs/connect_reviews.png',
    description: '',
    person_id: person.id,
    imagable_type: 'Project',
    imagable_id: projects.first.id
  }
])
