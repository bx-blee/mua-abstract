;;; mua-gnus.el --- Configure Gnus With Profiles  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Summary:
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
* Configure Gnus and message-mode based on the specified abstract MUA.
** This should become an independent package, where the inputs are
abstract mail service descriptions.
** Relevant Panels:
*** [[file:/bisos/panels/blee-core/mail/model/_nodeBase_/fullUsagePanel-en.org]]
*** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
** Action Plan:
*** TODO Add a b:gnus:manifest|init -- does (setq gnutls-log-lyevel 1) and more.
*** TODO Implement b:gnus:vault/credentials-add
*** DONE Capture expiry and search engine
(nnimap-stream ssl)
                (nnir-search-engine imap)
                (nnmail-expiry-target \"nnimap+work:[Gmail]/Trash\")
                (nnmail-expiry-wait 'immediate))))
*** TODO Add mbox format and Gnus source --- test with large exisiting
*** TODO convert setq plists in manifest files to functions.
*** TODO Set gmail as a known resource.
*** TODO convert to a package.
*** DONE [#B] Replace  b:gnus:source:manifest with  b:mrm:resource:manifest
SCHEDULED: <2022-04-29 Fri>
*** DONE Add from Variable Compose Mail Template For F12 c-c
" orgCmntEnd)


;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "REQUIRES" :extraInfo "Imports"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _REQUIRES_: |]]  Imports  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

(require 'gnus)
(require 'gnus-srvr)
(require 'loop)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 1 :title "Variables And Constants" :extraInfo "defvar, defcustom"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_       [[elisp:(outline-show-subtree+toggle)][| *Variables And Constants:* |]]  defvar, defcustom  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

(defvar b:gnus:offlineServers '())

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Common Facilities" :extraInfo "Library Candidates"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Common Facilities_: |]]  Library Candidates  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:gnus:mrm:resource|activate"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:gnus:mrm:resource|activate>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:gnus:mrm:resource|activate (
;;;#+END:
                                     )
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (let*  (
          ($sourceType (get 'b:mrm:resource:manifest 'resource-type))
          )
    (cond
     ((string= $sourceType "mailService")
      (b:gnus:inMail|configure)
      (b:gnus:outMail|configure)
      (b:gnus:vault/credentials-add))
     ((string= $sourceType "usenetService")
      (b:gnus:usenet|configure))
    (t
     (message (s-lex-format "Unknown sourceType=${$sourceType}"))))
    ))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:gnus:mrm:resource|activate)
#+END_SRC
" orgCmntEnd)
;;; (gnus-group-browse-foreign-server (quote (nntp "io.gmane.newsne.io")))
;;; (setq smtpmail-debug-info t)
;;; (gnus-server-offline-server "nntp:news.gmane.io")

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:gnus:inMail|configure"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:gnus:inMail|configure>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:gnus:inMail|configure (
;;;#+END:
                                )
" #+begin_org
** Based on the specified profile setup Gnus variables.
*** TODO The opposit of configure is delist --- NOTYET.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService-name (get 'b:mrm:resource:manifest 'name))
          )

    (cond
     ((string=
       (get 'b:mrm:inMail:manifest 'retrievablesResource-method)
       (plist-get b:mrm:retrievables::methods 'imap))
      (let* (
             ($imap-address (get 'b:mrm:inMail:manifest 'imap-address))
             ($imap-port (get 'b:mrm:inMail:manifest 'imap-port))
             ($imap-stream (get 'b:mrm:inMail:manifest 'imap-stream))
             )

        ;;  Optional third arg t=append, puts $mailService-name at the end of the list.
        (add-to-list 'gnus-secondary-select-methods
		     `(nnimap
                       ,$mailService-name
		       (nnimap-address ,$imap-address)
		       (nnimap-server-port ,$imap-port)
		       (nnimap-stream ,$imap-stream))
                     t)
        ))
     ((string=
       (get 'b:mrm:inMail:manifest 'retrievablesResource-method)
       (plist-get b:mrm:retrievables::methods 'maildir))
      (let* (
             ($maildir-path (get 'b:mrm:inMail:manifest 'maildir-path))
             )

        ;;  Optional third arg t=append, puts $mailService-name at the end of the list.
        (add-to-list 'gnus-secondary-select-methods
		     `(nnmaildir
                       ,$mailService-name
		       (directory ,$maildir-path))
                     t)
        ))
     (t
      (error "Unknown retrievablesResource-method")))))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:gnus:inMail|configure)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:gnus:outMail|configure"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:gnus:outMail|configure>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:gnus:outMail|configure (
;;;#+END:
                                 )
