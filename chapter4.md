---
title       : Sorting, grouping and joins
description : Insert the chapter description here

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:322af4938b
## ORDER BY

Congratulations on making it this far! You now know how to select and filter your results.

In this chapter you'll learn how to sort and group your results to gain further insight. Let's go!

In SQL, the `ORDER BY` keyword is used to sort the result set in ascending or descending order according the values of one or more columns.

By default `ORDER BY` will sort in ascending order. If you want to sort the results in descending order, you can use the `DESC` keyword. For example:

```
SELECT title
FROM films
ORDER BY release_year;
```

will give you the titles of films sorted by release year, from newest to oldest.


<hr>
Which way does `ORDER BY` sort results by default?

*** =instructions
- Alphabetically
- Descending
- Ascending
- In order of creation date

*** =hint
By default, `ORDER BY` behaves as if it was used with the `ASC` keyword.

*** =sct
```{python}
success_msg = 'Correct!'
alphabetically = 'Incorrect. Although results may be in alphabetical order, how would we order numbers alphabetically?'
descending = 'Incorrect. Results are not ordered descending by default.'
creation = 'Incorrect. Results are not ordered by creation date by default.'

Ex().test_mc(3, [alphabetically, descending, success_msg, creation])
```

--- type:TabExercise lang:sql xp:100 key:a7b2964ba6
## Sorting single columns (ASC)

Now that you understand how `ORDER BY` works, give these exercises a go!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films', 'people'])
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: e3a06cce15
*** =xp1: 20

*** =instructions1
Get the names of people from the `people` table, sorted alphabetically.
*** =solution1
```{sql}
SELECT name
FROM people
ORDER BY name;
```

*** =hint1
You need to use `ORDER BY name;`

*** =sct1
```{python}

sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

*** =type2: NormalExercise

*** =key2: 14a2792baa
*** =xp2: 20

*** =instructions2
Get the names of people, sorted by birth date.
*** =solution2
```{sql}
SELECT name
FROM people
ORDER BY birthdate;
```
*** =sct2
```{sql}
Ex().test_has_columns()
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: 6cfeca71b1
*** =xp3: 20

*** =instructions3
Get the birth date and name for every person, in order of when they were born.
*** =solution3
```{sql}
SELECT birthdate, name
FROM people
ORDER BY birthdate;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: e2702b5933
*** =xp4: 20

*** =instructions4
Get the title and release year of films released in 2000 or 2015, in the order they were released.
*** =solution4
```{sql}
SELECT title, release_year
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    where_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type5: NormalExercise
*** =key5: 5c84507976
*** =xp5: 20

*** =instructions5
Get all details for all films except those released in 2015 and order them by release year.
*** =solution5
```{sql}
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY release_year;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Are you selecting all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    star,
    from_clause,
    order_by_clause,
    where_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:a7b2964ba7
## Sorting single columns (DESC)

Now use `ORDER BY` to sort single columns in descending order!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films', 'reviews'])
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: 1ed651456d
*** =xp1: 20

*** =instructions1
Get the IMDB score and film ID for every film, sorted from highest to lowest score.

*** =solution1
```{sql}
SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;
```

*** =hint1
You need to use `ORDER BY imdb_score DESC;`

*** =sct1
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 3629dd5dcd
*** =xp2: 20

*** =instructions2
Get the titles of films in reverse order.

*** =solution2
```{sql}
SELECT title
FROM films
ORDER BY title DESC;
```
*** =hint2
You need to use `ORDER BY title DESC;`
*** =sct2
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:TabExercise lang:sql xp:100 key:b2a52993bc
## Sorting multiple columns

Good work!

`ORDER BY` can also be used to sort on multiple columns. It will sort by the first column specified, then sort by the next, then the next, and so on. For example:

```
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```

will sort on birth dates first (oldest to newest) and then sort on the names in alphabetical order. **The order of columns is important!**

Try using `ORDER BY` to sort multiple columns! Remember, to specify multiple columns you can separate the column names with a comma.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films', 'people'])
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: 9ec6e8ae72
*** =xp1: 20

*** =instructions1
Get the birth date and name of people in the `people` table, in order of when they were born and alphabetically by name.
*** =solution1
```{sql}
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```
*** =hint1
You need to use `ORDER BY birthdate, name;`


*** =sct1
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 3460b2f14b
*** =xp2: 20

*** =instructions2
Get the release year, duration, and title of films released `IN` 2000 or 2015, ordered by their release year and duration.
*** =solution2
```{sql}
SELECT release_year, duration, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY release_year, duration;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause corect?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    where_clause,
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type3: NormalExercise
*** =key3: c03517c2b9
*** =xp3: 20

*** =instructions3
Get certifications, release years, and titles of films released `IN` 2000 or 2015, ordered by certification (alphabetically) and release year.

*** =solution3
```{sql}
SELECT certification, release_year, title
FROM films
WHERE release_year IN (2000, 2015)
ORDER BY certification, release_year;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause corect?')

where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    where_clause,
    order_by_clause,
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type4: NormalExercise
*** =key4: f0ade213ff
*** =xp4: 20

*** =instructions4
Get the names and birthdates of people whose names start with A, B, or C, ordered by date of birth.
*** =solution4
```{sql}
SELECT name, birthdate
FROM people
WHERE name LIKE 'A%' OR name LIKE 'B%' OR name LIKE 'C%'
ORDER BY birthdate;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause')

# we can check individual LIKEs here, but it's messier
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    where_clause,
    order_by_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:81987a99cf
## Introduction to GROUP BY

Now you know how to sort results. Often you'll need to aggregate results. For example, you might want to get count the number of male and female employees in your company. Here, what you want is to group all the males together and count them, and group all the females together and count them. In SQL, `GROUP BY` allows you to group a result set by one or more columns, like so:

```
SELECT gender, count(*)
FROM employees
GROUP BY gender;
```

which gives for example:

| gender | count |
|----|----|
| male | 15 |
| female | 19 |

<br>
Commonly, `GROUP BY` is used with _aggregate functions_ like `COUNT()` or `MAX()`.

Note that `GROUP BY` always goes after the `FROM` clause!

<hr>
What is `GROUP BY` used for?

*** =instructions
- Performing operations by column
- Performing operations all at once
- Performing operations in a particular order
- Performing operations by group

*** =hint
You use `GROUP BY` when you want to compute results from many records.

*** =sct
```{python}
one = 'Incorrect. While `GROUP BY` does sort by column, we could just use `ORDER BY` for this.'
two = 'Incorrect.'
three = 'Incorrect. While `GROUP BY` does sort results, it\'s not designed to control order of operations.'
success_msg = 'Correct! `GROUP BY` is for performing operations within groups.'

Ex().test_mc(4, [one, two, three, success_msg])
```

--- type:BulletExercise lang:sql xp:100 key:98e30a6131
## GROUP BY practice

As you saw, these kinds of calculations, done by *aggregate functions*, make `GROUP BY` incredibly powerful.

SQL will return an error if you try to `SELECT` a field that is not in your `GROUP BY` clause without using it to calculate some kind of value about the entire group.

Note that you can combine `GROUP BY` with `ORDER BY` to group your results, calculate something about them, and then order your results. For example:

```
SELECT gender, count(*)
FROM employees
GROUP BY gender
ORDER BY count DESC;
```

gives for example:

| gender | count |
|----|----|
| female | 19 |
| male | 15 |

because there are more females at our company than males.

Note also that `ORDER BY` always goes after `GROUP BY`!

Now that you understand what `GROUP BY` is and how to use it, let's try some exercises!


*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: 0b29eb4ff3
*** =xp1: 20

*** =instructions1
Get the count of films grouped by release year.
*** =solution1
```{sql}
SELECT release_year, COUNT(*)
FROM films
GROUP BY release_year;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

count_call = sel.check_node('Call').has_equal_ast('Is your `COUNT` call correct?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    from_clause,
    group_by_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: ebee043890
*** =xp2: 20

*** =instructions2
Get the count of films grouped by release year, sorted by release year. Alias the count as `films_released`.
*** =solution2
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY release_year;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

alias = test_column('films_released', match='exact')

count_call = sel.check_node('AliasExpr').check_node('Call').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

Ex().test_correct(check_result(), [
    count_call,
    order_by_clause,
    group_by_clause,
    from_clause,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

*** =type3: NormalExercise
*** =key3: b4341b8451
*** =xp3: 20

*** =instructions3
Get the count of films released in each year, ordered by count from lowest to highest. Alias the count as `films_released`.
*** =solution3
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY films_released;
```
*** =sct3
```{python}
# TODO: might be useful to add a check that student didn't type ASC
Ex().test_has_columns()
Ex().test_ncols()
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

alias = test_column('films_released', match='exact')

count_call = sel.check_node('AliasExpr').check_node('Call').has_equal_ast('Are you calling `COUNT` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause,
    from_clause,
    count_call,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

*** =type4: NormalExercise
*** =key4: 66d0c5198a
*** =xp4: 20

*** =instructions4
Get the count of films released in each year, ordered by count from highest to lowest.
*** =solution4
```{sql}
SELECT release_year, COUNT(title) AS films_released
FROM films
GROUP BY release_year
ORDER BY films_released DESC;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

