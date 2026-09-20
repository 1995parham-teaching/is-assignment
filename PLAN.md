# Fall 2026 Plan

What the assistant team is expected to produce this term, and what state each assignment is in today. This is the first run of the course, so most of the work is writing rather than revising. Open a pull request against the issue that tracks the assignment you are working on; see [CONTRIBUTING.md](CONTRIBUTING.md) for how to write one.

## Team

| Assistant | GitHub | Role | Joined |
| --- | --- | --- | --- |
| Roza Ganjipour | [@Rozagp](https://github.com/Rozagp) | Coordinator | Fall 2026 |
| Amirhossein Motaghian | [@amirhossein2831](https://github.com/amirhossein2831) | Assistant | Fall 2026 |
| Mehrdad Sheikhabbasi | [@MHRSHAB66](https://github.com/MHRSHAB66) | Assistant | Fall 2026 |

Amirhossein also assists on [ie-assignments](https://github.com/1995parham-teaching/ie-assignments), where he is the coordinator, which makes him the link between the two courses.

**The coordinator is the team's point of contact**, not a second instructor. They watch the open issues, chase an assignment that has been sitting, and bring a decision to the instructor rather than waiting for it to be noticed. Review and merge stay with the instructor, and so does anything that changes what a student is asked to do.

## What is in the repository

Homework and hands-on work together are 30% of the course mark, and the syllabus deck is explicit that the hands-on work is where the material lands. Both assignments below are **seed material**: written from the lecture topics to give the repository a starting point, never handed to a class. Read one before you set it.

| Assignment | Follows lecture | State | Proposed owner |
| --- | --- | --- | --- |
| [`crypto-toolbox`](src/crypto-toolbox) | 3 — Cryptography | Seed, needs review and a deadline | Mehrdad Sheikhabbasi |
| [`web-hardening`](src/web-hardening) | 6 — Web Security | Seed, needs review and a deadline | Roza Ganjipour |

Owners are a proposal from the instructor, not an assignment of blame — swap them between yourselves if the split suits you better, and say so on the issue.

## Before anything is handed out

Both assignments already carry the right term (`پاییز ۱۴۰۵`) and both close with `\قوانین`. What they lack:

- **Neither sets `\مهلت`**, so no cover page states a deadline. The instructor sets the dates; the owner puts them in the source.
- **Neither has been read as a handout.** Seed text written from a lecture topic is not the same as an assignment a class can do in the time available. Check that the tasks are doable, that the marks in `\نمره` add up the way you want, and that the hints say enough.

## Gaps

Seven lectures, two assignments. Nothing here follows these:

| Lecture | Note |
| --- | --- |
| 1 — Introduction | Vocabulary only; an assignment is probably not worth it. |
| 2 — Security Architecture | Risk management and incident response suit a written exercise rather than a hands-on one. |
| 4 — Access Control | The four A's, the models, passwords and biometrics. A strong candidate for the next assignment. |
| 5 — System and Software Security | Memory safety draws on [c-lecture](https://github.com/1995parham-teaching/c-lecture); malware and host defences are hands-on material. |
| 7 — Network and Transport Security | Firewalls, zoning and segmentation. Watch the lab rule here especially. |

Confirm the scope with the instructor on an issue before writing a new assignment — a first run does not need seven of them.

## The lab rule is not boilerplate

Half of this subject is offensive technique, and the course promises students in lecture 1 that every exercise runs against their own machine or a target the course provides. An assignment that asks a student to attack must say so in the handout itself, must say what doing the same to someone else's system means, and must ask for evidence of the weakness rather than a working exploit against a live service. [`web-hardening`](src/web-hardening) shows the shape: a `نکته` callout, before the first task. CONTRIBUTING.md states this as a rule; it is repeated here because it is the one that costs a real person something if it is skipped.

## Related

- [is-lecture](https://github.com/1995parham-teaching/is-lecture) — the course itself, and the syllabus deck that fixes the grading and the policies
- [is-exam](https://github.com/1995parham-teaching/is-exam) — midterm and final
- [ie-assignments](https://github.com/1995parham-teaching/ie-assignments) — the same machinery for Internet Engineering
