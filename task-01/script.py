import subprocess
import json

try:
        
    repository_list_fetch = subprocess.getstatusoutput(f'gh api  -H "Accept: application/vnd.github+json"  /orgs/amfoss/repos')
    repository_list = json.loads(repository_list_fetch[1])

    amFOSS_repos = []
    for i in repository_list:
        amFOSS_repos.append(i['name'])

    print("\n")
    for repo in amFOSS_repos:
        stringS=f'gh api  --method PUT  -H "Accept: application/vnd.github+json"  /user/starred/amfoss/{repo}'
        print(f"Starring amfoss/{repo}")
        subprocess.getstatusoutput(stringS)

    userData = subprocess.getstatusoutput(f'gh api -H "Accept: application/vnd.github+json" /user')
    user=json.loads(userData[1])
    userName=user['name']
    userLogin=user['login']

    print(f'''

    Thank you {userName} (@{userLogin}) for starring all the amFOSS repositories.
     ____  _                  _               ____                   
    / ___|| |_ __ _ _ __ _ __(_)_ __   __ _  |  _ \  ___  _ __   ___ 
    \___ \| __/ _` | '__| '__| | '_ \ / _` | | | | |/ _ \| '_ \ / _ \\
     ___) | || (_| | |  | |  | | | | | (_| | | |_| | (_) | | | |  __/
    |____/ \__\__,_|_|  |_|  |_|_| |_|\__, | |____/ \___/|_| |_|\___|
                                       |___/                          



    ''')

except Exception as e:
    print("Unkown Error occured, please try again later")