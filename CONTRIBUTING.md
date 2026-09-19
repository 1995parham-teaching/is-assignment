# Contributing

This repository holds the assignments and projects of the **Introduction to Information Security** course. Teaching assistants author assignments here; students receive the built PDFs. Please read this document before your first assignment, and [PLAN.md](PLAN.md) for what the team is working on this term.

## Prerequisites

- **TeX Live** with XeLaTeX and `latexmk`. `scheme-full` is the least painful
  option; with a smaller scheme you need at least `xepersian`, `minted` and
  `fvextra` (`tlmgr install xepersian minted fvextra`).
- **[Pygments](https://pygments.org)** (`pip install Pygments`) — `minted`
  shells out to `pygmentize`, so builds fail without it.

If you would rather not install a TeX distribution, use the same image CI uses:

```bash
docker run --rm -v "$PWD":/work -w /work texlive/texlive:latest make
```

The fonts live in `fonts/` and are picked up automatically; do not install them
system-wide.

## Building

```bash
make            # every assignment
make list       # what is in the repository
make clean      # remove build artefacts
```

Each assignment is written to `build/<assignment-name>.pdf`. `latexmk` runs from `src/`, which is why assignments refer to the class as `../is-assignment` and the class refers to the fonts as `../fonts/`. Keep those paths as they are.

To build a single assignment while you iterate:

```bash
make build/crypto-toolbox.pdf
```

CI runs `make` on every pull request in the TeX Live container, and publishes
the PDFs of `main` to the [`latest` release](../../releases/tag/latest).

## Adding a new assignment

1. Create `src/<assignment-name>/main.tex`. Use kebab-case, and name the
   directory after the topic, not the semester — for example
   `backend-http-monitor`, not `project-2-fall-1405`.

2. Start from this template:

   ```latex
   \documentclass{../is-assignment}

   \عنوان{یک عنوان خوب}
   \ترم{پاییز ۱۴۰۵}

   \begin{document}

   \عنوان‌ساز

   \فهرست‌مطالب

   \قسمت{مقدمه}

   ...

   \پایان‌ساز

   \end{document}
   ```

3. Build locally with `make`, check the PDF, and open a pull request. The
   `Makefile` discovers `src/*/main.tex` on its own — there is no build
   manifest to keep in sync.

### Document metadata

| Macro | Required | Meaning |
| --- | --- | --- |
| `\عنوان{}` | yes | Assignment title, printed after «تمرین» on the cover |
| `\ترم{}` | yes in practice | Academic term, e.g. `پاییز ۱۴۰۵` |
| `\مهلت{}` | recommended | Submission deadline, printed on the cover |
| `\تحویل{}` | no | Where the work is handed in; defaults to the course GitHub repository |
| `\درس{}` | no | Course name; defaults to «مبانی امنیت اطلاعات» |

`\ترم` is optional only in the sense that the class guesses the current term
from the build date and emits a warning. **Always set it explicitly** — otherwise
the cover page changes meaning depending on when someone rebuilds the PDF.

### Common macros

The class loads [XePersian](https://ctan.org/pkg/xepersian) with `localise`, so
the usual sectioning commands have Persian names:

| Macro | Purpose |
| --- | --- |
| `\قسمت{}` / `\زیرقسمت{}` | section / subsection |
| `\شروع{شمارش}` … `\فقره` … `\پایان{شمارش}` | numbered list |
| `\شروع{فقرات}` … `\فقره` … `\پایان{فقرات}` | bulleted list |
| `\متن‌لاتین{}` | inline Latin text (use it for every English word) |
| `\متن‌سیاه{}` | bold emphasis |
| `\تارنما{url}{text}` | hyperlink |
| `\پانویس{}` | footnote |
| `\شرح{}` / `\برچسب{}` / `\رجوع{}` | caption / label / reference |
| `\نمره{۲}` | the marks a part is worth, as a badge |
| `\شروع{نکته}` … `\پایان{نکته}` | a note callout |
| `\شروع{راهنمایی}` … `\پایان{راهنمایی}` | a hint callout |
| `\شروع{امتیازی}` … `\پایان{امتیازی}` | a bonus callout |

Code listings are `minted` inside a `latin` environment:

```latex
\begin{listing}

\شرح{نمونه‌ای از یک تابع}
\برچسب{قطعه‌کد: نمونه‌ای از یک تابع}

\begin{latin}
\begin{minted}[bgcolor=Black]{go}
func main() {}
\end{minted}
\end{latin}

\end{listing}
```

### Policies

Close every assignment with `\قوانین`, right before `\پایان‌ساز`. It prints the
course-wide rules — where to hand in, the late policy, what counts as your own
work, what is allowed with AI tools, and what grading looks at — from one place,
so they cannot drift apart between assignments. The wording lives in
`is-assignment.cls`; change it there and every assignment follows.

## Pull requests

- Branch off `main`; do not push to `main` directly.
- One assignment per pull request, so it can be reviewed and reverted on its own.
- CI must be green. A build failure on a pull request means the PDF cannot be
  produced — it is never "just a warning".
- The course instructor reviews and merges.
- Write commit messages in the [Conventional Commits](https://www.conventionalcommits.org)
  style already used in the history, e.g. `feat: add websocket assignment`.

## Assignments that involve attacking something

Half of this subject is offensive technique, and a handout is not the place to
be vague about scope. An assignment that asks a student to attack must say, in
the assignment itself:

- that the target is their own machine or an application they wrote,
- that doing the same to a system they do not own is a violation, and what the
  consequence is,
- what to hand in that shows the weakness without publishing a working exploit
  against someone else's service.

`web-hardening` shows the shape: a `نکته` callout, before the first task.

## What does not belong here

This repository is **public**. Do not commit:

- solutions, answer keys, or grading rubrics,
- student submissions, names, or grades,
- exam material that has not been handed out yet.

Keep those in the private course repository.