alias = test_column('films_released', match='exact')

count_call = sel.check_node('AliasExpr').check_node('Call').has_equal_ast('Are you calling `COUNT` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause,
    from_clause,
    count_call,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type5: NormalExercise
*** =key5: 53ad6da98c
*** =xp5: 20

*** =instructions5
Get the lowest gross box office earnings per release year, ordered by release year.
*** =solution5
```{sql}
SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year
ORDER BY release_year;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

min_call = sel.check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause,
    from_clause,
    min_call,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type6: NormalExercise
*** =key6: cff5924de5
*** =xp6: 20

*** =instructions6
Get the total gross amount films in each language brought in at the box office.
*** =solution6
```{sql}
SELECT language, SUM(gross)
FROM films
GROUP BY language;
```
*** =sct6
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

sum_call = sel.check_node('Call').has_equal_ast('Are you calling `SUM` correctly?')

Ex().test_correct(check_result(), [
    group_by_clause,
    from_clause,
    sum_call,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type7: NormalExercise
*** =key7: 83944ff64f
*** =xp7: 20

*** =instructions7
Get the total budget spent making movies in each country.
*** =solution7
```{sql}
SELECT country, SUM(budget)
FROM films
GROUP BY country;
```
*** =sct7
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

group_by_clause = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

sum_call = sel.check_node('Call').has_equal_ast('Are you calling `SUM` correctly?')

Ex().test_correct(check_result(), [
    group_by_clause,
    from_clause,
    sum_call,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:38a7c62434
## Combining with aggregate functions

Great work!

Now practice your new skills by combining `GROUP BY` and `ORDER BY` with some more aggregate functions!

Make sure to always put the `ORDER BY` clause at the end of your query. You can't sort values that you haven't calculated yet!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: eac5f722a5
*** =xp1: 20

*** =instructions1
Get the highest budget spent making a film for each year, for each country.
*** =solution1
```{sql}
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause1 = sel.check_field('group_by_clause', 0).has_equal_ast('Is the first column of your `GROUP BY` clause correct?')

group_by_clause2 = sel.check_field('group_by_clause').has_equal_ast('Is the second column of your `GROUP BY` clause correct?')

max_call = sel.check_node('Call').has_equal_ast('Are you calling `MAX` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause1,
    group_by_clause2,
    from_clause,
    max_call,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 48461bd4d3
*** =xp2: 20

*** =instructions2
Get the lowest box office amount made by each country in each year.
*** =solution2
```{sql}
SELECT release_year, country, MIN(gross)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('where_clause').has_equal_ast('Is your `FROM` clause correct?')

order_by_clause = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

group_by_clause1 = sel.check_field('group_by_clause', 0).has_equal_ast('Is the first column of your `GROUP BY` clause correct?')

group_by_clause2 = sel.check_field('group_by_clause').has_equal_ast('Is the second column of your `GROUP BY` clause correct?')

min_call = sel.check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

Ex().test_correct(check_result(), [
    order_by_clause,
    group_by_clause1,
    group_by_clause2,
    from_clause,
    min_call,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```


--- type:PlainMultipleChoiceExercise lang:sql xp:50 key:4d55b1adf8
## HAVING a great time

In SQL, aggregate functions can't be used in `WHERE` clauses. For example, the following query is invalid:

```
SELECT release_year
FROM films
GROUP BY release_year
WHERE COUNT(title) > 10;
```

This means that if you want to filter based on the result of an aggregate function, you need another way! That's where the `HAVING` clause comes in. For example:

```
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;
```

will show only those years in which more than 10 films were released.

<hr>
What does the `HAVING` keyword let you do?

*** =instructions
- Filter based on results of rounding functions
- Filter based on results of exponential functions
- Filter based on results of recursive functions
- Filter based on results of aggregate functions

*** =hint
What kind of functions can `WHERE` not be used with?

*** =sct
```{python}
rounding = 'Incorrect. `HAVING` is not used with rounding functions.'
summing = 'Incorrect. `HAVING` is not used with exponential functions.'
recursive = 'Incorrect. `HAVING` is not used with recursive functions.'
aggregate = 'Correct!. `HAVING` is used to filter based on the results of aggregate functions.'

Ex().test_mc(4, [rounding, summing, recursive, aggregate])
```

--- type:TabExercise lang:sql xp:100 key:f7dcb9e122
## All together now

Time to practice using `ORDER BY`, `GROUP BY` and `HAVING` together.

This is going to be a big query, but you can handle it!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}

```
*** =type1: NormalExercise
*** =key1: a141cd669f
*** =xp1: 20

*** =instructions1
Get the release year, budget and box office earnings for each film in the `films` table.
*** =solution1
```{sql}
SELECT release_year, budget AS gross
FROM films;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

*** =type2: NormalExercise
*** =key2: d80bd57b13
*** =xp2: 20

*** =instructions2
Modify your query so that only results since 1990 are included.
*** =solution2
```{sql}
SELECT release_year, budget, gross
FROM films
WHERE release_year > 1990;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    where_clause,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

*** =type3: NormalExercise
*** =key3: 2d5e6bd8cf
*** =xp3: 20

*** =instructions3
Remove the budget and gross columns, and group your results by release year.
*** =solution3
```{sql}
SELECT release_year
FROM films
WHERE release_year > 1990
GROUP BY release_year;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
group_by = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')


Ex().test_correct(check_result(), [
    from_clause,
    where_clause,
    group_by,
    test_has_columns(),
    test_ncols(),
    test_error()
])


```

*** =type4: NormalExercise
*** =key4: ee92d8cbaa
*** =xp4: 20

*** =instructions4
Modify your query to add in the rounded average budget and average box office earnings for the results you have so far. Alias your results as `avg_budget` and `avg_box_office` respectively. Remember, you can use the `ROUND()` function.
*** =solution4
```{sql}
SELECT release_year, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) AS avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
group_by = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')

