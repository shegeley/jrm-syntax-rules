(use-modules
 (gnu packages compression)
 (gnu packages texinfo)
 (gnu packages)

 ((guix licenses) #:select (public-domain))
 (guix build-system copy)
 (guix gexp)
 (guix git-download)
 (guix packages))

(define %source-dir (dirname (current-filename)))

(define-public jrm-syntax-rules
  (package
   (name "jrm-syntax-rules")
   (version "1.0.0")
   (source (local-file %source-dir
                       #:recursive? #t))
   (build-system copy-build-system)
   (native-inputs (list gzip texinfo))
   (arguments
    (list #:install-plan ''(("jrm-syntax-rules.info" "share/info/"))
          #:phases #~(modify-phases
                      %standard-phases
                      (add-before
                       'install 'build
                       (lambda _
                         (invoke "makeinfo"
                                 "--output=jrm-syntax-rules.info"
                                 "doc.texi"))))))
   (home-page "https://github.com/shegeley/jrm-syntax-rules")
   (synopsis "JRM’s Syntax-rules Primer for the Merely Eccentric")
   (description "Tutorial for syntax-rules system in R5RS standard.")
   ;; NOTE: coudn't find any info on licensing. seems like public domain. fix me if I'm wrong
   (license public-domain)))

jrm-syntax-rules
