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
(require 'bisos)
(require 'bmr-prov-mail-com:gmail)
(require 'bmr-prov-mail-here:qmail)

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

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:marmee:aas|ingestAll" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  defun      [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:marmee:aas|ingestAll>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(defun b:mrm:marmee:aas|ingestAll (
;;;#+END:
                                   <aasMarmeeBaseDir)
  " #+begin_org
** DocStr: Base on knowledge of ~/bpos/usageEnvs/fullUse/aas/marmee structure, obtain bases and act on them.
#+end_org "
  (b:func$entry)
  (let* (
         ($aasBaseDir (expand-file-name <aasMarmeeBaseDir))
         ($childrenSvcProv)
         ($childrenSvcInstance)
         ($svcInstanceBase)
         ($bpoId)
         ($bpoBaseDir)
         ($envRelPath)
         )
    (when (f-exists? $aasBaseDir)
      (setq $childrenSvcProv (f-directories $aasBaseDir))
      (loop-for-each $eachSvcProv $childrenSvcProv
        (setq $childrenSvcInstance (f-directories $eachSvcProv))
        (loop-for-each $eachSvcInstance $childrenSvcInstance
          (setq $svcInstanceBase (f-join $aasBaseDir $eachSvcProv $eachSvcInstance))
          (setq $bpoId (bisos:bpo|givenPathObtainBpoId $svcInstanceBase))
          (setq $bpoBaseDir (bisos:bpo|baseDirObtain $bpoId))
          (setq $envRelPath
                (s-chop-prefix (file-name-directory  $bpoId) $svcInstanceBase))
          (b:mrm:marmee:aas|ingestSvcInstance $bpoId $envRelPath)
          )))))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:marmee:aas|ingestAll (symbol-name '~/bpos/usageEnvs/fullUse/aas/marmee))
#+END_SRC
" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:mrm:marmee:aas|ingestSvcInstance" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  defun      [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:marmee:aas|ingestSvcInstance>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(defun b:mrm:marmee:aas|ingestSvcInstance (
;;;#+END:
                                           <bpoId <envRelPath)
   " #+begin_org
** DocStr: Blee interface to =aasMarmeeManage.cs=
#+end_org "
   (b:func$entry)
   (let* (
          ($bpoBaseDir (bisos:bpo|baseDirObtain <bpoId))
          ($inMailFpBase)
          ($outMailFpBase)
          ($inMail:userName)
          ($inMail:svcProvider)
          ($outMail:acctName)
          )
     (setq $inMailFpBase
           (f-join $bpoBaseDir <envRelPath "control/inMail/fp"))

     (setq $outMailFpBase
           (f-join $bpoBaseDir <envRelPath "control/outMail/fp"))

     (setq $inMail:userName
           (bisos:aas:marmee:manage|fpParamGetWithName
            $inMailFpBase "AasInMail_FPs" "userName"))

     (setq $inMail:svcProvider
           (bisos:aas:marmee:manage|fpParamGetWithName
            $inMailFpBase "AasInMail_FPs" "svcProvider"))

     (setq $outMail:acctName
           (bisos:aas:marmee:manage|fpParamGetWithName
            $outMailFpBase "AasOutMail_FPs" "outMail_userName"))

     (setq $maildirPath
           (bisos:aas:marmee:offlineimap|maildirPath
            <bpoId <envRelPath))

     (b:mrm:marmee:aas:resource|define
      :mailAcctName $inMail:userName
      :maildirPath $maildirPath
      :svcProvider $inMail:svcProvider
      :outMailAcctName $outMail:acctName
      )
     ))


(orgCmntBegin "
** Basic Usage:
(b:mrm:marmee:aas|ingestSvcInstance (symbol-name 'piu_mbFullUsage) (symbol-name 'aas/marmee/qmail/alias))
#+BEGIN_SRC emacs-lisp
(b:mrm:marmee:aas|ingestSvcInstance (symbol-name 'piu_mbFullUsage) (symbol-name 'aas/marmee/gmail/mohsen.byname))
#+END_SRC

#+RESULTS:
: /bxo/iso/piu_mbFullUsage/aas/marmee/gmail/mohsen.byname/conrol/inMail/fp

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:mrm:marmee:aas:resource|define" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  cl-defun   [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:marmee:aas:resource|define>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(cl-defun b:mrm:marmee:aas:resource|define (
;;;#+END:
                                            &key
                                            (mailAcctName "")
                                            (inMailAcctName "")
                                            (maildirPath "")
                                            (outMailAcctName "")
                                            (svcProvider "")
                                            )
  " #+begin_org
** DocStr:
#+end_org "
  (b:func$entry)
  (message mailAcctName)
  (cond
   ((string= svcProvider "gmail")
    (b:mrm:aas:resource:gnus:gmail|define
     :mailAcctName mailAcctName
     :inMailAcctName inMailAcctName
     :maildirPath maildirPath
     :outMailAcctName outMailAcctName
     ))
   ((string= svcProvider "qmail")
    (b:mrm:aas:resource:gnus:qmail|define
     :mailAcctName mailAcctName
     :inMailAcctName inMailAcctName
     :maildirPath maildirPath
     :outMailAcctName outMailAcctName
     ))
   (t
    (error (s-lex-format "Unknown ${svcProvider}"))
    )))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:marmee:aas|ingestSvcInstance (symbol-name 'piu_mbFullUsage) (symbol-name 'aas/marmee/qmail/alias))
#+END_SRC

#+RESULTS:
: b:gnus:vault/credentials-add NOTYET

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:mrm:aas:resource:gnus:gmail|define" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  cl-defun   [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:aas:resource:gnus:gmail|define>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(cl-defun b:mrm:aas:resource:gnus:gmail|define (
;;;#+END:
                                                &key
                                                (mailAcctName "")
                                                (inMailAcctName "")
                                                (outMailAcctName "")
                                                (maildirPath "")
                                                (retrievablesMethod
                                                 (plist-get b:mrm:retrievables::methods 'maildir))
                                                (sendingMethod
                                                 (plist-get b:mrm:sending::methods 'qmail-inject))
                                                )
  " #+begin_org
** DocStr:
#+end_org "
  (b:func$entry)
  (let* (
         ($inMailAcctName inMailAcctName)
         ($outMailAcctName outMailAcctName)
         )

    (unless $inMailAcctName (setq $inMailAcctName mailAcctName))
    (unless $outMailAcctName (setq $outMailAcctName mailAcctName))

    (b:mrm:resource|define
     :name (s-lex-format "com.gmail@${mailAcctName}")
     :resource-type (plist-get b:mrm:resource::types 'mailService)
     :map-to-mua (plist-get b:mrm::map-to-muas 'gnus)
     :retrievablesResource-spec
     (lambda ()
       (b:mrm:retrievablesResource:mail|define
        :user-acct (s-lex-format "${$inMailAcctName}")
        :acct-passwd (imapGetPassword)
        :retrievablesResource-method retrievablesMethod
        :maildirPath maildirPath
        :retrievablesResource-provider 'b:mrm:retrievablesResource:provider|com-gmail
        ))
     :injectionResource-spec
     (lambda ()
       (b:mrm:injectionResource:mail|define
        :user-acct (s-lex-format "${$outMailAcctName}")
        :acct-passwd (smtpGetPassword)
        :injectionResource-method sendingMethod
        :injectionResource-provider 'b:mrm:injectionResource:provider|com-gmail
        ))
     :vault-interface (plist-get b:mrm::vaultInterfaces 'authinfo)
     )
    ))


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:mrm:aas:resource:gnus:gmail-limap|define" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  cl-defun   [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:aas:resource:gnus:gmail-limap|define>>  --   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(cl-defun b:mrm:aas:resource:gnus:gmail-limap|define (
;;;#+END:
                                                &key
                                                (mailAcctName "")
                                                (inMailAcctName "")
                                                (outMailAcctName "")
                                                (maildirPath "")
                                                (retrievablesMethod
                                                 (plist-get b:mrm:retrievables::methods 'limap))
                                                (sendingMethod
                                                 (plist-get b:mrm:sending::methods 'qmail-inject))
                                                )
  " #+begin_org
** DocStr:
#+end_org "
  (b:func$entry)
  (let* (
         ($inMailAcctName inMailAcctName)
         ($outMailAcctName outMailAcctName)
         )

    (unless $inMailAcctName (setq $inMailAcctName mailAcctName))
    (unless $outMailAcctName (setq $outMailAcctName mailAcctName))

    (b:mrm:resource|define
     :name (s-lex-format "com.gmail@${mailAcctName}")
     :resource-type (plist-get b:mrm:resource::types 'mailService)
     :map-to-mua (plist-get b:mrm::map-to-muas 'gnus)
     :retrievablesResource-spec
     (lambda ()
       (b:mrm:retrievablesResource:mail|define
        :user-acct (s-lex-format "${$inMailAcctName}")
        :acct-passwd (imapGetPassword)
        :retrievablesResource-method retrievablesMethod
        :maildirPath maildirPath   ;;; NOTYET, not needed for limap
        :retrievablesResource-provider 'b:mrm:retrievablesResource:provider|com-gmail
        ))
     :injectionResource-spec
     (lambda ()
       (b:mrm:injectionResource:mail|define
        :user-acct (s-lex-format "${$outMailAcctName}")
        :acct-passwd (smtpGetPassword)
        :injectionResource-method sendingMethod
        :injectionResource-provider 'b:mrm:injectionResource:provider|com-gmail
        ))
     :vault-interface (plist-get b:mrm::vaultInterfaces 'authinfo)
     )
    ))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:marmee:aas|ingestSvcInstance (symbol-name 'piu_mbFullUsage) (symbol-name 'aas/marmee/qmail/alias))
#+END_SRC

#+RESULTS:
: b:gnus:vault/credentials-add NOTYET

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:mrm:aas:resource:gnus:gmail|postingStyles" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  cl-defun   [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:aas:resource:gnus:gmail|postingStyles>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(cl-defun b:mrm:aas:resource:gnus:gmail|postingStyles (
;;;#+END:
                                            &key
                                            (outMailAcctName "")
                                            )
  " #+begin_org
** DocStr:
#+end_org "
  (b:func$entry)
  (add-to-list 'gnus-posting-styles
	       '((s-lex-format ".*gmail.com@${outMailAcctName}:.*")
	         (from (s-lex-format "${outMailAcctName}@gmail.com"))
	         (bcc (s-lex-format "${outMailAcctName}@gmail.com"))
	         ("Return-Path" (s-lex-format "${outMailAcctName}@gmail.com"))
	         ("X-Envelope" (s-lex-format "${outMailAcctName}@gmail.com"))
	         ("X-Message-SMTP-Method" "qmail")
	         )
	       t)
  )


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:mrm:aas:resource:gnus:qmail|define" :advice ()
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  cl-defun   [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:aas:resource:gnus:qmail|define>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(cl-defun b:mrm:aas:resource:gnus:qmail|define (
;;;#+END:
                                                &key
                                                (mailAcctName "")
                                                (inMailAcctName "")
                                                (outMailAcctName "")
                                                (maildirPath "")
                                                (retrievablesMethod
                                                 (plist-get b:mrm:retrievables::methods 'maildir))
                                                (sendingMethod
                                                 (plist-get b:mrm:sending::methods 'qmail-inject))
                                                )
  " #+begin_org
** DocStr:
#+end_org "
  (b:func$entry)
  (let* (
         ($inMailAcctName inMailAcctName)
         ($outMailAcctName outMailAcctName)
         )

    (unless $inMailAcctName (setq $inMailAcctName mailAcctName))
    (unless $outMailAcctName (setq $outMailAcctName mailAcctName))

    (b:mrm:resource|define
     :name (s-lex-format "here.qmail@${mailAcctName}")
     :resource-type (plist-get b:mrm:resource::types 'mailService)
     :map-to-mua (plist-get b:mrm::map-to-muas 'gnus)
     :retrievablesResource-spec
     (lambda ()
       (b:mrm:retrievablesResource:mail|define
        :user-acct (s-lex-format "${$inMailAcctName}")
        :acct-passwd (imapGetPassword)
        :retrievablesResource-method retrievablesMethod
        :maildirPath maildirPath
        :retrievablesResource-provider 'b:mrm:retrievablesResource:provider|here-qmail
        ))
     :injectionResource-spec
     (lambda ()
       (b:mrm:injectionResource:mail|define
        :user-acct (s-lex-format "${$outMailAcctName}")
        :acct-passwd (smtpGetPassword)
        :injectionResource-method sendingMethod
        :injectionResource-provider 'b:mrm:injectionResource:provider|here-qmail
        ))
     :vault-interface (plist-get b:mrm::vaultInterfaces 'authinfo)
     )
    ))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:mrm:marmee:aas|ingestSvcInstance (symbol-name 'piu_mbFullUsage) (symbol-name 'aas/marmee/qmail/alias))
#+END_SRC

#+RESULTS:
: b:gnus:vault/credentials-add NOTYET

" orgCmntEnd)

;; ;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:mrm:aas:resource:gnus:gmail|postingStyles" :advice ()
;; (orgCmntBegin "
;; *  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  cl-defun   [[elisp:(outline-show-subtree+toggle)][||]]  <<b:mrm:aas:resource:gnus:gmail|postingStyles>>   [[elisp:(org-cycle)][| ]]
;; " orgCmntEnd)
;; (cl-defun b:mrm:aas:resource:gnus:gmail|postingStyles (
;; ;;;#+END:
;;                                             &key
;;                                             (outMailAcctName "")
;;                                             )
;;   " #+begin_org
;; ** DocStr:
;; #+end_org "
;;   (b:func$entry)
;;   (add-to-list 'gnus-posting-styles
;; 	       '((s-lex-format ".*gmail.com@${outMailAcctName}:.*")
;; 	         (from (s-lex-format "${outMailAcctName}mohsen.byname@gmail.com"))
;; 	         (bcc (s-lex-format "${outMailAcctName}@gmail.com"))
;; 	         ("Return-Path" (s-lex-format "${outMailAcctName}@gmail.com"))
;; 	         ("X-Envelope" (s-lex-format "${outMailAcctName}@gmail.com"))
;; 	         ("X-Message-SMTP-Method" "qmail")
;; 	         )
;; 	       t)
;;   )


;; (orgCmntBegin "
;; ** Basic Usage:
;; #+BEGIN_SRC emacs-lisp
;; (b:mrm:marmee:aas|ingestSvcInstance (symbol-name 'piu_mbFullUsage) (symbol-name 'aas/marmee/qmail/alias))
;; #+END_SRC

;; #+RESULTS:
;; : b:gnus:vault/credentials-add NOTYET

;; " orgCmntEnd)


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
