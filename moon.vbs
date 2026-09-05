Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

scriptDir = fso.GetParentFolderName(WScript.ScriptFullName)
WshShell.CurrentDirectory = scriptDir
tempFile = scriptDir & "\sige_temp.txt"


gitName = GetCmdOutput("git config --global user.name", tempFile)
If gitName = "" Then
    newName = InputBox("Qual o seu NOME COMPLETO para o Git?" & vbCrLf & "(Sera pedido apenas esta vez na sua maquina)", "Configuracao Git")
    If newName = "" Then WScript.Quit
    WshShell.Run "cmd /c git config --global user.name """ & newName & """", 0, True
End If

gitEmail = GetCmdOutput("git config --global user.email", tempFile)
If gitEmail = "" Then
    newEmail = InputBox("Qual o seu E-MAIL para o Git?" & vbCrLf & "(Sera pedido apenas esta vez na sua maquina)", "Configuracao Git")
    If newEmail = "" Then WScript.Quit
    WshShell.Run "cmd /c git config --global user.email """ & newEmail & """", 0, True
End If

' --- 2. Descobre a branch atual ---
currentBranch = GetCmdOutput("git rev-parse --abbrev-ref HEAD", tempFile)

If currentBranch = "main" Or currentBranch = "master" Or currentBranch = "develop" Then
    MsgBox "BLOQUEADO: Nao e permitido salvar alteracoes diretamente na branch '" & currentBranch & "'!", 48, "Acesso Negado"
    If fso.FileExists(tempFile) Then fso.DeleteFile(tempFile)
    WScript.Quit
End If

' --- 3. Verifica se existem alteracoes salvas ---
statusText = GetCmdOutput("git status --porcelain", tempFile)

If statusText = "" Then
    MsgBox "Nenhuma alteracao encontrada no projeto." & vbCrLf & vbCrLf & "Voce editou algo, mas esqueceu de salvar os arquivos no VS Code (Ctrl + S)?", 48, "Aviso"
    If fso.FileExists(tempFile) Then fso.DeleteFile(tempFile)
    WScript.Quit
End If

' --- 4. Coleta de informacoes da Tarefa ---
menuText = "Escolha o tipo de alteracao:" & vbCrLf & vbCrLf & _
           "1 - feat (Nova funcionalidade)" & vbCrLf & _
           "2 - fix (Correcao de erro)" & vbCrLf & _
           "3 - refactor (Melhoria de codigo)" & vbCrLf & _
           "4 - test (Testes automatizados)" & vbCrLf & _
           "5 - docs (Documentacao)" & vbCrLf & _
           "6 - chore (Manutencao/dependencias)"

typeOpt = InputBox(menuText, "Salvar e Enviar", "1")
If typeOpt = "" Then 
    If fso.FileExists(tempFile) Then fso.DeleteFile(tempFile)
    WScript.Quit
End If

commitType = "feat"
If typeOpt = "2" Then commitType = "fix"
If typeOpt = "3" Then commitType = "refactor"
If typeOpt = "4" Then commitType = "test"
If typeOpt = "5" Then commitType = "docs"
If typeOpt = "6" Then commitType = "chore"

scope = InputBox("Modulo/Escopo (Ex: web, mobile, auth) [Opcional - Pode deixar em branco]:", "Escopo")
desc = InputBox("O que foi feito? (Ex: cria componente de botao)", "Descricao")

If desc = "" Then
    MsgBox "A descricao e obrigatoria!", 16, "Erro"
    If fso.FileExists(tempFile) Then fso.DeleteFile(tempFile)
    WScript.Quit
End If

If scope = "" Then
    commitMsg = commitType & ": " & desc
Else
    commitMsg = commitType & "(" & scope & "): " & desc
End If

' --- 5. Executa Git Add, Commit e Push ---
WshShell.Run "cmd /c git add -A", 0, True
commitRes = WshShell.Run("cmd /c git commit -m """ & commitMsg & """", 0, True)

If commitRes <> 0 Then
    MsgBox "Falha ao registrar alteracoes (Commit vazio ou bloqueado). Nenhuma alteracao foi enviada.", 16, "Erro no Commit"
    If fso.FileExists(tempFile) Then fso.DeleteFile(tempFile)
    WScript.Quit
End If

res = WshShell.Run("cmd /c git push -u origin " & currentBranch, 0, True)

If res <> 0 Then
    MsgBox "Falha ao enviar para o GitHub. Verifique sua conexao.", 16, "Erro no Push"
    If fso.FileExists(tempFile) Then fso.DeleteFile(tempFile)
    WScript.Quit
End If

' --- 6. Abre o Navegador no Pull Request ---
rawUrl = GetCmdOutput("git config --get remote.origin.url", tempFile)
If fso.FileExists(tempFile) Then fso.DeleteFile(tempFile)

webUrl = Replace(rawUrl, "git@github.com:", "https://github.com/")
webUrl = Replace(webUrl, ".git", "")
prUrl = webUrl & "/compare/develop..." & currentBranch & "?expand=1"

WshShell.Run prUrl

MsgBox "Alteracoes enviadas com sucesso!" & vbCrLf & "O navegador foi aberto para a criacao do Pull Request.", 64, "Sucesso"

' --- FUNCAO AUXILIAR PARA LER O TERMINAL INVISIVELMENTE ---
Function GetCmdOutput(cmd, tmpPath)
    Set sh = CreateObject("WScript.Shell")
    Set fs = CreateObject("Scripting.FileSystemObject")
    sh.Run "cmd /c " & cmd & " > """ & tmpPath & """", 0, True
    Set f = fs.OpenTextFile(tmpPath, 1, True)
    If Not f.AtEndOfStream Then
        txt = f.ReadAll()
        txt = Replace(txt, vbCr, "")
        txt = Replace(txt, vbLf, "")
        GetCmdOutput = Trim(txt)
    Else
        GetCmdOutput = ""
    End If
    f.Close
End Function