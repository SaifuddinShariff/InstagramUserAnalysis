SELECT * from users ORDER BY created_at LIMIT 5;

Select username FROM users LEFT JOIN photos on users.id = photos.user_id WHERE photos.id is NULL

select username, photos.id, photos.image_url, count(*) as total from photos
inner join likes on likes.photo_id = photos.id 
inner join users on photos.user_id = users.id
group by photos.id order by total desc limit 1

select tags.tag_name,
count(*) as total
from photo_tags
join tags
on photo_tags.tag_id=tags.id
group by tags.id
order by total desc
limit 5;

select dayname(created_at) as Day,
count(*) as total
from users
group by day
order by total desc
limit 2;

- select(select count(*)
from photos) / (select count(*) from users) as avg;

select username, count(*) as num_likes from users
inner join likes on users.id = likes.user_id
group by likes.user_id
having num_likes = (select count(*) from photos);