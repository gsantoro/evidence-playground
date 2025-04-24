select title,
    unnest(string_split(eventTypes, ', ')) as eventType,
    description,
    eventDate,
    url
from talks
where eventTypes is not null
order by title, eventType