---
title       : Aggregate Functions
description : This chapter builds on the first two by teaching you how to use aggregate functions to summarize your data and gain useful insights. Additionally, you'll learn about arithmetic in SQL, and how to use aliases to make your results more readable! 


--- type:BulletExercise lang:sql xp:100 key:b883e7079f
## Aggregate functions

Often, you will want to perform some calculation on the data in a database. SQL provides a few functions, called *aggregate functions*, to help you out with this.

For example:

```
SELECT AVG(budget)
FROM films;
```

gives you the average value from the `budget` column of the `films` table. Similarly, the `MAX` function returns the highest budget:

```
SELECT MAX(budget)
FROM films;
```

The `SUM` function returns the result of adding up the numeric values in a column:

```
SELECT SUM(budget)
FROM films;
```

You can probably guess what the `MIN` function does! Now it's your turn to try out some SQL functions.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}
```

*** =type1: NormalExercise

*** =key1: 80fd462ae1
*** =xp1: 20

*** =instructions1
Use the `SUM` function to get the total duration of all films.
*** =solution1
```{sql}
SELECT SUM(duration)
FROM films;
```

*** =hint1
```
SELECT ___(___)
FROM ___;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
sum_call = temp.check_field('name').has_equal_ast('Are you calling the `SUM` function?')
sum_args = temp.check_field('args').has_equal_ast('Are you using using `SUM` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    sum_call,
    sum_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise

*** =key2: 7993b51268
*** =xp2: 20

*** =instructions2
Get the average duration of all films.
*** =solution2
```{sql}
SELECT AVG(duration)
FROM films;
```
*** =hint2
```
SELECT ___(___)
FROM ___;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
avg_call = temp.check_field('name').has_equal_ast('Are you calling the `AVG` function?')
avg_args = temp.check_field('args').has_equal_ast('Are you using using `AVG` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    avg_call,
    avg_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type3: NormalExercise

*** =key3: a03aeabbc6
*** =xp3: 20

*** =instructions3
Get the duration of the shortest film.
*** =solution3
```{sql}
SELECT MIN(duration)
FROM films;
```
*** =hint3
```
SELECT ___(___)
FROM ___;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
min_call = temp.check_field('name').has_equal_ast('Are you calling the `MIN` function?')
min_args = temp.check_field('args').has_equal_ast('Are you using using `MIN` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    min_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type4: NormalExercise

*** =key4: fabbc619c6
*** =xp4: 20

*** =instructions4
Get the duration of the longest film. 
*** =solution4
```{sql}
SELECT MAX(duration)
FROM films;
```
*** =hint4
```
SELECT ___(___)
FROM ___;
```

*** =sct4
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
max_call = temp.check_field('name').has_equal_ast('Are you calling the `MAX` function?')
max_args = temp.check_field('args').has_equal_ast('Are you using using `MAX` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:e60103b3f1
## Aggregate functions practice

Good work. Aggregate functions are important to understand, so let's get some more practice!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}
```

*** =type1: NormalExercise

*** =key1: c8173b7d3e

*** =xp1: 20

*** =instructions1
Use the `SUM` function to get the total amount grossed by all films.
*** =solution1
```{sql}
SELECT SUM(gross)
FROM films;
```

*** =hint1
```
SELECT ___(___)
FROM ___;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
sum_call = temp.check_field('name').has_equal_ast('Are you calling the `SUM` function?')
sum_args = temp.check_field('args').has_equal_ast('Are you using using `SUM` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    sum_call,
    sum_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise

*** =key2: 24c0ab68ad

*** =xp2: 20

*** =instructions2
Get the average amount grossed by all films.
*** =solution2
```{sql}
SELECT AVG(gross)
FROM films;
```
*** =hint2
```
SELECT ___(___)
FROM ___;
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
avg_call = temp.check_field('name').has_equal_ast('Are you calling the `AVG` function?')
avg_args = temp.check_field('args').has_equal_ast('Are you using using `AVG` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    avg_call,
    avg_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type3: NormalExercise

*** =key3: 19838082cb

*** =xp3: 20

*** =instructions3
Get the amount grossed by the worst performing film.
*** =solution3
```{sql}
SELECT MIN(gross)
FROM films;
```
*** =hint3
```
SELECT ___(___)
FROM ___;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
min_call = temp.check_field('name').has_equal_ast('Are you calling the `MIN` function?')
min_args = temp.check_field('args').has_equal_ast('Are you using using `MIN` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    min_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type4: NormalExercise

*** =key4: a49b98de42

*** =xp4: 20

*** =instructions4
Get the amount grossed by the best performing film.
*** =solution4
```{sql}
SELECT MAX(gross)
FROM films;
```
*** =hint4
```
SELECT ___(___)
FROM ___;
```

*** =sct4
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
max_call = temp.check_field('name').has_equal_ast('Are you calling the `MAX` function?')
max_args = temp.check_field('args').has_equal_ast('Are you using using `MAX` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```


--- type:BulletExercise lang:sql xp:100 key:b44bd43288
## Combining aggregate functions with WHERE

Aggregate functions can be combined with the `WHERE` clause to gain further insights from your data. 

For example, to get the total budget of movies made in the year 2010 or later:

```
SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;
```

Now it's your turn!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}
```

*** =type1: NormalExercise

*** =key1: b986f33a10

*** =xp1: 20

*** =instructions1
Use the `SUM` function to get the total amount grossed by all films made in the year 2000 or later.
*** =solution1
```{sql}
SELECT SUM(gross)
FROM films
WHERE release_year >= 2000;
```

*** =hint1
```
SELECT ___(___)
FROM ___
WHERE ___ >= ___;
```
*** =sct1
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
sum_call = temp.check_field('name').has_equal_ast('Are you calling the `SUM` function?')
sum_args = temp.check_field('args').has_equal_ast('Are you using using `SUM` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

where_release_year = where_clause.has_equal_ast(sql='release_year >= 2000', start='expression', exact=False, msg='Did you check the `release_year` correctly?')

Ex().test_correct(check_result(), [
    from_clause,
    where_release_year,
    sum_call,
    sum_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise

*** =key2: 65e81175c5

*** =xp2: 20

*** =instructions2
Get the average amount grossed by all films whose titles start with the letter 'A'.
*** =solution2
```{sql}
SELECT AVG(gross)
FROM films
where title LIKE 'A%';
```
*** =hint2
```
SELECT ___(___)
FROM ___
WHERE ___ LIKE 'A%';
```
*** =sct2
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
avg_call = temp.check_field('name').has_equal_ast('Are you calling the `AVG` function?')
avg_args = temp.check_field('args').has_equal_ast('Are you using using `AVG` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

left_like = where_clause.check_field('left').has_equal_ast('Are you using `title` with `LIKE`?')
op_like = where_clause.check_field('op').has_equal_ast('Are you using the `LIKE` operator in your `WHERE` clause?')
right_like = where_clause.check_field('right').has_equal_ast("Are you using `LIKE` with `'A%'`?")

Ex().test_correct(check_result(), [
    from_clause,
    left_like,
    op_like,
    right_like,
    avg_call,
    avg_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type3: NormalExercise

*** =key3: 3ca90a8536

*** =xp3: 20

*** =instructions3
Get the amount grossed by the worst performing film in 1994.
*** =solution3
```{sql}
SELECT MIN(gross)
FROM films
WHERE release_year = 1994;
```
*** =hint3
```
SELECT ___(___)
FROM ___
WHERE ___ = ___;
```
*** =sct3
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
min_call = temp.check_field('name').has_equal_ast('Are you calling the `MIN` function?')
min_args = temp.check_field('args').has_equal_ast('Are you using using `MIN` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

where_release_year = where_clause.has_equal_ast(sql='release_year = 1994', start='expression', exact=False, msg='Did you check the `release_year` correctly?')

Ex().test_correct(check_result(), [
    from_clause,
    where_release_year,
    min_call,
    min_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type4: NormalExercise

*** =key4: d2e630e656

*** =xp4: 20

*** =instructions4
Get the amount grossed by the best performing film between 2000 and 2012.
*** =solution4
```{sql}
SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN 2000 AND 2012;
```
*** =hint4
```
SELECT ___(___)
FROM ___
WHERE ___ BETWEEN ___ AND ___;
```

*** =sct4
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
max_call = temp.check_field('name').has_equal_ast('Are you calling the `MAX` function?')
max_args = temp.check_field('args').has_equal_ast('Are you using using `MAX` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

between_left = where_clause.check_field('left').has_equal_ast('Are you using `release_year` with `BETWEEN`?')
between_op1 = where_clause.check_field('right', 0).has_equal_ast('Check the first part of your `BETWEEN`!')
between_op2 = where_clause.check_field('right', 1).has_equal_ast('Check the second part of your `BETWEEN`!')

Ex().test_correct(check_result(), [
    from_clause,
    between_left,
    between_op1,
    between_op2,
    max_call,
    max_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```



--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:7b8b54b64d
## A note on arithmetic

In addition to using aggregate functions, you can perform basic arithmetic with symbols like `+`, `-`, `*`, and `/`.

So, for example, this gives a result of `12`:

```
SELECT (4 * 3);
```

However, this gives a result of `1`.

```
SELECT (4 / 3);
```

What's going on here? 

SQL assumes that if you divide an integer by an integer, you want to get an integer back. So be careful when dividing!

If you want more precision when dividing, you can add decimal places to your numbers. For example, 

```
SELECT (4.0 / 3.0) AS result;
```

gives you the result you would expect: `1.333`.

<hr>
What is the result of `SELECT (10 / 3);`?

*** =instructions
- 2.333
- 3.333
- 3
- 3.0

*** =hint
Run a query in the editor to the right.

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
```

*** =sample_code
```{sql}
-- You can test out queries here!

```

*** =sct
```{python}
success_msg = 'Correct!'
msg2 = "Incorrect, try out the query in the editor!"

Ex().test_mc(3,[msg2, msg2, success_msg, msg2])
```
--- type:BulletExercise lang:sql xp:100 key:9f4b026fe7
## It's AS simple AS aliasing

You may have noticed in the first exercise of this chapter that the column name of your result was just the name of the function you used. For example,

```
SELECT MAX(budget)
FROM films;
```

gives you a result with one column, named `max`. But what if you use two functions like this?

```
SELECT MAX(budget), MAX(duration)
FROM films;
```

Well, then you'd have two columns named `max`, which isn't very useful!

To avoid situations like this, SQL allows you to do something called _aliasing_. Aliasing simply means you assign a temporary name to something. To alias, you use the `AS` keyword, which you've already seen earlier in this course.

For example, in the above example we could use aliases to make the result clearer:

```
SELECT MAX(budget) AS max_budget, 
       MAX(duration) AS max_duration
FROM films;
```

Aliases are helpful for making results more readable!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise

*** =key1: ec33c2353b
*** =xp1: 20

*** =instructions1
Get the title and net profit (the amount a film grossed, minus its budget) for all films. Alias the net profit as `net_profit`.

*** =solution1
```{sql}
SELECT title, gross - budget AS net_profit
FROM films;
```

*** =hint1
```
SELECT ___, ___ - ___ AS ___
FROM ___;
```

*** =sct1
```{python}
sel = check_node('SelectStmt')

title = test_column('title').has_equal_ast('Did you select the `title` column correctly?') 

alias = test_column('net_profit', match='exact', msg='Did you alias your result as `net_profit`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left').has_equal_ast('Are you using the `gross` column?')

right_eqn = alias_eqn.check_field('right').has_equal_ast('Are you using the `budget` column?')

op_eqn = alias_eqn.check_field('op').has_equal_ast('Are you subtracting `budget` from `gross`?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    alias_eqn,
    left_eqn,
    op_eqn,
    right_eqn,
    alias,
    title,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 1351c6f6bb
*** =xp2: 20

*** =instructions2
Get the title and duration in hours for all films. The duration is in minutes, so you'll need to divide by 60.0 to get the duration in hours. Alias the duration in hours as `duration_hours`.

*** =solution2
```{sql}
SELECT title, duration / 60.0 AS duration_hours
FROM films;
```

*** =hint2
```
SELECT ___, ___ / 60.0 AS ___
FROM ___;
```

*** =sct2
```{python}

sel = check_node('SelectStmt')

title = test_column('title', msg='Did you select the `title` column correctly?')
alias = test_column('duration_hours', match='exact', msg='Did you alias your result as `duration_hours`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left').has_equal_ast('Are you using the `duration` column?')

right_eqn = alias_eqn.check_field('right').has_equal_ast('Are you dividing the `duration` column by `60.0`?')

op_eqn = alias_eqn.check_field('op').has_equal_ast('Are you dividing by `60.0`?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    left_eqn,
    op_eqn,
    right_eqn,
    alias,
    title,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```


*** =type3: NormalExercise
*** =key3: 497f8d2a8a
*** =xp3: 20
*** =instructions3
Get the average duration in hours for all films, aliased as `avg_duration_hours`.

*** =solution3
```{sql}
SELECT AVG(duration) / 60.0 AS avg_duration_hours  
FROM films;
```
*** =hint3
```
SELECT ___(___) / 60.0 AS avg_duration_hours  
FROM ___;
```

*** =sct3
```{python}
# TODO: come back to this with better solution once sqlwhat is patched
sel = check_node('SelectStmt')

alias = test_column('avg_duration_hours', match='exact', msg='Did you alias your result as `avg_duration_hours`?')

avg1 = test_student_typed('AVG(duration) / 60.0', msg='Are you calling `AVG` correctly?')
avg2 = test_student_typed('AVG(duration / 60.0)', msg='Are you calling `AVG` correctly?')

avg_call = test_or(avg1, avg2)

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    avg_call,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:BulletExercise lang:sql xp:100 key:7e3a93209c
## Even more aliasing

Let's practice your newfound aliasing skills some more before moving on!

*** =pre_exercise_code
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films', 'people'])
```

*** =sample_code
```{sql}

```

*** =type1: NormalExercise
*** =key1: e14dc7c1a2
*** =xp1: 20

*** =instructions1
Get the percentage of `people` who are no longer alive. Alias the result as `percentage_dead`. Remember to use `100.0` and not `100`!
*** =solution1
```{sql}
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;
```
*** =hint1
```
SELECT ___(___) * 100.0 / ___(___) AS percentage_dead
FROM ___;
```

*** =sct1
```{python}
sel = check_node('SelectStmt')

alias = test_column('percentage_dead', match='exact', msg='Did you alias your result as `percentage_dead`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_node('BinaryExpr')

right_eqn = alias_eqn.check_node('Call').has_equal_ast('Are you dividing by `COUNT(*)`?')

temp = left_eqn.check_field('left')

count_call = temp.check_field('name').has_equal_ast('Are you using the `COUNT` function for the top of your fraction?')

count_args = temp.check_field('args').has_equal_ast('Are you using `COUNT` on the right column?')

op_eqn = left_eqn.check_field('op').has_equal_ast('Are you multiplying `COUNT(deathdate)` by `100.00`?')

right_left_eqn = left_eqn.check_field('right').has_equal_ast('Make sure to multiply the top by `100.0`!')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    count_call,
    count_args,
    op_eqn,
    right_left_eqn,
    right_eqn,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: c2bbd9a806
*** =xp2: 20
*** =instructions2
Get the number of years between the oldest film and newest film. Alias the result as `difference`.

*** =solution2
```{sql}
SELECT MAX(release_year) - MIN(release_year)
AS difference
FROM films;
```
*** =hint2
```
SELECT ___(___) - ___(___)
AS difference
FROM ___;
```

*** =sct2
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('difference', match='exact', msg='Did you alias your result as `difference`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left')
right_eqn = alias_eqn.check_field('right')

max_call = left_eqn.check_field('name').has_equal_ast('Did you use `MAX` function to get the oldest film?')
max_args = left_eqn.check_field('args').has_equal_ast('Are you using `MAX` on the right column?')

min_call = right_eqn.check_field('name').has_equal_ast('Did you use the `MIN` function to get the newest film?')
min_args = right_eqn.check_field('args').has_equal_ast('Are you using `MIN` on the right column?')

op_eqn = alias_eqn.check_field('op').has_equal_ast('Are you subtracting the most recent year from the least recent year?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    op_eqn,
    min_call,
    min_args,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```

*** =type3: NormalExercise
*** =key3: f272486b68
*** =xp3: 20

*** =instructions3
Get the number of decades the `films` table covers. Alias the result as `number_of_decades`. The top half of your fraction should be enclosed in parentheses.
*** =solution3
```{sql}
SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;
```
*** =hint3
```
SELECT (___(___) - ___(___)) / 10.0
AS number_of_decades
FROM ___;
```

*** =sct3
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('number_of_decades', match='exact', msg='Did you alias your result as `number_of_decades`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left')

max_node = left_eqn.check_field('left')

max_call = max_node.check_field('name').has_equal_ast('Did you use the `MAX` function to get the most recent year?')
max_args = max_node.check_field('args').has_equal_ast('Did you use `MAX` on the right column?')

min_node = left_eqn.check_field('right')

min_call = min_node.check_field('name').has_equal_ast('Did you use the `MIN` function to get the least recent year?')
min_args = min_node.check_field('args').has_equal_ast('Did you use `MIN` on the right column?')

op_eqn = left_eqn.check_field('op').has_equal_ast('Are you subtracting the newest year from the oldest year?')

other_op = alias_eqn.check_field('op').has_equal_ast("Don't forget to divide by `10.0`!")

ten = alias_eqn.check_field('right').has_equal_ast('Did you divide by `10.0`?')


Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    op_eqn,
    min_call,
    min_args,
    other_op,
    ten,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```
