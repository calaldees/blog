Hack Time
=========

Developers traditionally spend their time directed towards implementing features for the business.
The concept of 'Hack Time' is to allow developers to 'self direct' 10% of their time.

What would developers use 'Hack Time' for?
------------------------------------------
* Allows developers to create internal tooling that could have efficiency gains for the whole team (and beyond)
    * Sometimes when working with our systems we create scripts and shortcuts for common operations. Conventionally these are informal and many developers duplicate efforts
    * Internal separate mini repos for tools
        * No business process to make changes
        * They are all version controlled and the developers/team are the users
        * Developers are all capable of rolling a hash back or talking to each other
* Allows developers to learn + experiment with new tools and are encouraged to knowledge share their findings/journey with the rest of the team/business
    * Previous hacks have demoed upcoming technologies that have then been adapted into main-steam tooling use (e.g containerisation and css3 layouts)
* Allows developers to prototype proof of concept ideas
    * Sometimes we don't know if an idea would work, or have difficulty getting buy-in from further stakeholders because they can't visualise the benefit of a potential feature
    * Developers can branch and demo a prototype feature to the team
* Allow developers time to write blog posts
    * These boost our engineering perception (we are publicly visible and active)
    * Individuals get credit/identified for their thoughts and work
    * Documents and share knowledge though-out the business (rather than a one off talk)
* Allow developers time to gather statistics/info to gain further insight into their process's
    * e.g previous hacks have included parsing log files into logstash/kibanna and visualising Jira/commits/other
* Strong developers can demo new/powerful/upcoming technologies
    * Knowledge share upskills whole team

'Hack Time' creates a high performing culture
---------------------------------------------
* Developers feel personally invested by having the freedom to work in an area that interests them rather than being told what to do 100% of the time
* Developers can progress their knowledge base rather than being trapped in their role
* Developers can be a vital think tank to explore new ideas the business may not have been aware of
* Developers individualism is identified and visible (rather than just always implementing what the business ticket describes)
* Teams that have a culture of creating and sharing (via passive peer pressure) encourage everyone to explore and contribute
    * Non contributors are immediately visible
* Create focused engagement (e.g. Friday afternoon, orderly concentration would wane/wonder)
* The business may be unaware of process's/workflows that are difficult. This allows/incentivise developers space to correct these issues and make business efficiency gains
* Sharing/Demoing programming techniques/case-studies upskills the whole team (Some might consider this to have already been covered but other business knowledge-share initiatives, but is here for completeness)
* Hack presentations could provide a regular forum for normally separate technical teams to interact. This ongoing team-building strengthens business communication.

Summary of Benefits
-------------------
* Increase developer engagement
* Provide business with 'ThinkTank' of exploitative ideas
* Publicly raise the profile of the development team
* Incentivise growth/change to allow more efficient working
* Presentations provide a forum for inter-technical-team building/communication

How
---
A possible model:

* Friday After Lunch
    * Team demos (A vital component)
        * We all gather and team members present if they have something to present
            * E.g in a team of 12 people you would expect a normal minimum of 2 informal presentations a week
        * Presentations should be relaxed and informal
    * Team update
        * Team members give a 30second verbal update of what they will be using their hack time for
        * Team members without a plan can pair with others or are directed by the team to possible areas of investigation
* Friday Afternoon
    * Hack time!
        * An efficient use of (sometimes, a less productive) time

### Caution

* If Hack Time is placed within normal sprint time, there is a tendency to use Hack Time for completing sprint tickets. Placing Hack Time in-between sprints could alleviate this.
* It is often tempting for developers to keep focused on the flow of their business work. This should be discouraged:
    * These developers interupt hack time by requesting code-reviews etc from the others
    * This can reach a tipping point where a team does not engage with hacktime and becomes the norm
TODO: REWORD BELOW
* Requires
    * team buy-in
    * business buy-in
        * can show it values hacktime by turning up to demos and questioning/identifying sprint work in hacktime
* business/team can ask for hacktime plans as part of standup


Examples of previous 'Hack Time' projects
-----------------------------------------
(Some of these may not be related to your business domain but serve as example case studies)
* A visualisation of logs. Taking IP address of request and geo-locating them (with local cache). Visualising them on a google map as a heatmap
* Using AI tools to voice recondition audio from news radio station. Then using Microsoft cloud sentiment analysis to get the sentence meaning. Then using image search for those meanings/topics. This created automatic visual companion for audio snippets for social media. This saved content creations a huge amount of time
* Explored new methods for frontend web testing (beyond Selenium Cypress)
* A 404 crawler to identify 404's on our public sites
* Bookmarklet to automatically take content editors to the relevant admin page (saved editors lots of manual minuets searching for content)
* Hidden easter-egg beatbox sample player for a mobile app (designed to raise social engagement)
* Exploring containerisation and demoing services running in containers (evolved to become the normal development tooling)
* Created scripts to perform common operations (like create user accounts)
* Process's for speeding up database dump time (when restoring SQL dumps, used a REGEX to skip tables irrelevant to development, sped up restore time from 30min to 3min)
* A 404 page that was a 3D Globe of spinning content designed to bring users back into the site
* ConfigMerger tool (taking configuration from multiple sources to create a single config file)
* Demoed cool language features to the rest of team (lru_cache, reduce, translation strings, alternate orms, hot loading of python modules, multiplex of multiple queues)
    * Demo of Transducers https://maksimivanov.com/posts/reducers-vs-transducers/

Summary
-------
Your developers are 'problem solvers'. Let them off the leash, give them structured space and allow them to solve your business problems and grow.

Beyond Hack Time Hack Days
--------------------------
Some companies value Hack Time so much.
They set aside entire days to get developers to be a ThinkTank around a particular business problem or theme.
This allows multiple teams to team-build across departments/disciplines while creating business value.
Some companies even open these up to external contributors to create an active public image and get external perspective on their problems.
This in turn facilitate our engineers being invited to other company's hack days (in a similar business domain) and raising the profile of our company/engineers.

Hack-time -> External Dev Meetups
---------------------------------
* Attending 'External Developers Meetups' should be part of expected business outreach strategy
* Developers are visible in the community _our company have some great developers_
* Our developers get valuable insight into usecases and new technologies from other problem domains.
* Developers can passively evangelise our workplace and form part of recruitment strategy.
    * (This does not mean wearing branded t-shirts and only giving presentations about work projects. Other developers can smell this business bullshit)
    * Dramatically reduces recruiter costs
    * Typically yields a higher grade of passionate developer (rather than people just looking for the next job)
* Allow developers to trade an 'afternoon of hack-time' for an 'evening at a developer meetup'
    * Some developers have families and other personal commitments
    * To be an inclusive employer we should not limit developer growth to mandatory personal time

Problems with 'Hack Time'
-------------------------
* Some developers use this as an opportunity to implement their own business features and direct the business efforts
    * A developer could claim that a feature created in hack-time is 'finished' and should be merged/used
    * This is NOT the purpose of Hack Time
    * The decision should always be with the business. New business features should always go though the business specification process

Further Reading
---------------
* [Was 20% time a good policy for Google's working culture?](https://news.ycombinator.com/item?id=25397339)
* [Learning at work, is work](https://sloanreview.mit.edu/article/learning-for-a-living/)
* [My Love And Hate Relationship With Hackathons](https://www.devsurvival.com/my-love-and-hate-relationship-with-hackathons/) - Reasonable summary of hack days