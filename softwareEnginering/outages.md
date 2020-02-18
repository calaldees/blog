You want metrics of ‘uptime of our services’ and data on service outages.
I would like to make some suggestion as to what data we could capture and why.

 
---
 
Type of outage
Unavailable/Critical
Degraded functionally
Degraded cosmetically
 
We need to categorise the outage.
Some services may be technically ‘operation’ but in a degraded state.
One service may be overloaded and effecting the throughput of the system overall.
We may be running with a cluster of 3 servers rather than our normal 9

One service/subcomponent that only affects a certain type of request/functionality may be down

How do we categorise the outage?
Is ‘one broken subservice’ unavailable/critical? If we fix it within 3 hours how much damage is done? If job/unit take 24 hour to process, a 3 hour delay is not a problem? How do we quantify the outage? ‘Number of disrupted users/jobs/units * hours of delay’?


Unit of the system?
What are the business subcomponents we report on?
 

Affect area - Number of users/jobs/units affected
 
A multiple day outage during a quiet period may only affected a small handful of jobs/users/units.
If this had been at peek/critial time this would have been critical.
Number of users/jobs/units seems like an important measure of impact.
 
 
 
Time (with accuracy of? 1 min? 5 min?)
Start
Report/Action
Restored
Recovered

I think there is a necessary need to have a separate ‘restored’ and ‘recovered’ states. E.g:
We recovered our service after the outage but because multiple jobs had fail, they needed to be manually identified and rerun. Only once all the failed/disrupted jobs were restarted could the incident be considered ‘recovered’.
A deployment may fail and be rolled back. What happens to our uptime stats
The time to put the technical fix in place and ‘restored’ the service is distinctly separate from the service being ‘recovered’.
