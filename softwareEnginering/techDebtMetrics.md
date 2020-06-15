
tech debt

Users
Business
Development
Platforms


Business 'Code Quality' Quantification Tool
Python caclulator
safe mathmatical eval - https://stackoverflow.com/a/9558001/3356840

config
  title
  categories: type:str:{
    {score, desciption, notes}
  formula: str (to be math_evaled) [could be list (to compare)]
GET all list/summary score -> link to single (or +new POST/PUT) [-remove DELETE]
  see html output
GET/POST single_item config.yaml to FORM
  output json data (single)
  update item in all list
  single item:
    url: jira (id unique?)
    title
    date
    scores {
      type: {score:int, human_description:str}
    }
    score:int(0 to 100ish?)
Module
    calculate_single: _config.yaml + item data -> single
    calculate_batch: _config.yaml + items -> [single]
    diff batch: data_old(sort), data_new(sort), rank_diff
    --update ticket score
    stats
    spreadsheet output (with formulas, rank and comments)
    csv output
    html output?
     - hoverover? or reveal of descriptions?
    markdown summary?
     - https://pypi.org/project/md-to-html/
http://localhost/config/item/()


User impact:
Little to no user imact
Service flow cosmetically affected
Service flow slightly degraded/disrupted
Service flow suverly draded
Services flow not operational but recoverable
Services flow unrecoverable (dataloss)

Service/Business Risk: Consiquences
There is no impact on the business
The impact is cosmetic or not ideal but still functions
The business some non essential business functinality is impacted
The business's core service is impacted
The business cannot continue to function (datalosss)

Workflow effectivness:
Development/testing workflow is not affected
Development/testing workflow is impared but has workarounds
Development/testing workflow is suvearly imacted
Development/testing is not possible

Manual Interaction:
No need for manual interaction or decision making
Needs manual oversight but not direct action
Needs manual interaction sometimes
Needs manual interaction regulary
Needs manual interaction most of the time
Needs manual interaction constantly every day

Maintainability: (ability to make changes)
It does not affect maintainability
Its an annoyance when working with our codebase
It slows us when working on some of our codebase, some risk or loss of confidence
It is hard/risky to work on a subset of our services features
It is not possible to maintain a subset of our services/features
It is not possible to continue any development

Data Integrety/Security:
Our data is unaffected
Our data could be inconsistent/misused but is benine
Our data is inconsitent and have further impact
Our data is damaged but is recoverable with time/effort
Our data is lost/currupted and is difficult to recover fully

Running Cost?:
It does not affect the costs of our services
It slighlty affects the costs of our services
It is haveing a notciable impact on the cost of our services
It is having a significant impact on the cost of our services
The business will be unable to afford the costs

Intelegence/information:
We can observe and measure the consequences and have adiqute infoamtion to take corrective action
We know about the issue but lack detail in taking action
We can observe the consequences but have little detail to take action
We have difficulty understanding the impact consiquences and are activly impared from taking action
We have no idea

Unknowns:
All of the paramaters/behaviour are know
There are some unknowns
There are lots of unknown
We have no clue how deep the rabbithole goes

Compound interest:
It remains consistent
It gets slightly worse as time goes on
It gets progressivly worse over time
Our workflow/service will become unuseable in a relativly short timeframe

Magnitude:
It rarely affects anyone
It affects a small number of people
It affects a whole department/group
It affects most people in the organisation
Impacts everyone

Frequency?
It has never happened
It could happen eventually
It may happen
It will happen eventually
It will happen soon
It's happening now
