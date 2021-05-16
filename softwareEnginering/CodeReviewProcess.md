# Incremental Code Reviews

Just raising a PR online and waiting for the comments to 'come back' is not effective code review.
Code reviews are the cornerstone of shared understanding, growth, and higher quality products.
A team's attitudes to Code Review can transform a teams effectiveness.

## Objectives of a Code Review Process

* Share developer knowledge effectively within the team
    * Be effective for average developers
    * Up-skill/support weaker developers
    * Disseminate insight from advanced/exceptional developers
* Allows all levels of developer to make contributions with positive business value (and never lower the quality of the codebase)
    * Your business process should limit the damage potential of weak/inexperienced developers
    * You can enhance the quality of output of average developers with good process
* Detect complications sooner rather than later
    * To avoid poor quality solutions
* Breakup large/heavy/intensive cognitive work
    * Humans can't focus at 100% capacity for long periods of time
* Efficiently use developers' time
    * Maximize our developers' understanding as efficiently as possible
        * What is quicker?
            * 3 people independently spending 15 min of source diving to find the answer
            * or one 60 second explanation to 3 people
* Verify/check thinking/approach
    * No single person is code Jesus. I've seen great developers make bad calls occasionally
* Consolidate/Unify the teams code style, patterns and thinking

## Code Review - An ongoing process

* Code Review should be a _continual ongoing process_. It is not a separate step after development is complete
    * Developers will be more engaged with your code review if they have been included earlier in the process
    * Reviewers wont feel the ticket is insurmountably complex. It won't be a surprise. They will be comfortable and it will feel personally relevant
* Code Review should be _incremental_ with a fast turnaround/feedback cycle
    * The spin-up time for meaningful feedback is dramatically reduced

### Ticket Prelim

To facilitate Code Review that is not a discreet step at the end of development; The seeds for Code Review are planted before ticket implementation has even begun.

Two (or more) developers should discuss the technical approach to the ticket

(Side note: the ticket is written as a story requirement and will have been deliberately crafted to remove implementation directives)

* The prelimers decide on
    * Classes to create?
    * Likely files to be edited?
    * Any possible overlap with any other tickets in this sprint? (should have been covered at sprint planning, prelim with developers on overlap)
    * Expected algorithm or query structure?
    * How will we test it? (facilitate a developer-in-test? handoffs to separate testers later ==bad)
        * List the titles of tests that would need to be created?
* These should be recorded (maybe ticket comments?)

### Interim Code Review (Fast Feedback)

* Spin-up time to get quality feedback it minimal (as reviewers were involved in prelim and other smaller reviews)
* We can now have small 15 min code reviews that don't wipe out an afternoon.
    * Developers are more likely to accept a code review as it's just a few minutes out of their flow
        * They are already familiar with the implementation direction. It's not a huge cognitive overhead to switch tasks
    * It's perfectly acceptable for a reviewer to postpone a review-request for 15 min while they finish something
        * Postponing for any more than a few hours is actively discouraged
        * Postponing longer than half a day is seen as disruptive
            * (No single developer should ever be rushing or stressed or working on something so critical that it should prevent them from performing any other task (like code review) for half a day. Something is wrong with that process)

## Team attitude to code review

When you invite someone to a code review; you are saying:
* I value your professional opinion and skill
* I want you to challenge my thinking; Any solution can be improved
* I want to help you grow
* I need further insight from you on parts of the system/experience I am unfamiliar with

Intended Culture: "It is height of bad manners to refuse and offer of code review". (A reference to Red Dwarf: Series 4: Holo-ship)

A culture of *professional comradery* is a key component to effective collaboration.
If developers don't like being in each others company, they will want the code review to be over a quickly as possible. The code review will not be thorough.

Managers
* Must be tolerant of ???
* When hiring, it is important to consider _team fit_. Imagine how this new hire would communicate with the existing team.


### Why have such regular reviews?

> Analogy: Why do you brush your teeth twice a day? You could just see a dentist/hygienist once every 6 months for a clean and maybe a filling.

## Presenting (one of) your (many mini) Reviews

1. Welcome attendees, describe agenda/table-of-content
2. Show the original ticket on screen
    * Most developers would have been present at sizing and seen the ticket before. This is a good reminder
3. Check your reviewers understanding. Do not assume
    * Check their level of understanding about the ticket/feature
        * Just because you've linked them to the ticket beforehand does not mean it has been read or understood
    * Give them business context
    * Check what parts of the system they have seen/used before. Ask them if they want a refresher
        * Normal Developers, Junior developers and Half-management-(distracted) developers will often need prompting/checking/guiding
            * Do this in a constructive, supportive, respectful, professional way
4. Demo: Show them the code/feature working/or-progress
    * Give them context _then_ show them the code
5. (Possibly) Start with reviewing the tests you have written
    * Tests should _document_ the functionality
        * As Test code is documentation - Put comments over the test (this is acceptable use of comments [opposed to clean code principles])
6. Record comments on a PR tracker
    * Audit trial of discussion
    * This could be done by one of the attendees on their laptop
        * This leaves the presenter free to focused on the code

## Examples

### Indicators of poor business process (are any of these familiar?)

* A senior developer attends the review at the last stage and slams it - I could have told you to not take this approach. The ticket remains blocked with un-constructive comments like, "Replace all of this."
    * Have prelims
* When testing, someone asks, "Why are we doing this in the first place? This flow is utterly inefficient. Did the user ask for this feature directly? Why didn't we ask them 'Why' they want it."
    * Size your tickets. Product owner + the team should reject tickets without understanding the use-case/reasons
* I don't know anything about this part of the system. I can't really help you on this review
    * Size your tickets. Have prelims
