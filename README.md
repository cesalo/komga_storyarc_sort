**Why this was created:**

- I use the Mylar StoryArc funcionality. Komga doesn't have a file-name ordering option so StoryArcs are not correctly sorted.
- This script will update the "number sort" property of the comicbook (just in Komga) which will fix the issue explained above.
- Once (if) Komga gets StoryArc metada directly this script may become irrelevant.
- I use hardlinks in Mylar so haven't tested this properly when symbolic links are used by Mylar.

**Pre-reqs:**

- Komga Server: https://github.com/gotson/komga
- This is a bash script so you will need some sort of linux flavor. I'm currently using Centos6.
- jq needs to be installed in the server: yum install jq or similar depending on your linux flavor.

**Instructions:**
- Create a directory and create a directoy named "logs" inside this directory.
- Copy both scripts to this directory and change permissions: chmod u+x <script name>.
- Update the first 3 lines of both scripts with the information of your environment:
  - username_pass="username:password"
  - komga_server="ip:port"
  - wrk_dir="work directory"
- Execute like this: ./update.storyarc.numbersort.by.series-id.sh <series id>
- You can find the series id from the url in Komga.

**Disclaimer:**
- Use it under your own responsability. I'm not responsabile for any issues that this causes in your comics or your Komga setup.
- I don't think this could cause any major issues but I have a very limited test case and can be 100% sure about it.
