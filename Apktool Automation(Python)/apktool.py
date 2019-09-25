import os
import time

# Directory of archive on machine
os.chdir("~Directory here~")
for subdir, dir, files in os.walk(os.getcwd()):
    for file in files:
        if file != ".DS_Store" and file != "description.txt":
            # Use to verify list of apk files are correct
            #print(os.path.join(subdir, file))
            for i in range(241):
                x = 'set' + str(i) + '\\apk'
                if x in os.path.join(subdir, file):
                    # Use to track progress in main folder
                    print(os.getcwd())
                    os.chdir(os.getcwd() + '\\' + x)
                    # Use to track progress in sub folder
                    print(os.getcwd())
                    cmd = 'apktool d ' + file
                    # Use to verify correct apk file
                    print(cmd)
                    # Actual execution of 'apktool'
                    fp = os.popen(cmd)
                    os.chdir("~Same Directory here~")
                    # Magic number adjust to allow tool time to build before moving to next apk file
                    # Argument is in seconds the data set has 240 sub folders and has to run the tool twice
                    # So any value is multiplied by 2 then by 240 for time estimate
                    time.sleep(15)