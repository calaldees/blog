Code Quality Metrics
====================

As a
Business
We want
To have a quantitative measure of the technical debt of our projects
So that
We can make informed decisions about applying our engineering resources effectively

Technical Debt is a deep and complex subject.
We know that if we do not address technical debt our business/product will fail to be cost effective.

References
----------
There are suggestions of how to crudely measure technical debt
* http://thinkapps.com/blog/development/technical-debt-calculation/
* https://dzone.com/articles/what-technical-debt-it-and-how-to-calculate-it
[Managing Technical Debt: Reducing Friction in Software Development](https://www.amazon.co.uk/gp/product/013564593X/)
* https://realpython.com/python-code-quality/
* [The #1 bug predictor is not technical, it's organizational complexity](https://augustl.com/blog/2019/best_bug_predictor_is_organizational_complexity/)
    * Precision and recall

The important factors for a technical debt metric
-------------------------------------------------

* Automatically generated (removes human opinion)
* Have a relative and comparable number to identify projects that need attention
* This metric is a 'rough guide' and will not be 'the whole story'

The purpose of this ticket is to get an initial metric as a demo/proof-of-concept that could be identified as good practice that could be transferred in other projects.

Measuring technical debt is a business/domain specific task. It is not possible to 'buy' a complete ready made tech debt analyser.

Collectable Metrics
-------------------

We could include

* Code Metrics
    * Cyclomatic complexity
        * Count of 'If statements', 'return statements', 'exception cases'
    * Maintainability Index
    * Coupling
        * How many dependencies between modules
    * Dependencies
        * External libs + depth
    * Linting rules
        * We can measure code quality with layout/structural rules
        * Portability (python3 warnings?)
* Test Coverage
* Code Churn
    * Measures the number of changes in version control of a module
* Performance
    * Load test and measure to a known threshold?
    * API endpoint benchmark?
    * Pipeline throughput?
* Infrastructure/Process
    * Time for all tests to run (ratio of cloc)
    * Time for ticket from in-progress/sprint to live
* Bug backlog (cumulative size of all outstanding bugs)
    * Bug weight (see separate document for 'triage of bugs' and assigning business weight)
        * The criteria could be attached in the form of metadata on tickets for accurate recalculation
* Monitoring
    * Service outage time (%uptime over 3 months?)
    * errors in live (relative to request?)
    * Size of processing queue?
    * Number of manual interventions
* Organizational Complexity
    * Number of developers worked on a module
    * Team size
    * (see reference above for detailed description)

All the metrics should be

* Relativity language agnostic
* Relative to the projects size (cloc) and age

These metrics should be combined with a formula/weighting that corresponds to the current business objectives. The business logic to weight each metric should be transparent and conveyed clearly.

Imagine being able to present a 'Tech Debt' number as part of each sprint retrospective. We could see the value change and reflect on it.

This metric is a ROUGH INDICATOR. It is not the whole story. I can write code that looks good in code metrics but is utterly unmaintainable and unfit for purpose.

Implementation Notes
--------------------

* We should consider a downstream CIjob that takes output from code-coverage, linting, maintainability-index, cloc, project-duration and gives us a tech-debt metric (maybe a % ?)
* We probably want a mini-sub-repo to mux/perform these calculations.
    * If it is a separate repo then we could theoretically use this calculator for other projects.

Technologies/Libs/Services/Packages
-----------------------------------

* Monitoring services
    * DataDog https://www.datadoghq.com/
    * https://github.com/prometheus/prometheus
* Python Code analysers
    * https://github.com/klen/pylama
        * https://pypi.org/project/pylama/1.4.0/
    * https://pypi.org/project/radon/
        * https://radon.readthedocs.io/en/latest/intro.html#maintainability-index
        * https://martin-thoma.com/testing-python-code/#radon
    * https://pypi.org/project/pynocle/
    * https://www.sourcemeter.com/resources/python/

Other References
----------------

* [The Original Sin of Software Metrics](https://www.infoq.com/articles/metrics-original-sin/) - Metrics are not everything
* Visulisation of code [nDepend](https://blog.ndepend.com/mythical-man-month-10-lines-per-developer-day/)
* [Don’t (guess)timate your projects, forecast with confidence](https://www.reaktor.com/blog/forecasting-method/)
* [Measure team performance with a sprint score](http://agilebatman.com/2020/06/measure-team-performance-with-a-sprint-score/)

* [Goodhart's law](https://en.wikipedia.org/wiki/Goodhart%27s_law)
    * > When a measure becomes a target, it ceases to be a good measure.[4]