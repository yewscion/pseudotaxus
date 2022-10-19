(use-modules
 ;;; These are my commonly needed modules; remove unneeded ones.
 (guix packages)
 ((guix licenses) #:prefix license:)
 (guix download)
 (guix build-system gnu)
 (gnu packages)
 (gnu packages autotools)
 (gnu packages pkg-config)
 (gnu packages texinfo)
 (gnu packages guile)
 (gnu packages java)
 (gnu packages haskell)
 (gnu packages haskell-xyz)
 (gnu packages agda)
 (gnu packages tex)
 (cdr255 programming)
 (guix gexp))

(package
  (name "pseudotaxus")
  (version "0.0.1")
  (source (local-file (string-append "./"
                                     name
                                     "-"
                                     version
                                     ".tar.bz2")))
  (build-system gnu-build-system)
  (arguments
   `(#:tests? #f
     ;; #:phases
     ;; (modify-phases
     ;;     %standard-phases)
     ))
  (native-inputs (list autoconf automake pkg-config texinfo))
  (inputs (list ghc ghc-bnfc ghc-alex ghc-happy agda texlive-bin))
  (synopsis "Somewhat-standardized pseudocode syntax")
  (description
   "Pseudotaxus is a collection of standard symbols (words and punctuation) that
lend some consistent form to the definition of an algorithm in pseudocode.
It's meant to provide pseudocode with an interpretable form,
syntax-highlighting, and most importantly a limit on which words carry
predefined meaning in a listing.")
  (home-page
   "https://cdr255.com/projects/pseudotaxus")
  (license license:agpl3+))
;; Local Variables:
;; mode: scheme
;; End:
