execute 'activate_windows_evaluation' do
  command 'cscript //B "%windir%\system32\slmgr.vbs" /ato'
end
