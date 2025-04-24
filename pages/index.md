---
title: Kubecon 2025
---

## Talks by day

```sql talks_by_day
  select 
    date_trunc('day', eventDate) as event_day,
    count(*) as num_talks
  from kubecon_schedule.talks
  group by event_day
  order by event_day
```

<BarChart
    data={talks_by_day}
    title="Talks by Day"
    x=event_day
    y=num_talks
/>


<!-- <Dropdown 
  data={talks_by_day} 
  name="event_day" 
  value="num_talks"
/> -->


## All talks
All talks sorted by title (descending)


```sql all_talks
  select 
    title,
    url
  from kubecon_schedule.talks
```

<DataTable
    data={all_talks}
    title="Search a talk by name"
    sort="title desc"
    search=true
    limit=10
>
  <Column id="url" contentType="link" linkField="url" linkLabel=title />
</DataTable>

## Talks by event type
Talks grouped by event type


```sql event_type_count
select title,
    eventType,
    count(*) as cnt
from kubecon_schedule.talks_single_type
group by eventType, title
order by cnt desc;
```


<BarChart
    data={event_type_count}
    title="Talks by event type"
    x=eventType
    y=cnt
    labels=true
    
/>


<Dropdown 
  data={event_type_count} 
  title="Choose an event type"
  name="eventTypes" 
  value="eventType"
/>

```sql talks_for_event_type
  select 
    title,
    url
  from kubecon_schedule.talks_single_type
  where eventType = '${inputs.eventTypes.value}'
```

<DataTable
    data={talks_for_event_type}
    title="Talks for event type: {inputs.eventTypes.label}"
    sort="title desc"
    search=true
    limit=10
>
  <Column id="url" contentType="link" linkField="url" linkLabel=title />
</DataTable>