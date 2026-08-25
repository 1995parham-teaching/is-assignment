% Named is-assignment rather than assignment: TeX Live ships its own
% assignment.cls, and a document that asks for `assignment` can silently get
% that one instead.
\ProvidesClass{is-assignment}
              [2026/08/25 Introduction to Information Security assignments]

\LoadClass[]{article}

\RequirePackage[
  a4paper,
  left=2.5cm,
  right=2.5cm,
  top=2.7cm,
  bottom=2.5cm,
  headsep=0.7cm
]{geometry}

% Everything that is not the cover page of an assignment lives in
% teaching-base, kept in the latex-templates repository and pulled in here as
% a git subtree: the palette, the fonts, the sectioning, the listings, the
% callout boxes, the marks and the answer blocks.
% violet rather than the blue of the Internet Engineering handouts
\RequirePackage[latin=Neuton, accent=6D28D9]{teaching-base}

\date{\persiantoday}

% متادیتای سند
%
% نام درس و ترم تحصیلی در صفحه عنوان چاپ می‌شوند و می‌توانند در سربرگ هر تمرین
% تعیین شوند:
%
%   \درس{مهندسی اینترنت}
%   \ترم{پاییز ۱۴۰۵}
%
% اگر \ترم مشخص نشود، ترم جاری از روی تاریخ ساخته‌شدن سند حدس زده می‌شود.

% \def به جای \newcommand، تا \ifx با \@empty (که \long نیست) قابل مقایسه باشد.
\def\ie@course{مبانی امنیت اطلاعات}
\newcommand{\course}[1]{\def\ie@course{#1}}
\eqcommand{درس}{course}

\def\ie@semester{}
\newcommand{\semester}[1]{\def\ie@semester{#1}}
\eqcommand{ترم}{semester}

% حدس ترم تحصیلی از روی ماه شمسی:
%   مهر تا دی (۷--۱۰)      پاییز
%   بهمن تا خرداد (۱۱--۳)  بهار
%   تیر تا شهریور (۴--۶)   تابستان
% بهمن و اسفند به سال تحصیلی بعد تعلق دارند.
\newcount\ie@termyear
\newcommand{\ie@autosemester}{%
  \ie@termyear=\persianyear\relax
  \ifnum\persianmonth>10\relax
    \advance\ie@termyear by 1\relax
    بهار%
  \else
    \ifnum\persianmonth>6\relax
      پاییز%
    \else
      \ifnum\persianmonth>3\relax
        تابستان%
      \else
        بهار%
      \fi
    \fi
  \fi
  \ \the\ie@termyear
}

% مهلت تحویل تمرین، در صورت تعیین شدن، در صفحه عنوان می‌آید:
%
%   \مهلت{۳۰ آبان ۱۴۰۵}
\def\ie@deadline{}
\newcommand{\deadline}[1]{\def\ie@deadline{#1}}
\eqcommand{مهلت}{deadline}

% مسیر تحویل تمرین:
%
%   \تحویل{مخزن گیت‌هاب کلاس درس}
\def\ie@handin{مخزن گیت‌هاب درس}
\newcommand{\handin}[1]{\def\ie@handin{#1}}
\eqcommand{تحویل}{handin}

% قوانین تمرین‌ها. متن ثابت است و در همه‌ی تمرین‌ها یکسان چاپ می‌شود؛
% تنها مسیر تحویل و مهلت از سند گرفته می‌شوند.
%
% این متن سیاست درس است: پیش از ترم آینده یک بار بازخوانی‌اش کنید.
\newcommand{\policies}{%
  \قسمت{قوانین}

  \شروع{فقرات}
  \فقره \متن‌سیاه{تحویل.} کار خود را در \ie@handin\ تحویل دهید.
        تحویل از راه دیگر (ایمیل، پیام‌رسان) پذیرفته نیست، مگر آنکه پیشاپیش هماهنگ شده باشد.
  \ifx\ie@deadline\@empty\else
  \فقره \متن‌سیاه{مهلت.} \ie@deadline. آخرین وضعیت مخزن پیش از پایان مهلت ارزیابی می‌شود.
  \fi
  \فقره \متن‌سیاه{تأخیر.} تا ۷۲ ساعت پس از مهلت، با کسر ۲۰ درصد از نمره‌ی تمرین پذیرفته می‌شود؛ پس از آن پذیرفته نیست.
  \فقره \متن‌سیاه{اصالت کار.} گفت‌وگو درباره‌ی صورت مساله آزاد است، اما کدی که تحویل می‌دهید باید نوشته‌ی خودتان باشد.
        تحویل کد مشترک، برای \متن‌سیاه{هر دو} طرف نمره‌ی صفر دارد.
  \فقره \متن‌سیاه{ابزارهای هوش مصنوعی.} استفاده از آن‌ها مجاز است، به سه شرط:
        در فایل \متن‌لاتین{README} بنویسید کجا و برای چه از آن‌ها استفاده کرده‌اید،
        بتوانید هر خط از کدی که تحویل می‌دهید را توضیح دهید،
        و بدانید که در جلسه‌ی تحویل حضوری پرسیده می‌شود.
        کدی که نتوانید توضیح دهید، تحویل داده نشده به شمار می‌آید.
  \فقره \متن‌سیاه{نمره‌دهی.} بارم هر بخش کنار همان بخش آمده است.
        درست کار کردن برنامه شرط لازم است، اما تمام نمره نیست: خوانایی کد، ساختار پروژه و پیام‌های \متن‌لاتین{commit} هم دیده می‌شوند.
  \پایان{فقرات}
}
\eqcommand{قوانین}{policies}

% xepersian installs its own \maketitle for the document class after this class
% is read, so the cover page is defined once every package has been loaded.
\AtBeginDocument{%
  \runninghead{\ie@course}%
  \runningfoot{تمرین \@title}%
  \renewcommand{\maketitle}{%
    \thispagestyle{plain}
    \begin{center}
      \vspace*{0.5cm}

      \textit{بسمه تعالی}

      \vspace{1.2cm}

      \textcolor{tbaccentline}{\rule{0.35\linewidth}{1pt}}

      \vspace{0.6cm}

      {\Huge\bfseries\textcolor{tbaccent}{تمرین \@title}}

      \vspace{0.35cm}

      \textcolor{tbaccentline}{\rule{0.35\linewidth}{1pt}}

      \vspace{0.9cm}

      {\Large \ie@course}

      \vspace{0.4cm}

      {\large
        \ifx\ie@semester\@empty
          \ClassWarning{is-assignment}{No semester set; guessing it from the build
            date. Set it explicitly with \string\ترم}%
          \ie@autosemester
        \else
          \ie@semester
        \fi
      }

      \ifx\ie@deadline\@empty\else
        \vspace{0.9cm}
        \setlength{\fboxsep}{6pt}%
        \colorbox{tbaccentsoft}{\color{tbaccent}\textbf{\strut مهلت تحویل: \ie@deadline}}%
      \fi

      \vfill
    \end{center}
    \newpage
  }%
}

\endinput
