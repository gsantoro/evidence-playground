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



```sql talks
  select 
    eventDate,
    title
  from kubecon_schedule.talks
```

<DataTable
    data={talks}
    title="All talks"
    sort="eventDate desc"
    search=true
    limit=10
/>

## Talks by event type

```sql talks_by_event_type
  select 
    eventTypes,
    title
  from kubecon_schedule.talks
  group by eventTypes, title
```

<DataTable
    data={talks_by_event_type}
    title="All talks - search by title"
    sort="eventTypes desc"
    search=true
    limit=10
/>

<Dropdown 
  data={talks_by_event_type} 
  title="Choose an event type"
  name="eventTypes" 
  value="eventTypes"
/>

```sql talks_for_event_type
  select 
    title,
    url
  from kubecon_schedule.talks
  where eventTypes = '${inputs.eventTypes.value}'
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