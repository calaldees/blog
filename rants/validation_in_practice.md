

MyHermes dash's in manual number entry

Online credit card number validation

Option 1.) STRIP NON NEED CHARACTERS
Option 2.) alert user meaninfully ("you have these characters, I was not expecting them, is this a mistake?")

Prefer option1 - transparently

Stop wasting my time
Stop confusing armature users, wasting their time and making their day more stressful.

I'll implement it for you now

```
Option1
[^\w\d]

>>> re.sub(r'[^\w\d]', '', 'hello-world')


>>> re.sub(r'[^\d]', '', '2358-2342 2342 1111')

Option2
>>> re.search(r'[^\w\d]', 'hello +')
```

To organisation:
1.) do you know how much collective time you have wasted?
    You could track this problem with sufficient logging - it would be an interesting statistic
    User journy - How mnay times did the user fail to enter it? how much time was spent on each attempt, was the user successful in the end, or did they give up?
2.) do you care?

The answer to both is "no"