\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ata-seccom}[2018/02/28 Classe da ata de reunião]

\LoadClass[a4paper, 12pt]{article}

\RequirePackage{luatex85}

\RequirePackage[brazilian]{babel}
\RequirePackage[bottom=30mm,left=30mm,right=30mm,top=30mm]{geometry}
\RequirePackage{xparse}
\RequirePackage{indentfirst}
\RequirePackage[T1]{fontenc}

\pagenumbering{gobble}

\renewcommand*\rmdefault{ptm}

\def\@maketitle {
    \begin{center}
        \LARGE{Comissão Organizadora - SECCOM}\\
        \large{Universidade Federal de Santa Catarina}
    \end{center}

    \vspace{25pt}

    \noindent
    \LARGE{Ata de reunião}
    \hfill
    \footnotesize{Data: \today}

    \noindent
    \hrulefill
}

\newcommand{\pauta}[1]{\section*{#1}}

\ExplSyntaxOn
\NewDocumentCommand{\presentes}{ m }{
    \vspace{20pt}

    \noindent
    \hrulefill\\
    \textbf{Presentes:}\ \noexpand\sort{#1}\

    % Conta o número de vírgulas no texto
    \seq_set_split:Nnn \l_tmpa_seq { , } { #1 }
    (\int_eval:n {(\seq_count:N \l_tmpa_seq)})
}
\ExplSyntaxOff

\newcommand*{\sort}[1]{
  \directlua{
    local sort = require("sort")
    sort("#1")
  }
}