alias1 = test_column('avg_budget', match='exact', msg='Are you aliasing `avg_budget` correctly?')
alias2 = test_column('avg_box_office', match='exact', msg='Are you aliasing `avg_box_office` correctly?')

first_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(budget))` correctly?')

second_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(gross))` correctly?')

Ex().test_correct(check_result(), [
    first_round,
    second_round,
    from_clause,
    where_clause,
    group_by,
    alias1,
    alias2,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type5: NormalExercise
*** =key5: ce0f248734
*** =xp5: 20

*** =instructions5
Modify your query so that only films with an average budget of greater than $60 million are included.

*** =solution5
```{sql}
SELECT release_year, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) AS avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
group_by = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')
having = sel.check_field('having_clause').has_equal_ast('Is your `HAVING` clause correct?')

alias1 = test_column('avg_budget', match='exact', msg='Are you aliasing `avg_budget` correctly?')
alias2 = test_column('avg_box_office', match='exact', msg='Are you aliasing `avg_box_office` correctly?')

first_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(budget))` correctly?')

second_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(gross))` correctly?')

avg_in_having = having.check_node('Call').has_equal_ast('Are you correctly calling `AVG` on `budget` in your `HAVING` clause?')

Ex().test_correct(check_result(), [
    first_round,
    second_round,
    having,
    from_clause,
    where_clause,
    group_by,
    alias1,
    alias2,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

*** =type6: NormalExercise
*** =key6: 7b3afeed2f
*** =xp6: 20

*** =instructions6
Finally, modify your query to order the results from highest average box office earnings to lowest.

*** =solution6
```{sql}
SELECT release_year, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) AS avg_box_office
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_box_office DESC;
```
*** =sct6
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
group_by = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')
having = sel.check_field('having_clause').has_equal_ast('Is your `HAVING` clause correct?')
order_by = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

alias1 = test_column('avg_budget', match='exact', msg='Are you aliasing `avg_budget` correctly?')
alias2 = test_column('avg_box_office', match='exact', msg='Are you aliasing `avg_box_office` correctly?')

first_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(budget))` correctly?')

