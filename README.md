EmacsOpenSSLCrypt
=================

Emacs OpenSSL

I have been searching for a easy way to incorporate OpenSSL encryption into Emacs with no available. I found some others but not seemed to be very complete.

I finally decided to take a chance with the emacs crypt++.el and came up with this and will work with openssl or any other encryption/decryption any one would like to incorporate.   The changes in the crypt++.el included here has not been approved by the original author(s).  But, email has been sent to request this changes to be incorporated in the original author(s)'s source tree.

Save the crypt++.el to a folder in the emacs load-path.

add the content of .emacs into your own .emacs

base on the included .emacs configuration, whenever you open any file with the extension of .ose, .aes or .e,   emacs will prompt you to enter a key to encrypt / descrypt the file.
