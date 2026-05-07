enum Categories {
  topNews (q: 'news' , title: 'Top News'  ),
  ai(q: 'ai', title: 'AI'),
  sports(q: 'sports', title: 'Sports'),
  business(q: 'business', title: 'Business',),
  politics(q: 'politics' , title: 'Politics');

 final String title;
 final String q;

  const Categories({required this.q, required this.title});
}