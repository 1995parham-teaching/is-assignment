# Information Security Assignments

[![build](https://github.com/1995parham-teaching/is-assignment/actions/workflows/build.yml/badge.svg)](https://github.com/1995parham-teaching/is-assignment/actions/workflows/build.yml)

Assignments for **Introduction to Information Security**
([is-lecture](https://github.com/1995parham-teaching/is-lecture)). Each
assignment is a folder under `src/` and builds to its own PDF.

| Assignment | Lecture it follows | What the student does |
| --- | --- | --- |
| [`crypto-toolbox`](src/crypto-toolbox) | 3 — Cryptography | encrypts a file, tampers with it, and tells apart confidentiality, integrity and authenticity by doing them |
| [`web-hardening`](src/web-hardening) | 6 — Web Security | finds and closes real weaknesses in a small web application |

Both are **seed material**: written from the lecture topics to give the
repository a starting point, not handed out to a class yet. Read one before you
set it — in particular the deadline, which no assignment sets.

## Teaching assistants

**Fall 2026 (پاییز ۱۴۰۵)**

- Amirhossein Motaghian ([@amirhossein2831](https://github.com/amirhossein2831))
- Mehrdad Sheikhabbasi ([@MHRSHAB66](https://github.com/MHRSHAB66))
- Roza Ganjipour ([@Rozagp](https://github.com/Rozagp))

What the team is working on this term, and the state each assignment is in, is in [PLAN.md](PLAN.md).

## Reading the assignments

Built PDFs for the current `main` are attached to the
[`latest` release](../../releases/tag/latest) — no TeX toolchain needed.

## How to build?

Built with [TeX Live](https://tug.org/texlive/) (XeLaTeX, driven by `latexmk`)
and [Pygments](https://pygments.org), which `minted` shells out to for code
listings. **TeX Live 2023 or newer is required.**

| Platform | Install |
| --- | --- |
| macOS | `brew install --cask mactex-no-gui` (or [MacTeX](https://tug.org/mactex/)) |
| Debian/Ubuntu | `apt install texlive-full latexmk python3-pygments` |
| Arch | `pacman -S texlive texlive-langarabic texlive-latexextra python-pygments` |
| Any | [`install-tl`](https://tug.org/texlive/acquire-netinstall.html) with `scheme-full` |

```bash
make            # build every assignment into build/
make list       # list the assignments
make clean      # remove build artefacts
```

Or, without installing a TeX distribution — this is also what CI runs:

```bash
docker run --rm -v "$PWD":/work -w /work texlive/texlive:latest make
```

## Writing an assignment

See [CONTRIBUTING.md](CONTRIBUTING.md). The short version — create
`src/<name>/main.tex`:

```latex
\documentclass{../is-assignment}

\عنوان{یک عنوان خوب}
\ترم{پاییز ۱۴۰۵}
\مهلت{۳۰ آبان ۱۴۰۵}

\begin{document}

\عنوان‌ساز

\فهرست‌مطالب

\قسمت{...}

متن تمرین ...

\نمره{۴}

\قوانین

\پایان‌ساز

\end{document}
```

`\قوانین` prints the course rules — where to hand in, the late policy, what
counts as your own work, what is allowed with AI tools, and what grading looks
at. The wording lives in `is-assignment.cls`, so it cannot drift between
assignments.

## The shared look

The palette, fonts, sectioning, listings, callout boxes and marks come from
[latex-templates](https://github.com/1995parham-teaching/latex-templates),
pulled in under `latex/` as a git subtree; `is-assignment.cls` adds only the
cover page, the course rules and this course's violet accent. To pick up a
later version:

```bash
git subtree pull --prefix latex \
  git@github.com:1995parham-teaching/latex-templates.git main --squash
```

## A word on the exercises

The web assignment asks students to attack something. Every one of them says,
in the handout, that the target is their own machine. Keep it that way: an
assignment that sends a class looking for a live target is a different kind of
document, and not one this course hands out.

## Related

- [is-lecture](https://github.com/1995parham-teaching/is-lecture) — the course itself
- [is-exam](https://github.com/1995parham-teaching/is-exam) — its midterm and final
- [ie-assignments](https://github.com/1995parham-teaching/ie-assignments) — the same machinery for Internet Engineering
