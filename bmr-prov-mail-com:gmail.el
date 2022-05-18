;;; bmr-prov-mail-com:gmail.el --- Gmail Provider Messging Resource  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Summary: Blee Messging Resource (BMR) gmail.com Mail Provider
Specifies imap and submission protocol parameters of Gmail.
" orgCmntEnd)

;;;#+BEGIN: b:elisp:file/copyLeftPlus :outLevel 1
(orgCmntBegin "
* Libre-Halaal Software --- Part Of Blee ---  Poly-COMEEGA Format.
** This is Libre-Halaal Software. © Libre-Halaal Foundation. Subject to AGPL.
** It is not part of Emacs. It is part of Blee.
** Best read and edited  with Poly-COMEEGA (Polymode Colaborative Org-Mode Enhance Emacs Generalized Authorship)
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: b:elisp:file/authors :authors ("./inserts/authors-mb.org")
(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: b:elisp:file/orgTopControls :outLevel 1
(orgCmntBegin "
*  ~ORG-TOP-CONTROLS-COME-HERE~
" orgCmntEnd)
;;;#+END:

(orgCmntBegin "
* Relevant Panels:
** [[file:/bisos/panels/blee-core/mail/model/_nodeBase_/fullUsagePanel-en.org]]
** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
* Planned Improvements:
" orgCmntEnd)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "REQUIRES" :extraInfo "Imports"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _REQUIRES_: |]]  Imports  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 1 :title "Variables And Constants" :extraInfo "defvar, defcustom"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_       [[elisp:(outline-show-subtree+toggle)][| *Variables And Constants:* |]]  defvar, defcustom  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Common Facilities" :extraInfo "Library Candidates"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Common Facilities_: |]]  Library Candidates  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:retrievablesResource:provider|com-gmail"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:mrm:retrievablesResource:provider|com-gmail>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:mrm:retrievablesResource:provider|com-gmail (
;;;#+END:
                                                      )
  " #+begin_org
** DocSrc: For each named arument, take appropriate acction and set the corresponding plist.
#+end_org "

  (put 'b:mrm:inMail:manifest  'retrievables-resource "gmail")
  (put 'b:mrm:inMail:manifest  'retrieval-method  "imap")
  (put 'b:mrm:inMail:manifest  'imap-address "imap.gmail.com")
  (put 'b:mrm:inMail:manifest  'imap-port "imaps")
  (put 'b:mrm:inMail:manifest  'imap-stream "ssl")
  )

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:retrievablesResource:provider|com-gmail)
#+END_SRC

#+RESULTS:
: ssl

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:injectionResource:provider|com-gmail"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:mrm:injectionResource:provider|com-gmail>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:mrm:injectionResource:provider|com-gmail (
;;;#+END:
                                                   )
  " #+begin_org
** DocSrc: For each named arument, take appropriate acction and set the corresponding plist.
#+end_org "

  (put 'b:mrm:outMail:manifest  'injection-resource "gmail")
  (put 'b:mrm:outMail:manifest  'submission-method "smtp")
  (put 'b:mrm:outMail:manifest  'smtp-address "smtp.gmail.com")
  (put 'b:mrm:outMail:manifest  'smtp-port "857")
  )

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:injectionResource:provider|com-gmail)
#+END_SRC
" orgCmntEnd)



;;;#+BEGIN: b:elisp:file/provide :modName nil
(provide 'bmr-prov-mail-com:gmail)
;;;#+END:

;;;#+BEGIN: b:elisp:file/endOf :outLevel 1
(orgCmntBegin "
* [[elisp:(show-all)][(>]] ~END-OF-FILE~  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;; local variables:
;;; no-byte-compile: t
;;; end:
;;;#+END:
