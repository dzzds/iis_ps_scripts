echo "Conten-Type: text/html"
echo ""

$users = Get-WmiObject Win32_UserAccount

echo "------------------------------------------------"

foreach ($user in $users) {
    $user.Name
    net user $user.Name | Select-String "最終ログオン日時"
    net user $user.Name | Select-String "パスワード有効期間"
    echo "------------------------------------------------"
}
