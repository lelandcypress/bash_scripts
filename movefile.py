import subprocess
import datetime
logdate=datetime.now()


def move_the_file():
    f=open("demolog.txt","a")
    subprocess.run('~/move.sh', shell= True)
    f.writelines(["Move Date: ", logdate ])
    f.close()
    print("bash script complete")

move_the_file()


