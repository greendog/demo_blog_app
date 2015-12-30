# Requirements

- Ruby 2.2.3
- bundler
- ElasticSearch


# Use it as:

1. ```git clone https://github.com/greendog/demo_blog_app.git```
2. ```cd demo_blog_app```
3. ```bundle install```
4. ```bundle exec rake db:install``` for install with demo data and ```admin``` user or ```bundle exec rake db:migrate``` -  without demo data and admin
5. ```bundle exec rails s```
6. go to http://localhost:3000 (here you can create an administrator account if it is not: http://localhost:3000/users/sign_up)
7. go to http://localhost:3000/letter_opener to confirm admin account
8. go to http://localhost:3000/admin ```admin@example.com/password```


# Specification


Blog	contains	Posts.	Each	Post belongs	to	a	certain	Category.	Each Post is	 tagged	with one	or	more Tags and	can	be	
commented	by	both	registered	and	anonymous	visitors.
Categories should	be	organized	into	a	tree	structure.
There	should	be	the	following	kinds	of	users in	the	system:

1. Administrator – the creator of the blog	with	all	the	application	privileges	granted.
2. Visitor – everyone	who	comes	at	the	site.
3. Registered user – Visitor,	which	is	registered	within	the	site	(including e.g. Administrator).

Common	use	case	scenarios	are	the	following:

1. Visitors	 browsing the posts (filtering	and	sorting	modes	can	be	combined	in	any	reasonable	way).
 - Sorting	by	date.
 - Filtering Posts containing certain text	(both	in	subject	and	body	part).	The text found should be highlighted	within	the	search	results.
 - Filtering	Posts by Category.
 - Filtering Posts by Tags (Posts marked	by	one	or	more	certain	Tags at	once).
2. Visitor	signup that moves him	into	the	category	of Registered	users. The	first	registered	user	becomes	the	 Administrator.	Every	user	should	receive	signup	notification	via	email.
3. Visitor authentication.
4. Adding,	editing and deleting of posts by the Administrator. When	posting	there	should	be	an	ability	to	select	the	Category (one	of	those	added	at	the	deployment	stage)	and	choose	Tags (either	typed	in	or	selected	out	the	existing	ones).
5. Commenting.
- Commenting	by Visitors (protected	by	CAPTCHA).
- Commenting by the	Registered users.
- Comment moderation by the Administrator:	accepting,	declining	and removal.
