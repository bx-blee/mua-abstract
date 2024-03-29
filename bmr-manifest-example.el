;;; bmr-manifest-example.el --- Blee Messging Resource Manifest Example  --*- lexical-binding: t; -*-

(orgCmntBegin "
* Manifest file for acctName@gmail.com. 
" orgCmntEnd)


(b:mrm:resource|define
 :name "com.gmail@acctName"
 :resource-type (plist-get b:mrm:resource::types 'mailService)
 :map-to-mua (plist-get b:mrm::map-to-muas 'gnus)
 :retrievablesResource-spec
 (lambda ()
   (b:mrm:retrievablesResource:mail|define
    :user-acct "acctName"
    :acct-passwd (imapGetPassword)
    :retrievablesResource-method (plist-get b:mrm:retrievables::methods 'nnimap)
    :retrievablesResource-provider 'b:mrm:retrievablesResource:provider|com-gmail
    ))
 :injectionResource-spec
 (lambda ()
   (b:mrm:injectionResource:mail|define
    :user-acct "acctName"
    :acct-passwd (smtpGetPassword)
    :injectionResource-method (plist-get b:mrm:sending::methods 'smtpmail)
    :injectionResource-provider 'b:mrm:injectionResource:provider|com-gmail
    ))
 :vault-interface (plist-get b:mrm::vaultInterfaces 'authinfo)
 )
