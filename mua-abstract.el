;;; mua-abstract.el --- Map Abstract MUA To Concrete MUA  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Summary: Main Package File. But core documentation is in [[file:bmr-model.el]].
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
** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
* Planned Improvements:
" orgCmntEnd)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "REQUIRES" :extraInfo "Imports"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _REQUIRES_: |]]  Imports  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

(require 'gnus)
(require 'gnus-srvr)
(require 'loop)

(require 'bmr-model)
(require 'bmr-prov-mail-com:gmail)
(require 'bmr-prov-usenet-io:gmane:news)
(require 'bmr-method-inject-qmail)
(require 'mua-gnus)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 1 :title "Variables And Constants" :extraInfo "defvar, defcustom"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_       [[elisp:(outline-show-subtree+toggle)][| *Variables And Constants:* |]]  defvar, defcustom  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

(defvar b:pkg:mua-abstract:version "0.1"
   " #+begin_org
** =b:pkg:mua-abstract:version= version number of the entirety of ua-abstract.
#+end_org "
  )

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Blee Package Information" :extraInfo "Canonical"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Blee Package Information_: |]]  Canonical  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:mua-abstract/version"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:mua-abstract|version>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:mua-abstract/version (
;;;#+END:
                                )
   " #+begin_org
** DocStr: mua-abstract package version number.
#+end_org "
   (interactive)
   b:pkg:mua-abstract:version)

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:mua-abstract/version)
#+END_SRC

#+RESULTS:
: 0.1

" orgCmntEnd)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Concept: <<Manifest Activation>>" :extraInfo "Based on file/s to load"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Concept: Manifest Activation_: |]]  Based on file/s to load  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:
(orgCmntBegin "
List of files specified in:
" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:manifest/filesList-activate"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:mrm:manifest/filesList-activate>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:mrm:manifest/filesList-activate (
;;;#+END:
                                          )
   " #+begin_org
** DocStr: Based on *b:mrm:manifest:filesList* setup Gnus variables.
#+end_org "
   (b:func$entry)
   (loop-for-each each b:mrm:manifest:filesList
     (b:mrm:manifest/activate each)
     ))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:manifest/filesList-activate)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:manifest/activate"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:mrm:manifest/activate>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:mrm:manifest/activate (
;;;#+END:
                                <fileName)
   " #+begin_org
** DocStr: Based on the specified =<fileName= profile setup Gnus variables.
Interactively prompt when needed.
#+end_org "
  (interactive (list (read-file-name "Gnus Profile File: ")))
  (b:func$entry)
  (load-file <fileName)
  (b:mrm:resource|map-to-mua))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:manifest/activate \"./profiles/gnus/io.gmane.news/gnus-usenetService.el\")
#+END_SRC
" orgCmntEnd)

(orgCmntBegin "
** Interactive Usage:
#+BEGIN_SRC emacs-lisp
(call-interactively 'b:mrm:manifest/activate)
#+END_SRC
" orgCmntEnd)


;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Concept: <<Abstract To Concrete MUA Mapping>>" :extraInfo "MUA Configuration."
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Concept: <<Abstract To Concrete MUA Mapping>>_: |]]  MUA Configuration.  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:
(orgCmntBegin "
Based on the complete abstract specification, we choose appropriate MUA
And then configure that MUA.
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:resource|map-to-mua"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:mrm:resource|map-to-mua>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:mrm:resource|map-to-mua (
;;;#+END:
                                  )
   " #+begin_org
** DocStr: Dispatches based on the value of map-to-mua.
#+end_org "
   (b:func$entry)
   (let* (
           ($map-to-mua (get 'b:mrm:resource:manifest 'map-to-mua))
           )
      (cond
       ((string= $map-to-mua (plist-get b:mrm::map-to-muas 'gnus))
        (b:gnus:mrm:resource|activate))
       (t
        (message (s-lex-format "Unknown MUA=${$map-to-mua}")))
       )))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:resource|map-to-mua)
#+END_SRC

#+RESULTS:
| nntp | news.gmane.io |

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "imapGetPassword"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<imapGetPassword>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun imapGetPassword (
;;;#+END:
                        )
   " #+begin_org
** DocStr: Gets the passwd for imaps. For example it can prompt the end-user.
#+end_org "
   "NOTYET")

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(imapGetPassword)
#+END_SRC

#+RESULTS:
: NOTYET

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "smtpGetPassword"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<smtpGetPassword>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun smtpGetPassword (
;;;#+END:
                        )
   " #+begin_org
** DocStr: Gets the passwd for ssmtp. For example it can prompt the end-user.
#+end_org "
   "NOTYET")

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(smtpGetPassword)
#+END_SRC

#+RESULTS:
: NOTYET

" orgCmntEnd)



;;;#+BEGIN: b:elisp:file/provide :modName nil
(provide 'mua-abstract)
;;;#+END:

;;;#+BEGIN: b:elisp:file/endOf :outLevel 1
(orgCmntBegin "
* [[elisp:(show-all)][(>]] ~END-OF-FILE~  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;; local variables:
;;; no-byte-compile: t
;;; end:
;;;#+END:
