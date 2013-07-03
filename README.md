# An Event-based JSON parser

A simple event based JSON parser that uses a LALR parser generator named Racc. Racc coverts a grammar file (the ".y" file) to a Ruby version, hence "Racc". These state transitions are interpreted by the Racc state machine (or runtime). The Racc runtime ships with Ruby, but the tool that converts the ".y" files to state tables does not. In order to install the converter, do `gem install racc`.
