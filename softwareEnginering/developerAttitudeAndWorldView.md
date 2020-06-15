Open question to developers
We currently have a blanket policy that every commit requires approval
I’ve been working on some internal tools for our team.
My use case is I’ve been attempt to build and refine an automated process to deploy code to our environments. I’ve done my best to test code beforehand, but my local environment is not the servers we are deploying to. This has lead to lots of very small corrective/experimental comments. Each time requiring approval. Each time disrupting the focus of the rest of team. Repeatedly. Every day as I work on this project.
The current approval process for my use-case is too heavy and could be removed.
I’m not saying that the code never gets reviewed. All code should be reviewed. But this can be done at a later date.
I can understand 2 approvers + for our customer facing products etc. With internal-tools our team are the users.
If there is a problem we have the skills to identify and fix it. A typical end user cannot do this.
In the worst possible case, we can roll back to a known working commit hash. This will take minuets.
I would like to propose that the number of approvers be allowed to be zero for internal-tooling repos.
(We should still have a review process to review code)
Am I a dangerous maverick? Or does this idea make sense?
Thoughts?

---

They could not see why this would be needed.
Just quoted 'use tags' 'have tests'

They can't cope with a idea that is not the estblished norm
No approval to master for internal tools
Silo deliberately
Pair program

---
(SEPARATE NOTE)
Same across life
People couldnt cope with blacks being equal in socity
Books/novels were seen as addictive and 'corrupting' to the youth
People coul'nt cope with same sex marrage

If you suggest something different to the social norm, people struggle to fit their worldview around it
Overton window compression - window of discorse
Normalicy compression

