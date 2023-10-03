let g:old_path = ""


function CheckPoetry()
    let s:poetry = system("poetry env list --full-path")
    if v:shell_error
        return ""
    else    
        return substitute(s:poetry, " (Activated)\n", "", "") . "/bin:"
    endif
endfunction


function CheckPipenv()
    let s:pipenv = system("pipenv --venv")
    if v:shell_error
        return ""
    else
        return trim(s:pipenv) . "/bin:"
    endif
endfunction


function ActivatePython()
    if g:old_path != ""
        echo "Already activated!"
        return
    endif
    let g:old_path = $PATH
    if file_readable("Pipfile.lock")
        let $PATH = CheckPipenv() . $PATH
    elseif file_readable("poetry.lock")
        let $PATH = CheckPoetry() . $PATH
    else
        echo "Cannot activate Pipenv or Poetry!"
        return
    endif
    lua vim.lsp.stop_client(vim.lsp.get_active_clients())
endfunction


function DeactivatePython()
    if g:old_path == ""
        echo "Already deactivated!"
        return
    else
        let $PATH = g:old_path
        let g:old_path = ""
        lua vim.lsp.stop_client(vim.lsp.get_active_clients())
    endif
endfunction


command ActivatePython call ActivatePython()
command DeactivatePython call DeactivatePython()
