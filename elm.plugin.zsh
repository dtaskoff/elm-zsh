_elm() {
  local ret=1 state line
  help='(--help)--help[give additional details about the command]'

  _arguments \
    '1: :->subcmds' \
    '*:: :->args' && ret=0

  case $state in
    subcmds)
      _values 'subcommands' \
        'repl[open up an interactive programming session]' \
        'init[start an Elm project]' \
        'reactor[start a local server]' \
        'make[compile Elm code into JS or HTML]' \
        'install[fetch packages from <https://package.elm-lang.org>]' \
        'bump[figure out the next version number based on API changes]' \
        'diff[detect API changes]' \
        'publish[publish a package on <https://package.elm-lang.org>]' \
        && ret=0
      ;;
    args)
      case $line[1] in
        repl)
          _arguments $help \
            '(--interpreter)--interpreter[path to an alternate JS interpreter]' \
            '(--no-color)--no-color[turn off the colours in the REPL]' \
            && ret=0
          ;;
        reactor)
          _arguments $help \
            '(--port)--port[set the port of the server (default: 8000)]' \
            && ret=0
          ;;
        make)
          _arguments $help \
            '(--debug)--debug[turn on the time-travelling debugger]' \
            '(--optimize)--optimize[turn on optimizations to make code smaller and faster]' \
            '(--output)--output[specify the name of the resulting JS file]: :_files' \
            '(--report)--report[get error messages as a JSON]' \
            '(--docs)--docs[generate a JSON file of documentation for a package]: :_files' \
            && ret=0
          ;;
        init|install|bump|diff|publish)
          _arguments $help \
            && ret=0
          ;;
      esac
    ;;
  esac

  return ret
}
