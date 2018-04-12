# strace-poc

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [The Problem](#the-problem)
* [A Potential Solution](#a-potential-solution)

<!-- vim-markdown-toc -->

## The Problem

I've been interested in software supply chain security for some time now. This
is the very early beginnings of my research in this space.

Some researchers have discovered and demonstrated how malicious 3rd party
packages can be snuck in by different means.

For example, a bunch of NPM packages were removed from the pubic registry by the
author, which caused software builds across the world to fail. But, the problem
didn't end here. Some opportunistic malicious actors published modified versions
of these packages with identical names. When downloaded by developers, these
malicious packages would execute code controlled by the attackers, such as
exfiltrate data, run coin miners, create backdoored channels with C&C server, or
even `rm -rf /`

See
[my blog article](https://github.com/petermbenjamin/blog/wiki/2018_04_12-Mitigating_Against_Malicious_3rd_Party_Packages)
on this for more details.

## A Potential Solution

* Detonate untrusted package/code in a container
* Collect all syscall activities (e.g. read, write, network connections ...etc)
  inside the container
* Analyze data for suspicious or undesired behavior
* Ultimately, production software running inside containers can be limited to
  only perform what it is allowed to perform via `seccomp`, `apparmor`, or
  SE-Linux profiles
