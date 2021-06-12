Modern Computing and the User Experience
========================================

I was assisting a friend remotely with some coding tasks.
(pretty impressive that modern tech allows that incredible feat!)


Problem description
--------------------

They went to load an application and it would not start. This was a [critical application][1] required by their workplace. Why would such a core component not load? This was a _managed_ machine. The application (like all modern applications) checks online for an update and had prompted the user upgrade. A fairly normal occurrence. But this application needed admin rights to install and had previously been installed as a managed application. The new install was not a vetted executable and screamed about requiring admin access, which the user did not have. Don't worry, let's install the _sanctioned_ older version back with the company managed installer. The original version failed to start because the state of the users config on disk had been half mangled by the newer version. It asked if it wanted to _factory reset the user settings_. Seems reasonable. So we get an indeterminate progress bar, that cycled, for an hour ... this operation isn't going to complete is it? We had no way of diagnosing what was wrong because there was no additional output.


Commentary
----------

The root cause of this issue is _Lack of trust of the user_. Modern computers treat the user as if they can't operate their machine.

1. 67 applications on my system should not be independently checking for updates. STOP THIS!
    * This is a potential security issue. Each application should not have install writes to modify it's code by default. This should not be expected behaviour. Every application should not need internet access to scream constancy at me. It's not convenient. It's probably not needed now this second, I'm using my computer to actually get shit done right now, I don't want another dialogue fucking with my day. This is another barrier for armature users.
    * Applications do not trust you to manage your own system
2. When you are performing an _indeterminate duration_ operation, give the user some feedback as to what is going on. What operation is currently being performed? It's my computer that is running the software I have chosen to run. If you tell me what you are doing, when the application inevitably fucks up at least I have a fighting chance of working out what went wrong.
    * Applications do not trust you to understand they are doing. They are happy to misdirect you.
3. Let me downgrade. This should be tested and normal operation. In fact, let have the choice of which version I can run.
    * Applications force you to move in a mandated direction. If ever you deviate from this path you'll be punished by explosions.
4. Managed applications should not be able to have their configuration corrupted. If these applications are to managed, ensure the managed application do not check online for it's own updates. It's a managed application.


Recommendations
---------------

Stop designing software that disempowers users.
It's my computer and I have control of what my machine does.
If we keep treating average computer users as idiots we are preventing them from growing.
Let's end this plague of every applications _phoning home_ to strong-arm you by force to upgrade (even when you're on mobile data). It's a threat to privacy and security and is a blight on the users experience.



[1]: Docker