" #+begin_org
** Based on the specified profile setup Gnus variables.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))

  (b:gnus:outMail:inject|setup-qmail)

  (let*  (
          ($mailService-name (get 'b:mrm:resource:manifest 'name))
          ($submit-from-addr (get 'b:mrm:outMail:manifest 'submit-from-addr))
          ($submit-from-name (get 'b:mrm:outMail:manifest 'submit-from-name))
          ($smtp-address (get 'b:mrm:outMail:manifest 'smtp-address))
          ($user-acct (get 'b:mrm:outMail:manifest 'user-acct))
          ($injection-resource (get 'b:mrm:outMail:manifest 'injection-resource))
          ($expiry-target "nnml:expired")
          ($expiry-wait 7)
          )
    (when (string= $injection-resource "gmail")
      (setq $expiry-target (s-lex-format "nnimap+${$mailService-name}:[Gmail]/Trash"))
      (setq $expiry-wait 'immediate)
      )

    ;;  Optional third arg t=append, puts $mailService-name at the end of the list.
    ;;  Not beginning of the gnus-posting-styles list
    ;;  TODO NOTYET Revisit, commented lines below

;; (add-to-list 'gnus-posting-styles
;; 	     '(".*gmail.com@mohsen.byname:.*"
;; 	       (from "mohsen.byname@gmail.com")
;; 	       (bcc "mohsen.byname@gmail.com")
;; 	       ("Return-Path" "mohsen.byname@gmail.com")
;; 	       ("X-Envelope" "mohsen.byname@gmail.com")
;; 	       ("X-Message-SMTP-Method" "qmail")
;; 	       )
;; 	     t)

    (add-to-list 'gnus-posting-styles
                 (first
	          `(
                    (,$mailService-name   ; Matches Gnus group called $mailService-name
                     (from ,$user-acct)
                     (bcc ,$user-acct)
                     ("Return-Path" ,$user-acct)
                     ("X-Envelope" ,$user-acct)
		     (address ,$submit-from-addr)
		     (name ,$submit-from-name)
                     (nnmail-expiry-target ,$expiry-target)
                     (nnmail-expiry-wait ,$expiry-wait)
		     ("X-Message-SMTP-Method" ,(s-lex-format "qmail"))
                     )
                    ))
                 t)))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:gnus:outMail|configure)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:gnus:outMail:inject|setup-qmail"
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  defun      [[elisp:(outline-show-subtree+toggle)][||]]  <<b:gnus:outMail:inject|setup-qmail>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(defun b:gnus:outMail:inject|setup-qmail (
;;;#+END:
                                          )
" #+begin_org
** Configure Guns's qmail-inject interface.
#+end_org "

;;(setq message-send-mail-function 'message-send-mail-with-qmail)
  (setq message-qmail-inject-program "env")

  ;; Envelop Setting
  ;; QMAILINJECT=i -- lets qmail-inject write the message-id
  ;; Envelop addr writen by -f
  (setq message-qmail-inject-args
	(list
	 "-"
	 ;; "QMAILINJECT=i"  ;; Delete any incoming Message-ID field.
	 ;; "/bisos/core/bpip/bin/qmail-inject-bisos.cs"
         ;; "qmail-inject-bisos.cs"
         "qmail-inject-bisos.cs"
         "-i"
         "monolithicSend"
	 )
	)
  )

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:gnus:outMail:inject|setup-qmail)
#+END_SRC
" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:gnus:usenet|configure"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:gnus:usenet|configure>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:gnus:usenet|configure (
;;;#+END:
                                )
  " #+begin_org
** Based on the specified profile setup Gnus variables.
*** TODO The opposit of configure is delist --- NOTYET.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($source:name (get 'b:mrm:resource:manifest 'name))
          ($nntp-address (get 'b:mrm:usenet:manifest 'nntp-address))
          )

    (setq gnus-select-method `(nntp ,$nntp-address))

    (add-to-list 'b:gnus:offlineServers
                 (s-lex-format "nntp:${$nntp-address}"))

    (add-hook 'gnus-started-hook
              'b:gnus:offlineServers|hook)
    ))

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:gnus:offlineServers|hook"
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  defun      [[elisp:(outline-show-subtree+toggle)][||]]  <<b:gnus:offlineServers|hook>>   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(defun b:gnus:offlineServers|hook (
;;;#+END:
                                   )
  " #+begin_org
** Meant to be run through =gnus-started-hook=. Set to offline each server in  b:gnus:offlineServers list.
We go to the server-mode before walking through the list and exit it afterwards.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (gnus-group-enter-server-mode)
  (loop-for-each $eachServer b:gnus:offlineServers
    ;; Initially we may want the service to be offline
    ;;(gnus-server-add-server $eachServer)
    (gnus-server-offline-server $eachServer))
  (gnus-server-exit)
  )

;;;
(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:gnus:usenet|configure)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:gnus:vault/credentials-add"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:gnus:vault/credentials-add>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:gnus:vault/credentials-add (
;;;#+END:
                                     )
  " #+begin_org
** Based on the specified profile setup Gnus variables.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService-name (plist-get b:mrm:resource:manifest :name))
          ($vault-interface  (plist-get b:mrm:resource:manifest :vault-interface))
          )
    ;;
    ;;
    ;;
    "b:gnus:vault/credentials-add NOTYET"))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:gnus:vault/credentials-add)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN: b:elisp:file/provide :modName nil
(provide 'mua-gnus)
;;;#+END:

;;;#+BEGIN: b:elisp:file/endOf :outLevel 1
(orgCmntBegin "
* [[elisp:(show-all)][(>]] ~END-OF-FILE~  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;; local variables:
;;; no-byte-compile: t
;;; end:
;;;#+END:
