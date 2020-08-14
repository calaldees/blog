Focused Retrospectives
======================

Good retrospectives are the foundation of making positive change.

Retrospectives that are conducted poorly leave teams frustrated and unmotivated.

Pre-requisites for a Sprint Retrospective
-----------------------------------------

It is impossible to reflect on performance if you
* Do not have a sprint goal
* Do not have a way to measure performance
The concepts for 'Retrospectives with value' are ONLY useable if ticket complexity is sized and a sprint is planned.

### Have a sprint goal/title
* Define the core requirements/ticket/deliverables for the sprint to be a success
    * The overall goal of having sprints is to have predictable delivery
* Define stretch tasks to prevent lost time

### Reminder on ticket sizing
* As a team; we normalize in our ability to size the complexity of tickets
    * We use *complexity* and not 'days' because as our tooling improves and as our codebase gets healthier, we should see an increase in velocity
* We compare the *complexity* of the tickets we size to older tickets of the same size to ensure they are comparable We size consistently
* We use the fibonachi sequence (as the bigger a task is the less accurately we can predict it)
* We do not bring tickets into a sprint if they have not been sized
* We do not size bugs
    * The business has already paid the cost/points for the feature
* The team have been involved in sizing tickets and so should have knowledge of upcoming deliverables/direction

Concepts to give Focused Retrospectives
---------------------------------------
* Present one simple slide
    * Sprint goals delivered (yes/no) (tickets are not goals. Goals are like a title/objective for the sprint)
    * *'Points delivered' per 'available engineer day'* (this is important as it takes into account changing team size, holidays and shorter sprints (like Christmas and bank holidays))
        * This could be an automated process (we know holidays, team members and tickets delivered)
        * More ideas at [Measure team performance with a sprint score](http://agilebatman.com/2020/06/measure-team-performance-with-a-sprint-score/)
* Feedback/points/comments should be focus/restricted-to sprint deliverables
    * The team should focus/problem-solve about elements that are within their control that relate to team deliverables
        * Why did we not complete this ticket?
            * Did we miss-size it?
            * Was there a part of our existing codebase we lacked understanding about to make a correct sizing call?
            * Did we take on too much?
            * Did we spec it with enough detail? (note: the team are responsible for speccing tickets and the team should not allow tickets to enter a sprint if they are insufficiently specced) We were blocked by 3rd parties? Why? Can we incorporate that into future planning
            * Did we find bugs too late in the process?
            * Did we find merge/conflict issues too late in the process?
            * Were we working on tickets that overlapped in code footprint?
            * We were distracted; Our dev servers needed manual maintenance: had to be rebooted 3 times because of disk space issues
            * It took 3 days to review the ticket because everyone was so busy
    * Consequences of not having feedback/points/comments focused on deliverables, (e.g. Just ask "What was good, what was bad" you'll get the following responses)
        * Unhelpful: The room is too warm/cold. The toilet leaked, the weather is dark and miserable
        * Not immediately actionable: The office is too noisy, the business doesn't trust our judgement
        * There should still be space in retrospectives to voice non-delivery related concerns. They are important, but they should also be separate to reflections on deliverables.
    * If there were unexpected events or sprint scope adjustments, where did these come from? How can we predict/handle these in future?
    * Team should be asked to raise upcoming blockers/challenges for any upcoming sprint deliverables (The team are aware of this as they have been involved in ticket sizing).
* The team must have the *autonomy/power/time to make changes to their process*
    * The team must feel empowered/able to action suggestions made in retrospective
        * The responsibility for change is not the business's - it's your team
            * Without responsibility/autonomy, retrospectives have no meaning or purpose because nothing can be actioned
    * JIRA Flows (for team)
        * Teams must be able to explore working tools/methods/flows
    * Physically change their working environment
        * Rearrangement
        * Purchase new furniture (sofas? standing desks?)
        * Boards/Walls/Whiteboards
    * 10% of team time allows to be self directed (see Hack Time)
        * To resolve ongoing blockers
        * To action tasks identified in the previous retrospectives
        * If every decision about developers use of time is prescribed/sanctioned by the business, developers will resent the overly oppressive control
        * If you don't give teams any time to make changes and all work is focused on sprint deliverables, teams will not be able to action any improvements.
            * (it's so obvious but sometimes management does not understand this concept)
    * Briefly reflect on the performance/issues of the previous 3 or 4 sprints
        * Identification of longer term patterns (widen the lens)
    * Briefly compare the current sprint to the same sprint '1 year ago'
        * This is re-affirmation that things HAVE changed. Most teams chuckle and reminisce "Do you remember when we had to keep doing that?!"

A few ground rules to make retrospectives positive
--------------------------------------------------
* When we fail, *we fail as a team*
    * We had a bug: The developer missed it, The code reviewer missed it, the tester missed it, it was missed in the ticket spec. We all failed.
* No judgment is ever to be given to individuals
* Retrospectives MUST be a safe place for everyone to express things openly
* Did the team-member take down the servers because of lack of training or lack of documentation? Could the process be automated to reduce error?
    * Even if a single toxic/weak employee continues to cause issues, they are still the team member the team has to work with. It is a business responsibility to deal with these employee's, not the team.
* We identify issues to consider solutions
* The team own their own process

Tooling
-------
* Hand written notes, post-its and whiteboards are difficult to track/manage as they would require transcription to a digital form to be effectively tracked/processed effectively
* We should use digital collaboration tools
* We should use these tools in a structured way. (e.g red to denote blockers, yellow or a shape for suggestions, etc). This will assist with exporting and semantic meaning. The data from these digital tools should be exportable in a portable format
* We can use the statistics in scripts, tracking in spreadsheets, etc