* It's too late. Were just going to have to merge it and suffer the consequences because we need to ship the feature
    * Ongoing Incremental Fast feedback. The team would know if this ticket needs more time/attention
* I've just spent 15 mins writing my comment against a change that was suggested to me. Sadly I don't think this reviewer gets my point. This is the 3rd comment exchange and this review has been open 2 days now
    * Have more than 2 people in a review
* I've asked 3 times on slack. Everyone is busy as it's the end of sprint on their own tickets and I don't think I can get my ticket through as there is no one to review it
    * Have incremental code reviews
    * Why is the team focused on individual delivery? Culture???
* I've just been given a 2000 line PR from an email notification. My heart just sank
    * Have incremental code reviews
    * Have prelims (you know you're going to be involved later in this ticket.)
    * Talk/invite people at standup - Be a human
* I just sat though a 3 hour code review. I contributed nothing. I still feel like I have little understanding of the feature
    * The whole team sizes tickets (so they all should have some knowledge)
    * The presenter should have checked the attendees knowledge understanding
* Can you review this code. The tests are failing because I'm running CI for the first time. I'll get to them later
    * This is too late; tests are part of development
    * Commits should be made regularly - CI should give ongoing feedback
* I'm desperate to get my feature through but the rest of the team are being aggressive and elitist and refuse to accept my changed even after 3 rounds of changes
    * Do not block all progress - as long as quality does not decrease
    * The team should have supported design direction earlier (prelims)
* This is a massive ticket for the 'Forms Engine'. X does all for 'Forms Engine' work, X is the only one that understands that part of the codebase properly
    * Distribute codebase knowledge effectively, up-skill your team, get insight from more people
* Give complex tickets to good developers: We don't have time to code review large tickets
    * Large tickets WILL ALWAYS BE a burden for the whole *team* (not just for one developer) - One person cannot/should-not deliver a ticket - A large ticket for one individual to implement, will be equally large for the rest of the team to review effectively
        * A large ticket undertaken by a an experienced developer still needs it's complexity understood by the rest of the team. You are not making things faster by giving it to solely to a competent developer.
        * A large ticket undertaken by a weaker developer need support from other members of the team to raise their understanding
        * The overall cost/complexity/time of the ticket is still the same _no matter who in the team is involved_ it
* (Sit down for code review) - Right, so this first line is just some config, then .. um .. oh yeah .. this looks bad but it's just a performance join.
    * Present the review - remind attendees of the ticket objectives and conditions of success, check understanding of attendees, give table-of-content/agenda ("we'll look at the tests first")

### Indicators of good practice

* At Prelim: This is a particularly tricky part of the code base. We've missed things when we've structured this previously. We should check this approach with the lead before we get too deep in this.
* At the final review: Welcome to the review of XYZ, This is the 3rd time we've met so I know you all know the background, I'll show you the new tests I've written and we'll go from there.
* Code review? Now? I'm just getting the dev env back up, with you in 15min?
* At Standup: Ben was helping me review XXX and he's sick today. It's near the end of sprint, I know Taylor and Jay were in the prelim. Any chance you're free for review before lunchtime today?
* This is a bit much to take in right now, we've been going 45min and there is a lot of logic/flow here. Can I have some time to look at the diff on my own. Can we reconvene in 45min?
* You've called us for a code review, but the tests on CI are not passing for your branch. Are you sure this feature is ready for review?
* Ok, we've been talking round this implementation point for 10min now with different approaches and no clear conclusion. Let's see if one of the leads is free to get their insight
* Thanks for the invite, Sorry I'm really firefighting here. I'll skip this review, send me the diff and I'll ensure I join you for the next one

## Handover (to Tester?/ProductOwner?)

Once the developers are happy with a ticket. There should be a process to handover to the next stakeholder. This handover should follow a similar presentation structure to a code review.
* Present original ticket spec
* Describe design decisions and rough implementation
* Demo new behaviour
* Describe the test cases that have have been constructed

## Pair Programming (The next logical step)

Regular Code Review facilitates high quality deliverables.
Why not take it to the next level.
Pair Programming.

* Plug two keyboards into one machine. Edit the code together.
* One person can lookup stack-overflow on a separate laptop while the other is sketching out a loop.
* One person can be searching the codebase for references to a function while the method name is being changed.
* "I was thinking more like" - sketch out the idea next-to the code the first dev just wrote
* It's like incremental code review maxed to an ultimate extreeeeem!
* Social, collaborative, high quality code.
* If you're in an office together, use the gift of human interaction.
    * There is little point in everyone in close proximity being adverse to interaction, why bother with an office? Just dispense with the office space all-together and everyone just work remotely

Pair Programming is a *tool* in a toolbox.
It is not effective or required that every task is paired on.

* https://martinfowler.com/articles/on-pair-programming.html
* https://wiki.c2.com/?PairProgrammingEconomics
* https://link.springer.com/chapter/10.1007/978-1-4842-4221-6_21
* [The Mortifying Ordeal of Pairing All Day](https://www.simplermachines.com/the-mortifying-ordeal-of-pairing-all-day/)

## Further Reading

* [Developers mentoring other developers: practices I've seen work well](https://blog.pragmaticengineer.com/developers-mentoring-other-developers/)
* Counterpoints
    * [Makers, Don't Let Yourself Be Forced Into the 'Manager Schedule'](https://blog.nuclino.com/makers-don-t-let-yourself-be-forced-into-the-manager-schedule)
* [How to write the perfect pull request ](https://github.blog/2015-01-21-how-to-write-the-perfect-pull-request/)
* [thoughtbot: code-review](https://github.com/thoughtbot/guides/tree/master/code-review)
