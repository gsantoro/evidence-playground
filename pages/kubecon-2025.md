---
title: Kubecon 2025
---


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



## All talks by CNCF item


```sql cncf_with_stars
select 
  name as cncf_name,
  gh_stars
from cncf_landscape.landscape
where gh_stars > 0
order by gh_stars desc, name asc
```

<Dropdown 
  data={cncf_with_stars} 
  title="Choose a CNCF item with stars"
  name="cncf_name"
  value="cncf_name"
/>


```sql all_talks_with_cncf
select 
  title,
  url
from kubecon_schedule.talks
where '${inputs.cncf_name.value}' in description
or '${inputs.cncf_name.value}' in description
```


<DataTable
    data={all_talks_with_cncf}
    title="Search a talk by name"
    sort="title desc"
    search=true
    limit=10
>
  <Column id="url" contentType="link" linkField="url" linkLabel=title />
</DataTable>


## Top CNCF topics

```sql top_cncf_topics
SELECT
  l.name AS cncf_item,
  count(*) as cnt
FROM
  kubecon_schedule.talks t
JOIN
  cncf_landscape.landscape l
ON
  l.name in t.description
group by 1
having count(*) > 5
order by 2 desc
```

<DataTable
    data={top_cncf_topics}
    title="Top topics by number of talks"
    sort="cnt desc"
    search=true
>
  <Column id="cncf_item" />
  <Column id="cnt" />
</DataTable>


```sql top_10_cncf_topics
select *
from (
  SELECT
    l.name AS cncf_item,
    count(*) as cnt
  FROM
    kubecon_schedule.talks t
  JOIN
    cncf_landscape.landscape l
  ON
    l.name in t.description
  group by 1
  having count(*) > 5
  order by 2 desc
)
limit 10
```

<BarChart
    data={top_10_cncf_topics}
    title="Top 10 topics by number of talks"
    x=cncf_item
    y=cnt
    labels=true
/>