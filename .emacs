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
