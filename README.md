EmacsOpenSSLCrypt
=================

Emacs OpenSSL

I have been searching for a easy way to incorporate OpenSSL encryption into Emacs with no avaiable. I found some others but not seemed to be very complete.

I finally decided to take a chance with the emacs crypt++.el and came up with this and will work with openssl or any other encryption/decryption any one would like to incorporate.   The changes in the crypt++.el included here has not been approved by the original author(s).  But, email has been sent to request this changes to be incorporated in the original author(s)'s source tree.

Here is what I have in my .emacs providing my customized encryption with the crypt++.el framework:

;; My customized crypt++ encryption
;;
(setq crypt-user-defined-encryption-alist
      (list (list 'aes-256-cbc
                  t
                  '(not (re-search-forward "U2FsdGVkX1"
                                           (min (point-max)
                                                crypt-magic-search-limit) t))
                  "\\(\\.ose\\|\\.aes\\|\\.e\\)$"
                  "openssl" "openssl"
                  '("aes-256-cbc" "-salt" "-base64" "-e" "-k")
                  '("aes-256-cbc" "-salt" "-base64" "-d" "-k")
                  "OpenSSL"
                  nil
                  t))
      crypt-encryption-type 'aes-256-cbc
      crypt-auto-write-buffer-encrypted t)

(if (featurep 'crypt++)

    ;; Yes.  Just rebuild the encryption and encoding tables
    ;; and key binding.
    (progn
      (crypt-rebuild-tables)
      (crypt-bind-insert-file))

  ;; No.  Load the whole thing.
  (require 'crypt++))
