class Parser
# The code below is equivalent to the regular expression
# (a|c)*ttp
rule
  string
    : a_or_cs ttp
    | ttp         { puts "I found ttp" }
  # Add a recursive production to match "a" or "c"
  a_or_cs
    : a_or_cs a_or_c
    | a_or_c
    ;
  # Simple production to match "a" or "c"
  a_or_c : 'a' | 'c' ;
  # A production for ttp
  ttp    : 't' 't' 'p';
end