second_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(gross))` correctly?')

avg_in_having = having.check_node('Call').has_equal_ast('Are you correctly calling `AVG` on `budget` in your `HAVING` clause?')

Ex().test_correct(check_result(), [
    first_round,
    second_round,
    having,
    from_clause,
    where_clause,
    group_by,
    order_by,
    alias1,
    alias2,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:0bbc6da34d
## All together now (2)

Great work! Now try another large query. This time, all in one go!

*** =instructions
Get the name, average budget, and average box office take of countries that have made more than 10 films. Order the result by name, and limit the number of results displayed to 5. Remember, you can use the `ROUND()` function.

*** =hint
You can refer back to the previous exercise!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}

```

*** =solution
```{sql}
SELECT country, ROUND(AVG(budget)) AS avg_budget, ROUND(AVG(gross)) AS avg_box_office
FROM films
GROUP BY country
HAVING COUNT(title) > 10
ORDER BY country
LIMIT 5;
```

*** =sct
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')
where_clause = sel.check_field('where_clause').has_equal_ast('Is your `WHERE` clause correct?')
group_by = sel.check_field('group_by_clause').has_equal_ast('Is your `GROUP BY` clause correct?')
having = sel.check_field('having_clause').has_equal_ast('Is your `HAVING` clause correct?')
order_by = sel.check_field('order_by_clause').has_equal_ast('Is your `ORDER BY` clause correct?')

alias1 = test_column('avg_budget', match='exact', msg='Are you aliasing `avg_budget` correctly?')
alias2 = test_column('avg_box_office', match='exact', msg='Are you aliasing `avg_box_office` correctly?')

first_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(budget))` correctly?')

second_round = sel.check_node('AliasExpr', 0).check_node('Unshaped').has_equal_ast('Are you calling `ROUND(AVG(gross))` correctly?')
avg_in_having = having.check_node('Call').has_equal_ast('Are you correctly calling `AVG` on `budget` in your `HAVING` clause?')

Ex().test_correct(check_result(), [
    first_round,
    second_round,
    having,
    from_clause,
    where_clause,
    group_by,
    order_by,
    alias1,
    alias2,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:TabExercise lang:sql xp:100 skills:1 key:d101be707a
## A taste of things to come

Congrats on making it to the end of the course! By now you should have a good understanding of the basics of SQL.

There's one more concept we're going to introduce. You may have noticed that all our results so far have been from just one table. For example, from the `films` or `people` tables.

In the real world however, you will often want to query multiple tables. For example, what if you want to see the IMDB score for a particular movie?

In this case, you'd want to get the ID of the movie from the `films` table and then use it to get IMDB information from the `reviews` table. In SQL, this concept is known as a **join**, and a basic join is shown in the editor to the right.

The query in the editor gets the IMDB score for the film _To Kill a Mockingbird_! Cool right?

As you can see, joins are incredibly useful and important to understand for anyone using SQL.

We'll have a whole course dedicated to them coming soon!

*** =pre_exercise_code
```{sql}
connect('postgresql', 'films')
set_options(visible_tables = ['films', 'reviews'])

```

*** =sample_code
```{sql}
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id=reviews.id
WHERE title = 'To Kill a Mockingbird';
```

*** =type1:NormalExercise
*** =key1: 7c4fc7a484
*** =xp1: 20

*** =instructions1
Submit the code in the editor and inspect the results.

*** =hint1
Submit the code in the editor!

*** =solution1
```{sql}
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id=reviews.id
WHERE title = 'To Kill a Mockingbird';
```

*** =sct1
```{sql}
Ex().test_error()
Ex().test_has_columns()

Ex().check_result()

```

*** =type2:MultipleChoiceExercise
*** =key2: fc288db979
*** =xp2: 20

*** =question2
What rating does _To Kill a Mockingbird_ have on IMDB?

*** =possible_answers2
- 8.1
- 7.7
- 7.6
- 9.3

*** =hint2
Look at the query result tab!

*** =sct2
```{python}
msg1 = 'Nope, look at the query results!'
correct = 'Correct!'

Ex().test_mc(2,[msg1, correct, msg1, msg1])
```
