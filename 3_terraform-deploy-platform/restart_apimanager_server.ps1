terraform show |select-string public_ip |

Foreach-Object {
       $_|%{$_ -split('"')[1]}

  
    }


#ssh -i ..\keys\axwayv7-key.pem ubuntu@$followers 'sudo systemctl restart quickstart'



