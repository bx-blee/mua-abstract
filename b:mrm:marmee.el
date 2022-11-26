;;; b:mrm:marmee.el --- Blee:MailResourceModel:MARMEE  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Summary: Sets up everything based on BISOS-MARMEE configurations.
** Starts at ~/bpos/usageEnvs/fullUse/aas/marmee/ and for each directory gathers params and
walks through them
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
* Commentary, Model and Terminology:
* Relevant Panels:
** [[file:/bisos/panels/blee-core/mail/mua-abstract/b:mrm:marmee/_nodeBase_/fullUsagePanel-en.org
* Planned Improvements:
" orgCmntEnd)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "REQUIRES" :extraInfo "Imports"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _REQUIRES_: |]]  Imports  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

(require 'f)

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

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:marmee:aas|ingest" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  defun      [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:marmee:aas|ingest>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(defun b:mrm:marmee:aas|ingest (
;;;#+END:
                                )
   " #+begin_org
** DocStr: Base on knowledge of ~/bpos/usageEnvs/fullUse/aas/marmee structure, obtain bases and act on them.
#+end_org "
   (let* (
          ($aasBaseDir (expand-file-name "~/bpos/usageEnvs/fullUse/aas/marmee"))
          ($childrenSvcProv)
          ($childrenSvcInstance)
          ($svcInstanceBase)
          )
        (when (f-exists? $aasBaseDir)
          (setq $childrenSvcProv (f-directories $aasBaseDir))
          (loop-for-each $eachSvcProv $childrenSvcProv
            (setq $childrenSvcInstance (f-directories $eachSvcProv))
            (loop-for-each $eachSvcInstance $childrenSvcInstance
              (setq $svcInstanceBase (f-join $aasBaseDir $eachSvcProv $eachSvcInstance))
              (message $svcInstanceBase)
                ))))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:marmee:aas|ingest)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN: b:elisp:file/provide :modName nil
(provide 'b:mrm:marmee)
;;;#+END:

;;;#+BEGIN: b:elisp:file/endOf :outLevel 1
(orgCmntBegin "
* [[elisp:(show-all)][(>]] ~END-OF-FILE~  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;; local variables:
;;; no-byte-compile: t
;;; end:
;;;#+END:
