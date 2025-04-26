---
title: CNCF landscape
---

Last update on 2025-04-26

## All items 

```sql all_items
  select 
    *
  from cncf_landscape.landscape
```

<DataTable
    data={all_items}
    title="All items"
    sort="gh_stars desc"
    search=true
    limit=10
>
  <Column id="repo_url" contentType="link" linkField="repo_url" linkLabel=name />
  <Column id="category"  />
  <Column id="subcategory"  />
  <Column id="gh_stars"  />
</DataTable>


## All items with stars

```sql all_items_with_stars
  select 
    *
  from cncf_landscape.landscape
  where gh_stars > 0
```

<DataTable
    data={all_items_with_stars}
    title="All items"
    sort="gh_stars desc"
    search=true
    limit=10
>
  <Column id="repo_url" contentType="link" linkField="repo_url" linkLabel=name />
  <Column id="category"  />
  <Column id="subcategory"  />
  <Column id="gh_stars"  />
</DataTable>


<BarChart
    data={all_items_with_stars}
    title="All items with stars"
    x=name
    y=gh_stars
/>

## Categories

```sql categories
select category, count(*) as items
from landscape
group by 1
order by 2 desc
```

<BarChart
    data={categories}
    title="Categories"
    x=category
    y=items
/>


## Subcategory

```sql subcategories
select concat(category, '-', subcategory) as full_category, count(*) as items
from landscape
group by 1
order by 2 desc
```

<BarChart
    data={subcategories}
    title="Subcategories"
    x=full_category
    y=items
/>

## All items

```sql all_items
select *
from landscape
```

<DataTable
    data={all_items}
    title="Search an item"
    sort="gh_stars desc"
    search=true
    limit=10
>
  <Column id="repo_url" contentType="link" linkField="repo_url" linkLabel=name />
  <Column id="category"  />
  <Column id="subcategory"  />
  <Column id="gh_stars"  />
</DataTable>




## All items by category/subcategory
<Dropdown 
  data={categories} 
  title="Choose a category"
  name="category" 
  value="category"
/>

```sql items_by_category
  select 
    name,
    category,
    subcategory,
    gh_stars,
    repo_url
  from cncf_landscape.landscape
  where category = '${inputs.category.value}'
```

<DataTable
    data={items_by_category}
    title="Items for category: {inputs.category.label}"
    sort="gh_stars desc"
    search=true
    limit=10
>
  <Column id="repo_url" contentType="link" linkField="repo_url" linkLabel=name />
  <Column id="category"  />
  <Column id="subcategory"  />
  <Column id="gh_stars"  />
</DataTable>