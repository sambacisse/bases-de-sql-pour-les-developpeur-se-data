---
title       : Aggregate Functions
description : Insert the chapter description here

--- type:BulletExercise lang:sql xp:100 key:b883e7079f
## SUM, AVG, MIN, MAX

Often you will want to perform some calculation on the data in a database. SQL provides a few functions to help you out with this.

For example:

```
SELECT AVG(budget)
FROM films;
```

gives you a result set where the only row contains the average value from the `budget` column of the `films` table. In the same fashion, the `MAX()` function would return the highest budget.

```
SELECT MAX(budget)
FROM films;
```

The `SUM()` function returns the result of adding up the numeric values in a column:
```
SELECT SUM(budget)
FROM films;
```

We're sure you can guess what the `MIN()` function does! Now it's your turn to try out some SQL functions.

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
Get the total (sum) duration of all films.
*** =solution1
```{sql}
SELECT SUM(duration)
FROM films;
```

*** =hint1
To get the total duration, you can use `SUM(duration)`
*** =sct1
```{python}
sel = check_node('SelectStmt')

sum_call = sel.check_node('Call').has_equal_ast('Are you calling `SUM` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    sum_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
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
*** =sct2
```{python}
sel = check_node('SelectStmt')

avg_call = sel.check_node('Call').has_equal_ast('Are you calling `AVG` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    avg_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
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
*** =sct3
```{python}
sel = check_node('SelectStmt')

min_call = sel.check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type4: NormalExercise

*** =key4: fabbc619c6
*** =xp4: 20

*** =instructions4
Get the amount made by the highest grossing film.
*** =solution4
```{sql}
SELECT MAX(gross)
FROM films;
```
*** =sct4
```{python}
sel = check_node('SelectStmt')

max_call = sel.check_node('Call').has_equal_ast('Are you calling `MAX` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type5: NormalExercise
*** =key5: e14c21bc81
*** =xp5: 20
*** =instructions5
Get the amount made by the lowest grossing film.

*** =solution5
```{sql}
SELECT MIN(gross)
FROM films;
```
*** =sct5
```{python}
sel = check_node('SelectStmt')

min_call = sel.check_node('Call').has_equal_ast('Are you calling `MIN` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    sel.has_equal_ast('Is your `SELECT` statement correct?'),
    test_has_columns(),
    test_ncols(),
    test_error()
])
```


--- type:MultipleChoiceExercise lang:sql xp:50 skills:1 key:7b8b54b64d
## A note on arithmetic
In addition to using the built in SQL functions, you can perform basic arithmetic with symbols like `+`, `-`, `*`, and `/`.

So, for example:

```
SELECT (4 * 3);
```

gives you a result of `12`.

However:

```
SELECT (4 / 3);
```

gives you a result of `1`. What's going on here?

Well, SQL assumes that if you divide an integer by an integer, that you want to get an integer back. So be careful when dividing!

If you want to get more precision when dividing, you can add decimal places to your numbers:

```
SELECT (4.0 / 3.0) AS result;
```

which gives you the result you would expect: `1.333..`

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
--- type:TabExercise lang:sql xp:100 key:9f4b026fe7
## It's AS simple AS aliasing

You may have noticed in the previous exercise that the column name of your result set was just the name of the function you used. For example:

```
SELECT MAX(budget)
FROM films;
```

gives you a result set with one column, named `max`. But what if you used two functions like this?:

```
SELECT MAX(budget), MAX(duration)
FROM films;
```

Well, then you'd have two columns named `max`, which isn't very useful!

To avoid situations like this, SQL allows you to do something called _aliasing_. Aliasing simply means you assign a temporary name to something. To alias, you use the `AS` keyword. For example, in the above example we could use aliases to make the result set clearer:

```
SELECT MAX(budget) AS max_budget, MAX(duration) AS max_duration
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
Get the title and profit or loss for each film, where possible. Let's define the profit or loss as being the amount the film made, minus the amount the film cost to make. Alias the profit or loss as `profit_or_loss`.
*** =solution1
```{sql}
SELECT title, gross - budget AS profit_or_loss
FROM films;
```

*** =hint1
The profit / loss will be `gross - budget`
*** =sct1
```{python}
sel = check_node('SelectStmt')

alias = test_column('profit_or_loss', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the profit or loss correctly?')

Ex().test_correct(check_result(), [
    alias_eqn,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

*** =type2: NormalExercise
*** =key2: 1351c6f6bb
*** =xp2: 20

*** =instructions2
Get the title and duration in hours for each film. Currently the duration is in minutes, so you'll need to divide by 60.0 to get the duration in hours. Alias the duration in hours as `duration_hours`.

*** =solution2
```{sql}
SELECT title, duration / 60.0 AS duration_hours
FROM films;
```

*** =hint2
The duration in hours is `duration / 60.0`
*** =sct2
```{python}

Ex().test_has_columns()
Ex().test_ncols()
sel = check_node('SelectStmt').has_equal_ast('Check your `SELECT` statement! Did you divide `duration` by `60` and alias the result as `duration_hours`?')


alias = test_column('duration_hours', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the duration in hours correctly?')

Ex().test_correct(check_result(), [
    alias_eqn,
    alias,
    sel,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```


*** =type3: NormalExercise
*** =key3: 497f8d2a8a
*** =xp3: 20
*** =instructions3
Get the average film duration in hours for all films, aliased as `avg_duration_hours`.

*** =solution3
```{sql}
SELECT AVG(duration) / 60.0 AS avg_duration_hours  
FROM films;
```
*** =hint3
The average duration in hours is `AVG(duration) / 60.0`
*** =sct3
```{python}
# TODO: come back to this with better solution
sel = check_node('SelectStmt')

alias = test_column('avg_duration_hours', match='exact', msg='Did you alias your result as `avg_duration_hours`?')

avg1 = test_student_typed('AVG(duration) / 60.0', msg='Are you calling `AVG` correctly?')
avg2 = test_student_typed('AVG(duration / 60.0)', msg='Are you calling `AVG` correctly?')

avg_call = test_or(avg1, avg2)

Ex().test_correct(check_result(), [
    avg_call,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

--- type:TabExercise lang:sql xp:100 key:7e3a93209c
## Even more aliasing

Nice work! Let's practice your newfound aliasing skills some more before moving on.

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
The percentage is calculated as `COUNT(deathdate) * 100.0 / COUNT(*)`

*** =sct1
```{python}
sel = check_node('SelectStmt')

alias = test_column('percentage_dead', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the percentage of dead people correctly?')

count_call1 = sel.check_node('AliasExpr').check_node('BinaryExpr').check_field('left').has_equal_ast('Is your first `COUNT` call equation correct?')

count_call2 = sel.check_node('AliasExpr').check_node('BinaryExpr').check_field('right').has_equal_ast('Is your second `COUNT` call equation correct?')

count_call = sel.check_node('AliasExpr').check_node('BinaryExpr').check_field('left').has_equal_ast('Are you calling `COUNT` correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    count_call1,
    count_call2,
    alias_eqn,
    alias,
    from_clause,
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
The difference will be `MAX(release_year) - MIN(release_year)`
*** =sct2
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('difference', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the difference correctly?')

Ex().test_correct(check_result(), [
    from_clause,
    alias_eqn,
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
Get the number of decades the `films` table covers. Alias the result as `number_of_decades`.
*** =solution3
```{sql}
SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;
```
*** =hint3
The number of decades is calculated as `(MAX(release_year) - MIN(release_year)) / 10.0`

*** =sct3
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('number_of_decades', match='exact')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr').has_equal_ast('Are you calculating the exact number of decades correctly? Remember to use parentheses in the right places!')

Ex().test_correct(check_result(), [
    from_clause,
    alias_eqn,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```
